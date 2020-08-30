package;

import Mandelbrot;
import kha.Window;
import kha.graphics1.Graphics;
import kha.input.Mouse;

class ZoomViewport {

    private var cx:Float;
    private var cy:Float;
    private var spanX:Float;
    private var spanY:Float;
    private var mandelbrot:Mandelbrot;

    public function new() {
        cx = 0;
        cy = 0;
        spanX = 5;
        spanY = 5;
        mandelbrot = createMandelbrot();
        Mouse.get().notify(onMouseDown, null, null, null);
    }

    public function update():Void {
    }

    public function render(graphics:Graphics):Void {
        mandelbrot.render(graphics);
    }

    public function onMouseDown(button:Int, x:Int, y:Int):Void {
    }

    private function createMandelbrot():Mandelbrot {
        final window = Window.get(0);
        final width = window.width;
        final height = window.height;
        return new Mandelbrot(cx, cy, spanX, spanY, width, height);
    }

}
