

instance INFO_OUT_16_QUEST3(C_Info)
{
	nr = 4;
	condition = info_out_16_quest3_condition;
	information = info_out_16_quest3_info;
	permanent = TRUE;
	description = " How is life here? " ;
};


func int info_out_16_quest3_condition()
{
	return TRUE;
};

func void info_out_16_quest3_info()
{
	AI_Output(other,self, " Info_Out_16_Quest3_01_00 " );	// How is life here?
	AI_Output(self,other, " Info_Out_16_Quest3_01_01 " );	// Great!
	AI_Output(self,other, " Info_Out_16_Quest3_01_02 " );	// We like it here so much, in fact, we're constantly trying to get out of here.
};

func void b_assignambientinfos_out_16(var C_Npc slf)
{
	info_out_16_quest3.npc = Hlp_GetInstanceID(slf);
};

