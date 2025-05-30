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


#include "common.h"

/* 调试命令行初始化 */
void debug_cli_init(void)
{
	setbuf(stdout,NULL);
	printf("%s\n",DEBUG_CLI_WELCOME);
}

/* 命令行服务运行 */
void cli_service_start(void)
{
	_CMD_APP_LIST_ cmd_app_list;
	_CMD_APP_LIST_* cmd_app_list_p = &cmd_app_list;
	while(1)
	{
		_CLI_DATA_* data_rx = cli_data_init();	// 接收数据初始化
		printf("%s%s",DEBUG_CLI_NAME,DEBUG_CLI_CONNECT_CHAR);
		cli_data_get(&data_rx);
		cmd_app_list_p = cli_data_cmd_match(data_rx);
		cli_app_run(cmd_app_list_p);
		cli_data_all_free(data_rx);
	}
}

/* 命令行数据获取 */
uint32 cli_data_get(_CLI_DATA_** data_rx)
{
	uint8 data_rx_char;
	uint32 i = 0;

	while(1)
	{
		uint32 buffer_len = 0;
		buffer_len = wireless_uart_read_buffer(&data_rx_char,1);

		// 接收到数据才保存到接收数据区
		if(buffer_len != 0)
		{
			// 命令行回显
#if CLI_LOCAL_ECHO_EN == 1
			printf("%c",(char)data_rx_char);
#endif
			// 命令行命令删除
#if CLI_DELETE_EN == 1
			if(data_rx_char == 0X08)
			{
				i = i-2;
				cli_data_last_free(data_rx);
			}
			else
			{
				cli_data_malloc(data_rx,data_rx_char);
			}
#endif
			i++;
			// 当接收的数据有'\n'、'\r'或长度超出系统限制则结束接收
			if(data_rx_char == '\n' || data_rx_char == '\r' || i > MAX_UART_DATA_LEN)
			{
				break;
			}
		}
	}
	return ((*data_rx) -> Num);
}

/* 命令行数据链表初始化 */
_CLI_DATA_* cli_data_init(void)
{
	_CLI_DATA_* cli_Data = (_CLI_DATA_*)malloc(sizeof(_CLI_DATA_));
	cli_Data -> Num = 1;
	cli_Data -> CLI_Data_Header = cli_Data;

	return cli_Data;
}

/* 命令行数据链表空间申请 */
uint32 cli_data_malloc(_CLI_DATA_** cli_data,char data)
{
	_CLI_DATA_* cli_data_next = (_CLI_DATA_*)malloc(sizeof(_CLI_DATA_));
	(*cli_data) -> Data = data;
	cli_data_next -> Num = (*cli_data) -> Num+1;
	cli_data_next -> CLI_Data_Header = (*cli_data) -> CLI_Data_Header;
	(*cli_data) -> CLI_Data_Next = cli_data_next;
	(*cli_data) = cli_data_next;

	return cli_data_next -> Num;
}

/* 命令行数据链表读取 */
char cli_data_read(_CLI_DATA_* cli_data,uint32_t num_get)
{
	_CLI_DATA_* cli_data_get = (cli_data -> CLI_Data_Header);
	uint32 Num = cli_data -> Num;
	char Return_Char;
	for(uint32 i = 0;i < Num;i++)
	{
		if(cli_data_get -> Num == num_get)
		{
			Return_Char = cli_data_get -> Data;
			break;
		}
		cli_data_get = (cli_data_get -> CLI_Data_Next);
	}
	return Return_Char;
}

/* 命令行全部数据空间释放 */
void cli_data_all_free(_CLI_DATA_* cli_data)
{
	_CLI_DATA_* cli_data_header = cli_data -> CLI_Data_Header;
	uint32 num_all = cli_data -> Num;
	for(uint32 i = 0;i < num_all;i++)
	{
		_CLI_DATA_* cli_data_free = cli_data_header;
		cli_data_header = (cli_data_header -> CLI_Data_Next);

		free(cli_data_free);
	}
}

/* 命令行尾数据空间释放 */
void cli_data_last_free(_CLI_DATA_** cli_data)
{
	_CLI_DATA_* cli_data_Last = (*cli_data) -> CLI_Data_Header;
	uint32 num_last = (*cli_data) -> Num;
	for(uint32 i = 0;i < num_last;i++)
	{
		// 释放最后一个数据
		if(cli_data_Last -> Num == num_last)
		{
			free(cli_data_Last);
		}
		// 将传入的命令行数据指针指向倒数第二个命令行数据
		if(cli_data_Last -> Num == num_last-1)
		{
			(*cli_data) = cli_data_Last;
		}
		cli_data_Last = cli_data_Last -> CLI_Data_Next;
	}
	// 清除倒数第二个命令行数据的下一位索引
	(*cli_data) -> CLI_Data_Next = NULL;
}

/* VOFA justfloat输出 */
void just_float(const uint32 data_num, ...) 
{
    va_list args;
	uint8_t data_send[4] = {0};
    
    va_start(args, data_num);  // 初始化可变参数列表
    for (uint32_t i = 0; i < data_num; i++) 
	{
        double data_double = va_arg(args, double);  // 逐个读取 int 类型参数
		float data_float = (float)data_double;
		
		*(float*)data_send = data_float;
				
		uart_write_byte(WIRELESS_UART_INDEX,data_send[0]);
		uart_write_byte(WIRELESS_UART_INDEX,data_send[1]);
		uart_write_byte(WIRELESS_UART_INDEX,data_send[2]);
		uart_write_byte(WIRELESS_UART_INDEX,data_send[3]);
    }
	va_end(args);
}