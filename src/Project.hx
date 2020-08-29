package;

import kha.Framebuffer;

class Project {

    private var isRendered:Bool;

    public function new() {
        isRendered = false;
    }

    public function update():Void {
    }

    public function render(frameBuffers:Array<Framebuffer>):Void {
        if (isRendered) return;
        final frameBuffer = frameBuffers[0];
        final graphics = frameBuffer.g1;
        graphics.begin();
        graphics.end();
        isRendered = true;
    }

}
