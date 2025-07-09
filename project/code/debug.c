#include "common.h"

// ต๗สิ
void vofa_debug(void){
	/* VOFA */
	wireless_vofa.justfloat_add(&wireless_vofa, 4, (float)path_state, (float)last_path_state, (float)detection_result.tool, (float)detection_result.num);
	wireless_vofa.justfloat_send(&wireless_vofa);
}