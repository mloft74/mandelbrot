package;

import kha.graphics1.Graphics;
import kha.Color;

class Mandelbrot {

    private final minX:Float;
    private final maxX:Float;
    private final minY:Float;
    private final maxY:Float;
    private final width:Int;
    private final height:Int;
    private final maxIterations:Int;
    private final colorGrid:Array<Array<Color>>;

    public function new(minX:Float, maxX:Float, minY:Float, maxY:Float, width:Int, height:Int, maxIterations:Int = 100) {
        this.minX = minX;
        this.maxX = maxX;
        this.minY = minY;
        this.maxY = maxY;
        this.width = width;
        this.height = height;
        this.maxIterations = maxIterations;
        colorGrid = new Array();
    }

    public function update():Void {
    }

    public function render(graphics:Graphics):Void {
        if (colorGrid.length == 0) createColorGrid();
        for (i in 0...height) {
            for (j in 0... width) {
                final color = colorGrid[i][j];
                graphics.setPixel(j, i, color);
            }
        }
    }

    private function createColorGrid():Void {
        final rangeX = maxX - minX;
        final rangeY = maxY - minY;
        final incrementX = rangeX / width;
        final incrementY = rangeY / height;
        for (i in 0...height) {
            colorGrid.push(new Array());
            final offsetY = incrementY * i;
            final y = minY + offsetY;
            for (j in 0...width) {
                final offsetX = incrementX * j;
                final x = minX + offsetX;
                final iterations = mandelbrotForPoint(x, y);
                final brightness = brightnessForIterations(iterations);
                final color = Color.fromBytes(brightness, brightness, brightness);
                colorGrid[i].push(color);
            }
        }
        colorGrid.reverse();
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

    private function brightnessForIterations(iterations:Int):Int {
        final percent = iterations / maxIterations;
        final maxPercent = 1;
        final maxIterationsBrightness = 0;
        if (percent == maxPercent) return maxIterationsBrightness;
        final maxBrightness = 255;
        return Math.round(maxBrightness * percent);
    }

}
