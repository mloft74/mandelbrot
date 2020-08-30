package;

import Mandelbrot;
import kha.Window;
import kha.graphics1.Graphics;

typedef Vector = {
    final x:Float;
    final y:Float;
}

class ZoomViewport {

    private var cx:Float;
    private var cy:Float;
    private var span:Float;
    private var mandelbrot:Mandelbrot;

    public function new() {
        cx = 0;
        cy = 0;
        span = 5;
        mandelbrot = createMandelbrot();
    }

    public function update():Void {
    }

    public function render(graphics:Graphics):Void {
        mandelbrot.render(graphics);
    }

    public function onMouseDown(button:Int, x:Int, y:Int):Void {
        if (button == 0) translate(x, y);
        mandelbrot = createMandelbrot();
    }

    private function translate(x:Int, y:Int):Void {
        final vector = getScaledVector(x, y);
        final halfSpan = span / 2;
        final translateX = vector.x * halfSpan;
        final translateY = vector.y * halfSpan;
        cx += translateX;
        cy -= translateY;
    }

    private static function getScaledVector(x:Int, y:Int):Vector {
        final window = Window.get(0);
        final width = window.width;
        final height = window.height;
        final windowCenterX = width / 2;
        final windowCenterY = height / 2;
        final translatedX = x - windowCenterX;
        final translatedY = y - windowCenterY;
        final moveFactor = 1 / 100;
        final scaledX = translatedX / width;
        final scaledY = translatedY / height;
        return {x: scaledX, y: scaledY};
    }

    private function createMandelbrot():Mandelbrot {
        final window = Window.get(0);
        final width = window.width;
        final height = window.height;
        return new Mandelbrot(cx, cy, span, span, width, height);
    }

}
