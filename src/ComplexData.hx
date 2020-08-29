package;
/**
 * @author Makayden Lofthouse | a02200810
 */

/**
 * This is the underlying data type for the Complex abstract
 */
class ComplexData {

    public final r:Float;
    public final i:Float;

    inline public function new(real:Float, imaginary:Float) {
        r = real;
        i = imaginary;
    }

    public function toString() {
        return '${this.r} + ${this.i}i';
    }

}
