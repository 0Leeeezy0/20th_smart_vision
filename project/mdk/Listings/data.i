# 1 "../user/src/data.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 387 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../user/src/data.c" 2
# 1 "../user/inc\\common.h" 1
# 64 "../user/inc\\common.h"
# 1 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 1 3
# 157 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((__pcs__("aapcs"))) unsigned __ARM_dcmp4(double , double );
extern __attribute__((__pcs__("aapcs"))) unsigned __ARM_fcmp4(float , float );







extern __attribute__((__nothrow__)) __attribute__((__pcs__("aapcs"))) int __ARM_fpclassifyf(float );
extern __attribute__((__nothrow__)) __attribute__((__pcs__("aapcs"))) int __ARM_fpclassify(double );



static __inline __attribute__((__nothrow__)) __attribute__((__pcs__("aapcs"))) int __ARM_isfinitef(float __x)
{
    return (((*(unsigned *)&(__x)) >> 23) & 0xff) != 0xff;
}
static __inline __attribute__((__nothrow__)) __attribute__((__pcs__("aapcs"))) int __ARM_isfinite(double __x)
{
    return (((*(1 + (unsigned *)&(__x))) >> 20) & 0x7ff) != 0x7ff;
}



static __inline __attribute__((__nothrow__)) __attribute__((__pcs__("aapcs"))) int __ARM_isinff(float __x)
{
    return ((*(unsigned *)&(__x)) << 1) == 0xff000000;
}
static __inline __attribute__((__nothrow__)) __attribute__((__pcs__("aapcs"))) int __ARM_isinf(double __x)
{
    return (((*(1 + (unsigned *)&(__x))) << 1) == 0xffe00000) && ((*(unsigned *)&(__x)) == 0);
}



static __inline __attribute__((__nothrow__)) __attribute__((__pcs__("aapcs"))) int __ARM_islessgreaterf(float __x, float __y)
{
    unsigned __f = __ARM_fcmp4(__x, __y) >> 28;
    return (__f == 8) || (__f == 2);
}
static __inline __attribute__((__nothrow__)) __attribute__((__pcs__("aapcs"))) int __ARM_islessgreater(double __x, double __y)
{
    unsigned __f = __ARM_dcmp4(__x, __y) >> 28;
    return (__f == 8) || (__f == 2);
}





static __inline __attribute__((__nothrow__)) __attribute__((__pcs__("aapcs"))) int __ARM_isnanf(float __x)
{
    return (0x7f800000 - ((*(unsigned *)&(__x)) & 0x7fffffff)) >> 31;
}
static __inline __attribute__((__nothrow__)) __attribute__((__pcs__("aapcs"))) int __ARM_isnan(double __x)
{
    unsigned __xf = (*(1 + (unsigned *)&(__x))) | (((*(unsigned *)&(__x)) == 0) ? 0 : 1);
    return (0x7ff00000 - (__xf & 0x7fffffff)) >> 31;
}



static __inline __attribute__((__nothrow__)) __attribute__((__pcs__("aapcs"))) int __ARM_isnormalf(float __x)
{
    unsigned __xe = ((*(unsigned *)&(__x)) >> 23) & 0xff;
    return (__xe != 0xff) && (__xe != 0);
}
static __inline __attribute__((__nothrow__)) __attribute__((__pcs__("aapcs"))) int __ARM_isnormal(double __x)
{
    unsigned __xe = ((*(1 + (unsigned *)&(__x))) >> 20) & 0x7ff;
    return (__xe != 0x7ff) && (__xe != 0);
}



static __inline __attribute__((__nothrow__)) __attribute__((__pcs__("aapcs"))) int __ARM_signbitf(float __x)
{
    return (*(unsigned *)&(__x)) >> 31;
}
static __inline __attribute__((__nothrow__)) __attribute__((__pcs__("aapcs"))) int __ARM_signbit(double __x)
{
    return (*(1 + (unsigned *)&(__x))) >> 31;
}
# 266 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
  typedef float float_t;
  typedef double double_t;
# 282 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern const int math_errhandling;







extern __attribute__((__nothrow__)) double acos(double );



extern __attribute__((__nothrow__)) double asin(double );





extern __attribute__((__nothrow__)) __attribute__((__const__)) double atan(double );



extern __attribute__((__nothrow__)) double atan2(double , double );





extern __attribute__((__nothrow__)) double cos(double );




extern __attribute__((__nothrow__)) double sin(double );





extern void __use_accurate_range_reduction(void);



extern __attribute__((__nothrow__)) double tan(double );





extern __attribute__((__nothrow__)) double cosh(double );




extern __attribute__((__nothrow__)) double sinh(double );






extern __attribute__((__nothrow__)) __attribute__((__const__)) double tanh(double );



extern __attribute__((__nothrow__)) double exp(double );






extern __attribute__((__nothrow__)) double frexp(double , int * ) __attribute__((__nonnull__(2)));







extern __attribute__((__nothrow__)) double ldexp(double , int );




extern __attribute__((__nothrow__)) double log(double );





extern __attribute__((__nothrow__)) double log10(double );



extern __attribute__((__nothrow__)) double modf(double , double * ) __attribute__((__nonnull__(2)));





extern __attribute__((__nothrow__)) double pow(double , double );






extern __attribute__((__nothrow__)) double sqrt(double );






    __attribute__((__always_inline__)) static double __sqrt(double d) {
      __asm__ __volatile__(



      "vsqrt.f64 %0, %0"

      : "+w"(d));
      return d;
    }

    static __inline double _sqrt(double __x) { return __sqrt(__x); }





    __attribute__((__always_inline__)) static float __sqrtf(float f) {
      __asm__ __volatile__(



      "vsqrt.f32 %0, %0"

      : "+w"(f));
      return f;
    }

    static __inline float _sqrtf(float __x) { return __sqrtf(__x); }
# 435 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) double ceil(double );


extern __attribute__((__nothrow__)) __attribute__((__const__)) double fabs(double );



extern __attribute__((__nothrow__)) __attribute__((__const__)) double floor(double );



extern __attribute__((__nothrow__)) double fmod(double , double );
# 467 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((__nothrow__)) double acosh(double );



extern __attribute__((__nothrow__)) double asinh(double );



extern __attribute__((__nothrow__)) double atanh(double );



extern __attribute__((__nothrow__)) double cbrt(double );



static __inline __attribute__((__nothrow__)) __attribute__((__const__)) double copysign(double __x, double __y)



{
    (*(1 + (unsigned *)&(__x))) = ((*(1 + (unsigned *)&(__x))) & 0x7fffffff) | ((*(1 + (unsigned *)&(__y))) & 0x80000000);
    return __x;
}
static __inline __attribute__((__nothrow__)) __attribute__((__const__)) float copysignf(float __x, float __y)



{
    (*(unsigned *)&(__x)) = ((*(unsigned *)&(__x)) & 0x7fffffff) | ((*(unsigned *)&(__y)) & 0x80000000);
    return __x;
}
extern __attribute__((__nothrow__)) double erf(double );



extern __attribute__((__nothrow__)) double erfc(double );



extern __attribute__((__nothrow__)) double expm1(double );
# 533 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((__nothrow__)) double hypot(double , double );






extern __attribute__((__nothrow__)) int ilogb(double );



extern __attribute__((__nothrow__)) int ilogbf(float );



extern __attribute__((__nothrow__)) int ilogbl(long double );
# 646 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((__nothrow__)) double lgamma (double );




extern __attribute__((__nothrow__)) double log1p(double );



extern __attribute__((__nothrow__)) double logb(double );



extern __attribute__((__nothrow__)) float logbf(float );



extern __attribute__((__nothrow__)) long double logbl(long double );



extern __attribute__((__nothrow__)) double nextafter(double , double );




extern __attribute__((__nothrow__)) float nextafterf(float , float );




extern __attribute__((__nothrow__)) long double nextafterl(long double , long double );




extern __attribute__((__nothrow__)) double nexttoward(double , long double );




extern __attribute__((__nothrow__)) float nexttowardf(float , long double );




extern __attribute__((__nothrow__)) long double nexttowardl(long double , long double );




extern __attribute__((__nothrow__)) double remainder(double , double );



extern __attribute__((__nothrow__)) __attribute__((__const__)) double rint(double );



extern __attribute__((__nothrow__)) double scalbln(double , long int );



extern __attribute__((__nothrow__)) float scalblnf(float , long int );



extern __attribute__((__nothrow__)) long double scalblnl(long double , long int );



extern __attribute__((__nothrow__)) double scalbn(double , int );



extern __attribute__((__nothrow__)) float scalbnf(float , int );



extern __attribute__((__nothrow__)) long double scalbnl(long double , int );
# 740 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) float fabsf(float);
static __inline __attribute__((__nothrow__)) __attribute__((__const__)) float _fabsf(float __f) { return fabsf(__f); }
extern __attribute__((__nothrow__)) float sinf(float );
extern __attribute__((__nothrow__)) float cosf(float );
extern __attribute__((__nothrow__)) float tanf(float );
extern __attribute__((__nothrow__)) float acosf(float );
extern __attribute__((__nothrow__)) float asinf(float );
extern __attribute__((__nothrow__)) float atanf(float );
extern __attribute__((__nothrow__)) float atan2f(float , float );
extern __attribute__((__nothrow__)) float sinhf(float );
extern __attribute__((__nothrow__)) float coshf(float );
extern __attribute__((__nothrow__)) float tanhf(float );
extern __attribute__((__nothrow__)) float expf(float );
extern __attribute__((__nothrow__)) float logf(float );
extern __attribute__((__nothrow__)) float log10f(float );
extern __attribute__((__nothrow__)) float powf(float , float );
extern __attribute__((__nothrow__)) float sqrtf(float );
extern __attribute__((__nothrow__)) float ldexpf(float , int );
extern __attribute__((__nothrow__)) float frexpf(float , int * ) __attribute__((__nonnull__(2)));
extern __attribute__((__nothrow__)) __attribute__((__const__)) float ceilf(float );
extern __attribute__((__nothrow__)) __attribute__((__const__)) float floorf(float );
extern __attribute__((__nothrow__)) float fmodf(float , float );
extern __attribute__((__nothrow__)) float modff(float , float * ) __attribute__((__nonnull__(2)));
# 780 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
__attribute__((__nothrow__)) long double acosl(long double );
__attribute__((__nothrow__)) long double asinl(long double );
__attribute__((__nothrow__)) long double atanl(long double );
__attribute__((__nothrow__)) long double atan2l(long double , long double );
__attribute__((__nothrow__)) long double ceill(long double );
__attribute__((__nothrow__)) long double cosl(long double );
__attribute__((__nothrow__)) long double coshl(long double );
__attribute__((__nothrow__)) long double expl(long double );
__attribute__((__nothrow__)) long double fabsl(long double );
__attribute__((__nothrow__)) long double floorl(long double );
__attribute__((__nothrow__)) long double fmodl(long double , long double );
__attribute__((__nothrow__)) long double frexpl(long double , int* ) __attribute__((__nonnull__(2)));
__attribute__((__nothrow__)) long double ldexpl(long double , int );
__attribute__((__nothrow__)) long double logl(long double );
__attribute__((__nothrow__)) long double log10l(long double );
__attribute__((__nothrow__)) long double modfl(long double , long double * ) __attribute__((__nonnull__(2)));
__attribute__((__nothrow__)) long double powl(long double , long double );
__attribute__((__nothrow__)) long double sinl(long double );
__attribute__((__nothrow__)) long double sinhl(long double );
__attribute__((__nothrow__)) long double sqrtl(long double );
__attribute__((__nothrow__)) long double tanl(long double );
__attribute__((__nothrow__)) long double tanhl(long double );






extern __attribute__((__nothrow__)) float acoshf(float );
__attribute__((__nothrow__)) long double acoshl(long double );
extern __attribute__((__nothrow__)) float asinhf(float );
__attribute__((__nothrow__)) long double asinhl(long double );
extern __attribute__((__nothrow__)) float atanhf(float );
__attribute__((__nothrow__)) long double atanhl(long double );
__attribute__((__nothrow__)) long double copysignl(long double , long double );
extern __attribute__((__nothrow__)) float cbrtf(float );
__attribute__((__nothrow__)) long double cbrtl(long double );
extern __attribute__((__nothrow__)) float erff(float );
__attribute__((__nothrow__)) long double erfl(long double );
extern __attribute__((__nothrow__)) float erfcf(float );
__attribute__((__nothrow__)) long double erfcl(long double );
extern __attribute__((__nothrow__)) float expm1f(float );
__attribute__((__nothrow__)) long double expm1l(long double );
extern __attribute__((__nothrow__)) float log1pf(float );
__attribute__((__nothrow__)) long double log1pl(long double );
extern __attribute__((__nothrow__)) float hypotf(float , float );
__attribute__((__nothrow__)) long double hypotl(long double , long double );
extern __attribute__((__nothrow__)) float lgammaf(float );
__attribute__((__nothrow__)) long double lgammal(long double );
extern __attribute__((__nothrow__)) float remainderf(float , float );
__attribute__((__nothrow__)) long double remainderl(long double , long double );
extern __attribute__((__nothrow__)) float rintf(float );
__attribute__((__nothrow__)) long double rintl(long double );







extern __attribute__((__nothrow__)) double exp2(double );
extern __attribute__((__nothrow__)) float exp2f(float );
__attribute__((__nothrow__)) long double exp2l(long double );
extern __attribute__((__nothrow__)) double fdim(double , double );
extern __attribute__((__nothrow__)) float fdimf(float , float );
__attribute__((__nothrow__)) long double fdiml(long double , long double );
# 855 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((__nothrow__)) double fma(double , double , double );
extern __attribute__((__nothrow__)) float fmaf(float , float , float );

static __inline __attribute__((__nothrow__)) long double fmal(long double __x, long double __y, long double __z) { return (long double)fma((double)__x, (double)__y, (double)__z); }


extern __attribute__((__nothrow__)) __attribute__((__const__)) double fmax(double , double );
extern __attribute__((__nothrow__)) __attribute__((__const__)) float fmaxf(float , float );
__attribute__((__nothrow__)) long double fmaxl(long double , long double );
extern __attribute__((__nothrow__)) __attribute__((__const__)) double fmin(double , double );
extern __attribute__((__nothrow__)) __attribute__((__const__)) float fminf(float , float );
__attribute__((__nothrow__)) long double fminl(long double , long double );
extern __attribute__((__nothrow__)) double log2(double );
extern __attribute__((__nothrow__)) float log2f(float );
__attribute__((__nothrow__)) long double log2l(long double );
extern __attribute__((__nothrow__)) long lrint(double );
extern __attribute__((__nothrow__)) long lrintf(float );

static __inline __attribute__((__nothrow__)) long lrintl(long double __x) { return lrint((double)__x); }


extern __attribute__((__nothrow__)) long long llrint(double );
extern __attribute__((__nothrow__)) long long llrintf(float );

static __inline __attribute__((__nothrow__)) long long llrintl(long double __x) { return llrint((double)__x); }


extern __attribute__((__nothrow__)) long lround(double );
extern __attribute__((__nothrow__)) long lroundf(float );

static __inline __attribute__((__nothrow__)) long lroundl(long double __x) { return lround((double)__x); }


extern __attribute__((__nothrow__)) long long llround(double );
extern __attribute__((__nothrow__)) long long llroundf(float );

static __inline __attribute__((__nothrow__)) long long llroundl(long double __x) { return llround((double)__x); }


extern __attribute__((__nothrow__)) __attribute__((__const__)) double nan(const char * );
extern __attribute__((__nothrow__)) __attribute__((__const__)) float nanf(const char * );

static __inline __attribute__((__nothrow__)) __attribute__((__const__)) long double nanl(const char *__t) { return (long double)nan(__t); }
# 908 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\math.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) double nearbyint(double );
extern __attribute__((__nothrow__)) __attribute__((__const__)) float nearbyintf(float );
__attribute__((__nothrow__)) long double nearbyintl(long double );
extern __attribute__((__nothrow__)) double remquo(double , double , int * );
extern __attribute__((__nothrow__)) float remquof(float , float , int * );

static __inline long double remquol(long double __x, long double __y, int *__q) { return (long double)remquo((double)__x, (double)__y, __q); }


extern __attribute__((__nothrow__)) __attribute__((__const__)) double round(double );
extern __attribute__((__nothrow__)) __attribute__((__const__)) float roundf(float );
__attribute__((__nothrow__)) long double roundl(long double );
extern __attribute__((__nothrow__)) double tgamma(double );
extern __attribute__((__nothrow__)) float tgammaf(float );
__attribute__((__nothrow__)) long double tgammal(long double );
extern __attribute__((__nothrow__)) __attribute__((__const__)) double trunc(double );
extern __attribute__((__nothrow__)) __attribute__((__const__)) float truncf(float );
__attribute__((__nothrow__)) long double truncl(long double );
# 65 "../user/inc\\common.h" 2


# 1 "../../libraries/zf_common\\zf_common_headfile.h" 1
# 39 "../../libraries/zf_common\\zf_common_headfile.h"
# 1 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 1 3
# 53 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    typedef unsigned int size_t;
# 68 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    typedef __builtin_va_list __va_list;
# 87 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
typedef struct __fpos_t_struct {
    unsigned long long int __pos;





    struct {
        unsigned int __state1, __state2;
    } __mbstate;
} fpos_t;
# 108 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
typedef struct __FILE FILE;
# 119 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
struct __FILE {
    union {
        long __FILE_alignment;



        char __FILE_size[84];

    } __FILE_opaque;
};
# 138 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern FILE __stdin, __stdout, __stderr;
extern FILE *__aeabi_stdin, *__aeabi_stdout, *__aeabi_stderr;
# 224 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int remove(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int rename(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 243 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) FILE *tmpfile(void);






extern __attribute__((__nothrow__)) char *tmpnam(char * );
# 265 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fclose(FILE * ) __attribute__((__nonnull__(1)));
# 275 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fflush(FILE * );
# 285 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) FILE *fopen(const char * __restrict ,
                           const char * __restrict ) __attribute__((__nonnull__(1,2)));
# 329 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) FILE *freopen(const char * __restrict ,
                    const char * __restrict ,
                    FILE * __restrict ) __attribute__((__nonnull__(2,3)));
# 342 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) void setbuf(FILE * __restrict ,
                    char * __restrict ) __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) int setvbuf(FILE * __restrict ,
                   char * __restrict ,
                   int , size_t ) __attribute__((__nonnull__(1)));
# 370 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int fprintf(FILE * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 393 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int _fprintf(FILE * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));





#pragma __printf_args
extern __attribute__((__nothrow__)) int printf(const char * __restrict , ...) __attribute__((__nonnull__(1)));






#pragma __printf_args
extern __attribute__((__nothrow__)) int _printf(const char * __restrict , ...) __attribute__((__nonnull__(1)));





#pragma __printf_args
extern __attribute__((__nothrow__)) int sprintf(char * __restrict , const char * __restrict , ...) __attribute__((__nonnull__(1,2)));








#pragma __printf_args
extern __attribute__((__nothrow__)) int _sprintf(char * __restrict , const char * __restrict , ...) __attribute__((__nonnull__(1,2)));






#pragma __printf_args
extern __attribute__((__nothrow__)) int __ARM_snprintf(char * __restrict , size_t ,
                     const char * __restrict , ...) __attribute__((__nonnull__(3)));


#pragma __printf_args
extern __attribute__((__nothrow__)) int snprintf(char * __restrict , size_t ,
                     const char * __restrict , ...) __attribute__((__nonnull__(3)));
# 460 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int _snprintf(char * __restrict , size_t ,
                      const char * __restrict , ...) __attribute__((__nonnull__(3)));





#pragma __scanf_args
extern __attribute__((__nothrow__)) int fscanf(FILE * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 503 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __scanf_args
extern __attribute__((__nothrow__)) int _fscanf(FILE * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));





#pragma __scanf_args
extern __attribute__((__nothrow__)) int scanf(const char * __restrict , ...) __attribute__((__nonnull__(1)));








#pragma __scanf_args
extern __attribute__((__nothrow__)) int _scanf(const char * __restrict , ...) __attribute__((__nonnull__(1)));





#pragma __scanf_args
extern __attribute__((__nothrow__)) int sscanf(const char * __restrict ,
                    const char * __restrict , ...) __attribute__((__nonnull__(1,2)));
# 541 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __scanf_args
extern __attribute__((__nothrow__)) int _sscanf(const char * __restrict ,
                     const char * __restrict , ...) __attribute__((__nonnull__(1,2)));







extern __attribute__((__nothrow__)) int vfscanf(FILE * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) int vscanf(const char * __restrict , __va_list) __attribute__((__nonnull__(1)));
extern __attribute__((__nothrow__)) int vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));

extern __attribute__((__nothrow__)) int _vfscanf(FILE * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) int _vscanf(const char * __restrict , __va_list) __attribute__((__nonnull__(1)));
extern __attribute__((__nothrow__)) int _vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) int __ARM_vsscanf(const char * __restrict , const char * __restrict , __va_list) __attribute__((__nonnull__(1,2)));

extern __attribute__((__nothrow__)) int vprintf(const char * __restrict , __va_list ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int _vprintf(const char * __restrict , __va_list ) __attribute__((__nonnull__(1)));





extern __attribute__((__nothrow__)) int vfprintf(FILE * __restrict ,
                    const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));
# 584 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int vsprintf(char * __restrict ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));
# 594 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int __ARM_vsnprintf(char * __restrict , size_t ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));

extern __attribute__((__nothrow__)) int vsnprintf(char * __restrict , size_t ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));
# 609 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int _vsprintf(char * __restrict ,
                      const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));





extern __attribute__((__nothrow__)) int _vfprintf(FILE * __restrict ,
                     const char * __restrict , __va_list ) __attribute__((__nonnull__(1,2)));





extern __attribute__((__nothrow__)) int _vsnprintf(char * __restrict , size_t ,
                      const char * __restrict , __va_list ) __attribute__((__nonnull__(3)));
# 635 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
#pragma __printf_args
extern __attribute__((__nothrow__)) int __ARM_asprintf(char ** , const char * __restrict , ...) __attribute__((__nonnull__(2)));
extern __attribute__((__nothrow__)) int __ARM_vasprintf(char ** , const char * __restrict , __va_list ) __attribute__((__nonnull__(2)));
# 649 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fgetc(FILE * ) __attribute__((__nonnull__(1)));
# 659 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) char *fgets(char * __restrict , int ,
                    FILE * __restrict ) __attribute__((__nonnull__(1,3)));
# 673 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fputc(int , FILE * ) __attribute__((__nonnull__(2)));
# 683 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fputs(const char * __restrict , FILE * __restrict ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) int getc(FILE * ) __attribute__((__nonnull__(1)));
# 704 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    extern __attribute__((__nothrow__)) int (getchar)(void);
# 713 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) char *gets(char * ) __attribute__((__nonnull__(1)));
# 725 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int putc(int , FILE * ) __attribute__((__nonnull__(2)));
# 737 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
    extern __attribute__((__nothrow__)) int (putchar)(int );






extern __attribute__((__nothrow__)) int puts(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int ungetc(int , FILE * ) __attribute__((__nonnull__(2)));
# 778 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) size_t fread(void * __restrict ,
                    size_t , size_t , FILE * __restrict ) __attribute__((__nonnull__(1,4)));
# 794 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) size_t __fread_bytes_avail(void * __restrict ,
                    size_t , FILE * __restrict ) __attribute__((__nonnull__(1,3)));
# 810 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) size_t fwrite(const void * __restrict ,
                    size_t , size_t , FILE * __restrict ) __attribute__((__nonnull__(1,4)));
# 822 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fgetpos(FILE * __restrict , fpos_t * __restrict ) __attribute__((__nonnull__(1,2)));
# 833 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fseek(FILE * , long int , int ) __attribute__((__nonnull__(1)));
# 850 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int fsetpos(FILE * __restrict , const fpos_t * __restrict ) __attribute__((__nonnull__(1,2)));
# 863 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) long int ftell(FILE * ) __attribute__((__nonnull__(1)));
# 877 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) void rewind(FILE * ) __attribute__((__nonnull__(1)));
# 886 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) void clearerr(FILE * ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) int feof(FILE * ) __attribute__((__nonnull__(1)));




extern __attribute__((__nothrow__)) int ferror(FILE * ) __attribute__((__nonnull__(1)));




extern __attribute__((__nothrow__)) void perror(const char * );
# 917 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdio.h" 3
extern __attribute__((__nothrow__)) int _fisatty(FILE * ) __attribute__((__nonnull__(1)));



extern __attribute__((__nothrow__)) void __use_no_semihosting_swi(void);
extern __attribute__((__nothrow__)) void __use_no_semihosting(void);
# 40 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdint.h" 1 3
# 56 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdint.h" 3
typedef signed char int8_t;
typedef signed short int int16_t;
typedef signed int int32_t;
typedef signed long long int int64_t;


typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long int uint64_t;





typedef signed char int_least8_t;
typedef signed short int int_least16_t;
typedef signed int int_least32_t;
typedef signed long long int int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long long int uint_least64_t;




typedef signed int int_fast8_t;
typedef signed int int_fast16_t;
typedef signed int int_fast32_t;
typedef signed long long int int_fast64_t;


typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef unsigned long long int uint_fast64_t;






typedef signed int intptr_t;
typedef unsigned int uintptr_t;



typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
# 41 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 1 3
# 58 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) void *memcpy(void * __restrict ,
                    const void * __restrict , size_t ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) void *memmove(void * ,
                    const void * , size_t ) __attribute__((__nonnull__(1,2)));
# 77 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strcpy(char * __restrict , const char * __restrict ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) char *strncpy(char * __restrict , const char * __restrict , size_t ) __attribute__((__nonnull__(1,2)));
# 93 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strcat(char * __restrict , const char * __restrict ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) char *strncat(char * __restrict , const char * __restrict , size_t ) __attribute__((__nonnull__(1,2)));
# 117 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) int memcmp(const void * , const void * , size_t ) __attribute__((__nonnull__(1,2)));







extern __attribute__((__nothrow__)) int strcmp(const char * , const char * ) __attribute__((__nonnull__(1,2)));






extern __attribute__((__nothrow__)) int strncmp(const char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 141 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) int strcasecmp(const char * , const char * ) __attribute__((__nonnull__(1,2)));







extern __attribute__((__nothrow__)) int strncasecmp(const char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 158 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) int strcoll(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 169 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) size_t strxfrm(char * __restrict , const char * __restrict , size_t ) __attribute__((__nonnull__(2)));
# 193 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) void *memchr(const void * , int , size_t ) __attribute__((__nonnull__(1)));
# 209 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strchr(const char * , int ) __attribute__((__nonnull__(1)));
# 218 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) size_t strcspn(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 232 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strpbrk(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 247 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strrchr(const char * , int ) __attribute__((__nonnull__(1)));
# 257 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) size_t strspn(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 270 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strstr(const char * , const char * ) __attribute__((__nonnull__(1,2)));
# 280 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) char *strtok(char * __restrict , const char * __restrict ) __attribute__((__nonnull__(2)));
extern __attribute__((__nothrow__)) char *_strtok_r(char * , const char * , char ** ) __attribute__((__nonnull__(2,3)));
# 321 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) void *memset(void * , int , size_t ) __attribute__((__nonnull__(1)));





extern __attribute__((__nothrow__)) char *strerror(int );







extern __attribute__((__nothrow__)) size_t strlen(const char * ) __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) size_t strlcpy(char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 362 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) size_t strlcat(char * , const char * , size_t ) __attribute__((__nonnull__(1,2)));
# 388 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
extern __attribute__((__nothrow__)) void _membitcpybl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpybb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpyhl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpyhb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpywl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitcpywb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovebl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovebb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovehl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovehb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovewl(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
extern __attribute__((__nothrow__)) void _membitmovewb(void * , const void * , int , int , size_t ) __attribute__((__nonnull__(1,2)));
# 42 "../../libraries/zf_common\\zf_common_headfile.h" 2


# 1 "../../libraries/sdk/drives\\fsl_common.h" 1
# 12 "../../libraries/sdk/drives\\fsl_common.h"
# 1 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\assert.h" 1 3
# 43 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\assert.h" 3
    extern __attribute__((__nothrow__)) __attribute__((__noreturn__)) void abort(void);
    extern __attribute__((__nothrow__)) __attribute__((__noreturn__)) void __aeabi_assert(const char *, const char *, int) __attribute__((__nonnull__(1,2)));
# 13 "../../libraries/sdk/drives\\fsl_common.h" 2
# 1 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdbool.h" 1 3
# 14 "../../libraries/sdk/drives\\fsl_common.h" 2


# 1 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 1 3
# 91 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
    typedef unsigned short wchar_t;




typedef struct div_t { int quot, rem; } div_t;

typedef struct ldiv_t { long int quot, rem; } ldiv_t;


typedef struct lldiv_t { long long quot, rem; } lldiv_t;
# 139 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int __aeabi_MB_CUR_MAX(void);
# 158 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) double atof(const char * ) __attribute__((__nonnull__(1)));





extern __attribute__((__nothrow__)) int atoi(const char * ) __attribute__((__nonnull__(1)));





extern __attribute__((__nothrow__)) long int atol(const char * ) __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) long long atoll(const char * ) __attribute__((__nonnull__(1)));







extern __attribute__((__nothrow__)) double strtod(const char * __restrict , char ** __restrict ) __attribute__((__nonnull__(1)));
# 206 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) float strtof(const char * __restrict , char ** __restrict ) __attribute__((__nonnull__(1)));
extern __attribute__((__nothrow__)) long double strtold(const char * __restrict , char ** __restrict ) __attribute__((__nonnull__(1)));




extern __attribute__((__nothrow__)) long int strtol(const char * __restrict ,
                        char ** __restrict , int ) __attribute__((__nonnull__(1)));
# 243 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) unsigned long int strtoul(const char * __restrict ,
                                       char ** __restrict , int ) __attribute__((__nonnull__(1)));
# 275 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) long long strtoll(const char * __restrict ,
                                  char ** __restrict , int )
                          __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) unsigned long long strtoull(const char * __restrict ,
                                            char ** __restrict , int )
                                   __attribute__((__nonnull__(1)));






extern __attribute__((__nothrow__)) int rand(void);
# 303 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) void srand(unsigned int );
# 313 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
struct _rand_state { int __x[57]; };
extern __attribute__((__nothrow__)) int _rand_r(struct _rand_state *);
extern __attribute__((__nothrow__)) void _srand_r(struct _rand_state *, unsigned int);
struct _ANSI_rand_state { int __x[1]; };
extern __attribute__((__nothrow__)) int _ANSI_rand_r(struct _ANSI_rand_state *);
extern __attribute__((__nothrow__)) void _ANSI_srand_r(struct _ANSI_rand_state *, unsigned int);





extern __attribute__((__nothrow__)) void *calloc(size_t , size_t );





extern __attribute__((__nothrow__)) void free(void * );







extern __attribute__((__nothrow__)) void *malloc(size_t );





extern __attribute__((__nothrow__)) void *realloc(void * , size_t );
# 374 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
typedef int (*__heapprt)(void *, char const *, ...);
extern __attribute__((__nothrow__)) void __heapstats(int (* )(void * ,
                                           char const * , ...),
                        void * ) __attribute__((__nonnull__(1)));
# 390 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int __heapvalid(int (* )(void * ,
                                           char const * , ...),
                       void * , int ) __attribute__((__nonnull__(1)));
# 411 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__noreturn__)) void abort(void);
# 422 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int atexit(void (* )(void)) __attribute__((__nonnull__(1)));
# 444 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__noreturn__)) void exit(int );
# 460 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__noreturn__)) void _Exit(int );
# 471 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) char *getenv(const char * ) __attribute__((__nonnull__(1)));
# 484 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int system(const char * );
# 497 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern void *bsearch(const void * , const void * ,
              size_t , size_t ,
              int (* )(const void *, const void *)) __attribute__((__nonnull__(1,2,5)));
# 532 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern void qsort(void * , size_t , size_t ,
           int (* )(const void *, const void *)) __attribute__((__nonnull__(1,4)));
# 560 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) int abs(int );






extern __attribute__((__nothrow__)) __attribute__((__const__)) div_t div(int , int );
# 579 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) long int labs(long int );
# 589 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) ldiv_t ldiv(long int , long int );
# 610 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) long long llabs(long long );
# 620 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) __attribute__((__const__)) lldiv_t lldiv(long long , long long );
# 644 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
typedef struct __sdiv32by16 { long quot, rem; } __sdiv32by16;
typedef struct __udiv32by16 { unsigned long quot, rem; } __udiv32by16;

typedef struct __sdiv64by32 { long rem, quot; } __sdiv64by32;

__attribute__((__value_in_regs__)) extern __attribute__((__nothrow__)) __attribute__((__const__)) __sdiv32by16 __rt_sdiv32by16(
     int ,
     short int );



__attribute__((__value_in_regs__)) extern __attribute__((__nothrow__)) __attribute__((__const__)) __udiv32by16 __rt_udiv32by16(
     unsigned int ,
     unsigned short );



__attribute__((__value_in_regs__)) extern __attribute__((__nothrow__)) __attribute__((__const__)) __sdiv64by32 __rt_sdiv64by32(
     int , unsigned int ,
     int );







extern __attribute__((__nothrow__)) unsigned int __fp_status(unsigned int , unsigned int );
# 705 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int mblen(const char * , size_t );
# 720 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int mbtowc(wchar_t * __restrict ,
                   const char * __restrict , size_t );
# 739 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) int wctomb(char * , wchar_t );
# 761 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) size_t mbstowcs(wchar_t * __restrict ,
                      const char * __restrict , size_t ) __attribute__((__nonnull__(2)));
# 779 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) size_t wcstombs(char * __restrict ,
                      const wchar_t * __restrict , size_t ) __attribute__((__nonnull__(2)));
# 798 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdlib.h" 3
extern __attribute__((__nothrow__)) void __use_realtime_heap(void);
extern __attribute__((__nothrow__)) void __use_realtime_division(void);
extern __attribute__((__nothrow__)) void __use_two_region_memory(void);
extern __attribute__((__nothrow__)) void __use_no_heap(void);
extern __attribute__((__nothrow__)) void __use_no_heap_region(void);

extern __attribute__((__nothrow__)) char const *__C_library_version_string(void);
extern __attribute__((__nothrow__)) int __C_library_version_number(void);
# 17 "../../libraries/sdk/drives\\fsl_common.h" 2


# 1 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stddef.h" 1 3
# 38 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stddef.h" 3
  typedef signed int ptrdiff_t;
# 20 "../../libraries/sdk/drives\\fsl_common.h" 2


# 1 "../../libraries/sdk/deceive\\fsl_device_registers.h" 1
# 24 "../../libraries/sdk/deceive\\fsl_device_registers.h"
# 1 "../../libraries/sdk/deceive/MIMXRT1064.h" 1
# 76 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef enum IRQn {

  NotAvail_IRQn = -128,


  NonMaskableInt_IRQn = -14,
  HardFault_IRQn = -13,
  MemoryManagement_IRQn = -12,
  BusFault_IRQn = -11,
  UsageFault_IRQn = -10,
  SVCall_IRQn = -5,
  DebugMonitor_IRQn = -4,
  PendSV_IRQn = -2,
  SysTick_IRQn = -1,


  DMA0_DMA16_IRQn = 0,
  DMA1_DMA17_IRQn = 1,
  DMA2_DMA18_IRQn = 2,
  DMA3_DMA19_IRQn = 3,
  DMA4_DMA20_IRQn = 4,
  DMA5_DMA21_IRQn = 5,
  DMA6_DMA22_IRQn = 6,
  DMA7_DMA23_IRQn = 7,
  DMA8_DMA24_IRQn = 8,
  DMA9_DMA25_IRQn = 9,
  DMA10_DMA26_IRQn = 10,
  DMA11_DMA27_IRQn = 11,
  DMA12_DMA28_IRQn = 12,
  DMA13_DMA29_IRQn = 13,
  DMA14_DMA30_IRQn = 14,
  DMA15_DMA31_IRQn = 15,
  DMA_ERROR_IRQn = 16,
  CTI0_ERROR_IRQn = 17,
  CTI1_ERROR_IRQn = 18,
  CORE_IRQn = 19,
  LPUART1_IRQn = 20,
  LPUART2_IRQn = 21,
  LPUART3_IRQn = 22,
  LPUART4_IRQn = 23,
  LPUART5_IRQn = 24,
  LPUART6_IRQn = 25,
  LPUART7_IRQn = 26,
  LPUART8_IRQn = 27,
  LPI2C1_IRQn = 28,
  LPI2C2_IRQn = 29,
  LPI2C3_IRQn = 30,
  LPI2C4_IRQn = 31,
  LPSPI1_IRQn = 32,
  LPSPI2_IRQn = 33,
  LPSPI3_IRQn = 34,
  LPSPI4_IRQn = 35,
  CAN1_IRQn = 36,
  CAN2_IRQn = 37,
  FLEXRAM_IRQn = 38,
  KPP_IRQn = 39,
  TSC_DIG_IRQn = 40,
  GPR_IRQ_IRQn = 41,
  LCDIF_IRQn = 42,
  CSI_IRQn = 43,
  PXP_IRQn = 44,
  WDOG2_IRQn = 45,
  SNVS_HP_WRAPPER_IRQn = 46,
  SNVS_HP_WRAPPER_TZ_IRQn = 47,
  SNVS_LP_WRAPPER_IRQn = 48,
  CSU_IRQn = 49,
  DCP_IRQn = 50,
  DCP_VMI_IRQn = 51,
  Reserved68_IRQn = 52,
  TRNG_IRQn = 53,
  SJC_IRQn = 54,
  BEE_IRQn = 55,
  SAI1_IRQn = 56,
  SAI2_IRQn = 57,
  SAI3_RX_IRQn = 58,
  SAI3_TX_IRQn = 59,
  SPDIF_IRQn = 60,
  PMU_EVENT_IRQn = 61,
  Reserved78_IRQn = 62,
  TEMP_LOW_HIGH_IRQn = 63,
  TEMP_PANIC_IRQn = 64,
  USB_PHY1_IRQn = 65,
  USB_PHY2_IRQn = 66,
  ADC1_IRQn = 67,
  ADC2_IRQn = 68,
  DCDC_IRQn = 69,
  Reserved86_IRQn = 70,
  GPIO10_IRQn = 71,
  GPIO1_INT0_IRQn = 72,
  GPIO1_INT1_IRQn = 73,
  GPIO1_INT2_IRQn = 74,
  GPIO1_INT3_IRQn = 75,
  GPIO1_INT4_IRQn = 76,
  GPIO1_INT5_IRQn = 77,
  GPIO1_INT6_IRQn = 78,
  GPIO1_INT7_IRQn = 79,
  GPIO1_Combined_0_15_IRQn = 80,
  GPIO1_Combined_16_31_IRQn = 81,
  GPIO2_Combined_0_15_IRQn = 82,
  GPIO2_Combined_16_31_IRQn = 83,
  GPIO3_Combined_0_15_IRQn = 84,
  GPIO3_Combined_16_31_IRQn = 85,
  GPIO4_Combined_0_15_IRQn = 86,
  GPIO4_Combined_16_31_IRQn = 87,
  GPIO5_Combined_0_15_IRQn = 88,
  GPIO5_Combined_16_31_IRQn = 89,
  FLEXIO1_IRQn = 90,
  FLEXIO2_IRQn = 91,
  WDOG1_IRQn = 92,
  RTWDOG_IRQn = 93,
  EWM_IRQn = 94,
  CCM_1_IRQn = 95,
  CCM_2_IRQn = 96,
  GPC_IRQn = 97,
  SRC_IRQn = 98,
  Reserved115_IRQn = 99,
  GPT1_IRQn = 100,
  GPT2_IRQn = 101,
  PWM1_0_IRQn = 102,
  PWM1_1_IRQn = 103,
  PWM1_2_IRQn = 104,
  PWM1_3_IRQn = 105,
  PWM1_FAULT_IRQn = 106,
  FLEXSPI2_IRQn = 107,
  FLEXSPI_IRQn = 108,
  SEMC_IRQn = 109,
  USDHC1_IRQn = 110,
  USDHC2_IRQn = 111,
  USB_OTG2_IRQn = 112,
  USB_OTG1_IRQn = 113,
  ENET_IRQn = 114,
  ENET_1588_Timer_IRQn = 115,
  XBAR1_IRQ_0_1_IRQn = 116,
  XBAR1_IRQ_2_3_IRQn = 117,
  ADC_ETC_IRQ0_IRQn = 118,
  ADC_ETC_IRQ1_IRQn = 119,
  ADC_ETC_IRQ2_IRQn = 120,
  ADC_ETC_ERROR_IRQ_IRQn = 121,
  PIT_IRQn = 122,
  ACMP1_IRQn = 123,
  ACMP2_IRQn = 124,
  ACMP3_IRQn = 125,
  ACMP4_IRQn = 126,
  Reserved143_IRQn = 127,
  Reserved144_IRQn = 128,
  ENC1_IRQn = 129,
  ENC2_IRQn = 130,
  ENC3_IRQn = 131,
  ENC4_IRQn = 132,
  TMR1_IRQn = 133,
  TMR2_IRQn = 134,
  TMR3_IRQn = 135,
  TMR4_IRQn = 136,
  PWM2_0_IRQn = 137,
  PWM2_1_IRQn = 138,
  PWM2_2_IRQn = 139,
  PWM2_3_IRQn = 140,
  PWM2_FAULT_IRQn = 141,
  PWM3_0_IRQn = 142,
  PWM3_1_IRQn = 143,
  PWM3_2_IRQn = 144,
  PWM3_3_IRQn = 145,
  PWM3_FAULT_IRQn = 146,
  PWM4_0_IRQn = 147,
  PWM4_1_IRQn = 148,
  PWM4_2_IRQn = 149,
  PWM4_3_IRQn = 150,
  PWM4_FAULT_IRQn = 151,
  ENET2_IRQn = 152,
  ENET2_1588_Timer_IRQn = 153,
  CAN3_IRQn = 154,
  Reserved171_IRQn = 155,
  FLEXIO3_IRQn = 156,
  GPIO6_7_8_9_IRQn = 157
} IRQn_Type;
# 274 "../../libraries/sdk/deceive/MIMXRT1064.h"
# 1 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 1
# 29 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
# 63 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
# 1 "../../libraries/sdk/CMSIS/Include/cmsis_version.h" 1 3
# 29 "../../libraries/sdk/CMSIS/Include/cmsis_version.h" 3
# 64 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 2 3
# 162 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
# 1 "../../libraries/sdk/CMSIS/Include/cmsis_compiler.h" 1 3
# 47 "../../libraries/sdk/CMSIS/Include/cmsis_compiler.h" 3
# 1 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 1 3
# 31 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3


# 1 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 1 3






# 1 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 1 3
# 39 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
static __inline__ void __attribute__((__always_inline__, __nodebug__)) __wfi(void) {
  __builtin_arm_wfi();
}



static __inline__ void __attribute__((__always_inline__, __nodebug__)) __wfe(void) {
  __builtin_arm_wfe();
}



static __inline__ void __attribute__((__always_inline__, __nodebug__)) __sev(void) {
  __builtin_arm_sev();
}



static __inline__ void __attribute__((__always_inline__, __nodebug__)) __sevl(void) {
  __builtin_arm_sevl();
}



static __inline__ void __attribute__((__always_inline__, __nodebug__)) __yield(void) {
  __builtin_arm_yield();
}







static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__swp(uint32_t __x, volatile uint32_t *__p) {
  uint32_t v;
  do
    v = __builtin_arm_ldrex(__p);
  while (__builtin_arm_strex(__x, __p));
  return v;
}
# 107 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
static __inline__ void __attribute__((__always_inline__, __nodebug__)) __nop(void) {
  __builtin_arm_nop();
}





static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__ror(uint32_t __x, uint32_t __y) {
  __y %= 32;
  if (__y == 0)
    return __x;
  return (__x >> __y) | (__x << (32 - __y));
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rorll(uint64_t __x, uint32_t __y) {
  __y %= 64;
  if (__y == 0)
    return __x;
  return (__x >> __y) | (__x << (64 - __y));
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rorl(unsigned long __x, uint32_t __y) {

  return __ror(__x, __y);



}



static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__clz(uint32_t __t) {
  return __builtin_clz(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__clzl(unsigned long __t) {
  return __builtin_clzl(__t);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__clzll(uint64_t __t) {
  return __builtin_clzll(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__cls(uint32_t __t) {
  return __builtin_arm_cls(__t);
}

static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__clsl(unsigned long __t) {

  return __builtin_arm_cls(__t);



}

static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__clsll(uint64_t __t) {
  return __builtin_arm_cls64(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rev(uint32_t __t) {
  return __builtin_bswap32(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__revl(unsigned long __t) {

  return __builtin_bswap32(__t);



}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__revll(uint64_t __t) {
  return __builtin_bswap64(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rev16(uint32_t __t) {
  return __ror(__rev(__t), 16);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rev16ll(uint64_t __t) {
  return (((uint64_t)__rev16(__t >> 32)) << 32) | __rev16(__t);
}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rev16l(unsigned long __t) {

    return __rev16(__t);



}


static __inline__ int16_t __attribute__((__always_inline__, __nodebug__))
__revsh(int16_t __t) {
  return __builtin_bswap16(__t);
}


static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__rbit(uint32_t __t) {
  return __builtin_arm_rbit(__t);
}

static __inline__ uint64_t __attribute__((__always_inline__, __nodebug__))
__rbitll(uint64_t __t) {

  return (((uint64_t)__builtin_arm_rbit(__t)) << 32) |
         __builtin_arm_rbit(__t >> 32);



}

static __inline__ unsigned long __attribute__((__always_inline__, __nodebug__))
__rbitl(unsigned long __t) {

  return __rbit(__t);



}





static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulbb(int32_t __a, int32_t __b) {
  return __builtin_arm_smulbb(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulbt(int32_t __a, int32_t __b) {
  return __builtin_arm_smulbt(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smultb(int32_t __a, int32_t __b) {
  return __builtin_arm_smultb(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smultt(int32_t __a, int32_t __b) {
  return __builtin_arm_smultt(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulwb(int32_t __a, int32_t __b) {
  return __builtin_arm_smulwb(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__,__nodebug__))
__smulwt(int32_t __a, int32_t __b) {
  return __builtin_arm_smulwt(__a, __b);
}
# 292 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__qadd(int32_t __t, int32_t __v) {
  return __builtin_arm_qadd(__t, __v);
}

static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__qsub(int32_t __t, int32_t __v) {
  return __builtin_arm_qsub(__t, __v);
}

static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__qdbl(int32_t __t) {
  return __builtin_arm_qadd(__t, __t);
}




static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlabb(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlabb(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlabt(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlabt(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlatb(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlatb(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlatt(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlatt(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlawb(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlawb(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlawt(int32_t __a, int32_t __b, int32_t __c) {
  return __builtin_arm_smlawt(__a, __b, __c);
}
# 345 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_acle.h" 3
typedef int32_t int8x4_t;
typedef int32_t int16x2_t;
typedef uint32_t uint8x4_t;
typedef uint32_t uint16x2_t;

static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sxtab16(int16x2_t __a, int8x4_t __b) {
  return __builtin_arm_sxtab16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sxtb16(int8x4_t __a) {
  return __builtin_arm_sxtb16(__a);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__uxtab16(int16x2_t __a, int8x4_t __b) {
  return __builtin_arm_uxtab16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__uxtb16(int8x4_t __a) {
  return __builtin_arm_uxtb16(__a);
}




static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__sel(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_sel(__a, __b);
}




static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__qadd8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_qadd8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__qsub8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_qsub8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__sadd8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_sadd8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__shadd8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_shadd8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__shsub8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_shsub8(__a, __b);
}
static __inline__ int8x4_t __attribute__((__always_inline__, __nodebug__))
__ssub8(int8x4_t __a, int8x4_t __b) {
  return __builtin_arm_ssub8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uadd8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uadd8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uhadd8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uhadd8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uhsub8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uhsub8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uqadd8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uqadd8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__uqsub8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_uqsub8(__a, __b);
}
static __inline__ uint8x4_t __attribute__((__always_inline__, __nodebug__))
__usub8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_usub8(__a, __b);
}




static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__usad8(uint8x4_t __a, uint8x4_t __b) {
  return __builtin_arm_usad8(__a, __b);
}
static __inline__ uint32_t __attribute__((__always_inline__, __nodebug__))
__usada8(uint8x4_t __a, uint8x4_t __b, uint32_t __c) {
  return __builtin_arm_usada8(__a, __b, __c);
}




static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qadd16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qadd16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qasx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qasx(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qsax(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qsax(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__qsub16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_qsub16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sadd16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_sadd16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__sasx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_sasx(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shadd16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shadd16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shasx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shasx(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shsax(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shsax(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__shsub16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_shsub16(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__ssax(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_ssax(__a, __b);
}
static __inline__ int16x2_t __attribute__((__always_inline__, __nodebug__))
__ssub16(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_ssub16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uadd16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uadd16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uasx(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uasx(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhadd16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhadd16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhasx(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhasx(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhsax(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhsax(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uhsub16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uhsub16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqadd16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqadd16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqasx(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqasx(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqsax(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqsax(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__uqsub16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_uqsub16(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__usax(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_usax(__a, __b);
}
static __inline__ uint16x2_t __attribute__((__always_inline__, __nodebug__))
__usub16(uint16x2_t __a, uint16x2_t __b) {
  return __builtin_arm_usub16(__a, __b);
}




static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlad(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smlad(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smladx(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smladx(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlald(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlald(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlaldx(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlaldx(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlsd(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smlsd(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smlsdx(int16x2_t __a, int16x2_t __b, int32_t __c) {
  return __builtin_arm_smlsdx(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlsld(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlsld(__a, __b, __c);
}
static __inline__ int64_t __attribute__((__always_inline__, __nodebug__))
__smlsldx(int16x2_t __a, int16x2_t __b, int64_t __c) {
  return __builtin_arm_smlsldx(__a, __b, __c);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smuad(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smuad(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smuadx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smuadx(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smusd(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smusd(__a, __b);
}
static __inline__ int32_t __attribute__((__always_inline__, __nodebug__))
__smusdx(int16x2_t __a, int16x2_t __b) {
  return __builtin_arm_smusdx(__a, __b);
}
# 8 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 2 3
# 40 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__disable_fiq(void) {
  unsigned int cpsr;

  __asm__ __volatile__("mrs %[cpsr], faultmask\n"
                       "cpsid f\n"
                       : [cpsr] "=r"(cpsr));
  return cpsr & 0x1;
# 62 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}


static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__disable_irq(void) {
  unsigned int cpsr;


  __asm__ __volatile__("mrs %[cpsr], primask\n"
                       "cpsid i\n"
                       : [cpsr] "=r"(cpsr));
  return cpsr & 0x1;
# 89 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}







static __inline__ void __attribute__((__always_inline__, __nodebug__))
__enable_fiq(void) {

  __asm__ __volatile__("cpsie f");
# 109 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}


static __inline__ void __attribute__((__always_inline__, __nodebug__))
__enable_irq(void) {

  __asm__ __volatile__("cpsie i");
# 124 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
}

static __inline__ void __attribute__((__always_inline__, __nodebug__)) __force_stores(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static void __attribute__((__always_inline__, __nodebug__)) __memory_changed(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static void __attribute__((__always_inline__, __nodebug__)) __schedule_barrier(void) {
    __asm__ __volatile__ ("" : : : "memory", "cc");
}

static __inline__ int __attribute__((__always_inline__, __nodebug__))
__semihost(int val, const void *ptr) {
  register int v __asm__("r0") = val;
  register const void *p __asm__("r1") = ptr;
  __asm__ __volatile__(


      "bkpt 0xab"
# 160 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\arm_compat.h" 3
      : "+r"(v), "+r"(p)
      :
      : "memory", "cc");
  return v;
}


static __inline__ unsigned int __attribute__((__always_inline__, __nodebug__))
__vfp_status(unsigned int mask, unsigned int flags) {
  unsigned int fpscr;
  __asm__ __volatile__("vmrs %[fpscr], fpscr" : [fpscr] "=r"(fpscr));
  unsigned int set = mask & flags;
  unsigned int clear = mask & ~flags;
  unsigned int toggle = ~mask & flags;
  fpscr |= set;
  fpscr &= ~clear;
  fpscr ^= toggle;
  __asm__ __volatile__("vmsr fpscr, %[fpscr]" : : [fpscr] "r"(fpscr));
  return fpscr;
}
# 34 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 2 3
# 68 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed)) T_UINT32 { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT16_WRITE { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT16_READ { uint16_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT32_WRITE { uint32_t v; };
#pragma clang diagnostic pop



#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpacked"

  struct __attribute__((packed, aligned(1))) T_UINT32_READ { uint32_t v; };
#pragma clang diagnostic pop
# 142 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_CONTROL(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, control" : "=r" (result) );
  return(result);
}
# 172 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_CONTROL(uint32_t control)
{
  __asm volatile ("MSR control, %0" : : "r" (control) : "memory");
}
# 196 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_IPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, ipsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_APSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, apsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_xPSR(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, xpsr" : "=r" (result) );
  return(result);
}







__attribute__((always_inline)) static __inline uint32_t __get_PSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, psp" : "=r" (result) );
  return(result);
}
# 268 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PSP(uint32_t topOfProcStack)
{
  __asm volatile ("MSR psp, %0" : : "r" (topOfProcStack) : );
}
# 292 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_MSP(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, msp" : "=r" (result) );
  return(result);
}
# 322 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_MSP(uint32_t topOfMainStack)
{
  __asm volatile ("MSR msp, %0" : : "r" (topOfMainStack) : );
}
# 373 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_PRIMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, primask" : "=r" (result) );
  return(result);
}
# 403 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_PRIMASK(uint32_t priMask)
{
  __asm volatile ("MSR primask, %0" : : "r" (priMask) : "memory");
}
# 446 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __get_BASEPRI(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, basepri" : "=r" (result) );
  return(result);
}
# 476 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_BASEPRI(uint32_t basePri)
{
  __asm volatile ("MSR basepri, %0" : : "r" (basePri) : "memory");
}
# 501 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_BASEPRI_MAX(uint32_t basePri)
{
  __asm volatile ("MSR basepri_max, %0" : : "r" (basePri) : "memory");
}







__attribute__((always_inline)) static __inline uint32_t __get_FAULTMASK(void)
{
  uint32_t result;

  __asm volatile ("MRS %0, faultmask" : "=r" (result) );
  return(result);
}
# 542 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __set_FAULTMASK(uint32_t faultMask)
{
  __asm volatile ("MSR faultmask, %0" : : "r" (faultMask) : "memory");
}
# 878 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __ROR(uint32_t op1, uint32_t op2)
{
  op2 %= 32U;
  if (op2 == 0U)
  {
    return op1;
  }
  return (op1 >> op2) | (op1 << (32U - op2));
}
# 913 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint8_t __CLZ(uint32_t value)
{
# 924 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
  if (value == 0U)
  {
    return 32U;
  }
  return __builtin_clz(value);
}
# 1039 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __RRX(uint32_t value)
{
  uint32_t result;

  __asm volatile ("rrx %0, %1" : "=r" (result) : "r" (value) );
  return(result);
}
# 1054 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint8_t __LDRBT(volatile uint8_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrbt %0, %1" : "=r" (result) : "Q" (*ptr) );
  return ((uint8_t) result);
}
# 1069 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint16_t __LDRHT(volatile uint16_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrht %0, %1" : "=r" (result) : "Q" (*ptr) );
  return ((uint16_t) result);
}
# 1084 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline uint32_t __LDRT(volatile uint32_t *ptr)
{
  uint32_t result;

  __asm volatile ("ldrt %0, %1" : "=r" (result) : "Q" (*ptr) );
  return(result);
}
# 1099 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRBT(uint8_t value, volatile uint8_t *ptr)
{
  __asm volatile ("strbt %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 1111 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRHT(uint16_t value, volatile uint16_t *ptr)
{
  __asm volatile ("strht %1, %0" : "=Q" (*ptr) : "r" ((uint32_t)value) );
}
# 1123 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline void __STRT(uint32_t value, volatile uint32_t *ptr)
{
  __asm volatile ("strt %1, %0" : "=Q" (*ptr) : "r" (value) );
}
# 1408 "../../libraries/sdk/CMSIS/Include/cmsis_armclang.h" 3
__attribute__((always_inline)) static __inline int32_t __SMMLA (int32_t op1, int32_t op2, int32_t op3)
{
  int32_t result;

  __asm volatile ("smmla %0, %1, %2, %3" : "=r" (result): "r" (op1), "r" (op2), "r" (op3) );
  return(result);
}
# 48 "../../libraries/sdk/CMSIS/Include/cmsis_compiler.h" 2 3
# 163 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 2 3
# 274 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
typedef union
{
  struct
  {
    uint32_t _reserved0:16;
    uint32_t GE:4;
    uint32_t _reserved1:7;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} APSR_Type;
# 313 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:23;
  } b;
  uint32_t w;
} IPSR_Type;
# 331 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
typedef union
{
  struct
  {
    uint32_t ISR:9;
    uint32_t _reserved0:1;
    uint32_t ICI_IT_1:6;
    uint32_t GE:4;
    uint32_t _reserved1:4;
    uint32_t T:1;
    uint32_t ICI_IT_2:2;
    uint32_t Q:1;
    uint32_t V:1;
    uint32_t C:1;
    uint32_t Z:1;
    uint32_t N:1;
  } b;
  uint32_t w;
} xPSR_Type;
# 386 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
typedef union
{
  struct
  {
    uint32_t nPRIV:1;
    uint32_t SPSEL:1;
    uint32_t FPCA:1;
    uint32_t _reserved0:29;
  } b;
  uint32_t w;
} CONTROL_Type;
# 421 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile uint32_t ISER[8U];
        uint32_t RESERVED0[24U];
  volatile uint32_t ICER[8U];
        uint32_t RESERVED1[24U];
  volatile uint32_t ISPR[8U];
        uint32_t RESERVED2[24U];
  volatile uint32_t ICPR[8U];
        uint32_t RESERVED3[24U];
  volatile uint32_t IABR[8U];
        uint32_t RESERVED4[56U];
  volatile uint8_t IP[240U];
        uint32_t RESERVED5[644U];
  volatile uint32_t STIR;
} NVIC_Type;
# 455 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile const uint32_t CPUID;
  volatile uint32_t ICSR;
  volatile uint32_t VTOR;
  volatile uint32_t AIRCR;
  volatile uint32_t SCR;
  volatile uint32_t CCR;
  volatile uint8_t SHPR[12U];
  volatile uint32_t SHCSR;
  volatile uint32_t CFSR;
  volatile uint32_t HFSR;
  volatile uint32_t DFSR;
  volatile uint32_t MMFAR;
  volatile uint32_t BFAR;
  volatile uint32_t AFSR;
  volatile const uint32_t ID_PFR[2U];
  volatile const uint32_t ID_DFR;
  volatile const uint32_t ID_AFR;
  volatile const uint32_t ID_MFR[4U];
  volatile const uint32_t ID_ISAR[5U];
        uint32_t RESERVED0[1U];
  volatile const uint32_t CLIDR;
  volatile const uint32_t CTR;
  volatile const uint32_t CCSIDR;
  volatile uint32_t CSSELR;
  volatile uint32_t CPACR;
        uint32_t RESERVED3[93U];
  volatile uint32_t STIR;
        uint32_t RESERVED4[15U];
  volatile const uint32_t MVFR0;
  volatile const uint32_t MVFR1;
  volatile const uint32_t MVFR2;
        uint32_t RESERVED5[1U];
  volatile uint32_t ICIALLU;
        uint32_t RESERVED6[1U];
  volatile uint32_t ICIMVAU;
  volatile uint32_t DCIMVAC;
  volatile uint32_t DCISW;
  volatile uint32_t DCCMVAU;
  volatile uint32_t DCCMVAC;
  volatile uint32_t DCCSW;
  volatile uint32_t DCCIMVAC;
  volatile uint32_t DCCISW;
        uint32_t RESERVED7[6U];
  volatile uint32_t ITCMCR;
  volatile uint32_t DTCMCR;
  volatile uint32_t AHBPCR;
  volatile uint32_t CACR;
  volatile uint32_t AHBSCR;
        uint32_t RESERVED8[1U];
  volatile uint32_t ABFSR;
} SCB_Type;
# 921 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile const uint32_t ICTR;
  volatile uint32_t ACTLR;
} SCnSCB_Type;
# 979 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t LOAD;
  volatile uint32_t VAL;
  volatile const uint32_t CALIB;
} SysTick_Type;
# 1031 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile union
  {
    volatile uint8_t u8;
    volatile uint16_t u16;
    volatile uint32_t u32;
  } PORT [32U];
        uint32_t RESERVED0[864U];
  volatile uint32_t TER;
        uint32_t RESERVED1[15U];
  volatile uint32_t TPR;
        uint32_t RESERVED2[15U];
  volatile uint32_t TCR;
        uint32_t RESERVED3[32U];
        uint32_t RESERVED4[43U];
  volatile uint32_t LAR;
  volatile const uint32_t LSR;
        uint32_t RESERVED5[6U];
  volatile const uint32_t PID4;
  volatile const uint32_t PID5;
  volatile const uint32_t PID6;
  volatile const uint32_t PID7;
  volatile const uint32_t PID0;
  volatile const uint32_t PID1;
  volatile const uint32_t PID2;
  volatile const uint32_t PID3;
  volatile const uint32_t CID0;
  volatile const uint32_t CID1;
  volatile const uint32_t CID2;
  volatile const uint32_t CID3;
} ITM_Type;
# 1119 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile uint32_t CTRL;
  volatile uint32_t CYCCNT;
  volatile uint32_t CPICNT;
  volatile uint32_t EXCCNT;
  volatile uint32_t SLEEPCNT;
  volatile uint32_t LSUCNT;
  volatile uint32_t FOLDCNT;
  volatile const uint32_t PCSR;
  volatile uint32_t COMP0;
  volatile uint32_t MASK0;
  volatile uint32_t FUNCTION0;
        uint32_t RESERVED0[1U];
  volatile uint32_t COMP1;
  volatile uint32_t MASK1;
  volatile uint32_t FUNCTION1;
        uint32_t RESERVED1[1U];
  volatile uint32_t COMP2;
  volatile uint32_t MASK2;
  volatile uint32_t FUNCTION2;
        uint32_t RESERVED2[1U];
  volatile uint32_t COMP3;
  volatile uint32_t MASK3;
  volatile uint32_t FUNCTION3;
        uint32_t RESERVED3[981U];
  volatile uint32_t LAR;
  volatile const uint32_t LSR;
} DWT_Type;
# 1269 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile const uint32_t SSPSR;
  volatile uint32_t CSPSR;
        uint32_t RESERVED0[2U];
  volatile uint32_t ACPR;
        uint32_t RESERVED1[55U];
  volatile uint32_t SPPR;
        uint32_t RESERVED2[131U];
  volatile const uint32_t FFSR;
  volatile uint32_t FFCR;
  volatile const uint32_t FSCR;
        uint32_t RESERVED3[759U];
  volatile const uint32_t TRIGGER;
  volatile const uint32_t FIFO0;
  volatile const uint32_t ITATBCTR2;
        uint32_t RESERVED4[1U];
  volatile const uint32_t ITATBCTR0;
  volatile const uint32_t FIFO1;
  volatile uint32_t ITCTRL;
        uint32_t RESERVED5[39U];
  volatile uint32_t CLAIMSET;
  volatile uint32_t CLAIMCLR;
        uint32_t RESERVED7[8U];
  volatile const uint32_t DEVID;
  volatile const uint32_t DEVTYPE;
} TPI_Type;
# 1431 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile const uint32_t TYPE;
  volatile uint32_t CTRL;
  volatile uint32_t RNR;
  volatile uint32_t RBAR;
  volatile uint32_t RASR;
  volatile uint32_t RBAR_A1;
  volatile uint32_t RASR_A1;
  volatile uint32_t RBAR_A2;
  volatile uint32_t RASR_A2;
  volatile uint32_t RBAR_A3;
  volatile uint32_t RASR_A3;
} MPU_Type;
# 1527 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
        uint32_t RESERVED0[1U];
  volatile uint32_t FPCCR;
  volatile uint32_t FPCAR;
  volatile uint32_t FPDSCR;
  volatile const uint32_t MVFR0;
  volatile const uint32_t MVFR1;
  volatile const uint32_t MVFR2;
} FPU_Type;
# 1639 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
typedef struct
{
  volatile uint32_t DHCSR;
  volatile uint32_t DCRSR;
  volatile uint32_t DCRDR;
  volatile uint32_t DEMCR;
} CoreDebug_Type;
# 1871 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_SetPriorityGrouping(uint32_t PriorityGroup)
{
  uint32_t reg_value;
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);

  reg_value = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR;
  reg_value &= ~((uint32_t)((0xFFFFUL << 16U) | (7UL << 8U)));
  reg_value = (reg_value |
                ((uint32_t)0x5FAUL << 16U) |
                (PriorityGroupTmp << 8U) );
  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = reg_value;
}







static __inline uint32_t __NVIC_GetPriorityGrouping(void)
{
  return ((uint32_t)((((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) >> 8U));
}
# 1902 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_EnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1919 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetEnableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISER[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1938 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_DisableIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICER[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);
  }
}
# 1957 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 1976 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ISPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 1991 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->ICPR[(((uint32_t)IRQn) >> 5UL)] = (uint32_t)(1UL << (((uint32_t)IRQn) & 0x1FUL));
  }
}
# 2008 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetActive(IRQn_Type IRQn)
{
  if ((int32_t)(IRQn) >= 0)
  {
    return((uint32_t)(((((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IABR[(((uint32_t)IRQn) >> 5UL)] & (1UL << (((uint32_t)IRQn) & 0x1FUL))) != 0UL) ? 1UL : 0UL));
  }
  else
  {
    return(0U);
  }
}
# 2030 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if ((int32_t)(IRQn) >= 0)
  {
    ((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] = (uint8_t)((priority << (8U - 4)) & (uint32_t)0xFFUL);
  }
  else
  {
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHPR[(((uint32_t)IRQn) & 0xFUL)-4UL] = (uint8_t)((priority << (8U - 4)) & (uint32_t)0xFFUL);
  }
}
# 2052 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetPriority(IRQn_Type IRQn)
{

  if ((int32_t)(IRQn) >= 0)
  {
    return(((uint32_t)((NVIC_Type *) ((0xE000E000UL) + 0x0100UL) )->IP[((uint32_t)IRQn)] >> (8U - 4)));
  }
  else
  {
    return(((uint32_t)((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHPR[(((uint32_t)IRQn) & 0xFUL)-4UL] >> (8U - 4)));
  }
}
# 2077 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t NVIC_EncodePriority (uint32_t PriorityGroup, uint32_t PreemptPriority, uint32_t SubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4)) ? (uint32_t)(4) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(4)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4));

  return (
           ((PreemptPriority & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL)) << SubPriorityBits) |
           ((SubPriority & (uint32_t)((1UL << (SubPriorityBits )) - 1UL)))
         );
}
# 2104 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline void NVIC_DecodePriority (uint32_t Priority, uint32_t PriorityGroup, uint32_t* const pPreemptPriority, uint32_t* const pSubPriority)
{
  uint32_t PriorityGroupTmp = (PriorityGroup & (uint32_t)0x07UL);
  uint32_t PreemptPriorityBits;
  uint32_t SubPriorityBits;

  PreemptPriorityBits = ((7UL - PriorityGroupTmp) > (uint32_t)(4)) ? (uint32_t)(4) : (uint32_t)(7UL - PriorityGroupTmp);
  SubPriorityBits = ((PriorityGroupTmp + (uint32_t)(4)) < (uint32_t)7UL) ? (uint32_t)0UL : (uint32_t)((PriorityGroupTmp - 7UL) + (uint32_t)(4));

  *pPreemptPriority = (Priority >> SubPriorityBits) & (uint32_t)((1UL << (PreemptPriorityBits)) - 1UL);
  *pSubPriority = (Priority ) & (uint32_t)((1UL << (SubPriorityBits )) - 1UL);
}
# 2127 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline void __NVIC_SetVector(IRQn_Type IRQn, uint32_t vector)
{
  uint32_t vectors = (uint32_t )((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  (* (int *) (vectors + ((int32_t)IRQn + 16) * 4)) = vector;
}
# 2142 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t __NVIC_GetVector(IRQn_Type IRQn)
{
  uint32_t vectors = (uint32_t )((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->VTOR;
  return (uint32_t)(* (int *) (vectors + ((int32_t)IRQn + 16) * 4));
}






__attribute__((__noreturn__)) static __inline void __NVIC_SystemReset(void)
{
  __builtin_arm_dsb(0xF);

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR = (uint32_t)((0x5FAUL << 16U) |
                           (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->AIRCR & (7UL << 8U)) |
                            (1UL << 2U) );
  __builtin_arm_dsb(0xF);

  for(;;)
  {
    __builtin_arm_nop();
  }
}
# 2175 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
# 1 "../../libraries/sdk/CMSIS/Include/mpu_armv7.h" 1 3
# 29 "../../libraries/sdk/CMSIS/Include/mpu_armv7.h" 3
# 183 "../../libraries/sdk/CMSIS/Include/mpu_armv7.h" 3
typedef struct {
  uint32_t RBAR;
  uint32_t RASR;
} ARM_MPU_Region_t;




static __inline void ARM_MPU_Enable(uint32_t MPU_Control)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL = MPU_Control | (1UL );

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR |= (1UL << 16U);

  __builtin_arm_dsb(0xF);
  __builtin_arm_isb(0xF);
}



static __inline void ARM_MPU_Disable(void)
{
  __builtin_arm_dmb(0xF);

  ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->SHCSR &= ~(1UL << 16U);

  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->CTRL &= ~(1UL );
}




static __inline void ARM_MPU_ClrRegion(uint32_t rnr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR = rnr;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = 0U;
}





static __inline void ARM_MPU_SetRegion(uint32_t rbar, uint32_t rasr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR = rbar;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = rasr;
}






static __inline void ARM_MPU_SetRegionEx(uint32_t rnr, uint32_t rbar, uint32_t rasr)
{
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RNR = rnr;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR = rbar;
  ((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RASR = rasr;
}






static __inline void ARM_MPU_OrderedMemcpy(volatile uint32_t* dst, const uint32_t* __restrict src, uint32_t len)
{
  uint32_t i;
  for (i = 0U; i < len; ++i)
  {
    dst[i] = src[i];
  }
}





static __inline void ARM_MPU_Load(ARM_MPU_Region_t const* table, uint32_t cnt)
{
  const uint32_t rowWordSize = sizeof(ARM_MPU_Region_t)/4U;
  while (cnt > 4U) {
    ARM_MPU_OrderedMemcpy(&(((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR), &(table->RBAR), 4U*rowWordSize);
    table += 4U;
    cnt -= 4U;
  }
  ARM_MPU_OrderedMemcpy(&(((MPU_Type *) ((0xE000E000UL) + 0x0D90UL) )->RBAR), &(table->RBAR), cnt*rowWordSize);
}
# 2176 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 2 3
# 2196 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t SCB_GetFPUType(void)
{
  uint32_t mvfr0;

  mvfr0 = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->MVFR0;
  if ((mvfr0 & ((0xFUL << 4U) | (0xFUL << 8U))) == 0x220U)
  {
    return 2U;
  }
  else if ((mvfr0 & ((0xFUL << 4U) | (0xFUL << 8U))) == 0x020U)
  {
    return 1U;
  }
  else
  {
    return 0U;
  }
}
# 2237 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
__attribute__((always_inline)) static __inline void SCB_EnableICache (void)
{

    if (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR & (1UL << 17U)) return;

    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->ICIALLU = 0UL;
    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR |= (uint32_t)(1UL << 17U);
    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);

}






__attribute__((always_inline)) static __inline void SCB_DisableICache (void)
{

    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR &= ~(uint32_t)(1UL << 17U);
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->ICIALLU = 0UL;
    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);

}






__attribute__((always_inline)) static __inline void SCB_InvalidateICache (void)
{

    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);
    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->ICIALLU = 0UL;
    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);

}






__attribute__((always_inline)) static __inline void SCB_EnableDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    if (((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR & (1UL << 16U)) return;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
    __builtin_arm_dsb(0xF);

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                      ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);
    __builtin_arm_dsb(0xF);

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR |= (uint32_t)(1UL << 16U);

    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);

}






__attribute__((always_inline)) static __inline void SCB_DisableDCache (void)
{

    register uint32_t ccsidr;
    register uint32_t sets;
    register uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
    __builtin_arm_dsb(0xF);

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCR &= ~(uint32_t)(1UL << 16U);
    __builtin_arm_dsb(0xF);

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                       ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);

    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);

}






__attribute__((always_inline)) static __inline void SCB_InvalidateDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
    __builtin_arm_dsb(0xF);

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                      ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);

    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);

}






__attribute__((always_inline)) static __inline void SCB_CleanDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
    __builtin_arm_dsb(0xF);

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCSW = (((sets << 5U) & (0x1FFUL << 5U)) |
                      ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);

    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);

}






__attribute__((always_inline)) static __inline void SCB_CleanInvalidateDCache (void)
{

    uint32_t ccsidr;
    uint32_t sets;
    uint32_t ways;

    ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CSSELR = 0U;
    __builtin_arm_dsb(0xF);

    ccsidr = ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->CCSIDR;


    sets = (uint32_t)((((ccsidr) & (0x7FFFUL << 13U) ) >> 13U ));
    do {
      ways = (uint32_t)((((ccsidr) & (0x3FFUL << 3U)) >> 3U));
      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCISW = (((sets << 5U) & (0x1FFUL << 5U)) |
                       ((ways << 30U) & (3UL << 30U)) );



      } while (ways-- != 0U);
    } while(sets-- != 0U);

    __builtin_arm_dsb(0xF);
    __builtin_arm_isb(0xF);

}
# 2478 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
__attribute__((always_inline)) static __inline void SCB_InvalidateDCache_by_Addr (void *addr, int32_t dsize)
{

    if ( dsize > 0 ) {
       int32_t op_size = dsize + (((uint32_t)addr) & (32U - 1U));
      uint32_t op_addr = (uint32_t)addr ;

      __builtin_arm_dsb(0xF);

      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCIMVAC = op_addr;
        op_addr += 32U;
        op_size -= 32U;
      } while ( op_size > 0 );

      __builtin_arm_dsb(0xF);
      __builtin_arm_isb(0xF);
    }

}
# 2508 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
__attribute__((always_inline)) static __inline void SCB_CleanDCache_by_Addr (uint32_t *addr, int32_t dsize)
{

    if ( dsize > 0 ) {
       int32_t op_size = dsize + (((uint32_t)addr) & (32U - 1U));
      uint32_t op_addr = (uint32_t)addr ;

      __builtin_arm_dsb(0xF);

      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCMVAC = op_addr;
        op_addr += 32U;
        op_size -= 32U;
      } while ( op_size > 0 );

      __builtin_arm_dsb(0xF);
      __builtin_arm_isb(0xF);
    }

}
# 2538 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
__attribute__((always_inline)) static __inline void SCB_CleanInvalidateDCache_by_Addr (uint32_t *addr, int32_t dsize)
{

    if ( dsize > 0 ) {
       int32_t op_size = dsize + (((uint32_t)addr) & (32U - 1U));
      uint32_t op_addr = (uint32_t)addr ;

      __builtin_arm_dsb(0xF);

      do {
        ((SCB_Type *) ((0xE000E000UL) + 0x0D00UL) )->DCCIMVAC = op_addr;
        op_addr += 32U;
        op_size -= 32U;
      } while ( op_size > 0 );

      __builtin_arm_dsb(0xF);
      __builtin_arm_isb(0xF);
    }

}
# 2584 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t SysTick_Config(uint32_t ticks)
{
  if ((ticks - 1UL) > (0xFFFFFFUL ))
  {
    return (1UL);
  }

  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->LOAD = (uint32_t)(ticks - 1UL);
  __NVIC_SetPriority (SysTick_IRQn, (1UL << 4) - 1UL);
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->VAL = 0UL;
  ((SysTick_Type *) ((0xE000E000UL) + 0x0010UL) )->CTRL = (1UL << 2U) |
                   (1UL << 1U) |
                   (1UL );
  return (0UL);
}
# 2614 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
extern volatile int32_t ITM_RxBuffer;
# 2626 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline uint32_t ITM_SendChar (uint32_t ch)
{
  if (((((ITM_Type *) (0xE0000000UL) )->TCR & (1UL )) != 0UL) &&
      ((((ITM_Type *) (0xE0000000UL) )->TER & 1UL ) != 0UL) )
  {
    while (((ITM_Type *) (0xE0000000UL) )->PORT[0U].u32 == 0UL)
    {
      __builtin_arm_nop();
    }
    ((ITM_Type *) (0xE0000000UL) )->PORT[0U].u8 = (uint8_t)ch;
  }
  return (ch);
}
# 2647 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline int32_t ITM_ReceiveChar (void)
{
  int32_t ch = -1;

  if (ITM_RxBuffer != ((int32_t)0x5AA55AA5U))
  {
    ch = ITM_RxBuffer;
    ITM_RxBuffer = ((int32_t)0x5AA55AA5U);
  }

  return (ch);
}
# 2667 "../../libraries/sdk/CMSIS/Include\\core_cm7.h" 3
static __inline int32_t ITM_CheckChar (void)
{

  if (ITM_RxBuffer == ((int32_t)0x5AA55AA5U))
  {
    return (0);
  }
  else
  {
    return (1);
  }
}
# 275 "../../libraries/sdk/deceive/MIMXRT1064.h" 2
# 1 "../../libraries/sdk/deceive/system_MIMXRT1064.h" 1
# 91 "../../libraries/sdk/deceive/system_MIMXRT1064.h"
extern uint32_t SystemCoreClock;
# 100 "../../libraries/sdk/deceive/system_MIMXRT1064.h"
void SystemInit (void);
# 109 "../../libraries/sdk/deceive/system_MIMXRT1064.h"
void SystemCoreClockUpdate (void);
# 121 "../../libraries/sdk/deceive/system_MIMXRT1064.h"
void SystemInitHook (void);
# 276 "../../libraries/sdk/deceive/MIMXRT1064.h" 2
# 305 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef enum _iomuxc_sw_mux_ctl_pad
{
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_00 = 0U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_01 = 1U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_02 = 2U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_03 = 3U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_04 = 4U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_05 = 5U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_06 = 6U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_07 = 7U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_08 = 8U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_09 = 9U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_10 = 10U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_11 = 11U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_12 = 12U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_13 = 13U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_14 = 14U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_15 = 15U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_16 = 16U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_17 = 17U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_18 = 18U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_19 = 19U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_20 = 20U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_21 = 21U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_22 = 22U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_23 = 23U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_24 = 24U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_25 = 25U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_26 = 26U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_27 = 27U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_28 = 28U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_29 = 29U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_30 = 30U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_31 = 31U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_32 = 32U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_33 = 33U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_34 = 34U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_35 = 35U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_36 = 36U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_37 = 37U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_38 = 38U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_39 = 39U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_40 = 40U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_EMC_41 = 41U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_00 = 42U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_01 = 43U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_02 = 44U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_03 = 45U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_04 = 46U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_05 = 47U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_06 = 48U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_07 = 49U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_08 = 50U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_09 = 51U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_10 = 52U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_11 = 53U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_12 = 54U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_13 = 55U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_14 = 56U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B0_15 = 57U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_00 = 58U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_01 = 59U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_02 = 60U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_03 = 61U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_04 = 62U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_05 = 63U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_06 = 64U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_07 = 65U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_08 = 66U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_09 = 67U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_10 = 68U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_11 = 69U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_12 = 70U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_13 = 71U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_14 = 72U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_AD_B1_15 = 73U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_00 = 74U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_01 = 75U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_02 = 76U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_03 = 77U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_04 = 78U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_05 = 79U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_06 = 80U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_07 = 81U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_08 = 82U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_09 = 83U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_10 = 84U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_11 = 85U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_12 = 86U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_13 = 87U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_14 = 88U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B0_15 = 89U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_00 = 90U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_01 = 91U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_02 = 92U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_03 = 93U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_04 = 94U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_05 = 95U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_06 = 96U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_07 = 97U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_08 = 98U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_09 = 99U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_10 = 100U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_11 = 101U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_12 = 102U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_13 = 103U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_14 = 104U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_B1_15 = 105U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B0_00 = 106U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B0_01 = 107U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B0_02 = 108U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B0_03 = 109U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B0_04 = 110U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B0_05 = 111U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B1_00 = 112U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B1_01 = 113U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B1_02 = 114U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B1_03 = 115U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B1_04 = 116U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B1_05 = 117U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B1_06 = 118U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B1_07 = 119U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B1_08 = 120U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B1_09 = 121U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B1_10 = 122U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SD_B1_11 = 123U,
} iomuxc_sw_mux_ctl_pad_t;
# 448 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef enum _iomuxc_sw_mux_ctl_pad_1
{
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B0_00 = 0U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B0_01 = 1U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B0_02 = 2U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B0_03 = 3U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B0_04 = 4U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B0_05 = 5U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B0_06 = 6U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B0_07 = 7U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B0_08 = 8U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B0_09 = 9U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B0_10 = 10U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B0_11 = 11U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B0_12 = 12U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B0_13 = 13U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B1_00 = 14U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B1_01 = 15U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B1_02 = 16U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B1_03 = 17U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B1_04 = 18U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B1_05 = 19U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B1_06 = 20U,
    kIOMUXC_SW_MUX_CTL_PAD_GPIO_SPI_B1_07 = 21U,
} iomuxc_sw_mux_ctl_pad_1_t;
# 489 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef enum _iomuxc_sw_pad_ctl_pad
{
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_00 = 0U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_01 = 1U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_02 = 2U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_03 = 3U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_04 = 4U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_05 = 5U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_06 = 6U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_07 = 7U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_08 = 8U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_09 = 9U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_10 = 10U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_11 = 11U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_12 = 12U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_13 = 13U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_14 = 14U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_15 = 15U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_16 = 16U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_17 = 17U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_18 = 18U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_19 = 19U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_20 = 20U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_21 = 21U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_22 = 22U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_23 = 23U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_24 = 24U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_25 = 25U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_26 = 26U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_27 = 27U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_28 = 28U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_29 = 29U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_30 = 30U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_31 = 31U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_32 = 32U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_33 = 33U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_34 = 34U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_35 = 35U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_36 = 36U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_37 = 37U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_38 = 38U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_39 = 39U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_40 = 40U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_EMC_41 = 41U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_00 = 42U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_01 = 43U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_02 = 44U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_03 = 45U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_04 = 46U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_05 = 47U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_06 = 48U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_07 = 49U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_08 = 50U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_09 = 51U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_10 = 52U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_11 = 53U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_12 = 54U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_13 = 55U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_14 = 56U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B0_15 = 57U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_00 = 58U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_01 = 59U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_02 = 60U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_03 = 61U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_04 = 62U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_05 = 63U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_06 = 64U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_07 = 65U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_08 = 66U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_09 = 67U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_10 = 68U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_11 = 69U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_12 = 70U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_13 = 71U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_14 = 72U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_AD_B1_15 = 73U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_00 = 74U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_01 = 75U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_02 = 76U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_03 = 77U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_04 = 78U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_05 = 79U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_06 = 80U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_07 = 81U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_08 = 82U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_09 = 83U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_10 = 84U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_11 = 85U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_12 = 86U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_13 = 87U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_14 = 88U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B0_15 = 89U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_00 = 90U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_01 = 91U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_02 = 92U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_03 = 93U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_04 = 94U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_05 = 95U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_06 = 96U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_07 = 97U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_08 = 98U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_09 = 99U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_10 = 100U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_11 = 101U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_12 = 102U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_13 = 103U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_14 = 104U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_B1_15 = 105U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B0_00 = 106U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B0_01 = 107U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B0_02 = 108U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B0_03 = 109U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B0_04 = 110U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B0_05 = 111U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B1_00 = 112U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B1_01 = 113U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B1_02 = 114U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B1_03 = 115U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B1_04 = 116U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B1_05 = 117U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B1_06 = 118U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B1_07 = 119U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B1_08 = 120U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B1_09 = 121U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B1_10 = 122U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SD_B1_11 = 123U,
} iomuxc_sw_pad_ctl_pad_t;
# 632 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef enum _iomuxc_sw_pad_ctl_pad_1
{
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B0_00 = 0U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B0_01 = 1U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B0_02 = 2U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B0_03 = 3U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B0_04 = 4U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B0_05 = 5U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B0_06 = 6U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B0_07 = 7U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B0_08 = 8U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B0_09 = 9U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B0_10 = 10U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B0_11 = 11U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B0_12 = 12U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B0_13 = 13U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B1_00 = 14U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B1_01 = 15U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B1_02 = 16U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B1_03 = 17U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B1_04 = 18U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B1_05 = 19U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B1_06 = 20U,
    kIOMUXC_SW_PAD_CTL_PAD_GPIO_SPI_B1_07 = 21U,
} iomuxc_sw_pad_ctl_pad_1_t;
# 665 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef enum _iomuxc_select_input
{
    kIOMUXC_ANATOP_USB_OTG1_ID_SELECT_INPUT = 0U,
    kIOMUXC_ANATOP_USB_OTG2_ID_SELECT_INPUT = 1U,
    kIOMUXC_CCM_PMIC_READY_SELECT_INPUT = 2U,
    kIOMUXC_CSI_DATA02_SELECT_INPUT = 3U,
    kIOMUXC_CSI_DATA03_SELECT_INPUT = 4U,
    kIOMUXC_CSI_DATA04_SELECT_INPUT = 5U,
    kIOMUXC_CSI_DATA05_SELECT_INPUT = 6U,
    kIOMUXC_CSI_DATA06_SELECT_INPUT = 7U,
    kIOMUXC_CSI_DATA07_SELECT_INPUT = 8U,
    kIOMUXC_CSI_DATA08_SELECT_INPUT = 9U,
    kIOMUXC_CSI_DATA09_SELECT_INPUT = 10U,
    kIOMUXC_CSI_HSYNC_SELECT_INPUT = 11U,
    kIOMUXC_CSI_PIXCLK_SELECT_INPUT = 12U,
    kIOMUXC_CSI_VSYNC_SELECT_INPUT = 13U,
    kIOMUXC_ENET_IPG_CLK_RMII_SELECT_INPUT = 14U,
    kIOMUXC_ENET_MDIO_SELECT_INPUT = 15U,
    kIOMUXC_ENET0_RXDATA_SELECT_INPUT = 16U,
    kIOMUXC_ENET1_RXDATA_SELECT_INPUT = 17U,
    kIOMUXC_ENET_RXEN_SELECT_INPUT = 18U,
    kIOMUXC_ENET_RXERR_SELECT_INPUT = 19U,
    kIOMUXC_ENET0_TIMER_SELECT_INPUT = 20U,
    kIOMUXC_ENET_TXCLK_SELECT_INPUT = 21U,
    kIOMUXC_FLEXCAN1_RX_SELECT_INPUT = 22U,
    kIOMUXC_FLEXCAN2_RX_SELECT_INPUT = 23U,
    kIOMUXC_FLEXPWM1_PWMA3_SELECT_INPUT = 24U,
    kIOMUXC_FLEXPWM1_PWMA0_SELECT_INPUT = 25U,
    kIOMUXC_FLEXPWM1_PWMA1_SELECT_INPUT = 26U,
    kIOMUXC_FLEXPWM1_PWMA2_SELECT_INPUT = 27U,
    kIOMUXC_FLEXPWM1_PWMB3_SELECT_INPUT = 28U,
    kIOMUXC_FLEXPWM1_PWMB0_SELECT_INPUT = 29U,
    kIOMUXC_FLEXPWM1_PWMB1_SELECT_INPUT = 30U,
    kIOMUXC_FLEXPWM1_PWMB2_SELECT_INPUT = 31U,
    kIOMUXC_FLEXPWM2_PWMA3_SELECT_INPUT = 32U,
    kIOMUXC_FLEXPWM2_PWMA0_SELECT_INPUT = 33U,
    kIOMUXC_FLEXPWM2_PWMA1_SELECT_INPUT = 34U,
    kIOMUXC_FLEXPWM2_PWMA2_SELECT_INPUT = 35U,
    kIOMUXC_FLEXPWM2_PWMB3_SELECT_INPUT = 36U,
    kIOMUXC_FLEXPWM2_PWMB0_SELECT_INPUT = 37U,
    kIOMUXC_FLEXPWM2_PWMB1_SELECT_INPUT = 38U,
    kIOMUXC_FLEXPWM2_PWMB2_SELECT_INPUT = 39U,
    kIOMUXC_FLEXPWM4_PWMA0_SELECT_INPUT = 40U,
    kIOMUXC_FLEXPWM4_PWMA1_SELECT_INPUT = 41U,
    kIOMUXC_FLEXPWM4_PWMA2_SELECT_INPUT = 42U,
    kIOMUXC_FLEXPWM4_PWMA3_SELECT_INPUT = 43U,
    kIOMUXC_FLEXSPIA_DQS_SELECT_INPUT = 44U,
    kIOMUXC_FLEXSPIA_DATA0_SELECT_INPUT = 45U,
    kIOMUXC_FLEXSPIA_DATA1_SELECT_INPUT = 46U,
    kIOMUXC_FLEXSPIA_DATA2_SELECT_INPUT = 47U,
    kIOMUXC_FLEXSPIA_DATA3_SELECT_INPUT = 48U,
    kIOMUXC_FLEXSPIB_DATA0_SELECT_INPUT = 49U,
    kIOMUXC_FLEXSPIB_DATA1_SELECT_INPUT = 50U,
    kIOMUXC_FLEXSPIB_DATA2_SELECT_INPUT = 51U,
    kIOMUXC_FLEXSPIB_DATA3_SELECT_INPUT = 52U,
    kIOMUXC_FLEXSPIA_SCK_SELECT_INPUT = 53U,
    kIOMUXC_LPI2C1_SCL_SELECT_INPUT = 54U,
    kIOMUXC_LPI2C1_SDA_SELECT_INPUT = 55U,
    kIOMUXC_LPI2C2_SCL_SELECT_INPUT = 56U,
    kIOMUXC_LPI2C2_SDA_SELECT_INPUT = 57U,
    kIOMUXC_LPI2C3_SCL_SELECT_INPUT = 58U,
    kIOMUXC_LPI2C3_SDA_SELECT_INPUT = 59U,
    kIOMUXC_LPI2C4_SCL_SELECT_INPUT = 60U,
    kIOMUXC_LPI2C4_SDA_SELECT_INPUT = 61U,
    kIOMUXC_LPSPI1_PCS0_SELECT_INPUT = 62U,
    kIOMUXC_LPSPI1_SCK_SELECT_INPUT = 63U,
    kIOMUXC_LPSPI1_SDI_SELECT_INPUT = 64U,
    kIOMUXC_LPSPI1_SDO_SELECT_INPUT = 65U,
    kIOMUXC_LPSPI2_PCS0_SELECT_INPUT = 66U,
    kIOMUXC_LPSPI2_SCK_SELECT_INPUT = 67U,
    kIOMUXC_LPSPI2_SDI_SELECT_INPUT = 68U,
    kIOMUXC_LPSPI2_SDO_SELECT_INPUT = 69U,
    kIOMUXC_LPSPI3_PCS0_SELECT_INPUT = 70U,
    kIOMUXC_LPSPI3_SCK_SELECT_INPUT = 71U,
    kIOMUXC_LPSPI3_SDI_SELECT_INPUT = 72U,
    kIOMUXC_LPSPI3_SDO_SELECT_INPUT = 73U,
    kIOMUXC_LPSPI4_PCS0_SELECT_INPUT = 74U,
    kIOMUXC_LPSPI4_SCK_SELECT_INPUT = 75U,
    kIOMUXC_LPSPI4_SDI_SELECT_INPUT = 76U,
    kIOMUXC_LPSPI4_SDO_SELECT_INPUT = 77U,
    kIOMUXC_LPUART2_RX_SELECT_INPUT = 78U,
    kIOMUXC_LPUART2_TX_SELECT_INPUT = 79U,
    kIOMUXC_LPUART3_CTS_B_SELECT_INPUT = 80U,
    kIOMUXC_LPUART3_RX_SELECT_INPUT = 81U,
    kIOMUXC_LPUART3_TX_SELECT_INPUT = 82U,
    kIOMUXC_LPUART4_RX_SELECT_INPUT = 83U,
    kIOMUXC_LPUART4_TX_SELECT_INPUT = 84U,
    kIOMUXC_LPUART5_RX_SELECT_INPUT = 85U,
    kIOMUXC_LPUART5_TX_SELECT_INPUT = 86U,
    kIOMUXC_LPUART6_RX_SELECT_INPUT = 87U,
    kIOMUXC_LPUART6_TX_SELECT_INPUT = 88U,
    kIOMUXC_LPUART7_RX_SELECT_INPUT = 89U,
    kIOMUXC_LPUART7_TX_SELECT_INPUT = 90U,
    kIOMUXC_LPUART8_RX_SELECT_INPUT = 91U,
    kIOMUXC_LPUART8_TX_SELECT_INPUT = 92U,
    kIOMUXC_NMI_SELECT_INPUT = 93U,
    kIOMUXC_QTIMER2_TIMER0_SELECT_INPUT = 94U,
    kIOMUXC_QTIMER2_TIMER1_SELECT_INPUT = 95U,
    kIOMUXC_QTIMER2_TIMER2_SELECT_INPUT = 96U,
    kIOMUXC_QTIMER2_TIMER3_SELECT_INPUT = 97U,
    kIOMUXC_QTIMER3_TIMER0_SELECT_INPUT = 98U,
    kIOMUXC_QTIMER3_TIMER1_SELECT_INPUT = 99U,
    kIOMUXC_QTIMER3_TIMER2_SELECT_INPUT = 100U,
    kIOMUXC_QTIMER3_TIMER3_SELECT_INPUT = 101U,
    kIOMUXC_SAI1_MCLK2_SELECT_INPUT = 102U,
    kIOMUXC_SAI1_RX_BCLK_SELECT_INPUT = 103U,
    kIOMUXC_SAI1_RX_DATA0_SELECT_INPUT = 104U,
    kIOMUXC_SAI1_RX_DATA1_SELECT_INPUT = 105U,
    kIOMUXC_SAI1_RX_DATA2_SELECT_INPUT = 106U,
    kIOMUXC_SAI1_RX_DATA3_SELECT_INPUT = 107U,
    kIOMUXC_SAI1_RX_SYNC_SELECT_INPUT = 108U,
    kIOMUXC_SAI1_TX_BCLK_SELECT_INPUT = 109U,
    kIOMUXC_SAI1_TX_SYNC_SELECT_INPUT = 110U,
    kIOMUXC_SAI2_MCLK2_SELECT_INPUT = 111U,
    kIOMUXC_SAI2_RX_BCLK_SELECT_INPUT = 112U,
    kIOMUXC_SAI2_RX_DATA0_SELECT_INPUT = 113U,
    kIOMUXC_SAI2_RX_SYNC_SELECT_INPUT = 114U,
    kIOMUXC_SAI2_TX_BCLK_SELECT_INPUT = 115U,
    kIOMUXC_SAI2_TX_SYNC_SELECT_INPUT = 116U,
    kIOMUXC_SPDIF_IN_SELECT_INPUT = 117U,
    kIOMUXC_USB_OTG2_OC_SELECT_INPUT = 118U,
    kIOMUXC_USB_OTG1_OC_SELECT_INPUT = 119U,
    kIOMUXC_USDHC1_CD_B_SELECT_INPUT = 120U,
    kIOMUXC_USDHC1_WP_SELECT_INPUT = 121U,
    kIOMUXC_USDHC2_CLK_SELECT_INPUT = 122U,
    kIOMUXC_USDHC2_CD_B_SELECT_INPUT = 123U,
    kIOMUXC_USDHC2_CMD_SELECT_INPUT = 124U,
    kIOMUXC_USDHC2_DATA0_SELECT_INPUT = 125U,
    kIOMUXC_USDHC2_DATA1_SELECT_INPUT = 126U,
    kIOMUXC_USDHC2_DATA2_SELECT_INPUT = 127U,
    kIOMUXC_USDHC2_DATA3_SELECT_INPUT = 128U,
    kIOMUXC_USDHC2_DATA4_SELECT_INPUT = 129U,
    kIOMUXC_USDHC2_DATA5_SELECT_INPUT = 130U,
    kIOMUXC_USDHC2_DATA6_SELECT_INPUT = 131U,
    kIOMUXC_USDHC2_DATA7_SELECT_INPUT = 132U,
    kIOMUXC_USDHC2_WP_SELECT_INPUT = 133U,
    kIOMUXC_XBAR1_IN02_SELECT_INPUT = 134U,
    kIOMUXC_XBAR1_IN03_SELECT_INPUT = 135U,
    kIOMUXC_XBAR1_IN04_SELECT_INPUT = 136U,
    kIOMUXC_XBAR1_IN05_SELECT_INPUT = 137U,
    kIOMUXC_XBAR1_IN06_SELECT_INPUT = 138U,
    kIOMUXC_XBAR1_IN07_SELECT_INPUT = 139U,
    kIOMUXC_XBAR1_IN08_SELECT_INPUT = 140U,
    kIOMUXC_XBAR1_IN09_SELECT_INPUT = 141U,
    kIOMUXC_XBAR1_IN17_SELECT_INPUT = 142U,
    kIOMUXC_XBAR1_IN18_SELECT_INPUT = 143U,
    kIOMUXC_XBAR1_IN20_SELECT_INPUT = 144U,
    kIOMUXC_XBAR1_IN22_SELECT_INPUT = 145U,
    kIOMUXC_XBAR1_IN23_SELECT_INPUT = 146U,
    kIOMUXC_XBAR1_IN24_SELECT_INPUT = 147U,
    kIOMUXC_XBAR1_IN14_SELECT_INPUT = 148U,
    kIOMUXC_XBAR1_IN15_SELECT_INPUT = 149U,
    kIOMUXC_XBAR1_IN16_SELECT_INPUT = 150U,
    kIOMUXC_XBAR1_IN25_SELECT_INPUT = 151U,
    kIOMUXC_XBAR1_IN19_SELECT_INPUT = 152U,
    kIOMUXC_XBAR1_IN21_SELECT_INPUT = 153U,
} iomuxc_select_input_t;






typedef enum _iomuxc_select_input_1
{
    kIOMUXC_ENET2_IPG_CLK_RMII_SELECT_INPUT = 0U,
    kIOMUXC_ENET2_IPP_IND_MAC0_MDIO_SELECT_INPUT = 1U,
    kIOMUXC_ENET2_IPP_IND_MAC0_RXDATA_SELECT_INPUT_0 = 2U,
    kIOMUXC_ENET2_IPP_IND_MAC0_RXDATA_SELECT_INPUT_1 = 3U,
    kIOMUXC_ENET2_IPP_IND_MAC0_RXEN_SELECT_INPUT = 4U,
    kIOMUXC_ENET2_IPP_IND_MAC0_RXERR_SELECT_INPUT = 5U,
    kIOMUXC_ENET2_IPP_IND_MAC0_TIMER_SELECT_INPUT_0 = 6U,
    kIOMUXC_ENET2_IPP_IND_MAC0_TXCLK_SELECT_INPUT = 7U,
    kIOMUXC_GPT1_IPP_IND_CAPIN1_SELECT_INPUT = 19U,
    kIOMUXC_GPT1_IPP_IND_CAPIN2_SELECT_INPUT = 20U,
    kIOMUXC_GPT1_IPP_IND_CLKIN_SELECT_INPUT = 21U,
    kIOMUXC_GPT2_IPP_IND_CAPIN1_SELECT_INPUT = 22U,
    kIOMUXC_GPT2_IPP_IND_CAPIN2_SELECT_INPUT = 23U,
    kIOMUXC_GPT2_IPP_IND_CLKIN_SELECT_INPUT = 24U,
    kIOMUXC_SAI3_IPG_CLK_SAI_MCLK_SELECT_INPUT_2 = 25U,
    kIOMUXC_SAI3_IPP_IND_SAI_RXBCLK_SELECT_INPUT = 26U,
    kIOMUXC_SAI3_IPP_IND_SAI_RXDATA_SELECT_INPUT_0 = 27U,
    kIOMUXC_SAI3_IPP_IND_SAI_RXSYNC_SELECT_INPUT = 28U,
    kIOMUXC_SAI3_IPP_IND_SAI_TXBCLK_SELECT_INPUT = 29U,
    kIOMUXC_SAI3_IPP_IND_SAI_TXSYNC_SELECT_INPUT = 30U,
    kIOMUXC_SEMC_I_IPP_IND_DQS4_SELECT_INPUT = 31U,
    kIOMUXC_CANFD_IPP_IND_CANRX_SELECT_INPUT = 32U,
} iomuxc_select_input_1_t;

typedef enum _xbar_input_signal
{
    kXBARA1_InputLogicLow = 0|0x100U,
    kXBARA1_InputLogicHigh = 1|0x100U,
    kXBARA1_InputIomuxXbarIn02 = 2|0x100U,
    kXBARA1_InputIomuxXbarIn03 = 3|0x100U,
    kXBARA1_InputIomuxXbarInout04 = 4|0x100U,
    kXBARA1_InputIomuxXbarInout05 = 5|0x100U,
    kXBARA1_InputIomuxXbarInout06 = 6|0x100U,
    kXBARA1_InputIomuxXbarInout07 = 7|0x100U,
    kXBARA1_InputIomuxXbarInout08 = 8|0x100U,
    kXBARA1_InputIomuxXbarInout09 = 9|0x100U,
    kXBARA1_InputIomuxXbarInout10 = 10|0x100U,
    kXBARA1_InputIomuxXbarInout11 = 11|0x100U,
    kXBARA1_InputIomuxXbarInout12 = 12|0x100U,
    kXBARA1_InputIomuxXbarInout13 = 13|0x100U,
    kXBARA1_InputIomuxXbarInout14 = 14|0x100U,
    kXBARA1_InputIomuxXbarInout15 = 15|0x100U,
    kXBARA1_InputIomuxXbarInout16 = 16|0x100U,
    kXBARA1_InputIomuxXbarInout17 = 17|0x100U,
    kXBARA1_InputIomuxXbarInout18 = 18|0x100U,
    kXBARA1_InputIomuxXbarInout19 = 19|0x100U,
    kXBARA1_InputIomuxXbarIn20 = 20|0x100U,
    kXBARA1_InputIomuxXbarIn21 = 21|0x100U,
    kXBARA1_InputIomuxXbarIn22 = 22|0x100U,
    kXBARA1_InputIomuxXbarIn23 = 23|0x100U,
    kXBARA1_InputIomuxXbarIn24 = 24|0x100U,
    kXBARA1_InputIomuxXbarIn25 = 25|0x100U,
    kXBARA1_InputAcmp1Out = 26|0x100U,
    kXBARA1_InputAcmp2Out = 27|0x100U,
    kXBARA1_InputAcmp3Out = 28|0x100U,
    kXBARA1_InputAcmp4Out = 29|0x100U,
    kXBARA1_InputRESERVED30 = 30|0x100U,
    kXBARA1_InputRESERVED31 = 31|0x100U,
    kXBARA1_InputQtimer3Tmr0Output = 32|0x100U,
    kXBARA1_InputQtimer3Tmr1Output = 33|0x100U,
    kXBARA1_InputQtimer3Tmr2Output = 34|0x100U,
    kXBARA1_InputQtimer3Tmr3Output = 35|0x100U,
    kXBARA1_InputQtimer4Tmr0Output = 36|0x100U,
    kXBARA1_InputQtimer4Tmr1Output = 37|0x100U,
    kXBARA1_InputQtimer4Tmr2Output = 38|0x100U,
    kXBARA1_InputQtimer4Tmr3Output = 39|0x100U,
    kXBARA1_InputFlexpwm1Pwm1OutTrig01 = 40|0x100U,
    kXBARA1_InputFlexpwm1Pwm2OutTrig01 = 41|0x100U,
    kXBARA1_InputFlexpwm1Pwm3OutTrig01 = 42|0x100U,
    kXBARA1_InputFlexpwm1Pwm4OutTrig01 = 43|0x100U,
    kXBARA1_InputFlexpwm2Pwm1OutTrig01 = 44|0x100U,
    kXBARA1_InputFlexpwm2Pwm2OutTrig01 = 45|0x100U,
    kXBARA1_InputFlexpwm2Pwm3OutTrig01 = 46|0x100U,
    kXBARA1_InputFlexpwm2Pwm4OutTrig01 = 47|0x100U,
    kXBARA1_InputFlexpwm3Pwm1OutTrig01 = 48|0x100U,
    kXBARA1_InputFlexpwm3Pwm2OutTrig01 = 49|0x100U,
    kXBARA1_InputFlexpwm3Pwm3OutTrig01 = 50|0x100U,
    kXBARA1_InputFlexpwm3Pwm4OutTrig01 = 51|0x100U,
    kXBARA1_InputFlexpwm4Pwm1OutTrig01 = 52|0x100U,
    kXBARA1_InputFlexpwm4Pwm2OutTrig01 = 53|0x100U,
    kXBARA1_InputFlexpwm4Pwm3OutTrig01 = 54|0x100U,
    kXBARA1_InputFlexpwm4Pwm4OutTrig01 = 55|0x100U,
    kXBARA1_InputPitTrigger0 = 56|0x100U,
    kXBARA1_InputPitTrigger1 = 57|0x100U,
    kXBARA1_InputPitTrigger2 = 58|0x100U,
    kXBARA1_InputPitTrigger3 = 59|0x100U,
    kXBARA1_InputEnc1PosMatch = 60|0x100U,
    kXBARA1_InputEnc2PosMatch = 61|0x100U,
    kXBARA1_InputEnc3PosMatch = 62|0x100U,
    kXBARA1_InputEnc4PosMatch = 63|0x100U,
    kXBARA1_InputDmaDone0 = 64|0x100U,
    kXBARA1_InputDmaDone1 = 65|0x100U,
    kXBARA1_InputDmaDone2 = 66|0x100U,
    kXBARA1_InputDmaDone3 = 67|0x100U,
    kXBARA1_InputDmaDone4 = 68|0x100U,
    kXBARA1_InputDmaDone5 = 69|0x100U,
    kXBARA1_InputDmaDone6 = 70|0x100U,
    kXBARA1_InputDmaDone7 = 71|0x100U,
    kXBARA1_InputAoi1Out0 = 72|0x100U,
    kXBARA1_InputAoi1Out1 = 73|0x100U,
    kXBARA1_InputAoi1Out2 = 74|0x100U,
    kXBARA1_InputAoi1Out3 = 75|0x100U,
    kXBARA1_InputAoi2Out0 = 76|0x100U,
    kXBARA1_InputAoi2Out1 = 77|0x100U,
    kXBARA1_InputAoi2Out2 = 78|0x100U,
    kXBARA1_InputAoi2Out3 = 79|0x100U,
    kXBARA1_InputAdcEtcXbar0Coco0 = 80|0x100U,
    kXBARA1_InputAdcEtcXbar0Coco1 = 81|0x100U,
    kXBARA1_InputAdcEtcXbar0Coco2 = 82|0x100U,
    kXBARA1_InputAdcEtcXbar0Coco3 = 83|0x100U,
    kXBARA1_InputAdcEtcXbar1Coco0 = 84|0x100U,
    kXBARA1_InputAdcEtcXbar1Coco1 = 85|0x100U,
    kXBARA1_InputAdcEtcXbar1Coco2 = 86|0x100U,
    kXBARA1_InputAdcEtcXbar1Coco3 = 87|0x100U,
    kXBARB2_InputLogicLow = 0|0x200U,
    kXBARB2_InputLogicHigh = 1|0x200U,
    kXBARB2_InputRESERVED2 = 2|0x200U,
    kXBARB2_InputRESERVED3 = 3|0x200U,
    kXBARB2_InputRESERVED4 = 4|0x200U,
    kXBARB2_InputRESERVED5 = 5|0x200U,
    kXBARB2_InputAcmp1Out = 6|0x200U,
    kXBARB2_InputAcmp2Out = 7|0x200U,
    kXBARB2_InputAcmp3Out = 8|0x200U,
    kXBARB2_InputAcmp4Out = 9|0x200U,
    kXBARB2_InputRESERVED10 = 10|0x200U,
    kXBARB2_InputRESERVED11 = 11|0x200U,
    kXBARB2_InputQtimer3Tmr0Output = 12|0x200U,
    kXBARB2_InputQtimer3Tmr1Output = 13|0x200U,
    kXBARB2_InputQtimer3Tmr2Output = 14|0x200U,
    kXBARB2_InputQtimer3Tmr3Output = 15|0x200U,
    kXBARB2_InputQtimer4Tmr0Output = 16|0x200U,
    kXBARB2_InputQtimer4Tmr1Output = 17|0x200U,
    kXBARB2_InputQtimer4Tmr2Output = 18|0x200U,
    kXBARB2_InputQtimer4Tmr3Output = 19|0x200U,
    kXBARB2_InputFlexpwm1Pwm1OutTrig01 = 20|0x200U,
    kXBARB2_InputFlexpwm1Pwm2OutTrig01 = 21|0x200U,
    kXBARB2_InputFlexpwm1Pwm3OutTrig01 = 22|0x200U,
    kXBARB2_InputFlexpwm1Pwm4OutTrig01 = 23|0x200U,
    kXBARB2_InputFlexpwm2Pwm1OutTrig01 = 24|0x200U,
    kXBARB2_InputFlexpwm2Pwm2OutTrig01 = 25|0x200U,
    kXBARB2_InputFlexpwm2Pwm3OutTrig01 = 26|0x200U,
    kXBARB2_InputFlexpwm2Pwm4OutTrig01 = 27|0x200U,
    kXBARB2_InputFlexpwm3Pwm1OutTrig01 = 28|0x200U,
    kXBARB2_InputFlexpwm3Pwm2OutTrig01 = 29|0x200U,
    kXBARB2_InputFlexpwm3Pwm3OutTrig01 = 30|0x200U,
    kXBARB2_InputFlexpwm3Pwm4OutTrig01 = 31|0x200U,
    kXBARB2_InputFlexpwm4Pwm1OutTrig01 = 32|0x200U,
    kXBARB2_InputFlexpwm4Pwm2OutTrig01 = 33|0x200U,
    kXBARB2_InputFlexpwm4Pwm3OutTrig01 = 34|0x200U,
    kXBARB2_InputFlexpwm4Pwm4OutTrig01 = 35|0x200U,
    kXBARB2_InputPitTrigger0 = 36|0x200U,
    kXBARB2_InputPitTrigger1 = 37|0x200U,
    kXBARB2_InputAdcEtcXbar0Coco0 = 38|0x200U,
    kXBARB2_InputAdcEtcXbar0Coco1 = 39|0x200U,
    kXBARB2_InputAdcEtcXbar0Coco2 = 40|0x200U,
    kXBARB2_InputAdcEtcXbar0Coco3 = 41|0x200U,
    kXBARB2_InputAdcEtcXbar1Coco0 = 42|0x200U,
    kXBARB2_InputAdcEtcXbar1Coco1 = 43|0x200U,
    kXBARB2_InputAdcEtcXbar1Coco2 = 44|0x200U,
    kXBARB2_InputAdcEtcXbar1Coco3 = 45|0x200U,
    kXBARB2_InputEnc1PosMatch = 46|0x200U,
    kXBARB2_InputEnc2PosMatch = 47|0x200U,
    kXBARB2_InputEnc3PosMatch = 48|0x200U,
    kXBARB2_InputEnc4PosMatch = 49|0x200U,
    kXBARB2_InputDmaDone0 = 50|0x200U,
    kXBARB2_InputDmaDone1 = 51|0x200U,
    kXBARB2_InputDmaDone2 = 52|0x200U,
    kXBARB2_InputDmaDone3 = 53|0x200U,
    kXBARB2_InputDmaDone4 = 54|0x200U,
    kXBARB2_InputDmaDone5 = 55|0x200U,
    kXBARB2_InputDmaDone6 = 56|0x200U,
    kXBARB2_InputDmaDone7 = 57|0x200U,
    kXBARB3_InputLogicLow = 0|0x300U,
    kXBARB3_InputLogicHigh = 1|0x300U,
    kXBARB3_InputRESERVED2 = 2|0x300U,
    kXBARB3_InputRESERVED3 = 3|0x300U,
    kXBARB3_InputRESERVED4 = 4|0x300U,
    kXBARB3_InputRESERVED5 = 5|0x300U,
    kXBARB3_InputAcmp1Out = 6|0x300U,
    kXBARB3_InputAcmp2Out = 7|0x300U,
    kXBARB3_InputAcmp3Out = 8|0x300U,
    kXBARB3_InputAcmp4Out = 9|0x300U,
    kXBARB3_InputRESERVED10 = 10|0x300U,
    kXBARB3_InputRESERVED11 = 11|0x300U,
    kXBARB3_InputQtimer3Tmr0Output = 12|0x300U,
    kXBARB3_InputQtimer3Tmr1Output = 13|0x300U,
    kXBARB3_InputQtimer3Tmr2Output = 14|0x300U,
    kXBARB3_InputQtimer3Tmr3Output = 15|0x300U,
    kXBARB3_InputQtimer4Tmr0Output = 16|0x300U,
    kXBARB3_InputQtimer4Tmr1Output = 17|0x300U,
    kXBARB3_InputQtimer4Tmr2Output = 18|0x300U,
    kXBARB3_InputQtimer4Tmr3Output = 19|0x300U,
    kXBARB3_InputFlexpwm1Pwm1OutTrig01 = 20|0x300U,
    kXBARB3_InputFlexpwm1Pwm2OutTrig01 = 21|0x300U,
    kXBARB3_InputFlexpwm1Pwm3OutTrig01 = 22|0x300U,
    kXBARB3_InputFlexpwm1Pwm4OutTrig01 = 23|0x300U,
    kXBARB3_InputFlexpwm2Pwm1OutTrig01 = 24|0x300U,
    kXBARB3_InputFlexpwm2Pwm2OutTrig01 = 25|0x300U,
    kXBARB3_InputFlexpwm2Pwm3OutTrig01 = 26|0x300U,
    kXBARB3_InputFlexpwm2Pwm4OutTrig01 = 27|0x300U,
    kXBARB3_InputFlexpwm3Pwm1OutTrig01 = 28|0x300U,
    kXBARB3_InputFlexpwm3Pwm2OutTrig01 = 29|0x300U,
    kXBARB3_InputFlexpwm3Pwm3OutTrig01 = 30|0x300U,
    kXBARB3_InputFlexpwm3Pwm4OutTrig01 = 31|0x300U,
    kXBARB3_InputFlexpwm4Pwm1OutTrig01 = 32|0x300U,
    kXBARB3_InputFlexpwm4Pwm2OutTrig01 = 33|0x300U,
    kXBARB3_InputFlexpwm4Pwm3OutTrig01 = 34|0x300U,
    kXBARB3_InputFlexpwm4Pwm4OutTrig01 = 35|0x300U,
    kXBARB3_InputPitTrigger0 = 36|0x300U,
    kXBARB3_InputPitTrigger1 = 37|0x300U,
    kXBARB3_InputAdcEtcXbar0Coco0 = 38|0x300U,
    kXBARB3_InputAdcEtcXbar0Coco1 = 39|0x300U,
    kXBARB3_InputAdcEtcXbar0Coco2 = 40|0x300U,
    kXBARB3_InputAdcEtcXbar0Coco3 = 41|0x300U,
    kXBARB3_InputAdcEtcXbar1Coco0 = 42|0x300U,
    kXBARB3_InputAdcEtcXbar1Coco1 = 43|0x300U,
    kXBARB3_InputAdcEtcXbar1Coco2 = 44|0x300U,
    kXBARB3_InputAdcEtcXbar1Coco3 = 45|0x300U,
    kXBARB3_InputEnc1PosMatch = 46|0x300U,
    kXBARB3_InputEnc2PosMatch = 47|0x300U,
    kXBARB3_InputEnc3PosMatch = 48|0x300U,
    kXBARB3_InputEnc4PosMatch = 49|0x300U,
    kXBARB3_InputDmaDone0 = 50|0x300U,
    kXBARB3_InputDmaDone1 = 51|0x300U,
    kXBARB3_InputDmaDone2 = 52|0x300U,
    kXBARB3_InputDmaDone3 = 53|0x300U,
    kXBARB3_InputDmaDone4 = 54|0x300U,
    kXBARB3_InputDmaDone5 = 55|0x300U,
    kXBARB3_InputDmaDone6 = 56|0x300U,
    kXBARB3_InputDmaDone7 = 57|0x300U,
} xbar_input_signal_t;

typedef enum _xbar_output_signal
{
    kXBARA1_OutputDmaChMuxReq30 = 0|0x100U,
    kXBARA1_OutputDmaChMuxReq31 = 1|0x100U,
    kXBARA1_OutputDmaChMuxReq94 = 2|0x100U,
    kXBARA1_OutputDmaChMuxReq95 = 3|0x100U,
    kXBARA1_OutputIomuxXbarInout04 = 4|0x100U,
    kXBARA1_OutputIomuxXbarInout05 = 5|0x100U,
    kXBARA1_OutputIomuxXbarInout06 = 6|0x100U,
    kXBARA1_OutputIomuxXbarInout07 = 7|0x100U,
    kXBARA1_OutputIomuxXbarInout08 = 8|0x100U,
    kXBARA1_OutputIomuxXbarInout09 = 9|0x100U,
    kXBARA1_OutputIomuxXbarInout10 = 10|0x100U,
    kXBARA1_OutputIomuxXbarInout11 = 11|0x100U,
    kXBARA1_OutputIomuxXbarInout12 = 12|0x100U,
    kXBARA1_OutputIomuxXbarInout13 = 13|0x100U,
    kXBARA1_OutputIomuxXbarInout14 = 14|0x100U,
    kXBARA1_OutputIomuxXbarInout15 = 15|0x100U,
    kXBARA1_OutputIomuxXbarInout16 = 16|0x100U,
    kXBARA1_OutputIomuxXbarInout17 = 17|0x100U,
    kXBARA1_OutputIomuxXbarInout18 = 18|0x100U,
    kXBARA1_OutputIomuxXbarInout19 = 19|0x100U,
    kXBARA1_OutputAcmp1Sample = 20|0x100U,
    kXBARA1_OutputAcmp2Sample = 21|0x100U,
    kXBARA1_OutputAcmp3Sample = 22|0x100U,
    kXBARA1_OutputAcmp4Sample = 23|0x100U,
    kXBARA1_OutputRESERVED24 = 24|0x100U,
    kXBARA1_OutputRESERVED25 = 25|0x100U,
    kXBARA1_OutputFlexpwm1Exta0 = 26|0x100U,
    kXBARA1_OutputFlexpwm1Exta1 = 27|0x100U,
    kXBARA1_OutputFlexpwm1Exta2 = 28|0x100U,
    kXBARA1_OutputFlexpwm1Exta3 = 29|0x100U,
    kXBARA1_OutputFlexpwm1ExtSync0 = 30|0x100U,
    kXBARA1_OutputFlexpwm1ExtSync1 = 31|0x100U,
    kXBARA1_OutputFlexpwm1ExtSync2 = 32|0x100U,
    kXBARA1_OutputFlexpwm1ExtSync3 = 33|0x100U,
    kXBARA1_OutputFlexpwm1ExtClk = 34|0x100U,
    kXBARA1_OutputFlexpwm1Fault0 = 35|0x100U,
    kXBARA1_OutputFlexpwm1Fault1 = 36|0x100U,
    kXBARA1_OutputFlexpwm1234Fault2 = 37|0x100U,
    kXBARA1_OutputFlexpwm1234Fault3 = 38|0x100U,
    kXBARA1_OutputFlexpwm1ExtForce = 39|0x100U,
    kXBARA1_OutputFlexpwm234Exta0 = 40|0x100U,
    kXBARA1_OutputFlexpwm234Exta1 = 41|0x100U,
    kXBARA1_OutputFlexpwm234Exta2 = 42|0x100U,
    kXBARA1_OutputFlexpwm234Exta3 = 43|0x100U,
    kXBARA1_OutputFlexpwm2ExtSync0 = 44|0x100U,
    kXBARA1_OutputFlexpwm2ExtSync1 = 45|0x100U,
    kXBARA1_OutputFlexpwm2ExtSync2 = 46|0x100U,
    kXBARA1_OutputFlexpwm2ExtSync3 = 47|0x100U,
    kXBARA1_OutputFlexpwm234ExtClk = 48|0x100U,
    kXBARA1_OutputFlexpwm2Fault0 = 49|0x100U,
    kXBARA1_OutputFlexpwm2Fault1 = 50|0x100U,
    kXBARA1_OutputFlexpwm2ExtForce = 51|0x100U,
    kXBARA1_OutputFlexpwm3ExtSync0 = 52|0x100U,
    kXBARA1_OutputFlexpwm3ExtSync1 = 53|0x100U,
    kXBARA1_OutputFlexpwm3ExtSync2 = 54|0x100U,
    kXBARA1_OutputFlexpwm3ExtSync3 = 55|0x100U,
    kXBARA1_OutputFlexpwm3Fault0 = 56|0x100U,
    kXBARA1_OutputFlexpwm3Fault1 = 57|0x100U,
    kXBARA1_OutputFlexpwm3ExtForce = 58|0x100U,
    kXBARA1_OutputFlexpwm4ExtSync0 = 59|0x100U,
    kXBARA1_OutputFlexpwm4ExtSync1 = 60|0x100U,
    kXBARA1_OutputFlexpwm4ExtSync2 = 61|0x100U,
    kXBARA1_OutputFlexpwm4ExtSync3 = 62|0x100U,
    kXBARA1_OutputFlexpwm4Fault0 = 63|0x100U,
    kXBARA1_OutputFlexpwm4Fault1 = 64|0x100U,
    kXBARA1_OutputFlexpwm4ExtForce = 65|0x100U,
    kXBARA1_OutputEnc1PhaseAInput = 66|0x100U,
    kXBARA1_OutputEnc1PhaseBInput = 67|0x100U,
    kXBARA1_OutputEnc1Index = 68|0x100U,
    kXBARA1_OutputEnc1Home = 69|0x100U,
    kXBARA1_OutputEnc1Trigger = 70|0x100U,
    kXBARA1_OutputEnc2PhaseAInput = 71|0x100U,
    kXBARA1_OutputEnc2PhaseBInput = 72|0x100U,
    kXBARA1_OutputEnc2Index = 73|0x100U,
    kXBARA1_OutputEnc2Home = 74|0x100U,
    kXBARA1_OutputEnc2Trigger = 75|0x100U,
    kXBARA1_OutputEnc3PhaseAInput = 76|0x100U,
    kXBARA1_OutputEnc3PhaseBInput = 77|0x100U,
    kXBARA1_OutputEnc3Index = 78|0x100U,
    kXBARA1_OutputEnc3Home = 79|0x100U,
    kXBARA1_OutputEnc3Trigger = 80|0x100U,
    kXBARA1_OutputEnc4PhaseAInput = 81|0x100U,
    kXBARA1_OutputEnc4PhaseBInput = 82|0x100U,
    kXBARA1_OutputEnc4Index = 83|0x100U,
    kXBARA1_OutputEnc4Home = 84|0x100U,
    kXBARA1_OutputEnc4Trigger = 85|0x100U,
    kXBARA1_OutputQtimer1Tmr0Input = 86|0x100U,
    kXBARA1_OutputQtimer1Tmr1Input = 87|0x100U,
    kXBARA1_OutputQtimer1Tmr2Input = 88|0x100U,
    kXBARA1_OutputQtimer1Tmr3Input = 89|0x100U,
    kXBARA1_OutputQtimer2Tmr0Input = 90|0x100U,
    kXBARA1_OutputQtimer2Tmr1Input = 91|0x100U,
    kXBARA1_OutputQtimer2Tmr2Input = 92|0x100U,
    kXBARA1_OutputQtimer2Tmr3Input = 93|0x100U,
    kXBARA1_OutputQtimer3Tmr0Input = 94|0x100U,
    kXBARA1_OutputQtimer3Tmr1Input = 95|0x100U,
    kXBARA1_OutputQtimer3Tmr2Input = 96|0x100U,
    kXBARA1_OutputQtimer3Tmr3Input = 97|0x100U,
    kXBARA1_OutputQtimer4Tmr0Input = 98|0x100U,
    kXBARA1_OutputQtimer4Tmr1Input = 99|0x100U,
    kXBARA1_OutputQtimer4Tmr2Input = 100|0x100U,
    kXBARA1_OutputQtimer4Tmr3Input = 101|0x100U,
    kXBARA1_OutputEwmEwmIn = 102|0x100U,
    kXBARA1_OutputAdcEtcXbar0Trig0 = 103|0x100U,
    kXBARA1_OutputAdcEtcXbar0Trig1 = 104|0x100U,
    kXBARA1_OutputAdcEtcXbar0Trig2 = 105|0x100U,
    kXBARA1_OutputAdcEtcXbar0Trig3 = 106|0x100U,
    kXBARA1_OutputAdcEtcXbar1Trig0 = 107|0x100U,
    kXBARA1_OutputAdcEtcXbar1Trig1 = 108|0x100U,
    kXBARA1_OutputAdcEtcXbar1Trig2 = 109|0x100U,
    kXBARA1_OutputAdcEtcXbar1Trig3 = 110|0x100U,
    kXBARA1_OutputLpi2c1TrgInput = 111|0x100U,
    kXBARA1_OutputLpi2c2TrgInput = 112|0x100U,
    kXBARA1_OutputLpi2c3TrgInput = 113|0x100U,
    kXBARA1_OutputLpi2c4TrgInput = 114|0x100U,
    kXBARA1_OutputLpspi1TrgInput = 115|0x100U,
    kXBARA1_OutputLpspi2TrgInput = 116|0x100U,
    kXBARA1_OutputLpspi3TrgInput = 117|0x100U,
    kXBARA1_OutputLpspi4TrgInput = 118|0x100U,
    kXBARA1_OutputLpuart1TrgInput = 119|0x100U,
    kXBARA1_OutputLpuart2TrgInput = 120|0x100U,
    kXBARA1_OutputLpuart3TrgInput = 121|0x100U,
    kXBARA1_OutputLpuart4TrgInput = 122|0x100U,
    kXBARA1_OutputLpuart5TrgInput = 123|0x100U,
    kXBARA1_OutputLpuart6TrgInput = 124|0x100U,
    kXBARA1_OutputLpuart7TrgInput = 125|0x100U,
    kXBARA1_OutputLpuart8TrgInput = 126|0x100U,
    kXBARA1_OutputFlexio1TriggerIn0 = 127|0x100U,
    kXBARA1_OutputFlexio1TriggerIn1 = 128|0x100U,
    kXBARA1_OutputFlexio2TriggerIn0 = 129|0x100U,
    kXBARA1_OutputFlexio2TriggerIn1 = 130|0x100U,
    kXBARB2_OutputAoi1In00 = 0|0x200U,
    kXBARB2_OutputAoi1In01 = 1|0x200U,
    kXBARB2_OutputAoi1In02 = 2|0x200U,
    kXBARB2_OutputAoi1In03 = 3|0x200U,
    kXBARB2_OutputAoi1In04 = 4|0x200U,
    kXBARB2_OutputAoi1In05 = 5|0x200U,
    kXBARB2_OutputAoi1In06 = 6|0x200U,
    kXBARB2_OutputAoi1In07 = 7|0x200U,
    kXBARB2_OutputAoi1In08 = 8|0x200U,
    kXBARB2_OutputAoi1In09 = 9|0x200U,
    kXBARB2_OutputAoi1In10 = 10|0x200U,
    kXBARB2_OutputAoi1In11 = 11|0x200U,
    kXBARB2_OutputAoi1In12 = 12|0x200U,
    kXBARB2_OutputAoi1In13 = 13|0x200U,
    kXBARB2_OutputAoi1In14 = 14|0x200U,
    kXBARB2_OutputAoi1In15 = 15|0x200U,
    kXBARB3_OutputAoi2In00 = 0|0x300U,
    kXBARB3_OutputAoi2In01 = 1|0x300U,
    kXBARB3_OutputAoi2In02 = 2|0x300U,
    kXBARB3_OutputAoi2In03 = 3|0x300U,
    kXBARB3_OutputAoi2In04 = 4|0x300U,
    kXBARB3_OutputAoi2In05 = 5|0x300U,
    kXBARB3_OutputAoi2In06 = 6|0x300U,
    kXBARB3_OutputAoi2In07 = 7|0x300U,
    kXBARB3_OutputAoi2In08 = 8|0x300U,
    kXBARB3_OutputAoi2In09 = 9|0x300U,
    kXBARB3_OutputAoi2In10 = 10|0x300U,
    kXBARB3_OutputAoi2In11 = 11|0x300U,
    kXBARB3_OutputAoi2In12 = 12|0x300U,
    kXBARB3_OutputAoi2In13 = 13|0x300U,
    kXBARB3_OutputAoi2In14 = 14|0x300U,
    kXBARB3_OutputAoi2In15 = 15|0x300U,
} xbar_output_signal_t;
# 1245 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef enum _dma_request_source
{
    kDmaRequestMuxFlexIO1Request0Request1 = 0|0x100U,
    kDmaRequestMuxFlexIO2Request0Request1 = 1|0x100U,
    kDmaRequestMuxLPUART1Tx = 2|0x100U,
    kDmaRequestMuxLPUART1Rx = 3|0x100U,
    kDmaRequestMuxLPUART3Tx = 4|0x100U,
    kDmaRequestMuxLPUART3Rx = 5|0x100U,
    kDmaRequestMuxLPUART5Tx = 6|0x100U,
    kDmaRequestMuxLPUART5Rx = 7|0x100U,
    kDmaRequestMuxLPUART7Tx = 8|0x100U,
    kDmaRequestMuxLPUART7Rx = 9|0x100U,
    kDmaRequestMuxCAN3 = 11|0x100U,
    kDmaRequestMuxCSI = 12|0x100U,
    kDmaRequestMuxLPSPI1Rx = 13|0x100U,
    kDmaRequestMuxLPSPI1Tx = 14|0x100U,
    kDmaRequestMuxLPSPI3Rx = 15|0x100U,
    kDmaRequestMuxLPSPI3Tx = 16|0x100U,
    kDmaRequestMuxLPI2C1 = 17|0x100U,
    kDmaRequestMuxLPI2C3 = 18|0x100U,
    kDmaRequestMuxSai1Rx = 19|0x100U,
    kDmaRequestMuxSai1Tx = 20|0x100U,
    kDmaRequestMuxSai2Rx = 21|0x100U,
    kDmaRequestMuxSai2Tx = 22|0x100U,
    kDmaRequestMuxADC_ETC = 23|0x100U,
    kDmaRequestMuxADC1 = 24|0x100U,
    kDmaRequestMuxACMP1 = 25|0x100U,
    kDmaRequestMuxACMP3 = 26|0x100U,
    kDmaRequestMuxFlexSPIRx = 28|0x100U,
    kDmaRequestMuxFlexSPITx = 29|0x100U,
    kDmaRequestMuxXBAR1Request0 = 30|0x100U,
    kDmaRequestMuxXBAR1Request1 = 31|0x100U,
    kDmaRequestMuxFlexPWM1CaptureSub0 = 32|0x100U,
    kDmaRequestMuxFlexPWM1CaptureSub1 = 33|0x100U,
    kDmaRequestMuxFlexPWM1CaptureSub2 = 34|0x100U,
    kDmaRequestMuxFlexPWM1CaptureSub3 = 35|0x100U,
    kDmaRequestMuxFlexPWM1ValueSub0 = 36|0x100U,
    kDmaRequestMuxFlexPWM1ValueSub1 = 37|0x100U,
    kDmaRequestMuxFlexPWM1ValueSub2 = 38|0x100U,
    kDmaRequestMuxFlexPWM1ValueSub3 = 39|0x100U,
    kDmaRequestMuxFlexPWM3CaptureSub0 = 40|0x100U,
    kDmaRequestMuxFlexPWM3CaptureSub1 = 41|0x100U,
    kDmaRequestMuxFlexPWM3CaptureSub2 = 42|0x100U,
    kDmaRequestMuxFlexPWM3CaptureSub3 = 43|0x100U,
    kDmaRequestMuxFlexPWM3ValueSub0 = 44|0x100U,
    kDmaRequestMuxFlexPWM3ValueSub1 = 45|0x100U,
    kDmaRequestMuxFlexPWM3ValueSub2 = 46|0x100U,
    kDmaRequestMuxFlexPWM3ValueSub3 = 47|0x100U,
    kDmaRequestMuxQTIMER1CaptTimer0 = 48|0x100U,
    kDmaRequestMuxQTIMER1CaptTimer1 = 49|0x100U,
    kDmaRequestMuxQTIMER1CaptTimer2 = 50|0x100U,
    kDmaRequestMuxQTIMER1CaptTimer3 = 51|0x100U,
    kDmaRequestMuxQTIMER1Cmpld1Timer0Cmpld2Timer1 = 52|0x100U,
    kDmaRequestMuxQTIMER1Cmpld1Timer1Cmpld2Timer0 = 53|0x100U,
    kDmaRequestMuxQTIMER1Cmpld1Timer2Cmpld2Timer3 = 54|0x100U,
    kDmaRequestMuxQTIMER1Cmpld1Timer3Cmpld2Timer2 = 55|0x100U,
    kDmaRequestMuxQTIMER3CaptTimer0Cmpld1Timer0Cmpld2Timer1 = 56|0x100U,
    kDmaRequestMuxQTIMER3CaptTimer1Cmpld1Timer1Cmpld2Timer0 = 57|0x100U,
    kDmaRequestMuxQTIMER3CaptTimer2Cmpld1Timer2Cmpld2Timer3 = 58|0x100U,
    kDmaRequestMuxQTIMER3CaptTimer3Cmpld1Timer3Cmpld2Timer2 = 59|0x100U,
    kDmaRequestMuxFlexSPI2Rx = 60|0x100U,
    kDmaRequestMuxFlexSPI2Tx = 61|0x100U,
    kDmaRequestMuxFlexIO1Request2Request3 = 64|0x100U,
    kDmaRequestMuxFlexIO2Request2Request3 = 65|0x100U,
    kDmaRequestMuxLPUART2Tx = 66|0x100U,
    kDmaRequestMuxLPUART2Rx = 67|0x100U,
    kDmaRequestMuxLPUART4Tx = 68|0x100U,
    kDmaRequestMuxLPUART4Rx = 69|0x100U,
    kDmaRequestMuxLPUART6Tx = 70|0x100U,
    kDmaRequestMuxLPUART6Rx = 71|0x100U,
    kDmaRequestMuxLPUART8Tx = 72|0x100U,
    kDmaRequestMuxLPUART8Rx = 73|0x100U,
    kDmaRequestMuxPxp = 75|0x100U,
    kDmaRequestMuxLCDIF = 76|0x100U,
    kDmaRequestMuxLPSPI2Rx = 77|0x100U,
    kDmaRequestMuxLPSPI2Tx = 78|0x100U,
    kDmaRequestMuxLPSPI4Rx = 79|0x100U,
    kDmaRequestMuxLPSPI4Tx = 80|0x100U,
    kDmaRequestMuxLPI2C2 = 81|0x100U,
    kDmaRequestMuxLPI2C4 = 82|0x100U,
    kDmaRequestMuxSai3Rx = 83|0x100U,
    kDmaRequestMuxSai3Tx = 84|0x100U,
    kDmaRequestMuxSpdifRx = 85|0x100U,
    kDmaRequestMuxSpdifTx = 86|0x100U,
    kDmaRequestMuxADC2 = 88|0x100U,
    kDmaRequestMuxACMP2 = 89|0x100U,
    kDmaRequestMuxACMP4 = 90|0x100U,
    kDmaRequestMuxEnetTimer0 = 92|0x100U,
    kDmaRequestMuxEnetTimer1 = 93|0x100U,
    kDmaRequestMuxXBAR1Request2 = 94|0x100U,
    kDmaRequestMuxXBAR1Request3 = 95|0x100U,
    kDmaRequestMuxFlexPWM2CaptureSub0 = 96|0x100U,
    kDmaRequestMuxFlexPWM2CaptureSub1 = 97|0x100U,
    kDmaRequestMuxFlexPWM2CaptureSub2 = 98|0x100U,
    kDmaRequestMuxFlexPWM2CaptureSub3 = 99|0x100U,
    kDmaRequestMuxFlexPWM2ValueSub0 = 100|0x100U,
    kDmaRequestMuxFlexPWM2ValueSub1 = 101|0x100U,
    kDmaRequestMuxFlexPWM2ValueSub2 = 102|0x100U,
    kDmaRequestMuxFlexPWM2ValueSub3 = 103|0x100U,
    kDmaRequestMuxFlexPWM4CaptureSub0 = 104|0x100U,
    kDmaRequestMuxFlexPWM4CaptureSub1 = 105|0x100U,
    kDmaRequestMuxFlexPWM4CaptureSub2 = 106|0x100U,
    kDmaRequestMuxFlexPWM4CaptureSub3 = 107|0x100U,
    kDmaRequestMuxFlexPWM4ValueSub0 = 108|0x100U,
    kDmaRequestMuxFlexPWM4ValueSub1 = 109|0x100U,
    kDmaRequestMuxFlexPWM4ValueSub2 = 110|0x100U,
    kDmaRequestMuxFlexPWM4ValueSub3 = 111|0x100U,
    kDmaRequestMuxQTIMER2CaptTimer0 = 112|0x100U,
    kDmaRequestMuxQTIMER2CaptTimer1 = 113|0x100U,
    kDmaRequestMuxQTIMER2CaptTimer2 = 114|0x100U,
    kDmaRequestMuxQTIMER2CaptTimer3 = 115|0x100U,
    kDmaRequestMuxQTIMER2Cmpld1Timer0Cmpld2Timer1 = 116|0x100U,
    kDmaRequestMuxQTIMER2Cmpld1Timer1Cmpld2Timer0 = 117|0x100U,
    kDmaRequestMuxQTIMER2Cmpld1Timer2Cmpld2Timer3 = 118|0x100U,
    kDmaRequestMuxQTIMER2Cmpld1Timer3Cmpld2Timer2 = 119|0x100U,
    kDmaRequestMuxQTIMER4CaptTimer0Cmpld1Timer0Cmpld2Timer1 = 120|0x100U,
    kDmaRequestMuxQTIMER4CaptTimer1Cmpld1Timer1Cmpld2Timer0 = 121|0x100U,
    kDmaRequestMuxQTIMER4CaptTimer2Cmpld1Timer2Cmpld2Timer3 = 122|0x100U,
    kDmaRequestMuxQTIMER4CaptTimer3Cmpld1Timer3Cmpld2Timer2 = 123|0x100U,
    kDmaRequestMuxEnet2Timer0 = 124|0x100U,
    kDmaRequestMuxEnet2Timer1 = 125|0x100U,
} dma_request_source_t;
# 1392 "../../libraries/sdk/deceive/MIMXRT1064.h"
#pragma clang diagnostic push
# 1418 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t HC[8];
  volatile const uint32_t HS;
  volatile const uint32_t R[8];
  volatile uint32_t CFG;
  volatile uint32_t GC;
  volatile uint32_t GS;
  volatile uint32_t CV;
  volatile uint32_t OFS;
  volatile uint32_t CAL;
} ADC_Type;
# 1803 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t CTRL;
  volatile uint32_t DONE0_1_IRQ;
  volatile uint32_t DONE2_3_ERR_IRQ;
  volatile uint32_t DMA_CTRL;
  struct {
    volatile uint32_t TRIGn_CTRL;
    volatile uint32_t TRIGn_COUNTER;
    volatile uint32_t TRIGn_CHAIN_1_0;
    volatile uint32_t TRIGn_CHAIN_3_2;
    volatile uint32_t TRIGn_CHAIN_5_4;
    volatile uint32_t TRIGn_CHAIN_7_6;
    volatile const uint32_t TRIGn_RESULT_1_0;
    volatile const uint32_t TRIGn_RESULT_3_2;
    volatile const uint32_t TRIGn_RESULT_5_4;
    volatile const uint32_t TRIGn_RESULT_7_6;
  } TRIG[8];
} ADC_ETC_Type;
# 2920 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t MPR;
       uint8_t RESERVED_0[60];
  volatile uint32_t OPACR;
  volatile uint32_t OPACR1;
  volatile uint32_t OPACR2;
  volatile uint32_t OPACR3;
  volatile uint32_t OPACR4;
} AIPSTZ_Type;
# 3670 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  struct {
    volatile uint16_t BFCRT01;
    volatile uint16_t BFCRT23;
  } BFCRT[4];
} AOI_Type;
# 3895 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t CTRL;
  volatile uint32_t ADDR_OFFSET0;
  volatile uint32_t ADDR_OFFSET1;
  volatile uint32_t AES_KEY0_W0;
  volatile uint32_t AES_KEY0_W1;
  volatile uint32_t AES_KEY0_W2;
  volatile uint32_t AES_KEY0_W3;
  volatile uint32_t STATUS;
  volatile uint32_t CTR_NONCE0_W0;
  volatile uint32_t CTR_NONCE0_W1;
  volatile uint32_t CTR_NONCE0_W2;
  volatile uint32_t CTR_NONCE0_W3;
  volatile uint32_t CTR_NONCE1_W0;
  volatile uint32_t CTR_NONCE1_W1;
  volatile uint32_t CTR_NONCE1_W2;
  volatile uint32_t CTR_NONCE1_W3;
  volatile uint32_t REGION1_TOP;
  volatile uint32_t REGION1_BOT;
} BEE_Type;
# 4242 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t MCR;
  volatile uint32_t CTRL1;
  volatile uint32_t TIMER;
       uint8_t RESERVED_0[4];
  volatile uint32_t RXMGMASK;
  volatile uint32_t RX14MASK;
  volatile uint32_t RX15MASK;
  volatile uint32_t ECR;
  volatile uint32_t ESR1;
  volatile uint32_t IMASK2;
  volatile uint32_t IMASK1;
  volatile uint32_t IFLAG2;
  volatile uint32_t IFLAG1;
  volatile uint32_t CTRL2;
  volatile const uint32_t ESR2;
       uint8_t RESERVED_1[8];
  volatile const uint32_t CRCR;
  volatile uint32_t RXFGMASK;
  volatile const uint32_t RXFIR;
  volatile uint32_t CBT;
       uint8_t RESERVED_2[4];
  volatile const uint32_t DBG1;
  volatile const uint32_t DBG2;
       uint8_t RESERVED_3[32];
  union {
    struct {
      volatile uint32_t CS;
      volatile uint32_t ID;
      volatile uint32_t WORD[2];
    } MB_8B[64];
    struct {
      struct {
        volatile uint32_t CS;
        volatile uint32_t ID;
        volatile uint32_t WORD[4];
      } MB_16B_L[21];
           uint8_t RESERVED_0[8];
      struct {
        volatile uint32_t CS;
        volatile uint32_t ID;
        volatile uint32_t WORD[4];
      } MB_16B_H[21];
    } MB_16B;
    struct {
      struct {
        volatile uint32_t CS;
        volatile uint32_t ID;
        volatile uint32_t WORD[8];
      } MB_32B_L[12];
           uint8_t RESERVED_0[32];
      struct {
        volatile uint32_t CS;
        volatile uint32_t ID;
        volatile uint32_t WORD[8];
      } MB_32B_H[12];
    } MB_32B;
    struct {
      struct {
        volatile uint32_t CS;
        volatile uint32_t ID;
        volatile uint32_t WORD[16];
      } MB_64B_L[7];
           uint8_t RESERVED_0[8];
      struct {
        volatile uint32_t CS;
        volatile uint32_t ID;
        volatile uint32_t WORD[16];
      } MB_64B_H[7];
    } MB_64B;
    struct {
      volatile uint32_t CS;
      volatile uint32_t ID;
      volatile uint32_t WORD0;
      volatile uint32_t WORD1;
    } MB[64];
  };
       uint8_t RESERVED_4[1024];
  volatile uint32_t RXIMR[64];
       uint8_t RESERVED_5[96];
  volatile uint32_t GFWR;
       uint8_t RESERVED_6[540];
  volatile uint32_t FDCTRL;
  volatile uint32_t FDCBT;
  volatile const uint32_t FDCRC;
} CAN_Type;
# 6575 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t CCR;
       uint8_t RESERVED_0[4];
  volatile const uint32_t CSR;
  volatile uint32_t CCSR;
  volatile uint32_t CACRR;
  volatile uint32_t CBCDR;
  volatile uint32_t CBCMR;
  volatile uint32_t CSCMR1;
  volatile uint32_t CSCMR2;
  volatile uint32_t CSCDR1;
  volatile uint32_t CS1CDR;
  volatile uint32_t CS2CDR;
  volatile uint32_t CDCDR;
       uint8_t RESERVED_1[4];
  volatile uint32_t CSCDR2;
  volatile uint32_t CSCDR3;
       uint8_t RESERVED_2[8];
  volatile const uint32_t CDHIPR;
       uint8_t RESERVED_3[8];
  volatile uint32_t CLPCR;
  volatile uint32_t CISR;
  volatile uint32_t CIMR;
  volatile uint32_t CCOSR;
  volatile uint32_t CGPR;
  volatile uint32_t CCGR0;
  volatile uint32_t CCGR1;
  volatile uint32_t CCGR2;
  volatile uint32_t CCGR3;
  volatile uint32_t CCGR4;
  volatile uint32_t CCGR5;
  volatile uint32_t CCGR6;
  volatile uint32_t CCGR7;
  volatile uint32_t CMEOR;
} CCM_Type;
# 8779 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t PLL_ARM;
  volatile uint32_t PLL_ARM_SET;
  volatile uint32_t PLL_ARM_CLR;
  volatile uint32_t PLL_ARM_TOG;
  volatile uint32_t PLL_USB1;
  volatile uint32_t PLL_USB1_SET;
  volatile uint32_t PLL_USB1_CLR;
  volatile uint32_t PLL_USB1_TOG;
  volatile uint32_t PLL_USB2;
  volatile uint32_t PLL_USB2_SET;
  volatile uint32_t PLL_USB2_CLR;
  volatile uint32_t PLL_USB2_TOG;
  volatile uint32_t PLL_SYS;
  volatile uint32_t PLL_SYS_SET;
  volatile uint32_t PLL_SYS_CLR;
  volatile uint32_t PLL_SYS_TOG;
  volatile uint32_t PLL_SYS_SS;
       uint8_t RESERVED_0[12];
  volatile uint32_t PLL_SYS_NUM;
       uint8_t RESERVED_1[12];
  volatile uint32_t PLL_SYS_DENOM;
       uint8_t RESERVED_2[12];
  volatile uint32_t PLL_AUDIO;
  volatile uint32_t PLL_AUDIO_SET;
  volatile uint32_t PLL_AUDIO_CLR;
  volatile uint32_t PLL_AUDIO_TOG;
  volatile uint32_t PLL_AUDIO_NUM;
       uint8_t RESERVED_3[12];
  volatile uint32_t PLL_AUDIO_DENOM;
       uint8_t RESERVED_4[12];
  volatile uint32_t PLL_VIDEO;
  volatile uint32_t PLL_VIDEO_SET;
  volatile uint32_t PLL_VIDEO_CLR;
  volatile uint32_t PLL_VIDEO_TOG;
  volatile uint32_t PLL_VIDEO_NUM;
       uint8_t RESERVED_5[12];
  volatile uint32_t PLL_VIDEO_DENOM;
       uint8_t RESERVED_6[28];
  volatile uint32_t PLL_ENET;
  volatile uint32_t PLL_ENET_SET;
  volatile uint32_t PLL_ENET_CLR;
  volatile uint32_t PLL_ENET_TOG;
  volatile uint32_t PFD_480;
  volatile uint32_t PFD_480_SET;
  volatile uint32_t PFD_480_CLR;
  volatile uint32_t PFD_480_TOG;
  volatile uint32_t PFD_528;
  volatile uint32_t PFD_528_SET;
  volatile uint32_t PFD_528_CLR;
  volatile uint32_t PFD_528_TOG;
       uint8_t RESERVED_7[64];
  volatile uint32_t MISC0;
  volatile uint32_t MISC0_SET;
  volatile uint32_t MISC0_CLR;
  volatile uint32_t MISC0_TOG;
  volatile uint32_t MISC1;
  volatile uint32_t MISC1_SET;
  volatile uint32_t MISC1_CLR;
  volatile uint32_t MISC1_TOG;
  volatile uint32_t MISC2;
  volatile uint32_t MISC2_SET;
  volatile uint32_t MISC2_CLR;
  volatile uint32_t MISC2_TOG;
} CCM_ANALOG_Type;
# 11725 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
       uint8_t RESERVED_0[16];
  volatile uint32_t ISCR;
} CM7_MCM_Type;
# 11894 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint8_t CR0;
  volatile uint8_t CR1;
  volatile uint8_t FPR;
  volatile uint8_t SCR;
  volatile uint8_t DACCR;
  volatile uint8_t MUXCR;
} CMP_Type;
# 12165 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t CR1;
  volatile uint32_t CR2;
  volatile uint32_t CR3;
  volatile const uint32_t STATFIFO;
  volatile const uint32_t RFIFO;
  volatile uint32_t RXCNT;
  volatile uint32_t SR;
       uint8_t RESERVED_0[4];
  volatile uint32_t DMASA_STATFIFO;
  volatile uint32_t DMATS_STATFIFO;
  volatile uint32_t DMASA_FB1;
  volatile uint32_t DMASA_FB2;
  volatile uint32_t FBUF_PARA;
  volatile uint32_t IMAG_PARA;
       uint8_t RESERVED_1[16];
  volatile uint32_t CR18;
  volatile uint32_t CR19;
} CSI_Type;
# 12947 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t CSL[32];
       uint8_t RESERVED_0[384];
  volatile uint32_t HP0;
       uint8_t RESERVED_1[20];
  volatile uint32_t SA;
       uint8_t RESERVED_2[316];
  volatile uint32_t HPCONTROL0;
} CSU_Type;
# 13688 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t REG0;
  volatile uint32_t REG1;
  volatile uint32_t REG2;
  volatile uint32_t REG3;
} DCDC_Type;
# 14036 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t CTRL;
  volatile uint32_t CTRL_SET;
  volatile uint32_t CTRL_CLR;
  volatile uint32_t CTRL_TOG;
  volatile uint32_t STAT;
  volatile uint32_t STAT_SET;
  volatile uint32_t STAT_CLR;
  volatile uint32_t STAT_TOG;
  volatile uint32_t CHANNELCTRL;
  volatile uint32_t CHANNELCTRL_SET;
  volatile uint32_t CHANNELCTRL_CLR;
  volatile uint32_t CHANNELCTRL_TOG;
  volatile uint32_t CAPABILITY0;
       uint8_t RESERVED_0[12];
  volatile const uint32_t CAPABILITY1;
       uint8_t RESERVED_1[12];
  volatile uint32_t CONTEXT;
       uint8_t RESERVED_2[12];
  volatile uint32_t KEY;
       uint8_t RESERVED_3[12];
  volatile uint32_t KEYDATA;
       uint8_t RESERVED_4[12];
  volatile const uint32_t PACKET0;
       uint8_t RESERVED_5[12];
  volatile const uint32_t PACKET1;
       uint8_t RESERVED_6[12];
  volatile const uint32_t PACKET2;
       uint8_t RESERVED_7[12];
  volatile const uint32_t PACKET3;
       uint8_t RESERVED_8[12];
  volatile const uint32_t PACKET4;
       uint8_t RESERVED_9[12];
  volatile const uint32_t PACKET5;
       uint8_t RESERVED_10[12];
  volatile const uint32_t PACKET6;
       uint8_t RESERVED_11[28];
  volatile uint32_t CH0CMDPTR;
       uint8_t RESERVED_12[12];
  volatile uint32_t CH0SEMA;
       uint8_t RESERVED_13[12];
  volatile uint32_t CH0STAT;
  volatile uint32_t CH0STAT_SET;
  volatile uint32_t CH0STAT_CLR;
  volatile uint32_t CH0STAT_TOG;
  volatile uint32_t CH0OPTS;
  volatile uint32_t CH0OPTS_SET;
  volatile uint32_t CH0OPTS_CLR;
  volatile uint32_t CH0OPTS_TOG;
  volatile uint32_t CH1CMDPTR;
       uint8_t RESERVED_14[12];
  volatile uint32_t CH1SEMA;
       uint8_t RESERVED_15[12];
  volatile uint32_t CH1STAT;
  volatile uint32_t CH1STAT_SET;
  volatile uint32_t CH1STAT_CLR;
  volatile uint32_t CH1STAT_TOG;
  volatile uint32_t CH1OPTS;
  volatile uint32_t CH1OPTS_SET;
  volatile uint32_t CH1OPTS_CLR;
  volatile uint32_t CH1OPTS_TOG;
  volatile uint32_t CH2CMDPTR;
       uint8_t RESERVED_16[12];
  volatile uint32_t CH2SEMA;
       uint8_t RESERVED_17[12];
  volatile uint32_t CH2STAT;
  volatile uint32_t CH2STAT_SET;
  volatile uint32_t CH2STAT_CLR;
  volatile uint32_t CH2STAT_TOG;
  volatile uint32_t CH2OPTS;
  volatile uint32_t CH2OPTS_SET;
  volatile uint32_t CH2OPTS_CLR;
  volatile uint32_t CH2OPTS_TOG;
  volatile uint32_t CH3CMDPTR;
       uint8_t RESERVED_18[12];
  volatile uint32_t CH3SEMA;
       uint8_t RESERVED_19[12];
  volatile uint32_t CH3STAT;
  volatile uint32_t CH3STAT_SET;
  volatile uint32_t CH3STAT_CLR;
  volatile uint32_t CH3STAT_TOG;
  volatile uint32_t CH3OPTS;
  volatile uint32_t CH3OPTS_SET;
  volatile uint32_t CH3OPTS_CLR;
  volatile uint32_t CH3OPTS_TOG;
       uint8_t RESERVED_20[512];
  volatile uint32_t DBGSELECT;
       uint8_t RESERVED_21[12];
  volatile const uint32_t DBGDATA;
       uint8_t RESERVED_22[12];
  volatile uint32_t PAGETABLE;
       uint8_t RESERVED_23[12];
  volatile const uint32_t VERSION;
} DCP_Type;
# 16033 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t CR;
  volatile const uint32_t ES;
       uint8_t RESERVED_0[4];
  volatile uint32_t ERQ;
       uint8_t RESERVED_1[4];
  volatile uint32_t EEI;
  volatile uint8_t CEEI;
  volatile uint8_t SEEI;
  volatile uint8_t CERQ;
  volatile uint8_t SERQ;
  volatile uint8_t CDNE;
  volatile uint8_t SSRT;
  volatile uint8_t CERR;
  volatile uint8_t CINT;
       uint8_t RESERVED_2[4];
  volatile uint32_t INT;
       uint8_t RESERVED_3[4];
  volatile uint32_t ERR;
       uint8_t RESERVED_4[4];
  volatile const uint32_t HRS;
       uint8_t RESERVED_5[12];
  volatile uint32_t EARS;
       uint8_t RESERVED_6[184];
  volatile uint8_t DCHPRI3;
  volatile uint8_t DCHPRI2;
  volatile uint8_t DCHPRI1;
  volatile uint8_t DCHPRI0;
  volatile uint8_t DCHPRI7;
  volatile uint8_t DCHPRI6;
  volatile uint8_t DCHPRI5;
  volatile uint8_t DCHPRI4;
  volatile uint8_t DCHPRI11;
  volatile uint8_t DCHPRI10;
  volatile uint8_t DCHPRI9;
  volatile uint8_t DCHPRI8;
  volatile uint8_t DCHPRI15;
  volatile uint8_t DCHPRI14;
  volatile uint8_t DCHPRI13;
  volatile uint8_t DCHPRI12;
  volatile uint8_t DCHPRI19;
  volatile uint8_t DCHPRI18;
  volatile uint8_t DCHPRI17;
  volatile uint8_t DCHPRI16;
  volatile uint8_t DCHPRI23;
  volatile uint8_t DCHPRI22;
  volatile uint8_t DCHPRI21;
  volatile uint8_t DCHPRI20;
  volatile uint8_t DCHPRI27;
  volatile uint8_t DCHPRI26;
  volatile uint8_t DCHPRI25;
  volatile uint8_t DCHPRI24;
  volatile uint8_t DCHPRI31;
  volatile uint8_t DCHPRI30;
  volatile uint8_t DCHPRI29;
  volatile uint8_t DCHPRI28;
       uint8_t RESERVED_7[3808];
  struct {
    volatile uint32_t SADDR;
    volatile uint16_t SOFF;
    volatile uint16_t ATTR;
    union {
      volatile uint32_t NBYTES_MLNO;
      volatile uint32_t NBYTES_MLOFFNO;
      volatile uint32_t NBYTES_MLOFFYES;
    };
    volatile int32_t SLAST;
    volatile uint32_t DADDR;
    volatile uint16_t DOFF;
    union {
      volatile uint16_t CITER_ELINKNO;
      volatile uint16_t CITER_ELINKYES;
    };
    volatile int32_t DLAST_SGA;
    volatile uint16_t CSR;
    union {
      volatile uint16_t BITER_ELINKNO;
      volatile uint16_t BITER_ELINKYES;
    };
  } TCD[32];
} DMA_Type;
# 19533 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t CHCFG[32];
} DMAMUX_Type;
# 19615 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint16_t CTRL;
  volatile uint16_t FILT;
  volatile uint16_t WTR;
  volatile uint16_t POSD;
  volatile const uint16_t POSDH;
  volatile uint16_t REV;
  volatile const uint16_t REVH;
  volatile uint16_t UPOS;
  volatile uint16_t LPOS;
  volatile const uint16_t UPOSH;
  volatile const uint16_t LPOSH;
  volatile uint16_t UINIT;
  volatile uint16_t LINIT;
  volatile const uint16_t IMR;
  volatile uint16_t TST;
  volatile uint16_t CTRL2;
  volatile uint16_t UMOD;
  volatile uint16_t LMOD;
  volatile uint16_t UCOMP;
  volatile uint16_t LCOMP;
} ENC_Type;
# 20179 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
       uint8_t RESERVED_0[4];
  volatile uint32_t EIR;
  volatile uint32_t EIMR;
       uint8_t RESERVED_1[4];
  volatile uint32_t RDAR;
  volatile uint32_t TDAR;
       uint8_t RESERVED_2[12];
  volatile uint32_t ECR;
       uint8_t RESERVED_3[24];
  volatile uint32_t MMFR;
  volatile uint32_t MSCR;
       uint8_t RESERVED_4[28];
  volatile uint32_t MIBC;
       uint8_t RESERVED_5[28];
  volatile uint32_t RCR;
       uint8_t RESERVED_6[60];
  volatile uint32_t TCR;
       uint8_t RESERVED_7[28];
  volatile uint32_t PALR;
  volatile uint32_t PAUR;
  volatile uint32_t OPD;
  volatile uint32_t TXIC[1];
       uint8_t RESERVED_8[12];
  volatile uint32_t RXIC[1];
       uint8_t RESERVED_9[20];
  volatile uint32_t IAUR;
  volatile uint32_t IALR;
  volatile uint32_t GAUR;
  volatile uint32_t GALR;
       uint8_t RESERVED_10[28];
  volatile uint32_t TFWR;
       uint8_t RESERVED_11[56];
  volatile uint32_t RDSR;
  volatile uint32_t TDSR;
  volatile uint32_t MRBR;
       uint8_t RESERVED_12[4];
  volatile uint32_t RSFL;
  volatile uint32_t RSEM;
  volatile uint32_t RAEM;
  volatile uint32_t RAFL;
  volatile uint32_t TSEM;
  volatile uint32_t TAEM;
  volatile uint32_t TAFL;
  volatile uint32_t TIPG;
  volatile uint32_t FTRL;
       uint8_t RESERVED_13[12];
  volatile uint32_t TACC;
  volatile uint32_t RACC;
       uint8_t RESERVED_14[60];
  volatile const uint32_t RMON_T_PACKETS;
  volatile const uint32_t RMON_T_BC_PKT;
  volatile const uint32_t RMON_T_MC_PKT;
  volatile const uint32_t RMON_T_CRC_ALIGN;
  volatile const uint32_t RMON_T_UNDERSIZE;
  volatile const uint32_t RMON_T_OVERSIZE;
  volatile const uint32_t RMON_T_FRAG;
  volatile const uint32_t RMON_T_JAB;
  volatile const uint32_t RMON_T_COL;
  volatile const uint32_t RMON_T_P64;
  volatile const uint32_t RMON_T_P65TO127;
  volatile const uint32_t RMON_T_P128TO255;
  volatile const uint32_t RMON_T_P256TO511;
  volatile const uint32_t RMON_T_P512TO1023;
  volatile const uint32_t RMON_T_P1024TO2047;
  volatile const uint32_t RMON_T_P_GTE2048;
  volatile const uint32_t RMON_T_OCTETS;
       uint8_t RESERVED_15[4];
  volatile const uint32_t IEEE_T_FRAME_OK;
  volatile const uint32_t IEEE_T_1COL;
  volatile const uint32_t IEEE_T_MCOL;
  volatile const uint32_t IEEE_T_DEF;
  volatile const uint32_t IEEE_T_LCOL;
  volatile const uint32_t IEEE_T_EXCOL;
  volatile const uint32_t IEEE_T_MACERR;
  volatile const uint32_t IEEE_T_CSERR;
  volatile const uint32_t IEEE_T_SQE;
  volatile const uint32_t IEEE_T_FDXFC;
  volatile const uint32_t IEEE_T_OCTETS_OK;
       uint8_t RESERVED_16[12];
  volatile const uint32_t RMON_R_PACKETS;
  volatile const uint32_t RMON_R_BC_PKT;
  volatile const uint32_t RMON_R_MC_PKT;
  volatile const uint32_t RMON_R_CRC_ALIGN;
  volatile const uint32_t RMON_R_UNDERSIZE;
  volatile const uint32_t RMON_R_OVERSIZE;
  volatile const uint32_t RMON_R_FRAG;
  volatile const uint32_t RMON_R_JAB;
       uint8_t RESERVED_17[4];
  volatile const uint32_t RMON_R_P64;
  volatile const uint32_t RMON_R_P65TO127;
  volatile const uint32_t RMON_R_P128TO255;
  volatile const uint32_t RMON_R_P256TO511;
  volatile const uint32_t RMON_R_P512TO1023;
  volatile const uint32_t RMON_R_P1024TO2047;
  volatile const uint32_t RMON_R_P_GTE2048;
  volatile const uint32_t RMON_R_OCTETS;
  volatile const uint32_t IEEE_R_DROP;
  volatile const uint32_t IEEE_R_FRAME_OK;
  volatile const uint32_t IEEE_R_CRC;
  volatile const uint32_t IEEE_R_ALIGN;
  volatile const uint32_t IEEE_R_MACERR;
  volatile const uint32_t IEEE_R_FDXFC;
  volatile const uint32_t IEEE_R_OCTETS_OK;
       uint8_t RESERVED_18[284];
  volatile uint32_t ATCR;
  volatile uint32_t ATVR;
  volatile uint32_t ATOFF;
  volatile uint32_t ATPER;
  volatile uint32_t ATCOR;
  volatile uint32_t ATINC;
  volatile const uint32_t ATSTMP;
       uint8_t RESERVED_19[488];
  volatile uint32_t TGSR;
  struct {
    volatile uint32_t TCSR;
    volatile uint32_t TCCR;
  } CHANNEL[4];
} ENET_Type;
# 22061 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint8_t CTRL;
  volatile uint8_t SERV;
  volatile uint8_t CMPL;
  volatile uint8_t CMPH;
  volatile uint8_t CLKCTRL;
  volatile uint8_t CLKPRESCALER;
} EWM_Type;
# 22198 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile const uint32_t VERID;
  volatile const uint32_t PARAM;
  volatile uint32_t CTRL;
  volatile const uint32_t PIN;
  volatile uint32_t SHIFTSTAT;
  volatile uint32_t SHIFTERR;
  volatile uint32_t TIMSTAT;
       uint8_t RESERVED_0[4];
  volatile uint32_t SHIFTSIEN;
  volatile uint32_t SHIFTEIEN;
  volatile uint32_t TIMIEN;
       uint8_t RESERVED_1[4];
  volatile uint32_t SHIFTSDEN;
       uint8_t RESERVED_2[12];
  volatile uint32_t SHIFTSTATE;
       uint8_t RESERVED_3[60];
  volatile uint32_t SHIFTCTL[8];
       uint8_t RESERVED_4[96];
  volatile uint32_t SHIFTCFG[8];
       uint8_t RESERVED_5[224];
  volatile uint32_t SHIFTBUF[8];
       uint8_t RESERVED_6[96];
  volatile uint32_t SHIFTBUFBIS[8];
       uint8_t RESERVED_7[96];
  volatile uint32_t SHIFTBUFBYS[8];
       uint8_t RESERVED_8[96];
  volatile uint32_t SHIFTBUFBBS[8];
       uint8_t RESERVED_9[96];
  volatile uint32_t TIMCTL[8];
       uint8_t RESERVED_10[96];
  volatile uint32_t TIMCFG[8];
       uint8_t RESERVED_11[96];
  volatile uint32_t TIMCMP[8];
       uint8_t RESERVED_12[352];
  volatile uint32_t SHIFTBUFNBS[8];
       uint8_t RESERVED_13[96];
  volatile uint32_t SHIFTBUFHWS[8];
       uint8_t RESERVED_14[96];
  volatile uint32_t SHIFTBUFNIS[8];
} FLEXIO_Type;
# 22830 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t TCM_CTRL;
       uint8_t RESERVED_0[12];
  volatile uint32_t INT_STATUS;
  volatile uint32_t INT_STAT_EN;
  volatile uint32_t INT_SIG_EN;
} FLEXRAM_Type;
# 23068 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t MCR0;
  volatile uint32_t MCR1;
  volatile uint32_t MCR2;
  volatile uint32_t AHBCR;
  volatile uint32_t INTEN;
  volatile uint32_t INTR;
  volatile uint32_t LUTKEY;
  volatile uint32_t LUTCR;
  volatile uint32_t AHBRXBUFCR0[4];
       uint8_t RESERVED_0[48];
  volatile uint32_t FLSHCR0[4];
  volatile uint32_t FLSHCR1[4];
  volatile uint32_t FLSHCR2[4];
       uint8_t RESERVED_1[4];
  volatile uint32_t FLSHCR4;
       uint8_t RESERVED_2[8];
  volatile uint32_t IPCR0;
  volatile uint32_t IPCR1;
       uint8_t RESERVED_3[8];
  volatile uint32_t IPCMD;
       uint8_t RESERVED_4[4];
  volatile uint32_t IPRXFCR;
  volatile uint32_t IPTXFCR;
  volatile uint32_t DLLCR[2];
       uint8_t RESERVED_5[24];
  volatile const uint32_t STS0;
  volatile const uint32_t STS1;
  volatile const uint32_t STS2;
  volatile const uint32_t AHBSPNDSTS;
  volatile const uint32_t IPRXFSTS;
  volatile const uint32_t IPTXFSTS;
       uint8_t RESERVED_6[8];
  volatile const uint32_t RFDR[32];
  volatile uint32_t TFDR[32];
  volatile uint32_t LUT[64];
} FLEXSPI_Type;
# 24139 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t CNTR;
       uint8_t RESERVED_0[4];
  volatile uint32_t IMR[4];
  volatile const uint32_t ISR[4];
       uint8_t RESERVED_1[12];
  volatile uint32_t IMR5;
  volatile const uint32_t ISR5;
} GPC_Type;
# 24281 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t DR;
  volatile uint32_t GDIR;
  volatile const uint32_t PSR;
  volatile uint32_t ICR1;
  volatile uint32_t ICR2;
  volatile uint32_t IMR;
  volatile uint32_t ISR;
  volatile uint32_t EDGE_SEL;
       uint8_t RESERVED_0[100];
  volatile uint32_t DR_SET;
  volatile uint32_t DR_CLEAR;
  volatile uint32_t DR_TOGGLE;
} GPIO_Type;
# 24794 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t CR;
  volatile uint32_t PR;
  volatile uint32_t SR;
  volatile uint32_t IR;
  volatile uint32_t OCR[3];
  volatile const uint32_t ICR[2];
  volatile const uint32_t CNT;
} GPT_Type;
# 25119 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile const uint32_t VERID;
  volatile const uint32_t PARAM;
  volatile uint32_t TCSR;
  volatile uint32_t TCR1;
  volatile uint32_t TCR2;
  volatile uint32_t TCR3;
  volatile uint32_t TCR4;
  volatile uint32_t TCR5;
  volatile uint32_t TDR[4];
       uint8_t RESERVED_0[16];
  volatile const uint32_t TFR[4];
       uint8_t RESERVED_1[16];
  volatile uint32_t TMR;
       uint8_t RESERVED_2[36];
  volatile uint32_t RCSR;
  volatile uint32_t RCR1;
  volatile uint32_t RCR2;
  volatile uint32_t RCR3;
  volatile uint32_t RCR4;
  volatile uint32_t RCR5;
  volatile const uint32_t RDR[4];
       uint8_t RESERVED_3[16];
  volatile const uint32_t RFR[4];
       uint8_t RESERVED_4[16];
  volatile uint32_t RMR;
} I2S_Type;
# 26047 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
       uint8_t RESERVED_0[20];
  volatile uint32_t SW_MUX_CTL_PAD[124];
  volatile uint32_t SW_PAD_CTL_PAD[124];
  volatile uint32_t SELECT_INPUT[154];
  volatile uint32_t SW_MUX_CTL_PAD_1[22];
  volatile uint32_t SW_PAD_CTL_PAD_1[22];
  volatile uint32_t SELECT_INPUT_1[33];
} IOMUXC_Type;
# 26348 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
       uint32_t GPR0;
  volatile uint32_t GPR1;
  volatile uint32_t GPR2;
  volatile uint32_t GPR3;
  volatile uint32_t GPR4;
  volatile uint32_t GPR5;
  volatile uint32_t GPR6;
  volatile uint32_t GPR7;
  volatile uint32_t GPR8;
       uint32_t GPR9;
  volatile uint32_t GPR10;
  volatile uint32_t GPR11;
  volatile uint32_t GPR12;
  volatile uint32_t GPR13;
  volatile uint32_t GPR14;
       uint32_t GPR15;
  volatile uint32_t GPR16;
  volatile uint32_t GPR17;
  volatile uint32_t GPR18;
  volatile uint32_t GPR19;
  volatile uint32_t GPR20;
  volatile uint32_t GPR21;
  volatile uint32_t GPR22;
  volatile uint32_t GPR23;
  volatile uint32_t GPR24;
  volatile uint32_t GPR25;
  volatile uint32_t GPR26;
  volatile uint32_t GPR27;
  volatile uint32_t GPR28;
  volatile uint32_t GPR29;
  volatile uint32_t GPR30;
  volatile uint32_t GPR31;
  volatile uint32_t GPR32;
  volatile uint32_t GPR33;
  volatile uint32_t GPR34;
} IOMUXC_GPR_Type;
# 28758 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t SW_MUX_CTL_PAD_WAKEUP;
  volatile uint32_t SW_MUX_CTL_PAD_PMIC_ON_REQ;
  volatile uint32_t SW_MUX_CTL_PAD_PMIC_STBY_REQ;
  volatile uint32_t SW_PAD_CTL_PAD_TEST_MODE;
  volatile uint32_t SW_PAD_CTL_PAD_POR_B;
  volatile uint32_t SW_PAD_CTL_PAD_ONOFF;
  volatile uint32_t SW_PAD_CTL_PAD_WAKEUP;
  volatile uint32_t SW_PAD_CTL_PAD_PMIC_ON_REQ;
  volatile uint32_t SW_PAD_CTL_PAD_PMIC_STBY_REQ;
} IOMUXC_SNVS_Type;
# 29320 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
       uint32_t GPR0;
       uint32_t GPR1;
       uint32_t GPR2;
  volatile uint32_t GPR3;
} IOMUXC_SNVS_GPR_Type;
# 29427 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint16_t KPCR;
  volatile uint16_t KPSR;
  volatile uint16_t KDDR;
  volatile uint16_t KPDR;
} KPP_Type;
# 29580 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t CTRL;
  volatile uint32_t CTRL_SET;
  volatile uint32_t CTRL_CLR;
  volatile uint32_t CTRL_TOG;
  volatile uint32_t CTRL1;
  volatile uint32_t CTRL1_SET;
  volatile uint32_t CTRL1_CLR;
  volatile uint32_t CTRL1_TOG;
  volatile uint32_t CTRL2;
  volatile uint32_t CTRL2_SET;
  volatile uint32_t CTRL2_CLR;
  volatile uint32_t CTRL2_TOG;
  volatile uint32_t TRANSFER_COUNT;
       uint8_t RESERVED_0[12];
  volatile uint32_t CUR_BUF;
       uint8_t RESERVED_1[12];
  volatile uint32_t NEXT_BUF;
       uint8_t RESERVED_2[28];
  volatile uint32_t VDCTRL0;
  volatile uint32_t VDCTRL0_SET;
  volatile uint32_t VDCTRL0_CLR;
  volatile uint32_t VDCTRL0_TOG;
  volatile uint32_t VDCTRL1;
       uint8_t RESERVED_3[12];
  volatile uint32_t VDCTRL2;
       uint8_t RESERVED_4[12];
  volatile uint32_t VDCTRL3;
       uint8_t RESERVED_5[12];
  volatile uint32_t VDCTRL4;
       uint8_t RESERVED_6[220];
  volatile uint32_t BM_ERROR_STAT;
       uint8_t RESERVED_7[12];
  volatile uint32_t CRC_STAT;
       uint8_t RESERVED_8[12];
  volatile const uint32_t STAT;
       uint8_t RESERVED_9[460];
  volatile uint32_t PIGEONCTRL0;
  volatile uint32_t PIGEONCTRL0_SET;
  volatile uint32_t PIGEONCTRL0_CLR;
  volatile uint32_t PIGEONCTRL0_TOG;
  volatile uint32_t PIGEONCTRL1;
  volatile uint32_t PIGEONCTRL1_SET;
  volatile uint32_t PIGEONCTRL1_CLR;
  volatile uint32_t PIGEONCTRL1_TOG;
  volatile uint32_t PIGEONCTRL2;
  volatile uint32_t PIGEONCTRL2_SET;
  volatile uint32_t PIGEONCTRL2_CLR;
  volatile uint32_t PIGEONCTRL2_TOG;
       uint8_t RESERVED_10[1104];
  struct {
    volatile uint32_t PIGEON_0;
         uint8_t RESERVED_0[12];
    volatile uint32_t PIGEON_1;
         uint8_t RESERVED_1[12];
    volatile uint32_t PIGEON_2;
         uint8_t RESERVED_2[28];
  } PIGEON[12];
  volatile uint32_t LUT_CTRL;
       uint8_t RESERVED_11[12];
  volatile uint32_t LUT0_ADDR;
       uint8_t RESERVED_12[12];
  volatile uint32_t LUT0_DATA;
       uint8_t RESERVED_13[12];
  volatile uint32_t LUT1_ADDR;
       uint8_t RESERVED_14[12];
  volatile uint32_t LUT1_DATA;
} LCDIF_Type;
# 31429 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile const uint32_t VERID;
  volatile const uint32_t PARAM;
       uint8_t RESERVED_0[8];
  volatile uint32_t MCR;
  volatile uint32_t MSR;
  volatile uint32_t MIER;
  volatile uint32_t MDER;
  volatile uint32_t MCFGR0;
  volatile uint32_t MCFGR1;
  volatile uint32_t MCFGR2;
  volatile uint32_t MCFGR3;
       uint8_t RESERVED_1[16];
  volatile uint32_t MDMR;
       uint8_t RESERVED_2[4];
  volatile uint32_t MCCR0;
       uint8_t RESERVED_3[4];
  volatile uint32_t MCCR1;
       uint8_t RESERVED_4[4];
  volatile uint32_t MFCR;
  volatile const uint32_t MFSR;
  volatile uint32_t MTDR;
       uint8_t RESERVED_5[12];
  volatile const uint32_t MRDR;
       uint8_t RESERVED_6[156];
  volatile uint32_t SCR;
  volatile uint32_t SSR;
  volatile uint32_t SIER;
  volatile uint32_t SDER;
       uint8_t RESERVED_7[4];
  volatile uint32_t SCFGR1;
  volatile uint32_t SCFGR2;
       uint8_t RESERVED_8[20];
  volatile uint32_t SAMR;
       uint8_t RESERVED_9[12];
  volatile const uint32_t SASR;
  volatile uint32_t STAR;
       uint8_t RESERVED_10[8];
  volatile uint32_t STDR;
       uint8_t RESERVED_11[12];
  volatile const uint32_t SRDR;
} LPI2C_Type;
# 32604 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile const uint32_t VERID;
  volatile const uint32_t PARAM;
       uint8_t RESERVED_0[8];
  volatile uint32_t CR;
  volatile uint32_t SR;
  volatile uint32_t IER;
  volatile uint32_t DER;
  volatile uint32_t CFGR0;
  volatile uint32_t CFGR1;
       uint8_t RESERVED_1[8];
  volatile uint32_t DMR0;
  volatile uint32_t DMR1;
       uint8_t RESERVED_2[8];
  volatile uint32_t CCR;
       uint8_t RESERVED_3[20];
  volatile uint32_t FCR;
  volatile const uint32_t FSR;
  volatile uint32_t TCR;
  volatile uint32_t TDR;
       uint8_t RESERVED_4[8];
  volatile const uint32_t RSR;
  volatile const uint32_t RDR;
} LPSPI_Type;
# 33298 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile const uint32_t VERID;
  volatile const uint32_t PARAM;
  volatile uint32_t GLOBAL;
  volatile uint32_t PINCFG;
  volatile uint32_t BAUD;
  volatile uint32_t STAT;
  volatile uint32_t CTRL;
  volatile uint32_t DATA;
  volatile uint32_t MATCH;
  volatile uint32_t MODIR;
  volatile uint32_t FIFO;
  volatile uint32_t WATER;
} LPUART_Type;
# 34327 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t CTRL;
  volatile uint32_t CTRL_SET;
  volatile uint32_t CTRL_CLR;
  volatile uint32_t CTRL_TOG;
  volatile uint32_t TIMING;
       uint8_t RESERVED_0[12];
  volatile uint32_t DATA;
       uint8_t RESERVED_1[12];
  volatile uint32_t READ_CTRL;
       uint8_t RESERVED_2[12];
  volatile uint32_t READ_FUSE_DATA;
       uint8_t RESERVED_3[12];
  volatile uint32_t SW_STICKY;
       uint8_t RESERVED_4[12];
  volatile uint32_t SCS;
  volatile uint32_t SCS_SET;
  volatile uint32_t SCS_CLR;
  volatile uint32_t SCS_TOG;
       uint8_t RESERVED_5[32];
  volatile const uint32_t VERSION;
       uint8_t RESERVED_6[108];
  volatile uint32_t TIMING2;
       uint8_t RESERVED_7[764];
  volatile uint32_t LOCK;
       uint8_t RESERVED_8[12];
  volatile uint32_t CFG0;
       uint8_t RESERVED_9[12];
  volatile uint32_t CFG1;
       uint8_t RESERVED_10[12];
  volatile uint32_t CFG2;
       uint8_t RESERVED_11[12];
  volatile uint32_t CFG3;
       uint8_t RESERVED_12[12];
  volatile uint32_t CFG4;
       uint8_t RESERVED_13[12];
  volatile uint32_t CFG5;
       uint8_t RESERVED_14[12];
  volatile uint32_t CFG6;
       uint8_t RESERVED_15[12];
  volatile uint32_t MEM0;
       uint8_t RESERVED_16[12];
  volatile uint32_t MEM1;
       uint8_t RESERVED_17[12];
  volatile uint32_t MEM2;
       uint8_t RESERVED_18[12];
  volatile uint32_t MEM3;
       uint8_t RESERVED_19[12];
  volatile uint32_t MEM4;
       uint8_t RESERVED_20[12];
  volatile uint32_t ANA0;
       uint8_t RESERVED_21[12];
  volatile uint32_t ANA1;
       uint8_t RESERVED_22[12];
  volatile uint32_t ANA2;
       uint8_t RESERVED_23[140];
  volatile uint32_t SRK0;
       uint8_t RESERVED_24[12];
  volatile uint32_t SRK1;
       uint8_t RESERVED_25[12];
  volatile uint32_t SRK2;
       uint8_t RESERVED_26[12];
  volatile uint32_t SRK3;
       uint8_t RESERVED_27[12];
  volatile uint32_t SRK4;
       uint8_t RESERVED_28[12];
  volatile uint32_t SRK5;
       uint8_t RESERVED_29[12];
  volatile uint32_t SRK6;
       uint8_t RESERVED_30[12];
  volatile uint32_t SRK7;
       uint8_t RESERVED_31[12];
  volatile uint32_t SJC_RESP0;
       uint8_t RESERVED_32[12];
  volatile uint32_t SJC_RESP1;
       uint8_t RESERVED_33[12];
  volatile uint32_t MAC0;
       uint8_t RESERVED_34[12];
  volatile uint32_t MAC1;
       uint8_t RESERVED_35[12];
  volatile uint32_t MAC2;
       uint8_t RESERVED_36[28];
  volatile uint32_t GP1;
       uint8_t RESERVED_37[12];
  volatile uint32_t GP2;
       uint8_t RESERVED_38[12];
  volatile uint32_t SW_GP1;
       uint8_t RESERVED_39[12];
  volatile uint32_t SW_GP20;
       uint8_t RESERVED_40[12];
  volatile uint32_t SW_GP21;
       uint8_t RESERVED_41[12];
  volatile uint32_t SW_GP22;
       uint8_t RESERVED_42[12];
  volatile uint32_t SW_GP23;
       uint8_t RESERVED_43[12];
  volatile uint32_t MISC_CONF0;
       uint8_t RESERVED_44[12];
  volatile uint32_t MISC_CONF1;
       uint8_t RESERVED_45[12];
  volatile uint32_t SRK_REVOKE;
       uint8_t RESERVED_46[396];
  volatile uint32_t GP30;
       uint8_t RESERVED_47[12];
  volatile uint32_t GP31;
       uint8_t RESERVED_48[12];
  volatile uint32_t GP32;
       uint8_t RESERVED_49[12];
  volatile uint32_t GP33;
       uint8_t RESERVED_50[12];
  volatile uint32_t GP40;
       uint8_t RESERVED_51[12];
  volatile uint32_t GP41;
       uint8_t RESERVED_52[12];
  volatile uint32_t GP42;
       uint8_t RESERVED_53[12];
  volatile uint32_t GP43;
} OCOTP_Type;
# 35390 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
       uint8_t RESERVED_0[544];
  volatile uint32_t MEGA_CTRL;
  volatile uint32_t MEGA_PUPSCR;
  volatile uint32_t MEGA_PDNSCR;
  volatile uint32_t MEGA_SR;
       uint8_t RESERVED_1[112];
  volatile uint32_t CPU_CTRL;
  volatile uint32_t CPU_PUPSCR;
  volatile uint32_t CPU_PDNSCR;
  volatile uint32_t CPU_SR;
} PGC_Type;
# 35539 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t MCR;
       uint8_t RESERVED_0[220];
  volatile const uint32_t LTMR64H;
  volatile const uint32_t LTMR64L;
       uint8_t RESERVED_1[24];
  struct {
    volatile uint32_t LDVAL;
    volatile const uint32_t CVAL;
    volatile uint32_t TCTRL;
    volatile uint32_t TFLG;
  } CHANNEL[4];
} PIT_Type;
# 35707 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
       uint8_t RESERVED_0[272];
  volatile uint32_t REG_1P1;
  volatile uint32_t REG_1P1_SET;
  volatile uint32_t REG_1P1_CLR;
  volatile uint32_t REG_1P1_TOG;
  volatile uint32_t REG_3P0;
  volatile uint32_t REG_3P0_SET;
  volatile uint32_t REG_3P0_CLR;
  volatile uint32_t REG_3P0_TOG;
  volatile uint32_t REG_2P5;
  volatile uint32_t REG_2P5_SET;
  volatile uint32_t REG_2P5_CLR;
  volatile uint32_t REG_2P5_TOG;
  volatile uint32_t REG_CORE;
  volatile uint32_t REG_CORE_SET;
  volatile uint32_t REG_CORE_CLR;
  volatile uint32_t REG_CORE_TOG;
  volatile uint32_t MISC0;
  volatile uint32_t MISC0_SET;
  volatile uint32_t MISC0_CLR;
  volatile uint32_t MISC0_TOG;
  volatile uint32_t MISC1;
  volatile uint32_t MISC1_SET;
  volatile uint32_t MISC1_CLR;
  volatile uint32_t MISC1_TOG;
  volatile uint32_t MISC2;
  volatile uint32_t MISC2_SET;
  volatile uint32_t MISC2_CLR;
  volatile uint32_t MISC2_TOG;
} PMU_Type;
# 38231 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  struct {
    volatile const uint16_t CNT;
    volatile uint16_t INIT;
    volatile uint16_t CTRL2;
    volatile uint16_t CTRL;
         uint8_t RESERVED_0[2];
    volatile uint16_t VAL0;
    volatile uint16_t FRACVAL1;
    volatile uint16_t VAL1;
    volatile uint16_t FRACVAL2;
    volatile uint16_t VAL2;
    volatile uint16_t FRACVAL3;
    volatile uint16_t VAL3;
    volatile uint16_t FRACVAL4;
    volatile uint16_t VAL4;
    volatile uint16_t FRACVAL5;
    volatile uint16_t VAL5;
    volatile uint16_t FRCTRL;
    volatile uint16_t OCTRL;
    volatile uint16_t STS;
    volatile uint16_t INTEN;
    volatile uint16_t DMAEN;
    volatile uint16_t TCTRL;
    volatile uint16_t DISMAP[1];
         uint8_t RESERVED_1[2];
    volatile uint16_t DTCNT0;
    volatile uint16_t DTCNT1;
    volatile uint16_t CAPTCTRLA;
    volatile uint16_t CAPTCOMPA;
    volatile uint16_t CAPTCTRLB;
    volatile uint16_t CAPTCOMPB;
    volatile uint16_t CAPTCTRLX;
    volatile uint16_t CAPTCOMPX;
    volatile const uint16_t CVAL0;
    volatile const uint16_t CVAL0CYC;
    volatile const uint16_t CVAL1;
    volatile const uint16_t CVAL1CYC;
    volatile const uint16_t CVAL2;
    volatile const uint16_t CVAL2CYC;
    volatile const uint16_t CVAL3;
    volatile const uint16_t CVAL3CYC;
    volatile const uint16_t CVAL4;
    volatile const uint16_t CVAL4CYC;
    volatile const uint16_t CVAL5;
    volatile const uint16_t CVAL5CYC;
         uint8_t RESERVED_2[8];
  } SM[4];
  volatile uint16_t OUTEN;
  volatile uint16_t MASK;
  volatile uint16_t SWCOUT;
  volatile uint16_t DTSRCSEL;
  volatile uint16_t MCTRL;
  volatile uint16_t MCTRL2;
  volatile uint16_t FCTRL;
  volatile uint16_t FSTS;
  volatile uint16_t FFILT;
  volatile uint16_t FTST;
  volatile uint16_t FCTRL2;
} PWM_Type;
# 40027 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t CTRL;
  volatile uint32_t CTRL_SET;
  volatile uint32_t CTRL_CLR;
  volatile uint32_t CTRL_TOG;
  volatile uint32_t STAT;
  volatile uint32_t STAT_SET;
  volatile uint32_t STAT_CLR;
  volatile uint32_t STAT_TOG;
  volatile uint32_t OUT_CTRL;
  volatile uint32_t OUT_CTRL_SET;
  volatile uint32_t OUT_CTRL_CLR;
  volatile uint32_t OUT_CTRL_TOG;
  volatile uint32_t OUT_BUF;
       uint8_t RESERVED_0[12];
  volatile uint32_t OUT_BUF2;
       uint8_t RESERVED_1[12];
  volatile uint32_t OUT_PITCH;
       uint8_t RESERVED_2[12];
  volatile uint32_t OUT_LRC;
       uint8_t RESERVED_3[12];
  volatile uint32_t OUT_PS_ULC;
       uint8_t RESERVED_4[12];
  volatile uint32_t OUT_PS_LRC;
       uint8_t RESERVED_5[12];
  volatile uint32_t OUT_AS_ULC;
       uint8_t RESERVED_6[12];
  volatile uint32_t OUT_AS_LRC;
       uint8_t RESERVED_7[12];
  volatile uint32_t PS_CTRL;
  volatile uint32_t PS_CTRL_SET;
  volatile uint32_t PS_CTRL_CLR;
  volatile uint32_t PS_CTRL_TOG;
  volatile uint32_t PS_BUF;
       uint8_t RESERVED_8[12];
  volatile uint32_t PS_UBUF;
       uint8_t RESERVED_9[12];
  volatile uint32_t PS_VBUF;
       uint8_t RESERVED_10[12];
  volatile uint32_t PS_PITCH;
       uint8_t RESERVED_11[12];
  volatile uint32_t PS_BACKGROUND;
       uint8_t RESERVED_12[12];
  volatile uint32_t PS_SCALE;
       uint8_t RESERVED_13[12];
  volatile uint32_t PS_OFFSET;
       uint8_t RESERVED_14[12];
  volatile uint32_t PS_CLRKEYLOW;
       uint8_t RESERVED_15[12];
  volatile uint32_t PS_CLRKEYHIGH;
       uint8_t RESERVED_16[12];
  volatile uint32_t AS_CTRL;
       uint8_t RESERVED_17[12];
  volatile uint32_t AS_BUF;
       uint8_t RESERVED_18[12];
  volatile uint32_t AS_PITCH;
       uint8_t RESERVED_19[12];
  volatile uint32_t AS_CLRKEYLOW;
       uint8_t RESERVED_20[12];
  volatile uint32_t AS_CLRKEYHIGH;
       uint8_t RESERVED_21[12];
  volatile uint32_t CSC1_COEF0;
       uint8_t RESERVED_22[12];
  volatile uint32_t CSC1_COEF1;
       uint8_t RESERVED_23[12];
  volatile uint32_t CSC1_COEF2;
       uint8_t RESERVED_24[348];
  volatile uint32_t POWER;
       uint8_t RESERVED_25[220];
  volatile uint32_t NEXT;
       uint8_t RESERVED_26[60];
  volatile uint32_t PORTER_DUFF_CTRL;
} PXP_Type;
# 41586 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
       uint8_t RESERVED_0[212];
  volatile uint32_t ROMPATCHD[8];
  volatile uint32_t ROMPATCHCNTL;
       uint32_t ROMPATCHENH;
  volatile uint32_t ROMPATCHENL;
  volatile uint32_t ROMPATCHA[16];
       uint8_t RESERVED_1[200];
  volatile uint32_t ROMPATCHSR;
} ROMC_Type;
# 41720 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t CS;
  volatile uint32_t CNT;
  volatile uint32_t TOVAL;
  volatile uint32_t WIN;
} RTWDOG_Type;
# 41938 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t MCR;
  volatile uint32_t IOCR;
  volatile uint32_t BMCR0;
  volatile uint32_t BMCR1;
  volatile uint32_t BR[9];
  volatile uint32_t DLLCR;
  volatile uint32_t INTEN;
  volatile uint32_t INTR;
  volatile uint32_t SDRAMCR0;
  volatile uint32_t SDRAMCR1;
  volatile uint32_t SDRAMCR2;
  volatile uint32_t SDRAMCR3;
  volatile uint32_t NANDCR0;
  volatile uint32_t NANDCR1;
  volatile uint32_t NANDCR2;
  volatile uint32_t NANDCR3;
  volatile uint32_t NORCR0;
  volatile uint32_t NORCR1;
  volatile uint32_t NORCR2;
  volatile uint32_t NORCR3;
  volatile uint32_t SRAMCR0;
  volatile uint32_t SRAMCR1;
  volatile uint32_t SRAMCR2;
       uint32_t SRAMCR3;
  volatile uint32_t DBICR0;
  volatile uint32_t DBICR1;
       uint8_t RESERVED_0[8];
  volatile uint32_t IPCR0;
  volatile uint32_t IPCR1;
  volatile uint32_t IPCR2;
  volatile uint32_t IPCMD;
  volatile uint32_t IPTXDAT;
       uint8_t RESERVED_1[12];
  volatile const uint32_t IPRXDAT;
       uint8_t RESERVED_2[12];
  volatile const uint32_t STS0;
       uint32_t STS1;
  volatile const uint32_t STS2;
       uint32_t STS3;
       uint32_t STS4;
       uint32_t STS5;
       uint32_t STS6;
       uint32_t STS7;
       uint32_t STS8;
       uint32_t STS9;
       uint32_t STS10;
       uint32_t STS11;
  volatile const uint32_t STS12;
  volatile const uint32_t STS13;
       uint32_t STS14;
       uint32_t STS15;
} SEMC_Type;
# 43471 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t HPLR;
  volatile uint32_t HPCOMR;
  volatile uint32_t HPCR;
  volatile uint32_t HPSICR;
  volatile uint32_t HPSVCR;
  volatile uint32_t HPSR;
  volatile uint32_t HPSVSR;
  volatile uint32_t HPHACIVR;
  volatile const uint32_t HPHACR;
  volatile uint32_t HPRTCMR;
  volatile uint32_t HPRTCLR;
  volatile uint32_t HPTAMR;
  volatile uint32_t HPTALR;
  volatile uint32_t LPLR;
  volatile uint32_t LPCR;
  volatile uint32_t LPMKCR;
  volatile uint32_t LPSVCR;
       uint8_t RESERVED_0[4];
  volatile uint32_t LPSECR;
  volatile uint32_t LPSR;
  volatile uint32_t LPSRTCMR;
  volatile uint32_t LPSRTCLR;
  volatile uint32_t LPTAR;
  volatile uint32_t LPSMCMR;
  volatile uint32_t LPSMCLR;
  volatile uint32_t LPLVDR;
  volatile uint32_t LPGPR0_LEGACY_ALIAS;
  volatile uint32_t LPZMKR[8];
       uint8_t RESERVED_1[4];
  volatile uint32_t LPGPR_ALIAS[4];
       uint8_t RESERVED_2[96];
  volatile uint32_t LPGPR[8];
       uint8_t RESERVED_3[2776];
  volatile const uint32_t HPVIDR1;
  volatile const uint32_t HPVIDR2;
} SNVS_Type;
# 44715 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t SCR;
  volatile uint32_t SRCD;
  volatile uint32_t SRPC;
  volatile uint32_t SIE;
  union {
    volatile uint32_t SIC;
    volatile const uint32_t SIS;
  };
  volatile const uint32_t SRL;
  volatile const uint32_t SRR;
  volatile const uint32_t SRCSH;
  volatile const uint32_t SRCSL;
  volatile const uint32_t SRU;
  volatile const uint32_t SRQ;
  volatile uint32_t STL;
  volatile uint32_t STR;
  volatile uint32_t STCSCH;
  volatile uint32_t STCSCL;
       uint8_t RESERVED_0[8];
  volatile const uint32_t SRFM;
       uint8_t RESERVED_1[8];
  volatile uint32_t STC;
} SPDIF_Type;
# 45287 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t SCR;
  volatile const uint32_t SBMR1;
  volatile uint32_t SRSR;
       uint8_t RESERVED_0[16];
  volatile const uint32_t SBMR2;
  volatile uint32_t GPR[10];
} SRC_Type;
# 45543 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
       uint8_t RESERVED_0[384];
  volatile uint32_t TEMPSENSE0;
  volatile uint32_t TEMPSENSE0_SET;
  volatile uint32_t TEMPSENSE0_CLR;
  volatile uint32_t TEMPSENSE0_TOG;
  volatile uint32_t TEMPSENSE1;
  volatile uint32_t TEMPSENSE1_SET;
  volatile uint32_t TEMPSENSE1_CLR;
  volatile uint32_t TEMPSENSE1_TOG;
       uint8_t RESERVED_1[240];
  volatile uint32_t TEMPSENSE2;
  volatile uint32_t TEMPSENSE2_SET;
  volatile uint32_t TEMPSENSE2_CLR;
  volatile uint32_t TEMPSENSE2_TOG;
} TEMPMON_Type;
# 45848 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  struct {
    volatile uint16_t COMP1;
    volatile uint16_t COMP2;
    volatile uint16_t CAPT;
    volatile uint16_t LOAD;
    volatile uint16_t HOLD;
    volatile uint16_t CNTR;
    volatile uint16_t CTRL;
    volatile uint16_t SCTRL;
    volatile uint16_t CMPLD1;
    volatile uint16_t CMPLD2;
    volatile uint16_t CSCTRL;
    volatile uint16_t FILT;
    volatile uint16_t DMA;
         uint8_t RESERVED_0[4];
    volatile uint16_t ENBL;
  } CHANNEL[4];
} TMR_Type;
# 46401 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t MCTL;
  volatile uint32_t SCMISC;
  volatile uint32_t PKRRNG;
  union {
    volatile uint32_t PKRMAX;
    volatile const uint32_t PKRSQ;
  };
  volatile uint32_t SDCTL;
  union {
    volatile uint32_t SBLIM;
    volatile const uint32_t TOTSAM;
  };
  volatile uint32_t FRQMIN;
  union {
    volatile const uint32_t FRQCNT;
    volatile uint32_t FRQMAX;
  };
  union {
    volatile const uint32_t SCMC;
    volatile uint32_t SCML;
  };
  union {
    volatile const uint32_t SCR1C;
    volatile uint32_t SCR1L;
  };
  union {
    volatile const uint32_t SCR2C;
    volatile uint32_t SCR2L;
  };
  union {
    volatile const uint32_t SCR3C;
    volatile uint32_t SCR3L;
  };
  union {
    volatile const uint32_t SCR4C;
    volatile uint32_t SCR4L;
  };
  union {
    volatile const uint32_t SCR5C;
    volatile uint32_t SCR5L;
  };
  union {
    volatile const uint32_t SCR6PC;
    volatile uint32_t SCR6PL;
  };
  volatile const uint32_t STATUS;
  volatile const uint32_t ENT[16];
  volatile const uint32_t PKRCNT10;
  volatile const uint32_t PKRCNT32;
  volatile const uint32_t PKRCNT54;
  volatile const uint32_t PKRCNT76;
  volatile const uint32_t PKRCNT98;
  volatile const uint32_t PKRCNTBA;
  volatile const uint32_t PKRCNTDC;
  volatile const uint32_t PKRCNTFE;
  volatile uint32_t SEC_CFG;
  volatile uint32_t INT_CTRL;
  volatile uint32_t INT_MASK;
  volatile const uint32_t INT_STATUS;
       uint8_t RESERVED_0[64];
  volatile const uint32_t VID1;
  volatile const uint32_t VID2;
} TRNG_Type;
# 47180 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t BASIC_SETTING;
       uint8_t RESERVED_0[12];
  volatile uint32_t PRE_CHARGE_TIME;
       uint8_t RESERVED_1[12];
  volatile uint32_t FLOW_CONTROL;
       uint8_t RESERVED_2[12];
  volatile const uint32_t MEASEURE_VALUE;
       uint8_t RESERVED_3[12];
  volatile uint32_t INT_EN;
       uint8_t RESERVED_4[12];
  volatile uint32_t INT_SIG_EN;
       uint8_t RESERVED_5[12];
  volatile uint32_t INT_STATUS;
       uint8_t RESERVED_6[12];
  volatile uint32_t DEBUG_MODE;
       uint8_t RESERVED_7[12];
  volatile uint32_t DEBUG_MODE2;
} TSC_Type;
# 47678 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile const uint32_t ID;
  volatile const uint32_t HWGENERAL;
  volatile const uint32_t HWHOST;
  volatile const uint32_t HWDEVICE;
  volatile const uint32_t HWTXBUF;
  volatile const uint32_t HWRXBUF;
       uint8_t RESERVED_0[104];
  volatile uint32_t GPTIMER0LD;
  volatile uint32_t GPTIMER0CTRL;
  volatile uint32_t GPTIMER1LD;
  volatile uint32_t GPTIMER1CTRL;
  volatile uint32_t SBUSCFG;
       uint8_t RESERVED_1[108];
  volatile const uint8_t CAPLENGTH;
       uint8_t RESERVED_2[1];
  volatile const uint16_t HCIVERSION;
  volatile const uint32_t HCSPARAMS;
  volatile const uint32_t HCCPARAMS;
       uint8_t RESERVED_3[20];
  volatile const uint16_t DCIVERSION;
       uint8_t RESERVED_4[2];
  volatile const uint32_t DCCPARAMS;
       uint8_t RESERVED_5[24];
  volatile uint32_t USBCMD;
  volatile uint32_t USBSTS;
  volatile uint32_t USBINTR;
  volatile uint32_t FRINDEX;
       uint8_t RESERVED_6[4];
  union {
    volatile uint32_t DEVICEADDR;
    volatile uint32_t PERIODICLISTBASE;
  };
  union {
    volatile uint32_t ASYNCLISTADDR;
    volatile uint32_t ENDPTLISTADDR;
  };
       uint8_t RESERVED_7[4];
  volatile uint32_t BURSTSIZE;
  volatile uint32_t TXFILLTUNING;
       uint8_t RESERVED_8[16];
  volatile uint32_t ENDPTNAK;
  volatile uint32_t ENDPTNAKEN;
  volatile const uint32_t CONFIGFLAG;
  volatile uint32_t PORTSC1;
       uint8_t RESERVED_9[28];
  volatile uint32_t OTGSC;
  volatile uint32_t USBMODE;
  volatile uint32_t ENDPTSETUPSTAT;
  volatile uint32_t ENDPTPRIME;
  volatile uint32_t ENDPTFLUSH;
  volatile const uint32_t ENDPTSTAT;
  volatile uint32_t ENDPTCOMPLETE;
  volatile uint32_t ENDPTCTRL0;
  volatile uint32_t ENDPTCTRL[7];
} USB_Type;
# 49418 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
       uint8_t RESERVED_0[2048];
  volatile uint32_t USB_OTGn_CTRL;
       uint8_t RESERVED_1[20];
  volatile uint32_t USB_OTGn_PHY_CTRL_0;
} USBNC_Type;
# 49565 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t PWD;
  volatile uint32_t PWD_SET;
  volatile uint32_t PWD_CLR;
  volatile uint32_t PWD_TOG;
  volatile uint32_t TX;
  volatile uint32_t TX_SET;
  volatile uint32_t TX_CLR;
  volatile uint32_t TX_TOG;
  volatile uint32_t RX;
  volatile uint32_t RX_SET;
  volatile uint32_t RX_CLR;
  volatile uint32_t RX_TOG;
  volatile uint32_t CTRL;
  volatile uint32_t CTRL_SET;
  volatile uint32_t CTRL_CLR;
  volatile uint32_t CTRL_TOG;
  volatile uint32_t STATUS;
       uint8_t RESERVED_0[12];
  volatile uint32_t DEBUGr;
  volatile uint32_t DEBUG_SET;
  volatile uint32_t DEBUG_CLR;
  volatile uint32_t DEBUG_TOG;
  volatile const uint32_t DEBUG0_STATUS;
       uint8_t RESERVED_1[12];
  volatile uint32_t DEBUG1;
  volatile uint32_t DEBUG1_SET;
  volatile uint32_t DEBUG1_CLR;
  volatile uint32_t DEBUG1_TOG;
  volatile const uint32_t VERSION;
} USBPHY_Type;
# 50987 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
       uint8_t RESERVED_0[416];
  struct {
    volatile uint32_t VBUS_DETECT;
    volatile uint32_t VBUS_DETECT_SET;
    volatile uint32_t VBUS_DETECT_CLR;
    volatile uint32_t VBUS_DETECT_TOG;
    volatile uint32_t CHRG_DETECT;
    volatile uint32_t CHRG_DETECT_SET;
    volatile uint32_t CHRG_DETECT_CLR;
    volatile uint32_t CHRG_DETECT_TOG;
    volatile const uint32_t VBUS_DETECT_STAT;
         uint8_t RESERVED_0[12];
    volatile const uint32_t CHRG_DETECT_STAT;
         uint8_t RESERVED_1[12];
    volatile uint32_t LOOPBACK;
    volatile uint32_t LOOPBACK_SET;
    volatile uint32_t LOOPBACK_CLR;
    volatile uint32_t LOOPBACK_TOG;
    volatile uint32_t MISC;
    volatile uint32_t MISC_SET;
    volatile uint32_t MISC_CLR;
    volatile uint32_t MISC_TOG;
  } INSTANCE[2];
  volatile const uint32_t DIGPROG;
} USB_ANALOG_Type;
# 51495 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint32_t DS_ADDR;
  volatile uint32_t BLK_ATT;
  volatile uint32_t CMD_ARG;
  volatile uint32_t CMD_XFR_TYP;
  volatile const uint32_t CMD_RSP0;
  volatile const uint32_t CMD_RSP1;
  volatile const uint32_t CMD_RSP2;
  volatile const uint32_t CMD_RSP3;
  volatile uint32_t DATA_BUFF_ACC_PORT;
  volatile const uint32_t PRES_STATE;
  volatile uint32_t PROT_CTRL;
  volatile uint32_t SYS_CTRL;
  volatile uint32_t INT_STATUS;
  volatile uint32_t INT_STATUS_EN;
  volatile uint32_t INT_SIGNAL_EN;
  volatile uint32_t AUTOCMD12_ERR_STATUS;
  volatile uint32_t HOST_CTRL_CAP;
  volatile uint32_t WTMK_LVL;
  volatile uint32_t MIX_CTRL;
       uint8_t RESERVED_0[4];
  volatile uint32_t FORCE_EVENT;
  volatile const uint32_t ADMA_ERR_STATUS;
  volatile uint32_t ADMA_SYS_ADDR;
       uint8_t RESERVED_1[4];
  volatile uint32_t DLL_CTRL;
  volatile const uint32_t DLL_STATUS;
  volatile uint32_t CLK_TUNE_CTRL_STATUS;
       uint8_t RESERVED_2[84];
  volatile uint32_t VEND_SPEC;
  volatile uint32_t MMC_BOOT;
  volatile uint32_t VEND_SPEC2;
  volatile uint32_t TUNING_CTRL;
} USDHC_Type;
# 53364 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint16_t WCR;
  volatile uint16_t WSR;
  volatile const uint16_t WRSR;
  volatile uint16_t WICR;
  volatile uint16_t WMCR;
} WDOG_Type;
# 53579 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint16_t SEL0;
  volatile uint16_t SEL1;
  volatile uint16_t SEL2;
  volatile uint16_t SEL3;
  volatile uint16_t SEL4;
  volatile uint16_t SEL5;
  volatile uint16_t SEL6;
  volatile uint16_t SEL7;
  volatile uint16_t SEL8;
  volatile uint16_t SEL9;
  volatile uint16_t SEL10;
  volatile uint16_t SEL11;
  volatile uint16_t SEL12;
  volatile uint16_t SEL13;
  volatile uint16_t SEL14;
  volatile uint16_t SEL15;
  volatile uint16_t SEL16;
  volatile uint16_t SEL17;
  volatile uint16_t SEL18;
  volatile uint16_t SEL19;
  volatile uint16_t SEL20;
  volatile uint16_t SEL21;
  volatile uint16_t SEL22;
  volatile uint16_t SEL23;
  volatile uint16_t SEL24;
  volatile uint16_t SEL25;
  volatile uint16_t SEL26;
  volatile uint16_t SEL27;
  volatile uint16_t SEL28;
  volatile uint16_t SEL29;
  volatile uint16_t SEL30;
  volatile uint16_t SEL31;
  volatile uint16_t SEL32;
  volatile uint16_t SEL33;
  volatile uint16_t SEL34;
  volatile uint16_t SEL35;
  volatile uint16_t SEL36;
  volatile uint16_t SEL37;
  volatile uint16_t SEL38;
  volatile uint16_t SEL39;
  volatile uint16_t SEL40;
  volatile uint16_t SEL41;
  volatile uint16_t SEL42;
  volatile uint16_t SEL43;
  volatile uint16_t SEL44;
  volatile uint16_t SEL45;
  volatile uint16_t SEL46;
  volatile uint16_t SEL47;
  volatile uint16_t SEL48;
  volatile uint16_t SEL49;
  volatile uint16_t SEL50;
  volatile uint16_t SEL51;
  volatile uint16_t SEL52;
  volatile uint16_t SEL53;
  volatile uint16_t SEL54;
  volatile uint16_t SEL55;
  volatile uint16_t SEL56;
  volatile uint16_t SEL57;
  volatile uint16_t SEL58;
  volatile uint16_t SEL59;
  volatile uint16_t SEL60;
  volatile uint16_t SEL61;
  volatile uint16_t SEL62;
  volatile uint16_t SEL63;
  volatile uint16_t SEL64;
  volatile uint16_t SEL65;
  volatile uint16_t CTRL0;
  volatile uint16_t CTRL1;
} XBARA_Type;
# 54626 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
  volatile uint16_t SEL0;
  volatile uint16_t SEL1;
  volatile uint16_t SEL2;
  volatile uint16_t SEL3;
  volatile uint16_t SEL4;
  volatile uint16_t SEL5;
  volatile uint16_t SEL6;
  volatile uint16_t SEL7;
} XBARB_Type;
# 54777 "../../libraries/sdk/deceive/MIMXRT1064.h"
typedef struct {
       uint8_t RESERVED_0[336];
  volatile uint32_t MISC0;
  volatile uint32_t MISC0_SET;
  volatile uint32_t MISC0_CLR;
  volatile uint32_t MISC0_TOG;
       uint8_t RESERVED_1[272];
  volatile uint32_t LOWPWR_CTRL;
  volatile uint32_t LOWPWR_CTRL_SET;
  volatile uint32_t LOWPWR_CTRL_CLR;
  volatile uint32_t LOWPWR_CTRL_TOG;
       uint8_t RESERVED_2[32];
  volatile uint32_t OSC_CONFIG0;
  volatile uint32_t OSC_CONFIG0_SET;
  volatile uint32_t OSC_CONFIG0_CLR;
  volatile uint32_t OSC_CONFIG0_TOG;
  volatile uint32_t OSC_CONFIG1;
  volatile uint32_t OSC_CONFIG1_SET;
  volatile uint32_t OSC_CONFIG1_CLR;
  volatile uint32_t OSC_CONFIG1_TOG;
  volatile uint32_t OSC_CONFIG2;
  volatile uint32_t OSC_CONFIG2_SET;
  volatile uint32_t OSC_CONFIG2_CLR;
  volatile uint32_t OSC_CONFIG2_TOG;
} XTALOSC24M_Type;
# 55887 "../../libraries/sdk/deceive/MIMXRT1064.h"
#pragma clang diagnostic pop
# 55918 "../../libraries/sdk/deceive/MIMXRT1064.h" 3
# 25 "../../libraries/sdk/deceive\\fsl_device_registers.h" 2

# 1 "../../libraries/sdk/deceive/MIMXRT1064_features.h" 1
# 27 "../../libraries/sdk/deceive\\fsl_device_registers.h" 2
# 23 "../../libraries/sdk/drives\\fsl_common.h" 2
# 79 "../../libraries/sdk/drives\\fsl_common.h"
enum _status_groups
{
    kStatusGroup_Generic = 0,
    kStatusGroup_FLASH = 1,
    kStatusGroup_LPSPI = 4,
    kStatusGroup_FLEXIO_SPI = 5,
    kStatusGroup_DSPI = 6,
    kStatusGroup_FLEXIO_UART = 7,
    kStatusGroup_FLEXIO_I2C = 8,
    kStatusGroup_LPI2C = 9,
    kStatusGroup_UART = 10,
    kStatusGroup_I2C = 11,
    kStatusGroup_LPSCI = 12,
    kStatusGroup_LPUART = 13,
    kStatusGroup_SPI = 14,
    kStatusGroup_XRDC = 15,
    kStatusGroup_SEMA42 = 16,
    kStatusGroup_SDHC = 17,
    kStatusGroup_SDMMC = 18,
    kStatusGroup_SAI = 19,
    kStatusGroup_MCG = 20,
    kStatusGroup_SCG = 21,
    kStatusGroup_SDSPI = 22,
    kStatusGroup_FLEXIO_I2S = 23,
    kStatusGroup_FLEXIO_MCULCD = 24,
    kStatusGroup_FLASHIAP = 25,
    kStatusGroup_FLEXCOMM_I2C = 26,
    kStatusGroup_I2S = 27,
    kStatusGroup_IUART = 28,
    kStatusGroup_CSI = 29,
    kStatusGroup_MIPI_DSI = 30,
    kStatusGroup_SDRAMC = 35,
    kStatusGroup_POWER = 39,
    kStatusGroup_ENET = 40,
    kStatusGroup_PHY = 41,
    kStatusGroup_TRGMUX = 42,
    kStatusGroup_SMARTCARD = 43,
    kStatusGroup_LMEM = 44,
    kStatusGroup_QSPI = 45,
    kStatusGroup_DMA = 50,
    kStatusGroup_EDMA = 51,
    kStatusGroup_DMAMGR = 52,
    kStatusGroup_FLEXCAN = 53,
    kStatusGroup_LTC = 54,
    kStatusGroup_FLEXIO_CAMERA = 55,
    kStatusGroup_LPC_SPI = 56,
    kStatusGroup_LPC_USART = 57,
    kStatusGroup_DMIC = 58,
    kStatusGroup_SDIF = 59,
    kStatusGroup_SPIFI = 60,
    kStatusGroup_OTP = 61,
    kStatusGroup_MCAN = 62,
    kStatusGroup_CAAM = 63,
    kStatusGroup_ECSPI = 64,
    kStatusGroup_USDHC = 65,
    kStatusGroup_LPC_I2C = 66,
    kStatusGroup_DCP = 67,
    kStatusGroup_MSCAN = 68,
    kStatusGroup_ESAI = 69,
    kStatusGroup_FLEXSPI = 70,
    kStatusGroup_MMDC = 71,
    kStatusGroup_PDM = 72,
    kStatusGroup_SDMA = 73,
    kStatusGroup_ICS = 74,
    kStatusGroup_SPDIF = 75,
    kStatusGroup_LPC_MINISPI = 76,
    kStatusGroup_HASHCRYPT = 77,
    kStatusGroup_LPC_SPI_SSP = 78,
    kStatusGroup_I3C = 79,
    kStatusGroup_LPC_I2C_1 = 97,
    kStatusGroup_NOTIFIER = 98,
    kStatusGroup_DebugConsole = 99,
    kStatusGroup_SEMC = 100,
    kStatusGroup_ApplicationRangeStart = 101,
    kStatusGroup_IAP = 102,
    kStatusGroup_SFA = 103,
    kStatusGroup_SPC = 104,
    kStatusGroup_PUF = 105,
    kStatusGroup_TOUCH_PANEL = 106,

    kStatusGroup_HAL_GPIO = 121,
    kStatusGroup_HAL_UART = 122,
    kStatusGroup_HAL_TIMER = 123,
    kStatusGroup_HAL_SPI = 124,
    kStatusGroup_HAL_I2C = 125,
    kStatusGroup_HAL_FLASH = 126,
    kStatusGroup_HAL_PWM = 127,
    kStatusGroup_HAL_RNG = 128,
    kStatusGroup_HAL_I2S = 129,
    kStatusGroup_TIMERMANAGER = 135,
    kStatusGroup_SERIALMANAGER = 136,
    kStatusGroup_LED = 137,
    kStatusGroup_BUTTON = 138,
    kStatusGroup_EXTERN_EEPROM = 139,
    kStatusGroup_SHELL = 140,
    kStatusGroup_MEM_MANAGER = 141,
    kStatusGroup_LIST = 142,
    kStatusGroup_OSA = 143,
    kStatusGroup_COMMON_TASK = 144,
    kStatusGroup_MSG = 145,
    kStatusGroup_SDK_OCOTP = 146,
    kStatusGroup_SDK_FLEXSPINOR = 147,
    kStatusGroup_CODEC = 148,
    kStatusGroup_ASRC = 149,
    kStatusGroup_OTFAD = 150,
    kStatusGroup_SDIOSLV = 151,
    kStatusGroup_MECC = 152,
    kStatusGroup_ENET_QOS = 153,
    kStatusGroup_LOG = 154,
    kStatusGroup_I3CBUS = 155,
    kStatusGroup_QSCI = 156,
    kStatusGroup_SNT = 157,
    kStatusGroup_QUEUEDSPI = 158,
    kStatusGroup_POWER_MANAGER = 159,
    kStatusGroup_IPED = 160,
    kStatusGroup_CSS_PKC = 161,
    kStatusGroup_HOSTIF = 162,
    kStatusGroup_CLIF = 163,
    kStatusGroup_BMA = 164,
};




enum
{
    kStatus_Success = ((((kStatusGroup_Generic)*100L) + (0))),
    kStatus_Fail = ((((kStatusGroup_Generic)*100L) + (1))),
    kStatus_ReadOnly = ((((kStatusGroup_Generic)*100L) + (2))),
    kStatus_OutOfRange = ((((kStatusGroup_Generic)*100L) + (3))),
    kStatus_InvalidArgument = ((((kStatusGroup_Generic)*100L) + (4))),
    kStatus_Timeout = ((((kStatusGroup_Generic)*100L) + (5))),
    kStatus_NoTransferInProgress =
        ((((kStatusGroup_Generic)*100L) + (6))),
    kStatus_Busy = ((((kStatusGroup_Generic)*100L) + (7))),
    kStatus_NoData =
        ((((kStatusGroup_Generic)*100L) + (8))),
};


typedef int32_t status_t;
# 282 "../../libraries/sdk/drives\\fsl_common.h"
void *SDK_Malloc(size_t size, size_t alignbytes);






void SDK_Free(void *ptr);
# 300 "../../libraries/sdk/drives\\fsl_common.h"
void SDK_DelayAtLeastUs(uint32_t delayTime_us, uint32_t coreClock_Hz);
# 313 "../../libraries/sdk/drives\\fsl_common.h"
# 1 "../../libraries/sdk/drives/fsl_common_arm.h" 1
# 91 "../../libraries/sdk/drives/fsl_common_arm.h"
static inline void _SDK_AtomicLocalAdd1Byte(volatile uint8_t *addr, uint8_t val)
{
    uint8_t s_val;

    do { (s_val) = (uint8_t)__builtin_arm_ldrex(addr); (s_val += val); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalAdd2Byte(volatile uint16_t *addr, uint16_t val)
{
    uint16_t s_val;

    do { (s_val) = (uint16_t)__builtin_arm_ldrex(addr); (s_val += val); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalAdd4Byte(volatile uint32_t *addr, uint32_t val)
{
    uint32_t s_val;

    do { (s_val) = (uint32_t)__builtin_arm_ldrex(addr); (s_val += val); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalSub1Byte(volatile uint8_t *addr, uint8_t val)
{
    uint8_t s_val;

    do { (s_val) = (uint8_t)__builtin_arm_ldrex(addr); (s_val -= val); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalSub2Byte(volatile uint16_t *addr, uint16_t val)
{
    uint16_t s_val;

    do { (s_val) = (uint16_t)__builtin_arm_ldrex(addr); (s_val -= val); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalSub4Byte(volatile uint32_t *addr, uint32_t val)
{
    uint32_t s_val;

    do { (s_val) = (uint32_t)__builtin_arm_ldrex(addr); (s_val -= val); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalSet1Byte(volatile uint8_t *addr, uint8_t bits)
{
    uint8_t s_val;

    do { (s_val) = (uint8_t)__builtin_arm_ldrex(addr); (s_val |= bits); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalSet2Byte(volatile uint16_t *addr, uint16_t bits)
{
    uint16_t s_val;

    do { (s_val) = (uint16_t)__builtin_arm_ldrex(addr); (s_val |= bits); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalSet4Byte(volatile uint32_t *addr, uint32_t bits)
{
    uint32_t s_val;

    do { (s_val) = (uint32_t)__builtin_arm_ldrex(addr); (s_val |= bits); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalClear1Byte(volatile uint8_t *addr, uint8_t bits)
{
    uint8_t s_val;

    do { (s_val) = (uint8_t)__builtin_arm_ldrex(addr); (s_val &= ~bits); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalClear2Byte(volatile uint16_t *addr, uint16_t bits)
{
    uint16_t s_val;

    do { (s_val) = (uint16_t)__builtin_arm_ldrex(addr); (s_val &= ~bits); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalClear4Byte(volatile uint32_t *addr, uint32_t bits)
{
    uint32_t s_val;

    do { (s_val) = (uint32_t)__builtin_arm_ldrex(addr); (s_val &= ~bits); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalToggle1Byte(volatile uint8_t *addr, uint8_t bits)
{
    uint8_t s_val;

    do { (s_val) = (uint8_t)__builtin_arm_ldrex(addr); (s_val ^= bits); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalToggle2Byte(volatile uint16_t *addr, uint16_t bits)
{
    uint16_t s_val;

    do { (s_val) = (uint16_t)__builtin_arm_ldrex(addr); (s_val ^= bits); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalToggle4Byte(volatile uint32_t *addr, uint32_t bits)
{
    uint32_t s_val;

    do { (s_val) = (uint32_t)__builtin_arm_ldrex(addr); (s_val ^= bits); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalClearAndSet1Byte(volatile uint8_t *addr, uint8_t clearBits, uint8_t setBits)
{
    uint8_t s_val;

    do { (s_val) = (uint8_t)__builtin_arm_ldrex(addr); (s_val = (s_val & ~clearBits) | setBits); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalClearAndSet2Byte(volatile uint16_t *addr, uint16_t clearBits, uint16_t setBits)
{
    uint16_t s_val;

    do { (s_val) = (uint16_t)__builtin_arm_ldrex(addr); (s_val = (s_val & ~clearBits) | setBits); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}

static inline void _SDK_AtomicLocalClearAndSet4Byte(volatile uint32_t *addr, uint32_t clearBits, uint32_t setBits)
{
    uint32_t s_val;

    do { (s_val) = (uint32_t)__builtin_arm_ldrex(addr); (s_val = (s_val & ~clearBits) | setBits); } while (0UL != (uint32_t)__builtin_arm_strex((s_val), (addr)));
}
# 458 "../../libraries/sdk/drives/fsl_common_arm.h"
        void DefaultISR(void);






# 1 "../../libraries/sdk/drives/fsl_clock.h" 1
# 11 "../../libraries/sdk/drives/fsl_clock.h"
# 1 "../../libraries/sdk/drives/fsl_common.h" 1
# 12 "../../libraries/sdk/drives/fsl_clock.h" 2
# 125 "../../libraries/sdk/drives/fsl_clock.h"
extern volatile uint32_t g_xtalFreq;






extern volatile uint32_t g_rtcXtalFreq;
# 466 "../../libraries/sdk/drives/fsl_clock.h"
typedef enum _clock_name
{
    kCLOCK_CpuClk = 0x0U,
    kCLOCK_AhbClk = 0x1U,
    kCLOCK_SemcClk = 0x2U,
    kCLOCK_IpgClk = 0x3U,
    kCLOCK_PerClk = 0x4U,

    kCLOCK_OscClk = 0x5U,
    kCLOCK_RtcClk = 0x6U,

    kCLOCK_ArmPllClk = 0x7U,

    kCLOCK_Usb1PllClk = 0x8U,
    kCLOCK_Usb1PllPfd0Clk = 0x9U,
    kCLOCK_Usb1PllPfd1Clk = 0xAU,
    kCLOCK_Usb1PllPfd2Clk = 0xBU,
    kCLOCK_Usb1PllPfd3Clk = 0xCU,
    kCLOCK_Usb1SwClk = 0x18U,
    kCLOCK_Usb1Sw120MClk = 0x19U,
    kCLOCK_Usb1Sw60MClk = 0x1AU,
    kCLOCK_Usb1Sw80MClk = 0x1BU,

    kCLOCK_Usb2PllClk = 0xDU,

    kCLOCK_SysPllClk = 0xEU,
    kCLOCK_SysPllPfd0Clk = 0xFU,
    kCLOCK_SysPllPfd1Clk = 0x10U,
    kCLOCK_SysPllPfd2Clk = 0x11U,
    kCLOCK_SysPllPfd3Clk = 0x12U,

    kCLOCK_EnetPll0Clk = 0x13U,
    kCLOCK_EnetPll1Clk = 0x14U,
    kCLOCK_EnetPll2Clk = 0x15U,

    kCLOCK_AudioPllClk = 0x16U,
    kCLOCK_VideoPllClk = 0x17U,

    kCLOCK_NoneName = (0xFFU),
} clock_name_t;







typedef enum _clock_ip_name
{
    kCLOCK_IpInvalid = -1,


    kCLOCK_Aips_tz1 = (0U << 8U) | (0U),
    kCLOCK_Aips_tz2 = (0U << 8U) | (2U),
    kCLOCK_Mqs = (0U << 8U) | (4U),
    kCLOCK_FlexSpiExsc = (0U << 8U) | (6U),
    kCLOCK_Sim_M_Main = (0U << 8U) | (8U),
    kCLOCK_Dcp = (0U << 8U) | (10U),
    kCLOCK_Lpuart3 = (0U << 8U) | (12U),
    kCLOCK_Can1 = (0U << 8U) | (14U),
    kCLOCK_Can1S = (0U << 8U) | (16U),
    kCLOCK_Can2 = (0U << 8U) | (18U),
    kCLOCK_Can2S = (0U << 8U) | (20U),
    kCLOCK_Trace = (0U << 8U) | (22U),
    kCLOCK_Gpt2 = (0U << 8U) | (24U),
    kCLOCK_Gpt2S = (0U << 8U) | (26U),
    kCLOCK_Lpuart2 = (0U << 8U) | (28U),
    kCLOCK_Gpio2 = (0U << 8U) | (30U),


    kCLOCK_Lpspi1 = (1U << 8U) | (0U),
    kCLOCK_Lpspi2 = (1U << 8U) | (2U),
    kCLOCK_Lpspi3 = (1U << 8U) | (4U),
    kCLOCK_Lpspi4 = (1U << 8U) | (6U),
    kCLOCK_Adc2 = (1U << 8U) | (8U),
    kCLOCK_Enet = (1U << 8U) | (10U),
    kCLOCK_Pit = (1U << 8U) | (12U),
    kCLOCK_Aoi2 = (1U << 8U) | (14U),
    kCLOCK_Adc1 = (1U << 8U) | (16U),
    kCLOCK_SemcExsc = (1U << 8U) | (18U),
    kCLOCK_Gpt1 = (1U << 8U) | (20U),
    kCLOCK_Gpt1S = (1U << 8U) | (22U),
    kCLOCK_Lpuart4 = (1U << 8U) | (24U),
    kCLOCK_Gpio1 = (1U << 8U) | (26U),
    kCLOCK_Csu = (1U << 8U) | (28U),
    kCLOCK_Gpio5 = (1U << 8U) | (30U),


    kCLOCK_OcramExsc = (2U << 8U) | (0U),
    kCLOCK_Csi = (2U << 8U) | (2U),
    kCLOCK_IomuxcSnvs = (2U << 8U) | (4U),
    kCLOCK_Lpi2c1 = (2U << 8U) | (6U),
    kCLOCK_Lpi2c2 = (2U << 8U) | (8U),
    kCLOCK_Lpi2c3 = (2U << 8U) | (10U),
    kCLOCK_Ocotp = (2U << 8U) | (12U),
    kCLOCK_Xbar3 = (2U << 8U) | (14U),
    kCLOCK_Ipmux1 = (2U << 8U) | (16U),
    kCLOCK_Ipmux2 = (2U << 8U) | (18U),
    kCLOCK_Ipmux3 = (2U << 8U) | (20U),
    kCLOCK_Xbar1 = (2U << 8U) | (22U),
    kCLOCK_Xbar2 = (2U << 8U) | (24U),
    kCLOCK_Gpio3 = (2U << 8U) | (26U),
    kCLOCK_Lcd = (2U << 8U) | (28U),
    kCLOCK_Pxp = (2U << 8U) | (30U),


    kCLOCK_Flexio2 = (3U << 8U) | (0U),
    kCLOCK_Lpuart5 = (3U << 8U) | (2U),
    kCLOCK_Semc = (3U << 8U) | (4U),
    kCLOCK_Lpuart6 = (3U << 8U) | (6U),
    kCLOCK_Aoi1 = (3U << 8U) | (8U),
    kCLOCK_LcdPixel = (3U << 8U) | (10U),
    kCLOCK_Gpio4 = (3U << 8U) | (12U),
    kCLOCK_Ewm0 = (3U << 8U) | (14U),
    kCLOCK_Wdog1 = (3U << 8U) | (16U),
    kCLOCK_FlexRam = (3U << 8U) | (18U),
    kCLOCK_Acmp1 = (3U << 8U) | (20U),
    kCLOCK_Acmp2 = (3U << 8U) | (22U),
    kCLOCK_Acmp3 = (3U << 8U) | (24U),
    kCLOCK_Acmp4 = (3U << 8U) | (26U),
    kCLOCK_Ocram = (3U << 8U) | (28U),
    kCLOCK_IomuxcSnvsGpr = (3U << 8U) | (30U),


    kCLOCK_Sim_m7_clk_r = (4U << 8U) | (0U),
    kCLOCK_Iomuxc = (4U << 8U) | (2U),
    kCLOCK_IomuxcGpr = (4U << 8U) | (4U),
    kCLOCK_Bee = (4U << 8U) | (6U),
    kCLOCK_SimM7 = (4U << 8U) | (8U),
    kCLOCK_Tsc = (4U << 8U) | (10U),
    kCLOCK_SimM = (4U << 8U) | (12U),
    kCLOCK_SimEms = (4U << 8U) | (14U),
    kCLOCK_Pwm1 = (4U << 8U) | (16U),
    kCLOCK_Pwm2 = (4U << 8U) | (18U),
    kCLOCK_Pwm3 = (4U << 8U) | (20U),
    kCLOCK_Pwm4 = (4U << 8U) | (22U),
    kCLOCK_Enc1 = (4U << 8U) | (24U),
    kCLOCK_Enc2 = (4U << 8U) | (26U),
    kCLOCK_Enc3 = (4U << 8U) | (28U),
    kCLOCK_Enc4 = (4U << 8U) | (30U),


    kCLOCK_Rom = (5U << 8U) | (0U),
    kCLOCK_Flexio1 = (5U << 8U) | (2U),
    kCLOCK_Wdog3 = (5U << 8U) | (4U),
    kCLOCK_Dma = (5U << 8U) | (6U),
    kCLOCK_Kpp = (5U << 8U) | (8U),
    kCLOCK_Wdog2 = (5U << 8U) | (10U),
    kCLOCK_Aips_tz4 = (5U << 8U) | (12U),
    kCLOCK_Spdif = (5U << 8U) | (14U),
    kCLOCK_SimMain = (5U << 8U) | (16U),
    kCLOCK_Sai1 = (5U << 8U) | (18U),
    kCLOCK_Sai2 = (5U << 8U) | (20U),
    kCLOCK_Sai3 = (5U << 8U) | (22U),
    kCLOCK_Lpuart1 = (5U << 8U) | (24U),
    kCLOCK_Lpuart7 = (5U << 8U) | (26U),
    kCLOCK_SnvsHp = (5U << 8U) | (28U),
    kCLOCK_SnvsLp = (5U << 8U) | (30U),


    kCLOCK_UsbOh3 = (6U << 8U) | (0U),
    kCLOCK_Usdhc1 = (6U << 8U) | (2U),
    kCLOCK_Usdhc2 = (6U << 8U) | (4U),
    kCLOCK_Dcdc = (6U << 8U) | (6U),
    kCLOCK_Ipmux4 = (6U << 8U) | (8U),
    kCLOCK_FlexSpi = (6U << 8U) | (10U),
    kCLOCK_Trng = (6U << 8U) | (12U),
    kCLOCK_Lpuart8 = (6U << 8U) | (14U),
    kCLOCK_Timer4 = (6U << 8U) | (16U),
    kCLOCK_Aips_tz3 = (6U << 8U) | (18U),
    kCLOCK_SimPer = (6U << 8U) | (20U),
    kCLOCK_Anadig = (6U << 8U) | (22U),
    kCLOCK_Lpi2c4 = (6U << 8U) | (24U),
    kCLOCK_Timer1 = (6U << 8U) | (26U),
    kCLOCK_Timer2 = (6U << 8U) | (28U),
    kCLOCK_Timer3 = (6U << 8U) | (30U),


    kCLOCK_Enet2 = (7U << 8U) | (0U),
    kCLOCK_FlexSpi2 = (7U << 8U) | (2U),
    kCLOCK_Axbs_l = (7U << 8U) | (4U),
    kCLOCK_Can3 = (7U << 8U) | (6U),
    kCLOCK_Can3S = (7U << 8U) | (8U),
    kCLOCK_Aips_lite = (7U << 8U) | (10U),
    kCLOCK_Flexio3 = (7U << 8U) | (12U),

} clock_ip_name_t;


typedef enum _clock_osc
{
    kCLOCK_RcOsc = 0U,
    kCLOCK_XtalOsc = 1U,
} clock_osc_t;


typedef enum _clock_gate_value
{
    kCLOCK_ClockNotNeeded = 0U,
    kCLOCK_ClockNeededRun = 1U,
    kCLOCK_ClockNeededRunWait = 3U,
} clock_gate_value_t;


typedef enum _clock_mode_t
{
    kCLOCK_ModeRun = 0U,
    kCLOCK_ModeWait = 1U,
    kCLOCK_ModeStop = 2U,
} clock_mode_t;
# 685 "../../libraries/sdk/drives/fsl_clock.h"
typedef enum _clock_mux
{
    kCLOCK_Pll3SwMux = (int)(((0x0C)&0xFFU) | (((0U)) << 8U) | (((((0x1U)) >> ((0U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_PeriphMux = (int)(((0x14)&0xFFU) | (((25U)) << 8U) | (((((0x2000000U)) >> ((25U))) & 0x1FFFU) << 13U) | (((5U)) << 26U)),



    kCLOCK_SemcAltMux = (int)(((0x14)&0xFFU) | (((7U)) << 8U) | (((((0x80U)) >> ((7U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_SemcMux = (int)(((0x14)&0xFFU) | (((6U)) << 8U) | (((((0x40U)) >> ((6U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_PrePeriphMux = (int)(((0x18)&0xFFU) | (((18U)) << 8U) | (((((0xC0000U)) >> ((18U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_TraceMux = (int)(((0x18)&0xFFU) | (((14U)) << 8U) | (((((0xC000U)) >> ((14U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_PeriphClk2Mux = (int)(((0x18)&0xFFU) | (((12U)) << 8U) | (((((0x3000U)) >> ((12U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Flexspi2Mux = (int)(((0x18)&0xFFU) | (((8U)) << 8U) | (((((0x300U)) >> ((8U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_LpspiMux = (int)(((0x18)&0xFFU) | (((4U)) << 8U) | (((((0x30U)) >> ((4U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_FlexspiMux = (int)(((0x1C)&0xFFU) | (((29U)) << 8U) | (((((0x60000000U)) >> ((29U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Usdhc2Mux = (int)(((0x1C)&0xFFU) | (((17U)) << 8U) | (((((0x20000U)) >> ((17U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Usdhc1Mux = (int)(((0x1C)&0xFFU) | (((16U)) << 8U) | (((((0x10000U)) >> ((16U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Sai3Mux = (int)(((0x1C)&0xFFU) | (((14U)) << 8U) | (((((0xC000U)) >> ((14U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Sai2Mux = (int)(((0x1C)&0xFFU) | (((12U)) << 8U) | (((((0x3000U)) >> ((12U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Sai1Mux = (int)(((0x1C)&0xFFU) | (((10U)) << 8U) | (((((0xC00U)) >> ((10U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_PerclkMux = (int)(((0x1C)&0xFFU) | (((6U)) << 8U) | (((((0x40U)) >> ((6U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_Flexio2Mux = (int)(((0x20)&0xFFU) | (((19U)) << 8U) | (((((0x180000U)) >> ((19U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_CanMux = (int)(((0x20)&0xFFU) | (((8U)) << 8U) | (((((0x300U)) >> ((8U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_UartMux = (int)(((0x24)&0xFFU) | (((6U)) << 8U) | (((((0x40U)) >> ((6U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_SpdifMux = (int)(((0x30)&0xFFU) | (((20U)) << 8U) | (((((0x300000U)) >> ((20U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Flexio1Mux = (int)(((0x30)&0xFFU) | (((7U)) << 8U) | (((((0x180U)) >> ((7U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_Lpi2cMux = (int)(((0x38)&0xFFU) | (((18U)) << 8U) | (((((0x40000U)) >> ((18U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_LcdifPreMux = (int)(((0x38)&0xFFU) | (((15U)) << 8U) | (((((0x38000U)) >> ((15U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_CsiMux = (int)(((0x3C)&0xFFU) | (((9U)) << 8U) | (((((0x600U)) >> ((9U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



} clock_mux_t;




typedef enum _clock_div_value
{
    kCLOCK_ArmDivBy1 = 0,
    kCLOCK_ArmDivBy2 = 1,
    kCLOCK_ArmDivBy3 = 2,
    kCLOCK_ArmDivBy4 = 3,
    kCLOCK_ArmDivBy5 = 4,
    kCLOCK_ArmDivBy6 = 5,
    kCLOCK_ArmDivBy7 = 6,
    kCLOCK_ArmDivBy8 = 7,

    kCLOCK_PeriphClk2DivBy1 = 0,
    kCLOCK_PeriphClk2DivBy2 = 1,
    kCLOCK_PeriphClk2DivBy3 = 2,
    kCLOCK_PeriphClk2DivBy4 = 3,
    kCLOCK_PeriphClk2DivBy5 = 4,
    kCLOCK_PeriphClk2DivBy6 = 5,
    kCLOCK_PeriphClk2DivBy7 = 6,
    kCLOCK_PeriphClk2DivBy8 = 7,

    kCLOCK_SemcDivBy1 = 0,
    kCLOCK_SemcDivBy2 = 1,
    kCLOCK_SemcDivBy3 = 2,
    kCLOCK_SemcDivBy4 = 3,
    kCLOCK_SemcDivBy5 = 4,
    kCLOCK_SemcDivBy6 = 5,
    kCLOCK_SemcDivBy7 = 6,
    kCLOCK_SemcDivBy8 = 7,

    kCLOCK_AhbDivBy1 = 0,
    kCLOCK_AhbDivBy2 = 1,
    kCLOCK_AhbDivBy3 = 2,
    kCLOCK_AhbDivBy4 = 3,
    kCLOCK_AhbDivBy5 = 4,
    kCLOCK_AhbDivBy6 = 5,
    kCLOCK_AhbDivBy7 = 6,
    kCLOCK_AhbDivBy8 = 7,

    kCLOCK_IpgDivBy1 = 0,
    kCLOCK_IpgDivBy2 = 1,
    kCLOCK_IpgDivBy3 = 2,
    kCLOCK_IpgDivBy4 = 3,

    kCLOCK_Flexspi2DivBy1 = 0,
    kCLOCK_Flexspi2DivBy2 = 1,
    kCLOCK_Flexspi2DivBy3 = 2,
    kCLOCK_Flexspi2DivBy4 = 3,
    kCLOCK_Flexspi2DivBy5 = 4,
    kCLOCK_Flexspi2DivBy6 = 5,
    kCLOCK_Flexspi2DivBy7 = 6,
    kCLOCK_Flexspi2DivBy8 = 7,

    kCLOCK_LpspiDivBy1 = 0,
    kCLOCK_LpspiDivBy2 = 1,
    kCLOCK_LpspiDivBy3 = 2,
    kCLOCK_LpspiDivBy4 = 3,
    kCLOCK_LpspiDivBy5 = 4,
    kCLOCK_LpspiDivBy6 = 5,
    kCLOCK_LpspiDivBy7 = 6,
    kCLOCK_LpspiDivBy8 = 7,

    kCLOCK_LcdifDivBy1 = 0,
    kCLOCK_LcdifDivBy2 = 1,
    kCLOCK_LcdifDivBy3 = 2,
    kCLOCK_LcdifDivBy4 = 3,
    kCLOCK_LcdifDivBy5 = 4,
    kCLOCK_LcdifDivBy6 = 5,
    kCLOCK_LcdifDivBy7 = 6,
    kCLOCK_LcdifDivBy8 = 7,

    kCLOCK_FlexspiDivBy1 = 0,
    kCLOCK_FlexspiDivBy2 = 1,
    kCLOCK_FlexspiDivBy3 = 2,
    kCLOCK_FlexspiDivBy4 = 3,
    kCLOCK_FlexspiDivBy5 = 4,
    kCLOCK_FlexspiDivBy6 = 5,
    kCLOCK_FlexspiDivBy7 = 6,
    kCLOCK_FlexspiDivBy8 = 7,

    kCLOCK_TraceDivBy1 = 0,
    kCLOCK_TraceDivBy2 = 1,
    kCLOCK_TraceDivBy3 = 2,
    kCLOCK_TraceDivBy4 = 3,

    kCLOCK_Usdhc2DivBy1 = 0,
    kCLOCK_Usdhc2DivBy2 = 1,
    kCLOCK_Usdhc2DivBy3 = 2,
    kCLOCK_Usdhc2DivBy4 = 3,
    kCLOCK_Usdhc2DivBy5 = 4,
    kCLOCK_Usdhc2DivBy6 = 5,
    kCLOCK_Usdhc2DivBy7 = 6,
    kCLOCK_Usdhc2DivBy8 = 7,

    kCLOCK_Usdhc1DivBy1 = 0,
    kCLOCK_Usdhc1DivBy2 = 1,
    kCLOCK_Usdhc1DivBy3 = 2,
    kCLOCK_Usdhc1DivBy4 = 3,
    kCLOCK_Usdhc1DivBy5 = 4,
    kCLOCK_Usdhc1DivBy6 = 5,
    kCLOCK_Usdhc1DivBy7 = 6,
    kCLOCK_Usdhc1DivBy8 = 7,

    kCLOCK_Flexio2DivBy1 = 0,
    kCLOCK_Flexio2DivBy2 = 1,
    kCLOCK_Flexio2DivBy3 = 2,
    kCLOCK_Flexio2DivBy4 = 3,
    kCLOCK_Flexio2DivBy5 = 4,
    kCLOCK_Flexio2DivBy6 = 5,
    kCLOCK_Flexio2DivBy7 = 6,
    kCLOCK_Flexio2DivBy8 = 7,

    kCLOCK_Sai3PreDivBy1 = 0,
    kCLOCK_Sai3PreDivBy2 = 1,
    kCLOCK_Sai3PreDivBy3 = 2,
    kCLOCK_Sai3PreDivBy4 = 3,
    kCLOCK_Sai3PreDivBy5 = 4,
    kCLOCK_Sai3PreDivBy6 = 5,
    kCLOCK_Sai3PreDivBy7 = 6,
    kCLOCK_Sai3PreDivBy8 = 7,

    kCLOCK_Flexio2PreDivBy1 = 0,
    kCLOCK_Flexio2PreDivBy2 = 1,
    kCLOCK_Flexio2PreDivBy3 = 2,
    kCLOCK_Flexio2PreDivBy4 = 3,
    kCLOCK_Flexio2PreDivBy5 = 4,
    kCLOCK_Flexio2PreDivBy6 = 5,
    kCLOCK_Flexio2PreDivBy7 = 6,
    kCLOCK_Flexio2PreDivBy8 = 7,

    kCLOCK_Sai1PreDivBy1 = 0,
    kCLOCK_Sai1PreDivBy2 = 1,
    kCLOCK_Sai1PreDivBy3 = 2,
    kCLOCK_Sai1PreDivBy4 = 3,
    kCLOCK_Sai1PreDivBy5 = 4,
    kCLOCK_Sai1PreDivBy6 = 5,
    kCLOCK_Sai1PreDivBy7 = 6,
    kCLOCK_Sai1PreDivBy8 = 7,

    kCLOCK_Sai2PreDivBy1 = 0,
    kCLOCK_Sai2PreDivBy2 = 1,
    kCLOCK_Sai2PreDivBy3 = 2,
    kCLOCK_Sai2PreDivBy4 = 3,
    kCLOCK_Sai2PreDivBy5 = 4,
    kCLOCK_Sai2PreDivBy6 = 5,
    kCLOCK_Sai2PreDivBy7 = 6,
    kCLOCK_Sai2PreDivBy8 = 7,

    kCLOCK_Spdif0PreDivBy1 = 0,
    kCLOCK_Spdif0PreDivBy2 = 1,
    kCLOCK_Spdif0PreDivBy3 = 2,
    kCLOCK_Spdif0PreDivBy4 = 3,
    kCLOCK_Spdif0PreDivBy5 = 4,
    kCLOCK_Spdif0PreDivBy6 = 5,
    kCLOCK_Spdif0PreDivBy7 = 6,
    kCLOCK_Spdif0PreDivBy8 = 7,

    kCLOCK_Spdif0DivBy1 = 0,
    kCLOCK_Spdif0DivBy2 = 1,
    kCLOCK_Spdif0DivBy3 = 2,
    kCLOCK_Spdif0DivBy4 = 3,
    kCLOCK_Spdif0DivBy5 = 4,
    kCLOCK_Spdif0DivBy6 = 5,
    kCLOCK_Spdif0DivBy7 = 6,
    kCLOCK_Spdif0DivBy8 = 7,

    kCLOCK_Flexio1PreDivBy1 = 0,
    kCLOCK_Flexio1PreDivBy2 = 1,
    kCLOCK_Flexio1PreDivBy3 = 2,
    kCLOCK_Flexio1PreDivBy8 = 7,

    kCLOCK_Flexio1DivBy1 = 0,
    kCLOCK_Flexio1DivBy2 = 1,
    kCLOCK_Flexio1DivBy3 = 2,
    kCLOCK_Flexio1DivBy4 = 3,
    kCLOCK_Flexio1DivBy5 = 4,
    kCLOCK_Flexio1DivBy6 = 5,
    kCLOCK_Flexio1DivBy7 = 6,
    kCLOCK_Flexio1DivBy8 = 7,

    kCLOCK_LcdifPreDivBy1 = 0,
    kCLOCK_LcdifPreDivBy2 = 1,
    kCLOCK_LcdifPreDivBy3 = 2,
    kCLOCK_LcdifPreDivBy4 = 3,
    kCLOCK_LcdifPreDivBy5 = 4,
    kCLOCK_LcdifPreDivBy6 = 5,
    kCLOCK_LcdifPreDivBy7 = 6,
    kCLOCK_LcdifPreDivBy8 = 7,

    kCLOCK_CsiDivBy1 = 0,
    kCLOCK_CsiDivBy2 = 1,
    kCLOCK_CsiDivBy3 = 2,
    kCLOCK_CsiDivBy4 = 3,
    kCLOCK_CsiDivBy5 = 4,
    kCLOCK_CsiDivBy6 = 5,
    kCLOCK_CsiDivBy7 = 6,
    kCLOCK_CsiDivBy8 = 7,




    kCLOCK_MiscDivBy1 = 0 ,
    kCLOCK_MiscDivBy2 = 1 ,
    kCLOCK_MiscDivBy3 = 2 ,
    kCLOCK_MiscDivBy4 = 3 ,
    kCLOCK_MiscDivBy5 = 4 ,
    kCLOCK_MiscDivBy6 = 5 ,
    kCLOCK_MiscDivBy7 = 6 ,
    kCLOCK_MiscDivBy8 = 7 ,
    kCLOCK_MiscDivBy9 = 8 ,
    kCLOCK_MiscDivBy10 = 9 ,
    kCLOCK_MiscDivBy11 = 10,
    kCLOCK_MiscDivBy12 = 11,
    kCLOCK_MiscDivBy13 = 12,
    kCLOCK_MiscDivBy14 = 13,
    kCLOCK_MiscDivBy15 = 14,
    kCLOCK_MiscDivBy16 = 15,
    kCLOCK_MiscDivBy17 = 16,
    kCLOCK_MiscDivBy18 = 17,
    kCLOCK_MiscDivBy19 = 18,
    kCLOCK_MiscDivBy20 = 19,
    kCLOCK_MiscDivBy21 = 20,
    kCLOCK_MiscDivBy22 = 21,
    kCLOCK_MiscDivBy23 = 22,
    kCLOCK_MiscDivBy24 = 23,
    kCLOCK_MiscDivBy25 = 24,
    kCLOCK_MiscDivBy26 = 25,
    kCLOCK_MiscDivBy27 = 26,
    kCLOCK_MiscDivBy28 = 27,
    kCLOCK_MiscDivBy29 = 28,
    kCLOCK_MiscDivBy30 = 29,
    kCLOCK_MiscDivBy31 = 30,
    kCLOCK_MiscDivBy32 = 31,
    kCLOCK_MiscDivBy33 = 32,
    kCLOCK_MiscDivBy34 = 33,
    kCLOCK_MiscDivBy35 = 34,
    kCLOCK_MiscDivBy36 = 35,
    kCLOCK_MiscDivBy37 = 36,
    kCLOCK_MiscDivBy38 = 37,
    kCLOCK_MiscDivBy39 = 38,
    kCLOCK_MiscDivBy40 = 39,
    kCLOCK_MiscDivBy41 = 40,
    kCLOCK_MiscDivBy42 = 41,
    kCLOCK_MiscDivBy43 = 42,
    kCLOCK_MiscDivBy44 = 43,
    kCLOCK_MiscDivBy45 = 44,
    kCLOCK_MiscDivBy46 = 45,
    kCLOCK_MiscDivBy47 = 46,
    kCLOCK_MiscDivBy48 = 47,
    kCLOCK_MiscDivBy49 = 48,
    kCLOCK_MiscDivBy50 = 49,
    kCLOCK_MiscDivBy51 = 50,
    kCLOCK_MiscDivBy52 = 51,
    kCLOCK_MiscDivBy53 = 52,
    kCLOCK_MiscDivBy54 = 53,
    kCLOCK_MiscDivBy55 = 54,
    kCLOCK_MiscDivBy56 = 55,
    kCLOCK_MiscDivBy57 = 56,
    kCLOCK_MiscDivBy58 = 57,
    kCLOCK_MiscDivBy59 = 58,
    kCLOCK_MiscDivBy60 = 59,
    kCLOCK_MiscDivBy61 = 60,
    kCLOCK_MiscDivBy62 = 61,
    kCLOCK_MiscDivBy63 = 62,
    kCLOCK_MiscDivBy64 = 63,
} clock_div_value_t;
# 1070 "../../libraries/sdk/drives/fsl_clock.h"
typedef enum _clock_div
{
    kCLOCK_ArmDiv = (int)(((0x10)&0xFFU) | (((0U)) << 8U) | (((((0x7U)) >> ((0U))) & 0x1FFFU) << 13U) | (((16U)) << 26U)),




    kCLOCK_PeriphClk2Div = (int)(((0x14)&0xFFU) | (((27U)) << 8U) | (((((0x38000000U)) >> ((27U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_SemcDiv = (int)(((0x14)&0xFFU) | (((16U)) << 8U) | (((((0x70000U)) >> ((16U))) & 0x1FFFU) << 13U) | (((0U)) << 26U)),



    kCLOCK_AhbDiv = (int)(((0x14)&0xFFU) | (((10U)) << 8U) | (((((0x1C00U)) >> ((10U))) & 0x1FFFU) << 13U) | (((1U)) << 26U)),



    kCLOCK_IpgDiv = (int)(((0x14)&0xFFU) | (((8U)) << 8U) | (((((0x300U)) >> ((8U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),


    kCLOCK_Flexspi2Div = (int)(((0x18)&0xFFU) | (((29U)) << 8U) | (((((0xE0000000U)) >> ((29U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_LpspiDiv = (int)(((0x18)&0xFFU) | (((26U)) << 8U) | (((((0x1C000000U)) >> ((26U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),

    kCLOCK_LcdifDiv = (int)(((0x18)&0xFFU) | (((23U)) << 8U) | (((((0x3800000U)) >> ((23U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),


    kCLOCK_FlexspiDiv = (int)(((0x1C)&0xFFU) | (((23U)) << 8U) | (((((0x3800000U)) >> ((23U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_PerclkDiv = (int)(((0x1C)&0xFFU) | (((0U)) << 8U) | (((((0x3FU)) >> ((0U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_CanDiv = (int)(((0x20)&0xFFU) | (((2U)) << 8U) | (((((0xFCU)) >> ((2U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_TraceDiv = (int)(((0x24)&0xFFU) | (((25U)) << 8U) | (((((0x6000000U)) >> ((25U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Usdhc2Div = (int)(((0x24)&0xFFU) | (((16U)) << 8U) | (((((0x70000U)) >> ((16U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Usdhc1Div = (int)(((0x24)&0xFFU) | (((11U)) << 8U) | (((((0x3800U)) >> ((11U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_UartDiv = (int)(((0x24)&0xFFU) | (((0U)) << 8U) | (((((0x3FU)) >> ((0U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_Flexio2Div = (int)(((0x28)&0xFFU) | (((25U)) << 8U) | (((((0xE000000U)) >> ((25U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Sai3PreDiv = (int)(((0x28)&0xFFU) | (((22U)) << 8U) | (((((0x1C00000U)) >> ((22U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Sai3Div = (int)(((0x28)&0xFFU) | (((16U)) << 8U) | (((((0x3F0000U)) >> ((16U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Flexio2PreDiv = (int)(((0x28)&0xFFU) | (((9U)) << 8U) | (((((0xE00U)) >> ((9U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Sai1PreDiv = (int)(((0x28)&0xFFU) | (((6U)) << 8U) | (((((0x1C0U)) >> ((6U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Sai1Div = (int)(((0x28)&0xFFU) | (((0U)) << 8U) | (((((0x3FU)) >> ((0U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_Sai2PreDiv = (int)(((0x2C)&0xFFU) | (((6U)) << 8U) | (((((0x1C0U)) >> ((6U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Sai2Div = (int)(((0x2C)&0xFFU) | (((0U)) << 8U) | (((((0x3FU)) >> ((0U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_Spdif0PreDiv = (int)(((0x30)&0xFFU) | (((25U)) << 8U) | (((((0xE000000U)) >> ((25U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Spdif0Div = (int)(((0x30)&0xFFU) | (((22U)) << 8U) | (((((0x1C00000U)) >> ((22U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Flexio1PreDiv = (int)(((0x30)&0xFFU) | (((12U)) << 8U) | (((((0x7000U)) >> ((12U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_Flexio1Div = (int)(((0x30)&0xFFU) | (((9U)) << 8U) | (((((0xE00U)) >> ((9U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_Lpi2cDiv = (int)(((0x38)&0xFFU) | (((19U)) << 8U) | (((((0x1F80000U)) >> ((19U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),



    kCLOCK_LcdifPreDiv = (int)(((0x38)&0xFFU) | (((12U)) << 8U) | (((((0x7000U)) >> ((12U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),




    kCLOCK_CsiDiv = (int)(((0x3C)&0xFFU) | (((11U)) << 8U) | (((((0x3800U)) >> ((11U))) & 0x1FFFU) << 13U) | (((0x20U)) << 26U)),


    kCLOCK_NonePreDiv = 0UL,
} clock_div_t;


typedef enum _clock_usb_src
{
    kCLOCK_Usb480M = 0,
    kCLOCK_UsbSrcUnused = (int)0xFFFFFFFFU,

} clock_usb_src_t;


typedef enum _clock_usb_phy_src
{
    kCLOCK_Usbphy480M = 0,
} clock_usb_phy_src_t;


enum _clock_pll_clk_src
{
    kCLOCK_PllClkSrc24M = 0U,
    kCLOCK_PllSrcClkPN = 1U,
};


typedef struct _clock_arm_pll_config
{
    uint32_t loopDivider;
    uint8_t src;
} clock_arm_pll_config_t;


typedef struct _clock_usb_pll_config
{
    uint8_t loopDivider;


    uint8_t src;

} clock_usb_pll_config_t;


typedef struct _clock_sys_pll_config
{
    uint8_t loopDivider;


    uint32_t numerator;
    uint32_t denominator;
    uint8_t src;
    uint16_t ss_stop;
    uint8_t ss_enable;
    uint16_t ss_step;
} clock_sys_pll_config_t;


typedef struct _clock_audio_pll_config
{
    uint8_t loopDivider;
    uint8_t postDivider;
    uint32_t numerator;
    uint32_t denominator;
    uint8_t src;
} clock_audio_pll_config_t;


typedef struct _clock_video_pll_config
{
    uint8_t loopDivider;
    uint8_t postDivider;
    uint32_t numerator;
    uint32_t denominator;
    uint8_t src;

} clock_video_pll_config_t;


typedef struct _clock_enet_pll_config
{
    _Bool enableClkOutput;
    _Bool enableClkOutput25M;
    uint8_t loopDivider;




    uint8_t src;
    _Bool enableClkOutput1;
    uint8_t loopDivider1;




} clock_enet_pll_config_t;


typedef enum _clock_pll
{
    kCLOCK_PllArm = ((((0x00)&0xFFFU) << 16U) | ((13U))),
    kCLOCK_PllSys = ((((0x30)&0xFFFU) << 16U) | ((13U))),
    kCLOCK_PllUsb1 = ((((0x10)&0xFFFU) << 16U) | ((13U))),
    kCLOCK_PllAudio = ((((0x70)&0xFFFU) << 16U) | ((13U))),
    kCLOCK_PllVideo = ((((0xA0)&0xFFFU) << 16U) | ((13U))),

    kCLOCK_PllEnet = ((((0xE0)&0xFFFU) << 16U) | ((13U))),
    kCLOCK_PllEnet2 = ((((0xE0)&0xFFFU) << 16U) | ((20U))),
    kCLOCK_PllEnet25M = ((((0xE0)&0xFFFU) << 16U) | ((21U))),

    kCLOCK_PllUsb2 = ((((0x20)&0xFFFU) << 16U) | ((13U))),

} clock_pll_t;


typedef enum _clock_pfd
{
    kCLOCK_Pfd0 = 0U,
    kCLOCK_Pfd1 = 1U,
    kCLOCK_Pfd2 = 2U,
    kCLOCK_Pfd3 = 3U,
} clock_pfd_t;




typedef enum _clock_output1_selection
{
    kCLOCK_OutputPllUsb1 = 0U,
    kCLOCK_OutputPllSys = 1U,
    kCLOCK_OutputPllVideo = 3U,
    kCLOCK_OutputSemcClk = 5U,
    kCLOCK_OutputLcdifPixClk = 0xAU,
    kCLOCK_OutputAhbClk = 0xBU,
    kCLOCK_OutputIpgClk = 0xCU,
    kCLOCK_OutputPerClk = 0xDU,
    kCLOCK_OutputCkilSyncClk = 0xEU,
    kCLOCK_OutputPll4MainClk = 0xFU,
    kCLOCK_DisableClockOutput1 = 0x10U,
} clock_output1_selection_t;





typedef enum _clock_output2_selection
{
    kCLOCK_OutputUsdhc1Clk = 3U,
    kCLOCK_OutputLpi2cClk = 6U,
    kCLOCK_OutputCsiClk = 0xBU,
    kCLOCK_OutputOscClk = 0xEU,
    kCLOCK_OutputUsdhc2Clk = 0x11U,
    kCLOCK_OutputSai1Clk = 0x12U,
    kCLOCK_OutputSai2Clk = 0x13U,
    kCLOCK_OutputSai3Clk = 0x14U,
    kCLOCK_OutputCanClk = 0x17U,
    kCLOCK_OutputFlexspiClk = 0x1BU,
    kCLOCK_OutputUartClk = 0x1CU,
    kCLOCK_OutputSpdif0Clk = 0x1DU,
    kCLOCK_DisableClockOutput2 = 0x1FU,
} clock_output2_selection_t;




typedef enum _clock_output_divider
{
    kCLOCK_DivideBy1 = 0U,
    kCLOCK_DivideBy2,
    kCLOCK_DivideBy3,
    kCLOCK_DivideBy4,
    kCLOCK_DivideBy5,
    kCLOCK_DivideBy6,
    kCLOCK_DivideBy7,
    kCLOCK_DivideBy8,
} clock_output_divider_t;




typedef enum _clock_root
{
    kCLOCK_Usdhc1ClkRoot = 0U,
    kCLOCK_Usdhc2ClkRoot,
    kCLOCK_FlexspiClkRoot,
    kCLOCK_Flexspi2ClkRoot,
    kCLOCK_CsiClkRoot,
    kCLOCK_LpspiClkRoot,
    kCLOCK_TraceClkRoot,
    kCLOCK_Sai1ClkRoot,
    kCLOCK_Sai2ClkRoot,
    kCLOCK_Sai3ClkRoot,
    kCLOCK_Lpi2cClkRoot,
    kCLOCK_CanClkRoot,
    kCLOCK_UartClkRoot,
    kCLOCK_LcdifClkRoot,
    kCLOCK_SpdifClkRoot,
    kCLOCK_Flexio1ClkRoot,
    kCLOCK_Flexio2ClkRoot,
} clock_root_t;
# 1408 "../../libraries/sdk/drives/fsl_clock.h"
static inline void CLOCK_SetMux(clock_mux_t mux, uint32_t value)
{
    uint32_t busyShift;

    busyShift = (uint32_t)((((uint32_t)mux) >> 26U) & 0x3FU);
    (*((volatile uint32_t *)(((uint32_t)(((CCM_Type *)(0x400FC000u)))) + ((uint32_t)(mux)&0xFFU)))) = ((*((volatile uint32_t *)(((uint32_t)(((CCM_Type *)(0x400FC000u)))) + ((uint32_t)(mux)&0xFFU)))) & (~((uint32_t)((((uint32_t)(mux) >> 13U) & 0x1FFFU) << (((((uint32_t)mux) >> 8U) & 0x1FU)))))) |
                              (((uint32_t)((value) << ((((uint32_t)mux) >> 8U) & 0x1FU))) & ((uint32_t)((((uint32_t)(mux) >> 13U) & 0x1FFFU) << (((((uint32_t)mux) >> 8U) & 0x1FU)))));

    ((busyShift <= (0x20U)) ? (void)0 : __aeabi_assert("busyShift <= CCM_NO_BUSY_WAIT", "../../libraries/sdk/drives/fsl_clock.h", 1416),
# 1416 "../../libraries/sdk/drives/fsl_clock.h"
#pragma clang diagnostic push
# 1416 "../../libraries/sdk/drives/fsl_clock.h"
#pragma clang diagnostic ignored "-Wassume"
# 1416 "../../libraries/sdk/drives/fsl_clock.h"
    (__builtin_assume)((busyShift <= (0x20U))?1:0)
# 1416 "../../libraries/sdk/drives/fsl_clock.h"
#pragma clang diagnostic pop
# 1416 "../../libraries/sdk/drives/fsl_clock.h"
    );


    if ((0x20U) != busyShift)
    {

        while ((((CCM_Type *)(0x400FC000u))->CDHIPR & ((1UL << busyShift))) != 0UL)
        {
        }
    }
}







static inline uint32_t CLOCK_GetMux(clock_mux_t mux)
{
    return (((uint32_t)((*((volatile uint32_t *)(((uint32_t)(((CCM_Type *)(0x400FC000u)))) + ((uint32_t)(mux)&0xFFU)))) & ((uint32_t)((((uint32_t)(mux) >> 13U) & 0x1FFFU) << (((((uint32_t)mux) >> 8U) & 0x1FU)))))) >> ((((uint32_t)mux) >> 8U) & 0x1FU));
}
# 1461 "../../libraries/sdk/drives/fsl_clock.h"
static inline void CLOCK_SetDiv(clock_div_t divider, uint32_t value)
{
    uint32_t busyShift;

    busyShift = ((((uint32_t)divider) >> 26U) & 0x3FU);
    (*((volatile uint32_t *)(((uint32_t)(((CCM_Type *)(0x400FC000u)))) + ((uint32_t)(divider)&0xFFU)))) = ((*((volatile uint32_t *)(((uint32_t)(((CCM_Type *)(0x400FC000u)))) + ((uint32_t)(divider)&0xFFU)))) & (~((uint32_t)((((uint32_t)(divider) >> 13U) & 0x1FFFU) << (((((uint32_t)divider) >> 8U) & 0x1FU)))))) |
                                  (((uint32_t)((value) << ((((uint32_t)divider) >> 8U) & 0x1FU))) & ((uint32_t)((((uint32_t)(divider) >> 13U) & 0x1FFFU) << (((((uint32_t)divider) >> 8U) & 0x1FU)))));

    ((busyShift <= (0x20U)) ? (void)0 : __aeabi_assert("busyShift <= CCM_NO_BUSY_WAIT", "../../libraries/sdk/drives/fsl_clock.h", 1469),
# 1469 "../../libraries/sdk/drives/fsl_clock.h"
#pragma clang diagnostic push
# 1469 "../../libraries/sdk/drives/fsl_clock.h"
#pragma clang diagnostic ignored "-Wassume"
# 1469 "../../libraries/sdk/drives/fsl_clock.h"
    (__builtin_assume)((busyShift <= (0x20U))?1:0)
# 1469 "../../libraries/sdk/drives/fsl_clock.h"
#pragma clang diagnostic pop
# 1469 "../../libraries/sdk/drives/fsl_clock.h"
    );


    if ((0x20U) != busyShift)
    {

        while ((((CCM_Type *)(0x400FC000u))->CDHIPR & ((uint32_t)(1UL << busyShift))) != 0UL)
        {
        }
    }
}






static inline uint32_t CLOCK_GetDiv(clock_div_t divider)
{
    return ((uint32_t)((*((volatile uint32_t *)(((uint32_t)(((CCM_Type *)(0x400FC000u)))) + ((uint32_t)(divider)&0xFFU)))) & ((uint32_t)((((uint32_t)(divider) >> 13U) & 0x1FFFU) << (((((uint32_t)divider) >> 8U) & 0x1FU))))) >> ((((uint32_t)divider) >> 8U) & 0x1FU));
}







static inline void CLOCK_ControlGate(clock_ip_name_t name, clock_gate_value_t value)
{
    uint32_t index = ((uint32_t)name) >> 8UL;
    uint32_t shift = ((uint32_t)name) & 0x1FUL;
    volatile uint32_t *reg;

    ((index <= 7UL) ? (void)0 : __aeabi_assert("index <= 7UL", "../../libraries/sdk/drives/fsl_clock.h", 1503),
# 1503 "../../libraries/sdk/drives/fsl_clock.h"
#pragma clang diagnostic push
# 1503 "../../libraries/sdk/drives/fsl_clock.h"
#pragma clang diagnostic ignored "-Wassume"
# 1503 "../../libraries/sdk/drives/fsl_clock.h"
    (__builtin_assume)((index <= 7UL)?1:0)
# 1503 "../../libraries/sdk/drives/fsl_clock.h"
#pragma clang diagnostic pop
# 1503 "../../libraries/sdk/drives/fsl_clock.h"
    );

    reg = (volatile uint32_t *)(&(((volatile uint32_t *)&((CCM_Type *)(0x400FC000u))->CCGR0)[index]));
    ((1UL == sizeof(*(reg))) ? _SDK_AtomicLocalClearAndSet1Byte((volatile uint8_t *)(volatile void *)(reg), (uint8_t)((3UL << shift)), (uint8_t)((((uint32_t)value) << (uint32_t)shift))) : ((2UL == sizeof(*(reg))) ? _SDK_AtomicLocalClearAndSet2Byte((volatile uint16_t *)(volatile void *)(reg), (uint16_t)((3UL << shift)), (uint16_t)((((uint32_t)value) << (uint32_t)shift))) : _SDK_AtomicLocalClearAndSet4Byte((volatile uint32_t *)(volatile void *)(reg), (uint32_t)((3UL << shift)), (uint32_t)((((uint32_t)value) << (uint32_t)shift)))));
}






static inline void CLOCK_EnableClock(clock_ip_name_t name)
{
    CLOCK_ControlGate(name, kCLOCK_ClockNeededRunWait);
}






static inline void CLOCK_DisableClock(clock_ip_name_t name)
{
    CLOCK_ControlGate(name, kCLOCK_ClockNotNeeded);
}






static inline void CLOCK_SetMode(clock_mode_t mode)
{
    ((CCM_Type *)(0x400FC000u))->CLPCR = (((CCM_Type *)(0x400FC000u))->CLPCR & ~(0x3U)) | (((uint32_t)(((uint32_t)((uint32_t)mode)) << (0U))) & (0x3U));
}
# 1547 "../../libraries/sdk/drives/fsl_clock.h"
static inline uint32_t CLOCK_GetOscFreq(void)
{
    return ((((XTALOSC24M_Type *)(0x400D8000u))->LOWPWR_CTRL & (0x10U)) != 0UL) ? 24000000UL : g_xtalFreq;
}






uint32_t CLOCK_GetAhbFreq(void);






uint32_t CLOCK_GetSemcFreq(void);






uint32_t CLOCK_GetIpgFreq(void);






uint32_t CLOCK_GetPerClkFreq(void);
# 1589 "../../libraries/sdk/drives/fsl_clock.h"
uint32_t CLOCK_GetFreq(clock_name_t name);






static inline uint32_t CLOCK_GetCpuClkFreq(void)
{
    return CLOCK_GetFreq(kCLOCK_CpuClk);
}







uint32_t CLOCK_GetClockRootFreq(clock_root_t clockRoot);
# 1628 "../../libraries/sdk/drives/fsl_clock.h"
void CLOCK_InitExternalClk(_Bool bypassXtalOsc);
# 1638 "../../libraries/sdk/drives/fsl_clock.h"
void CLOCK_DeinitExternalClk(void);
# 1647 "../../libraries/sdk/drives/fsl_clock.h"
void CLOCK_SwitchOsc(clock_osc_t osc);






static inline uint32_t CLOCK_GetRtcFreq(void)
{
    return 32768U;
}






static inline void CLOCK_SetXtalFreq(uint32_t freq)
{
    g_xtalFreq = freq;
}






static inline void CLOCK_SetRtcXtalFreq(uint32_t freq)
{
    g_rtcXtalFreq = freq;
}




void CLOCK_InitRcOsc24M(void);




void CLOCK_DeinitRcOsc24M(void);
# 1701 "../../libraries/sdk/drives/fsl_clock.h"
_Bool CLOCK_EnableUsbhs0Clock(clock_usb_src_t src, uint32_t freq);
# 1714 "../../libraries/sdk/drives/fsl_clock.h"
_Bool CLOCK_EnableUsbhs1Clock(clock_usb_src_t src, uint32_t freq);
# 1731 "../../libraries/sdk/drives/fsl_clock.h"
static inline void CLOCK_SetPllBypass(CCM_ANALOG_Type *base, clock_pll_t pll, _Bool bypass)
{
    if (bypass)
    {
        (*((volatile uint32_t *)((uint32_t)(base) + (((uint32_t)(pll) >> 16U) & 0xFFFU) + (4U)))) = 1UL << (16U);
    }
    else
    {
        (*((volatile uint32_t *)((uint32_t)(base) + (((uint32_t)(pll) >> 16U) & 0xFFFU) + (8U)))) = 1UL << (16U);
    }
}
# 1752 "../../libraries/sdk/drives/fsl_clock.h"
static inline _Bool CLOCK_IsPllBypassed(CCM_ANALOG_Type *base, clock_pll_t pll)
{
    return (_Bool)((*((volatile uint32_t *)((uint32_t)(base) + (((uint32_t)(pll) >> 16U) & 0xFFFU) + (0U)))) & (1UL << (16U)));
}
# 1766 "../../libraries/sdk/drives/fsl_clock.h"
static inline _Bool CLOCK_IsPllEnabled(CCM_ANALOG_Type *base, clock_pll_t pll)
{
    return (((*((volatile uint32_t *)((uint32_t)(base) + (((uint32_t)(pll) >> 16U) & 0xFFFU) + (0U)))) & (1UL << (((uint32_t)pll) & 0x1FU))) != 0U);
}
# 1779 "../../libraries/sdk/drives/fsl_clock.h"
static inline void CLOCK_SetPllBypassRefClkSrc(CCM_ANALOG_Type *base, clock_pll_t pll, uint32_t src)
{
    (*((volatile uint32_t *)((uint32_t)(base) + (((uint32_t)(pll) >> 16U) & 0xFFFU) + (0U)))) |= ((*((volatile uint32_t *)((uint32_t)(base) + (((uint32_t)(pll) >> 16U) & 0xFFFU) + (0U)))) & (~(0xC000U))) | src;
}
# 1792 "../../libraries/sdk/drives/fsl_clock.h"
static inline uint32_t CLOCK_GetPllBypassRefClk(CCM_ANALOG_Type *base, clock_pll_t pll)
{
    return ((((*((volatile uint32_t *)((uint32_t)(base) + (((uint32_t)(pll) >> 16U) & 0xFFFU) + (0U)))) & (0xC000U)) >>
             (14U)) == (uint32_t)kCLOCK_PllClkSrc24M) ?
               CLOCK_GetOscFreq() :
               0U;
}
# 1807 "../../libraries/sdk/drives/fsl_clock.h"
void CLOCK_InitArmPll(const clock_arm_pll_config_t *config);




void CLOCK_DeinitArmPll(void);
# 1821 "../../libraries/sdk/drives/fsl_clock.h"
void CLOCK_InitSysPll(const clock_sys_pll_config_t *config);




void CLOCK_DeinitSysPll(void);
# 1835 "../../libraries/sdk/drives/fsl_clock.h"
void CLOCK_InitUsb1Pll(const clock_usb_pll_config_t *config);




void CLOCK_DeinitUsb1Pll(void);
# 1849 "../../libraries/sdk/drives/fsl_clock.h"
void CLOCK_InitUsb2Pll(const clock_usb_pll_config_t *config);




void CLOCK_DeinitUsb2Pll(void);
# 1863 "../../libraries/sdk/drives/fsl_clock.h"
void CLOCK_InitAudioPll(const clock_audio_pll_config_t *config);




void CLOCK_DeinitAudioPll(void);
# 1877 "../../libraries/sdk/drives/fsl_clock.h"
void CLOCK_InitVideoPll(const clock_video_pll_config_t *config);




void CLOCK_DeinitVideoPll(void);







void CLOCK_InitEnetPll(const clock_enet_pll_config_t *config);






void CLOCK_DeinitEnetPll(void);
# 1907 "../../libraries/sdk/drives/fsl_clock.h"
uint32_t CLOCK_GetPllFreq(clock_pll_t pll);
# 1919 "../../libraries/sdk/drives/fsl_clock.h"
void CLOCK_InitSysPfd(clock_pfd_t pfd, uint8_t pfdFrac);
# 1928 "../../libraries/sdk/drives/fsl_clock.h"
void CLOCK_DeinitSysPfd(clock_pfd_t pfd);
# 1938 "../../libraries/sdk/drives/fsl_clock.h"
_Bool CLOCK_IsSysPfdEnabled(clock_pfd_t pfd);
# 1950 "../../libraries/sdk/drives/fsl_clock.h"
void CLOCK_InitUsb1Pfd(clock_pfd_t pfd, uint8_t pfdFrac);
# 1959 "../../libraries/sdk/drives/fsl_clock.h"
void CLOCK_DeinitUsb1Pfd(clock_pfd_t pfd);
# 1969 "../../libraries/sdk/drives/fsl_clock.h"
_Bool CLOCK_IsUsb1PfdEnabled(clock_pfd_t pfd);
# 1979 "../../libraries/sdk/drives/fsl_clock.h"
uint32_t CLOCK_GetSysPfdFreq(clock_pfd_t pfd);
# 1989 "../../libraries/sdk/drives/fsl_clock.h"
uint32_t CLOCK_GetUsb1PfdFreq(clock_pfd_t pfd);
# 2000 "../../libraries/sdk/drives/fsl_clock.h"
_Bool CLOCK_EnableUsbhs0PhyPllClock(clock_usb_phy_src_t src, uint32_t freq);





void CLOCK_DisableUsbhs0PhyPllClock(void);
# 2017 "../../libraries/sdk/drives/fsl_clock.h"
_Bool CLOCK_EnableUsbhs1PhyPllClock(clock_usb_phy_src_t src, uint32_t freq);





void CLOCK_DisableUsbhs1PhyPllClock(void);
# 2038 "../../libraries/sdk/drives/fsl_clock.h"
void CLOCK_SetClockOutput1(clock_output1_selection_t selection, clock_output_divider_t divider);







void CLOCK_SetClockOutput2(clock_output2_selection_t selection, clock_output_divider_t divider);






uint32_t CLOCK_GetClockOutCLKO1Freq(void);






uint32_t CLOCK_GetClockOutClkO2Freq(void);
# 466 "../../libraries/sdk/drives/fsl_common_arm.h" 2
# 499 "../../libraries/sdk/drives/fsl_common_arm.h"
static inline status_t EnableIRQ(IRQn_Type interrupt)
{
    status_t status = kStatus_Success;

    if (NotAvail_IRQn == interrupt)
    {
        status = kStatus_Fail;
    }
# 515 "../../libraries/sdk/drives/fsl_common_arm.h"
    else
    {



        __NVIC_EnableIRQ(interrupt);

    }

    return status;
}
# 543 "../../libraries/sdk/drives/fsl_common_arm.h"
static inline status_t DisableIRQ(IRQn_Type interrupt)
{
    status_t status = kStatus_Success;

    if (NotAvail_IRQn == interrupt)
    {
        status = kStatus_Fail;
    }
# 559 "../../libraries/sdk/drives/fsl_common_arm.h"
    else
    {



        __NVIC_DisableIRQ(interrupt);

    }

    return status;
}
# 579 "../../libraries/sdk/drives/fsl_common_arm.h"
static inline uint32_t DisableGlobalIRQ(void)
{







    uint32_t regPrimask = __get_PRIMASK();

    __disable_irq();

    return regPrimask;

}
# 606 "../../libraries/sdk/drives/fsl_common_arm.h"
static inline void EnableGlobalIRQ(uint32_t primask)
{



    __set_PRIMASK(primask);

}
# 314 "../../libraries/sdk/drives/fsl_common.h" 2
# 45 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/sdk/utilities/debug_console\\fsl_debug_console.h" 1
# 49 "../../libraries/sdk/utilities/debug_console\\fsl_debug_console.h"
# 1 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdarg.h" 1 3
# 40 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdarg.h" 3
  typedef __builtin_va_list va_list;
# 134 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdarg.h" 3
     typedef va_list __gnuc_va_list;
# 50 "../../libraries/sdk/utilities/debug_console\\fsl_debug_console.h" 2
# 108 "../../libraries/sdk/utilities/debug_console\\fsl_debug_console.h"
typedef enum _serial_port_type
{
    kSerialPort_None = 0U,
    kSerialPort_Uart = 1U,
    kSerialPort_UsbCdc,
    kSerialPort_Swo,
    kSerialPort_Virtual,
    kSerialPort_Rpmsg,
    kSerialPort_UartDma,
    kSerialPort_SpiMaster,
    kSerialPort_SpiSlave,
} serial_port_type_t;
# 161 "../../libraries/sdk/utilities/debug_console\\fsl_debug_console.h"
status_t DbgConsole_Init(uint8_t instance, uint32_t baudRate, serial_port_type_t device, uint32_t clkSrcFreq);
# 171 "../../libraries/sdk/utilities/debug_console\\fsl_debug_console.h"
status_t DbgConsole_Deinit(void);
# 209 "../../libraries/sdk/utilities/debug_console\\fsl_debug_console.h"
int DbgConsole_Printf(const char *fmt_s, ...);
# 220 "../../libraries/sdk/utilities/debug_console\\fsl_debug_console.h"
int DbgConsole_Vprintf(const char *fmt_s, va_list formatStringArg);
# 230 "../../libraries/sdk/utilities/debug_console\\fsl_debug_console.h"
int DbgConsole_Putchar(int ch);
# 240 "../../libraries/sdk/utilities/debug_console\\fsl_debug_console.h"
int DbgConsole_Scanf(char *fmt_s, ...);
# 249 "../../libraries/sdk/utilities/debug_console\\fsl_debug_console.h"
int DbgConsole_Getchar(void);
# 46 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/sdk/drives\\fsl_iomuxc.h" 1
# 1214 "../../libraries/sdk/drives\\fsl_iomuxc.h"
typedef enum _iomuxc_gpr_mode
{
    kIOMUXC_GPR_GlobalInterruptRequest = (0x1000U),
    kIOMUXC_GPR_ENET1RefClkMode = (0x2000U),
    kIOMUXC_GPR_ENET2RefClkMode = (0x4000U),
    kIOMUXC_GPR_ENET1TxClkOutputDir = (0x20000U),
    kIOMUXC_GPR_ENET2TxClkOutputDir = (0x40000U),
    kIOMUXC_GPR_SAI1MClkOutputDir = (0x80000U),
    kIOMUXC_GPR_SAI2MClkOutputDir = (0x100000U),
    kIOMUXC_GPR_SAI3MClkOutputDir = (0x200000U),
    kIOMUXC_GPR_ExcMonitorSlavErrResponse = (0x400000U),
    kIOMUXC_GPR_ENETIpgClkOn = (0x800000U),
    kIOMUXC_GPR_AHBClockEnable = (int)(0x80000000U),
} iomuxc_gpr_mode_t;

typedef enum _iomuxc_gpr_saimclk
{
    kIOMUXC_GPR_SAI1MClk1Sel = (0U),
    kIOMUXC_GPR_SAI1MClk2Sel = (3U),
    kIOMUXC_GPR_SAI1MClk3Sel = (6U),
    kIOMUXC_GPR_SAI2MClk3Sel = (8U),
    kIOMUXC_GPR_SAI3MClk3Sel = (10U),
} iomuxc_gpr_saimclk_t;

typedef enum _iomuxc_mqs_pwm_oversample_rate
{
    kIOMUXC_MqsPwmOverSampleRate32 = 0,
    kIOMUXC_MqsPwmOverSampleRate64 = 1
} iomuxc_mqs_pwm_oversample_rate_t;
# 1272 "../../libraries/sdk/drives\\fsl_iomuxc.h"
static inline void IOMUXC_SetPinMux(uint32_t muxRegister,
                                    uint32_t muxMode,
                                    uint32_t inputRegister,
                                    uint32_t inputDaisy,
                                    uint32_t configRegister,
                                    uint32_t inputOnfield)
{
    *((volatile uint32_t *)muxRegister) =
        (((uint32_t)(((uint32_t)(muxMode)) << (0U))) & (0xFU)) | (((uint32_t)(((uint32_t)(inputOnfield)) << (4U))) & (0x10U));

    if (inputRegister != 0UL)
    {
        *((volatile uint32_t *)inputRegister) = inputDaisy;
    }
}
# 1304 "../../libraries/sdk/drives\\fsl_iomuxc.h"
static inline void IOMUXC_SetPinConfig(uint32_t muxRegister,
                                       uint32_t muxMode,
                                       uint32_t inputRegister,
                                       uint32_t inputDaisy,
                                       uint32_t configRegister,
                                       uint32_t configValue)
{
    if (configRegister != 0UL)
    {
        *((volatile uint32_t *)configRegister) = configValue;
    }
}
# 1324 "../../libraries/sdk/drives\\fsl_iomuxc.h"
static inline void IOMUXC_EnableMode(IOMUXC_GPR_Type *base, uint32_t mode, _Bool enable)
{
    mode &= ~((0x7U) | (0x38U) |
              (0xC0U) | (0x300U) |
              (0xC00U));

    if (enable)
    {
        base->GPR1 |= mode;
    }
    else
    {
        base->GPR1 &= ~mode;
    }
}
# 1347 "../../libraries/sdk/drives\\fsl_iomuxc.h"
static inline void IOMUXC_SetSaiMClkClockSource(IOMUXC_GPR_Type *base, iomuxc_gpr_saimclk_t mclk, uint8_t clkSrc)
{
    uint32_t gpr;

    if (mclk > kIOMUXC_GPR_SAI1MClk2Sel)
    {
        gpr = base->GPR1 & ~((uint32_t)(0x3U) << (uint32_t)mclk);
        base->GPR1 = (((uint32_t)clkSrc & (0x3U)) << (uint32_t)mclk) | gpr;
    }
    else
    {
        gpr = base->GPR1 & ~((uint32_t)(0x7U) << (uint32_t)mclk);
        base->GPR1 = (((uint32_t)clkSrc & (0x7U)) << (uint32_t)mclk) | gpr;
    }
}







static inline void IOMUXC_MQSEnterSoftwareReset(IOMUXC_GPR_Type *base, _Bool enable)
{
    if (enable)
    {
        base->GPR2 |= (0x1000000U);
    }
    else
    {
        base->GPR2 &= ~(0x1000000U);
    }
}







static inline void IOMUXC_MQSEnable(IOMUXC_GPR_Type *base, _Bool enable)
{
    if (enable)
    {
        base->GPR2 |= (0x2000000U);
    }
    else
    {
        base->GPR2 &= ~(0x2000000U);
    }
}
# 1407 "../../libraries/sdk/drives\\fsl_iomuxc.h"
static inline void IOMUXC_MQSConfig(IOMUXC_GPR_Type *base, iomuxc_mqs_pwm_oversample_rate_t rate, uint8_t divider)
{
    uint32_t gpr = base->GPR2 & ~((0x4000000U) | (0xFF0000U));
    base->GPR2 = gpr | (((uint32_t)(((uint32_t)(rate)) << (26U))) & (0x4000000U)) | (((uint32_t)(((uint32_t)(divider)) << (16U))) & (0xFF0000U));
}
# 47 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/sdk/drives\\fsl_cache.h" 1
# 131 "../../libraries/sdk/drives\\fsl_cache.h"
static inline void L1CACHE_EnableICache(void)
{
    SCB_EnableICache();
}





static inline void L1CACHE_DisableICache(void)
{
    SCB_DisableICache();
}





static inline void L1CACHE_InvalidateICache(void)
{
    SCB_InvalidateICache();
}
# 164 "../../libraries/sdk/drives\\fsl_cache.h"
void L1CACHE_InvalidateICacheByRange(uint32_t address, uint32_t size_byte);





static inline void L1CACHE_EnableDCache(void)
{
    SCB_EnableDCache();
}





static inline void L1CACHE_DisableDCache(void)
{
    SCB_DisableDCache();
}





static inline void L1CACHE_InvalidateDCache(void)
{
    SCB_InvalidateDCache();
}





static inline void L1CACHE_CleanDCache(void)
{
    SCB_CleanDCache();
}





static inline void L1CACHE_CleanInvalidateDCache(void)
{
    SCB_CleanInvalidateDCache();
}
# 221 "../../libraries/sdk/drives\\fsl_cache.h"
static inline void L1CACHE_InvalidateDCacheByRange(uint32_t address, uint32_t size_byte)
{
    SCB_InvalidateDCache_by_Addr((uint32_t *)address, (int32_t)size_byte);
}
# 236 "../../libraries/sdk/drives\\fsl_cache.h"
static inline void L1CACHE_CleanDCacheByRange(uint32_t address, uint32_t size_byte)
{
    SCB_CleanDCache_by_Addr((uint32_t *)address, (int32_t)size_byte);
}
# 251 "../../libraries/sdk/drives\\fsl_cache.h"
static inline void L1CACHE_CleanInvalidateDCacheByRange(uint32_t address, uint32_t size_byte)
{
    SCB_CleanInvalidateDCache_by_Addr((uint32_t *)address, (int32_t)size_byte);
}
# 405 "../../libraries/sdk/drives\\fsl_cache.h"
void ICACHE_InvalidateByRange(uint32_t address, uint32_t size_byte);
# 419 "../../libraries/sdk/drives\\fsl_cache.h"
void DCACHE_InvalidateByRange(uint32_t address, uint32_t size_byte);
# 433 "../../libraries/sdk/drives\\fsl_cache.h"
void DCACHE_CleanByRange(uint32_t address, uint32_t size_byte);
# 447 "../../libraries/sdk/drives\\fsl_cache.h"
void DCACHE_CleanInvalidateByRange(uint32_t address, uint32_t size_byte);
# 48 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/sdk/drives\\fsl_csi.h" 1
# 89 "../../libraries/sdk/drives\\fsl_csi.h"
enum
{
    kStatus_CSI_NoEmptyBuffer = ((((kStatusGroup_CSI)*100L) + (0))),
    kStatus_CSI_NoFullBuffer = ((((kStatusGroup_CSI)*100L) + (1))),
    kStatus_CSI_QueueFull = ((((kStatusGroup_CSI)*100L) + (2))),
    kStatus_CSI_FrameDone = ((((kStatusGroup_CSI)*100L) + (3))),
};






typedef enum _csi_work_mode
{
    kCSI_GatedClockMode = (((uint32_t)(((uint32_t)(1U)) << (4U))) & (0x10U)),
    kCSI_NonGatedClockMode = 0U,
    kCSI_CCIR656ProgressiveMode = (((uint32_t)(((uint32_t)(1U)) << (10U))) & (0x400U)),
} csi_work_mode_t;




typedef enum _csi_data_bus
{
    kCSI_DataBus8Bit,
    kCSI_DataBus16Bit,
    kCSI_DataBus24Bit,
} csi_data_bus_t;


enum _csi_polarity_flags
{
    kCSI_HsyncActiveLow = 0U,
    kCSI_HsyncActiveHigh = (0x800U),
    kCSI_DataLatchOnRisingEdge = (0x2U),
    kCSI_DataLatchOnFallingEdge = 0U,
    kCSI_VsyncActiveHigh = 0U,
    kCSI_VsyncActiveLow = (0x20000U),
};


typedef struct _csi_config
{
    uint16_t width;
    uint16_t height;
    uint32_t polarityFlags;
    uint8_t bytesPerPixel;



    uint16_t linePitch_Bytes;
    csi_work_mode_t workMode;
    csi_data_bus_t dataBus;
    _Bool useExtVsync;

} csi_config_t;


typedef enum _csi_fifo
{
    kCSI_RxFifo = (1U << 0U),
    kCSI_StatFifo = (1U << 1U),
    kCSI_AllFifo = 0x01 | 0x02,
} csi_fifo_t;


enum _csi_interrupt_enable
{
    kCSI_EndOfFrameInterruptEnable = (0x20000000U),
    kCSI_ChangeOfFieldInterruptEnable = (0x4000000U),
    kCSI_StatFifoOverrunInterruptEnable = (0x2000000U),
    kCSI_RxFifoOverrunInterruptEnable = (0x1000000U),
    kCSI_StatFifoDmaDoneInterruptEnable = (0x400000U),
    kCSI_StatFifoFullInterruptEnable = (0x200000U),
    kCSI_RxBuffer1DmaDoneInterruptEnable = (0x100000U),
    kCSI_RxBuffer0DmaDoneInterruptEnable = (0x80000U),
    kCSI_RxFifoFullInterruptEnable = (0x40000U),
    kCSI_StartOfFrameInterruptEnable = (0x10000U),

    kCSI_EccErrorInterruptEnable = (0x2U),
    kCSI_AhbResErrorInterruptEnable = (0x80U),


    kCSI_BaseAddrChangeErrorInterruptEnable = (0x200U) << 6U,

    kCSI_Field0DoneInterruptEnable = (0x40U) << 6U,
    kCSI_Field1DoneInterruptEnable = (0x80U) << 6U,
};
# 197 "../../libraries/sdk/drives\\fsl_csi.h"
enum _csi_flags
{
    kCSI_RxFifoDataReadyFlag = (0x1U),
    kCSI_EccErrorFlag = (0x2U),
    kCSI_AhbResErrorFlag = (0x80U),
    kCSI_ChangeOfFieldFlag = (0x2000U),
    kCSI_Field0PresentFlag = (0x4000U),
    kCSI_Field1PresentFlag = (0x8000U),
    kCSI_StartOfFrameFlag = (0x10000U),
    kCSI_EndOfFrameFlag = (0x20000U),
    kCSI_RxFifoFullFlag = (0x40000U),
    kCSI_RxBuffer1DmaDoneFlag = (0x100000U),
    kCSI_RxBuffer0DmaDoneFlag = (0x80000U),
    kCSI_StatFifoFullFlag = (0x200000U),
    kCSI_StatFifoDmaDoneFlag = (0x400000U),
    kCSI_StatFifoOverrunFlag = (0x2000000U),
    kCSI_RxFifoOverrunFlag = (0x1000000U),
    kCSI_Field0DoneFlag = (0x8000000U),
    kCSI_Field1DoneFlag = (0x4000000U),
    kCSI_BaseAddrChangeErrorFlag = (0x10000000U),

};


typedef struct _csi_handle csi_handle_t;







typedef void (*csi_transfer_callback_t)(CSI_Type *base, csi_handle_t *handle, status_t status, void *userData);






struct _csi_handle
{
    uint32_t frameBufferQueue[(4U + 1U)];
    uint32_t frameBufferAddr[(4U + 1U)];
    volatile uint8_t queueWriteIdx;
    volatile uint8_t queueReadIdx;


    volatile uint8_t emptyBufferCnt;

    volatile uint8_t activeBufferNum;

    volatile _Bool transferStarted;

    csi_transfer_callback_t callback;
    void *userData;
};
# 371 "../../libraries/sdk/drives\\fsl_csi.h"
status_t CSI_Init(CSI_Type *base, const csi_config_t *config);
# 380 "../../libraries/sdk/drives\\fsl_csi.h"
void CSI_Deinit(CSI_Type *base);
# 389 "../../libraries/sdk/drives\\fsl_csi.h"
void CSI_Reset(CSI_Type *base);
# 409 "../../libraries/sdk/drives\\fsl_csi.h"
void CSI_GetDefaultConfig(csi_config_t *config);
# 426 "../../libraries/sdk/drives\\fsl_csi.h"
void CSI_ClearFifo(CSI_Type *base, csi_fifo_t fifo);
# 441 "../../libraries/sdk/drives\\fsl_csi.h"
void CSI_ReflashFifoDma(CSI_Type *base, csi_fifo_t fifo);
# 450 "../../libraries/sdk/drives\\fsl_csi.h"
void CSI_EnableFifoDmaRequest(CSI_Type *base, csi_fifo_t fifo, _Bool enable);






static inline void CSI_Start(CSI_Type *base)
{
    CSI_EnableFifoDmaRequest(base, kCSI_RxFifo, 1);
    (base)->CR18 |= (0x80000000U);
}






static inline void CSI_Stop(CSI_Type *base)
{
    (base)->CR18 &= ~(0x80000000U);
    CSI_EnableFifoDmaRequest(base, kCSI_RxFifo, 0);
}
# 481 "../../libraries/sdk/drives\\fsl_csi.h"
void CSI_SetRxBufferAddr(CSI_Type *base, uint8_t index, uint32_t addr);
# 495 "../../libraries/sdk/drives\\fsl_csi.h"
void CSI_EnableInterrupts(CSI_Type *base, uint32_t mask);







void CSI_DisableInterrupts(CSI_Type *base, uint32_t mask);
# 518 "../../libraries/sdk/drives\\fsl_csi.h"
static inline uint32_t CSI_GetStatusFlags(CSI_Type *base)
{
    return (base)->SR;
}
# 538 "../../libraries/sdk/drives\\fsl_csi.h"
static inline void CSI_ClearStatusFlags(CSI_Type *base, uint32_t statusMask)
{
    (base)->SR = statusMask;
}
# 563 "../../libraries/sdk/drives\\fsl_csi.h"
status_t CSI_TransferCreateHandle(CSI_Type *base,
                                  csi_handle_t *handle,
                                  csi_transfer_callback_t callback,
                                  void *userData);
# 582 "../../libraries/sdk/drives\\fsl_csi.h"
status_t CSI_TransferStart(CSI_Type *base, csi_handle_t *handle);
# 596 "../../libraries/sdk/drives\\fsl_csi.h"
status_t CSI_TransferStop(CSI_Type *base, csi_handle_t *handle);
# 612 "../../libraries/sdk/drives\\fsl_csi.h"
status_t CSI_TransferSubmitEmptyBuffer(CSI_Type *base, csi_handle_t *handle, uint32_t frameBuffer);
# 629 "../../libraries/sdk/drives\\fsl_csi.h"
status_t CSI_TransferGetFullBuffer(CSI_Type *base, csi_handle_t *handle, uint32_t *frameBuffer);
# 640 "../../libraries/sdk/drives\\fsl_csi.h"
void CSI_TransferHandleIRQ(CSI_Type *base, csi_handle_t *handle);
# 725 "../../libraries/sdk/drives\\fsl_csi.h"
void CSI_DriverIRQHandler(void);
# 49 "../../libraries/zf_common\\zf_common_headfile.h" 2





# 1 "../../libraries/zf_common/zf_common_typedef.h" 1
# 55 "../../libraries/zf_common/zf_common_typedef.h"
typedef unsigned char uint8;
typedef unsigned short int uint16;
typedef unsigned int uint32;
typedef unsigned long long uint64;

typedef signed char int8;
typedef signed short int int16;
typedef signed int int32;
typedef signed long long int64;

typedef volatile uint8 vuint8;
typedef volatile uint16 vuint16;
typedef volatile uint32 vuint32;
typedef volatile uint64 vuint64;

typedef volatile int8 vint8;
typedef volatile int16 vint16;
typedef volatile int32 vint32;
typedef volatile int64 vint64;
# 55 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_common/zf_common_clock.h" 1
# 45 "../../libraries/zf_common/zf_common_clock.h"
typedef enum
{
    SYSTEM_CLOCK_XTAL = (24000000),
    SYSTEM_CLOCK_600M = 600000000,
}system_clock_enum;

extern uint32 system_clock;

void clock_init (uint32 clock);
# 56 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_common/zf_common_debug.h" 1
# 74 "../../libraries/zf_common/zf_common_debug.h"
typedef struct
{
    uint16 type_index;

    uint16 display_x_max;
    uint16 display_y_max;

    uint8 font_x_size;
    uint8 font_y_size;

    void (*output_uart) (const char *str);
    void (*output_screen) (uint16 x, uint16 y, const char *str);
    void (*output_screen_clear) (void);
}debug_output_struct;

uint32 debug_send_buffer (const uint8 *buff, uint32 len);


void debug_interrupr_handler (void);


uint32 debug_read_ring_buffer (uint8 *buff, uint32 len);
void debug_assert_enable (void);
void debug_assert_disable (void);
void debug_assert_handler (uint8 pass, char *file, int line);
void debug_log_handler (uint8 pass, char *str, char *file, int line);
void debug_output_struct_init (debug_output_struct *info);
void debug_output_init (debug_output_struct *info);
void debug_init (void);
# 57 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_common/zf_common_fifo.h" 1
# 41 "../../libraries/zf_common/zf_common_fifo.h"
typedef enum
{
    FIFO_SUCCESS,

    FIFO_RESET_UNDO,
    FIFO_CLEAR_UNDO,
    FIFO_BUFFER_NULL,
    FIFO_WRITE_UNDO,
    FIFO_SPACE_NO_ENOUGH,
    FIFO_READ_UNDO,
    FIFO_DATA_NO_ENOUGH,
}fifo_state_enum;
# 61 "../../libraries/zf_common/zf_common_fifo.h"
typedef enum
{
    FIFO_IDLE = 0x00,

    FIFO_RESET = 0x01,
    FIFO_CLEAR = 0x02,
    FIFO_WRITE = 0x04,
    FIFO_READ = 0x08,
}fifo_execution_enum;

typedef enum
{
    FIFO_READ_AND_CLEAN,
    FIFO_READ_ONLY,
}fifo_operation_enum;

typedef enum
{
    FIFO_DATA_8BIT,
    FIFO_DATA_16BIT,
    FIFO_DATA_32BIT,
}fifo_data_type_enum;

#pragma pack(push,1)
typedef struct
{
    uint8 execution;
    fifo_data_type_enum type;
    void *buffer;
    uint32 head;
    uint32 end;
    uint32 size;
    uint32 max;
}fifo_struct;
#pragma pack(pop)

fifo_state_enum fifo_clear (fifo_struct *fifo);
uint32 fifo_used (fifo_struct *fifo);

fifo_state_enum fifo_write_element (fifo_struct *fifo, uint32 dat);
fifo_state_enum fifo_write_buffer (fifo_struct *fifo, void *dat, uint32 length);
fifo_state_enum fifo_read_element (fifo_struct *fifo, void *dat, fifo_operation_enum flag);
fifo_state_enum fifo_read_buffer (fifo_struct *fifo, void *dat, uint32 *length, fifo_operation_enum flag);
fifo_state_enum fifo_read_tail_buffer (fifo_struct *fifo, void *dat, uint32 *length, fifo_operation_enum flag);

fifo_state_enum fifo_init (fifo_struct *fifo, fifo_data_type_enum type, void *buffer_addr, uint32 size);
# 58 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_common/zf_common_font.h" 1
# 42 "../../libraries/zf_common/zf_common_font.h"
typedef enum
{
    RGB565_WHITE = (0xFFFF),
    RGB565_BLACK = (0x0000),
    RGB565_BLUE = (0x001F),
    RGB565_PURPLE = (0xF81F),
    RGB565_PINK = (0xFE19),
    RGB565_RED = (0xF800),
    RGB565_MAGENTA = (0xF81F),
    RGB565_GREEN = (0x07E0),
    RGB565_CYAN = (0x07FF),
    RGB565_YELLOW = (0xFFE0),
    RGB565_BROWN = (0xBC40),
    RGB565_GRAY = (0x8430),

    RGB565_39C5BB = (0x3616),
    RGB565_66CCFF = (0x665F),
}rgb565_color_enum;

extern const uint8 ascii_font_8x16[][16];
extern const uint8 ascii_font_6x8[][6];
extern const uint8 chinese_test[8][16];
extern const uint8 oled_16x16_chinese[][16];
extern const uint8 gImage_seekfree_logo[38400];
# 59 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_common/zf_common_function.h" 1
# 75 "../../libraries/zf_common/zf_common_function.h"
void func_get_sin_amplitude_table (uint32 *data_buffer, uint32 sample_max, uint32 amplitude_max, uint32 offset_degree);

uint32 func_get_greatest_common_divisor (uint32 num1, uint32 num2);

void func_soft_delay (volatile long t);

int32 func_str_to_int (char *str);
void func_int_to_str (char *str, int32 number);
uint32 func_str_to_uint (char *str);
void func_uint_to_str (char *str, uint32 number);
float func_str_to_float (char *str);
void func_float_to_str (char *str, float number, uint8 point_bit);
double func_str_to_double (char *str);
void func_double_to_str (char *str, double number, uint8 point_bit);
uint32 func_str_to_hex (char *str);
void func_hex_to_str (char *str, uint32 number);

uint32 zf_sprintf (int8 *buff, const int8 *format, ...);
# 60 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_common/zf_common_interrupt.h" 1
# 43 "../../libraries/zf_common/zf_common_interrupt.h"
void interrupt_global_enable (uint32 primask);
uint32 interrupt_global_disable (void);
void interrupt_enable (IRQn_Type irqn);
void interrupt_disable (IRQn_Type irqn);
void interrupt_set_priority (IRQn_Type irqn, uint8 priority);
void interrupt_init (void);
# 61 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_common/zf_common_vector.h" 1








void NMI_Handler(void);
void HardFault_Handler(void);
void MemManage_Handler(void);
void BusFault_Handler(void);
void UsageFault_Handler(void);
void SVC_Handler(void);
void DebugMon_Handler(void);
void PendSV_Handler(void);
void SysTick_Handler(void);
# 62 "../../libraries/zf_common\\zf_common_headfile.h" 2



# 1 "../../libraries/zf_driver\\zf_driver_adc.h" 1
# 41 "../../libraries/zf_driver\\zf_driver_adc.h"
typedef enum
{
    ADC1_CH0_B27 = 1*16,
    ADC1_CH1_B12,
    ADC1_CH2_B13,
    ADC1_CH3_B14,
    ADC1_CH4_B15,
    ADC1_CH5_B16,
    ADC1_CH6_B17,
    ADC1_CH7_B18,
    ADC1_CH8_B19,
    ADC1_CH9_B20,
    ADC1_CH10_B21,
    ADC1_CH11_B22,
    ADC1_CH12_B23,
    ADC1_CH13_B24,
    ADC1_CH14_B25,
    ADC1_CH15_B26,

    ADC2_CH0_B27,
    ADC2_CH1_B28,
    ADC2_CH2_B29,
    ADC2_CH3_B30,
    ADC2_CH4_B31,
    ADC2_CH5_B16,
    ADC2_CH6_B17,
    ADC2_CH7_B18,
    ADC2_CH8_B19,
    ADC2_CH9_B20,
    ADC2_CH10_B21,
    ADC2_CH11_B22,
    ADC2_CH12_B23,
    ADC2_CH13_B24,
    ADC2_CH14_B25,
    ADC2_CH15_B26,
}adc_channel_enum;

typedef enum
{
    ADC_8BIT,
    ADC_10BIT,
    ADC_12BIT,
}adc_resolution_enum;

uint16 adc_convert (adc_channel_enum ch);
uint16 adc_mean_filter_convert (adc_channel_enum ch, const uint8 count);
void adc_init (adc_channel_enum ch, adc_resolution_enum resolution);
# 66 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_delay.h" 1
# 42 "../../libraries/zf_driver\\zf_driver_delay.h"
void system_delay_ms (uint32 time);
void system_delay_us (uint32 time);
# 67 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_encoder.h" 1
# 41 "../../libraries/zf_driver\\zf_driver_encoder.h"
typedef enum
{
    QTIMER1_ENCODER1_CH1_C0 = 2 * 2,
    QTIMER1_ENCODER2_CH1_C2 = 3 * 2,

    QTIMER2_ENCODER1_CH1_C3 = 4 * 2,
    QTIMER2_ENCODER2_CH1_C5 = 5 * 2,

    QTIMER3_ENCODER1_CH1_B16 = 6 * 2, QTIMER3_ENCODER1_CH1_C6,
    QTIMER3_ENCODER2_CH1_B18 = 7 * 2, QTIMER3_ENCODER2_CH1_C8,

    QTIMER4_ENCODER1_CH1_C9 = 8 * 2,
    QTIMER4_ENCODER2_CH1_C11 = 9 * 2,
}encoder_channel1_enum;

typedef enum
{
    QTIMER1_ENCODER1_CH2_C1 = 2 * 2,
    QTIMER1_ENCODER2_CH2_C24 = 3 * 2,

    QTIMER2_ENCODER1_CH2_C4 = 4 * 2, QTIMER2_ENCODER1_CH2_C25,
    QTIMER2_ENCODER2_CH2_C25 = 5 * 2,

    QTIMER3_ENCODER1_CH2_B17 = 6 * 2, QTIMER3_ENCODER1_CH2_C7,
    QTIMER3_ENCODER2_CH2_B19 = 7 * 2, QTIMER3_ENCODER2_CH2_C26,

    QTIMER4_ENCODER1_CH2_C10 = 8 * 2,
    QTIMER4_ENCODER2_CH2_C27 = 9 * 2,
}encoder_channel2_enum;

typedef enum
{
    QTIMER1_ENCODER1 = 2,
    QTIMER1_ENCODER2,

    QTIMER2_ENCODER1,
    QTIMER2_ENCODER2,

    QTIMER3_ENCODER1,
    QTIMER3_ENCODER2,

    QTIMER4_ENCODER1,
    QTIMER4_ENCODER2,
}encoder_index_enum;

int16 encoder_get_count (encoder_index_enum encoder_n);
void encoder_clear_count (encoder_index_enum encoder_n);

void encoder_quad_init (encoder_index_enum encoder_n, encoder_channel1_enum ch1_pin, encoder_channel2_enum ch2_pin);
void encoder_dir_init (encoder_index_enum encoder_n, encoder_channel1_enum ch1_pin, encoder_channel2_enum ch2_pin);
# 68 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_exti.h" 1
# 40 "../../libraries/zf_driver\\zf_driver_exti.h"
# 1 "../../libraries/zf_driver/zf_driver_gpio.h" 1
# 41 "../../libraries/zf_driver/zf_driver_gpio.h"
# 1 "../../libraries/sdk/drives\\fsl_gpio.h" 1
# 30 "../../libraries/sdk/drives\\fsl_gpio.h"
typedef enum _gpio_pin_direction
{
    kGPIO_DigitalInput = 0U,
    kGPIO_DigitalOutput = 1U,
} gpio_pin_direction_t;


typedef enum _gpio_interrupt_mode
{
    kGPIO_NoIntmode = 0U,
    kGPIO_IntLowLevel = 1U,
    kGPIO_IntHighLevel = 2U,
    kGPIO_IntRisingEdge = 3U,
    kGPIO_IntFallingEdge = 4U,
    kGPIO_IntRisingOrFallingEdge = 5U,
} gpio_interrupt_mode_t;


typedef struct _gpio_pin_config
{
    gpio_pin_direction_t direction;
    uint8_t outputLogic;
    gpio_interrupt_mode_t
        interruptMode;
} gpio_pin_config_t;
# 78 "../../libraries/sdk/drives\\fsl_gpio.h"
void GPIO_PinInit(GPIO_Type *base, uint32_t pin, const gpio_pin_config_t *Config);
# 95 "../../libraries/sdk/drives\\fsl_gpio.h"
void GPIO_PinWrite(GPIO_Type *base, uint32_t pin, uint8_t output);





static inline void GPIO_WritePinOutput(GPIO_Type *base, uint32_t pin, uint8_t output)
{
    GPIO_PinWrite(base, pin, output);
}







static inline void GPIO_PortSet(GPIO_Type *base, uint32_t mask)
{

    base->DR_SET = mask;



}





static inline void GPIO_SetPinsOutput(GPIO_Type *base, uint32_t mask)
{
    GPIO_PortSet(base, mask);
}







static inline void GPIO_PortClear(GPIO_Type *base, uint32_t mask)
{

    base->DR_CLEAR = mask;



}





static inline void GPIO_ClearPinsOutput(GPIO_Type *base, uint32_t mask)
{
    GPIO_PortClear(base, mask);
}







static inline void GPIO_PortToggle(GPIO_Type *base, uint32_t mask)
{

    base->DR_TOGGLE = mask;



}
# 176 "../../libraries/sdk/drives\\fsl_gpio.h"
static inline uint32_t GPIO_PinRead(GPIO_Type *base, uint32_t pin)
{
    ((pin < 32U) ? (void)0 : __aeabi_assert("pin < 32U", "../../libraries/sdk/drives\\fsl_gpio.h", 178),
# 178 "../../libraries/sdk/drives\\fsl_gpio.h"
#pragma clang diagnostic push
# 178 "../../libraries/sdk/drives\\fsl_gpio.h"
#pragma clang diagnostic ignored "-Wassume"
# 178 "../../libraries/sdk/drives\\fsl_gpio.h"
    (__builtin_assume)((pin < 32U)?1:0)
# 178 "../../libraries/sdk/drives\\fsl_gpio.h"
#pragma clang diagnostic pop
# 178 "../../libraries/sdk/drives\\fsl_gpio.h"
    );

    return (((base->DR) >> pin) & 0x1U);
}





static inline uint32_t GPIO_ReadPinInput(GPIO_Type *base, uint32_t pin)
{
    return GPIO_PinRead(base, pin);
}
# 205 "../../libraries/sdk/drives\\fsl_gpio.h"
static inline uint8_t GPIO_PinReadPadStatus(GPIO_Type *base, uint32_t pin)
{
    ((pin < 32U) ? (void)0 : __aeabi_assert("pin < 32U", "../../libraries/sdk/drives\\fsl_gpio.h", 207),
# 207 "../../libraries/sdk/drives\\fsl_gpio.h"
#pragma clang diagnostic push
# 207 "../../libraries/sdk/drives\\fsl_gpio.h"
#pragma clang diagnostic ignored "-Wassume"
# 207 "../../libraries/sdk/drives\\fsl_gpio.h"
    (__builtin_assume)((pin < 32U)?1:0)
# 207 "../../libraries/sdk/drives\\fsl_gpio.h"
#pragma clang diagnostic pop
# 207 "../../libraries/sdk/drives\\fsl_gpio.h"
    );

    return (uint8_t)(((base->PSR) >> pin) & 0x1U);
}





static inline uint8_t GPIO_ReadPadStatus(GPIO_Type *base, uint32_t pin)
{
    return GPIO_PinReadPadStatus(base, pin);
}
# 236 "../../libraries/sdk/drives\\fsl_gpio.h"
void GPIO_PinSetInterruptConfig(GPIO_Type *base, uint32_t pin, gpio_interrupt_mode_t pinInterruptMode);





static inline void GPIO_SetPinInterruptConfig(GPIO_Type *base, uint32_t pin, gpio_interrupt_mode_t pinInterruptMode)
{
    GPIO_PinSetInterruptConfig(base, pin, pinInterruptMode);
}







static inline void GPIO_PortEnableInterrupts(GPIO_Type *base, uint32_t mask)
{
    base->IMR |= mask;
}







static inline void GPIO_EnableInterrupts(GPIO_Type *base, uint32_t mask)
{
    GPIO_PortEnableInterrupts(base, mask);
}







static inline void GPIO_PortDisableInterrupts(GPIO_Type *base, uint32_t mask)
{
    base->IMR &= ~mask;
}





static inline void GPIO_DisableInterrupts(GPIO_Type *base, uint32_t mask)
{
    GPIO_PortDisableInterrupts(base, mask);
}







static inline uint32_t GPIO_PortGetInterruptFlags(GPIO_Type *base)
{
    return base->ISR;
}







static inline uint32_t GPIO_GetPinsInterruptFlags(GPIO_Type *base)
{
    return GPIO_PortGetInterruptFlags(base);
}
# 318 "../../libraries/sdk/drives\\fsl_gpio.h"
static inline void GPIO_PortClearInterruptFlags(GPIO_Type *base, uint32_t mask)
{
    base->ISR = mask;
}
# 330 "../../libraries/sdk/drives\\fsl_gpio.h"
static inline void GPIO_ClearPinsInterruptFlags(GPIO_Type *base, uint32_t mask)
{
    GPIO_PortClearInterruptFlags(base, mask);
}
# 42 "../../libraries/zf_driver/zf_driver_gpio.h" 2


extern GPIO_Type * PORTPTR[];



typedef enum
{
    B0 = (32* 1 + 0 ), B1 , B2 , B3 ,
    B9 = (32* 1 + 9 ), B10, B11, B12, B13, B14, B15,
    B16 , B17, B18, B19, B20, B21, B22, B23,
    B24 , B25, B26, B27, B28, B29, B30, B31,

    C0 = (32* 2 + 0 ), C1 , C2 , C3 , C4 , C5 , C6 , C7 ,
    C8 , C9 , C10, C11, C12, C13, C14, C15,
    C16, C17, C18, C19, C20, C21, C22, C23,
    C24, C25, C26, C27, C28, C29, C30, C31,

    D0 = (32* 3 + 0 ), D1 , D2 , D3 , D4 ,
    D12 = (32* 3 + 12), D13, D14, D15,
    D16, D17,
    D26 = (32* 3 + 26), D27,
}gpio_pin_enum;



typedef enum
{
    GPIO_AF0 = 0x00,
    GPIO_AF1 = 0x01,
    GPIO_AF2 = 0x02,
    GPIO_AF3 = 0x03,
    GPIO_AF4 = 0x04,
    GPIO_AF5 = 0x05,
    GPIO_AF6 = 0x06,
    GPIO_AF7 = 0x07,
    GPIO_AF8 = 0x08,
    GPIO_AF9 = 0x09,
    GPIO_AF10 = 0x0A,
    GPIO_AF11 = 0x0B,
    GPIO_AF12 = 0x0C,
    GPIO_AF13 = 0x0D,
    GPIO_AF14 = 0x0E,
    GPIO_AF15 = 0x0F,
}gpio_af_enum;


typedef enum
{

    HYS_EN = 1<<(16U),

    PULLDOWN_100K = 0<<(14U),
    PULLUP_47K = 1<<(14U),
    PULLUP_100K = 2<<(14U),
    PULLUP_22K = 3<<(14U),

    PULL_EN = 1<<(12U) | 1<<(13U),
    KEEPER_EN = 1<<(12U),

    OD_EN = 1<<(11U),

    SPEED_50MHZ = 0<<(6U),
    SPEED_100MHZ = 1<<(6U),
    SPEED_200MHZ = 3<<(6U),

    DSE_DIS = 0<<(3U),
    DSE_R0 = 1<<(3U),
    DSE_R0_2 = 2<<(3U),
    DSE_R0_3 = 3<<(3U),
    DSE_R0_4 = 4<<(3U),
    DSE_R0_5 = 5<<(3U),
    DSE_R0_6 = 6<<(3U),
    DSE_R0_7 = 7<<(3U),

    SRE_SLOW = 0<<(0U),
    SRE_FAST = 1<<(0U),


    GPI_ANAOG_IN = SPEED_100MHZ | DSE_R0_6,
    GPI_FLOATING_IN = SPEED_100MHZ | DSE_R0,
    GPI_PULL_DOWN = SPEED_100MHZ | DSE_R0 | PULLDOWN_100K | PULL_EN,
    GPI_PULL_UP = SPEED_100MHZ | DSE_R0 | PULLUP_47K | PULL_EN,

    GPO_PUSH_PULL = SPEED_100MHZ | DSE_R0,
    GPO_OPEN_DTAIN = SPEED_100MHZ | DSE_R0 | OD_EN,
    GPO_AF_PUSH_PULL = SPEED_100MHZ | DSE_R0,
    GPO_AF_OPEN_DTAIN = SPEED_100MHZ | DSE_R0 | OD_EN,


    FAST_GPI_PULL_DOWN = SPEED_200MHZ | DSE_R0 | PULLDOWN_100K | PULL_EN,
    FAST_GPI_PULL_UP = SPEED_200MHZ | DSE_R0 | PULLUP_47K | PULL_EN,

    FAST_GPO_PUSH_PULL = SPEED_200MHZ | DSE_R0,

}gpio_mode_enum;


typedef enum
{
    GPI = 0x00,
    GPO = 0x01,
}gpio_dir_enum;

typedef enum
{
    GPIO_LOW = 0x00,
    GPIO_HIGH = 0x01,
}gpio_level_enum;



void afio_init(uint32 muxRegister, uint32 muxMode, uint32 inputRegister, uint32 inputDaisy, uint32 configRegister, uint32 inputOnfield, uint32 pinconf);
void gpio_iomuxc(gpio_pin_enum pin, uint32 pinconf);



void gpio_set_level (gpio_pin_enum pin, uint8 dat);
uint8 gpio_get_level (gpio_pin_enum pin);
void gpio_toggle_level (gpio_pin_enum pin);
void gpio_set_dir (gpio_pin_enum pin, gpio_dir_enum dir, gpio_mode_enum pinconf);
void gpio_init (gpio_pin_enum pin, gpio_dir_enum dir, uint8 dat, uint32 pinconf);
# 201 "../../libraries/zf_driver/zf_driver_gpio.h"
void fast_gpio_set_level (gpio_pin_enum pin, uint8 dat);
uint8 fast_gpio_get_level (gpio_pin_enum pin);
void fast_gpio_toggle_level (gpio_pin_enum pin);
void fast_gpio_set_dir (gpio_pin_enum pin, gpio_dir_enum dir, gpio_mode_enum pinconf);
void fast_gpio_init (gpio_pin_enum pin, gpio_dir_enum dir, uint8 dat, uint32 pinconf);
# 41 "../../libraries/zf_driver\\zf_driver_exti.h" 2



typedef enum{
    EXTI_TRIGGER_LOW = 1,
    EXTI_TRIGGER_HIGH,
    EXTI_TRIGGER_RISING,
    EXTI_TRIGGER_FALLING,
    EXTI_TRIGGER_BOTH,
}exti_trigger_enum;






void exti_enable (gpio_pin_enum pin);
void exti_disable (gpio_pin_enum pin);
void exti_init (gpio_pin_enum pin, exti_trigger_enum trigger);
# 69 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_flash.h" 1
# 50 "../../libraries/zf_driver\\zf_driver_flash.h"
typedef union
{
    float float_type;
    uint32 uint32_type;
    int32 int32_type;
    uint16 uint16_type;
    int16 int16_type;
    uint8 uint8_type;
    int8 int8_type;
}flash_data_union;


typedef enum
{
    FLASH_PAGE_0,
    FLASH_PAGE_1,
    FLASH_PAGE_2,
    FLASH_PAGE_3,
    FLASH_PAGE_4,
    FLASH_PAGE_5,
    FLASH_PAGE_6,
    FLASH_PAGE_7,
}flash_page_enum;

extern flash_data_union flash_union_buffer[((0x00001000) / sizeof(flash_data_union))];
# 89 "../../libraries/zf_driver\\zf_driver_flash.h"
uint8 flash_check (uint32 sector_num, flash_page_enum page_num);
uint8 flash_erase_page (uint32 sector_num, flash_page_enum page_num);
void flash_read_page (uint32 sector_num, flash_page_enum page_num, uint32 *buf, uint16 len);
uint8 flash_write_page (uint32 sector_num, flash_page_enum page_num, const uint32 *buf, uint16 len);

void flash_read_page_to_buffer (uint32 sector_num, flash_page_enum page_num);
uint8 flash_write_page_from_buffer (uint32 sector_num, flash_page_enum page_num);
void flash_buffer_clear (void);

uint8 flash_init (void);
# 70 "../../libraries/zf_common\\zf_common_headfile.h" 2

# 1 "../../libraries/zf_driver\\zf_driver_iic.h" 1
# 41 "../../libraries/zf_driver\\zf_driver_iic.h"
typedef enum
{

    IIC1_SCL_B16 = 16 * 1, IIC1_SCL_D4 ,


    IIC2_SCL_C4 = 16 * 2,


    IIC3_SCL_B23 = 16 * 3, IIC3_SCL_D12,


    IIC4_SCL_B12 = 16 * 4,
}iic_scl_pin_enum;

typedef enum
{


    IIC1_SDA_B17 = 16 * 1,


    IIC2_SDA_C5 = 16 * 2,


    IIC3_SDA_B22 = 16 * 3, IIC3_SDA_D13,


    IIC4_SDA_B13 = 16 * 4,
}iic_sda_pin_enum;


typedef enum
{
    IIC_SUCCESS,
    IIC_WRITE_TIMEOUT,
    IIC_READ_TIMEOUT,
}iic_state_enum;

typedef enum
{
    IIC_1 = 1,
    IIC_2,
    IIC_3,
    IIC_4,
}iic_index_enum;

void iic_write_8bit (iic_index_enum iic_n, uint8 target_addr, const uint8 data);
void iic_write_8bit_array (iic_index_enum iic_n, uint8 target_addr, const uint8 *data, uint32 len);

void iic_write_16bit (iic_index_enum iic_n, uint8 target_addr, const uint16 data);
void iic_write_16bit_array (iic_index_enum iic_n, uint8 target_addr, const uint16 *data, uint32 len);

void iic_write_8bit_register (iic_index_enum iic_n, uint8 target_addr, const uint8 register_name, const uint8 data);
void iic_write_8bit_registers (iic_index_enum iic_n, uint8 target_addr, const uint8 register_name, const uint8 *data, uint32 len);

void iic_write_16bit_register (iic_index_enum iic_n, uint8 target_addr, const uint16 register_name, const uint16 data);
void iic_write_16bit_registers (iic_index_enum iic_n, uint8 target_addr, const uint16 register_name, const uint16 *data, uint32 len);

uint8 iic_read_8bit (iic_index_enum iic_n, uint8 target_addr);
void iic_read_8bit_array (iic_index_enum iic_n, uint8 target_addr, uint8 *data, uint32 len);

uint16 iic_read_16bit (iic_index_enum iic_n, uint8 target_addr);
void iic_read_16bit_array (iic_index_enum iic_n, uint8 target_addr, uint16 *data, uint32 len);

uint8 iic_read_8bit_register (iic_index_enum iic_n, uint8 target_addr, const uint8 register_name);
void iic_read_8bit_registers (iic_index_enum iic_n, uint8 target_addr, const uint8 register_name, uint8 *data, uint32 len);

uint16 iic_read_16bit_register (iic_index_enum iic_n, uint8 target_addr, const uint16 register_name);
void iic_read_16bit_registers (iic_index_enum iic_n, uint8 target_addr, const uint16 register_name, uint16 *data, uint32 len);

void iic_transfer_8bit_array (iic_index_enum iic_n, uint8 target_addr, const uint8 *write_data, uint32 write_len, uint8 *read_data, uint32 read_len);
void iic_transfer_16bit_array (iic_index_enum iic_n, uint8 target_addr, const uint16 *write_data, uint32 write_len, uint16 *read_data, uint32 read_len);

void iic_sccb_write_register (iic_index_enum iic_n, uint8 target_addr, const uint8 register_name, uint8 data);
uint8 iic_sccb_read_register (iic_index_enum iic_n, uint8 target_addr, const uint8 register_name);

void iic_init (iic_index_enum iic_n, uint8 addr, uint32 baud, iic_scl_pin_enum scl_pin, iic_sda_pin_enum sda_pin);
# 72 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_pit.h" 1
# 40 "../../libraries/zf_driver\\zf_driver_pit.h"
# 1 "../../libraries/sdk/drives\\fsl_pit.h" 1
# 32 "../../libraries/sdk/drives\\fsl_pit.h"
typedef enum _pit_chnl
{
    kPIT_Chnl_0 = 0U,
    kPIT_Chnl_1,
    kPIT_Chnl_2,
    kPIT_Chnl_3,
} pit_chnl_t;


typedef enum _pit_interrupt_enable
{
    kPIT_TimerInterruptEnable = (0x2U),
} pit_interrupt_enable_t;


typedef enum _pit_status_flags
{
    kPIT_TimerFlag = (0x1U),
} pit_status_flags_t;
# 61 "../../libraries/sdk/drives\\fsl_pit.h"
typedef struct _pit_config
{
    _Bool enableRunInDebug;
} pit_config_t;
# 87 "../../libraries/sdk/drives\\fsl_pit.h"
void PIT_Init(PIT_Type *base, const pit_config_t *config);






void PIT_Deinit(PIT_Type *base);
# 105 "../../libraries/sdk/drives\\fsl_pit.h"
static inline void PIT_GetDefaultConfig(pit_config_t *config)
{
    ((0 != config) ? (void)0 : __aeabi_assert("NULL != config", "../../libraries/sdk/drives\\fsl_pit.h", 107),
# 107 "../../libraries/sdk/drives\\fsl_pit.h"
#pragma clang diagnostic push
# 107 "../../libraries/sdk/drives\\fsl_pit.h"
#pragma clang diagnostic ignored "-Wassume"
# 107 "../../libraries/sdk/drives\\fsl_pit.h"
    (__builtin_assume)((0 != config)?1:0)
# 107 "../../libraries/sdk/drives\\fsl_pit.h"
#pragma clang diagnostic pop
# 107 "../../libraries/sdk/drives\\fsl_pit.h"
    );


    config->enableRunInDebug = 0;
}
# 130 "../../libraries/sdk/drives\\fsl_pit.h"
static inline void PIT_SetTimerChainMode(PIT_Type *base, pit_chnl_t channel, _Bool enable)
{
    if (enable)
    {
        base->CHANNEL[channel].TCTRL |= (0x4U);
    }
    else
    {
        base->CHANNEL[channel].TCTRL &= ~(0x4U);
    }
}
# 159 "../../libraries/sdk/drives\\fsl_pit.h"
static inline void PIT_EnableInterrupts(PIT_Type *base, pit_chnl_t channel, uint32_t mask)
{
    base->CHANNEL[channel].TCTRL |= mask;
}
# 172 "../../libraries/sdk/drives\\fsl_pit.h"
static inline void PIT_DisableInterrupts(PIT_Type *base, pit_chnl_t channel, uint32_t mask)
{
    base->CHANNEL[channel].TCTRL &= ~mask;
}
# 186 "../../libraries/sdk/drives\\fsl_pit.h"
static inline uint32_t PIT_GetEnabledInterrupts(PIT_Type *base, pit_chnl_t channel)
{
    return (base->CHANNEL[channel].TCTRL & (0x2U));
}
# 207 "../../libraries/sdk/drives\\fsl_pit.h"
static inline uint32_t PIT_GetStatusFlags(PIT_Type *base, pit_chnl_t channel)
{
    return (base->CHANNEL[channel].TFLG & (0x1U));
}
# 220 "../../libraries/sdk/drives\\fsl_pit.h"
static inline void PIT_ClearStatusFlags(PIT_Type *base, pit_chnl_t channel, uint32_t mask)
{
    base->CHANNEL[channel].TFLG = mask;
}
# 246 "../../libraries/sdk/drives\\fsl_pit.h"
static inline void PIT_SetTimerPeriod(PIT_Type *base, pit_chnl_t channel, uint32_t count)
{
    ((count != 0U) ? (void)0 : __aeabi_assert("count != 0U", "../../libraries/sdk/drives\\fsl_pit.h", 248),
# 248 "../../libraries/sdk/drives\\fsl_pit.h"
#pragma clang diagnostic push
# 248 "../../libraries/sdk/drives\\fsl_pit.h"
#pragma clang diagnostic ignored "-Wassume"
# 248 "../../libraries/sdk/drives\\fsl_pit.h"
    (__builtin_assume)((count != 0U)?1:0)
# 248 "../../libraries/sdk/drives\\fsl_pit.h"
#pragma clang diagnostic pop
# 248 "../../libraries/sdk/drives\\fsl_pit.h"
    );

    base->CHANNEL[channel].LDVAL = count - 1U;
}
# 266 "../../libraries/sdk/drives\\fsl_pit.h"
static inline uint32_t PIT_GetCurrentTimerCount(PIT_Type *base, pit_chnl_t channel)
{
    return base->CHANNEL[channel].CVAL;
}
# 288 "../../libraries/sdk/drives\\fsl_pit.h"
static inline void PIT_StartTimer(PIT_Type *base, pit_chnl_t channel)
{
    base->CHANNEL[channel].TCTRL |= (0x1U);
}
# 302 "../../libraries/sdk/drives\\fsl_pit.h"
static inline void PIT_StopTimer(PIT_Type *base, pit_chnl_t channel)
{
    base->CHANNEL[channel].TCTRL &= ~(0x1U);
}
# 324 "../../libraries/sdk/drives\\fsl_pit.h"
uint64_t PIT_GetLifetimeTimerCount(PIT_Type *base);
# 41 "../../libraries/zf_driver\\zf_driver_pit.h" 2

typedef enum
{
    PIT_CH0 = kPIT_Chnl_0,
    PIT_CH1,
    PIT_CH2,
    PIT_CH3,
    PIT_MAX,
}pit_index_enum;




void pit_enable (pit_index_enum pit_chn);
void pit_disable (pit_index_enum pit_chn);

void pit_init (pit_index_enum pit_chn, uint32 period);
# 73 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_pwm.h" 1
# 43 "../../libraries/zf_driver\\zf_driver_pwm.h"
typedef enum
{




    PWM1_MODULE0_CHB_D13=1*40+5*0,
    PWM1_MODULE0_CHA_D12=1*40+5*1,

    PWM1_MODULE1_CHB_D15=1*40+5*2,
    PWM1_MODULE1_CHA_D14=1*40+5*3,

    PWM1_MODULE2_CHB_D17=1*40+5*4,
    PWM1_MODULE2_CHA_D16=1*40+5*5,

    PWM1_MODULE3_CHB_B11=1*40+5*6, PWM1_MODULE3_CHB_C17, PWM1_MODULE3_CHB_D1,
    PWM1_MODULE3_CHA_B10=1*40+5*7, PWM1_MODULE3_CHA_C16, PWM1_MODULE3_CHA_D0,


    PWM2_MODULE0_CHB_C7 =2*40+5*0,
    PWM2_MODULE0_CHA_C6 =2*40+5*1,

    PWM2_MODULE1_CHB_C9 =2*40+5*2,
    PWM2_MODULE1_CHA_C8 =2*40+5*3,

    PWM2_MODULE2_CHB_C11=2*40+5*4,
    PWM2_MODULE2_CHA_C10=2*40+5*5,

    PWM2_MODULE3_CHB_B1 =2*40+5*6, PWM2_MODULE3_CHB_C19, PWM2_MODULE3_CHB_D3,
    PWM2_MODULE3_CHA_B0 =2*40+5*7, PWM2_MODULE3_CHA_C18, PWM2_MODULE3_CHA_D2, PWM2_MODULE3_CHA_B9,





    PWM4_MODULE0_CHA_B24=4*40+5*1,

    PWM4_MODULE1_CHA_B25=4*40+5*3,

    PWM4_MODULE2_CHA_C30=4*40+5*5,

    PWM4_MODULE3_CHA_C31=4*40+5*7,
}pwm_channel_enum;


void pwm_set_duty (pwm_channel_enum pin, const uint32 duty);
void pwm_init (pwm_channel_enum pin, const uint32 freq, const uint32 duty);
# 74 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_sdio.h" 1
# 42 "../../libraries/zf_driver\\zf_driver_sdio.h"
void sdio_init (void);
# 75 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_soft_iic.h" 1
# 41 "../../libraries/zf_driver\\zf_driver_soft_iic.h"
typedef struct
{
    uint32 scl_pin;
    uint32 sda_pin;
    uint8 addr;
    uint32 delay;
}soft_iic_info_struct;

void soft_iic_write_8bit (soft_iic_info_struct *soft_iic_obj, const uint8 data);
void soft_iic_write_8bit_array (soft_iic_info_struct *soft_iic_obj, const uint8 *data, uint32 len);

void soft_iic_write_16bit (soft_iic_info_struct *soft_iic_obj, const uint16 data);
void soft_iic_write_16bit_array (soft_iic_info_struct *soft_iic_obj, const uint16 *data, uint32 len);

void soft_iic_write_8bit_register (soft_iic_info_struct *soft_iic_obj, const uint8 register_name, const uint8 data);
void soft_iic_write_8bit_registers (soft_iic_info_struct *soft_iic_obj, const uint8 register_name, const uint8 *data, uint32 len);

void soft_iic_write_16bit_register (soft_iic_info_struct *soft_iic_obj, const uint16 register_name, const uint16 data);
void soft_iic_write_16bit_registers (soft_iic_info_struct *soft_iic_obj, const uint16 register_name, const uint16 *data, uint32 len);

uint8 soft_iic_read_8bit (soft_iic_info_struct *soft_iic_obj);
void soft_iic_read_8bit_array (soft_iic_info_struct *soft_iic_obj, uint8 *data, uint32 len);

uint16 soft_iic_read_16bit (soft_iic_info_struct *soft_iic_obj);
void soft_iic_read_16bit_array (soft_iic_info_struct *soft_iic_obj, uint16 *data, uint32 len);

uint8 soft_iic_read_8bit_register (soft_iic_info_struct *soft_iic_obj, const uint8 register_name);
void soft_iic_read_8bit_registers (soft_iic_info_struct *soft_iic_obj, const uint8 register_name, uint8 *data, uint32 len);

uint16 soft_iic_read_16bit_register (soft_iic_info_struct *soft_iic_obj, const uint16 register_name);
void soft_iic_read_16bit_registers (soft_iic_info_struct *soft_iic_obj, const uint16 register_name, uint16 *data, uint32 len);

void soft_iic_transfer_8bit_array (soft_iic_info_struct *soft_iic_obj, const uint8 *write_data, uint32 write_len, uint8 *read_data, uint32 read_len);
void soft_iic_transfer_16bit_array (soft_iic_info_struct *soft_iic_obj, const uint16 *write_data, uint32 write_len, uint16 *read_data, uint32 read_len);

void soft_iic_sccb_write_register (soft_iic_info_struct *soft_iic_obj, const uint8 register_name, uint8 data);
uint8 soft_iic_sccb_read_register (soft_iic_info_struct *soft_iic_obj, const uint8 register_name);

void soft_iic_init (soft_iic_info_struct *soft_iic_obj, uint8 addr, uint32 delay, gpio_pin_enum scl_pin, gpio_pin_enum sda_pin);
# 76 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_soft_spi.h" 1
# 43 "../../libraries/zf_driver\\zf_driver_soft_spi.h"
typedef struct
{
    union
    {
        uint8 config_info;
        struct
        {
            uint8 mode :6;
            uint8 use_miso :1;
            uint8 use_cs :1;
        };
    }config;
    gpio_pin_enum sck_pin;
    gpio_pin_enum mosi_pin;
    gpio_pin_enum miso_pin;
    gpio_pin_enum cs_pin;
    uint32 delay;
}soft_spi_info_struct;

void soft_spi_write_8bit (soft_spi_info_struct *soft_spi_obj, const uint8 data);
void soft_spi_write_8bit_array (soft_spi_info_struct *soft_spi_obj, const uint8 *data, uint32 len);

void soft_spi_write_16bit (soft_spi_info_struct *soft_spi_obj, const uint16 data);
void soft_spi_write_16bit_array (soft_spi_info_struct *soft_spi_obj, const uint16 *data, uint32 len);

void soft_spi_write_8bit_register (soft_spi_info_struct *soft_spi_obj, const uint8 register_name, const uint8 data);
void soft_spi_write_8bit_registers (soft_spi_info_struct *soft_spi_obj, const uint8 register_name, const uint8 *data, uint32 len);

void soft_spi_write_16bit_register (soft_spi_info_struct *soft_spi_obj, const uint16 register_name, const uint16 data);
void soft_spi_write_16bit_registers (soft_spi_info_struct *soft_spi_obj, const uint16 register_name, const uint16 *data, uint32 len);

uint8 soft_spi_read_8bit (soft_spi_info_struct *soft_spi_obj);
void soft_spi_read_8bit_array (soft_spi_info_struct *soft_spi_obj, uint8 *data, uint32 len);

uint16 soft_spi_read_16bit (soft_spi_info_struct *soft_spi_obj);
void soft_spi_read_16bit_array (soft_spi_info_struct *soft_spi_obj, uint16 *data, uint32 len);

uint8 soft_spi_read_8bit_register (soft_spi_info_struct *soft_spi_obj, const uint8 register_name);
void soft_spi_read_8bit_registers (soft_spi_info_struct *soft_spi_obj, const uint8 register_name, uint8 *data, uint32 len);

uint16 soft_spi_read_16bit_register (soft_spi_info_struct *soft_spi_obj, const uint16 register_name);
void soft_spi_read_16bit_registers (soft_spi_info_struct *soft_spi_obj, const uint16 register_name, uint16 *data, uint32 len);

void soft_spi_transfer_8bit (soft_spi_info_struct *soft_spi_obj, const uint8 *write_buffer, uint8 *read_buffer, uint32 len);
void soft_spi_transfer_16bit (soft_spi_info_struct *soft_spi_obj, const uint16 *write_buffer, uint16 *read_buffer, uint32 len);

void soft_spi_init (soft_spi_info_struct *soft_spi_obj, uint8 mode, uint32 delay, gpio_pin_enum sck_pin, gpio_pin_enum mosi_pin, uint32 miso_pin, uint32 cs_pin);
# 77 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_spi.h" 1
# 43 "../../libraries/zf_driver\\zf_driver_spi.h"
typedef enum
{

    SPI1_SCK_D12 = 1 * 16,


    SPI3_SCK_B0 = 3 * 16, SPI3_SCK_B31,


    SPI4_SCK_C3 = 4 * 16, SPI4_SCK_C23 ,
}spi_sck_pin_enum;

typedef enum
{

    SPI1_MOSI_D14 = 1 * 16,


    SPI3_MOSI_B1 = 3 * 16, SPI3_MOSI_B30,


    SPI4_MOSI_C2 = 4 * 16, SPI4_MOSI_C22,
}spi_mosi_pin_enum;

typedef enum
{
    SPI_MISO_NULL = 0xFFFF,


    SPI1_MISO_D15 = 1 * 16,


    SPI3_MISO_B2 = 3 * 16, SPI3_MISO_B29,


    SPI4_MISO_C1 = 4 * 16, SPI4_MISO_C21,
}spi_miso_pin_enum;

typedef enum
{
    SPI_CS_NULL = 0xFFFF,

    SPI1_CS0_D13 = 1 * 16 + 2 * 0,
    SPI1_CS2_D26 = 1 * 16 + 2 * 2,
    SPI1_CS3_D27 = 1 * 16 + 2 * 3,

    SPI3_CS0_B3 = 3 * 16 + 2 * 0, SPI3_CS0_B28,

    SPI4_CS0_C0 = 4 * 16 + 2 * 0, SPI4_CS0_C20 ,
    SPI4_CS1_C19 = 4 * 16 + 2 * 1,
    SPI4_CS2_C18 = 4 * 16 + 2 * 2,
    SPI4_CS3_C27 = 4 * 16 + 2 * 3,
}spi_cs_pin_enum;

typedef enum
{
    SPI_MODE0,
    SPI_MODE1,
    SPI_MODE2,
    SPI_MODE3,
}spi_mode_enum;

typedef enum
{
    SPI_8BIT,
    SPI_16BIT,
}spi_bit_enum;

typedef enum
{
    SPI_1 = 1,
    SPI_3 = 3,
    SPI_4,
    SPI_MAX,
}spi_index_enum;

void spi_write_8bit (spi_index_enum spi_n, const uint8 data);
void spi_write_8bit_array (spi_index_enum spi_n, const uint8 *data, uint32 len);

void spi_write_16bit (spi_index_enum spi_n, const uint16 data);
void spi_write_16bit_array (spi_index_enum spi_n, const uint16 *data, uint32 len);

void spi_write_8bit_register (spi_index_enum spi_n, const uint8 register_name, const uint8 data);
void spi_write_8bit_registers (spi_index_enum spi_n, const uint8 register_name, const uint8 *data, uint32 len);

void spi_write_16bit_register (spi_index_enum spi_n, const uint16 register_name, const uint16 data);
void spi_write_16bit_registers (spi_index_enum spi_n, const uint16 register_name, const uint16 *data, uint32 len);

uint8 spi_read_8bit (spi_index_enum spi_n);
void spi_read_8bit_array (spi_index_enum spi_n, uint8 *data, uint32 len);

uint16 spi_read_16bit (spi_index_enum spi_n);
void spi_read_16bit_array (spi_index_enum spi_n, uint16 *data, uint32 len);

uint8 spi_read_8bit_register (spi_index_enum spi_n, const uint8 register_name);
void spi_read_8bit_registers (spi_index_enum spi_n, const uint8 register_name, uint8 *data, uint32 len);

uint16 spi_read_16bit_register (spi_index_enum spi_n, const uint16 register_name);
void spi_read_16bit_registers (spi_index_enum spi_n, const uint16 register_name, uint16 *data, uint32 len);

void spi_transfer_8bit (spi_index_enum spi_n, const uint8 *write_buffer, uint8 *read_buffer, uint32 len);
void spi_transfer_16bit (spi_index_enum spi_n, const uint16 *write_buffer, uint16 *read_buffer, uint32 len);

void spi_init (spi_index_enum spi_n, spi_mode_enum mode, uint32 baud, spi_sck_pin_enum sck_pin, spi_mosi_pin_enum mosi_pin, spi_miso_pin_enum miso_pin, spi_cs_pin_enum cs_pin);
# 78 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_timer.h" 1
# 41 "../../libraries/zf_driver\\zf_driver_timer.h"
typedef enum
{
    GPT_TIM_1 = 1,
}timer_index_enum;

typedef enum
{
    TIMER_IPG1_2_CLOCK,
    TIMER_US,
    TIMER_MS,
}timer_mode_enum;



void timer_start (timer_index_enum index);
void timer_stop (timer_index_enum index);
uint32 timer_get (timer_index_enum index);
void timer_clear (timer_index_enum index);

void timer_init (timer_index_enum index, timer_mode_enum mode);
# 79 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_uart.h" 1
# 40 "../../libraries/zf_driver\\zf_driver_uart.h"
# 1 "../../libraries/sdk/drives\\fsl_lpuart.h" 1
# 34 "../../libraries/sdk/drives\\fsl_lpuart.h"
enum
{
    kStatus_LPUART_TxBusy = ((((kStatusGroup_LPUART)*100L) + (0))),
    kStatus_LPUART_RxBusy = ((((kStatusGroup_LPUART)*100L) + (1))),
    kStatus_LPUART_TxIdle = ((((kStatusGroup_LPUART)*100L) + (2))),
    kStatus_LPUART_RxIdle = ((((kStatusGroup_LPUART)*100L) + (3))),
    kStatus_LPUART_TxWatermarkTooLarge = ((((kStatusGroup_LPUART)*100L) + (4))),
    kStatus_LPUART_RxWatermarkTooLarge = ((((kStatusGroup_LPUART)*100L) + (5))),
    kStatus_LPUART_FlagCannotClearManually = ((((kStatusGroup_LPUART)*100L) + (6))),
    kStatus_LPUART_Error = ((((kStatusGroup_LPUART)*100L) + (7))),
    kStatus_LPUART_RxRingBufferOverrun =
        ((((kStatusGroup_LPUART)*100L) + (8))),
    kStatus_LPUART_RxHardwareOverrun = ((((kStatusGroup_LPUART)*100L) + (9))),
    kStatus_LPUART_NoiseError = ((((kStatusGroup_LPUART)*100L) + (10))),
    kStatus_LPUART_FramingError = ((((kStatusGroup_LPUART)*100L) + (11))),
    kStatus_LPUART_ParityError = ((((kStatusGroup_LPUART)*100L) + (12))),
    kStatus_LPUART_BaudrateNotSupport =
        ((((kStatusGroup_LPUART)*100L) + (13))),
    kStatus_LPUART_IdleLineDetected = ((((kStatusGroup_LPUART)*100L) + (14))),
    kStatus_LPUART_Timeout = ((((kStatusGroup_LPUART)*100L) + (15))),
};


typedef enum _lpuart_parity_mode
{
    kLPUART_ParityDisabled = 0x0U,
    kLPUART_ParityEven = 0x2U,
    kLPUART_ParityOdd = 0x3U,
} lpuart_parity_mode_t;


typedef enum _lpuart_data_bits
{
    kLPUART_EightDataBits = 0x0U,

    kLPUART_SevenDataBits = 0x1U,

} lpuart_data_bits_t;


typedef enum _lpuart_stop_bit_count
{
    kLPUART_OneStopBit = 0U,
    kLPUART_TwoStopBit = 1U,
} lpuart_stop_bit_count_t;



typedef enum _lpuart_transmit_cts_source
{
    kLPUART_CtsSourcePin = 0U,
    kLPUART_CtsSourceMatchResult = 1U,
} lpuart_transmit_cts_source_t;


typedef enum _lpuart_transmit_cts_config
{
    kLPUART_CtsSampleAtStart = 0U,
    kLPUART_CtsSampleAtIdle = 1U,
} lpuart_transmit_cts_config_t;



typedef enum _lpuart_idle_type_select
{
    kLPUART_IdleTypeStartBit = 0U,
    kLPUART_IdleTypeStopBit = 1U,
} lpuart_idle_type_select_t;





typedef enum _lpuart_idle_config
{
    kLPUART_IdleCharacter1 = 0U,
    kLPUART_IdleCharacter2 = 1U,
    kLPUART_IdleCharacter4 = 2U,
    kLPUART_IdleCharacter8 = 3U,
    kLPUART_IdleCharacter16 = 4U,
    kLPUART_IdleCharacter32 = 5U,
    kLPUART_IdleCharacter64 = 6U,
    kLPUART_IdleCharacter128 = 7U,
} lpuart_idle_config_t;






enum _lpuart_interrupt_enable
{

    kLPUART_LinBreakInterruptEnable = ((0x8000U) >> 8U),

    kLPUART_RxActiveEdgeInterruptEnable = ((0x4000U) >> 8U),
    kLPUART_TxDataRegEmptyInterruptEnable = ((0x800000U)),
    kLPUART_TransmissionCompleteInterruptEnable = ((0x400000U)),
    kLPUART_RxDataRegFullInterruptEnable = ((0x200000U)),
    kLPUART_IdleLineInterruptEnable = ((0x100000U)),
    kLPUART_RxOverrunInterruptEnable = ((0x8000000U)),
    kLPUART_NoiseErrorInterruptEnable = ((0x4000000U)),
    kLPUART_FramingErrorInterruptEnable = ((0x2000000U)),
    kLPUART_ParityErrorInterruptEnable = ((0x1000000U)),

    kLPUART_Match1InterruptEnable = ((0x8000U)),
    kLPUART_Match2InterruptEnable = ((0x4000U)),


    kLPUART_TxFifoOverflowInterruptEnable = ((0x200U)),
    kLPUART_RxFifoUnderflowInterruptEnable = ((0x100U)),


    kLPUART_AllInterruptEnable = kLPUART_RxActiveEdgeInterruptEnable | kLPUART_TxDataRegEmptyInterruptEnable |
                                 kLPUART_TransmissionCompleteInterruptEnable | kLPUART_RxDataRegFullInterruptEnable |
                                 kLPUART_IdleLineInterruptEnable | kLPUART_RxOverrunInterruptEnable |
                                 kLPUART_NoiseErrorInterruptEnable | kLPUART_FramingErrorInterruptEnable |
                                 kLPUART_ParityErrorInterruptEnable

                                 | kLPUART_LinBreakInterruptEnable


                                 | kLPUART_Match1InterruptEnable | kLPUART_Match2InterruptEnable


                                 | kLPUART_TxFifoOverflowInterruptEnable | kLPUART_RxFifoUnderflowInterruptEnable

    ,
};






enum _lpuart_flags
{
    kLPUART_TxDataRegEmptyFlag =
        ((0x800000U)),
    kLPUART_TransmissionCompleteFlag =
        ((0x400000U)),
    kLPUART_RxDataRegFullFlag = ((0x200000U)),

    kLPUART_IdleLineFlag = ((0x100000U)),
    kLPUART_RxOverrunFlag = ((0x80000U)),

    kLPUART_NoiseErrorFlag = ((0x40000U)),

    kLPUART_FramingErrorFlag =
        ((0x20000U)),
    kLPUART_ParityErrorFlag = ((0x10000U)),

    kLPUART_LinBreakFlag = ((0x80000000U)),


    kLPUART_RxActiveEdgeFlag = ((0x40000000U)),

    kLPUART_RxActiveFlag =
        ((0x1000000U)),

    kLPUART_DataMatch1Flag =
        (0x8000U),
    kLPUART_DataMatch2Flag =
        (0x4000U),


    kLPUART_TxFifoEmptyFlag =
        ((0x800000U) >> 16),
    kLPUART_RxFifoEmptyFlag =
        ((0x400000U) >> 16),
    kLPUART_TxFifoOverflowFlag =
        ((0x20000U) >> 16),
    kLPUART_RxFifoUnderflowFlag =
        ((0x10000U) >> 16),


    kLPUART_AllClearFlags = kLPUART_RxActiveEdgeFlag | kLPUART_IdleLineFlag | kLPUART_RxOverrunFlag |
                            kLPUART_NoiseErrorFlag | kLPUART_FramingErrorFlag | kLPUART_ParityErrorFlag

                            | kLPUART_DataMatch1Flag | kLPUART_DataMatch2Flag


                            | kLPUART_TxFifoOverflowFlag | kLPUART_RxFifoUnderflowFlag


                            | kLPUART_LinBreakFlag

    ,

    kLPUART_AllFlags =
        kLPUART_RxActiveEdgeFlag | kLPUART_IdleLineFlag | kLPUART_RxOverrunFlag | kLPUART_TxDataRegEmptyFlag |
        kLPUART_TransmissionCompleteFlag | kLPUART_RxDataRegFullFlag | kLPUART_RxActiveFlag | kLPUART_NoiseErrorFlag |
        kLPUART_FramingErrorFlag | kLPUART_ParityErrorFlag

        | kLPUART_DataMatch1Flag | kLPUART_DataMatch2Flag


        | kLPUART_TxFifoOverflowFlag | kLPUART_RxFifoUnderflowFlag | kLPUART_TxFifoEmptyFlag | kLPUART_RxFifoEmptyFlag


        | kLPUART_LinBreakFlag

    ,
};


typedef struct _lpuart_config
{
    uint32_t baudRate_Bps;
    lpuart_parity_mode_t parityMode;
    lpuart_data_bits_t dataBitsCount;
    _Bool isMsb;

    lpuart_stop_bit_count_t stopBitCount;


    uint8_t txFifoWatermark;
    uint8_t rxFifoWatermark;


    _Bool enableRxRTS;
    _Bool enableTxCTS;
    lpuart_transmit_cts_source_t txCtsSource;
    lpuart_transmit_cts_config_t txCtsConfig;

    lpuart_idle_type_select_t rxIdleType;
    lpuart_idle_config_t rxIdleConfig;
    _Bool enableTx;
    _Bool enableRx;
} lpuart_config_t;


typedef struct _lpuart_transfer
{




    union
    {
        uint8_t *data;
        uint8_t *rxData;
        const uint8_t *txData;
    };
    size_t dataSize;
} lpuart_transfer_t;


typedef struct _lpuart_handle lpuart_handle_t;


typedef void (*lpuart_transfer_callback_t)(LPUART_Type *base, lpuart_handle_t *handle, status_t status, void *userData);


struct _lpuart_handle
{
    const uint8_t *volatile txData;
    volatile size_t txDataSize;
    size_t txDataSizeAll;
    uint8_t *volatile rxData;
    volatile size_t rxDataSize;
    size_t rxDataSizeAll;

    uint8_t *rxRingBuffer;
    size_t rxRingBufferSize;
    volatile uint16_t rxRingBufferHead;
    volatile uint16_t rxRingBufferTail;

    lpuart_transfer_callback_t callback;
    void *userData;

    volatile uint8_t txState;
    volatile uint8_t rxState;


    _Bool isSevenDataBits;

};


typedef void (*lpuart_isr_t)(LPUART_Type *base, void *handle);





extern void *s_lpuartHandle[];





extern const IRQn_Type s_lpuartIRQ[];



extern lpuart_isr_t s_lpuartIsr;
# 355 "../../libraries/sdk/drives\\fsl_lpuart.h"
static inline void LPUART_SoftwareReset(LPUART_Type *base)
{
    base->GLOBAL |= (0x2U);
    base->GLOBAL &= ~(0x2U);
}
# 392 "../../libraries/sdk/drives\\fsl_lpuart.h"
status_t LPUART_Init(LPUART_Type *base, const lpuart_config_t *config, uint32_t srcClock_Hz);
# 401 "../../libraries/sdk/drives\\fsl_lpuart.h"
void LPUART_Deinit(LPUART_Type *base);
# 422 "../../libraries/sdk/drives\\fsl_lpuart.h"
void LPUART_GetDefaultConfig(lpuart_config_t *config);
# 444 "../../libraries/sdk/drives\\fsl_lpuart.h"
status_t LPUART_SetBaudRate(LPUART_Type *base, uint32_t baudRate_Bps, uint32_t srcClock_Hz);
# 454 "../../libraries/sdk/drives\\fsl_lpuart.h"
void LPUART_Enable9bitMode(LPUART_Type *base, _Bool enable);
# 473 "../../libraries/sdk/drives\\fsl_lpuart.h"
static inline void LPUART_SetMatchAddress(LPUART_Type *base, uint16_t address1, uint16_t address2)
{

    uint32_t address = ((uint32_t)address2 << 16U) | (uint32_t)address1 | 0x1000100UL;
    base->MATCH = address;
}
# 487 "../../libraries/sdk/drives\\fsl_lpuart.h"
static inline void LPUART_EnableMatchAddress(LPUART_Type *base, _Bool match1, _Bool match2)
{

    if (match1)
    {
        base->BAUD |= (uint32_t)(0x80000000U);
    }
    else
    {
        base->BAUD &= ~(uint32_t)(0x80000000U);
    }

    if (match2)
    {
        base->BAUD |= (uint32_t)(0x40000000U);
    }
    else
    {
        base->BAUD &= ~(uint32_t)(0x40000000U);
    }
}
# 516 "../../libraries/sdk/drives\\fsl_lpuart.h"
static inline void LPUART_SetRxFifoWatermark(LPUART_Type *base, uint8_t water)
{
    (((uint8_t)(4) > water) ? (void)0 : __aeabi_assert("(uint8_t)FSL_FEATURE_LPUART_FIFO_SIZEn(base) > water", "../../libraries/sdk/drives\\fsl_lpuart.h", 518),
# 518 "../../libraries/sdk/drives\\fsl_lpuart.h"
#pragma clang diagnostic push
# 518 "../../libraries/sdk/drives\\fsl_lpuart.h"
#pragma clang diagnostic ignored "-Wassume"
# 518 "../../libraries/sdk/drives\\fsl_lpuart.h"
    (__builtin_assume)(((uint8_t)(4) > water)?1:0)
# 518 "../../libraries/sdk/drives\\fsl_lpuart.h"
#pragma clang diagnostic pop
# 518 "../../libraries/sdk/drives\\fsl_lpuart.h"
    );
    base->WATER = (base->WATER & ~(0x30000U)) | (((uint32_t)(((uint32_t)(water)) << (16U))) & (0x30000U));
}







static inline void LPUART_SetTxFifoWatermark(LPUART_Type *base, uint8_t water)
{
    (((uint8_t)(4) > water) ? (void)0 : __aeabi_assert("(uint8_t)FSL_FEATURE_LPUART_FIFO_SIZEn(base) > water", "../../libraries/sdk/drives\\fsl_lpuart.h", 530),
# 530 "../../libraries/sdk/drives\\fsl_lpuart.h"
#pragma clang diagnostic push
# 530 "../../libraries/sdk/drives\\fsl_lpuart.h"
#pragma clang diagnostic ignored "-Wassume"
# 530 "../../libraries/sdk/drives\\fsl_lpuart.h"
    (__builtin_assume)(((uint8_t)(4) > water)?1:0)
# 530 "../../libraries/sdk/drives\\fsl_lpuart.h"
#pragma clang diagnostic pop
# 530 "../../libraries/sdk/drives\\fsl_lpuart.h"
    );
    base->WATER = (base->WATER & ~(0x3U)) | (((uint32_t)(((uint32_t)(water)) << (0U))) & (0x3U));
}
# 558 "../../libraries/sdk/drives\\fsl_lpuart.h"
uint32_t LPUART_GetStatusFlags(LPUART_Type *base);
# 579 "../../libraries/sdk/drives\\fsl_lpuart.h"
status_t LPUART_ClearStatusFlags(LPUART_Type *base, uint32_t mask);
# 600 "../../libraries/sdk/drives\\fsl_lpuart.h"
void LPUART_EnableInterrupts(LPUART_Type *base, uint32_t mask);
# 615 "../../libraries/sdk/drives\\fsl_lpuart.h"
void LPUART_DisableInterrupts(LPUART_Type *base, uint32_t mask);
# 637 "../../libraries/sdk/drives\\fsl_lpuart.h"
uint32_t LPUART_GetEnabledInterrupts(LPUART_Type *base);
# 653 "../../libraries/sdk/drives\\fsl_lpuart.h"
static inline uint32_t LPUART_GetDataRegisterAddress(LPUART_Type *base)
{
    return (uint32_t) & (base->DATA);
}
# 666 "../../libraries/sdk/drives\\fsl_lpuart.h"
static inline void LPUART_EnableTxDMA(LPUART_Type *base, _Bool enable)
{
    if (enable)
    {
        base->BAUD |= (0x800000U);
    }
    else
    {
        base->BAUD &= ~(0x800000U);
    }
}
# 686 "../../libraries/sdk/drives\\fsl_lpuart.h"
static inline void LPUART_EnableRxDMA(LPUART_Type *base, _Bool enable)
{
    if (enable)
    {
        base->BAUD |= (0x200000U);
    }
    else
    {
        base->BAUD &= ~(0x200000U);
    }
}
# 711 "../../libraries/sdk/drives\\fsl_lpuart.h"
uint32_t LPUART_GetInstance(LPUART_Type *base);
# 721 "../../libraries/sdk/drives\\fsl_lpuart.h"
static inline void LPUART_EnableTx(LPUART_Type *base, _Bool enable)
{
    if (enable)
    {
        base->CTRL |= (0x80000U);
    }
    else
    {
        base->CTRL &= ~(0x80000U);
    }
}
# 741 "../../libraries/sdk/drives\\fsl_lpuart.h"
static inline void LPUART_EnableRx(LPUART_Type *base, _Bool enable)
{
    if (enable)
    {
        base->CTRL |= (0x40000U);
    }
    else
    {
        base->CTRL &= ~(0x40000U);
    }
}
# 762 "../../libraries/sdk/drives\\fsl_lpuart.h"
static inline void LPUART_WriteByte(LPUART_Type *base, uint8_t data)
{
    base->DATA = data;
}
# 776 "../../libraries/sdk/drives\\fsl_lpuart.h"
static inline uint8_t LPUART_ReadByte(LPUART_Type *base)
{

    uint32_t ctrl = base->CTRL;
    uint8_t result;
    _Bool isSevenDataBits = (((ctrl & (0x800U)) != 0U) ||
                            (((ctrl & (0x800U)) == 0U) && ((ctrl & (0x10U)) == 0U) &&
                             ((ctrl & (0x2U)) != 0U)));

    if (isSevenDataBits)
    {
        result = (uint8_t)(base->DATA & 0x7FU);
    }
    else
    {
        result = (uint8_t)base->DATA;
    }

    return result;



}
# 807 "../../libraries/sdk/drives\\fsl_lpuart.h"
static inline uint8_t LPUART_GetRxFifoCount(LPUART_Type *base)
{
    return (uint8_t)((base->WATER & (0x7000000U)) >> (24U));
}







static inline uint8_t LPUART_GetTxFifoCount(LPUART_Type *base)
{
    return (uint8_t)((base->WATER & (0x700U)) >> (8U));
}
# 830 "../../libraries/sdk/drives\\fsl_lpuart.h"
void LPUART_SendAddress(LPUART_Type *base, uint8_t address);
# 844 "../../libraries/sdk/drives\\fsl_lpuart.h"
status_t LPUART_WriteBlocking(LPUART_Type *base, const uint8_t *data, size_t length);
# 862 "../../libraries/sdk/drives\\fsl_lpuart.h"
status_t LPUART_ReadBlocking(LPUART_Type *base, uint8_t *data, size_t length);
# 889 "../../libraries/sdk/drives\\fsl_lpuart.h"
void LPUART_TransferCreateHandle(LPUART_Type *base,
                                 lpuart_handle_t *handle,
                                 lpuart_transfer_callback_t callback,
                                 void *userData);
# 912 "../../libraries/sdk/drives\\fsl_lpuart.h"
status_t LPUART_TransferSendNonBlocking(LPUART_Type *base, lpuart_handle_t *handle, lpuart_transfer_t *xfer);
# 931 "../../libraries/sdk/drives\\fsl_lpuart.h"
void LPUART_TransferStartRingBuffer(LPUART_Type *base,
                                    lpuart_handle_t *handle,
                                    uint8_t *ringBuffer,
                                    size_t ringBufferSize);
# 944 "../../libraries/sdk/drives\\fsl_lpuart.h"
void LPUART_TransferStopRingBuffer(LPUART_Type *base, lpuart_handle_t *handle);
# 953 "../../libraries/sdk/drives\\fsl_lpuart.h"
size_t LPUART_TransferGetRxRingBufferLength(LPUART_Type *base, lpuart_handle_t *handle);
# 964 "../../libraries/sdk/drives\\fsl_lpuart.h"
void LPUART_TransferAbortSend(LPUART_Type *base, lpuart_handle_t *handle);
# 978 "../../libraries/sdk/drives\\fsl_lpuart.h"
status_t LPUART_TransferGetSendCount(LPUART_Type *base, lpuart_handle_t *handle, uint32_t *count);
# 1006 "../../libraries/sdk/drives\\fsl_lpuart.h"
status_t LPUART_TransferReceiveNonBlocking(LPUART_Type *base,
                                           lpuart_handle_t *handle,
                                           lpuart_transfer_t *xfer,
                                           size_t *receivedBytes);
# 1020 "../../libraries/sdk/drives\\fsl_lpuart.h"
void LPUART_TransferAbortReceive(LPUART_Type *base, lpuart_handle_t *handle);
# 1034 "../../libraries/sdk/drives\\fsl_lpuart.h"
status_t LPUART_TransferGetReceiveCount(LPUART_Type *base, lpuart_handle_t *handle, uint32_t *count);
# 1044 "../../libraries/sdk/drives\\fsl_lpuart.h"
void LPUART_TransferHandleIRQ(LPUART_Type *base, void *irqHandle);
# 1054 "../../libraries/sdk/drives\\fsl_lpuart.h"
void LPUART_TransferHandleErrorIRQ(LPUART_Type *base, void *irqHandle);
# 41 "../../libraries/zf_driver\\zf_driver_uart.h" 2

typedef enum
{

    UART1_TX_B12 = 16 * 1,


    UART2_TX_B18 = 16 * 2,


    UART3_TX_B22 = 16 * 3, UART3_TX_C8,


    UART4_TX_C16 = 16 * 4, UART4_TX_D0,


    UART5_TX_C28 = 16 * 5,


    UART6_TX_B2 = 16 * 6,





    UART8_TX_B26 = 16 * 8, UART8_TX_D16,

}uart_tx_pin_enum;

typedef enum
{

    UART1_RX_B13 = 16 * 1,


    UART2_RX_B19 = 16 * 2,


    UART3_RX_B23 = 16 * 3, UART3_RX_C9,


    UART4_RX_C17 = 16 * 4, UART4_RX_D1,


    UART5_RX_C29 = 16 * 5,


    UART6_RX_B3 = 16 * 6,





    UART8_RX_B27 = 16 * 8, UART8_RX_D17,
}uart_rx_pin_enum;

typedef enum
{
    UART_1 = 1,
    UART_2,
    UART_3,
    UART_4,
    UART_5,
    UART_6,
    UART_8 = 8,
}uart_index_enum;


void uart_write_byte (uart_index_enum uartn, const uint8 dat);
void uart_write_buffer (uart_index_enum uartn, const uint8 *buff, uint32 len);
void uart_write_string (uart_index_enum uartn, const char *str);

uint8 uart_read_byte (uart_index_enum uartn);
uint8 uart_query_byte (uart_index_enum uartn, uint8 *dat);

void uart_tx_interrupt (uart_index_enum uartn, uint32 status);
void uart_rx_interrupt (uart_index_enum uartn, uint32 status);

void uart_init (uart_index_enum uartn, uint32 baud, uart_tx_pin_enum tx_pin, uart_rx_pin_enum rx_pin);
# 80 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_csi.h" 1
# 42 "../../libraries/zf_driver\\zf_driver_csi.h"
extern csi_handle_t csi_handle;



typedef enum
{
    CSI_VSYNC_B14,
    CSI_VSYNC_B22,
    CSI_VSYNC_C29,
}vsync_pin_enum;


typedef enum
{
    CSI_PIXCLK_B20,
    CSI_PIXCLK_C28,
}pixclk_pin_enum;


typedef enum
{
    CSI_PIXCLK_RISING = kCSI_DataLatchOnRisingEdge,
    CSI_PIXCLK_FALLING = kCSI_DataLatchOnFallingEdge,
}pixclk_polarity_enum;

void csi_add_empty_buffer(csi_handle_t *handle, uint8 *buff);
uint8 csi_get_full_buffer(csi_handle_t *handle, uint32 *buffaddr);
void csi_start(csi_handle_t *handle);
void csi_stop(csi_handle_t *handle);
void csi_init(uint16 width, uint16 height, csi_handle_t *handle, csi_transfer_callback_t callback, vsync_pin_enum vsync, pixclk_pin_enum pixclk, pixclk_polarity_enum pixclk_polarity);
# 81 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_romapi.h" 1
# 27 "../../libraries/zf_driver\\zf_driver_romapi.h"
# 1 "../../libraries/sdk/xip\\EVKMIMXRT1064_FLEXSPI_NOR_CONFIG.h" 1
# 79 "../../libraries/sdk/xip\\EVKMIMXRT1064_FLEXSPI_NOR_CONFIG.h"
typedef enum _FlexSpiSerialClockFreq
{
    kFlexSpiSerialClk_30MHz = 1,
    kFlexSpiSerialClk_50MHz = 2,
    kFlexSpiSerialClk_60MHz = 3,
    kFlexSpiSerialClk_75MHz = 4,
    kFlexSpiSerialClk_80MHz = 5,
    kFlexSpiSerialClk_100MHz = 6,
    kFlexSpiSerialClk_120MHz = 7,
    kFlexSpiSerialClk_133MHz = 8,
    kFlexSpiSerialClk_166MHz = 9,
} flexspi_serial_clk_freq_t;


enum
{
    kFlexSpiClk_SDR,
    kFlexSpiClk_DDR,
};


typedef enum _FlashReadSampleClkSource
{
    kFlexSPIReadSampleClk_LoopbackInternally = 0,
    kFlexSPIReadSampleClk_LoopbackFromDqsPad = 1,
    kFlexSPIReadSampleClk_LoopbackFromSckPad = 2,
    kFlexSPIReadSampleClk_ExternalInputFromDqsPad = 3,
} flexspi_read_sample_clk_t;


enum
{
    kFlexSpiMiscOffset_DiffClkEnable = 0,
    kFlexSpiMiscOffset_Ck2Enable = 1,
    kFlexSpiMiscOffset_ParallelEnable = 2,
    kFlexSpiMiscOffset_WordAddressableEnable = 3,
    kFlexSpiMiscOffset_SafeConfigFreqEnable = 4,
    kFlexSpiMiscOffset_PadSettingOverrideEnable = 5,
    kFlexSpiMiscOffset_DdrModeEnable = 6,
};


enum
{
    kFlexSpiDeviceType_SerialNOR = 1,
    kFlexSpiDeviceType_SerialNAND = 2,
    kFlexSpiDeviceType_SerialRAM = 3,
    kFlexSpiDeviceType_MCP_NOR_NAND = 0x12,
    kFlexSpiDeviceType_MCP_NOR_RAM = 0x13,
};


enum
{
    kSerialFlash_1Pad = 1,
    kSerialFlash_2Pads = 2,
    kSerialFlash_4Pads = 4,
    kSerialFlash_8Pads = 8,
};


typedef struct _lut_sequence
{
    uint8_t seqNum;
    uint8_t seqId;
    uint16_t reserved;
} flexspi_lut_seq_t;


enum
{
    kDeviceConfigCmdType_Generic,
    kDeviceConfigCmdType_QuadEnable,
    kDeviceConfigCmdType_Spi2Xpi,
    kDeviceConfigCmdType_Xpi2Spi,
    kDeviceConfigCmdType_Spi2NoCmd,
    kDeviceConfigCmdType_Reset,
};


typedef struct _FlexSPIConfig
{
    uint32_t tag;
    uint32_t version;
    uint32_t reserved0;
    uint8_t readSampleClkSrc;
    uint8_t csHoldTime;
    uint8_t csSetupTime;
    uint8_t columnAddressWidth;

    uint8_t deviceModeCfgEnable;
    uint8_t deviceModeType;

    uint16_t waitTimeCfgCommands;

    flexspi_lut_seq_t deviceModeSeq;

    uint32_t deviceModeArg;
    uint8_t configCmdEnable;
    uint8_t configModeType[3];
    flexspi_lut_seq_t
        configCmdSeqs[3];
    uint32_t reserved1;
    uint32_t configCmdArgs[3];
    uint32_t reserved2;
    uint32_t controllerMiscOption;

    uint8_t deviceType;
    uint8_t sflashPadType;
    uint8_t serialClkFreq;

    uint8_t lutCustomSeqEnable;

    uint32_t reserved3[2];
    uint32_t sflashA1Size;
    uint32_t sflashA2Size;
    uint32_t sflashB1Size;
    uint32_t sflashB2Size;
    uint32_t csPadSettingOverride;
    uint32_t sclkPadSettingOverride;
    uint32_t dataPadSettingOverride;
    uint32_t dqsPadSettingOverride;
    uint32_t timeoutInMs;
    uint32_t commandInterval;
    uint16_t dataValidTime[2];
    uint16_t busyOffset;
    uint16_t busyBitPolarity;

    uint32_t lookupTable[64];
    flexspi_lut_seq_t lutCustomSeq[12];
    uint32_t reserved4[4];
} flexspi_mem_config_t;
# 245 "../../libraries/sdk/xip\\EVKMIMXRT1064_FLEXSPI_NOR_CONFIG.h"
typedef struct _flexspi_nor_config
{
    flexspi_mem_config_t memConfig;
    uint32_t pageSize;
    uint32_t sectorSize;
    uint8_t ipcmdSerialClkFreq;
    uint8_t isUniformBlockSize;
    uint8_t reserved0[2];
    uint8_t serialNorType;
    uint8_t needExitNoCmdMode;
    uint8_t halfClkForNonReadCmd;
    uint8_t needRestoreNoCmdMode;
    uint32_t blockSize;
    uint32_t reserve2[11];
} flexspi_nor_config_t;
# 28 "../../libraries/zf_driver\\zf_driver_romapi.h" 2
# 1 "../../libraries/sdk/drives\\fsl_rtwdog.h" 1
# 39 "../../libraries/sdk/drives\\fsl_rtwdog.h"
typedef enum _rtwdog_clock_source
{
    kRTWDOG_ClockSource0 = 0U,
    kRTWDOG_ClockSource1 = 1U,
    kRTWDOG_ClockSource2 = 2U,
    kRTWDOG_ClockSource3 = 3U,
} rtwdog_clock_source_t;


typedef enum _rtwdog_clock_prescaler
{
    kRTWDOG_ClockPrescalerDivide1 = 0x0U,
    kRTWDOG_ClockPrescalerDivide256 = 0x1U,
} rtwdog_clock_prescaler_t;


typedef struct _rtwdog_work_mode
{
    _Bool enableWait;
    _Bool enableStop;
    _Bool enableDebug;
} rtwdog_work_mode_t;


typedef enum _rtwdog_test_mode
{
    kRTWDOG_TestModeDisabled = 0U,
    kRTWDOG_UserModeEnabled = 1U,
    kRTWDOG_LowByteTest = 2U,
    kRTWDOG_HighByteTest = 3U,
} rtwdog_test_mode_t;


typedef struct _rtwdog_config
{
    _Bool enableRtwdog;
    rtwdog_clock_source_t clockSource;
    rtwdog_clock_prescaler_t prescaler;
    rtwdog_work_mode_t workMode;
    rtwdog_test_mode_t testMode;
    _Bool enableUpdate;
    _Bool enableInterrupt;
    _Bool enableWindowMode;
    uint16_t windowValue;
    uint16_t timeoutValue;
} rtwdog_config_t;






enum _rtwdog_interrupt_enable_t
{
    kRTWDOG_InterruptEnable = (0x40U),
};






enum _rtwdog_status_flags_t
{
    kRTWDOG_RunningFlag = (0x80U),
    kRTWDOG_InterruptFlag = (0x4000U),
};
# 143 "../../libraries/sdk/drives\\fsl_rtwdog.h"
void RTWDOG_GetDefaultConfig(rtwdog_config_t *config);
# 168 "../../libraries/sdk/drives\\fsl_rtwdog.h"
__attribute__((section("CodeQuickAccess"), __noinline__)) void RTWDOG_Init(RTWDOG_Type *base, const rtwdog_config_t *config);
# 179 "../../libraries/sdk/drives\\fsl_rtwdog.h"
void RTWDOG_Deinit(RTWDOG_Type *base);
# 197 "../../libraries/sdk/drives\\fsl_rtwdog.h"
static inline void RTWDOG_Enable(RTWDOG_Type *base)
{
    base->CS |= (0x80U);
}
# 211 "../../libraries/sdk/drives\\fsl_rtwdog.h"
static inline void RTWDOG_Disable(RTWDOG_Type *base)
{
    base->CS &= ~(0x80U);
}
# 228 "../../libraries/sdk/drives\\fsl_rtwdog.h"
static inline void RTWDOG_EnableInterrupts(RTWDOG_Type *base, uint32_t mask)
{
    base->CS |= mask;
}
# 245 "../../libraries/sdk/drives\\fsl_rtwdog.h"
static inline void RTWDOG_DisableInterrupts(RTWDOG_Type *base, uint32_t mask)
{
    base->CS &= ~mask;
}
# 265 "../../libraries/sdk/drives\\fsl_rtwdog.h"
static inline uint32_t RTWDOG_GetStatusFlags(RTWDOG_Type *base)
{
    return (base->CS & ((0x80U) | (0x4000U)));
}







static inline void RTWDOG_EnableWindowMode(RTWDOG_Type *base, _Bool enable)
{
    if (enable)
    {
        base->CS |= (0x8000U);
    }
    else
    {
        base->CS &= ~(0x8000U);
    }
}
# 298 "../../libraries/sdk/drives\\fsl_rtwdog.h"
static inline uint32_t RTWDOG_CountToMesec(RTWDOG_Type *base, uint32_t count, uint32_t clockFreqInHz)
{
    if ((base->CS & (0x1000U)) != 0U)
    {
        clockFreqInHz /= 256U;
    }
    return count * 1000U / clockFreqInHz;
}
# 321 "../../libraries/sdk/drives\\fsl_rtwdog.h"
void RTWDOG_ClearStatusFlags(RTWDOG_Type *base, uint32_t mask);
# 333 "../../libraries/sdk/drives\\fsl_rtwdog.h"
static inline void RTWDOG_SetTimeoutValue(RTWDOG_Type *base, uint16_t timeoutCount)
{
    base->TOVAL = timeoutCount;
}
# 348 "../../libraries/sdk/drives\\fsl_rtwdog.h"
static inline void RTWDOG_SetWindowValue(RTWDOG_Type *base, uint16_t windowValue)
{
    base->WIN = windowValue;
}
# 364 "../../libraries/sdk/drives\\fsl_rtwdog.h"
__attribute__((always_inline)) static __inline void RTWDOG_Unlock(RTWDOG_Type *base)
{
    if (((base->CS) & (0x2000U)) != 0U)
    {
        base->CNT = (0xD928C520U);
    }
    else
    {
        base->CNT = ((0xD928C520U) & 0xFFFFU);
        base->CNT = (((0xD928C520U) >> 16U) & 0xFFFFU);
    }
    while ((base->CS & (0x800U)) == 0U)
    {
    }
}
# 388 "../../libraries/sdk/drives\\fsl_rtwdog.h"
static inline void RTWDOG_Refresh(RTWDOG_Type *base)
{
    uint32_t primaskValue = 0U;
    primaskValue = DisableGlobalIRQ();
    if (((base->CS) & (0x2000U)) != 0U)
    {
        base->CNT = (0xB480A602U);
    }
    else
    {
        base->CNT = ((0xB480A602U) & 0xFFFFU);
        base->CNT = (((0xB480A602U) >> 16U) & 0xFFFFU);
    }
    EnableGlobalIRQ(primaskValue);
}
# 412 "../../libraries/sdk/drives\\fsl_rtwdog.h"
static inline uint16_t RTWDOG_GetCounterValue(RTWDOG_Type *base)
{
    return (uint16_t)base->CNT;
}
# 29 "../../libraries/zf_driver\\zf_driver_romapi.h" 2
# 1 "../../libraries/sdk/drives\\fsl_wdog.h" 1
# 32 "../../libraries/sdk/drives\\fsl_wdog.h"
typedef struct _wdog_work_mode
{
    _Bool enableWait;
    _Bool enableStop;
    _Bool enableDebug;
} wdog_work_mode_t;


typedef struct _wdog_config
{
    _Bool enableWdog;
    wdog_work_mode_t workMode;
    _Bool enableInterrupt;
    uint16_t timeoutValue;
    uint16_t interruptTimeValue;
    _Bool softwareResetExtension;
    _Bool enablePowerDown;
    _Bool enableTimeOutAssert;
} wdog_config_t;






enum _wdog_interrupt_enable
{
    kWDOG_InterruptEnable = (0x8000U)
};






enum _wdog_status_flags
{
    kWDOG_RunningFlag = (0x4U),
    kWDOG_PowerOnResetFlag = (0x10U),
    kWDOG_TimeoutResetFlag = (0x2U),
    kWDOG_SoftwareResetFlag = (0x1U),
    kWDOG_InterruptFlag = (0x4000U)
};
# 109 "../../libraries/sdk/drives\\fsl_wdog.h"
void WDOG_GetDefaultConfig(wdog_config_t *config);
# 128 "../../libraries/sdk/drives\\fsl_wdog.h"
void WDOG_Init(WDOG_Type *base, const wdog_config_t *config);
# 138 "../../libraries/sdk/drives\\fsl_wdog.h"
void WDOG_Deinit(WDOG_Type *base);
# 148 "../../libraries/sdk/drives\\fsl_wdog.h"
static inline void WDOG_Enable(WDOG_Type *base)
{
    base->WCR |= (0x4U);
}
# 161 "../../libraries/sdk/drives\\fsl_wdog.h"
static inline void WDOG_Disable(WDOG_Type *base)
{
    base->WCR &= ~(uint16_t)(0x4U);
}
# 175 "../../libraries/sdk/drives\\fsl_wdog.h"
static inline void WDOG_TriggerSystemSoftwareReset(WDOG_Type *base)
{
    base->WCR &= ~(uint16_t)(0x10U);
}
# 191 "../../libraries/sdk/drives\\fsl_wdog.h"
static inline void WDOG_TriggerSoftwareSignal(WDOG_Type *base)
{
    base->WCR &= ~(uint16_t)(0x20U);
}
# 207 "../../libraries/sdk/drives\\fsl_wdog.h"
static inline void WDOG_EnableInterrupts(WDOG_Type *base, uint16_t mask)
{
    base->WICR |= mask;
}
# 226 "../../libraries/sdk/drives\\fsl_wdog.h"
uint16_t WDOG_GetStatusFlags(WDOG_Type *base);
# 242 "../../libraries/sdk/drives\\fsl_wdog.h"
void WDOG_ClearInterruptStatus(WDOG_Type *base, uint16_t mask);
# 255 "../../libraries/sdk/drives\\fsl_wdog.h"
static inline void WDOG_SetTimeoutValue(WDOG_Type *base, uint16_t timeoutCount)
{
    base->WCR = (base->WCR & (uint16_t)~(0xFF00U)) | (((uint16_t)(((uint16_t)(timeoutCount)) << (8U))) & (0xFF00U));
}
# 270 "../../libraries/sdk/drives\\fsl_wdog.h"
static inline void WDOG_SetInterrputTimeoutValue(WDOG_Type *base, uint16_t timeoutCount)
{
    base->WICR = (base->WICR & ~(uint16_t)(0xFFU)) | (((uint16_t)(((uint16_t)(timeoutCount)) << (0U))) & (0xFFU));
}
# 283 "../../libraries/sdk/drives\\fsl_wdog.h"
static inline void WDOG_DisablePowerDownEnable(WDOG_Type *base)
{
    base->WMCR &= ~(uint16_t)(0x1U);
}
# 296 "../../libraries/sdk/drives\\fsl_wdog.h"
void WDOG_Refresh(WDOG_Type *base);
# 30 "../../libraries/zf_driver\\zf_driver_romapi.h" 2



typedef enum _FlexSPIOperationType
{
    kFlexSpiOperation_Command,

    kFlexSpiOperation_Config,

    kFlexSpiOperation_Write,

    kFlexSpiOperation_Read,

    kFlexSpiOperation_End = kFlexSpiOperation_Read,
} flexspi_operation_t;


typedef struct _FlexSpiXfer
{
    flexspi_operation_t operation;
    uint32_t baseAddress;
    uint32_t seqId;
    uint32_t seqNum;
    _Bool isParallelModeEnable;
    uint32_t *txBuffer;
    uint32_t txSize;
    uint32_t *rxBuffer;
    uint32_t rxSize;
} flexspi_xfer_t;




typedef struct _serial_nor_config_option
{
    union
    {
        struct
        {
            uint32_t max_freq : 4;
            uint32_t misc_mode : 4;
            uint32_t quad_mode_setting : 4;
            uint32_t cmd_pads : 4;
            uint32_t query_pads : 4;
            uint32_t device_type : 4;
            uint32_t option_size : 4;
            uint32_t tag : 4;
        } B;
        uint32_t U;
    } option0;

    union
    {
        struct
        {
            uint32_t dummy_cycles : 8;
            uint32_t status_override : 8;
            uint32_t is_pinmux_group2 : 4;
            uint32_t reserved : 12;
        } B;
        uint32_t U;
    } option1;

} serial_nor_config_option_t;


typedef struct
{
    uint32_t version;
    status_t (*init)(uint32_t instance, flexspi_nor_config_t *config);
    status_t (*program)(uint32_t instance, flexspi_nor_config_t *config, uint32_t dst_addr, const uint32_t *src);
    status_t (*erase_all)(uint32_t instance, flexspi_nor_config_t *config);
    status_t (*erase)(uint32_t instance, flexspi_nor_config_t *config, uint32_t start, uint32_t lengthInBytes);
    status_t (*read)(
        uint32_t instance, flexspi_nor_config_t *config, uint32_t *dst, uint32_t addr, uint32_t lengthInBytes);
    void (*clear_cache)(uint32_t instance);
    status_t (*xfer)(uint32_t instance, flexspi_xfer_t *xfer);
    status_t (*update_lut)(uint32_t instance, uint32_t seqIndex, const uint32_t *lutBase, uint32_t seqNumber);
    status_t (*get_config)(uint32_t instance, flexspi_nor_config_t *config, serial_nor_config_option_t *option);
} flexspi_nor_driver_interface_t;

typedef struct
{
    uint32_t version;
    void (*CLOCK_SetMux)(clock_mux_t mux, uint32_t value);
    uint32_t (*CLOCK_GetMux)(clock_mux_t mux);
    void (*CLOCK_SetDiv)(clock_div_t divider, uint32_t value);
    uint32_t (*CLOCK_GetDiv)(clock_div_t divider);
    void (*CLOCK_ControlGate)(clock_ip_name_t name, clock_gate_value_t value);
    void (*CLOCK_EnableClock)(clock_ip_name_t name);
    void (*CLOCK_DisableClock)(clock_ip_name_t name);
    void (*CLOCK_SetMode)(clock_mode_t mode);
    void (*CLOCK_SetPllBypass)(CCM_ANALOG_Type *base, clock_pll_t pll, _Bool bypass);
    uint32_t (*CLOCK_GetFreq)(clock_name_t name);
    uint32_t (*CLOCK_GetCpuClkFreq)(void);
    void (*CLOCK_InitExternalClk)(_Bool bypassXtalOsc);
    void (*CLOCK_DeinitExternalClk)(void);
    void (*CLOCK_SwitchOsc)(clock_osc_t osc);
    uint32_t (*CLOCK_GetRtcFreq)(void);
    void (*CLOCK_SetXtalFreq)(uint32_t freq);
    void (*CLOCK_SetRtcXtalFreq)(uint32_t freq);
    void (*CLOCK_InitRcOsc24M)(void);
    void (*CLOCK_DeinitRcOsc24M)(void);
    void (*CLOCK_InitArmPll)(const clock_arm_pll_config_t *config);
    void (*CLOCK_DeinitArmPll)(void);
    void (*CLOCK_InitSysPll)(const clock_sys_pll_config_t *config);
    void (*CLOCK_DeinitSysPll)(void);
    void (*CLOCK_InitUsb1Pll)(const clock_usb_pll_config_t *config);
    void (*CLOCK_DeinitUsb1Pll)(void);
    void (*CLOCK_InitUsb2Pll)(const clock_usb_pll_config_t *config);
    void (*CLOCK_DeinitUsb2Pll)(void);
    void (*CLOCK_InitAudioPll)(const clock_audio_pll_config_t *config);
    void (*CLOCK_DeinitAudioPll)(void);
    void (*CLOCK_InitVideoPll)(const clock_video_pll_config_t *config);
    void (*CLOCK_DeinitVideoPll)(void);
    void (*CLOCK_InitEnetPll)(const clock_enet_pll_config_t *config);
    void (*CLOCK_DeinitEnetPll)(void);
    uint32_t (*CLOCK_GetPllFreq)(clock_pll_t pll);
    void (*CLOCK_InitSysPfd)(clock_pfd_t pfd, uint8_t pfdFrac);
    void (*CLOCK_DeinitSysPfd)(clock_pfd_t pfd);
    void (*CLOCK_InitUsb1Pfd)(clock_pfd_t pfd, uint8_t pfdFrac);
    void (*CLOCK_DeinitUsb1Pfd)(clock_pfd_t pfd);
    uint32_t (*CLOCK_GetSysPfdFreq)(clock_pfd_t pfd);
    uint32_t (*CLOCK_GetUsb1PfdFreq)(clock_pfd_t pfd);
    _Bool (*CLOCK_EnableUsbhs0Clock)(clock_usb_src_t src, uint32_t freq);
    _Bool (*CLOCK_EnableUsbhs0PhyPllClock)(clock_usb_phy_src_t src, uint32_t freq);
    void (*CLOCK_DisableUsbhs0PhyPllClock)(void);
    _Bool (*CLOCK_EnableUsbhs1Clock)(clock_usb_src_t src, uint32_t freq);
    _Bool (*CLOCK_EnableUsbhs1PhyPllClock)(clock_usb_phy_src_t src, uint32_t freq);
    void (*CLOCK_DisableUsbhs1PhyPllClock)(void);
} clock_driver_interface_t;

typedef struct
{
    void (*RTWDOG_GetDefaultConfig)(rtwdog_config_t *config);
    void (*RTWDOG_Init)(RTWDOG_Type *base, const rtwdog_config_t *config);
    void (*RTWDOG_Deinit)(RTWDOG_Type *base);
    void (*RTWDOG_Enable)(RTWDOG_Type *base);
    void (*RTWDOG_Disable)(RTWDOG_Type *base);
    void (*RTWDOG_EnableInterrupts)(RTWDOG_Type *base, uint32_t mask);
    void (*RTWDOG_DisableInterrupts)(RTWDOG_Type *base, uint32_t mask);
    uint32_t (*RTWDOG_GetStatusFlags)(RTWDOG_Type *base);
    void (*RTWDOG_ClearStatusFlags)(RTWDOG_Type *base, uint32_t mask);
    void (*RTWDOG_SetTimeoutValue)(RTWDOG_Type *base, uint16_t timeoutCount);
    void (*RTWDOG_SetWindowValue)(RTWDOG_Type *base, uint16_t windowValue);
    void (*RTWDOG_Unlock)(RTWDOG_Type *base);
    void (*RTWDOG_Refresh)(RTWDOG_Type *base);
    uint16_t (*RTWDOG_GetCounterValue)(RTWDOG_Type *base);
} rtwdog_driver_interface_t;

typedef struct
{
    void (*WDOG_GetDefaultConfig)(wdog_config_t *config);
    void (*WDOG_Init)(WDOG_Type *base, const wdog_config_t *config);
    void (*WDOG_Deinit)(WDOG_Type *base);
    void (*WDOG_Enable)(WDOG_Type *base);
    void (*WDOG_Disable)(WDOG_Type *base);
    void (*WDOG_EnableInterrupts)(WDOG_Type *base, uint16_t mask);
    uint16_t (*WDOG_GetStatusFlags)(WDOG_Type *base);
    void (*WDOG_ClearInterruptStatus)(WDOG_Type *base, uint16_t mask);
    void (*WDOG_SetTimeoutValue)(WDOG_Type *base, uint16_t timeoutCount);
    void (*WDOG_SetInterrputTimeoutValue)(WDOG_Type *base, uint16_t timeoutCount);
    void (*WDOG_DisablePowerDownEnable)(WDOG_Type *base);
    void (*WDOG_Refresh)(WDOG_Type *base);
} wdog_driver_interface_t;

typedef struct
{
    const uint32_t version;
    const char *copyright;
    void (*runBootloader)(void *arg);
    const uint32_t *reserved0;
    const flexspi_nor_driver_interface_t *flexSpiNorDriver;
    const uint32_t *reserved1;
    const clock_driver_interface_t *clockDriver;
    const rtwdog_driver_interface_t *rtwdogDriver;
    const wdog_driver_interface_t *wdogDriver;
    const uint32_t *reserved2;
} rom_api_entry_t;

enum
{
    kEnterBootloader_Tag = 0xEB,
    kEnterBootloader_Mode_Default = 0,
    kEnterBootloader_Mode_SerialDownloader = 1,

    kEnterBootloader_SerialInterface_Auto = 0,
    kEnterBootloader_SerialInterface_USB = 1,
    kEnterBootloader_SerialInterface_UART = 2,

    kEnterBootloader_ImageIndex_Max = 3,
};

typedef union
{
    struct
    {
        uint32_t imageIndex : 4;
        uint32_t reserved : 12;
        uint32_t serialBootInterface : 4;
        uint32_t bootMode : 4;
        uint32_t tag : 8;
    } B;
    uint32_t U;
} run_bootloader_ctx_t;

void rom_api_init(void);

void rom_api_CLOCK_SetMux(clock_mux_t mux, uint32_t value);
uint32_t rom_api_CLOCK_GetMux(clock_mux_t mux);
void rom_api_CLOCK_SetDiv(clock_div_t divider, uint32_t value);
uint32_t rom_api_CLOCK_GetDiv(clock_div_t divider);
void rom_api_CLOCK_ControlGate(clock_ip_name_t name, clock_gate_value_t value);
void rom_api_CLOCK_EnableClock(clock_ip_name_t name);
void rom_api_CLOCK_DisableClock(clock_ip_name_t name);
void rom_api_CLOCK_SetMode(clock_mode_t mode);
void rom_api_CLOCK_SetPllBypass(CCM_ANALOG_Type *base, clock_pll_t pll, _Bool bypass);
uint32_t rom_api_CLOCK_GetCpuClkFreq(void);
uint32_t rom_api_CLOCK_GetRtcFreq(void);
void rom_api_CLOCK_SetXtalFreq(uint32_t freq);
void rom_api_CLOCK_SetRtcXtalFreq(uint32_t freq);
void rom_api_CLOCK_InitExternalClk(_Bool bypassXtalOsc);
void rom_api_CLOCK_DeinitExternalClk(void);
void rom_api_CLOCK_SwitchOsc(clock_osc_t osc);
void rom_api_CLOCK_InitRcOsc24M(void);
void rom_api_CLOCK_DeinitRcOsc24M(void);
uint32_t rom_api_CLOCK_GetFreq(clock_name_t name);
_Bool rom_api_CLOCK_EnableUsbhs0Clock(clock_usb_src_t src, uint32_t freq);
_Bool rom_api_CLOCK_EnableUsbhs1Clock(clock_usb_src_t src, uint32_t freq);
_Bool rom_api_CLOCK_EnableUsbhs0PhyPllClock(clock_usb_phy_src_t src, uint32_t freq);
void rom_api_CLOCK_DisableUsbhs0PhyPllClock(void);
void rom_api_CLOCK_InitArmPll(const clock_arm_pll_config_t *config);
void rom_api_CLOCK_DeinitArmPll(void);
void rom_api_CLOCK_InitSysPll(const clock_sys_pll_config_t *config);
void rom_api_CLOCK_DeinitSysPll(void);
void rom_api_CLOCK_InitUsb1Pll(const clock_usb_pll_config_t *config);
void rom_api_CLOCK_DeinitUsb1Pll(void);
void rom_api_CLOCK_InitUsb2Pll(const clock_usb_pll_config_t *config);
void rom_api_CLOCK_DeinitUsb2Pll(void);
void rom_api_CLOCK_InitAudioPll(const clock_audio_pll_config_t *config);
void rom_api_CLOCK_DeinitAudioPll(void);
void rom_api_CLOCK_InitVideoPll(const clock_video_pll_config_t *config);
void rom_api_CLOCK_DeinitVideoPll(void);
void rom_api_CLOCK_InitEnetPll(const clock_enet_pll_config_t *config);
void rom_api_CLOCK_DeinitEnetPll(void);
uint32_t rom_api_CLOCK_GetPllFreq(clock_pll_t pll);
void rom_api_CLOCK_InitSysPfd(clock_pfd_t pfd, uint8_t pfdFrac);
void rom_api_CLOCK_DeinitSysPfd(clock_pfd_t pfd);
void rom_api_CLOCK_InitUsb1Pfd(clock_pfd_t pfd, uint8_t pfdFrac);
void rom_api_CLOCK_DeinitUsb1Pfd(clock_pfd_t pfd);
uint32_t rom_api_CLOCK_GetSysPfdFreq(clock_pfd_t pfd);
uint32_t rom_api_CLOCK_GetUsb1PfdFreq(clock_pfd_t pfd);
_Bool rom_api_CLOCK_EnableUsbhs1PhyPllClock(clock_usb_phy_src_t src, uint32_t freq);
void rom_api_CLOCK_DisableUsbhs1PhyPllClock(void);

void rom_api_RTWDOG_ClearStatusFlags(RTWDOG_Type *base, uint32_t mask);
void rom_api_RTWDOG_GetDefaultConfig(rtwdog_config_t *config);
void rom_api_RTWDOG_Init(RTWDOG_Type *base, const rtwdog_config_t *config);
void rom_api_RTWDOG_Deinit(RTWDOG_Type *base);

void rom_api_WDOG_GetDefaultConfig(wdog_config_t *config);
void rom_api_WDOG_Init(WDOG_Type *base, const wdog_config_t *config);
void rom_api_WDOG_Deinit(WDOG_Type *base);
uint16_t rom_api_WDOG_GetStatusFlags(WDOG_Type *base);
void rom_api_WDOG_ClearInterruptStatus(WDOG_Type *base, uint16_t mask);
void rom_api_WDOG_Refresh(WDOG_Type *base);

status_t rom_api_flexspi_nor_flash_init(uint32_t instance, flexspi_nor_config_t *config);
status_t rom_api_flexspi_nor_flash_page_program(uint32_t instance, flexspi_nor_config_t *config, uint32_t dstAddr, const uint32_t *src);
status_t rom_api_flexspi_nor_flash_erase_all(uint32_t instance, flexspi_nor_config_t *config);
status_t rom_api_flexspi_nor_get_config(uint32_t instance, flexspi_nor_config_t *config, serial_nor_config_option_t *option);
status_t rom_api_flexspi_nor_flash_erase(uint32_t instance, flexspi_nor_config_t *config, uint32_t start, uint32_t length);
status_t rom_api_flexspi_nor_flash_read(uint32_t instance, flexspi_nor_config_t *config, uint32_t *dst, uint32_t start, uint32_t bytes);
status_t rom_api_flexspi_update_lut(uint32_t instance, uint32_t seqIndex, const uint32_t *lutBase, uint32_t numberOfSeq);
status_t rom_api_flexspi_command_xfer(uint32_t instance, flexspi_xfer_t *xfer);
void rom_api_flexspi_clear_cache(uint32_t instance);
# 82 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_flexio_csi.h" 1
# 41 "../../libraries/zf_driver\\zf_driver_flexio_csi.h"
# 1 "../../libraries/sdk/drives\\fsl_edma.h" 1
# 33 "../../libraries/sdk/drives\\fsl_edma.h"
typedef enum _edma_transfer_size
{
    kEDMA_TransferSize1Bytes = 0x0U,
    kEDMA_TransferSize2Bytes = 0x1U,
    kEDMA_TransferSize4Bytes = 0x2U,
    kEDMA_TransferSize8Bytes = 0x3U,
    kEDMA_TransferSize16Bytes = 0x4U,
    kEDMA_TransferSize32Bytes = 0x5U,
} edma_transfer_size_t;


typedef enum _edma_modulo
{
    kEDMA_ModuloDisable = 0x0U,
    kEDMA_Modulo2bytes,
    kEDMA_Modulo4bytes,
    kEDMA_Modulo8bytes,
    kEDMA_Modulo16bytes,
    kEDMA_Modulo32bytes,
    kEDMA_Modulo64bytes,
    kEDMA_Modulo128bytes,
    kEDMA_Modulo256bytes,
    kEDMA_Modulo512bytes,
    kEDMA_Modulo1Kbytes,
    kEDMA_Modulo2Kbytes,
    kEDMA_Modulo4Kbytes,
    kEDMA_Modulo8Kbytes,
    kEDMA_Modulo16Kbytes,
    kEDMA_Modulo32Kbytes,
    kEDMA_Modulo64Kbytes,
    kEDMA_Modulo128Kbytes,
    kEDMA_Modulo256Kbytes,
    kEDMA_Modulo512Kbytes,
    kEDMA_Modulo1Mbytes,
    kEDMA_Modulo2Mbytes,
    kEDMA_Modulo4Mbytes,
    kEDMA_Modulo8Mbytes,
    kEDMA_Modulo16Mbytes,
    kEDMA_Modulo32Mbytes,
    kEDMA_Modulo64Mbytes,
    kEDMA_Modulo128Mbytes,
    kEDMA_Modulo256Mbytes,
    kEDMA_Modulo512Mbytes,
    kEDMA_Modulo1Gbytes,
    kEDMA_Modulo2Gbytes,
} edma_modulo_t;


typedef enum _edma_bandwidth
{
    kEDMA_BandwidthStallNone = 0x0U,
    kEDMA_BandwidthStall4Cycle = 0x2U,
    kEDMA_BandwidthStall8Cycle = 0x3U,
} edma_bandwidth_t;


typedef enum _edma_channel_link_type
{
    kEDMA_LinkNone = 0x0U,
    kEDMA_MinorLink,
    kEDMA_MajorLink,
} edma_channel_link_type_t;


enum
{
    kEDMA_DoneFlag = 0x1U,
    kEDMA_ErrorFlag = 0x2U,
    kEDMA_InterruptFlag = 0x4U,
};


enum
{
    kEDMA_DestinationBusErrorFlag = (0x1U),
    kEDMA_SourceBusErrorFlag = (0x2U),
    kEDMA_ScatterGatherErrorFlag = (0x4U),
    kEDMA_NbytesErrorFlag = (0x8U),
    kEDMA_DestinationOffsetErrorFlag = (0x10U),
    kEDMA_DestinationAddressErrorFlag = (0x20U),
    kEDMA_SourceOffsetErrorFlag = (0x40U),
    kEDMA_SourceAddressErrorFlag = (0x80U),
    kEDMA_ErrorChannelFlag = (0x1F00U),
    kEDMA_ChannelPriorityErrorFlag = (0x4000U),
    kEDMA_TransferCanceledFlag = (0x10000U),



    kEDMA_ValidFlag = (int)(0x80000000U),
};


typedef enum _edma_interrupt_enable
{
    kEDMA_ErrorInterruptEnable = 0x1U,
    kEDMA_MajorInterruptEnable = (0x2U),
    kEDMA_HalfInterruptEnable = (0x4U),
} edma_interrupt_enable_t;


typedef enum _edma_transfer_type
{
    kEDMA_MemoryToMemory = 0x0U,
    kEDMA_PeripheralToMemory,
    kEDMA_MemoryToPeripheral,
    kEDMA_PeripheralToPeripheral,
} edma_transfer_type_t;


enum
{
    kStatus_EDMA_QueueFull = ((((kStatusGroup_EDMA)*100L) + (0))),
    kStatus_EDMA_Busy = ((((kStatusGroup_EDMA)*100L) + (1))),

};


typedef struct _edma_config
{
    _Bool enableContinuousLinkMode;


    _Bool enableHaltOnError;

    _Bool enableRoundRobinArbitration;

    _Bool enableDebugMode;

} edma_config_t;






typedef struct _edma_transfer_config
{
    uint32_t srcAddr;
    uint32_t destAddr;
    edma_transfer_size_t srcTransferSize;
    edma_transfer_size_t destTransferSize;
    int16_t srcOffset;

    int16_t destOffset;

    uint32_t minorLoopBytes;
    uint32_t majorLoopCounts;
} edma_transfer_config_t;


typedef struct _edma_channel_Preemption_config
{
    _Bool enableChannelPreemption;
    _Bool enablePreemptAbility;
    uint8_t channelPriority;
} edma_channel_Preemption_config_t;


typedef struct _edma_minor_offset_config
{
    _Bool enableSrcMinorOffset;
    _Bool enableDestMinorOffset;
    uint32_t minorOffset;
} edma_minor_offset_config_t;







typedef struct _edma_tcd
{
    volatile uint32_t SADDR;
    volatile uint16_t SOFF;
    volatile uint16_t ATTR;
    volatile uint32_t NBYTES;
    volatile uint32_t SLAST;
    volatile uint32_t DADDR;
    volatile uint16_t DOFF;
    volatile uint16_t CITER;
    volatile uint32_t DLAST_SGA;
    volatile uint16_t CSR;
    volatile uint16_t BITER;
} edma_tcd_t;


struct _edma_handle;
# 240 "../../libraries/sdk/drives\\fsl_edma.h"
typedef void (*edma_callback)(struct _edma_handle *handle, void *userData, _Bool transferDone, uint32_t tcds);


typedef struct _edma_handle
{
    edma_callback callback;
    void *userData;
    DMA_Type *base;
    edma_tcd_t *tcdPool;
    uint8_t channel;
    volatile int8_t header;
    volatile int8_t tail;
    volatile int8_t tcdUsed;

    volatile int8_t tcdSize;
    uint8_t flags;
} edma_handle_t;
# 280 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_Init(DMA_Type *base, const edma_config_t *config);
# 289 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_Deinit(DMA_Type *base);
# 298 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_InstallTCD(DMA_Type *base, uint32_t channel, edma_tcd_t *tcd);
# 314 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_GetDefaultConfig(edma_config_t *config);
# 327 "../../libraries/sdk/drives\\fsl_edma.h"
static inline void EDMA_EnableContinuousChannelLinkMode(DMA_Type *base, _Bool enable)
{
    if (enable)
    {
        base->CR |= (0x40U);
    }
    else
    {
        base->CR &= ~(0x40U);
    }
}
# 348 "../../libraries/sdk/drives\\fsl_edma.h"
static inline void EDMA_EnableMinorLoopMapping(DMA_Type *base, _Bool enable)
{
    if (enable)
    {
        base->CR |= (0x80U);
    }
    else
    {
        base->CR &= ~(0x80U);
    }
}
# 377 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_ResetChannel(DMA_Type *base, uint32_t channel);
# 404 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_SetTransferConfig(DMA_Type *base,
                            uint32_t channel,
                            const edma_transfer_config_t *config,
                            edma_tcd_t *nextTcd);
# 419 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_SetMinorOffsetConfig(DMA_Type *base, uint32_t channel, const edma_minor_offset_config_t *config);
# 430 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_SetChannelPreemptionConfig(DMA_Type *base, uint32_t channel, const edma_channel_Preemption_config_t *config);
# 448 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_SetChannelLink(DMA_Type *base, uint32_t channel, edma_channel_link_type_t linkType, uint32_t linkedChannel);
# 464 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_SetBandWidth(DMA_Type *base, uint32_t channel, edma_bandwidth_t bandWidth);
# 478 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_SetModulo(DMA_Type *base, uint32_t channel, edma_modulo_t srcModulo, edma_modulo_t destModulo);
# 488 "../../libraries/sdk/drives\\fsl_edma.h"
static inline void EDMA_EnableAsyncRequest(DMA_Type *base, uint32_t channel, _Bool enable)
{
    ((channel < (uint32_t)(32)) ? (void)0 : __aeabi_assert("channel < (uint32_t)FSL_FEATURE_DMAMUX_MODULE_CHANNEL", "../../libraries/sdk/drives\\fsl_edma.h", 490),
# 490 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic push
# 490 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic ignored "-Wassume"
# 490 "../../libraries/sdk/drives\\fsl_edma.h"
    (__builtin_assume)((channel < (uint32_t)(32))?1:0)
# 490 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic pop
# 490 "../../libraries/sdk/drives\\fsl_edma.h"
    );

    base->EARS &= ~((uint32_t)1U << channel);
    base->EARS |= ((uint32_t)(1 == enable ? 1U : 0U) << channel);
}
# 506 "../../libraries/sdk/drives\\fsl_edma.h"
static inline void EDMA_EnableAutoStopRequest(DMA_Type *base, uint32_t channel, _Bool enable)
{
    ((channel < (uint32_t)(32)) ? (void)0 : __aeabi_assert("channel < (uint32_t)FSL_FEATURE_DMAMUX_MODULE_CHANNEL", "../../libraries/sdk/drives\\fsl_edma.h", 508),
# 508 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic push
# 508 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic ignored "-Wassume"
# 508 "../../libraries/sdk/drives\\fsl_edma.h"
    (__builtin_assume)((channel < (uint32_t)(32))?1:0)
# 508 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic pop
# 508 "../../libraries/sdk/drives\\fsl_edma.h"
    );

    base->TCD[channel].CSR =
        (uint16_t)((base->TCD[channel].CSR & (~(0x8U))) | (((uint16_t)(((uint16_t)((1 == enable ? 1U : 0U))) << (3U))) & (0x8U)));
}
# 522 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_EnableChannelInterrupts(DMA_Type *base, uint32_t channel, uint32_t mask);
# 532 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_DisableChannelInterrupts(DMA_Type *base, uint32_t channel, uint32_t mask);
# 544 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_SetMajorOffsetConfig(DMA_Type *base, uint32_t channel, int32_t sourceOffset, int32_t destOffset);
# 560 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_TcdReset(edma_tcd_t *tcd);
# 589 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_TcdSetTransferConfig(edma_tcd_t *tcd, const edma_transfer_config_t *config, edma_tcd_t *nextTcd);
# 600 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_TcdSetMinorOffsetConfig(edma_tcd_t *tcd, const edma_minor_offset_config_t *config);
# 617 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_TcdSetChannelLink(edma_tcd_t *tcd, edma_channel_link_type_t linkType, uint32_t linkedChannel);
# 631 "../../libraries/sdk/drives\\fsl_edma.h"
static inline void EDMA_TcdSetBandWidth(edma_tcd_t *tcd, edma_bandwidth_t bandWidth)
{
    ((tcd != 0) ? (void)0 : __aeabi_assert("tcd != NULL", "../../libraries/sdk/drives\\fsl_edma.h", 633),
# 633 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic push
# 633 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic ignored "-Wassume"
# 633 "../../libraries/sdk/drives\\fsl_edma.h"
    (__builtin_assume)((tcd != 0)?1:0)
# 633 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic pop
# 633 "../../libraries/sdk/drives\\fsl_edma.h"
    );
    ((((uint32_t)tcd & 0x1FU) == 0U) ? (void)0 : __aeabi_assert("((uint32_t)tcd & 0x1FU) == 0U", "../../libraries/sdk/drives\\fsl_edma.h", 634),
# 634 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic push
# 634 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic ignored "-Wassume"
# 634 "../../libraries/sdk/drives\\fsl_edma.h"
    (__builtin_assume)((((uint32_t)tcd & 0x1FU) == 0U)?1:0)
# 634 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic pop
# 634 "../../libraries/sdk/drives\\fsl_edma.h"
    );

    tcd->CSR = (uint16_t)((tcd->CSR & (~(0xC000U))) | (((uint16_t)(((uint16_t)(bandWidth)) << (14U))) & (0xC000U)));
}
# 650 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_TcdSetModulo(edma_tcd_t *tcd, edma_modulo_t srcModulo, edma_modulo_t destModulo);
# 660 "../../libraries/sdk/drives\\fsl_edma.h"
static inline void EDMA_TcdEnableAutoStopRequest(edma_tcd_t *tcd, _Bool enable)
{
    ((tcd != 0) ? (void)0 : __aeabi_assert("tcd != NULL", "../../libraries/sdk/drives\\fsl_edma.h", 662),
# 662 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic push
# 662 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic ignored "-Wassume"
# 662 "../../libraries/sdk/drives\\fsl_edma.h"
    (__builtin_assume)((tcd != 0)?1:0)
# 662 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic pop
# 662 "../../libraries/sdk/drives\\fsl_edma.h"
    );
    ((((uint32_t)tcd & 0x1FU) == 0U) ? (void)0 : __aeabi_assert("((uint32_t)tcd & 0x1FU) == 0U", "../../libraries/sdk/drives\\fsl_edma.h", 663),
# 663 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic push
# 663 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic ignored "-Wassume"
# 663 "../../libraries/sdk/drives\\fsl_edma.h"
    (__builtin_assume)((((uint32_t)tcd & 0x1FU) == 0U)?1:0)
# 663 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic pop
# 663 "../../libraries/sdk/drives\\fsl_edma.h"
    );

    tcd->CSR = (uint16_t)((tcd->CSR & (~(0x8U))) | (((uint16_t)(((uint16_t)((1 == enable ? 1U : 0U))) << (3U))) & (0x8U)));
}
# 675 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_TcdEnableInterrupts(edma_tcd_t *tcd, uint32_t mask);
# 684 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_TcdDisableInterrupts(edma_tcd_t *tcd, uint32_t mask);
# 695 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_TcdSetMajorOffsetConfig(edma_tcd_t *tcd, int32_t sourceOffset, int32_t destOffset);
# 711 "../../libraries/sdk/drives\\fsl_edma.h"
static inline void EDMA_EnableChannelRequest(DMA_Type *base, uint32_t channel)
{
    ((channel < (uint32_t)(32)) ? (void)0 : __aeabi_assert("channel < (uint32_t)FSL_FEATURE_DMAMUX_MODULE_CHANNEL", "../../libraries/sdk/drives\\fsl_edma.h", 713),
# 713 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic push
# 713 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic ignored "-Wassume"
# 713 "../../libraries/sdk/drives\\fsl_edma.h"
    (__builtin_assume)((channel < (uint32_t)(32))?1:0)
# 713 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic pop
# 713 "../../libraries/sdk/drives\\fsl_edma.h"
    );

    base->SERQ = (((uint8_t)(((uint8_t)(channel)) << (0U))) & (0x1FU));
}
# 726 "../../libraries/sdk/drives\\fsl_edma.h"
static inline void EDMA_DisableChannelRequest(DMA_Type *base, uint32_t channel)
{
    ((channel < (uint32_t)(32)) ? (void)0 : __aeabi_assert("channel < (uint32_t)FSL_FEATURE_DMAMUX_MODULE_CHANNEL", "../../libraries/sdk/drives\\fsl_edma.h", 728),
# 728 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic push
# 728 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic ignored "-Wassume"
# 728 "../../libraries/sdk/drives\\fsl_edma.h"
    (__builtin_assume)((channel < (uint32_t)(32))?1:0)
# 728 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic pop
# 728 "../../libraries/sdk/drives\\fsl_edma.h"
    );

    base->CERQ = (((uint8_t)(((uint8_t)(channel)) << (0U))) & (0x1FU));
}
# 741 "../../libraries/sdk/drives\\fsl_edma.h"
static inline void EDMA_TriggerChannelStart(DMA_Type *base, uint32_t channel)
{
    ((channel < (uint32_t)(32)) ? (void)0 : __aeabi_assert("channel < (uint32_t)FSL_FEATURE_DMAMUX_MODULE_CHANNEL", "../../libraries/sdk/drives\\fsl_edma.h", 743),
# 743 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic push
# 743 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic ignored "-Wassume"
# 743 "../../libraries/sdk/drives\\fsl_edma.h"
    (__builtin_assume)((channel < (uint32_t)(32))?1:0)
# 743 "../../libraries/sdk/drives\\fsl_edma.h"
#pragma clang diagnostic pop
# 743 "../../libraries/sdk/drives\\fsl_edma.h"
    );

    base->SSRT = (((uint8_t)(((uint8_t)(channel)) << (0U))) & (0x1FU));
}
# 775 "../../libraries/sdk/drives\\fsl_edma.h"
uint32_t EDMA_GetRemainingMajorLoopCount(DMA_Type *base, uint32_t channel);
# 784 "../../libraries/sdk/drives\\fsl_edma.h"
static inline uint32_t EDMA_GetErrorStatusFlags(DMA_Type *base)
{
    return base->ES;
}
# 797 "../../libraries/sdk/drives\\fsl_edma.h"
uint32_t EDMA_GetChannelStatusFlags(DMA_Type *base, uint32_t channel);
# 807 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_ClearChannelStatusFlags(DMA_Type *base, uint32_t channel, uint32_t mask);
# 825 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_CreateHandle(edma_handle_t *handle, DMA_Type *base, uint32_t channel);
# 839 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_InstallTCDMemory(edma_handle_t *handle, edma_tcd_t *tcdPool, uint32_t tcdSize);
# 851 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_SetCallback(edma_handle_t *handle, edma_callback callback, void *userData);
# 871 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_PrepareTransferConfig(edma_transfer_config_t *config,
                                void *srcAddr,
                                uint32_t srcWidth,
                                int16_t srcOffset,
                                void *destAddr,
                                uint32_t destWidth,
                                int16_t destOffset,
                                uint32_t bytesEachRequest,
                                uint32_t transferBytes);
# 898 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_PrepareTransfer(edma_transfer_config_t *config,
                          void *srcAddr,
                          uint32_t srcWidth,
                          void *destAddr,
                          uint32_t destWidth,
                          uint32_t bytesEachRequest,
                          uint32_t transferBytes,
                          edma_transfer_type_t transferType);
# 920 "../../libraries/sdk/drives\\fsl_edma.h"
status_t EDMA_SubmitTransfer(edma_handle_t *handle, const edma_transfer_config_t *config);
# 930 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_StartTransfer(edma_handle_t *handle);
# 940 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_StopTransfer(edma_handle_t *handle);
# 950 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_AbortTransfer(edma_handle_t *handle);
# 960 "../../libraries/sdk/drives\\fsl_edma.h"
static inline uint32_t EDMA_GetUnusedTCDNumber(edma_handle_t *handle)
{
    int8_t tmpTcdSize = handle->tcdSize;
    int8_t tmpTcdUsed = handle->tcdUsed;
    return ((uint32_t)tmpTcdSize - (uint32_t)tmpTcdUsed);
}
# 975 "../../libraries/sdk/drives\\fsl_edma.h"
static inline uint32_t EDMA_GetNextTCDAddress(edma_handle_t *handle)
{
    return (uint32_t)(handle->base->TCD[handle->channel].DLAST_SGA);
}
# 1008 "../../libraries/sdk/drives\\fsl_edma.h"
void EDMA_HandleIRQ(edma_handle_t *handle);
# 42 "../../libraries/zf_driver\\zf_driver_flexio_csi.h" 2



typedef enum
{
    FLEXIO2_D00_C0,
    FLEXIO2_D01_C1,
    FLEXIO2_D02_C2,
    FLEXIO2_D03_C3,
    FLEXIO2_D04_C4,
    FLEXIO2_D05_C5,
    FLEXIO2_D06_C6,
    FLEXIO2_D07_C7,
    FLEXIO2_D08_C8,
    FLEXIO2_D09_C9,
    FLEXIO2_D10_C10,
    FLEXIO2_D11_C11,
    FLEXIO2_D12_C12,
    FLEXIO2_D13_C13,
    FLEXIO2_D14_C14,
    FLEXIO2_D15_C15,
    FLEXIO2_D16_C16,
    FLEXIO2_D17_C17,
    FLEXIO2_D18_C18,
    FLEXIO2_D19_C19,
    FLEXIO2_D20_C20,
    FLEXIO2_D21_C21,
    FLEXIO2_D22_C22,
    FLEXIO2_D23_C23,
    FLEXIO2_D24_C24,
    FLEXIO2_D25_C25,
    FLEXIO2_D26_C26,
    FLEXIO2_D27_C27,
    FLEXIO2_D28_C28,
    FLEXIO2_D29_C29,
    FLEXIO2_D30_C30,
    FLEXIO2_D31_C31,
}flexio_pin_enum;






void flexio_csi_enable(uint8 enable);
void flexio_csi_flag_clear(void);
void flexio_csi_dma_restart(uint8 *dest_addr);
void flexio_csi_enable_rxdma(void);
void flexio_csi_init(flexio_pin_enum dat_pin_start, flexio_pin_enum pclk_pin, flexio_pin_enum href_pin, uint16 width, uint16 height, uint8 *dest_addr, edma_callback callback);
# 83 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_driver\\zf_driver_usb_cdc.h" 1
# 42 "../../libraries/zf_driver\\zf_driver_usb_cdc.h"
uint8 usb_cdc_check_busy(void);
void usb_cdc_write_byte(uint8 dat);
void usb_cdc_write_string(const char *str);
void usb_cdc_write_buffer(uint8 *p, uint32 length);
void usb_cdc_init(void);
# 84 "../../libraries/zf_common\\zf_common_headfile.h" 2



# 1 "../../libraries/zf_device\\zf_device_absolute_encoder.h" 1
# 87 "../../libraries/zf_device\\zf_device_absolute_encoder.h"
int16 absolute_encoder_get_location (void);
int16 absolute_encoder_get_offset (void);
uint8 absolute_encoder_init (void);
# 88 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_bluetooth_ch9141.h" 1
# 61 "../../libraries/zf_device\\zf_device_bluetooth_ch9141.h"
uint32 bluetooth_ch9141_send_byte (const uint8 data);
uint32 bluetooth_ch9141_send_buffer (const uint8 *buff, uint32 len);
uint32 bluetooth_ch9141_send_string (const char *str);
void bluetooth_ch9141_send_image (const uint8 *image_addr, uint32 image_size);

uint32 bluetooth_ch9141_read_buffer (uint8 *buff, uint32 len);

void bluetooth_ch9141_uart_callback (void);

uint8 bluetooth_ch9141_init (void);
# 89 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_camera.h" 1
# 43 "../../libraries/zf_device\\zf_device_camera.h"
extern fifo_struct camera_receiver_fifo;
extern uint8 camera_receiver_buffer[8];

extern uint8 camera_send_image_frame_header[4];

void camera_binary_image_decompression (const uint8 *data1, uint8 *data2, uint32 image_size);
void camera_send_image (uart_index_enum uartn, const uint8 *image_addr, uint32 image_size);

void camera_fifo_init (void);
void camera_init (const uint32 image_size, uint32 data_addr, uint32 buffer_addr);
# 90 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_gnss.h" 1
# 62 "../../libraries/zf_device\\zf_device_gnss.h"
typedef enum
{
    TAU1201 = 1,
    GN42A = 1,
    GN43RFA = 2,
}gps_device_enum;

typedef struct
{
    uint16 year;
    uint8 month;
    uint8 day;
    uint8 hour;
    uint8 minute;
    uint8 second;
}gps_time_struct;

typedef struct
{
    gps_time_struct time;

    uint8 state;

    uint16 latitude_degree;
    uint16 latitude_cent;
    uint16 latitude_second;
    uint16 longitude_degree;
    uint16 longitude_cent;
    uint16 longitude_second;

    double latitude;
    double longitude;

    int8 ns;
    int8 ew;

    float speed;
    float direction;
    uint8 antenna_direction_state;
    float antenna_direction;


    uint8 satellite_used;
    float height;
}gnss_info_struct;

typedef enum
{
    GPS_STATE_RECEIVING,
    GPS_STATE_RECEIVED,
    GPS_STATE_PARSING,
}gps_state_enum;

extern gnss_info_struct gnss;
extern uint8 gnss_flag;


double get_two_points_distance (double lat1, double lng1, double lat2, double lng2);
double get_two_points_azimuth (double lat1, double lon1, double lat2, double lon2);
uint8 gnss_data_parse (void);
void gnss_uart_callback (void);
void gnss_init (gps_device_enum gps_device);
# 91 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_icm20602.h" 1
# 81 "../../libraries/zf_device\\zf_device_icm20602.h"
typedef enum
{
    ICM20602_ACC_SAMPLE_SGN_2G ,
    ICM20602_ACC_SAMPLE_SGN_4G ,
    ICM20602_ACC_SAMPLE_SGN_8G ,
    ICM20602_ACC_SAMPLE_SGN_16G,
}icm20602_acc_sample_config;

typedef enum
{
    ICM20602_GYRO_SAMPLE_SGN_250DPS ,
    ICM20602_GYRO_SAMPLE_SGN_500DPS ,
    ICM20602_GYRO_SAMPLE_SGN_1000DPS,
    ICM20602_GYRO_SAMPLE_SGN_2000DPS,
}icm20602_gyro_sample_config;
# 174 "../../libraries/zf_device\\zf_device_icm20602.h"
extern int16 icm20602_gyro_x, icm20602_gyro_y, icm20602_gyro_z;
extern int16 icm20602_acc_x, icm20602_acc_y, icm20602_acc_z;
extern float icm20602_transition_factor[2];

void icm20602_get_acc (void);
void icm20602_get_gyro (void);
# 199 "../../libraries/zf_device\\zf_device_icm20602.h"
uint8 icm20602_init (void);
# 92 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_imu963ra.h" 1
# 81 "../../libraries/zf_device\\zf_device_imu963ra.h"
typedef enum
{
    IMU963RA_ACC_SAMPLE_SGN_2G ,
    IMU963RA_ACC_SAMPLE_SGN_4G ,
    IMU963RA_ACC_SAMPLE_SGN_8G ,
    IMU963RA_ACC_SAMPLE_SGN_16G,
}imu963ra_acc_sample_config;

typedef enum
{
    IMU963RA_GYRO_SAMPLE_SGN_125DPS ,
    IMU963RA_GYRO_SAMPLE_SGN_250DPS ,
    IMU963RA_GYRO_SAMPLE_SGN_500DPS ,
    IMU963RA_GYRO_SAMPLE_SGN_1000DPS,
    IMU963RA_GYRO_SAMPLE_SGN_2000DPS,
    IMU963RA_GYRO_SAMPLE_SGN_4000DPS,
}imu963ra_gyro_sample_config;

typedef enum
{
    IMU963RA_MAG_SAMPLE_2G,
    IMU963RA_MAG_SAMPLE_8G,
}imu963ra_mag_sample_config;
# 241 "../../libraries/zf_device\\zf_device_imu963ra.h"
extern int16 imu963ra_acc_x, imu963ra_acc_y, imu963ra_acc_z;
extern int16 imu963ra_gyro_x, imu963ra_gyro_y, imu963ra_gyro_z;
extern int16 imu963ra_mag_x, imu963ra_mag_y, imu963ra_mag_z;
extern float imu963ra_transition_factor[3];

void imu963ra_get_acc (void);
void imu963ra_get_gyro (void);
void imu963ra_get_mag (void);
# 277 "../../libraries/zf_device\\zf_device_imu963ra.h"
uint8 imu963ra_init (void);
# 93 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_ips114.h" 1
# 87 "../../libraries/zf_device\\zf_device_ips114.h"
typedef enum
{
    IPS114_PORTAIT = 0,
    IPS114_PORTAIT_180 = 1,
    IPS114_CROSSWISE = 2,
    IPS114_CROSSWISE_180 = 3,
}ips114_dir_enum;

typedef enum
{
    IPS114_6X8_FONT = 0,
    IPS114_8X16_FONT = 1,
    IPS114_16X16_FONT = 2,
}ips114_font_size_enum;

void ips114_clear (void);
void ips114_full (const uint16 color);
void ips114_set_dir (ips114_dir_enum dir);
void ips114_set_font (ips114_font_size_enum font);
void ips114_set_color (const uint16 pen, const uint16 bgcolor);
void ips114_draw_point (uint16 x, uint16 y, const uint16 color);
void ips114_draw_line (uint16 x_start, uint16 y_start, uint16 x_end, uint16 y_end, const uint16 color);

void ips114_show_char (uint16 x, uint16 y, const char dat);
void ips114_show_string (uint16 x, uint16 y, const char dat[]);
void ips114_show_int (uint16 x,uint16 y, const int32 dat, uint8 num);
void ips114_show_uint (uint16 x,uint16 y, const uint32 dat, uint8 num);
void ips114_show_float (uint16 x,uint16 y, const double dat, uint8 num, uint8 pointnum);

void ips114_show_binary_image (uint16 x, uint16 y, const uint8 *image, uint16 width, uint16 height, uint16 dis_width, uint16 dis_height);
void ips114_show_gray_image (uint16 x, uint16 y, const uint8 *image, uint16 width, uint16 height, uint16 dis_width, uint16 dis_height, uint8 threshold);
void ips114_show_rgb565_image (uint16 x, uint16 y, const uint16 *image, uint16 width, uint16 height, uint16 dis_width, uint16 dis_height, uint8 color_mode);

void ips114_show_wave (uint16 x, uint16 y, const uint16 *wave, uint16 width, uint16 value_max, uint16 dis_width, uint16 dis_value_max);
void ips114_show_chinese (uint16 x, uint16 y, uint8 size, const uint8 *chinese_buffer, uint8 number, const uint16 color);
# 156 "../../libraries/zf_device\\zf_device_ips114.h"
void ips114_init (void);
# 94 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_ips200.h" 1
# 128 "../../libraries/zf_device\\zf_device_ips200.h"
typedef enum
{
    IPS200_TYPE_SPI,
    IPS200_TYPE_PARALLEL8,
}ips200_type_enum;

typedef enum
{
    IPS200_PORTAIT = 0,
    IPS200_PORTAIT_180 = 1,
    IPS200_CROSSWISE = 2,
    IPS200_CROSSWISE_180 = 3,
}ips200_dir_enum;

typedef enum
{
    IPS200_6X8_FONT = 0,
    IPS200_8X16_FONT = 1,
    IPS200_16X16_FONT = 2,
}ips200_font_size_enum;


extern gpio_pin_enum ips_cs_pin;


void ips200_clear (void);
void ips200_full (const uint16 color);
void ips200_set_dir (ips200_dir_enum dir);
void ips200_set_font (ips200_font_size_enum font);
void ips200_set_color (const uint16 pen, const uint16 bgcolor);
void ips200_draw_point (uint16 x, uint16 y, const uint16 color);
void ips200_draw_line (uint16 x_start, uint16 y_start, uint16 x_end, uint16 y_end, const uint16 color);

void ips200_show_char (uint16 x, uint16 y, const char dat);
void ips200_show_string (uint16 x, uint16 y, const char dat[]);
void ips200_show_int (uint16 x, uint16 y, const int32 dat, uint8 num);
void ips200_show_uint (uint16 x, uint16 y, const uint32 dat, uint8 num);
void ips200_show_float (uint16 x, uint16 y, const double dat, uint8 num, uint8 pointnum);

void ips200_show_binary_image (uint16 x, uint16 y, const uint8 *image, uint16 width, uint16 height, uint16 dis_width, uint16 dis_height);
void ips200_show_gray_image (uint16 x, uint16 y, const uint8 *image, uint16 width, uint16 height, uint16 dis_width, uint16 dis_height, uint8 threshold);
void ips200_show_rgb565_image (uint16 x, uint16 y, const uint16 *image, uint16 width, uint16 height, uint16 dis_width, uint16 dis_height, uint8 color_mode);

void ips200_show_wave (uint16 x, uint16 y, const uint16 *wave, uint16 width, uint16 value_max, uint16 dis_width, uint16 dis_value_max);
void ips200_show_chinese (uint16 x, uint16 y, uint8 size, const uint8 *chinese_buffer, uint8 number, const uint16 color);
# 207 "../../libraries/zf_device\\zf_device_ips200.h"
void ips200_init (ips200_type_enum type_select);
# 95 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_key.h" 1
# 63 "../../libraries/zf_device\\zf_device_key.h"
typedef enum
{
    KEY_1,
    KEY_2,
    KEY_3,
    KEY_4,
    KEY_NUMBER,
}key_index_enum;

typedef enum
{
    KEY_RELEASE,
    KEY_SHORT_PRESS,
    KEY_LONG_PRESS,
}key_state_enum;

void key_scanner (void);
key_state_enum key_get_state (key_index_enum key_n);
void key_clear_state (key_index_enum key_n);
void key_clear_all_state (void);
void key_init (uint32 period);
# 96 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_mpu6050.h" 1
# 116 "../../libraries/zf_device\\zf_device_mpu6050.h"
extern int16 mpu6050_gyro_x, mpu6050_gyro_y, mpu6050_gyro_z;
extern int16 mpu6050_acc_x, mpu6050_acc_y, mpu6050_acc_z;

void mpu6050_get_acc (void);
void mpu6050_get_gyro (void);
float mpu6050_acc_transition (int16 acc_value);
float mpu6050_gyro_transition (int16 gyro_value);
uint8 mpu6050_init (void);
# 97 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_oled.h" 1
# 82 "../../libraries/zf_device\\zf_device_oled.h"
typedef enum
{
    OLED_PORTAIT = 0,
    OLED_PORTAIT_180 = 1,
}oled_dir_enum;

typedef enum
{
    OLED_6X8_FONT = 0,
    OLED_8X16_FONT = 1,
    OLED_16X16_FONT = 2,
}oled_font_size_enum;




void oled_clear (void);
void oled_full (const uint8 color);
void oled_set_dir (oled_dir_enum dir);
void oled_set_font (oled_font_size_enum font);
void oled_draw_point (uint16 x, uint16 y, const uint8 color);

void oled_show_string (uint16 x, uint16 y, const char ch[]);
void oled_show_int (uint16 x, uint16 y, const int32 dat, uint8 num);
void oled_show_uint (uint16 x, uint16 y, const uint32 dat, uint8 num);
void oled_show_float (uint16 x, uint16 y, const double dat, uint8 num, uint8 pointnum);

void oled_show_binary_image (uint16 x, uint16 y, const uint8 *image, uint16 width, uint16 height, uint16 dis_width, uint16 dis_height);
void oled_show_gray_image (uint16 x, uint16 y, const uint8 *image, uint16 width, uint16 height, uint16 dis_width, uint16 dis_height, uint8 threshold);

void oled_show_wave (uint16 x, uint16 y, const uint16 *image, uint16 width, uint16 value_max, uint16 dis_width, uint16 dis_value_max);
void oled_show_chinese (uint16 x, uint16 y, uint8 size, const uint8 *chinese_buffer, uint8 number);
# 134 "../../libraries/zf_device\\zf_device_oled.h"
void oled_init (void);
# 98 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_mt9v03x.h" 1
# 96 "../../libraries/zf_device\\zf_device_mt9v03x.h"
typedef enum
{
    MT9V03X_INIT = 0,
    MT9V03X_AUTO_EXP,
    MT9V03X_EXP_TIME,
    MT9V03X_FPS,
    MT9V03X_SET_COL,
    MT9V03X_SET_ROW,
    MT9V03X_LR_OFFSET,
    MT9V03X_UD_OFFSET,
    MT9V03X_GAIN,
    MT9V03X_PCLK_MODE,
    MT9V03X_CONFIG_FINISH,

    MT9V03X_COLOR_GET_WHO_AM_I = 0xEF,
    MT9V03X_SET_EXP_TIME = 0XF0,
    MT9V03X_GET_STATUS,
    MT9V03X_GET_VERSION,

    MT9V03X_SET_ADDR = 0XFE,
    MT9V03X_SET_DATA
}m9v03x_cmd_enum;



typedef enum
{
    MT9V03X_UART,
    MT9V03X_SCCB,
}m9v03x_type_enum;

extern vuint8 mt9v03x_finish_flag;
extern uint8 (*mt9v03x_image)[(160)];

uint16 mt9v03x_get_version (void);
uint8 mt9v03x_set_exposure_time (uint16 light);
uint8 mt9v03x_set_reg (uint8 addr, uint16 data);

uint8 mt9v03x_init (void);
# 99 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_mt9v03x_flexio.h" 1
# 102 "../../libraries/zf_device\\zf_device_mt9v03x_flexio.h"
typedef enum
{
    MT9V03X_FLEXIO_INIT = 0,
    MT9V03X_FLEXIO_AUTO_EXP,
    MT9V03X_FLEXIO_EXP_TIME,
    MT9V03X_FLEXIO_FPS,
    MT9V03X_FLEXIO_SET_COL,
    MT9V03X_FLEXIO_SET_ROW,
    MT9V03X_FLEXIO_LR_OFFSET,
    MT9V03X_FLEXIO_UD_OFFSET,
    MT9V03X_FLEXIO_GAIN,
    MT9V03X_FLEXIO_PCLK_MODE,
    MT9V03X_FLEXIO_CONFIG_FINISH,

    MT9V03X_FLEXIO_COLOR_GET_WHO_AM_I = 0xEF,
    MT9V03X_FLEXIO_SET_EXP_TIME = 0XF0,
    MT9V03X_FLEXIO_GET_STATUS,
    MT9V03X_FLEXIO_GET_VERSION,

    MT9V03X_FLEXIO_SET_ADDR = 0XFE,
    MT9V03X_FLEXIO_SET_DATA
}m9v03x_flexio_cmd_enum;


typedef enum
{
    MT9V03X_FLEXIO_UART,
    MT9V03X_FLEXIO_SCCB,
}m9v03x_flexio_type_enum;

extern vuint8 mt9v03x_flexio_finish_flag;
extern uint8 mt9v03x_flexio_image[(120)][(188)];

uint16 mt9v03x_flexio_get_version (void);
uint8 mt9v03x_flexio_set_exposure_time (uint16 light);
uint8 mt9v03x_flexio_set_reg (uint8 addr, uint16 data);




uint8 mt9v03x_flexio_init (void);
# 100 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_ov7725.h" 1
# 241 "../../libraries/zf_device\\zf_device_ov7725.h"
typedef enum
{
    OV7725_INIT = 0x00,
    OV7725_RESERVE,
    OV7725_CONTRAST,
    OV7725_FPS,
    OV7725_COL,
    OV7725_ROW,
    OV7725_CONFIG_FINISH,

    OV7725_GET_WHO_AM_I = 0xEF,
    OV7725_GET_STATUS = 0xF1,
    OV7725_GET_VERSION = 0xF2,

    OV7725_SET_ADDR = 0xFE,
    OV7725_SET_DATA = 0xFF,
}ov7725_cmd_enum;

extern vuint8 ov7725_finish_flag;
extern uint8 (*ov7725_image_binary)[(160) / 8];

uint16 ov7725_uart_get_id (void);
uint16 ov7725_get_version (void);
uint8 ov7725_init (void);
# 101 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_scc8660.h" 1
# 94 "../../libraries/zf_device\\zf_device_scc8660.h"
typedef enum
{
    SCC8660_INIT = 0x00,
    SCC8660_AUTO_EXP,
    SCC8660_BRIGHT,
    SCC8660_FPS,
    SCC8660_SET_COL,
    SCC8660_SET_ROW,
    SCC8660_PCLK_DIV,
    SCC8660_PCLK_MODE,
    SCC8660_COLOR_MODE,
    SCC8660_DATA_FORMAT,
    SCC8660_MANUAL_WB,
    SCC8660_CONFIG_FINISH,

    SCC8660_GET_WHO_AM_I = 0xEF,
    SCC8660_SET_BRIGHT = 0xF0,
    SCC8660_GET_STATUS = 0XF1,
    SCC8660_GET_VERSION = 0xF2,
    SCC8660_SET_MANUAL_WB = 0xF3,

    SCC8660_SET_REG_ADDR = 0xFE,
    SCC8660_SET_REG_DATA = 0xFF,
}scc8660_cmd_enum;


typedef enum
{
    SCC8660_UART,
    SCC8660_SCCB,
}scc8660_type_enum;

extern vuint8 scc8660_finish_flag;
extern uint16 (*scc8660_image)[(160)];


uint16 scc8660_get_id (void);
uint16 scc8660_get_parameter (uint16 config);
uint16 scc8660_get_version (void);
uint8 scc8660_set_brightness (uint16 data);
uint8 scc8660_set_white_balance (uint16 data);
uint8 scc8660_set_reg (uint8 addr, uint16 data);

uint8 scc8660_init (void);
# 102 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_scc8660_flexio.h" 1
# 100 "../../libraries/zf_device\\zf_device_scc8660_flexio.h"
typedef enum
{
    SCC8660_FLEXIO_INIT = 0x00,
    SCC8660_FLEXIO_AUTO_EXP,
    SCC8660_FLEXIO_BRIGHT,
    SCC8660_FLEXIO_FPS,
    SCC8660_FLEXIO_SET_COL,
    SCC8660_FLEXIO_SET_ROW,
    SCC8660_FLEXIO_PCLK_DIV,
    SCC8660_FLEXIO_PCLK_MODE,
    SCC8660_FLEXIO_COLOR_MODE,
    SCC8660_FLEXIO_DATA_FORMAT,
    SCC8660_FLEXIO_MANUAL_WB,
    SCC8660_FLEXIO_CONFIG_FINISH,

    SCC8660_FLEXIO_GET_WHO_AM_I = 0xEF,
    SCC8660_FLEXIO_SET_BRIGHT = 0xF0,
    SCC8660_FLEXIO_GET_STATUS = 0XF1,
    SCC8660_FLEXIO_GET_VERSION = 0xF2,
    SCC8660_FLEXIO_SET_MANUAL_WB = 0xF3,

    SCC8660_FLEXIO_SET_REG_ADDR = 0xFE,
    SCC8660_FLEXIO_SET_REG_DATA = 0xFF,
}scc8660_flexio_cmd_enum;


typedef enum
{
    SCC8660_FLEXIO_UART,
    SCC8660_FLEXIO_SCCB,
}scc8660_flexio_type_enum;

extern vuint8 scc8660_flexio_finish_flag;
extern uint16 scc8660_flexio_image[(120)][(160)];


uint16 scc8660_flexio_get_id (void);
uint16 scc8660_flexio_get_parameter (uint16 config);
uint16 scc8660_flexio_get_version (void);
uint8 scc8660_flexio_set_brightness (uint16 data);
uint8 scc8660_flexio_set_white_balance (uint16 data);
uint8 scc8660_flexio_set_reg (uint8 addr, uint16 data);




uint8 scc8660_flexio_init (void);
# 103 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_tft180.h" 1
# 87 "../../libraries/zf_device\\zf_device_tft180.h"
typedef enum
{
    TFT180_PORTAIT = 0,
    TFT180_PORTAIT_180 = 1,
    TFT180_CROSSWISE = 2,
    TFT180_CROSSWISE_180 = 3,
}tft180_dir_enum;

typedef enum
{
    TFT180_6X8_FONT = 0,
    TFT180_8X16_FONT = 1,
    TFT180_16X16_FONT = 2,
}tft180_font_size_enum;

void tft180_clear (void);
void tft180_full (const uint16 color);
void tft180_set_dir (tft180_dir_enum dir);
void tft180_set_font (tft180_font_size_enum font);
void tft180_set_color (const uint16 pen, const uint16 bgcolor);
void tft180_draw_point (uint16 x, uint16 y, const uint16 color);
void tft180_draw_line (uint16 x_start, uint16 y_start, uint16 x_end, uint16 y_end, const uint16 color);

void tft180_show_char (uint16 x, uint16 y, const char dat);
void tft180_show_string (uint16 x, uint16 y, const char dat[]);
void tft180_show_int (uint16 x, uint16 y, const int32 dat, uint8 num);
void tft180_show_uint (uint16 x, uint16 y, const uint32 dat, uint8 num);
void tft180_show_float (uint16 x, uint16 y, const double dat, uint8 num, uint8 pointnum);

void tft180_show_binary_image (uint16 x, uint16 y, const uint8 *image, uint16 width, uint16 height, uint16 dis_width, uint16 dis_height);
void tft180_show_gray_image (uint16 x, uint16 y, const uint8 *image, uint16 width, uint16 height, uint16 dis_width, uint16 dis_height, uint8 threshold);
void tft180_show_rgb565_image (uint16 x, uint16 y, const uint16 *image, uint16 width, uint16 height, uint16 dis_width, uint16 dis_height, uint8 color_mode);

void tft180_show_wave (uint16 x, uint16 y, const uint16 *wave, uint16 width, uint16 value_max, uint16 dis_width, uint16 dis_value_max);
void tft180_show_chinese (uint16 x, uint16 y, uint8 size, const uint8 *chinese_buffer, uint8 number, const uint16 color);
# 156 "../../libraries/zf_device\\zf_device_tft180.h"
void tft180_init (void);
# 104 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_tsl1401.h" 1
# 68 "../../libraries/zf_device\\zf_device_tsl1401.h"
extern uint16 tsl1401_data[2][(128 )];
extern uint8 tsl1401_finish_flag;

void tsl1401_collect_pit_handler (void);
void tsl1401_send_data (uart_index_enum uart_n, uint8 index);
void tsl1401_init (void);
# 105 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_type.h" 1
# 41 "../../libraries/zf_device\\zf_device_type.h"
typedef enum
{
    NO_CAMERE = 0,
    CAMERA_BIN_IIC,
    CAMERA_BIN_UART,
    CAMERA_GRAYSCALE,
    CAMERA_COLOR,
}camera_type_enum;

typedef enum
{
    NO_WIRELESS = 0,
    WIRELESS_UART,
    BLUETOOTH_CH9141,
    WIFI_UART,
    WIFI_SPI,
    BLE6A20,
}wireless_type_enum;

typedef enum
{
    NO_TOF = 0,
    TOF_DL1A,
    TOF_DL1B,
}tof_type_enum;

typedef void (*callback_function) (void);

extern camera_type_enum camera_type;
extern callback_function camera_uart_handler;

extern tof_type_enum tof_type;

extern camera_type_enum flexio_camera_type;
extern callback_function flexio_camera_vsync_handler;
extern callback_function flexio_camera_uart_handler;

extern wireless_type_enum wireless_type;
extern callback_function wireless_module_uart_handler;
extern callback_function wireless_module_spi_handler;

extern callback_function tof_module_exti_handler;

void type_default_callback (void);
void set_camera_type (camera_type_enum type_set, callback_function vsync_callback, callback_function dma_callback, callback_function uart_callback);
void set_flexio_camera_type (camera_type_enum type_set, callback_function vsync_callback, callback_function dma_callback, callback_function uart_callback);
void set_wireless_type (wireless_type_enum type_set, callback_function wireless_callback);

void set_tof_type (tof_type_enum type_set, callback_function exti_callback);
# 106 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_virtual_oscilloscope.h" 1
# 41 "../../libraries/zf_device\\zf_device_virtual_oscilloscope.h"
extern uint8 virtual_oscilloscope_data[10];

void virtual_oscilloscope_data_conversion (const int16 data1, const int16 data2, const int16 data3, const int16 data4);
# 107 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_wifi_uart.h" 1
# 76 "../../libraries/zf_device\\zf_device_wifi_uart.h"
typedef enum
{
    WIFI_UART_STATION,
    WIFI_UART_SOFTAP,
}wifi_uart_mode_enum;

typedef enum
{
    WIFI_UART_COMMAND,
    WIFI_UART_SERIANET,
}wifi_uart_transfer_mode_enum;

typedef enum
{
    WIFI_UART_TCP_CLIENT,
    WIFI_UART_TCP_SERVER,
    WIFI_UART_UDP_CLIENT,
}wifi_uart_connect_mode_enum;

typedef enum
{
    WIFI_UART_SERVER_OFF,
    WIFI_UART_SERVER_ON,
}wifi_uart_connect_state_enum;

typedef enum
{
    WIFI_UART_LINK_0,
    WIFI_UART_LINK_1,
    WIFI_UART_LINK_2,
    WIFI_UART_LINK_3,
    WIFI_UART_LINK_4,
}wifi_uart_link_id_enum;

typedef struct
{
    uint8 wifi_uart_version[12];
    uint8 wifi_uart_mac[20];
    uint8 wifi_uart_local_ip[17];
    uint8 wifi_uart_local_port[10];
    uint8 wifi_uart_remote_ip[5][17];
    wifi_uart_mode_enum wifi_uart_mode;
    wifi_uart_transfer_mode_enum wifi_uart_transfer_mode;
    wifi_uart_connect_mode_enum wifi_uart_connect_mode;
    wifi_uart_connect_state_enum wifi_uart_connect_state;
}wifi_uart_information_struct;

extern wifi_uart_information_struct wifi_uart_information;


uint8 wifi_uart_disconnected_wifi (void);
uint8 wifi_uart_entry_serianet (void);
uint8 wifi_uart_exit_serianet (void);

uint8 wifi_uart_connect_tcp_servers (char *ip, char *port, wifi_uart_transfer_mode_enum mode);
uint8 wifi_uart_connect_udp_client (char *ip, char *port, char *local_port, wifi_uart_transfer_mode_enum mode);
uint8 wifi_uart_disconnect_link (void);
uint8 wifi_uart_disconnect_link_with_id (wifi_uart_link_id_enum link_id);

uint8 wifi_uart_entry_tcp_servers (char *port);
uint8 wifi_uart_exit_tcp_servers (void);
uint8 wifi_uart_tcp_servers_check_link (void);

uint32 wifi_uart_send_buffer (const uint8 *buff, uint32 len);
uint32 wifi_uart_tcp_servers_send_buffer (const uint8 *buff, uint32 len, wifi_uart_link_id_enum id);
uint32 wifi_uart_read_buffer (uint8 *buff, uint32 len);

void wifi_uart_callback (void);
uint8 wifi_uart_init (char *wifi_ssid, char *pass_word, wifi_uart_mode_enum wifi_mode);
# 108 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_wireless_uart.h" 1
# 87 "../../libraries/zf_device\\zf_device_wireless_uart.h"
uint32 wireless_uart_send_byte (const uint8 data);
uint32 wireless_uart_send_buffer (const uint8 *buff, uint32 len);
uint32 wireless_uart_send_string (const char *str);
void wireless_uart_send_image (const uint8 *image_addr, uint32 image_size);

uint32 wireless_uart_read_buffer (uint8 *buff, uint32 len);

void wireless_uart_callback (void);

uint8 wireless_uart_init (void);
# 109 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_imu660ra.h" 1
# 86 "../../libraries/zf_device\\zf_device_imu660ra.h"
typedef enum
{
    IMU660RA_ACC_SAMPLE_SGN_2G ,
    IMU660RA_ACC_SAMPLE_SGN_4G ,
    IMU660RA_ACC_SAMPLE_SGN_8G ,
    IMU660RA_ACC_SAMPLE_SGN_16G,
}imu660ra_acc_sample_config;

typedef enum
{
    IMU660RA_GYRO_SAMPLE_SGN_125DPS ,
    IMU660RA_GYRO_SAMPLE_SGN_250DPS ,
    IMU660RA_GYRO_SAMPLE_SGN_500DPS ,
    IMU660RA_GYRO_SAMPLE_SGN_1000DPS,
    IMU660RA_GYRO_SAMPLE_SGN_2000DPS,
}imu660ra_gyro_sample_config;
# 127 "../../libraries/zf_device\\zf_device_imu660ra.h"
extern int16 imu660ra_gyro_x, imu660ra_gyro_y, imu660ra_gyro_z;
extern int16 imu660ra_acc_x, imu660ra_acc_y, imu660ra_acc_z;
extern float imu660ra_transition_factor[2];

void imu660ra_get_acc (void);
void imu660ra_get_gyro (void);
# 152 "../../libraries/zf_device\\zf_device_imu660ra.h"
uint8 imu660ra_init (void);
# 110 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_dl1a.h" 1
# 174 "../../libraries/zf_device\\zf_device_dl1a.h"
typedef enum
{
    DL1A_VCSEL_PERIOD_PER_RANGE,
    DL1A_VCSEL_PERIOD_FINAL_RANGE,
}dl1a_vcsel_period_type_enum;

typedef struct
{
    uint8 tcc;
    uint8 msrc;
    uint8 dss;
    uint8 pre_range;
    uint8 final_range;
}dl1a_sequence_enables_step_struct;

typedef struct
{
    uint16 pre_range_vcsel_period_pclks;
    uint16 final_range_vcsel_period_pclks;

    uint16 msrc_dss_tcc_mclks;
    uint16 pre_range_mclks;
    uint16 final_range_mclks;
    uint32 msrc_dss_tcc_us;
    uint32 pre_range_us;
    uint32 final_range_us;
}dl1a_sequence_timeout_step_struct;

extern uint8 dl1a_finsh_flag;
extern uint16 dl1a_distance_mm;

void dl1a_get_distance (void);

void dl1a_int_handler (void);
uint8 dl1a_init (void);
# 111 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_dl1b.h" 1
# 95 "../../libraries/zf_device\\zf_device_dl1b.h"
extern uint8 dl1b_finsh_flag;
extern uint16 dl1b_distance_mm;

void dl1b_get_distance (void);

void dl1b_int_handler (void);
uint8 dl1b_init (void);
# 112 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_wifi_spi.h" 1
# 87 "../../libraries/zf_device\\zf_device_wifi_spi.h"
typedef enum
{

    WIFI_SPI_INVALID1 = 0x00,
    WIFI_SPI_RESET = 0x01,
    WIFI_SPI_DATA = 0x02,
    WIFI_SPI_UDP_SEND = 0x03,
    WIFI_SPI_CLOSE_SOCKET = 0x04,

    WIFI_SPI_SET_WIFI_INFORMATION = 0x10,
    WIFI_SPI_SET_SOCKET_INFORMATION = 0x11,

    WIFI_SPI_GET_VERSION = 0x20,
    WIFI_SPI_GET_MAC_ADDR = 0x21,
    WIFI_SPI_GET_IP_ADDR = 0x22,


    WIFI_SPI_REPLY_OK = 0x80,
    WIFI_SPI_REPLY_ERROR = 0x81,

    WIFI_SPI_REPLY_DATA_START = 0x90,
    WIFI_SPI_REPLY_DATA_END = 0x91,

    WIFI_SPI_REPLY_VERSION = 0xA0,
    WIFI_SPI_REPLY_MAC_ADDR = 0xA1,
    WIFI_SPI_REPLY_IP_ADDR = 0xA2,
    WIFI_SPI_INVALID2 = 0xFF
}wifi_spi_packets_command_enum;

typedef enum
{
    WIFI_SPI_IDLE,
    WIFI_SPI_BUSY,
}wifi_spi_state_enum;


typedef struct
{
    uint8 command;
    uint8 reserve;
    uint16 length;
}wifi_spi_head_struct;


typedef struct
{
    wifi_spi_head_struct head;
    uint8 buffer[(32)];
}wifi_spi_packets_struct;


extern char wifi_spi_version[12];
extern char wifi_spi_mac_addr[20];
extern char wifi_spi_ip_addr_port[25];

uint8 wifi_spi_wifi_connect (char *wifi_ssid, char *pass_word);
uint8 wifi_spi_socket_connect (char *transport_type, char *ip_addr, char *port, char *local_port);
uint8 wifi_spi_socket_disconnect (void);
uint8 wifi_spi_udp_send_now (void);
uint32 wifi_spi_send_buffer (const uint8 *buff, uint32 length);
void wifi_spi_send_string (const char *string);
uint32 wifi_spi_read_buffer (uint8 *buffer, uint32 length);

uint8 wifi_spi_init (char *wifi_ssid, char *pass_word);
# 113 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_device\\zf_device_ble6a20.h" 1
# 90 "../../libraries/zf_device\\zf_device_ble6a20.h"
uint32 ble6a20_send_byte (const uint8 data);
uint32 ble6a20_send_buffer (const uint8 *buff, uint32 len);
uint32 ble6a20_send_string (const char *str);
void ble6a20_send_image (const uint8 *image_addr, uint32 image_size);

uint32 ble6a20_read_buffer (uint8 *buff, uint32 len);

void ble6a20_callback (void);

uint8 ble6a20_init (void);
# 114 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_components\\seekfree_assistant.h" 1
# 75 "../../libraries/zf_components\\seekfree_assistant.h"
typedef enum
{

    SEEKFREE_ASSISTANT_OV7725_BIN = 1,
    SEEKFREE_ASSISTANT_MT9V03X,
    SEEKFREE_ASSISTANT_SCC8660,


    SEEKFREE_ASSISTANT_BINARY = 1,
    SEEKFREE_ASSISTANT_GRAY,
    SEEKFREE_ASSISTANT_RGB565,
}seekfree_assistant_image_type_enum;


typedef enum
{

    X_BOUNDARY,
    Y_BOUNDARY,
    XY_BOUNDARY,
    NO_BOUNDARY,
}seekfree_assistant_boundary_type_enum;

typedef struct
{
    uint8 head;
    uint8 channel_num;
    uint8 check_sum;
    uint8 length;
    float data[( 0x08 )];
}seekfree_assistant_oscilloscope_struct;


typedef struct
{
    uint8 head;
    uint8 function;
    uint8 camera_type;
    uint8 length;
    uint16 image_width;
    uint16 image_height;
}seekfree_assistant_camera_struct;


typedef struct
{
    uint8 head;
    uint8 function;
    uint8 dot_type;
    uint8 length;
    uint16 dot_num;
    uint8 valid_flag;
    uint8 reserve;
}seekfree_assistant_camera_dot_struct;

typedef struct
{
    void *image_addr;
    uint16 width;
    uint16 height;
    seekfree_assistant_image_type_enum camera_type;
    void *boundary_x[( 0x08 )];
    void *boundary_y[( 0x08 )];
}seekfree_assistant_camera_buffer_struct;

typedef struct
{
    uint8 head;
    uint8 function;
    uint8 channel;
    uint8 check_sum;
    float data;
}seekfree_assistant_parameter_struct;

typedef uint32 (*seekfree_assistant_transfer_callback_function) (const uint8 *buff, uint32 length);
typedef uint32 (*seekfree_assistant_receive_callback_function) (uint8 *buff, uint32 length);

extern seekfree_assistant_oscilloscope_struct seekfree_assistant_oscilloscope_data;
extern float seekfree_assistant_parameter[( 0x08 )];
extern vuint8 seekfree_assistant_parameter_update_flag[( 0x08 )];


void seekfree_assistant_oscilloscope_send (seekfree_assistant_oscilloscope_struct *seekfree_assistant_oscilloscope);
void seekfree_assistant_camera_information_config (seekfree_assistant_image_type_enum camera_type, void *image_addr, uint16 width, uint16 height);
void seekfree_assistant_camera_boundary_config (seekfree_assistant_boundary_type_enum boundary_type, uint16 dot_num, void *dot_x1, void *dot_x2, void *dot_x3, void *dot_y1, void *dot_y2, void *dot_y3);
void seekfree_assistant_camera_send (void);
void seekfree_assistant_data_analysis (void);
# 115 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/zf_components\\seekfree_assistant_interface.h" 1
# 42 "../../libraries/zf_components\\seekfree_assistant_interface.h"
typedef enum
{
    SEEKFREE_ASSISTANT_DEBUG_UART,
    SEEKFREE_ASSISTANT_WIRELESS_UART,
    SEEKFREE_ASSISTANT_CH9141,
    SEEKFREE_ASSISTANT_WIFI_UART,
    SEEKFREE_ASSISTANT_WIFI_SPI,
    SEEKFREE_ASSISTANT_BLE6A20,
    SEEKFREE_ASSISTANT_CUSTOM,
}seekfree_assistant_transfer_device_enum;


void seekfree_assistant_interface_init (seekfree_assistant_transfer_device_enum transfer_device);
# 116 "../../libraries/zf_common\\zf_common_headfile.h" 2



# 1 "../../libraries/components/fatfs/source\\ff.h" 1
# 29 "../../libraries/components/fatfs/source\\ff.h"
# 1 "../../libraries/components/fatfs/source/ffconf.h" 1
# 30 "../../libraries/components/fatfs/source\\ff.h" 2
# 49 "../../libraries/components/fatfs/source\\ff.h"
typedef unsigned int UINT;
typedef unsigned char BYTE;
typedef uint16_t WORD;
typedef uint32_t DWORD;
typedef uint64_t QWORD;
typedef WORD WCHAR;
# 82 "../../libraries/components/fatfs/source\\ff.h"
typedef DWORD FSIZE_t;
typedef DWORD LBA_t;
# 105 "../../libraries/components/fatfs/source\\ff.h"
typedef char TCHAR;
# 132 "../../libraries/components/fatfs/source\\ff.h"
typedef struct {
 BYTE fs_type;
 BYTE pdrv;
 BYTE n_fats;
 BYTE wflag;
 BYTE fsi_flag;
 WORD id;
 WORD n_rootdir;
 WORD csize;
# 154 "../../libraries/components/fatfs/source\\ff.h"
 DWORD last_clst;
 DWORD free_clst;


 DWORD cdir;






 DWORD n_fatent;
 DWORD fsize;
 LBA_t volbase;
 LBA_t fatbase;
 LBA_t dirbase;
 LBA_t database;



 LBA_t winsect;
 BYTE win[512];
} FATFS;





typedef struct {
 FATFS* fs;
 WORD id;
 BYTE attr;
 BYTE stat;
 DWORD sclust;
 FSIZE_t objsize;
# 199 "../../libraries/components/fatfs/source\\ff.h"
} FFOBJID;





typedef struct {
 FFOBJID obj;
 BYTE flag;
 BYTE err;
 FSIZE_t fptr;
 DWORD clust;
 LBA_t sect;

 LBA_t dir_sect;
 BYTE* dir_ptr;





 BYTE buf[512];

} FIL;





typedef struct {
 FFOBJID obj;
 DWORD dptr;
 DWORD clust;
 LBA_t sect;
 BYTE* dir;
 BYTE fn[12];






} DIR;





typedef struct {
 FSIZE_t fsize;
 WORD fdate;
 WORD ftime;
 BYTE fattrib;




 TCHAR fname[12 + 1];

} FILINFO;





typedef struct {
 BYTE fmt;
 BYTE n_fat;
 UINT align;
 UINT n_root;
 DWORD au_size;
} MKFS_PARM;





typedef enum {
 FR_OK = 0,
 FR_DISK_ERR,
 FR_INT_ERR,
 FR_NOT_READY,
 FR_NO_FILE,
 FR_NO_PATH,
 FR_INVALID_NAME,
 FR_DENIED,
 FR_EXIST,
 FR_INVALID_OBJECT,
 FR_WRITE_PROTECTED,
 FR_INVALID_DRIVE,
 FR_NOT_ENABLED,
 FR_NO_FILESYSTEM,
 FR_MKFS_ABORTED,
 FR_TIMEOUT,
 FR_LOCKED,
 FR_NOT_ENOUGH_CORE,
 FR_TOO_MANY_OPEN_FILES,
 FR_INVALID_PARAMETER
} FRESULT;






FRESULT f_open (FIL* fp, const TCHAR* path, BYTE mode);
FRESULT f_close (FIL* fp);
FRESULT f_read (FIL* fp, void* buff, UINT btr, UINT* br);
FRESULT f_write (FIL* fp, const void* buff, UINT btw, UINT* bw);
FRESULT f_lseek (FIL* fp, FSIZE_t ofs);
FRESULT f_truncate (FIL* fp);
FRESULT f_sync (FIL* fp);
FRESULT f_opendir (DIR* dp, const TCHAR* path);
FRESULT f_closedir (DIR* dp);
FRESULT f_readdir (DIR* dp, FILINFO* fno);
FRESULT f_findfirst (DIR* dp, FILINFO* fno, const TCHAR* path, const TCHAR* pattern);
FRESULT f_findnext (DIR* dp, FILINFO* fno);
FRESULT f_mkdir (const TCHAR* path);
FRESULT f_unlink (const TCHAR* path);
FRESULT f_rename (const TCHAR* path_old, const TCHAR* path_new);
FRESULT f_stat (const TCHAR* path, FILINFO* fno);
FRESULT f_chmod (const TCHAR* path, BYTE attr, BYTE mask);
FRESULT f_utime (const TCHAR* path, const FILINFO* fno);
FRESULT f_chdir (const TCHAR* path);
FRESULT f_chdrive (const TCHAR* path);
FRESULT f_getcwd (TCHAR* buff, UINT len);
FRESULT f_getfree (const TCHAR* path, DWORD* nclst, FATFS** fatfs);
FRESULT f_getlabel (const TCHAR* path, TCHAR* label, DWORD* vsn);
FRESULT f_setlabel (const TCHAR* label);
FRESULT f_forward (FIL* fp, UINT(*func)(const BYTE*,UINT), UINT btf, UINT* bf);
FRESULT f_expand (FIL* fp, FSIZE_t fsz, BYTE opt);
FRESULT f_mount (FATFS* fs, const TCHAR* path, BYTE opt);
FRESULT f_mkfs (const TCHAR* path, const MKFS_PARM* opt, void* work, UINT len);
FRESULT f_fdisk (BYTE pdrv, const LBA_t ptbl[], void* work);
FRESULT f_setcp (WORD cp);
int f_putc (TCHAR c, FIL* fp);
int f_puts (const TCHAR* str, FIL* cp);
int f_printf (FIL* fp, const TCHAR* str, ...);
TCHAR* f_gets (TCHAR* buff, int len, FIL* fp);
# 120 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/components/fatfs/source\\diskio.h" 1
# 21 "../../libraries/components/fatfs/source\\diskio.h"
typedef BYTE DSTATUS;


typedef enum {
 RES_OK = 0,
 RES_ERROR,
 RES_WRPRT,
 RES_NOTRDY,
 RES_PARERR
} DRESULT;






DSTATUS disk_initialize (BYTE pdrv);
DSTATUS disk_status (BYTE pdrv);
DRESULT disk_read (BYTE pdrv, BYTE* buff, LBA_t sector, UINT count);
DRESULT disk_write (BYTE pdrv, const BYTE* buff, LBA_t sector, UINT count);
DRESULT disk_ioctl (BYTE pdrv, BYTE cmd, void* buff);
# 121 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/components/fatfs/source/fsl_sd_disk\\fsl_sd_disk.h" 1
# 16 "../../libraries/components/fatfs/source/fsl_sd_disk\\fsl_sd_disk.h"
# 1 "../../libraries/components/sdmmc/sd\\fsl_sd.h" 1
# 12 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
# 1 "../../libraries/components/sdmmc/common\\fsl_sdmmc_common.h" 1
# 13 "../../libraries/components/sdmmc/common\\fsl_sdmmc_common.h"
# 1 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h" 1
# 13 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h"
# 1 "../../libraries/components/sdmmc/osa\\fsl_sdmmc_osa.h" 1
# 12 "../../libraries/components/sdmmc/osa\\fsl_sdmmc_osa.h"
# 1 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h" 1
# 20 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
# 1 "../../libraries/sdk/components/osa/fsl_os_abstraction_config.h" 1
# 21 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h" 2
# 1 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h" 1
# 46 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h"
typedef enum _list_status
{
    kLIST_Ok = kStatus_Success,
    kLIST_DuplicateError = ((((kStatusGroup_LIST)*100L) + (1))),
    kLIST_Full = ((((kStatusGroup_LIST)*100L) + (2))),
    kLIST_Empty = ((((kStatusGroup_LIST)*100L) + (3))),
    kLIST_OrphanElement = ((((kStatusGroup_LIST)*100L) + (4))),
    kLIST_NotSupport = ((((kStatusGroup_LIST)*100L) + (5))),
} list_status_t;
# 68 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h"
typedef struct list_label
{
    struct list_element_tag *head;
    struct list_element_tag *tail;
    uint32_t size;
    uint32_t max;
} list_label_t, *list_handle_t;


typedef struct list_element_tag
{
    struct list_element_tag *next;
    struct list_label *list;
} list_element_t, *list_element_handle_t;
# 109 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h"
void LIST_Init(list_handle_t list, uint32_t max);
# 118 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h"
list_handle_t LIST_GetList(list_element_handle_t element);
# 127 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h"
list_status_t LIST_AddHead(list_handle_t list, list_element_handle_t element);
# 136 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h"
list_status_t LIST_AddTail(list_handle_t list, list_element_handle_t element);
# 145 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h"
list_element_handle_t LIST_RemoveHead(list_handle_t list);
# 154 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h"
list_element_handle_t LIST_GetHead(list_handle_t list);
# 163 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h"
list_element_handle_t LIST_GetNext(list_element_handle_t element);
# 172 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h"
list_element_handle_t LIST_GetPrev(list_element_handle_t element);
# 182 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h"
list_status_t LIST_RemoveElement(list_element_handle_t element);
# 193 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h"
list_status_t LIST_AddPrevElement(list_element_handle_t element, list_element_handle_t newElement);
# 202 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h"
uint32_t LIST_GetSize(list_handle_t list);
# 211 "../../libraries/sdk/components/lists\\fsl_component_generic_list.h"
uint32_t LIST_GetAvailableSize(list_handle_t list);
# 22 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h" 2
# 37 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
typedef uint16_t osa_task_priority_t;

typedef void *osa_task_handle_t;

typedef void *osa_task_param_t;

typedef void (*osa_task_ptr_t)(osa_task_param_t task_param);

typedef void *osa_semaphore_handle_t;

typedef void *osa_mutex_handle_t;

typedef void *osa_event_handle_t;

typedef uint32_t osa_event_flags_t;

typedef void *osa_msg_handle_t;

typedef void *osa_msgq_handle_t;

typedef void *osa_timer_handle_t;

typedef void (*osa_timer_fct_ptr_t)(void const *argument);

typedef struct osa_task_def_tag
{
    osa_task_ptr_t pthread;
    uint32_t tpriority;
    uint32_t instances;
    uint32_t stacksize;
    uint32_t *tstack;
    void *tlink;
    uint8_t *tname;
    uint8_t useFloat;
} osa_task_def_t;

typedef struct osa_thread_link_tag
{
    uint8_t link[12];
    osa_task_handle_t osThreadId;
    osa_task_def_t *osThreadDefHandle;
    uint32_t *osThreadStackHandle;
} osa_thread_link_t, *osa_thread_link_handle_t;


typedef struct osa_time_def_tag
{
    osa_timer_fct_ptr_t pfCallback;
    void *argument;
} osa_time_def_t;


typedef enum _osa_timer
{
    KOSA_TimerOnce = 0,
    KOSA_TimerPeriodic = 1
} osa_timer_t;



typedef enum _osa_status
{
    KOSA_StatusSuccess = kStatus_Success,
    KOSA_StatusError = ((((kStatusGroup_OSA)*100L) + (1))),
    KOSA_StatusTimeout = ((((kStatusGroup_OSA)*100L) + (2))),
    KOSA_StatusIdle = ((((kStatusGroup_OSA)*100L) + (3))),

} osa_status_t;
# 375 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
# 1 "../../libraries/sdk/components/osa/fsl_os_abstraction_bm.h" 1
# 34 "../../libraries/sdk/components/osa/fsl_os_abstraction_bm.h"
typedef void *task_param_t;


typedef uint32_t event_flags_t;
# 54 "../../libraries/sdk/components/osa/fsl_os_abstraction_bm.h"
extern void DefaultISR(void);
# 69 "../../libraries/sdk/components/osa/fsl_os_abstraction_bm.h"
void OSA_ProcessTasks(void);
# 78 "../../libraries/sdk/components/osa/fsl_os_abstraction_bm.h"
uint8_t OSA_TaskShouldYield(void);
# 376 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h" 2


extern const uint8_t gUseRtos_c;
# 406 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
void *OSA_MemoryAllocate(uint32_t length);
# 416 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
void OSA_MemoryFree(void *p);






void OSA_EnterCritical(uint32_t *sr);






void OSA_ExitCritical(uint32_t sr);
# 576 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_SemaphoreCreate(osa_semaphore_handle_t semaphoreHandle, uint32_t initValue);
# 599 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_SemaphoreCreateBinary(osa_semaphore_handle_t semaphoreHandle);
# 611 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_SemaphoreDestroy(osa_semaphore_handle_t semaphoreHandle);
# 629 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_SemaphoreWait(osa_semaphore_handle_t semaphoreHandle, uint32_t millisec);
# 643 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_SemaphorePost(osa_semaphore_handle_t semaphoreHandle);
# 665 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_MutexCreate(osa_mutex_handle_t mutexHandle);
# 685 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_MutexLock(osa_mutex_handle_t mutexHandle, uint32_t millisec);
# 695 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_MutexUnlock(osa_mutex_handle_t mutexHandle);
# 706 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_MutexDestroy(osa_mutex_handle_t mutexHandle);
# 733 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_EventCreate(osa_event_handle_t eventHandle, uint8_t autoClear);
# 746 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_EventSet(osa_event_handle_t eventHandle, osa_event_flags_t flagsToSet);
# 759 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_EventClear(osa_event_handle_t eventHandle, osa_event_flags_t flagsToClear);
# 775 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_EventGet(osa_event_handle_t eventHandle,
                          osa_event_flags_t flagsMask,
                          osa_event_flags_t *pFlagsOfEvent);
# 805 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_EventWait(osa_event_handle_t eventHandle,
                           osa_event_flags_t flagsToWait,
                           uint8_t waitAll,
                           uint32_t millisec,
                           osa_event_flags_t *pSetFlags);
# 819 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_EventDestroy(osa_event_handle_t eventHandle);
# 846 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_MsgQCreate(osa_msgq_handle_t msgqHandle, uint32_t msgNo, uint32_t msgSize);
# 860 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_MsgQPut(osa_msgq_handle_t msgqHandle, osa_msg_handle_t pMessage);
# 878 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_MsgQGet(osa_msgq_handle_t msgqHandle, osa_msg_handle_t pMessage, uint32_t millisec);
# 889 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
int OSA_MsgQAvailableMsgs(osa_msgq_handle_t msgqHandle);
# 899 "../../libraries/sdk/components/osa\\fsl_os_abstraction.h"
osa_status_t OSA_MsgQDestroy(osa_msgq_handle_t msgqHandle);




void OSA_InterruptEnable(void);




void OSA_InterruptDisable(void);




void OSA_EnableIRQGlobal(void);




void OSA_DisableIRQGlobal(void);






void OSA_TimeDelay(uint32_t millisec);






uint32_t OSA_TimeGetMsec(void);







void OSA_InstallIntHandler(uint32_t IRQNumber, void (*handler)(void));
# 13 "../../libraries/components/sdmmc/osa\\fsl_sdmmc_osa.h" 2
# 39 "../../libraries/components/sdmmc/osa\\fsl_sdmmc_osa.h"
typedef struct _sdmmc_osa_event
{

    volatile uint32_t eventFlag;
    uint32_t handle[((8U) + sizeof(uint32_t) - 1U) / sizeof(uint32_t)];



} sdmmc_osa_event_t;


typedef struct _sdmmc_osa_mutex
{
    uint32_t handle[((4U) + sizeof(uint32_t) - 1U) / sizeof(uint32_t)];
} sdmmc_osa_mutex_t;
# 69 "../../libraries/components/sdmmc/osa\\fsl_sdmmc_osa.h"
void SDMMC_OSAInit(void);






status_t SDMMC_OSAEventCreate(void *eventHandle);
# 87 "../../libraries/components/sdmmc/osa\\fsl_sdmmc_osa.h"
status_t SDMMC_OSAEventWait(void *eventHandle, uint32_t eventType, uint32_t timeoutMilliseconds, uint32_t *event);







status_t SDMMC_OSAEventSet(void *eventHandle, uint32_t eventType);
# 104 "../../libraries/components/sdmmc/osa\\fsl_sdmmc_osa.h"
status_t SDMMC_OSAEventGet(void *eventHandle, uint32_t eventType, uint32_t *flag);







status_t SDMMC_OSAEventClear(void *eventHandle, uint32_t eventType);





status_t SDMMC_OSAEventDestroy(void *eventHandle);






status_t SDMMC_OSAMutexCreate(void *mutexHandle);
# 136 "../../libraries/components/sdmmc/osa\\fsl_sdmmc_osa.h"
status_t SDMMC_OSAMutexLock(void *mutexHandle, uint32_t millisec);






status_t SDMMC_OSAMutexUnlock(void *mutexHandle);





status_t SDMMC_OSAMutexDestroy(void *mutexHandle);





void SDMMC_OSADelay(uint32_t milliseconds);






uint32_t SDMMC_OSADelayUs(uint32_t microseconds);
# 14 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h" 2
# 1 "../../libraries/sdk/drives\\fsl_usdhc.h" 1
# 37 "../../libraries/sdk/drives\\fsl_usdhc.h"
enum
{
    kStatus_USDHC_BusyTransferring = ((((kStatusGroup_USDHC)*100L) + (0U))),
    kStatus_USDHC_PrepareAdmaDescriptorFailed = ((((kStatusGroup_USDHC)*100L) + (1U))),
    kStatus_USDHC_SendCommandFailed = ((((kStatusGroup_USDHC)*100L) + (2U))),
    kStatus_USDHC_TransferDataFailed = ((((kStatusGroup_USDHC)*100L) + (3U))),
    kStatus_USDHC_DMADataAddrNotAlign = ((((kStatusGroup_USDHC)*100L) + (4U))),
    kStatus_USDHC_ReTuningRequest = ((((kStatusGroup_USDHC)*100L) + (5U))),
    kStatus_USDHC_TuningError = ((((kStatusGroup_USDHC)*100L) + (6U))),
    kStatus_USDHC_NotSupport = ((((kStatusGroup_USDHC)*100L) + (7U))),
    kStatus_USDHC_TransferDataComplete = ((((kStatusGroup_USDHC)*100L) + (8U))),
    kStatus_USDHC_SendCommandSuccess = ((((kStatusGroup_USDHC)*100L) + (9U))),
    kStatus_USDHC_TransferDMAComplete = ((((kStatusGroup_USDHC)*100L) + (10U))),
};




enum
{
    kUSDHC_SupportAdmaFlag = (0x100000U),
    kUSDHC_SupportHighSpeedFlag = (0x200000U),
    kUSDHC_SupportDmaFlag = (0x400000U),
    kUSDHC_SupportSuspendResumeFlag = (0x800000U),
    kUSDHC_SupportV330Flag = (0x1000000U),
    kUSDHC_SupportV300Flag = (0x2000000U),
    kUSDHC_SupportV180Flag = (0x4000000U),
    kUSDHC_Support4BitFlag = ((16U) << 0U),

    kUSDHC_Support8BitFlag = ((16U) << 1U),

    kUSDHC_SupportDDR50Flag = (0x4U),





    kUSDHC_SupportSDR104Flag = (0x2U),




    kUSDHC_SupportSDR50Flag = (0x1U),

};




enum
{
    kUSDHC_WakeupEventOnCardInt = (0x1000000U),
    kUSDHC_WakeupEventOnCardInsert = (0x2000000U),
    kUSDHC_WakeupEventOnCardRemove = (0x4000000U),
    kUSDHC_WakeupEventsAll =
        (kUSDHC_WakeupEventOnCardInt | kUSDHC_WakeupEventOnCardInsert | kUSDHC_WakeupEventOnCardRemove),

};




enum
{
    kUSDHC_ResetAll = (0x1000000U),
    kUSDHC_ResetCommand = (0x2000000U),
    kUSDHC_ResetData = (0x4000000U),




    kUSDHC_ResetTuning = (0x10000000U),


    kUSDHC_ResetsAll = (kUSDHC_ResetAll | kUSDHC_ResetCommand | kUSDHC_ResetData | kUSDHC_ResetTuning),

};


enum
{
    kUSDHC_EnableDmaFlag = (0x1U),

    kUSDHC_CommandTypeSuspendFlag = (((uint32_t)(((uint32_t)(1U)) << (22U))) & (0xC00000U)),
    kUSDHC_CommandTypeResumeFlag = (((uint32_t)(((uint32_t)(2U)) << (22U))) & (0xC00000U)),
    kUSDHC_CommandTypeAbortFlag = (((uint32_t)(((uint32_t)(3U)) << (22U))) & (0xC00000U)),

    kUSDHC_EnableBlockCountFlag = (0x2U),
    kUSDHC_EnableAutoCommand12Flag = (0x4U),
    kUSDHC_DataReadFlag = (0x10U),
    kUSDHC_MultipleBlockFlag = (0x20U),
    kUSDHC_EnableAutoCommand23Flag = (0x80U),

    kUSDHC_ResponseLength136Flag = (((uint32_t)(((uint32_t)(1U)) << (16U))) & (0x30000U)),
    kUSDHC_ResponseLength48Flag = (((uint32_t)(((uint32_t)(2U)) << (16U))) & (0x30000U)),
    kUSDHC_ResponseLength48BusyFlag = (((uint32_t)(((uint32_t)(3U)) << (16U))) & (0x30000U)),

    kUSDHC_EnableCrcCheckFlag = (0x80000U),
    kUSDHC_EnableIndexCheckFlag = (0x100000U),
    kUSDHC_DataPresentFlag = (0x200000U),
};




enum
{
    kUSDHC_CommandInhibitFlag = (0x1U),
    kUSDHC_DataInhibitFlag = (0x2U),
    kUSDHC_DataLineActiveFlag = (0x4U),
    kUSDHC_SdClockStableFlag = (0x8U),
    kUSDHC_WriteTransferActiveFlag = (0x100U),
    kUSDHC_ReadTransferActiveFlag = (0x200U),
    kUSDHC_BufferWriteEnableFlag = (0x400U),
    kUSDHC_BufferReadEnableFlag = (0x800U),





    kUSDHC_ReTuningRequestFlag = (0x1000U),
    kUSDHC_DelaySettingFinishedFlag = (0x8000U),


    kUSDHC_CardInsertedFlag = (0x10000U),
    kUSDHC_CommandLineLevelFlag = (0x800000U),

    kUSDHC_Data0LineLevelFlag = 1U << (24U),
    kUSDHC_Data1LineLevelFlag = 1U << ((24U) + 1U),
    kUSDHC_Data2LineLevelFlag = 1U << ((24U) + 2U),
    kUSDHC_Data3LineLevelFlag = 1U << ((24U) + 3U),
    kUSDHC_Data4LineLevelFlag = 1U << ((24U) + 4U),
    kUSDHC_Data5LineLevelFlag = 1U << ((24U) + 5U),
    kUSDHC_Data6LineLevelFlag = 1U << ((24U) + 6U),
    kUSDHC_Data7LineLevelFlag = (int)(1U << ((24U) + 7U)),
};




enum
{
    kUSDHC_CommandCompleteFlag = (0x1U),
    kUSDHC_DataCompleteFlag = (0x2U),
    kUSDHC_BlockGapEventFlag = (0x4U),
    kUSDHC_DmaCompleteFlag = (0x8U),
    kUSDHC_BufferWriteReadyFlag = (0x10U),
    kUSDHC_BufferReadReadyFlag = (0x20U),
    kUSDHC_CardInsertionFlag = (0x40U),
    kUSDHC_CardRemovalFlag = (0x80U),
    kUSDHC_CardInterruptFlag = (0x100U),






    kUSDHC_ReTuningEventFlag = (0x1000U),
    kUSDHC_TuningPassFlag = (0x4000U),
    kUSDHC_TuningErrorFlag = (0x4000000U),


    kUSDHC_CommandTimeoutFlag = (0x10000U),
    kUSDHC_CommandCrcErrorFlag = (0x20000U),
    kUSDHC_CommandEndBitErrorFlag = (0x40000U),
    kUSDHC_CommandIndexErrorFlag = (0x80000U),
    kUSDHC_DataTimeoutFlag = (0x100000U),
    kUSDHC_DataCrcErrorFlag = (0x200000U),
    kUSDHC_DataEndBitErrorFlag = (0x400000U),
    kUSDHC_AutoCommand12ErrorFlag = (0x1000000U),
    kUSDHC_DmaErrorFlag = (0x10000000U),

    kUSDHC_CommandErrorFlag = (kUSDHC_CommandTimeoutFlag | kUSDHC_CommandCrcErrorFlag | kUSDHC_CommandEndBitErrorFlag |
                               kUSDHC_CommandIndexErrorFlag),
    kUSDHC_DataErrorFlag = (kUSDHC_DataTimeoutFlag | kUSDHC_DataCrcErrorFlag | kUSDHC_DataEndBitErrorFlag |
                            kUSDHC_AutoCommand12ErrorFlag),
    kUSDHC_ErrorFlag = (kUSDHC_CommandErrorFlag | kUSDHC_DataErrorFlag | kUSDHC_DmaErrorFlag),

    kUSDHC_DataFlag = (kUSDHC_DataCompleteFlag | kUSDHC_BufferWriteReadyFlag | kUSDHC_BufferReadReadyFlag |
                       kUSDHC_DataErrorFlag),

    kUSDHC_DataDMAFlag = (kUSDHC_DataCompleteFlag | kUSDHC_DataErrorFlag | kUSDHC_DmaErrorFlag),

    kUSDHC_CommandFlag = (kUSDHC_CommandErrorFlag | kUSDHC_CommandCompleteFlag),
    kUSDHC_CardDetectFlag = (kUSDHC_CardInsertionFlag | kUSDHC_CardRemovalFlag),
    kUSDHC_SDR104TuningFlag = (kUSDHC_TuningErrorFlag | kUSDHC_TuningPassFlag | kUSDHC_ReTuningEventFlag),

    kUSDHC_AllInterruptFlags =
        (kUSDHC_BlockGapEventFlag | kUSDHC_CardInterruptFlag | kUSDHC_CommandFlag | kUSDHC_DataFlag | kUSDHC_ErrorFlag |
         kUSDHC_SDR104TuningFlag | kUSDHC_DmaCompleteFlag),
};




enum
{
    kUSDHC_AutoCommand12NotExecutedFlag = (0x1U),
    kUSDHC_AutoCommand12TimeoutFlag = (0x2U),
    kUSDHC_AutoCommand12EndBitErrorFlag = (0x4U),
    kUSDHC_AutoCommand12CrcErrorFlag = (0x8U),
    kUSDHC_AutoCommand12IndexErrorFlag = (0x10U),
    kUSDHC_AutoCommand12NotIssuedFlag = (0x80U),
};


enum
{




    kUSDHC_ExecuteTuning = (0x400000U),
    kUSDHC_TuningSampleClockSel =
        (0x800000U),


};




enum
{
    kUSDHC_AdmaLenghMismatchFlag = (0x4U),
    kUSDHC_AdmaDescriptorErrorFlag = (0x8U),
};






enum
{
    kUSDHC_AdmaErrorStateStopDma = 0x00U,

    kUSDHC_AdmaErrorStateFetchDescriptor = 0x01U,

    kUSDHC_AdmaErrorStateChangeAddress = 0x02U,
    kUSDHC_AdmaErrorStateTransferData = 0x03U,

    kUSDHC_AdmaErrorStateInvalidLength = 0x04U,
    kUSDHC_AdmaErrorStateInvalidDescriptor = 0x08U,

    kUSDHC_AdmaErrorState = kUSDHC_AdmaErrorStateInvalidLength | kUSDHC_AdmaErrorStateInvalidDescriptor |
                            kUSDHC_AdmaErrorStateFetchDescriptor,
};




enum
{
    kUSDHC_ForceEventAutoCommand12NotExecuted =
        (0x1U),
    kUSDHC_ForceEventAutoCommand12Timeout = (0x2U),
    kUSDHC_ForceEventAutoCommand12CrcError = (0x4U),
    kUSDHC_ForceEventEndBitError = (0x8U),
    kUSDHC_ForceEventAutoCommand12IndexError = (0x10U),
    kUSDHC_ForceEventAutoCommand12NotIssued = (0x80U),
    kUSDHC_ForceEventCommandTimeout = (0x10000U),
    kUSDHC_ForceEventCommandCrcError = (0x20000U),
    kUSDHC_ForceEventCommandEndBitError = (0x40000U),
    kUSDHC_ForceEventCommandIndexError = (0x80000U),
    kUSDHC_ForceEventDataTimeout = (0x100000U),
    kUSDHC_ForceEventDataCrcError = (0x200000U),
    kUSDHC_ForceEventDataEndBitError = (0x400000U),
    kUSDHC_ForceEventAutoCommand12Error = (0x1000000U),
    kUSDHC_ForceEventCardInt = (int)(0x80000000U),
    kUSDHC_ForceEventDmaError = (0x10000000U),



    kUSDHC_ForceEventTuningError = (0x4000000U),


    kUSDHC_ForceEventsAll =
        (int)((0x1U) | (0x2U) |
              (0x4U) | (0x8U) |
              (0x10U) | (0x80U) |
              (0x10000U) | (0x20000U) | (0x40000U) |
              (0x80000U) | (0x100000U) | (0x200000U) |
              (0x400000U) | (0x1000000U) | (0x80000000U) |
              (0x10000000U) | kUSDHC_ForceEventTuningError),
};


typedef enum _usdhc_transfer_direction
{
    kUSDHC_TransferDirectionReceive = 1U,
    kUSDHC_TransferDirectionSend = 0U,
} usdhc_transfer_direction_t;


typedef enum _usdhc_data_bus_width
{
    kUSDHC_DataBusWidth1Bit = 0U,
    kUSDHC_DataBusWidth4Bit = 1U,
    kUSDHC_DataBusWidth8Bit = 2U,
} usdhc_data_bus_width_t;


typedef enum _usdhc_endian_mode
{
    kUSDHC_EndianModeBig = 0U,
    kUSDHC_EndianModeHalfWordBig = 1U,
    kUSDHC_EndianModeLittle = 2U,
} usdhc_endian_mode_t;


typedef enum _usdhc_dma_mode
{
    kUSDHC_DmaModeSimple = 0U,
    kUSDHC_DmaModeAdma1 = 1U,
    kUSDHC_DmaModeAdma2 = 2U,
    kUSDHC_ExternalDMA = 3U,
} usdhc_dma_mode_t;




enum
{
    kUSDHC_StopAtBlockGapFlag = (0x10000U),
    kUSDHC_ReadWaitControlFlag = (0x40000U),
    kUSDHC_InterruptAtBlockGapFlag = (0x80000U),
    kUSDHC_ReadDoneNo8CLK = (0x100000U),
    kUSDHC_ExactBlockNumberReadFlag = (0x40000000U),
};


typedef enum _usdhc_boot_mode
{
    kUSDHC_BootModeNormal = 0U,
    kUSDHC_BootModeAlternative = 1U,
} usdhc_boot_mode_t;


typedef enum _usdhc_card_command_type
{
    kCARD_CommandTypeNormal = 0U,
    kCARD_CommandTypeSuspend = 1U,
    kCARD_CommandTypeResume = 2U,
    kCARD_CommandTypeAbort = 3U,
    kCARD_CommandTypeEmpty = 4U,
} usdhc_card_command_type_t;






typedef enum _usdhc_card_response_type
{
    kCARD_ResponseTypeNone = 0U,
    kCARD_ResponseTypeR1 = 1U,
    kCARD_ResponseTypeR1b = 2U,
    kCARD_ResponseTypeR2 = 3U,
    kCARD_ResponseTypeR3 = 4U,
    kCARD_ResponseTypeR4 = 5U,
    kCARD_ResponseTypeR5 = 6U,
    kCARD_ResponseTypeR5b = 7U,
    kCARD_ResponseTypeR6 = 8U,
    kCARD_ResponseTypeR7 = 9U,
} usdhc_card_response_type_t;
# 469 "../../libraries/sdk/drives\\fsl_usdhc.h"
enum
{
    kUSDHC_Adma1DescriptorValidFlag = (1U << 0U),
    kUSDHC_Adma1DescriptorEndFlag = (1U << 1U),
    kUSDHC_Adma1DescriptorInterrupFlag = (1U << 2U),
    kUSDHC_Adma1DescriptorActivity1Flag = (1U << 4U),
    kUSDHC_Adma1DescriptorActivity2Flag = (1U << 5U),
    kUSDHC_Adma1DescriptorTypeNop = (kUSDHC_Adma1DescriptorValidFlag),
    kUSDHC_Adma1DescriptorTypeTransfer = (kUSDHC_Adma1DescriptorActivity2Flag | kUSDHC_Adma1DescriptorValidFlag),

    kUSDHC_Adma1DescriptorTypeLink = (kUSDHC_Adma1DescriptorActivity1Flag | kUSDHC_Adma1DescriptorActivity2Flag |
                                      kUSDHC_Adma1DescriptorValidFlag),
    kUSDHC_Adma1DescriptorTypeSetLength = (kUSDHC_Adma1DescriptorActivity1Flag | kUSDHC_Adma1DescriptorValidFlag),

};
# 532 "../../libraries/sdk/drives\\fsl_usdhc.h"
enum
{
    kUSDHC_Adma2DescriptorValidFlag = (1U << 0U),
    kUSDHC_Adma2DescriptorEndFlag = (1U << 1U),
    kUSDHC_Adma2DescriptorInterruptFlag = (1U << 2U),
    kUSDHC_Adma2DescriptorActivity1Flag = (1U << 4U),
    kUSDHC_Adma2DescriptorActivity2Flag = (1U << 5U),

    kUSDHC_Adma2DescriptorTypeNop = (kUSDHC_Adma2DescriptorValidFlag),
    kUSDHC_Adma2DescriptorTypeReserved = (kUSDHC_Adma2DescriptorActivity1Flag | kUSDHC_Adma2DescriptorValidFlag),

    kUSDHC_Adma2DescriptorTypeTransfer = (kUSDHC_Adma2DescriptorActivity2Flag | kUSDHC_Adma2DescriptorValidFlag),

    kUSDHC_Adma2DescriptorTypeLink = (kUSDHC_Adma2DescriptorActivity1Flag | kUSDHC_Adma2DescriptorActivity2Flag |
                                      kUSDHC_Adma2DescriptorValidFlag),
};




enum
{
    kUSDHC_AdmaDescriptorSingleFlag = 0U,


    kUSDHC_AdmaDescriptorMultipleFlag =
        1U,



};


typedef enum _usdhc_burst_len
{
    kUSDHC_EnBurstLenForINCR = 0x01U,
    kUSDHC_EnBurstLenForINCR4816 = 0x02U,
    kUSDHC_EnBurstLenForINCR4816WRAP = 0x04U,
} usdhc_burst_len_t;


enum
{
    kUSDHC_TransferDataNormal = 0U,
    kUSDHC_TransferDataTuning = 1U,
    kUSDHC_TransferDataBoot = 2U,
    kUSDHC_TransferDataBootcontinous = 3U,
};


typedef uint32_t usdhc_adma1_descriptor_t;


typedef struct _usdhc_adma2_descriptor
{
    uint32_t attribute;
    const uint32_t *address;
} usdhc_adma2_descriptor_t;






typedef struct _usdhc_capability
{
    uint32_t sdVersion;
    uint32_t mmcVersion;
    uint32_t maxBlockLength;
    uint32_t maxBlockCount;
    uint32_t flags;
} usdhc_capability_t;


typedef struct _usdhc_boot_config
{
    uint32_t ackTimeoutCount;
    usdhc_boot_mode_t bootMode;
    uint32_t blockCount;
    size_t blockSize;
    _Bool enableBootAck;
    _Bool enableAutoStopAtBlockGap;
} usdhc_boot_config_t;


typedef struct _usdhc_config
{
    uint32_t dataTimeout;
    usdhc_endian_mode_t endianMode;
    uint8_t readWatermarkLevel;
    uint8_t writeWatermarkLevel;

    uint8_t readBurstLen;
    uint8_t writeBurstLen;

} usdhc_config_t;






typedef struct _usdhc_command
{
    uint32_t index;
    uint32_t argument;
    usdhc_card_command_type_t type;
    usdhc_card_response_type_t responseType;
    uint32_t response[4U];
    uint32_t responseErrorFlags;

    uint32_t flags;
} usdhc_command_t;


typedef struct _usdhc_adma_config
{
    usdhc_dma_mode_t dmaMode;

    usdhc_burst_len_t burstLen;

    uint32_t *admaTable;
    uint32_t admaTableWords;
} usdhc_adma_config_t;






typedef struct _usdhc_scatter_gather_data_list
{
    uint32_t *dataAddr;
    uint32_t dataSize;
    struct _usdhc_scatter_gather_data_list *dataList;
} usdhc_scatter_gather_data_list_t;
# 676 "../../libraries/sdk/drives\\fsl_usdhc.h"
typedef struct _usdhc_scatter_gather_data
{
    _Bool enableAutoCommand12;
    _Bool enableAutoCommand23;
    _Bool enableIgnoreError;

    usdhc_transfer_direction_t dataDirection;
    uint8_t dataType;
    size_t blockSize;

    usdhc_scatter_gather_data_list_t sgData;
} usdhc_scatter_gather_data_t;


typedef struct _usdhc_scatter_gather_transfer
{
    usdhc_scatter_gather_data_t *data;
    usdhc_command_t *command;
} usdhc_scatter_gather_transfer_t;
# 703 "../../libraries/sdk/drives\\fsl_usdhc.h"
typedef struct _usdhc_data
{
    _Bool enableAutoCommand12;
    _Bool enableAutoCommand23;
    _Bool enableIgnoreError;
    uint8_t dataType;
    size_t blockSize;
    uint32_t blockCount;
    uint32_t *rxData;
    const uint32_t *txData;
} usdhc_data_t;


typedef struct _usdhc_transfer
{
    usdhc_data_t *data;
    usdhc_command_t *command;
} usdhc_transfer_t;


typedef struct _usdhc_handle usdhc_handle_t;


typedef struct _usdhc_transfer_callback
{
    void (*CardInserted)(USDHC_Type *base,
                         void *userData);
    void (*CardRemoved)(USDHC_Type *base, void *userData);
    void (*SdioInterrupt)(USDHC_Type *base, void *userData);
    void (*BlockGap)(USDHC_Type *base, void *userData);
    void (*TransferComplete)(USDHC_Type *base,
                             usdhc_handle_t *handle,
                             status_t status,
                             void *userData);
    void (*ReTuning)(USDHC_Type *base, void *userData);
} usdhc_transfer_callback_t;
# 747 "../../libraries/sdk/drives\\fsl_usdhc.h"
struct _usdhc_handle
{



    usdhc_data_t *volatile data;

    usdhc_command_t *volatile command;

    volatile uint32_t transferredWords;

    usdhc_transfer_callback_t callback;
    void *userData;
};


typedef status_t (*usdhc_transfer_function_t)(USDHC_Type *base, usdhc_transfer_t *content);


typedef struct _usdhc_host
{
    USDHC_Type *base;
    uint32_t sourceClock_Hz;
    usdhc_config_t config;
    usdhc_capability_t capability;
    usdhc_transfer_function_t transfer;
} usdhc_host_t;
# 807 "../../libraries/sdk/drives\\fsl_usdhc.h"
void USDHC_Init(USDHC_Type *base, const usdhc_config_t *config);






void USDHC_Deinit(USDHC_Type *base);
# 825 "../../libraries/sdk/drives\\fsl_usdhc.h"
_Bool USDHC_Reset(USDHC_Type *base, uint32_t mask, uint32_t timeout);
# 845 "../../libraries/sdk/drives\\fsl_usdhc.h"
status_t USDHC_SetAdmaTableConfig(USDHC_Type *base,
                                  usdhc_adma_config_t *dmaConfig,
                                  usdhc_data_t *dataConfig,
                                  uint32_t flags);
# 861 "../../libraries/sdk/drives\\fsl_usdhc.h"
status_t USDHC_SetInternalDmaConfig(USDHC_Type *base,
                                    usdhc_adma_config_t *dmaConfig,
                                    const uint32_t *dataAddr,
                                    _Bool enAutoCmd23);
# 878 "../../libraries/sdk/drives\\fsl_usdhc.h"
status_t USDHC_SetADMA2Descriptor(
    uint32_t *admaTable, uint32_t admaTableWords, const uint32_t *dataBufferAddr, uint32_t dataBytes, uint32_t flags);
# 893 "../../libraries/sdk/drives\\fsl_usdhc.h"
status_t USDHC_SetADMA1Descriptor(
    uint32_t *admaTable, uint32_t admaTableWords, const uint32_t *dataBufferAddr, uint32_t dataBytes, uint32_t flags);







static inline void USDHC_EnableInternalDMA(USDHC_Type *base, _Bool enable)
{
    if (enable)
    {
        base->MIX_CTRL |= (0x1U);
    }
    else
    {
        base->MIX_CTRL &= ~(0x1U);
        base->PROT_CTRL &= ~(0x300U);
    }
}
# 928 "../../libraries/sdk/drives\\fsl_usdhc.h"
static inline void USDHC_EnableInterruptStatus(USDHC_Type *base, uint32_t mask)
{
    base->INT_STATUS_EN |= mask;
}







static inline void USDHC_DisableInterruptStatus(USDHC_Type *base, uint32_t mask)
{
    base->INT_STATUS_EN &= ~mask;
}







static inline void USDHC_EnableInterruptSignal(USDHC_Type *base, uint32_t mask)
{
    base->INT_SIGNAL_EN |= mask;
}







static inline void USDHC_DisableInterruptSignal(USDHC_Type *base, uint32_t mask)
{
    base->INT_SIGNAL_EN &= ~mask;
}
# 979 "../../libraries/sdk/drives\\fsl_usdhc.h"
static inline uint32_t USDHC_GetEnabledInterruptStatusFlags(USDHC_Type *base)
{
    uint32_t intStatus = base->INT_STATUS;

    return intStatus & base->INT_SIGNAL_EN;
}







static inline uint32_t USDHC_GetInterruptStatusFlags(USDHC_Type *base)
{
    return base->INT_STATUS;
}







static inline void USDHC_ClearInterruptStatusFlags(USDHC_Type *base, uint32_t mask)
{
    base->INT_STATUS = mask;
}







static inline uint32_t USDHC_GetAutoCommand12ErrorStatusFlags(USDHC_Type *base)
{
    return base->AUTOCMD12_ERR_STATUS;
}







static inline uint32_t USDHC_GetAdmaErrorStatusFlags(USDHC_Type *base)
{
    return base->ADMA_ERR_STATUS & 0xFUL;
}
# 1038 "../../libraries/sdk/drives\\fsl_usdhc.h"
static inline uint32_t USDHC_GetPresentStatusFlags(USDHC_Type *base)
{
    return base->PRES_STATE;
}
# 1056 "../../libraries/sdk/drives\\fsl_usdhc.h"
void USDHC_GetCapability(USDHC_Type *base, usdhc_capability_t *capability);







static inline void USDHC_ForceClockOn(USDHC_Type *base, _Bool enable)
{
    if (enable)
    {
        base->VEND_SPEC |= (0x100U);
    }
    else
    {
        base->VEND_SPEC &= ~(0x100U);
    }
}
# 1085 "../../libraries/sdk/drives\\fsl_usdhc.h"
uint32_t USDHC_SetSdClock(USDHC_Type *base, uint32_t srcClock_Hz, uint32_t busClock_Hz);
# 1098 "../../libraries/sdk/drives\\fsl_usdhc.h"
_Bool USDHC_SetCardActive(USDHC_Type *base, uint32_t timeout);







static inline void USDHC_AssertHardwareReset(USDHC_Type *base, _Bool high)
{
    if (high)
    {
        base->SYS_CTRL |= (0x800000U);
    }
    else
    {
        base->SYS_CTRL &= ~(0x800000U);
    }
}







static inline void USDHC_SetDataBusWidth(USDHC_Type *base, usdhc_data_bus_width_t width)
{
    base->PROT_CTRL = ((base->PROT_CTRL & ~(0x6U)) | (((uint32_t)(((uint32_t)(width)) << (1U))) & (0x6U)));
}
# 1137 "../../libraries/sdk/drives\\fsl_usdhc.h"
static inline void USDHC_WriteData(USDHC_Type *base, uint32_t data)
{
    base->DATA_BUFF_ACC_PORT = data;
}
# 1150 "../../libraries/sdk/drives\\fsl_usdhc.h"
static inline uint32_t USDHC_ReadData(USDHC_Type *base)
{
    return base->DATA_BUFF_ACC_PORT;
}







void USDHC_SendCommand(USDHC_Type *base, usdhc_command_t *command);
# 1170 "../../libraries/sdk/drives\\fsl_usdhc.h"
static inline void USDHC_EnableWakeupEvent(USDHC_Type *base, uint32_t mask, _Bool enable)
{
    if (enable)
    {
        base->PROT_CTRL |= mask;
    }
    else
    {
        base->PROT_CTRL &= ~mask;
    }
}







static inline void USDHC_CardDetectByData3(USDHC_Type *base, _Bool enable)
{
    if (enable)
    {
        base->PROT_CTRL |= (0x8U);
    }
    else
    {
        base->PROT_CTRL &= ~(0x8U);
    }
}






static inline _Bool USDHC_DetectCardInsert(USDHC_Type *base)
{
    return ((base->PRES_STATE & (uint32_t)kUSDHC_CardInsertedFlag) != 0UL) ? 1 : 0;
}
# 1217 "../../libraries/sdk/drives\\fsl_usdhc.h"
static inline void USDHC_EnableSdioControl(USDHC_Type *base, uint32_t mask, _Bool enable)
{
    if (enable)
    {
        base->PROT_CTRL |= mask;
    }
    else
    {
        base->PROT_CTRL &= ~mask;
    }
}






static inline void USDHC_SetContinueRequest(USDHC_Type *base)
{
    base->PROT_CTRL |= (0x20000U);
}







static inline void USDHC_RequestStopAtBlockGap(USDHC_Type *base, _Bool enable)
{
    if (enable)
    {
        base->PROT_CTRL |= (0x10000U);
    }
    else
    {
        base->PROT_CTRL &= ~(0x10000U);
    }
}
# 1275 "../../libraries/sdk/drives\\fsl_usdhc.h"
void USDHC_SetMmcBootConfig(USDHC_Type *base, const usdhc_boot_config_t *config);







static inline void USDHC_EnableMmcBoot(USDHC_Type *base, _Bool enable)
{
    if (enable)
    {
        base->MMC_BOOT |= (0x40U);
    }
    else
    {
        base->MMC_BOOT &= ~(0x40U);
    }
}







static inline void USDHC_SetForceEvent(USDHC_Type *base, uint32_t mask)
{
    base->FORCE_EVENT = mask;
}







static inline void UDSHC_SelectVoltage(USDHC_Type *base, _Bool en18v)
{
    if (en18v)
    {
        base->VEND_SPEC |= (0x2U);
    }
    else
    {
        base->VEND_SPEC &= ~(0x2U);
    }
}







static inline _Bool USDHC_RequestTuningForSDR50(USDHC_Type *base)
{
    return ((base->HOST_CTRL_CAP & (0x2000U)) != 0UL) ? 1 : 0;
}






static inline _Bool USDHC_RequestReTuning(USDHC_Type *base)
{
    return ((base->PRES_STATE & (0x1000U)) != 0UL) ? 1 : 0;
}
# 1352 "../../libraries/sdk/drives\\fsl_usdhc.h"
static inline void USDHC_EnableAutoTuning(USDHC_Type *base, _Bool enable)
{
    if (enable)
    {
        base->MIX_CTRL |= (0x1000000U);
    }
    else
    {
        base->MIX_CTRL &= ~(0x1000000U);
    }
}
# 1384 "../../libraries/sdk/drives\\fsl_usdhc.h"
void USDHC_EnableAutoTuningForCmdAndData(USDHC_Type *base);
# 1394 "../../libraries/sdk/drives\\fsl_usdhc.h"
void USDHC_EnableManualTuning(USDHC_Type *base, _Bool enable);







static inline uint32_t USDHC_GetTuningDelayStatus(USDHC_Type *base)
{
    return base->CLK_TUNE_CTRL_STATUS >> 16U;
}
# 1417 "../../libraries/sdk/drives\\fsl_usdhc.h"
status_t USDHC_SetTuningDelay(USDHC_Type *base, uint32_t preDelay, uint32_t outDelay, uint32_t postDelay);
# 1427 "../../libraries/sdk/drives\\fsl_usdhc.h"
status_t USDHC_AdjustDelayForManualTuning(USDHC_Type *base, uint32_t delay);
# 1436 "../../libraries/sdk/drives\\fsl_usdhc.h"
static inline void USDHC_SetStandardTuningCounter(USDHC_Type *base, uint8_t counter)
{
    base->TUNING_CTRL =
        (base->TUNING_CTRL & (~(0xFF00U))) | (((uint32_t)(((uint32_t)(counter)) << (8U))) & (0xFF00U));
}
# 1452 "../../libraries/sdk/drives\\fsl_usdhc.h"
void USDHC_EnableStandardTuning(USDHC_Type *base, uint32_t tuningStartTap, uint32_t step, _Bool enable);






static inline uint32_t USDHC_GetExecuteStdTuningStatus(USDHC_Type *base)
{
    return (base->AUTOCMD12_ERR_STATUS & (0x400000U));
}






static inline uint32_t USDHC_CheckStdTuningResult(USDHC_Type *base)
{
    return (base->AUTOCMD12_ERR_STATUS & (0x800000U));
}






static inline uint32_t USDHC_CheckTuningError(USDHC_Type *base)
{
    return (base->CLK_TUNE_CTRL_STATUS &
            ((0x8000U) | (0x80000000U)));
}
# 1493 "../../libraries/sdk/drives\\fsl_usdhc.h"
void USDHC_EnableDDRMode(USDHC_Type *base, _Bool enable, uint32_t nibblePos);
# 1588 "../../libraries/sdk/drives\\fsl_usdhc.h"
void USDHC_SetDataConfig(USDHC_Type *base,
                         usdhc_transfer_direction_t dataDirection,
                         uint32_t blockCount,
                         uint32_t blockSize);
# 1607 "../../libraries/sdk/drives\\fsl_usdhc.h"
void USDHC_TransferCreateHandle(USDHC_Type *base,
                                usdhc_handle_t *handle,
                                const usdhc_transfer_callback_t *callback,
                                void *userData);
# 1657 "../../libraries/sdk/drives\\fsl_usdhc.h"
status_t USDHC_TransferNonBlocking(USDHC_Type *base,
                                   usdhc_handle_t *handle,
                                   usdhc_adma_config_t *dmaConfig,
                                   usdhc_transfer_t *transfer);
# 1682 "../../libraries/sdk/drives\\fsl_usdhc.h"
status_t USDHC_TransferBlocking(USDHC_Type *base, usdhc_adma_config_t *dmaConfig, usdhc_transfer_t *transfer);
# 1692 "../../libraries/sdk/drives\\fsl_usdhc.h"
void USDHC_TransferHandleIRQ(USDHC_Type *base, usdhc_handle_t *handle);
# 15 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h" 2
# 38 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h"
enum
{
    kSDMMCHOST_SupportHighSpeed = 1U << 0U,
    kSDMMCHOST_SupportSuspendResume = 1U << 1U,
    kSDMMCHOST_SupportVoltage3v3 = 1U << 2U,
    kSDMMCHOST_SupportVoltage3v0 = 1U << 3U,
    kSDMMCHOST_SupportVoltage1v8 = 1U << 4U,
    kSDMMCHOST_SupportVoltage1v2 = 1U << 5U,
    kSDMMCHOST_Support4BitDataWidth = 1U << 6U,
    kSDMMCHOST_Support8BitDataWidth = 1U << 7U,
    kSDMMCHOST_SupportDDRMode = 1U << 8U,
    kSDMMCHOST_SupportDetectCardByData3 = 1U << 9U,
    kSDMMCHOST_SupportDetectCardByCD = 1U << 10U,
    kSDMMCHOST_SupportAutoCmd12 = 1U << 11U,
    kSDMMCHOST_SupportSDR104 = 1U << 12U,
    kSDMMCHOST_SupportSDR50 = 1U << 13U,
    kSDMMCHOST_SupportHS200 = 1U << 14U,
    kSDMMCHOST_SupportHS400 = 1U << 15U,
};
# 139 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h"
typedef usdhc_transfer_t sdmmchost_transfer_t;
typedef usdhc_command_t sdmmchost_cmd_t;
typedef usdhc_data_t sdmmchost_data_t;
typedef struct _sdmmchost_ SDMMCHOST_CONFIG;
typedef USDHC_Type SDMMCHOST_TYPE;
typedef void sdmmchost_detect_card_t;
typedef usdhc_boot_config_t sdmmchost_boot_config_t;




enum
{
    kSDMMCHOST_EndianModeBig = 0U,
    kSDMMCHOST_EndianModeHalfWordBig = 1U,
    kSDMMCHOST_EndianModeLittle = 2U,
};




enum
{
    kSDMMCHOST_StandardTuning = 0U,
    kSDMMCHOST_ManualTuning = 1U,
};




enum
{
    kSDMMCHOST_NoCacheControl = 0U,
    kSDMMCHOST_CacheControlRWBuffer = 1U,
};


typedef struct _sdmmchost_
{
    usdhc_host_t hostController;
    void *dmaDesBuffer;
    uint32_t dmaDesBufferWordsNum;
    usdhc_handle_t handle;
    uint32_t capability;
    uint32_t maxBlockCount;
    uint32_t maxBlockSize;

    uint8_t tuningType;

    sdmmc_osa_event_t hostEvent;
    void *cd;
    void *cardInt;


    uint8_t enableCacheControl;
# 204 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h"
    sdmmc_osa_mutex_t lock;
} sdmmchost_t;
# 224 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h"
void SDMMCHOST_SetCardBusWidth(sdmmchost_t *host, uint32_t dataBusWidth);





static inline void SDMMCHOST_SendCardActive(sdmmchost_t *host)
{
    (void)USDHC_SetCardActive(host->hostController.base, 100U);
}







static inline uint32_t SDMMCHOST_SetCardClock(sdmmchost_t *host, uint32_t targetClock)
{
    return USDHC_SetSdClock(host->hostController.base, host->hostController.sourceClock_Hz, targetClock);
}






static inline _Bool SDMMCHOST_IsCardBusy(sdmmchost_t *host)
{
    return (USDHC_GetPresentStatusFlags(host->hostController.base) & (uint32_t)kUSDHC_Data0LineLevelFlag) ==
                   (uint32_t)kUSDHC_Data0LineLevelFlag ?
               0 :
               1;
}






static inline uint32_t SDMMCHOST_GetSignalLineStatus(sdmmchost_t *host, uint32_t signalLine)
{
    return (USDHC_GetPresentStatusFlags(host->hostController.base) >> (23U)) & signalLine;
}





static inline void SDMMCHOST_EnableCardInt(sdmmchost_t *host, _Bool enable)
{
    if (enable)
    {
        USDHC_EnableInterruptStatus(host->hostController.base, kUSDHC_CardInterruptFlag);
        USDHC_EnableInterruptSignal(host->hostController.base, kUSDHC_CardInterruptFlag);
    }
    else
    {
        USDHC_DisableInterruptStatus(host->hostController.base, kUSDHC_CardInterruptFlag);
        USDHC_DisableInterruptSignal(host->hostController.base, kUSDHC_CardInterruptFlag);
    }
}
# 295 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h"
static inline void SDMMCHOST_EnableDDRMode(sdmmchost_t *host, _Bool enable, uint32_t nibblePos)
{
    USDHC_EnableDDRMode(host->hostController.base, enable, nibblePos);
}






static inline void SDMMCHOST_EnableHS400Mode(sdmmchost_t *host, _Bool enable)
{





}






static inline void SDMMCHOST_EnableStrobeDll(sdmmchost_t *host, _Bool enable)
{
# 333 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h"
}
# 342 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h"
status_t SDMMCHOST_StartBoot(sdmmchost_t *host,
                             sdmmchost_boot_config_t *hostConfig,
                             sdmmchost_cmd_t *cmd,
                             uint8_t *buffer);







status_t SDMMCHOST_ReadBootData(sdmmchost_t *host, sdmmchost_boot_config_t *hostConfig, uint8_t *buffer);






static inline void SDMMCHOST_EnableBoot(sdmmchost_t *host, _Bool enable)
{
    USDHC_EnableMmcBoot(host->hostController.base, enable);
}






status_t SDMMCHOST_CardIntInit(sdmmchost_t *host, void *sdioInt);






static inline void SDMMCHOST_ForceClockOn(sdmmchost_t *host, _Bool enable)
{
    USDHC_ForceClockOn(host->hostController.base, enable);
}






void SDMMCHOST_SwitchToVoltage(sdmmchost_t *host, uint32_t voltage);






status_t SDMMCHOST_CardDetectInit(sdmmchost_t *host, void *cd);
# 404 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h"
status_t SDMMCHOST_PollingCardDetectStatus(sdmmchost_t *host, uint32_t waitCardStatus, uint32_t timeout);






uint32_t SDMMCHOST_CardDetectStatus(sdmmchost_t *host);
# 427 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h"
status_t SDMMCHOST_Init(sdmmchost_t *host);







void SDMMCHOST_Deinit(sdmmchost_t *host);






void SDMMCHOST_SetCardPower(sdmmchost_t *host, _Bool enable);
# 473 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h"
status_t SDMMCHOST_TransferFunction(sdmmchost_t *host, sdmmchost_transfer_t *content);
# 483 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h"
status_t SDMMCHOST_ExecuteTuning(sdmmchost_t *host, uint32_t tuningCmd, uint32_t *revBuf, uint32_t blockSize);






void SDMMCHOST_Reset(sdmmchost_t *host);
# 500 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h"
void SDMMCHOST_ConvertDataToLittleEndian(sdmmchost_t *host, uint32_t *data, uint32_t wordSize, uint32_t format);
# 14 "../../libraries/components/sdmmc/common\\fsl_sdmmc_common.h" 2
# 1 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h" 1
# 50 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
enum
{
    kSDMMC_R1OutOfRangeFlag = 31,
    kSDMMC_R1AddressErrorFlag = 30,
    kSDMMC_R1BlockLengthErrorFlag = 29,
    kSDMMC_R1EraseSequenceErrorFlag = 28,
    kSDMMC_R1EraseParameterErrorFlag = 27,
    kSDMMC_R1WriteProtectViolationFlag = 26,
    kSDMMC_R1CardIsLockedFlag = 25,
    kSDMMC_R1LockUnlockFailedFlag = 24,
    kSDMMC_R1CommandCrcErrorFlag = 23,
    kSDMMC_R1IllegalCommandFlag = 22,
    kSDMMC_R1CardEccFailedFlag = 21,
    kSDMMC_R1CardControllerErrorFlag = 20,
    kSDMMC_R1ErrorFlag = 19,
    kSDMMC_R1CidCsdOverwriteFlag = 16,
    kSDMMC_R1WriteProtectEraseSkipFlag = 15,
    kSDMMC_R1CardEccDisabledFlag = 14,
    kSDMMC_R1EraseResetFlag = 13,
    kSDMMC_R1ReadyForDataFlag = 8,
    kSDMMC_R1SwitchErrorFlag = 7,
    kSDMMC_R1ApplicationCommandFlag = 5,
    kSDMMC_R1AuthenticationSequenceErrorFlag = 3,
};
# 90 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
typedef enum _sdmmc_r1_current_state
{
    kSDMMC_R1StateIdle = 0U,
    kSDMMC_R1StateReady = 1U,
    kSDMMC_R1StateIdentify = 2U,
    kSDMMC_R1StateStandby = 3U,
    kSDMMC_R1StateTransfer = 4U,
    kSDMMC_R1StateSendData = 5U,
    kSDMMC_R1StateReceiveData = 6U,
    kSDMMC_R1StateProgram = 7U,
    kSDMMC_R1StateDisconnect = 8U,
} sdmmc_r1_current_state_t;




enum
{
    kSDSPI_R1InIdleStateFlag = (1U << 0U),
    kSDSPI_R1EraseResetFlag = (1U << 1U),
    kSDSPI_R1IllegalCommandFlag = (1U << 2U),
    kSDSPI_R1CommandCrcErrorFlag = (1U << 3U),
    kSDSPI_R1EraseSequenceErrorFlag = (1U << 4U),
    kSDSPI_R1AddressErrorFlag = (1U << 5U),
    kSDSPI_R1ParameterErrorFlag = (1U << 6U),
};




enum
{
    kSDSPI_R2CardLockedFlag = (1U << 0U),
    kSDSPI_R2WriteProtectEraseSkip = (1U << 1U),
    kSDSPI_R2LockUnlockFailed = (1U << 1U),
    kSDSPI_R2ErrorFlag = (1U << 2U),
    kSDSPI_R2CardControllerErrorFlag = (1U << 3U),
    kSDSPI_R2CardEccFailedFlag = (1U << 4U),
    kSDSPI_R2WriteProtectViolationFlag = (1U << 5U),
    kSDSPI_R2EraseParameterErrorFlag = (1U << 6U),
    kSDSPI_R2OutOfRangeFlag = (1U << 7U),
    kSDSPI_R2CsdOverwriteFlag = (1U << 7U),
};
# 154 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
enum
{
    kSDSPI_DataErrorTokenError = (1U << 0U),
    kSDSPI_DataErrorTokenCardControllerError = (1U << 1U),
    kSDSPI_DataErrorTokenCardEccFailed = (1U << 2U),
    kSDSPI_DataErrorTokenOutOfRange = (1U << 3U),
};


typedef enum _sdspi_data_token
{
    kSDSPI_DataTokenBlockRead = 0xFEU,
    kSDSPI_DataTokenSingleBlockWrite = 0xFEU,
    kSDSPI_DataTokenMultipleBlockWrite = 0xFCU,
    kSDSPI_DataTokenStopTransfer = 0xFDU,
} sdspi_data_token_t;




typedef enum _sdspi_data_response_token
{
    kSDSPI_DataResponseTokenAccepted = 0x05U,
    kSDSPI_DataResponseTokenCrcError = 0x0BU,
    kSDSPI_DataResponseTokenWriteError = 0x0DU,
} sdspi_data_response_token_t;


typedef enum _sd_command
{
    kSD_SendRelativeAddress = 3U,
    kSD_Switch = 6U,
    kSD_SendInterfaceCondition = 8U,
    kSD_VoltageSwitch = 11U,
    kSD_SpeedClassControl = 20U,
    kSD_EraseWriteBlockStart = 32U,
    kSD_EraseWriteBlockEnd = 33U,
    kSD_SendTuningBlock = 19U,
} sd_command_t;


typedef enum _sdspi_command
{
    kSDSPI_CommandCrc = 59U,
} sdspi_command_t;


typedef enum _sd_application_command
{
    kSD_ApplicationSetBusWdith = 6U,
    kSD_ApplicationStatus = 13U,
    kSD_ApplicationSendNumberWriteBlocks = 22U,
    kSD_ApplicationSetWriteBlockEraseCount = 23U,
    kSD_ApplicationSendOperationCondition = 41U,
    kSD_ApplicationSetClearCardDetect = 42U,
    kSD_ApplicationSendScr = 51U,
} sd_application_command_t;




enum
{
    kSDMMC_CommandClassBasic = (1U << 0U),
    kSDMMC_CommandClassBlockRead = (1U << 2U),
    kSDMMC_CommandClassBlockWrite = (1U << 4U),
    kSDMMC_CommandClassErase = (1U << 5U),
    kSDMMC_CommandClassWriteProtect = (1U << 6U),
    kSDMMC_CommandClassLockCard = (1U << 7U),
    kSDMMC_CommandClassApplicationSpecific = (1U << 8U),
    kSDMMC_CommandClassInputOutputMode = (1U << 9U),
    kSDMMC_CommandClassSwitch = (1U << 10U),
};




enum
{
    kSD_OcrPowerUpBusyFlag = 31,
    kSD_OcrHostCapacitySupportFlag = 30,
    kSD_OcrCardCapacitySupportFlag = kSD_OcrHostCapacitySupportFlag,
    kSD_OcrSwitch18RequestFlag = 24,
    kSD_OcrSwitch18AcceptFlag = kSD_OcrSwitch18RequestFlag,
    kSD_OcrVdd27_28Flag = 15,
    kSD_OcrVdd28_29Flag = 16,
    kSD_OcrVdd29_30Flag = 17,
    kSD_OcrVdd30_31Flag = 18,
    kSD_OcrVdd31_32Flag = 19,
    kSD_OcrVdd32_33Flag = 20,
    kSD_OcrVdd33_34Flag = 21,
    kSD_OcrVdd34_35Flag = 22,
    kSD_OcrVdd35_36Flag = 23,
};




enum
{
    kSD_SpecificationVersion1_0 = (1U << 0U),
    kSD_SpecificationVersion1_1 = (1U << 1U),
    kSD_SpecificationVersion2_0 = (1U << 2U),
    kSD_SpecificationVersion3_0 = (1U << 3U),
};


typedef enum _sd_switch_mode
{
    kSD_SwitchCheck = 0U,
    kSD_SwitchSet = 1U,
} sd_switch_mode_t;




enum
{
    kSD_CsdReadBlockPartialFlag = (1U << 0U),
    kSD_CsdWriteBlockMisalignFlag = (1U << 1U),
    kSD_CsdReadBlockMisalignFlag = (1U << 2U),
    kSD_CsdDsrImplementedFlag = (1U << 3U),
    kSD_CsdEraseBlockEnabledFlag = (1U << 4U),
    kSD_CsdWriteProtectGroupEnabledFlag = (1U << 5U),
    kSD_CsdWriteBlockPartialFlag = (1U << 6U),
    kSD_CsdFileFormatGroupFlag = (1U << 7U),
    kSD_CsdCopyFlag = (1U << 8U),
    kSD_CsdPermanentWriteProtectFlag = (1U << 9U),
    kSD_CsdTemporaryWriteProtectFlag = (1U << 10U),
};




enum
{
    kSD_ScrDataStatusAfterErase = (1U << 0U),
    kSD_ScrSdSpecification3 = (1U << 1U),
};




enum
{
    kSD_FunctionSDR12Deafult = 0U,
    kSD_FunctionSDR25HighSpeed = 1U,
    kSD_FunctionSDR50 = 2U,
    kSD_FunctionSDR104 = 3U,
    kSD_FunctionDDR50 = 4U,
};




enum
{
    kSD_GroupTimingMode = 0U,
    kSD_GroupCommandSystem = 1U,
    kSD_GroupDriverStrength = 2U,
    kSD_GroupCurrentLimit = 3U,
};


typedef enum _sd_timing_mode
{
    kSD_TimingSDR12DefaultMode = 0U,
    kSD_TimingSDR25HighSpeedMode = 1U,
    kSD_TimingSDR50Mode = 2U,
    kSD_TimingSDR104Mode = 3U,
    kSD_TimingDDR50Mode = 4U,
} sd_timing_mode_t;


typedef enum _sd_driver_strength
{
    kSD_DriverStrengthTypeB = 0U,
    kSD_DriverStrengthTypeA = 1U,
    kSD_DriverStrengthTypeC = 2U,
    kSD_DriverStrengthTypeD = 3U,
} sd_driver_strength_t;


typedef enum _sd_max_current
{
    kSD_CurrentLimit200MA = 0U,
    kSD_CurrentLimit400MA = 1U,
    kSD_CurrentLimit600MA = 2U,
    kSD_CurrentLimit800MA = 3U,
} sd_max_current_t;


typedef enum _sdmmc_command
{
    kSDMMC_GoIdleState = 0U,
    kSDMMC_AllSendCid = 2U,
    kSDMMC_SetDsr = 4U,
    kSDMMC_SelectCard = 7U,
    kSDMMC_SendCsd = 9U,
    kSDMMC_SendCid = 10U,
    kSDMMC_StopTransmission = 12U,
    kSDMMC_SendStatus = 13U,
    kSDMMC_GoInactiveState = 15U,
    kSDMMC_SetBlockLength = 16U,
    kSDMMC_ReadSingleBlock = 17U,
    kSDMMC_ReadMultipleBlock = 18U,
    kSDMMC_SetBlockCount = 23U,
    kSDMMC_WriteSingleBlock = 24U,
    kSDMMC_WriteMultipleBlock = 25U,
    kSDMMC_ProgramCsd = 27U,
    kSDMMC_SetWriteProtect = 28U,
    kSDMMC_ClearWriteProtect = 29U,
    kSDMMC_SendWriteProtect = 30U,
    kSDMMC_Erase = 38U,
    kSDMMC_LockUnlock = 42U,
    kSDMMC_ApplicationCommand = 55U,
    kSDMMC_GeneralCommand = 56U,
    kSDMMC_ReadOcr = 58U,
} sdmmc_command_t;
# 383 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
enum
{
    kSDIO_RegCCCRSdioVer = 0x00U,
    kSDIO_RegSDVersion = 0x01U,
    kSDIO_RegIOEnable = 0x02U,
    kSDIO_RegIOReady = 0x03U,
    kSDIO_RegIOIntEnable = 0x04U,
    kSDIO_RegIOIntPending = 0x05U,
    kSDIO_RegIOAbort = 0x06U,
    kSDIO_RegBusInterface = 0x07U,
    kSDIO_RegCardCapability = 0x08U,
    kSDIO_RegCommonCISPointer = 0x09U,
    kSDIO_RegBusSuspend = 0x0C,
    kSDIO_RegFunctionSelect = 0x0DU,
    kSDIO_RegExecutionFlag = 0x0EU,
    kSDIO_RegReadyFlag = 0x0FU,
    kSDIO_RegFN0BlockSizeLow = 0x10U,
    kSDIO_RegFN0BlockSizeHigh = 0x11U,
    kSDIO_RegPowerControl = 0x12U,
    kSDIO_RegBusSpeed = 0x13U,
    kSDIO_RegUHSITimingSupport = 0x14U,
    kSDIO_RegDriverStrength = 0x15U,
    kSDIO_RegInterruptExtension = 0x16U,
};


typedef enum _sdio_command
{
    kSDIO_SendRelativeAddress = 3U,
    kSDIO_SendOperationCondition = 5U,
    kSDIO_SendInterfaceCondition = 8U,
    kSDIO_RWIODirect = 52U,
    kSDIO_RWIOExtended = 53U,
} sdio_command_t;


typedef enum _sdio_func_num
{
    kSDIO_FunctionNum0,
    kSDIO_FunctionNum1,
    kSDIO_FunctionNum2,
    kSDIO_FunctionNum3,
    kSDIO_FunctionNum4,
    kSDIO_FunctionNum5,
    kSDIO_FunctionNum6,
    kSDIO_FunctionNum7,
    kSDIO_FunctionMemory,
} sdio_func_num_t;
# 453 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
enum
{
    kSDIO_StatusCmdCRCError = 0x8000U,
    kSDIO_StatusIllegalCmd = 0x4000U,
    kSDIO_StatusR6Error = 0x2000U,
    kSDIO_StatusError = 0x0800U,
    kSDIO_StatusFunctionNumError = 0x0200U,
    kSDIO_StatusOutofRange = 0x0100U,
};




enum
{
    kSDIO_OcrPowerUpBusyFlag = 31,
    kSDIO_OcrIONumber = 28,
    kSDIO_OcrMemPresent = 27,

    kSDIO_OcrVdd20_21Flag = 8,
    kSDIO_OcrVdd21_22Flag = 9,
    kSDIO_OcrVdd22_23Flag = 10,
    kSDIO_OcrVdd23_24Flag = 11,
    kSDIO_OcrVdd24_25Flag = 12,
    kSDIO_OcrVdd25_26Flag = 13,
    kSDIO_OcrVdd26_27Flag = 14,
    kSDIO_OcrVdd27_28Flag = 15,
    kSDIO_OcrVdd28_29Flag = 16,
    kSDIO_OcrVdd29_30Flag = 17,
    kSDIO_OcrVdd30_31Flag = 18,
    kSDIO_OcrVdd31_32Flag = 19,
    kSDIO_OcrVdd32_33Flag = 20,
    kSDIO_OcrVdd33_34Flag = 21,
    kSDIO_OcrVdd34_35Flag = 22,
    kSDIO_OcrVdd35_36Flag = 23,
};
# 498 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
enum
{
    kSDIO_CCCRSupportDirectCmdDuringDataTrans = (1UL << 0U),
    kSDIO_CCCRSupportMultiBlock = (1UL << 1U),
    kSDIO_CCCRSupportReadWait = (1UL << 2U),
    kSDIO_CCCRSupportSuspendResume = (1UL << 3U),
    kSDIO_CCCRSupportIntDuring4BitDataTrans = (1UL << 4U),
    kSDIO_CCCRSupportLowSpeed1Bit = (1UL << 6U),
    kSDIO_CCCRSupportLowSpeed4Bit = (1UL << 7U),
    kSDIO_CCCRSupportMasterPowerControl = (1UL << 8U),
    kSDIO_CCCRSupportHighSpeed = (1UL << 9U),
    kSDIO_CCCRSupportContinuousSPIInt = (1UL << 10U),
};
# 544 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
enum
{
    kSDIO_FBRSupportCSA = (1U << 0U),
    kSDIO_FBRSupportPowerSelection = (1U << 1U),
};


typedef enum _sdio_bus_width
{
    kSDIO_DataBus1Bit = 0x00U,
    kSDIO_DataBus4Bit = 0X02U,
    kSDIO_DataBus8Bit = 0X03U,
} sdio_bus_width_t;


typedef enum _mmc_command
{
    kMMC_SendOperationCondition = 1U,
    kMMC_SetRelativeAddress = 3U,
    kMMC_SleepAwake = 5U,
    kMMC_Switch = 6U,
    kMMC_SendExtendedCsd = 8U,
    kMMC_ReadDataUntilStop = 11U,
    kMMC_BusTestRead = 14U,
    kMMC_SendingBusTest = 19U,
    kMMC_WriteDataUntilStop = 20U,
    kMMC_SendTuningBlock = 21U,
    kMMC_ProgramCid = 26U,
    kMMC_EraseGroupStart = 35U,
    kMMC_EraseGroupEnd = 36U,
    kMMC_FastInputOutput = 39U,
    kMMC_GoInterruptState = 40U,
} mmc_command_t;


typedef enum _mmc_classified_voltage
{
    kMMC_ClassifiedVoltageHigh = 0U,
    kMMC_ClassifiedVoltageDual = 1U,
} mmc_classified_voltage_t;


typedef enum _mmc_classified_density
{
    kMMC_ClassifiedDensityWithin2GB = 0U,
    kMMC_ClassifiedDensityHigher2GB = 1U,
} mmc_classified_density_t;
# 614 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
typedef enum _mmc_access_mode
{
    kMMC_AccessModeByte = 0U,
    kMMC_AccessModeSector = 2U,
} mmc_access_mode_t;


typedef enum _mmc_voltage_window
{
    kMMC_VoltageWindowNone = 0U,
    kMMC_VoltageWindow120 = 0x01U,
    kMMC_VoltageWindow170to195 = 0x02U,
    kMMC_VoltageWindows270to360 = 0x1FFU,
} mmc_voltage_window_t;


typedef enum _mmc_csd_structure_version
{
    kMMC_CsdStrucureVersion10 = 0U,
    kMMC_CsdStrucureVersion11 = 1U,
    kMMC_CsdStrucureVersion12 = 2U,
    kMMC_CsdStrucureVersionInExtcsd = 3U,
} mmc_csd_structure_version_t;


typedef enum _mmc_specification_version
{
    kMMC_SpecificationVersion0 = 0U,
    kMMC_SpecificationVersion1 = 1U,
    kMMC_SpecificationVersion2 = 2U,
    kMMC_SpecificationVersion3 = 3U,
    kMMC_SpecificationVersion4 = 4U,
} mmc_specification_version_t;
# 667 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
enum
{
    kMMC_ExtendedCsdRevision10 = 0U,
    kMMC_ExtendedCsdRevision11 = 1U,
    kMMC_ExtendedCsdRevision12 = 2U,
    kMMC_ExtendedCsdRevision13 = 3U,
    kMMC_ExtendedCsdRevision14 = 4U,
    kMMC_ExtendedCsdRevision15 = 5U,
    kMMC_ExtendedCsdRevision16 = 6U,
    kMMC_ExtendedCsdRevision17 = 7U,
};


typedef enum _mmc_command_set
{
    kMMC_CommandSetStandard = 0U,
    kMMC_CommandSet1 = 1U,
    kMMC_CommandSet2 = 2U,
    kMMC_CommandSet3 = 3U,
    kMMC_CommandSet4 = 4U,
} mmc_command_set_t;




enum
{
    kMMC_SupportAlternateBoot = 1U,
    kMMC_SupportDDRBoot = 2U,
    kMMC_SupportHighSpeedBoot = 4U,
};
# 708 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
typedef enum _mmc_high_speed_timing
{
    kMMC_HighSpeedTimingNone = 0U,
    kMMC_HighSpeedTiming = 1U,
    kMMC_HighSpeed200Timing = 2U,
    kMMC_HighSpeed400Timing = 3U,
    kMMC_EnhanceHighSpeed400Timing = 4U,
} mmc_high_speed_timing_t;




typedef enum _mmc_data_bus_width
{
    kMMC_DataBusWidth1bit = 0U,
    kMMC_DataBusWidth4bit = 1U,
    kMMC_DataBusWidth8bit = 2U,
    kMMC_DataBusWidth4bitDDR = 5U,
    kMMC_DataBusWidth8bitDDR = 6U,
    kMMC_DataBusWidth8bitDDRSTROBE = 0x86U,
} mmc_data_bus_width_t;


typedef enum _mmc_boot_partition_enable
{
    kMMC_BootPartitionEnableNot = 0U,
    kMMC_BootPartitionEnablePartition1 = 1U,
    kMMC_BootPartitionEnablePartition2 = 2U,
    kMMC_BootPartitionEnableUserAera = 7U,
} mmc_boot_partition_enable_t;




typedef enum _mmc_boot_timing_mode
{
    kMMC_BootModeSDRWithDefaultTiming = 0U,
    kMMC_BootModeSDRWithHighSpeedTiming = 1U,
    kMMC_BootModeDDRTiming = 2U,
} mmc_boot_timing_mode_t;






typedef enum _mmc_boot_partition_wp
{
    kMMC_BootPartitionWPDisable = 0x50U,
    kMMC_BootPartitionPwrWPToBothPartition =
        0x01U,
    kMMC_BootPartitionPermWPToBothPartition = 0x04U,

    kMMC_BootPartitionPwrWPToPartition1 = (1U << 7U) | 1U,
    kMMC_BootPartitionPwrWPToPartition2 = (1U << 7U) | 3U,

    kMMC_BootPartitionPermWPToPartition1 =
        (1U << 7U) | (1U << 2U),
    kMMC_BootPartitionPermWPToPartition2 =
        (1U << 7U) | (3U << 2U),

    kMMC_BootPartitionPermWPToPartition1PwrWPToPartition2 =
        (1U << 7U) | (1U << 2U) |
        3U,
    kMMC_BootPartitionPermWPToPartition2PwrWPToPartition1 =
        (1U << 7U) | (3U << 2U) |
        1U,
} mmc_boot_partition_wp_t;




enum
{
    kMMC_BootPartitionNotProtected = 0U,
    kMMC_BootPartitionPwrProtected = 1U,
    kMMC_BootPartitionPermProtected = 2U,
};


typedef enum _mmc_access_partition
{
    kMMC_AccessPartitionUserAera = 0U,
    kMMC_AccessPartitionBoot1 = 1U,
    kMMC_AccessPartitionBoot2 = 2U,
    kMMC_AccessRPMB = 3U,
    kMMC_AccessGeneralPurposePartition1 = 4U,
    kMMC_AccessGeneralPurposePartition2 = 5U,
    kMMC_AccessGeneralPurposePartition3 = 6U,
    kMMC_AccessGeneralPurposePartition4 = 7U,
} mmc_access_partition_t;
# 828 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
enum
{
    kMMC_CsdReadBlockPartialFlag = (1U << 0U),
    kMMC_CsdWriteBlockMisalignFlag = (1U << 1U),
    kMMC_CsdReadBlockMisalignFlag = (1U << 2U),
    kMMC_CsdDsrImplementedFlag = (1U << 3U),
    kMMC_CsdWriteProtectGroupEnabledFlag = (1U << 4U),
    kMMC_CsdWriteBlockPartialFlag = (1U << 5U),
    kMMC_ContentProtectApplicationFlag = (1U << 6U),
    kMMC_CsdFileFormatGroupFlag = (1U << 7U),
    kMMC_CsdCopyFlag = (1U << 8U),
    kMMC_CsdPermanentWriteProtectFlag = (1U << 9U),
    kMMC_CsdTemporaryWriteProtectFlag = (1U << 10U),
};


typedef enum _mmc_extended_csd_access_mode
{
    kMMC_ExtendedCsdAccessModeCommandSet = 0U,
    kMMC_ExtendedCsdAccessModeSetBits = 1U,
    kMMC_ExtendedCsdAccessModeClearBits = 2U,
    kMMC_ExtendedCsdAccessModeWriteBits = 3U,
} mmc_extended_csd_access_mode_t;


typedef enum _mmc_extended_csd_index
{
    kMMC_ExtendedCsdIndexFlushCache = 32U,
    kMMC_ExtendedCsdIndexCacheControl = 33U,
    kMMC_ExtendedCsdIndexBootPartitionWP = 173U,
    kMMC_ExtendedCsdIndexEraseGroupDefinition = 175U,
    kMMC_ExtendedCsdIndexBootBusConditions = 177U,
    kMMC_ExtendedCsdIndexBootConfigWP = 178U,
    kMMC_ExtendedCsdIndexPartitionConfig = 179U,
    kMMC_ExtendedCsdIndexBusWidth = 183U,
    kMMC_ExtendedCsdIndexHighSpeedTiming = 185U,
    kMMC_ExtendedCsdIndexPowerClass = 187U,
    kMMC_ExtendedCsdIndexCommandSet = 191U,
} mmc_extended_csd_index_t;




enum
{
    kMMC_DriverStrength0 = 0U,
    kMMC_DriverStrength1 = 1U,
    kMMC_DriverStrength2 = 2U,
    kMMC_DriverStrength3 = 3U,
    kMMC_DriverStrength4 = 4U,
};


typedef enum _mmc_extended_csd_flags
{
    kMMC_ExtCsdExtPartitionSupport = (1 << 0U),
    kMMC_ExtCsdEnhancePartitionSupport = (1 << 1U),
    kMMC_ExtCsdPartitioningSupport = (1 << 2U),
    kMMC_ExtCsdPrgCIDCSDInDDRModeSupport = (1 << 3U),
    kMMC_ExtCsdBKOpsSupport = (1 << 4U),
    kMMC_ExtCsdDataTagSupport = (1 << 5U),
    kMMC_ExtCsdModeOperationCodeSupport = (1 << 6U),
} mmc_extended_csd_flags_t;


typedef enum _mmc_boot_mode
{
    kMMC_BootModeNormal = 0U,
    kMMC_BootModeAlternative = 1U,
} mmc_boot_mode_t;
# 909 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
typedef struct _sdio_fbr
{
    uint8_t flags;
    uint8_t ioStdFunctionCode;
    uint8_t ioExtFunctionCode;
    uint32_t ioPointerToCIS;
    uint32_t ioPointerToCSA;
    uint16_t ioBlockSize;
} sdio_fbr_t;


typedef struct _sdio_common_cis
{

    uint16_t mID;
    uint16_t mInfo;


    uint8_t funcID;


    uint16_t fn0MaxBlkSize;
    uint8_t maxTransSpeed;

} sdio_common_cis_t;


typedef struct _sdio_func_cis
{

    uint8_t funcID;


    uint8_t funcInfo;
    uint8_t ioVersion;
    uint32_t cardPSN;
    uint32_t ioCSASize;
    uint8_t ioCSAProperty;
    uint16_t ioMaxBlockSize;
    uint32_t ioOCR;
    uint8_t ioOPMinPwr;
    uint8_t ioOPAvgPwr;
    uint8_t ioOPMaxPwr;
    uint8_t ioSBMinPwr;
    uint8_t ioSBAvgPwr;
    uint8_t ioSBMaxPwr;

    uint16_t ioMinBandWidth;
    uint16_t ioOptimumBandWidth;
    uint16_t ioReadyTimeout;
    uint16_t ioHighCurrentAvgCurrent;

    uint16_t ioHighCurrentMaxCurrent;

    uint16_t ioLowCurrentAvgCurrent;

    uint16_t ioLowCurrentMaxCurrent;

} sdio_func_cis_t;







typedef struct _sd_status
{
    uint8_t busWidth;
    uint8_t secureMode;
    uint16_t cardType;
    uint32_t protectedSize;
    uint8_t speedClass;
    uint8_t performanceMove;
    uint8_t auSize;
    uint16_t eraseSize;
    uint8_t eraseTimeout;
    uint8_t eraseOffset;
    uint8_t uhsSpeedGrade;
    uint8_t uhsAuSize;
} sd_status_t;


typedef struct _sd_cid
{
    uint8_t manufacturerID;
    uint16_t applicationID;
    uint8_t productName[(5U)];
    uint8_t productVersion;
    uint32_t productSerialNumber;
    uint16_t manufacturerData;
} sd_cid_t;


typedef struct _sd_csd
{
    uint8_t csdStructure;
    uint8_t dataReadAccessTime1;
    uint8_t dataReadAccessTime2;
    uint8_t transferSpeed;
    uint16_t cardCommandClass;
    uint8_t readBlockLength;
    uint16_t flags;
    uint32_t deviceSize;

    uint8_t readCurrentVddMin;
    uint8_t readCurrentVddMax;
    uint8_t writeCurrentVddMin;
    uint8_t writeCurrentVddMax;
    uint8_t deviceSizeMultiplier;

    uint8_t eraseSectorSize;
    uint8_t writeProtectGroupSize;
    uint8_t writeSpeedFactor;
    uint8_t writeBlockLength;
    uint8_t fileFormat;
} sd_csd_t;
# 1043 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
typedef struct _sd_scr
{
    uint8_t scrStructure;
    uint8_t sdSpecification;
    uint16_t flags;
    uint8_t sdSecurity;
    uint8_t sdBusWidths;
    uint8_t extendedSecurity;
    uint8_t commandSupport;
    uint32_t reservedForManufacturer;
} sd_scr_t;




typedef struct _mmc_cid
{
    uint8_t manufacturerID;
    uint16_t applicationID;
    uint8_t productName[(6U)];
    uint8_t productVersion;
    uint32_t productSerialNumber;
    uint8_t manufacturerData;
} mmc_cid_t;


typedef struct _mmc_csd
{
    uint8_t csdStructureVersion;
    uint8_t systemSpecificationVersion;
    uint8_t dataReadAccessTime1;
    uint8_t dataReadAccessTime2;
    uint8_t transferSpeed;
    uint16_t cardCommandClass;
    uint8_t readBlockLength;
    uint16_t flags;
    uint16_t deviceSize;
    uint8_t readCurrentVddMin;
    uint8_t readCurrentVddMax;
    uint8_t writeCurrentVddMin;
    uint8_t writeCurrentVddMax;
    uint8_t deviceSizeMultiplier;
    uint8_t eraseGroupSize;
    uint8_t eraseGroupSizeMultiplier;
    uint8_t writeProtectGroupSize;
    uint8_t defaultEcc;
    uint8_t writeSpeedFactor;
    uint8_t maxWriteBlockLength;
    uint8_t fileFormat;
    uint8_t eccCode;
} mmc_csd_t;


typedef struct _mmc_extended_csd
{







    uint8_t cacheCtrl;
# 1125 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
    uint8_t partitionAttribute;






    uint8_t userWP;
    uint8_t bootPartitionWP;
    uint8_t bootWPStatus;
    uint8_t highDensityEraseGroupDefinition;
    uint8_t bootDataBusConditions;
    uint8_t bootConfigProtect;
    uint8_t partitionConfig;
    uint8_t eraseMemoryContent;
    uint8_t dataBusWidth;
    uint8_t highSpeedTiming;
    uint8_t powerClass;
    uint8_t commandSetRevision;
    uint8_t commandSet;
    uint8_t extendecCsdVersion;
    uint8_t csdStructureVersion;
    uint8_t cardType;
    uint8_t ioDriverStrength;

    uint8_t partitionSwitchTimeout;
    uint8_t powerClass52MHz195V;
    uint8_t powerClass26MHz195V;
    uint8_t powerClass52MHz360V;
    uint8_t powerClass26MHz360V;
    uint8_t minimumReadPerformance4Bit26MHz;
    uint8_t minimumWritePerformance4Bit26MHz;
    uint8_t minimumReadPerformance8Bit26MHz4Bit52MHz;

    uint8_t minimumWritePerformance8Bit26MHz4Bit52MHz;

    uint8_t minimumReadPerformance8Bit52MHz;
    uint8_t minimumWritePerformance8Bit52MHz;
    uint32_t sectorCount;

    uint8_t sleepAwakeTimeout;

    uint8_t sleepCurrentVCCQ;
    uint8_t sleepCurrentVCC;
    uint8_t highCapacityWriteProtectGroupSize;
    uint8_t reliableWriteSectorCount;
    uint8_t highCapacityEraseTimeout;
    uint8_t highCapacityEraseUnitSize;
    uint8_t accessSize;




    uint8_t minReadPerformance8bitAt52MHZDDR;
    uint8_t minWritePerformance8bitAt52MHZDDR;
    uint8_t powerClass200MHZVCCQ130VVCC360V;
    uint8_t powerClass200MHZVCCQ195VVCC360V;
    uint8_t powerClass52MHZDDR195V;
    uint8_t powerClass52MHZDDR360V;




    uint32_t genericCMD6Timeout;
    uint32_t cacheSize;
    uint8_t powerClass200MHZDDR360V;
# 1203 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
    uint8_t extPartitionSupport;







    uint8_t supportedCommandSet;

} mmc_extended_csd_t;
# 1233 "../../libraries/components/sdmmc/common/fsl_sdmmc_spec.h"
typedef struct _mmc_extended_csd_config
{
    mmc_command_set_t commandSet;
    uint8_t ByteValue;
    uint8_t ByteIndex;
    mmc_extended_csd_access_mode_t accessMode;
} mmc_extended_csd_config_t;


typedef struct _mmc_boot_config
{
    mmc_boot_mode_t bootMode;
    _Bool enableBootAck;
    mmc_boot_partition_enable_t bootPartition;

    mmc_boot_timing_mode_t bootTimingMode;
    mmc_data_bus_width_t bootDataBusWidth;
    _Bool retainBootbusCondition;

    _Bool pwrBootConfigProtection;

    _Bool premBootConfigProtection;

    mmc_boot_partition_wp_t bootPartitionWP;

} mmc_boot_config_t;
# 15 "../../libraries/components/sdmmc/common\\fsl_sdmmc_common.h" 2
# 67 "../../libraries/components/sdmmc/common\\fsl_sdmmc_common.h"
enum
{
    kStatus_SDMMC_NotSupportYet = ((((kStatusGroup_SDMMC)*100L) + (0U))),
    kStatus_SDMMC_TransferFailed = ((((kStatusGroup_SDMMC)*100L) + (1U))),
    kStatus_SDMMC_SetCardBlockSizeFailed = ((((kStatusGroup_SDMMC)*100L) + (2U))),
    kStatus_SDMMC_HostNotSupport = ((((kStatusGroup_SDMMC)*100L) + (3U))),
    kStatus_SDMMC_CardNotSupport = ((((kStatusGroup_SDMMC)*100L) + (4U))),
    kStatus_SDMMC_AllSendCidFailed = ((((kStatusGroup_SDMMC)*100L) + (5U))),
    kStatus_SDMMC_SendRelativeAddressFailed = ((((kStatusGroup_SDMMC)*100L) + (6U))),
    kStatus_SDMMC_SendCsdFailed = ((((kStatusGroup_SDMMC)*100L) + (7U))),
    kStatus_SDMMC_SelectCardFailed = ((((kStatusGroup_SDMMC)*100L) + (8U))),
    kStatus_SDMMC_SendScrFailed = ((((kStatusGroup_SDMMC)*100L) + (9U))),
    kStatus_SDMMC_SetDataBusWidthFailed = ((((kStatusGroup_SDMMC)*100L) + (10U))),
    kStatus_SDMMC_GoIdleFailed = ((((kStatusGroup_SDMMC)*100L) + (11U))),
    kStatus_SDMMC_HandShakeOperationConditionFailed =
        ((((kStatusGroup_SDMMC)*100L) + (12U))),
    kStatus_SDMMC_SendApplicationCommandFailed =
        ((((kStatusGroup_SDMMC)*100L) + (13U))),
    kStatus_SDMMC_SwitchFailed = ((((kStatusGroup_SDMMC)*100L) + (14U))),
    kStatus_SDMMC_StopTransmissionFailed = ((((kStatusGroup_SDMMC)*100L) + (15U))),
    kStatus_SDMMC_WaitWriteCompleteFailed = ((((kStatusGroup_SDMMC)*100L) + (16U))),
    kStatus_SDMMC_SetBlockCountFailed = ((((kStatusGroup_SDMMC)*100L) + (17U))),
    kStatus_SDMMC_SetRelativeAddressFailed = ((((kStatusGroup_SDMMC)*100L) + (18U))),
    kStatus_SDMMC_SwitchBusTimingFailed = ((((kStatusGroup_SDMMC)*100L) + (19U))),
    kStatus_SDMMC_SendExtendedCsdFailed = ((((kStatusGroup_SDMMC)*100L) + (20U))),
    kStatus_SDMMC_ConfigureBootFailed = ((((kStatusGroup_SDMMC)*100L) + (21U))),
    kStatus_SDMMC_ConfigureExtendedCsdFailed = ((((kStatusGroup_SDMMC)*100L) + (22U))),
    kStatus_SDMMC_EnableHighCapacityEraseFailed =
        ((((kStatusGroup_SDMMC)*100L) + (23U))),
    kStatus_SDMMC_SendTestPatternFailed = ((((kStatusGroup_SDMMC)*100L) + (24U))),
    kStatus_SDMMC_ReceiveTestPatternFailed = ((((kStatusGroup_SDMMC)*100L) + (25U))),
    kStatus_SDMMC_SDIO_ResponseError = ((((kStatusGroup_SDMMC)*100L) + (26U))),
    kStatus_SDMMC_SDIO_InvalidArgument =
        ((((kStatusGroup_SDMMC)*100L) + (27U))),
    kStatus_SDMMC_SDIO_SendOperationConditionFail =
        ((((kStatusGroup_SDMMC)*100L) + (28U))),
    kStatus_SDMMC_InvalidVoltage = ((((kStatusGroup_SDMMC)*100L) + (29U))),
    kStatus_SDMMC_SDIO_SwitchHighSpeedFail = ((((kStatusGroup_SDMMC)*100L) + (30U))),
    kStatus_SDMMC_SDIO_ReadCISFail = ((((kStatusGroup_SDMMC)*100L) + (31U))),
    kStatus_SDMMC_SDIO_InvalidCard = ((((kStatusGroup_SDMMC)*100L) + (32U))),
    kStatus_SDMMC_TuningFail = ((((kStatusGroup_SDMMC)*100L) + (33U))),

    kStatus_SDMMC_SwitchVoltageFail = ((((kStatusGroup_SDMMC)*100L) + (34U))),
    kStatus_SDMMC_SwitchVoltage18VFail33VSuccess = ((((kStatusGroup_SDMMC)*100L) + (35U))),

    kStatus_SDMMC_ReTuningRequest = ((((kStatusGroup_SDMMC)*100L) + (36U))),
    kStatus_SDMMC_SetDriverStrengthFail = ((((kStatusGroup_SDMMC)*100L) + (37U))),
    kStatus_SDMMC_SetPowerClassFail = ((((kStatusGroup_SDMMC)*100L) + (38U))),
    kStatus_SDMMC_HostNotReady = ((((kStatusGroup_SDMMC)*100L) + (39U))),
    kStatus_SDMMC_CardDetectFailed = ((((kStatusGroup_SDMMC)*100L) + (40U))),
    kStatus_SDMMC_AuSizeNotSetProperly = ((((kStatusGroup_SDMMC)*100L) + (41U))),
    kStatus_SDMMC_PollingCardIdleFailed = ((((kStatusGroup_SDMMC)*100L) + (42U))),
    kStatus_SDMMC_DeselectCardFailed = ((((kStatusGroup_SDMMC)*100L) + (43U))),
    kStatus_SDMMC_CardStatusIdle = ((((kStatusGroup_SDMMC)*100L) + (44U))),
    kStatus_SDMMC_CardStatusBusy = ((((kStatusGroup_SDMMC)*100L) + (45U))),
    kStatus_SDMMC_CardInitFailed = ((((kStatusGroup_SDMMC)*100L) + (46U))),
};




enum
{
    kSDMMC_SignalLineCmd = 1U,
    kSDMMC_SignalLineData0 = 2U,
    kSDMMC_SignalLineData1 = 4U,
    kSDMMC_SignalLineData2 = 8U,
    kSDMMC_SignalLineData3 = 16U,
    kSDMMC_SignalLineData4 = 32U,
    kSDMMC_SignalLineData5 = 64U,
    kSDMMC_SignalLineData6 = 128U,
    kSDMMC_SignalLineData7 = 256U,
};


typedef enum _sdmmc_operation_voltage
{
    kSDMMC_OperationVoltageNone = 0U,
    kSDMMC_OperationVoltage330V = 1U,
    kSDMMC_OperationVoltage300V = 2U,
    kSDMMC_OperationVoltage180V = 3U,
} sdmmc_operation_voltage_t;




enum
{
    kSDMMC_BusWdith1Bit = 0U,
    kSDMMC_BusWdith4Bit = 1U,
    kSDMMC_BusWdith8Bit = 2U,
};




enum
{
    kSDMMC_Support8BitWidth = 1U,
};




enum
{
    kSDMMC_DataPacketFormatLSBFirst,
    kSDMMC_DataPacketFormatMSBFirst,
};


typedef enum _sd_detect_card_type
{
    kSD_DetectCardByGpioCD,
    kSD_DetectCardByHostCD,
    kSD_DetectCardByHostDATA3,
} sd_detect_card_type_t;




enum
{
    kSD_Inserted = 1U,
    kSD_Removed = 0U,
};




enum
{
    kSD_DAT3PullDown = 0U,
    kSD_DAT3PullUp = 1U,
};


typedef void (*sd_cd_t)(_Bool isInserted, void *userData);

typedef _Bool (*sd_cd_status_t)(void);
typedef void (*sd_dat3_pull_t)(uint32_t pullStatus);


typedef struct _sd_detect_card
{
    sd_detect_card_type_t type;
    uint32_t cdDebounce_ms;
    sd_cd_t callback;
    sd_cd_status_t cardDetected;
    sd_dat3_pull_t dat3PullFunc;

    void *userData;
} sd_detect_card_t;


typedef enum _sd_io_voltage_ctrl_type
{
    kSD_IOVoltageCtrlNotSupport = 0U,
    kSD_IOVoltageCtrlByHost = 1U,
    kSD_IOVoltageCtrlByGpio = 2U,
} sd_io_voltage_ctrl_type_t;


typedef void (*sd_io_voltage_func_t)(sdmmc_operation_voltage_t voltage);


typedef struct _sd_io_voltage
{
    sd_io_voltage_ctrl_type_t type;
    sd_io_voltage_func_t func;
} sd_io_voltage_t;


typedef void (*sd_pwr_t)(_Bool enable);

typedef void (*sd_io_strength_t)(uint32_t busFreq);

typedef struct _sd_usr_param
{
    sd_pwr_t pwr;
    uint32_t powerOnDelayMS;
    uint32_t powerOffDelayMS;

    sd_io_strength_t ioStrength;
    sd_io_voltage_t *ioVoltage;
    sd_detect_card_t *cd;

    uint32_t maxFreq;
    uint32_t capability;
} sd_usr_param_t;


typedef void (*sdio_int_t)(void *userData);


typedef struct _sdio_card_int
{
    void *userData;
    sdio_int_t cardInterrupt;
} sdio_card_int_t;


typedef struct _sdio_usr_param
{
    sd_pwr_t pwr;
    uint32_t powerOnDelayMS;
    uint32_t powerOffDelayMS;

    sd_io_strength_t ioStrength;
    sd_io_voltage_t *ioVoltage;
    sd_detect_card_t *cd;
    sdio_card_int_t *sdioInt;
    uint32_t maxFreq;
    uint32_t capability;
} sdio_usr_param_t;





extern const uint32_t SDMMC_TuningBlockPattern4Bit[16U];
extern const uint32_t SDMMC_TuningBlockPattern8Bit[32U];
# 311 "../../libraries/components/sdmmc/common\\fsl_sdmmc_common.h"
status_t SDMMC_SelectCard(sdmmchost_t *host, uint32_t relativeAddress, _Bool isSelected);
# 322 "../../libraries/components/sdmmc/common\\fsl_sdmmc_common.h"
status_t SDMMC_SendApplicationCommand(sdmmchost_t *host, uint32_t relativeAddress);
# 332 "../../libraries/components/sdmmc/common\\fsl_sdmmc_common.h"
status_t SDMMC_SetBlockCount(sdmmchost_t *host, uint32_t blockCount);
# 341 "../../libraries/components/sdmmc/common\\fsl_sdmmc_common.h"
status_t SDMMC_GoIdle(sdmmchost_t *host);
# 350 "../../libraries/components/sdmmc/common\\fsl_sdmmc_common.h"
status_t SDMMC_SetBlockSize(sdmmchost_t *host, uint32_t blockSize);







status_t SDMMC_SetCardInactive(sdmmchost_t *host);
# 13 "../../libraries/components/sdmmc/sd\\fsl_sd.h" 2
# 28 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
enum
{
    kSD_SupportHighCapacityFlag = (1U << 1U),
    kSD_Support4BitWidthFlag = (1U << 2U),
    kSD_SupportSdhcFlag = (1U << 3U),
    kSD_SupportSdxcFlag = (1U << 4U),
    kSD_SupportVoltage180v = (1U << 5U),
    kSD_SupportSetBlockCountCmd = (1U << 6U),
    kSD_SupportSpeedClassControlCmd = (1U << 7U),
};






typedef struct _sd_card
{
    sdmmchost_t *host;

    sd_usr_param_t usrParam;
    _Bool isHostReady;

    _Bool noInteralAlign;
    uint32_t busClock_Hz;
    uint32_t relativeAddress;
    uint32_t version;
    uint32_t flags;
    uint8_t internalBuffer[((512U) + (32))];
    uint32_t ocr;
    sd_cid_t cid;
    sd_csd_t csd;
    sd_scr_t scr;
    sd_status_t stat;
    uint32_t blockCount;
    uint32_t blockSize;
    sd_timing_mode_t currentTiming;
    sd_driver_strength_t driverStrength;
    sd_max_current_t maxCurrent;
    sdmmc_operation_voltage_t operationVoltage;
    sdmmc_osa_mutex_t lock;
} sd_card_t;
# 111 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
status_t SD_Init(sd_card_t *card);
# 120 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
void SD_Deinit(sd_card_t *card);
# 150 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
status_t SD_CardInit(sd_card_t *card);
# 161 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
void SD_CardDeinit(sd_card_t *card);
# 170 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
status_t SD_HostInit(sd_card_t *card);
# 179 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
void SD_HostDeinit(sd_card_t *card);
# 188 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
void SD_HostDoReset(sd_card_t *card);
# 197 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
void SD_SetCardPower(sd_card_t *card, _Bool enable);
# 206 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
status_t SD_PollingCardInsert(sd_card_t *card, uint32_t status);






_Bool SD_IsCardPresent(sd_card_t *card);
# 224 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
_Bool SD_CheckReadOnly(sd_card_t *card);
# 234 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
status_t SD_SelectCard(sd_card_t *card, _Bool isSelected);
# 244 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
status_t SD_ReadStatus(sd_card_t *card);
# 266 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
status_t SD_ReadBlocks(sd_card_t *card, uint8_t *buffer, uint32_t startBlock, uint32_t blockCount);
# 290 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
status_t SD_WriteBlocks(sd_card_t *card, const uint8_t *buffer, uint32_t startBlock, uint32_t blockCount);
# 311 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
status_t SD_EraseBlocks(sd_card_t *card, uint32_t startBlock, uint32_t blockCount);







status_t SD_SetDriverStrength(sd_card_t *card, sd_driver_strength_t driverStrength);







status_t SD_SetMaxCurrent(sd_card_t *card, sd_max_current_t maxCurrent);
# 341 "../../libraries/components/sdmmc/sd\\fsl_sd.h"
status_t SD_PollingCardStatusBusy(sd_card_t *card, uint32_t timeoutMs);
# 17 "../../libraries/components/fatfs/source/fsl_sd_disk\\fsl_sd_disk.h" 2
# 32 "../../libraries/components/fatfs/source/fsl_sd_disk\\fsl_sd_disk.h"
extern sd_card_t g_sd;
# 54 "../../libraries/components/fatfs/source/fsl_sd_disk\\fsl_sd_disk.h"
DSTATUS sd_disk_initialize(BYTE pdrv);
# 63 "../../libraries/components/fatfs/source/fsl_sd_disk\\fsl_sd_disk.h"
DSTATUS sd_disk_status(BYTE pdrv);
# 75 "../../libraries/components/fatfs/source/fsl_sd_disk\\fsl_sd_disk.h"
DRESULT sd_disk_read(BYTE pdrv, BYTE* buff, LBA_t sector, UINT count);
# 87 "../../libraries/components/fatfs/source/fsl_sd_disk\\fsl_sd_disk.h"
DRESULT sd_disk_write(BYTE pdrv, const BYTE* buff, LBA_t sector, UINT count);
# 98 "../../libraries/components/fatfs/source/fsl_sd_disk\\fsl_sd_disk.h"
DRESULT sd_disk_ioctl(BYTE pdrv, BYTE cmd, void* buff);
# 122 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 1 "../../libraries/components/sdmmc\\sdmmc_config.h" 1
# 20 "../../libraries/components/sdmmc\\sdmmc_config.h"
# 1 "../../libraries/sdk/board\\clock_config.h" 1
# 31 "../../libraries/sdk/board\\clock_config.h"
void BOARD_InitBootClocks(void);
# 47 "../../libraries/sdk/board\\clock_config.h"
extern const clock_arm_pll_config_t armPllConfig_BOARD_BootClockRUN;


extern const clock_usb_pll_config_t usb1PllConfig_BOARD_BootClockRUN;


extern const clock_sys_pll_config_t sysPllConfig_BOARD_BootClockRUN;
# 66 "../../libraries/sdk/board\\clock_config.h"
void BOARD_BootClockRUN(void);
# 21 "../../libraries/components/sdmmc\\sdmmc_config.h" 2
# 79 "../../libraries/components/sdmmc\\sdmmc_config.h"
void BOARD_SDCardPowerControl(_Bool enable);
# 91 "../../libraries/components/sdmmc\\sdmmc_config.h"
void BOARD_SD_Config(void *card, sd_cd_t cd, uint32_t hostIRQPriority, void *userData);
# 123 "../../libraries/zf_common\\zf_common_headfile.h" 2
# 68 "../user/inc\\common.h" 2

# 1 "../user/inc/isr.h" 1
# 70 "../user/inc\\common.h" 2


# 1 "../user/inc/data.h" 1






typedef enum
{
 MOTOR_1 = 1,
 MOTOR_2 = 2,
 MOTOR_3 = 3
}_MOTOR_NUM_;


typedef struct
{
 int16 duty;
 int16 dir;
}_MOTOR_CONTROL_;


typedef struct
{
 float p;
 float i;
 float d;
 float value;
 float delta;
 float now_err;
 float last_err;
 float last_last_err;
 float sigma_err;
}_PID_;


typedef struct
{
 float motor_1_speed;
 float motor_2_speed;
 float motor_3_speed;
 _MOTOR_CONTROL_ motor_1;
 _MOTOR_CONTROL_ motor_2;
 _MOTOR_CONTROL_ motor_3;
}_CHASSIS_CONTROL_;


typedef struct
{
 _PID_ motor_1_pid;
 _PID_ motor_2_pid;
 _PID_ motor_3_pid;
}_CHASSIS_PID_;


extern int16 encoder_1_count;
extern int16 encoder_2_count;
extern int16 encoder_3_count;


extern float encoder_1_speed;
extern float encoder_2_speed;
extern float encoder_3_speed;


extern float gyro_x;
extern float gyro_y;
extern float gyro_z;


extern float acc_x;
extern float acc_y;
extern float acc_z;


extern float motor_1_speed;
extern float motor_2_speed;
extern float motor_3_speed;


extern float PID_MOTOR_1[3];
extern float PID_MOTOR_2[3];
extern float PID_MOTOR_3[3];


extern float yaw;
extern float speed;
extern _CHASSIS_CONTROL_ chassis_control;


extern uint8 image_OTSU[(120)][(160)];
# 73 "../user/inc\\common.h" 2
# 1 "../code\\chassis_control.h" 1
# 26 "../code\\chassis_control.h"
# 1 "../user/inc\\common.h" 1
# 27 "../code\\chassis_control.h" 2



void chassis_control_init();


void chassis_control_move(int16 (*p)(_PID_* pid,float motor_speed,float motor_feedback_speed),float yaw,float speed);




void motor_sensor_init(void);


void motor_set_duty(_MOTOR_NUM_ motor_num,const uint32 duty,uint8 dir);


void encoder_get(void);


void encoder_clear(void);


void gyro_get(void);


void acc_get(void);


float real_yaw();


_CHASSIS_PID_ chassis_pid_init(void);


_CHASSIS_CONTROL_ motor_pid(int16 (*p)(_PID_* pid,float motor_speed,float motor_feedback_speed),_CHASSIS_PID_* chassis_pid,_MOTOR_NUM_ motor_num,float motor_speed);


int16 incremental_pid(_PID_* pid,float motor_speed,float motor_feedback_speed);


int16 positional_pid(_PID_* pid,float motor_speed,float motor_feedback_speed);


_CHASSIS_CONTROL_ inverse_kinematics(float yaw,float speed);
# 74 "../user/inc\\common.h" 2
# 1 "../code\\path_control.h" 1
# 10 "../code\\path_control.h"
# 1 "../user/inc\\common.h" 1
# 11 "../code\\path_control.h" 2


void path_control_init(void);
# 75 "../user/inc\\common.h" 2
# 1 "../code\\cv.h" 1
# 10 "../code\\cv.h"
# 1 "../user/inc\\common.h" 1
# 11 "../code\\cv.h" 2


void threshold();
# 76 "../user/inc\\common.h" 2
# 2 "../user/src/data.c" 2


int16 encoder_1_count;
int16 encoder_2_count;
int16 encoder_3_count;


float encoder_1_speed;
float encoder_2_speed;
float encoder_3_speed;


float gyro_x;
float gyro_y;
float gyro_z;


float acc_x;
float acc_y;
float acc_z;


float motor_1_speed;
float motor_2_speed;
float motor_3_speed;


float yaw;
float speed;
# 39 "../user/src/data.c"
float PID_MOTOR_1[3] = {50 ,10 ,0};
float PID_MOTOR_2[3] = {50 ,10 ,0};
float PID_MOTOR_3[3] = {50 ,10 ,0};
