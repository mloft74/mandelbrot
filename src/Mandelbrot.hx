package;

import Hsv;
import kha.Color;
import kha.graphics1.Graphics;

class Mandelbrot {

    private final minX:Float;
    private final maxX:Float;
    private final minY:Float;
    private final maxY:Float;
    private final width:Int;
    private final height:Int;
    private final maxIterations:Int;
    private final colorGrid:Array<Array<Color>>;

    public function new(cx:Float, cy:Float, spanX:Float, spanY:Float, width:Int, height:Int, maxIterations:Int = 100) {
        final halfSpanX = spanX / 2;
        final halfSpanY = spanY / 2;
        this.minX = cx - halfSpanX;
        this.maxX = cx + halfSpanX;
        this.minY = cy - halfSpanY;
        this.maxY = cy + halfSpanY;
        this.width = width;
        this.height = height;
        this.maxIterations = maxIterations;
        colorGrid = createColorGrid();
    }

    public function update():Void {
    }

    public function render(graphics:Graphics):Void {
        for (i in 0...height) {
            for (j in 0... width) {
                final color = colorGrid[i][j];
                graphics.setPixel(j, i, color);
            }
        }
    }

    private function createColorGrid():Array<Array<Color>> {
        final rangeX = maxX - minX;
        final rangeY = maxY - minY;
        final incrementX = rangeX / width;
        final incrementY = rangeY / height;
        final grid:Array<Array<Color>> = new Array();
        for (i in 0...height) {
            grid.push(new Array());
            final offsetY = incrementY * i;
            final y = minY + offsetY;
            for (j in 0...width) {
                final offsetX = incrementX * j;
                final x = minX + offsetX;
                final iterations = mandelbrotForPoint(x, y);
                final hsv = hsvForIterations(iterations);
                final color = hsvToRgb(hsv);
                grid[i].push(color);
            }
        }
        grid.reverse();
        return grid;
    }

    // Z_{n+1} = Z_{n} * Z_{n} + C; Z_{0} = 0; C = x + y * i
    private function mandelbrotForPoint(x:Float, y:Float):Int {
        var c = new Complex(x, y);
        var z = new Complex(0, 0);
        for (i in 0...maxIterations) {
            if (diverges(z)) return i;
            z = z * z + c;
        }
        return maxIterations;
    }

    private static function diverges(z:Complex):Bool {
        final real = z.r;
        final imaginary = z.i;
        final magnitude = Math.sqrt(real * real + imaginary * imaginary);
        final limit = 16;
        return magnitude > limit;
    }

    private function hsvForIterations(iterations:Int):Hsv {
        if (iterations == maxIterations) return new Hsv(0, 0, 0);
        final maxAngle = Math.PI * 2;
        final divisions = 72;
        final theta = maxAngle / divisions;
        final angle = (theta * iterations) % maxAngle;
        return new Hsv(angle, 1, 1);
    }

    // https://en.wikipedia.org/wiki/HSL_and_HSV#HSV_to_RGB
    private static function hsvToRgb(hsv:Hsv):Color {
        final chroma = hsv.value * hsv.saturation;
        final hexAngle = Math.PI / 3;
        final projectedHue = hsv.hue / hexAngle;
        final secondColor = chroma * (1 - Math.abs((projectedHue % 2) - 1));

        var rgbArray:Array<Float> = [];
        if (projectedHue >= 0 && projectedHue <= 1) rgbArray = [chroma, secondColor, 0];
        else if (projectedHue > 1 && projectedHue <= 2) rgbArray = [secondColor, chroma, 0];
        else if (projectedHue > 2 && projectedHue <= 3) rgbArray = [0, chroma, secondColor];
        else if (projectedHue > 3 && projectedHue <= 4) rgbArray = [0, secondColor, chroma];
        else if (projectedHue > 4 && projectedHue <= 5) rgbArray = [secondColor, 0, chroma];
        else if (projectedHue > 5 && projectedHue <= 6) rgbArray = [chroma, 0, secondColor];

        final match = hsv.value - chroma;
        final r = rgbArray[0] + match;
        final g = rgbArray[1] + match;
        final b = rgbArray[2] + match;

        return Color.fromFloats(r, g, b);
    }

}
