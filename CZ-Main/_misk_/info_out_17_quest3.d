

instance INFO_OUT_17_QUEST3(C_Info)
{
	nr = 4;
	condition = info_out_17_quest3_condition;
	information = info_out_17_quest3_info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int info_out_17_quest3_condition()
{
	return TRUE;
};

func void info_out_17_quest3_info()
{
	AI_Output(other,self, " Info_Out_17_Quest3_01_00 " );	// Is everything ok?
	AI_Output(self,other, " Info_Out_17_Quest3_01_01 " );	// Yeah, absolutely. Just like 20 years ago. Not much has changed since then.
};

func void b_assignambientinfos_out_17(var C_Npc slf)
{
	info_out_17_quest3.npc = Hlp_GetInstanceID(slf);
};

