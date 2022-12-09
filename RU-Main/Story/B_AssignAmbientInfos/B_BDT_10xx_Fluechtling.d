

func void B_DIA_BDT_10XX_Fluechtling_Stimme7()
{
	AI_Output(self,other, " DIA_B_DIA_BDT_10XX_Fluechtling_07_00 " );	// Forget it, I'm not going back to prison.
};

func void B_DIA_BDT_10XX_Refugee_Voice6()
{
	AI_Output(self,other, " DIA_B_DIA_BDT_10XX_Fluechtling_06_00 " );	// You didn't come to send us back to prison, did you?
};


instance DIA_BDT_1031_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1031_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1031_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1031_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1031_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1031_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1031_Fluechtling_Tip1(C_Info)
{
	npc = BDT_1031_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1031_Fluechtling_Tip1_Condition;
	information = DIA_BDT_1031_Fluechtling_Tip1_Info;
	important = TRUE;
};


func int DIA_BDT_1031_Fluechtling_Tip1_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1031_Fluechtling_Tip1_Info()
{
	AI_Output(self,other, " DIA_BDT_1031_Fluechtling_Tip1_07_00 " );	// You'd better stay away from me if you don't want to go to jail.
	B_GivePlayerXP(XP_AmbientKap3);
	if(SCFoundMorgahard == FALSE)
	{
		Info_ClearChoices(DIA_BDT_1031_Fluechtling_Tip1);
		Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1, " I'm not going to kill you. " ,DIA_BDT_1031_Fluechtling_Tip1_frei);
		Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1, " I came to arrest you. " ,DIA_BDT_1031_Fluechtling_Tip1_Knast);
		Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1, " Where is Morgahard, your leader? " ,DIA_BDT_1031_Fluechtling_Tip1_Morgahard);
	};
};

func void DIA_BDT_1031_Fluechtling_Tip1_Morgahard()
{
	AI_Output(other,self, " DIA_BDT_1031_Fluechtling_Tip1_Morgahard_15_00 " );	// Where is Morgahard, your leader?
	AI_Output(self,other, " DIA_BDT_1031_Fluechtling_Tip1_Morgahard_07_01 " );	// We split up so we don't get caught too soon. I have no idea where the others are now.
	Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1, " Sorry. Then I might have to take you to the judge. " ,DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen);
};

func void DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen()
{
	AI_Output(other,self, " DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_15_00 " );	// Sorry. Then maybe I'll have to take you to the judge.
	AI_Output(self,other, " DIA_BDT_1031_Fluechtling_Tip1_Morgahard_drohen_07_01 " );	// Okay, okay. I think some of us headed to the tavern. But you didn't hear that from me, okay?
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1031_Fluechtling_Tip1_Knast()
{
	AI_Output(other,self, " DIA_BDT_1031_Fluechtling_Tip1_Knast_15_00 " );	// I've come to arrest you.
	AI_Output(self,other, " DIA_BDT_1031_Fluechtling_Tip1_Knast_07_01 " );	// Only over my dead body.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void DIA_BDT_1031_Fluechtling_Tip1_frei()
{
	AI_Output(other,self, " DIA_BDT_1031_Fluechtling_Tip1_frei_15_00 " );	// I'm not going to kill you.
	AI_Output(self,other, " DIA_BDT_1031_Fluechtling_Tip1_frei_07_01 " );	// If the judge sent you, tell him to get off us.
	Info_AddChoice(DIA_BDT_1031_Fluechtling_Tip1, " So what crime are you accused of? " ,DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen);
};

func void DIA_BDT_1031_Refugee_Tip1_free_crime()
{
	AI_Output(other,self, " DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_15_00 " );	// So what crime are you accused of?
	AI_Output(self,other, " DIA_BDT_1031_Fluechtling_Tip1_frei_verbrechen_07_01 " );	// It's none of your business.
};


instance DIA_BDT_1031_Fluechtling_PERM(C_Info)
{
	npc = BDT_1031_Fluechtling;
	nr = 3;
	condition = DIA_BDT_1031_Fluechtling_PERM_Condition;
	information = DIA_BDT_1031_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1031_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1031_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Refugee_Voice7();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1032_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1032_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1032_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1032_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1032_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1032_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1032_Fluechtling_PERM(C_Info)
{
	npc = BDT_1032_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1032_Fluechtling_PERM_Condition;
	information = DIA_BDT_1032_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1032_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1032_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Refugee_Voice6();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1033_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1033_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1033_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1033_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1033_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1033_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1033_Fluechtling_Tip2 (C_Info) .
{
	npc = BDT_1033_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1033_Fluechtling_Tip2_Condition;
	information = DIA_BDT_1033_Fluechtling_Tip2_Info;
	important = TRUE;
};


func int DIA_BDT_1033_Fluechtling_Tip2_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1033_Fluechtling_Tip2_Info()
{
	AI_Output(self,other, " DIA_BDT_1033_Fluechtling_Tip2_07_00 " );	// (frightened) What do you want from me?
	B_GivePlayerXP(XP_AmbientKap3);
	if(SCFoundMorgahard == FALSE)
	{
		Info_ClearChoices(DIA_BDT_1033_Fluechtling_Tip2);
		Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2, " Relax. I just want to talk. " ,DIA_BDT_1033_Fluechtling_Tip2_frei);
		Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2, " The judge sent me to bring you back. " ,DIA_BDT_1033_Fluechtling_Tip2_Knast);
		Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2, " Where is Morgahard, your leader? " ,DIA_BDT_1033_Fluechtling_Tip2_Morgahard);
	};
};

func void DIA_BDT_1033_Fluechtling_Tip2_Morgahard()
{
	AI_Output(other,self, " DIA_BDT_1033_Fluechtling_Tip2_Morgahard_15_00 " );	// Where is Morgahard, your leader?
	AI_Output(self,other, " DIA_BDT_1033_Fluechtling_Tip2_Morgahard_07_01 " );	// (scared) I don't want trouble. Go to Onar. He wanted to hide among the mercenaries. And leave me alone.
	AI_StopProcessInfos(self);
};

func void DIA_BDT_1033_Fluechtling_Tip2_Knast()
{
	AI_Output(other,self, " DIA_BDT_1033_Fluechtling_Tip2_Knast_15_00 " );	// The judge sent me to bring you back.
	AI_Output(self,other, " DIA_BDT_1033_Fluechtling_Tip2_Knast_07_01 " );	// (yells) NO!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void DIA_BDT_1033_Fluechtling_Tip2_frei()
{
	AI_Output(other,self, " DIA_BDT_1033_Fluechtling_Tip2_frei_15_00 " );	// Relax. I just want to talk.
	AI_Output(self,other, " DIA_BDT_1033_Fluechtling_Tip2_frei_07_01 " );	// But I don't want to talk to you. Get out!
	Info_AddChoice(DIA_BDT_1033_Fluechtling_Tip2, " You're scared to death, aren't you? " ,DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen);
};

func void DIA_BDT_1033_Refugee_Tip2_free_crime()
{
	AI_Output(other,self, " DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_15_00 " );	// You're scared to death, aren't you?
	AI_Output(self,other, " DIA_BDT_1033_Fluechtling_Tip2_frei_verbrechen_07_01 " );	// It's easy for you to talk. There is no gallows waiting for you if you are caught.
};


instance DIA_BDT_1033_Fluechtling_PERM(C_Info)
{
	npc = BDT_1033_Fluechtling;
	nr = 3;
	condition = DIA_BDT_1033_Fluechtling_PERM_Condition;
	information = DIA_BDT_1033_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1033_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1033_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Refugee_Voice7();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1034_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1034_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1034_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1034_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1034_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1034_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1034_Fluechtling_PERM(C_Info)
{
	npc = BDT_1034_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1034_Fluechtling_PERM_Condition;
	information = DIA_BDT_1034_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1034_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1034_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Refugee_Voice6();
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1035_Fluechtling_EXIT(C_Info)
{
	npc = BDT_1035_Fluechtling;
	nr = 999;
	condition = DIA_BDT_1035_Fluechtling_EXIT_Condition;
	information = DIA_BDT_1035_Fluechtling_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_BDT_1035_Fluechtling_EXIT_Condition()
{
	return TRUE;
};

func void DIA_BDT_1035_Fluechtling_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_BDT_1035_Fluechtling_PERM(C_Info)
{
	npc = BDT_1035_Fluechtling;
	nr = 2;
	condition = DIA_BDT_1035_Fluechtling_PERM_Condition;
	information = DIA_BDT_1035_Fluechtling_PERM_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_BDT_1035_Fluechtling_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_BDT_1035_Fluechtling_PERM_Info()
{
	B_DIA_BDT_10XX_Refugee_Voice7();
	AI_StopProcessInfos(self);
};

