

instance INFO_OUT_18_QUEST3(C_Info)
{
	nr = 4;
	condition = info_out_18_quest3_condition;
	information = info_out_18_quest3_info;
	permanent = TRUE;
	description = " So how are things going? " ;
};


func int info_out_18_quest3_condition()
{
	return TRUE;
};

func void info_out_18_quest3_info()
{
	AI_Output(other,self, " Info_Out_18_Quest3_01_00 " );	// So how are things going?
	AI_Output(self,other, " Info_Out_18_Quest3_01_01 " );	// What do you need?
};

func void b_assignambientinfos_out_18(var C_Npc slf)
{
	info_out_18_quest3.npc = Hlp_GetInstanceID(slf);
};

