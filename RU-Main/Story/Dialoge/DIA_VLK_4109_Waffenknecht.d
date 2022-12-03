

instance DIA_WAFFEN4109_EXIT(C_Info)
{
	npc = VLK_4109_Waffenknecht;
	nr = 999;
	condition = dia_waffen4109_exit_condition;
	information = dia_waffe4109_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_waffen4109_exit_condition()
{
	return TRUE;
};

func void dia_waffen4109_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_WAFFEN4109_HELLO (C_Info)
{
	npc = VLK_4109_Waffenknecht;
	nr = 1;
	condition = dia_waffen4109_hallo_condition;
	information = dia_waffe4109_hello_info;
	description = " Hey, how are you? " ;
	permanent = TRUE;
};


func int dia_waffen4109_hallo_condition()
{
	return TRUE;
};


var int waffen4109firsttime;

func void dia_waffe4109_hello_info()
{
	AI_Output(other,self, " DIA_Waffen4109_HALLO_15_00 " );	// Hey, how are you?
	if(COOK1107_GOBASE == TRUE)
	{
		AI_Output(self,other, " DIA_Waffen4109_HALLO_03_01 " );	// That damn cook's gone and I have to cook for him.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Waffen4109_HALLO_03_02 " );	// You think it's great to saw these boxes all day long?
		if(WAFFEN4109FIRSTTIME == FALSE)
		{
			AI_Output(other,self, " DIA_Waffen4109_HALLO_15_01 " );	// Why are you sawing them?
			AI_Output(self,other, " DIA_Waffen4109_HALLO_03_03 " );	// To make arrows out of them. We need more arrows!
			AI_Output(other,self, " DIA_Waffen4109_HALLO_15_02 " );	// Yes, that's right.
			if(KNOWHOWTOMAKEARROWS == FALSE)
			{
				AI_Output(other,self, " DIA_Waffen4109_HALLO_15_03 " );	// So you can make arrows? Can you teach?
				AI_Output(self,other, " DIA_Waffen4109_HALLO_03_04 " );	// Hmmm... Do you think I have time for this?
				AI_Output(self,other, " DIA_Waffen4109_HALLO_03_05 " );	// Look for someone else.
			};
			WAFFEN4109FIRSTTIME = TRUE;
		};
	};
};
