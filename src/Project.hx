package;

import kha.graphics2.Graphics;
import kha.Assets;
import kha.Framebuffer;

class Project {

    public function new() {
    }

    public function update():Void {
    }

    public function render(frameBuffers:Array<Framebuffer>):Void {
        final graphics = frameBuffers[0].g2;
        graphics.begin();
        helloThorkell(graphics);
        graphics.end();
    }

    public function helloThorkell(graphics:Graphics):Void {
        final image = Assets.images.thorkell;
        final scaleValue = 600 / image.height;
        final newWidth = image.width * scaleValue;
        final newHeight = image.height * scaleValue;
        final freeSpace = 800 - newWidth;
        final startx = freeSpace / 2;
        graphics.drawScaledImage(image, startx, 0, newWidth , newHeight);
    }

}
