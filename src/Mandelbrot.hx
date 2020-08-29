package;

import kha.graphics1.Graphics;

class Mandelbrot {

    private final minX:Float;
    private final maxX:Float;
    private final minY:Float;
    private final maxY:Float;

    public function new(minX:Float, maxX:Float, minY:Float, maxY:Float, width:Float, height:Float) {
        this.minX = minX;
        this.maxX = maxX;
        this.minY = minY;
        this.maxY = maxY;
    }

    public function update():Void {
    }

    public function render(graphics:Graphics):Void {
    }

}
