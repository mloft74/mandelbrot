package;

import ComplexData;

/**
 * @author Makayden Lofthouse | a02200810
 */

/**
 * This abstract overloads operators for the underlying
 * data type, making it much easier to use for math
 */
@:forward(r, i)
abstract Complex(ComplexData) {

    inline public function new(real:Float, imaginary:Float) {
        this = new ComplexData(real, imaginary);
    }

    @:from
    static inline public function fromArray(a:Array<Float>):Complex {
        return new Complex(a[0], a[1]);
    }

    @:to
    public inline function toArray():Array<Float> {
        return [this.r, this.i];
    }

    @:from
    static inline public function fromFloat(a:Float):Complex {
        return new Complex(a, 0);
    }

    @:to
    public inline function toFloat():Float {
        return this.r;
    }

    @:op(-A)
    static inline public function negate(rhs:Complex):Complex {
        return new Complex(-rhs.r, -rhs.i);
    }

    @:op(!A)
    static inline public function conjugate(rhs:Complex):Complex {
        return new Complex(rhs.r, -rhs.i);
    }

    @:op(A + B)
    static inline public function add(lhs:Complex, rhs:Complex):Complex {
        return new Complex(
            lhs.r + rhs.r,
            lhs.i + rhs.i
        );
    }

    @:op(A + B) @:commutative
    static inline public function fAdd(lhs:Complex, rhs:Float):Complex {
        return new Complex(
            lhs.r + rhs,
            lhs.i
        );
    }

    @:op(A - B)
    static inline public function sub(lhs:Complex, rhs:Complex):Complex {
        return new Complex(
            lhs.r - rhs.r,
            lhs.i - rhs.i
        );
    }

    @:op(A - B)
    static inline public function subF(lhs:Complex, rhs:Float):Complex {
        return new Complex(
            lhs.r - rhs,
            lhs.i
        );
    }

    @:op(A - B)
    static inline public function fSub(lhs:Float, rhs:Complex):Complex {
        return new Complex(
            lhs - rhs.r,
            - rhs.i
        );
    }

    @:op(A * B)
    static inline public function mult(lhs:Complex, rhs:Complex):Complex {
        final ac = lhs.r * rhs.r;
        final bd = lhs.i * rhs.i;
        return new Complex(
            ac - bd,
            (lhs.r + lhs.i) * (rhs.r + rhs.i) - ac - bd
        );
    }

    @:op(A * B) @:commutative
    static inline public function fMult(lhs:Complex, rhs:Float):Complex{
        return new Complex(
            lhs.r * rhs,
            lhs.i * rhs
        );
    }

    @:op(A / B)
    static inline public function fDiv(lhs:Complex, rhs:Float):Complex{
        return new Complex(
            lhs.r / rhs,
            lhs.i / rhs
        );
    }

}
