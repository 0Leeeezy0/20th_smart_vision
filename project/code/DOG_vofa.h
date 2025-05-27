/*
该文件用于连接VOFA进行调试

API：
****用户****
调试命令行初始化
命令行服务运行
************

****底层****
命令行数据获取
命令行数据链表初始化
命令行数据链表空间申请
命令行数据链表读取
命令行全部数据空间释放
命令行尾数据空间释放
************
*/

#ifndef _DOG_VOFA_H_
#define _DOG_VOFA_H_

#include "common.h"

/*
更换 zf_common_debug.c 355-362行使用无线串口进行调试
使用 printf 函数进行调试
int32_t fputc (int32_t ch, FILE* f)
{
    if(zf_debug_init_flag)
    {
        wireless_uart_send_byte((ch & 0xFF));
    }
    return ch;
}
*/

/* 命令行数据 */
typedef struct
{
	char Data;
	uint32 Num;
	struct _CLI_DATA_* CLI_Data_Header;
	struct _CLI_DATA_* CLI_Data_Next;
}_CLI_DATA_;

/* 调试命令行初始化 */
void debug_cli_init(void);

/* 命令行服务运行 */
void cli_service_start(void);

/* 命令行数据获取 */
uint32 cli_data_get(_CLI_DATA_** data_rx);

/* 命令行数据链表初始化 */
_CLI_DATA_* cli_data_init(void);

/* 命令行数据链表空间申请 */
uint32 cli_data_malloc(_CLI_DATA_** cli_data,char data);

/* 命令行数据链表读取 */
char cli_data_read(_CLI_DATA_* cli_data,uint32_t num_get);

/* 命令行全部数据空间释放 */
void cli_data_all_free(_CLI_DATA_* cli_data);

/* 命令行尾数据空间释放 */
void cli_data_last_free(_CLI_DATA_** cli_data);

/* VOFA justfloat输出 */
void just_float(const uint32 data_num, ...) ;

#endif