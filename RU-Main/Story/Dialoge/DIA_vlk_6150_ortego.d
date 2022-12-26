

instance DIA_VLK_6150_ORTEGO_EXIT(C_Info)
{
	npc = vlk_6150_ortego;
	nr = 999;
	condition = dia_vlk_6150_ortego_exit_condition;
	information = dia_vlk_6150_ortego_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6150_ortego_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6150_ortego_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_6150_ORTEGO_HELLO(C_Info)
{
	npc = vlk_6150_ortego;
	nr = 5;
	condition = dia_vlk_6150_ortego_hello_condition;
	information = dia_vlk_6150_ortego_hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_vlk_6150_ortego_hello_condition()
{
	if(MIS_KILLIGNAZ == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_vlk_6150_ortego_hello_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_VLK_6150_Ortego_Hello_01_00 " );	// You've finally arrived! I was waiting for you.
	AI_Output(other,self, " DIA_VLK_6150_Ortego_Hello_01_01 " );	// Me?
	AI_Output(self,other, " DIA_VLK_6150_Ortego_Hello_01_02 " );	// Well, yes, who else?
	AI_Output(self,other, " DIA_VLK_6150_Ortego_Hello_01_03 " );	// Do you have my money?
	AI_Output(other,self, " DIA_VLK_6150_Ortego_Hello_01_04 " );	// What money?
	AI_Output(self,other, " DIA_VLK_6150_Ortego_Hello_01_05 " );	// I don't understand... Are you taking me for an idiot?
	AI_Output(self,other, " DIA_VLK_6150_Ortego_Hello_01_06 " );	// The money you promised me for the death of that pathetic old alchemist!
	AI_Output(self,other, " DIA_VLK_6150_Ortego_Hello_01_07 " );	// The poor fellow didn't even have time to utter a word, as he was already dead!
	AI_Output(self,other, " DIA_VLK_6150_Ortego_Hello_01_08 " );	// And now I'm waiting for my gold, which you promised me in your letter.
	AI_Output(other,self, " DIA_VLK_6150_Ortego_Hello_01_11 " );	// So you killed someone?
	AI_Output(self,other, " DIA_VLK_6150_Ortego_Hello_01_12 " );	// (uncomprehending) What's wrong with you, boy?! Am I not speaking clearly? 
	AI_Output(other,self, " DIA_VLK_6150_Ortego_Hello_01_13 " );	// I'm fine. I just don't think I'm the person you think I am.
	AI_Output(self,other, " DIA_VLK_6150_Ortego_Hello_01_14 " );	// What?! Are you saying I'm mistaken?
	AI_Output(other,self, " DIA_VLK_6150_Ortego_Hello_01_15 " );	// Seems like it.
	AI_Output(self,other, " DIA_VLK_6150_Ortego_Hello_01_16 " );	// Well, that explains a lot. Wait a minute, I'll explain everything to you...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

