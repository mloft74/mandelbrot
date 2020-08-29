package;

import kha.Window;
import kha.Framebuffer;

class Project {

    private final mandelbrot:Mandelbrot;

    public function new() {
        final window = Window.get(0);
        final width = window.width;
        final height = window.height;
        mandelbrot = new Mandelbrot(-2.5, 2.5, -2.5, 2.5, width, height);
    }

    public function update():Void {
    }

    public function render(frameBuffers:Array<Framebuffer>):Void {
        final frameBuffer = frameBuffers[0];
        final graphics = frameBuffer.g1;
        graphics.begin();
        mandelbrot.render(graphics);
        graphics.end();
    }

}
