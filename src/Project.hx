package;

import ZoomViewport;
import kha.Framebuffer;
import kha.input.Mouse;

class Project {

    private final zoomViewport:ZoomViewport;

    public function new() {
        zoomViewport = new ZoomViewport();
        Mouse.get().notify(zoomViewport.onMouseDown, null, null, zoomViewport.onMouseWheel);
    }

    public function update():Void {
    }

    public function render(frameBuffers:Array<Framebuffer>):Void {
        final frameBuffer = frameBuffers[0];
        final graphics = frameBuffer.g1;
        graphics.begin();
        zoomViewport.render(graphics);
        graphics.end();
    }

}
