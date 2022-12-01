
//#################################################################
//
//   32-bit (IEEE 754 standard) floating point numbers
//   (real) for Daedalus:
//       Initial script dated 11/26/2008:
// http://forum.worldofplayers.de/forum/threads/500080-Instrumentarium-Floats
//
//   This version retains the original interface but uses
//   modern instructions for floating point numbers.
//   So this version is faster and more accurate.
//
//   Requires Ikarus.
//
//   Completed on 4/6/2012:
//     - switch to Ikarus
//     - added castFromIntf and castToIntf
//
//   Translation into Russian: NastasSanna /*NS*/
//
//#################################################################


/*####################################
// Brief information
//####################################
//*********************
// Fundamentally
//*********************
The functions in this scenario can operate on floating point (real) numbers. The usual 32-bit integers int (integer) serve as a container for real numbers.
Behind the scenes, there is no syntactic difference between integers and real numbers, so the real representation is quite limited by the Gothic parser.
Therefore, it is necessary to clearly understand what is meant, since formally integers and real numbers are represented by the same data type. If a real number is treated as an integer, or an integer value is passed to a function for real numbers, or vice versa, it will be just nonsense at best.
//************************************
// Toolkit
//************************************
To work with real numbers, they must first be generated. Here there are functions mkf and fracf, the first of which receives the corresponding real number from an integer, and the second gives the result of dividing two integers.
Real numbers can be added, subtracted, multiplied and divided among themselves. A square root function has also been added.
For comparison operations, you must use the functions ge, g, l, le (instead of the >=, >, <, <= operators).
Real numbers can then be converted back to integers using truncf and roundf.
//************************************
// Overview of functions
//************************************
the wording "func float" and "var float", as stated, is invalid (for Gothic, all numbers are integers). This notation is used for illustrative purposes only.
To remember the functions, the following list with decoding of abbreviations may come in handy:
mkf    = make float
truncf = truncate float
roundf = round float
addf   = add floats
subf   = subtract floats
negf   = negate float
mulf   = multiply floats
divf   = divide floats
invf   = inverse float
gf     = greater
gef    = greater or equal
lf     = lower
lef    = lower or equal
sqrtf  = square root of float
printf = print float
*************** Conversion ******************
func float mkf (var int x) //Creates a real number from an integer.
func int truncf (var float x) //truncates a real value to an integer, discarding the fractional part. Returns an integer. (for -1.5 we get -1.0, not -2)
func int roundf (var float x) //converts a real number to an integer, rounding it up. Returns an integer.
**************** Addition ************************
func float addf (var float x, var float y) //adds x and y and returns the result.
func float subf (var float x, var float y) //subtracts y from x and returns the result.
func float negf (var float x) //Returns the negative of x (i.e. -x).
***************** Multiplication *************************
func float mulf (var float x, var float y) //multiplies x by y and returns the result
func float divf (var float x, var float y) //divides x by y and returns the result.
func float invf (var float x) //Returns the inverse of x, i.e. 1/x. If x = 0, an error occurs.
func float fracf (var int p, var int q) //Returns the result of dividing p/q as a real number. Equivalent to divf(mkf(p), mkf(q))
**************** Comparison operations ****************
func int gf (var float x, var float y) //if x > y returns TRUE, otherwise FALSE
func int gef (var float x, var float y) //if fur x >= y returns TRUE, otherwise FALSE
func int lef (var float x, var float y) //if fur x <= y returns TRUE, otherwise FALSE
func int lf (var float x, var float y) //if fur x < y returns TRUE, otherwise FALSE
**************** Miscellaneous **************************
func float sqrf (var float x) //returns the square of x
func float sqrtf (var float x) //returns the square root of x
func string toStringf(var float x) //Gives a string representation of the number x, eg. "12.345"
**************** Casts ************************
Daedalus has its own very limited "var float".
To convert floats in the format of this script in Floats to Daedalus format, and vice versa, there are two functions.
func float castFromIntf(var int f) //Converts float in this script's format to Daedalus format
func int castToIntf (var float f) //Converts a Daedalus-formatted float to this script's format
Both functions end up doing nothing. They "trick" the parser by simply changing the data type.
In both cases, the parameters and return values ​​of both functions are actually of type float.
//************************************
// Other
//************************************
There are 5 constants defined that can be used without calculating/converting integers:
FLOATNULL = 0
FLOATEINS = 1
FLOATHALB = 0.5
PI = 3.1415...
E = 2.7182...
//************************************
// Examples
//************************************
The following function calculates the volume of a cylinder in cc and returns the rounded value.
Parameters are passed as integers.
func int CylinderVolume (var int radius, var int height) {
    var int radiusf, var int heightf;
    radiusf = mkf(radius);
    heightf = mkf (height);
    //V = r * PI * h
    var int resultf;
    resultf = mulf (radiusf, radiusf);
    resultf = mulf (resultf, PI);
    resultf = mulf (resultf, h);
    return roundf (resultf);
};
The following function calculates a value and prints it to the screen. Multiple nested functions
func void reply () {
    var int foo;
    foo = mulf (mkf (1337), PI);
    printf (divf (foo, mkf (100)));
    //(1337*PI)/100 equals 42 with surprising accuracy. ;-)
	//NS: Alas, alas, only in single format. With more accurate calculations, the difference is already in 3 decimal places
};
The following function performs several comparisons. In no case is "ERROR" returned.
func void floattest()
{
    var int half; var int one; var int two; //NS: 0.5, 1, 2
    var int null;	//NS: 0
    be int minuseins; where int minuszwei; //NS: -1, -2
    half = invf(mkf(2));
    same = mkf (1);
    two = mkf(2);
    null = mkf (0);
    minuseins = mkf (-1);
    minuszwei = mkf (-2);
    if (gf (zwei,eins))           {} else { print ("ERROR!"); };
    if (gf (eins,null))           {} else { print ("ERROR!"); };
    if (lf (minuseins,null))      {} else { print ("ERROR!"); };
    if (lf (minuszwei,minuseins)) {} else { print ("ERROR!"); };
    if (gf (halb,minuseins))      {} else { print ("ERROR!"); };
    if (lf (halb,zwei))           {} else { print ("ERROR!"); };
    if (lef (null,null))          {} else { print ("ERROR!"); };
    if (gef (null,null))          {} else { print ("ERROR!"); };
};
//************************************
// Restrictions and pitfalls
//************************************
*********** User error ****************
Under no circumstances should you use the +, -, *, or / operators on real numbers. Here they are useless. At best, it will just be nonsense. Use addf, subf, mulf and divf as above.
If you know the internal representation of real numbers, for example, only for positive real numbers, you can use the comparison operators (>, <, <= >=). If you're unsure, it's best to use the provided functions.
Of course, real functions are not suitable for integers. The sqrtf(4) notation is not 2, it's just wrong, because that would be 81 as an integer! To take the square root of 4, you need to do this: roundf(sqrtf(mkf(4))). Then it will be 2.
*********** Representation error ***********
The accuracy of the representation of real numbers is very limited, therefore, starting from 4 decimal places, a rounding error may occur. This applies to very large or very small numbers.
There are the usual guidelines and restrictions for real numbers. For example, it is often necessary to test real numbers for equality, but due to rounding errors, it turns out that two numbers that should actually be equal to each other are slightly different. In this case, it is better to check whether the difference between these two numbers will be less than some small value (relative to the problem being solved).
*/

//#################################################################
//
//   FUNCTIONS
//
//#################################################################

const int FLOAT_SIGN_MASK = 1 << 31;

const int FLOATNULL = 0;
const int FLOATEINS = 1065353216; //vz 0, exp 0 (also char 127), mt 1.0
const  int  FLOATONE   = FLOATEINS ;  // same
const int FLOATHALB = 1056964608; //vz 0, exp -1 (also char 126), mt 1.0
const int FLOATHALF = FLOATHALB;  //то же

const  int  PI = 1078530011 ;
const  int E =   1076754516 ;

/* The following arrays contain the assembler code. */
const  int FLTINT_trunc_code[ 9 ] = { - 2082109099 , 2111375596 , 1166763774 , 1712108798 , - 637778551 , 1842939973 , - 128066564 , - 1946260007 1946260007 , - 3838010 };
const int FLTINT_mul_code  [3] = { -639268523, 1306004549, 12830984 };
const int FLTINT_div_code  [3] = { -639268523, 2111310917, 12830984 };
const int FLTINT_add_code  [3] = { -639268523, 1171786821, 12830984 };
const int FLTINT_mk_code   [2] = { -605714091, -1010235323 };

/* Helper function: */
func int _FLT_Build_Func(var int codePtr, var int param1Ptr, var int param2Ptr, var int retValIsFloat, var int resultPtr) {
    CALL_Open();
    if (param2Ptr) {
        CALL_IntParam(param2Ptr);
    };
    if (param1Ptr) {
        CALL_IntParam(param1Ptr);
    };
    if (retValIsFloat) {
        CALL_RetValIsFloat();
    };
    CALL_PutRetValTo(resultPtr);
    CALL__cdecl(codePtr);
    return CALL_Close();
};

//************************************
//       Packer:
//************************************

func int mkf (var int x) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_mk_code), _@(x), 0, 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int truncf (var int x) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_trunc_code), _@(x), 0, 0, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int addf (var int x, var int y) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_add_code), _@(x), _@(y), 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int mulf (var int x, var int y) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_mul_code), _@(x), _@(y), 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

func int divf (var int x, var int y) {
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(_@(FLTINT_div_code), _@(x), _@(y), 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

//************************************
//   Squaring and rooting
//************************************

func int sqrf(var int f) {
    return mulf(f,f);
};

func int sqrtf(var int f) {
    const int sqrtf_G1 = 7757593; //0x765F19
    const int sqrtf_G2 = 8123917; //0x7BF60D
    
    const int code = 0;
    if (!code) {
        code = _FLT_Build_Func(MEMINT_SwitchG1G2(sqrtf_G1, sqrtf_G2),
                               _@(f), 0, 1, _@(result));
    };
    ASM_Run(code);
    var int result;
    return +result;
};

//************************************
//   Can be implemented 5
//   small helper functions:
//************************************

func int negf (var int x) {
    if (x < 0) { return x & (~FLOAT_SIGN_MASK); }
    else       { return x |   FLOAT_SIGN_MASK ; };
};

func int absf (var int x) {
    return x & (~FLOAT_SIGN_MASK);
};

func int subf (var int x, var int y) {
    return addf(x, negf(y));
};

func int roundf (var int x) {
    if (x < 0) {
        return truncf(subf(x, FLOATHALB));
    } else {
        return truncf(addf(x, FLOATHALB));
    };
};

func int invf (var int x) {
    return divf(FLOATEINS, x);
};

/* thanks to orcwarriorPL for the idea! */
func int fracf (var int p, var int q) {
    if (!q) {
        MEM_Error("fracf: Denominator is 0.");
    };
    return  divf (mkf(p), mkf(q));
};

 /* depreciated */
func int sqrtf_approx(var int f) { return sqrtf(f); };

//************************************
//   Comparison operations
//************************************

func int gf (var int x, var int y) {
    var int isnegX; isnegX = x & FLOAT_SIGN_MASK;
    var int isnegY; isnegY = y & FLOAT_SIGN_MASK;

    if (isNegX && isNegY) { // both are negative
        if (x < y) {
            return TRUE;
        };
    }
    else {
        if (x > y) {
            return TRUE;
        };
    };

    return  FALSE ;
};

func int gef (var int x, var int y) {
    if (x == y) { return true; };
    return gf (x,y);
};

func int lef (var int x, var int y) {
    return !gf(x,y);
};

func int lf (var int x, var int y) {
    return !gef (x,y);
};

//*****************************************
//   Output functions, thanks Gottfried!
//*****************************************

func float castFromIntf(var int   f) { f; };
func int   castToIntf  (var float f) { return MEM_ReadInt(_@f(f)); };

func string toStringf(var int x) {
    var float f; f = castFromIntf(x);
    return FloatToString(f);
};

/* Bad name. Saved for compatibility. */
func void printf(var int x) {
    Print(toStringf(x));
};

