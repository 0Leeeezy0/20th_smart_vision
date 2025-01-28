# 1 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 387 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c" 2








# 1 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h" 1
# 12 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h"
# 1 "../../libraries/sdk/drives\\fsl_common.h" 1
# 12 "../../libraries/sdk/drives\\fsl_common.h"
# 1 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\assert.h" 1 3
# 43 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\assert.h" 3
    extern __attribute__((__nothrow__)) __attribute__((__noreturn__)) void abort(void);
    extern __attribute__((__nothrow__)) __attribute__((__noreturn__)) void __aeabi_assert(const char *, const char *, int) __attribute__((__nonnull__(1,2)));
# 13 "../../libraries/sdk/drives\\fsl_common.h" 2
# 1 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\stdbool.h" 1 3
# 14 "../../libraries/sdk/drives\\fsl_common.h" 2
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
# 15 "../../libraries/sdk/drives\\fsl_common.h" 2
# 1 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 1 3
# 51 "D:\\KEIL\\ARM\\ARMCLANG\\Bin\\..\\include\\string.h" 3
    typedef unsigned int size_t;






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
# 16 "../../libraries/sdk/drives\\fsl_common.h" 2
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
# 13 "../../libraries/components/sdmmc/host/usdhc\\fsl_sdmmc_host.h" 2
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
# 10 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c" 2
# 1 "../../libraries/components/sdmmc/common\\fsl_sdmmc_common.h" 1
# 14 "../../libraries/components/sdmmc/common\\fsl_sdmmc_common.h"
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
# 11 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c" 2


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
# 14 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c" 2
# 33 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
static void SDMMCHOST_DetectCardInsertByHost(USDHC_Type *base, void *userData);






static void SDMMCHOST_DetectCardRemoveByHost(USDHC_Type *base, void *userData);
# 49 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
static void SDMMCHOST_TransferCompleteCallback(USDHC_Type *base,
                                               usdhc_handle_t *handle,
                                               status_t status,
                                               void *userData);





static void SDMMCHOST_ErrorRecovery(USDHC_Type *base);
# 68 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
static status_t SDMMCHOST_ExecuteManualTuning(sdmmchost_t *host,
                                              uint32_t tuningCmd,
                                              uint32_t *revBuf,
                                              uint32_t blockSize);
# 80 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
static void SDMMCHOST_DetectCardInsertByHost(USDHC_Type *base, void *userData)
{
    sd_detect_card_t *cd = 0;

    (void)SDMMC_OSAEventSet(&(((sdmmchost_t *)userData)->hostEvent), (1UL << 8U));
    (void)SDMMC_OSAEventClear(&(((sdmmchost_t *)userData)->hostEvent), (1UL << 9U));

    if (userData != 0)
    {
        cd = (sd_detect_card_t *)(((sdmmchost_t *)userData)->cd);
        if (cd != 0)
        {
            if (cd->callback != 0)
            {
                cd->callback(1, cd->userData);
            }
            if (cd->type == kSD_DetectCardByHostDATA3)
            {
                USDHC_DisableInterruptSignal(base, kUSDHC_CardInsertionFlag);
                if (cd->dat3PullFunc != 0)
                {
                    cd->dat3PullFunc(kSD_DAT3PullUp);
                }
            }
            else
            {
                USDHC_EnableInterruptSignal(base, kUSDHC_CardRemovalFlag);
            }
        }
    }
}

static void SDMMCHOST_DetectCardRemoveByHost(USDHC_Type *base, void *userData)
{
    sd_detect_card_t *cd = 0;

    (void)SDMMC_OSAEventSet(&(((sdmmchost_t *)userData)->hostEvent), (1UL << 9U));
    (void)SDMMC_OSAEventClear(&(((sdmmchost_t *)userData)->hostEvent), (1UL << 8U));

    if (userData != 0)
    {
        cd = (sd_detect_card_t *)(((sdmmchost_t *)userData)->cd);
        if (cd != 0)
        {
            if (cd->callback != 0)
            {
                cd->callback(0, cd->userData);
            }

            if (cd->type == kSD_DetectCardByHostDATA3)
            {
                USDHC_DisableInterruptSignal(base, kUSDHC_CardRemovalFlag);
                if (cd->dat3PullFunc != 0)
                {
                    cd->dat3PullFunc(kSD_DAT3PullUp);
                }
            }
            else
            {
                USDHC_EnableInterruptSignal(base, kUSDHC_CardInsertionFlag);
            }
        }
    }
}

static void SDMMCHOST_CardInterrupt(USDHC_Type *base, void *userData)
{
    sdio_card_int_t *cardInt = 0;


    if (userData != 0)
    {
        cardInt = ((sdmmchost_t *)userData)->cardInt;
        if ((cardInt != 0) && (cardInt->cardInterrupt != 0))
        {
            cardInt->cardInterrupt(cardInt->userData);
        }
    }
}

status_t SDMMCHOST_CardIntInit(sdmmchost_t *host, void *sdioInt)
{
    host->cardInt = sdioInt;
    host->handle.callback.SdioInterrupt = SDMMCHOST_CardInterrupt;
    SDMMCHOST_EnableCardInt(host, 1);

    return kStatus_Success;
}

status_t SDMMCHOST_CardDetectInit(sdmmchost_t *host, void *cd)
{
    USDHC_Type *base = host->hostController.base;
    sd_detect_card_t *sdCD = (sd_detect_card_t *)cd;
    if ((cd == 0) || ((sdCD->type != kSD_DetectCardByHostDATA3) && (sdCD->type != kSD_DetectCardByHostCD)))
    {
        return kStatus_Fail;
    }

    host->cd = cd;
    host->handle.callback.CardInserted = SDMMCHOST_DetectCardInsertByHost;
    host->handle.callback.CardRemoved = SDMMCHOST_DetectCardRemoveByHost;


    USDHC_ClearInterruptStatusFlags(base, (uint32_t)kUSDHC_CardInsertionFlag | (uint32_t)kUSDHC_CardRemovalFlag);
    USDHC_EnableInterruptStatus(base, (uint32_t)kUSDHC_CardInsertionFlag | (uint32_t)kUSDHC_CardRemovalFlag);

    if (SDMMCHOST_CardDetectStatus(host) == (uint32_t)kSD_Inserted)
    {
        (void)SDMMC_OSAEventSet(&(host->hostEvent), (1UL << 8U));

        if (sdCD->callback != 0)
        {
            sdCD->callback(1, sdCD->userData);
        }
    }
    else
    {
        (void)SDMMC_OSAEventSet(&(host->hostEvent), (1UL << 9U));
        USDHC_EnableInterruptSignal(base, kUSDHC_CardInsertionFlag);
    }

    return kStatus_Success;
}

uint32_t SDMMCHOST_CardDetectStatus(sdmmchost_t *host)
{
    sd_detect_card_t *sdCD = (sd_detect_card_t *)(host->cd);
    uint32_t insertStatus = kSD_Removed;

    if (sdCD->type == kSD_DetectCardByHostDATA3)
    {
        if (sdCD->dat3PullFunc != 0)
        {
            sdCD->dat3PullFunc(kSD_DAT3PullDown);
            SDMMC_OSADelay((10U));
        }
        USDHC_CardDetectByData3(host->hostController.base, 1);

        SDMMC_OSADelay((10U));
    }
    else
    {
        USDHC_CardDetectByData3(host->hostController.base, 0);
    }

    if ((USDHC_GetPresentStatusFlags(host->hostController.base) & (uint32_t)kUSDHC_CardInsertedFlag) != 0U)
    {
        insertStatus = kSD_Inserted;

        if (sdCD->type == kSD_DetectCardByHostDATA3)
        {
            if (sdCD->dat3PullFunc != 0)
            {
                sdCD->dat3PullFunc(kSD_DAT3PullUp);
            }

            USDHC_CardDetectByData3(host->hostController.base, 0);
        }
    }

    return insertStatus;
}

status_t SDMMCHOST_PollingCardDetectStatus(sdmmchost_t *host, uint32_t waitCardStatus, uint32_t timeout)
{
    ((host != 0) ? (void)0 : __aeabi_assert("host != NULL", "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c", 245),
# 245 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
#pragma clang diagnostic push
# 245 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
#pragma clang diagnostic ignored "-Wassume"
# 245 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
    (__builtin_assume)((host != 0)?1:0)
# 245 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
#pragma clang diagnostic pop
# 245 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
    );
    ((host->cd != 0) ? (void)0 : __aeabi_assert("host->cd != NULL", "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c", 246),
# 246 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
#pragma clang diagnostic push
# 246 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
#pragma clang diagnostic ignored "-Wassume"
# 246 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
    (__builtin_assume)((host->cd != 0)?1:0)
# 246 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
#pragma clang diagnostic pop
# 246 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
    );

    sd_detect_card_t *cd = host->cd;
    uint32_t event = 0U;

    if (((waitCardStatus == (uint32_t)kSD_Inserted) && (SDMMCHOST_CardDetectStatus(host) == (uint32_t)kSD_Inserted)) ||
        (((waitCardStatus == (uint32_t)kSD_Removed) && SDMMCHOST_CardDetectStatus(host) == (uint32_t)kSD_Removed)))
    {
        return kStatus_Success;
    }

    (void)SDMMC_OSAEventClear(&(host->hostEvent), (1UL << 8U) | (1UL << 9U));

    if (cd->type == kSD_DetectCardByHostDATA3)
    {
        if (cd->dat3PullFunc != 0)
        {
            cd->dat3PullFunc(kSD_DAT3PullDown);
        }
        USDHC_ClearInterruptStatusFlags(host->hostController.base,
                                        (uint32_t)kUSDHC_CardInsertionFlag | (uint32_t)kUSDHC_CardRemovalFlag);
        USDHC_EnableInterruptSignal(host->hostController.base, waitCardStatus == (uint32_t)kSD_Inserted ?
                                                                   (uint32_t)kUSDHC_CardInsertionFlag :
                                                                   (uint32_t)kUSDHC_CardRemovalFlag);
    }


    do
    {
        if (SDMMC_OSAEventWait(&(host->hostEvent), (1UL << 8U) | (1UL << 9U),
                               timeout, &event) != kStatus_Success)
        {
            return kStatus_Fail;
        }
        else
        {
            if ((waitCardStatus == (uint32_t)kSD_Inserted) &&
                ((event & (1UL << 8U)) == (1UL << 8U)))
            {
                SDMMC_OSADelay(cd->cdDebounce_ms);
                if (SDMMCHOST_CardDetectStatus(host) == (uint32_t)kSD_Inserted)
                {
                    break;
                }
            }

            if (((event & (1UL << 9U)) == (1UL << 9U)) &&
                (waitCardStatus == (uint32_t)kSD_Removed))
            {
                break;
            }
        }
    } while (1);

    return kStatus_Success;
}

void SDMMCHOST_ConvertDataToLittleEndian(sdmmchost_t *host, uint32_t *data, uint32_t wordSize, uint32_t format)
{
    uint32_t temp = 0U;

    if (((uint32_t)host->hostController.config.endianMode == (uint32_t)kSDMMCHOST_EndianModeLittle) &&
        (format == (uint32_t)kSDMMC_DataPacketFormatMSBFirst))
    {
        for (uint32_t i = 0U; i < wordSize; i++)
        {
            temp = data[i];
            data[i] = (__builtin_bswap32(temp));
        }
    }
    else if ((uint32_t)host->hostController.config.endianMode == (uint32_t)kSDMMCHOST_EndianModeHalfWordBig)
    {
        for (uint32_t i = 0U; i < wordSize; i++)
        {
            temp = data[i];
            data[i] = (__ROR(__builtin_bswap32(temp), 16));
        }
    }
    else if (((uint32_t)host->hostController.config.endianMode == (uint32_t)kSDMMCHOST_EndianModeBig) &&
             (format == (uint32_t)kSDMMC_DataPacketFormatLSBFirst))
    {
        for (uint32_t i = 0U; i < wordSize; i++)
        {
            temp = data[i];
            data[i] = (__builtin_bswap32(temp));
        }
    }
    else
    {

    }
}

static void SDMMCHOST_TransferCompleteCallback(USDHC_Type *base,
                                               usdhc_handle_t *handle,
                                               status_t status,
                                               void *userData)
{
    uint32_t eventStatus = 0U;

    if (status == kStatus_USDHC_TransferDataFailed)
    {
        eventStatus = (1UL << 3U);
    }
    else if (status == kStatus_USDHC_TransferDataComplete)
    {
        eventStatus = (1UL << 2U);
    }
    else if (status == kStatus_USDHC_SendCommandFailed)
    {
        eventStatus = (1UL << 1U);
    }
    else if (status == kStatus_USDHC_TransferDMAComplete)
    {
        eventStatus = (1UL << 4U);
    }
    else
    {
        eventStatus = (1UL << 0U);
    }

    (void)SDMMC_OSAEventSet(&(((sdmmchost_t *)userData)->hostEvent), eventStatus);
}
# 381 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
status_t SDMMCHOST_TransferFunction(sdmmchost_t *host, sdmmchost_transfer_t *content)
{
    status_t error = kStatus_Success;
    uint32_t event = 0U;
    usdhc_adma_config_t dmaConfig;
# 395 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
    (void)SDMMC_OSAMutexLock(&host->lock, ((uint32_t)(-1)));

    if (content->data != 0)
    {
        (void)memset(&dmaConfig, 0, sizeof(usdhc_adma_config_t));

        dmaConfig.dmaMode = kUSDHC_DmaModeAdma2;

        dmaConfig.burstLen = kUSDHC_EnBurstLenForINCR;

        dmaConfig.admaTable = host->dmaDesBuffer;
        dmaConfig.admaTableWords = host->dmaDesBufferWordsNum;
# 485 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
        if (host->enableCacheControl == kSDMMCHOST_CacheControlRWBuffer)
        {

            DCACHE_CleanByRange(
                (uint32_t)(content->data->txData == 0 ? content->data->rxData : content->data->txData),
                (content->data->blockSize) * (content->data->blockCount));
        }


    }


    (void)SDMMC_OSAEventClear(&(host->hostEvent), (1UL << 0U) | (1UL << 1U) | (1UL << 2U) | (1UL << 3U));




    error = USDHC_TransferNonBlocking(host->hostController.base, &host->handle, &dmaConfig, content);


    if (error == kStatus_Success)
    {

        if ((kStatus_Fail == SDMMC_OSAEventWait(&(host->hostEvent), (1UL << 0U) | (1UL << 1U) | (1UL << 2U) | (1UL << 3U),
                                                (~0U), &event)) ||
            ((event & (1UL << 1U)) != 0U))
        {
            error = kStatus_Fail;
        }
        else
        {
            if (content->data != 0)
            {
                if ((event & (1UL << 2U)) == 0U)
                {
                    if (((event & (1UL << 3U)) != 0U) ||
                        (kStatus_Fail == SDMMC_OSAEventWait(&(host->hostEvent), (1UL << 2U) | (1UL << 3U),
                                                            (~0U), &event) ||
                         ((event & (1UL << 3U)) != 0U)))
                    {
                        error = kStatus_Fail;
                    }
                }
            }
        }
    }

    if (error != kStatus_Success)
    {

        SDMMCHOST_ErrorRecovery(host->hostController.base);
    }
    else
    {
        if ((content->data != 0) && (content->data->rxData != 0))
        {
# 564 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
            {



                if (host->enableCacheControl == kSDMMCHOST_CacheControlRWBuffer)
                {
                    DCACHE_InvalidateByRange((uint32_t)content->data->rxData,
                                             (content->data->blockSize) * (content->data->blockCount));
                }


            }
        }
    }

    (void)SDMMC_OSAMutexUnlock(&host->lock);

    return error;
}

static void SDMMCHOST_ErrorRecovery(USDHC_Type *base)
{
    uint32_t status = 0U;

    status = USDHC_GetPresentStatusFlags(base);

    if ((status & (uint32_t)kUSDHC_CommandInhibitFlag) != 0U)
    {

        (void)USDHC_Reset(base, kUSDHC_ResetCommand, 100U);
    }

    if (((status & (uint32_t)kUSDHC_DataInhibitFlag) != 0U) || (USDHC_GetAdmaErrorStatusFlags(base) != 0U))
    {

        (void)USDHC_Reset(base, kUSDHC_ResetData, 100U);
    }
}

void SDMMCHOST_SetCardPower(sdmmchost_t *host, _Bool enable)
{

}

void SDMMCHOST_SetCardBusWidth(sdmmchost_t *host, uint32_t dataBusWidth)
{
    USDHC_SetDataBusWidth(host->hostController.base, dataBusWidth == (uint32_t)kSDMMC_BusWdith1Bit ?
                                                         kUSDHC_DataBusWidth1Bit :
                                                         dataBusWidth == (uint32_t)kSDMMC_BusWdith4Bit ?
                                                         kUSDHC_DataBusWidth4Bit :
                                                         kUSDHC_DataBusWidth8Bit);
}

status_t SDMMCHOST_Init(sdmmchost_t *host)
{
    ((host != 0) ? (void)0 : __aeabi_assert("host != NULL", "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c", 619),
# 619 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
#pragma clang diagnostic push
# 619 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
#pragma clang diagnostic ignored "-Wassume"
# 619 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
    (__builtin_assume)((host != 0)?1:0)
# 619 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
#pragma clang diagnostic pop
# 619 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
    );

    usdhc_transfer_callback_t usdhcCallback = {0};
    usdhc_host_t *usdhcHost = &(host->hostController);

    uint32_t bus8bitCapability = (uint32_t)(((host->hostController.base) == ((USDHC_Type *)(0x402C0000u))) ? (0) : (((host->hostController.base) == ((USDHC_Type *)(0x402C4000u))) ? (1) : (-1)));
# 638 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
    uint32_t voltage1v8Capability = (uint32_t)(1);



    status_t error = kStatus_Success;


    host->capability = (uint32_t)kSDMMCHOST_SupportHighSpeed | (uint32_t)kSDMMCHOST_SupportSuspendResume |
                       (uint32_t)kSDMMCHOST_SupportVoltage3v3 | (uint32_t)kSDMMCHOST_SupportVoltage1v8 |
                       (uint32_t)kSDMMCHOST_SupportVoltage1v2 | (uint32_t)kSDMMCHOST_Support4BitDataWidth |
                       (uint32_t)kSDMMCHOST_SupportDDRMode | (uint32_t)kSDMMCHOST_SupportDetectCardByData3 |
                       (uint32_t)kSDMMCHOST_SupportDetectCardByCD | (uint32_t)kSDMMCHOST_SupportAutoCmd12;

    if (bus8bitCapability != 0U)
    {
        host->capability |= (uint32_t)kSDMMCHOST_Support8BitDataWidth;
    }

    if (voltage1v8Capability != 0U)
    {

        host->capability |= (uint32_t)kSDMMCHOST_SupportSDR104;



        host->capability |= (uint32_t)kSDMMCHOST_SupportSDR50 | (uint32_t)kSDMMCHOST_SupportHS200;

    }







    host->maxBlockCount = (((0xFFFF0000U) >> (16U)));
    host->maxBlockSize = (4096U);

    (void)SDMMC_OSAMutexCreate(&host->lock);
    (void)SDMMC_OSAMutexLock(&host->lock, ((uint32_t)(-1)));


    usdhcHost->config.endianMode = kUSDHC_EndianModeLittle;
    usdhcHost->config.dataTimeout = 0xFU;
    usdhcHost->config.readWatermarkLevel = 0x80U;
    usdhcHost->config.writeWatermarkLevel = 0x80U;
    USDHC_Init(usdhcHost->base, &(usdhcHost->config));


    usdhcCallback.TransferComplete = SDMMCHOST_TransferCompleteCallback;
    USDHC_TransferCreateHandle(usdhcHost->base, &host->handle, &usdhcCallback, host);


    if (kStatus_Success != SDMMC_OSAEventCreate(&(host->hostEvent)))
    {
        error = kStatus_Fail;
    }

    (void)SDMMC_OSAMutexUnlock(&host->lock);

    return error;
}

void SDMMCHOST_Reset(sdmmchost_t *host)
{
    USDHC_Type *base = host->hostController.base;

    (void)SDMMC_OSAMutexLock(&host->lock, ((uint32_t)(-1)));


    UDSHC_SelectVoltage(base, 0);

    USDHC_EnableDDRMode(base, 0, 0U);


    USDHC_EnableStandardTuning(base, 0, 0, 0);
    USDHC_EnableAutoTuning(host->hostController.base, 0);
# 724 "../../libraries/components/sdmmc/host/usdhc/non_blocking/fsl_sdmmc_host.c"
    (void)USDHC_Reset(base, kUSDHC_ResetAll, 100U);

    USDHC_DisableInterruptSignal(base, kUSDHC_AllInterruptFlags);

    (void)SDMMC_OSAMutexUnlock(&host->lock);
}

void SDMMCHOST_Deinit(sdmmchost_t *host)
{
    (void)SDMMC_OSAMutexLock(&host->lock, ((uint32_t)(-1)));
    usdhc_host_t *sdhcHost = &host->hostController;
    SDMMCHOST_Reset(host);
    USDHC_Deinit(sdhcHost->base);
    (void)SDMMC_OSAEventDestroy(&(host->hostEvent));
    (void)SDMMC_OSAMutexDestroy(&host->lock);
}

void SDMMCHOST_SwitchToVoltage(sdmmchost_t *host, uint32_t voltage)
{
    if (voltage == (uint32_t)kSDMMC_OperationVoltage180V)
    {
        UDSHC_SelectVoltage(host->hostController.base, 1);
    }
    else
    {
        UDSHC_SelectVoltage(host->hostController.base, 0);
    }
}


static status_t SDMMCHOST_ExecuteStdTuning(sdmmchost_t *host, uint32_t tuningCmd, uint32_t *revBuf, uint32_t blockSize)
{
    sdmmchost_transfer_t content = {0U};
    sdmmchost_cmd_t command = {0U};
    sdmmchost_data_t data = {0U};
    _Bool tuningError = 1;
    status_t error = kStatus_Success;

    command.index = tuningCmd;
    command.argument = 0U;
    command.responseType = kCARD_ResponseTypeR1;

    data.blockSize = blockSize;
    data.blockCount = 1U;
    data.rxData = revBuf;
    data.dataType = kUSDHC_TransferDataTuning;

    content.command = &command;
    content.data = &data;

    (void)USDHC_Reset(host->hostController.base, kUSDHC_ResetTuning, 100U);
    USDHC_ForceClockOn(host->hostController.base, 1);

    USDHC_EnableStandardTuning(host->hostController.base, (10U), (2U),
                               0);




    USDHC_SetStandardTuningCounter(host->hostController.base, (60));

    USDHC_EnableStandardTuning(host->hostController.base, (10U), (2U), 1);

    while (1)
    {
        error = SDMMCHOST_TransferFunction(host, &content);

        if (kStatus_Success != error)
        {
            return kStatus_SDMMC_TransferFailed;
        }
        SDMMC_OSADelay(1U);


        if ((USDHC_GetExecuteStdTuningStatus(host->hostController.base) != 0U))
        {
            continue;
        }


        if ((USDHC_CheckTuningError(host->hostController.base) != 0U) && tuningError)
        {
            tuningError = 0;

            USDHC_EnableStandardTuning(host->hostController.base, (10U),
                                       (2U), 1);
            (void)USDHC_SetTuningDelay(host->hostController.base, (10U), 0U, 0U);
        }
        else
        {
            break;
        }
    }


    if (USDHC_CheckStdTuningResult(host->hostController.base) == 0U)
    {
        return kStatus_SDMMC_TuningFail;
    }
    USDHC_ForceClockOn(host->hostController.base, 0);
    USDHC_EnableAutoTuning(host->hostController.base, 1);

    return kStatus_Success;
}

static status_t SDMMC_CheckTuningResult(uint32_t *tuningWindow, uint32_t *validWindowStart, uint32_t *validWindowEnd)
{
    uint32_t tempValidWindowLen = 0U, tempValidWindowStart = 0U, tempValidWindowEnd = 0U;
    uint32_t validWindowLenMax = 0U, ValidWindowStartMax = 0U, validWindowEndMax = 0U;

    for (uint32_t i = 0U; i < (128U); i++)
    {
        if ((tuningWindow[i / 32U] & (1UL << (i % 32U))) != 0U)
        {
            if (tempValidWindowLen == 0U)
            {
                tempValidWindowStart = i;
            }
            tempValidWindowLen++;
        }
        else
        {
            if (tempValidWindowLen != 0U)
            {
                tempValidWindowEnd = i - 1U;




                if (tempValidWindowLen > validWindowLenMax)
                {
                    validWindowLenMax = tempValidWindowLen;
                    ValidWindowStartMax = tempValidWindowStart;
                    validWindowEndMax = tempValidWindowEnd;
                }
                tempValidWindowLen = 0U;
            }
        }
    }

    if (validWindowLenMax == 0U)
    {
        return kStatus_Fail;
    }

    *validWindowStart = ValidWindowStartMax;
    *validWindowEnd = validWindowEndMax;

    return kStatus_Success;
}

static status_t SDMMCHOST_ExecuteManualTuning(sdmmchost_t *host,
                                              uint32_t tuningCmd,
                                              uint32_t *revBuf,
                                              uint32_t blockSize)
{
    uint32_t *buffer = revBuf;
    status_t ret = kStatus_Success;
    uint32_t tuningDelayCell = 0U;
    uint32_t tuningWindow[4] = {0U}, tuningWindowStart = 0U, tuningWindowEnd = 0U;

    sdmmchost_transfer_t content = {0U};
    sdmmchost_cmd_t command = {0U};
    sdmmchost_data_t data = {0U};

    command.index = tuningCmd;
    command.argument = 0U;
    command.responseType = kCARD_ResponseTypeR1;

    data.blockSize = blockSize;
    data.blockCount = 1U;
    data.rxData = revBuf;

    content.command = &command;
    content.data = &data;

    (void)USDHC_Reset(host->hostController.base, kUSDHC_ResetAll, 100U);
    USDHC_EnableManualTuning(host->hostController.base, 1);
    USDHC_ForceClockOn(host->hostController.base, 1);

    while (1)
    {
        (void)USDHC_SetTuningDelay(host->hostController.base, tuningDelayCell, 0U, 0U);

        if ((SDMMCHOST_TransferFunction(host, &content) == kStatus_Success) &&
            (((uint32_t)kUSDHC_TuningPassFlag & USDHC_GetInterruptStatusFlags(host->hostController.base)) != 0U))
        {
            USDHC_ClearInterruptStatusFlags(host->hostController.base, kUSDHC_TuningPassFlag);
            tuningWindow[tuningDelayCell / 32U] |= 1UL << (tuningDelayCell % 32U);




        }
        else
        {



        }

        if (++tuningDelayCell >= (128U))
        {
            break;
        }

        (void)memset(buffer, 0, blockSize);

        SDMMC_OSADelay(2U);
    }



    if (SDMMC_CheckTuningResult(tuningWindow, &tuningWindowStart, &tuningWindowEnd) == kStatus_Fail)
    {
        return kStatus_Fail;
    }


    USDHC_EnableManualTuning(host->hostController.base, 0);
    USDHC_ForceClockOn(host->hostController.base, 0);
    (void)USDHC_Reset(host->hostController.base, kUSDHC_ResetAll, 100U);


    (void)USDHC_SetTuningDelay(host->hostController.base, (tuningWindowStart + tuningWindowEnd) / 2U - 3U, 3U, 3U);
    tuningDelayCell = ((tuningWindowStart + tuningWindowEnd) / 2U - 3U) << 8U | 0x33U;

    while ((USDHC_GetTuningDelayStatus(host->hostController.base) & tuningDelayCell) != tuningDelayCell)
    {
    }

    USDHC_EnableAutoTuning(host->hostController.base, 1);

    return ret;
}


status_t SDMMCHOST_ExecuteTuning(sdmmchost_t *host, uint32_t tuningCmd, uint32_t *revBuf, uint32_t blockSize)
{

    if (host->tuningType == (uint32_t)kSDMMCHOST_StandardTuning)
    {
        return SDMMCHOST_ExecuteStdTuning(host, tuningCmd, revBuf, blockSize);
    }

    return SDMMCHOST_ExecuteManualTuning(host, tuningCmd, revBuf, blockSize);



}

status_t SDMMCHOST_StartBoot(sdmmchost_t *host,
                             sdmmchost_boot_config_t *hostConfig,
                             sdmmchost_cmd_t *cmd,
                             uint8_t *buffer)
{
    sdmmchost_transfer_t content = {0};
    sdmmchost_data_t data = {0};
    status_t error = kStatus_Success;

    USDHC_SetMmcBootConfig(host->hostController.base, hostConfig);

    data.blockSize = hostConfig->blockSize;
    data.blockCount = hostConfig->blockCount;
    data.rxData = (uint32_t *)(uint32_t)buffer;
    data.dataType = kUSDHC_TransferDataBoot;

    content.data = &data;
    content.command = cmd;

    error = SDMMCHOST_TransferFunction(host, &content);

    if (kStatus_Success != error)
    {
        return kStatus_SDMMC_TransferFailed;
    }

    return kStatus_Success;
}

status_t SDMMCHOST_ReadBootData(sdmmchost_t *host, sdmmchost_boot_config_t *hostConfig, uint8_t *buffer)
{
    sdmmchost_cmd_t command = {0};
    sdmmchost_transfer_t content = {0};
    sdmmchost_data_t data = {0};
    status_t error = kStatus_Success;

    USDHC_SetMmcBootConfig(host->hostController.base, hostConfig);
    USDHC_EnableMmcBoot(host->hostController.base, 1);

    data.blockSize = hostConfig->blockSize;
    data.blockCount = hostConfig->blockCount;
    data.rxData = (uint32_t *)(uint32_t)buffer;
    data.dataType = kUSDHC_TransferDataBootcontinous;

    command.type = kCARD_CommandTypeEmpty;

    content.data = &data;
    content.command = &command;

    error = SDMMCHOST_TransferFunction(host, &content);
    if (kStatus_Success != error)
    {
        return kStatus_SDMMC_TransferFailed;
    }

    return kStatus_Success;
}
