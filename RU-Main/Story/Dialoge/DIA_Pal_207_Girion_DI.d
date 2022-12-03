

DIA_Girion_DI_XIT (C_Info) instances
{
	npc = Pal_207_Girion_DI;
	nr = 999;
	condition = DIA_Girion_DI_EXIT_Condition;
	information = DIA_Girion_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Girion_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Girion_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Girion_DI_Hello (C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 2;
	condition = DIA_Girion_DI_Hallo_Condition;
	information = DIA_Girion_DI_Hello_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};


func int DIA_Girion_DI_Hallo_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_DI_Hello_Info()
{
	AI_Output(other,self, " DIA_Girion_DI_Hallo_15_00 " );	// Is everything okay?
	if(ORkSturmDI == TRUE)
	{
		AI_Output(self,other, " DIA_Girion_DI_Hallo_08_01 " );	// The orcs had the courage to attack me.
		AI_Output(self,other, " DIA_Girion_DI_Hallo_08_02 " );	// But they should have thought better before attacking a royal guard paladin.
	}
	else if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Girion_DI_Hallo_08_03 " );	// I think so. How much longer will you fiddle on this cliff?
	}
	else
	{
		AI_Output(self,other, " DIA_Girion_DI_Hallo_08_04 " );	// Don't take me for an idiot. Do what needs to be done and quickly return the ship to me.
	};
};


DIA_Girion_DI_Teach (C_Info) instances
{
	npc = Pal_207_Girion_DI;
	nr = 5;
	condition = DIA_Girion_DI_Teach_Condition;
	information = DIA_Girion_DI_Teach_Info;
	permanent = TRUE;
	description = " Educate me so we can get out of here faster! " ;
};


func int DIA_Girion_DI_Teach_Condition()
{
	if(UndeadDragonIsDead == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Girion_DI_Teach_Info()
{
	AI_Output(other,self, " DIA_Girion_DI_Teach_15_00 " );	// Teach me so we can get off this island faster.
	AI_Output(self,other, " DIA_Girion_DI_Teach_08_01 " );	// Looks like I have no other choice.
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_CROSSBOW_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,1,90))
	{
		AI_Output(self,other, " DIA_Girion_DI_Teach_CROSSBOW_1_08_00 " );	// When shooting, never lean on your elbows. This will make your grip too tight and you will inevitably lose aim.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_CROSSBOW_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_CROSSBOW,5,90))
	{
		AI_Output(self,other, " DIA_Girion_DI_Teach_CROSSBOW_5_08_00 " );	// Always relax your left hand before firing. This will allow you to aim more accurately.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_1H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,1,90))
	{
		AI_Output(self,other, " DIA_Girion_DI_Teach_1H_1_08_00 " );	// Your blade should glide through the air like reeds on a coast.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_1H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_1H,5,90))
	{
		AI_Output(self,other, " DIA_Girion_DI_Teach_1H_5_08_00 " );	// Force must be applied sparingly. If you blindly rush at the enemy, it will not lead you to success.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_2H_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,90))
	{
		AI_Output(self,other, " DIA_DIA_Girion_DI_Teach_2H_1_08_00 " );	// Do not squeeze your hand convulsively, then your blow will meet its target.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_2H_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,90))
	{
		AI_Output(self,other, " DIA_Girion_DI_Teach_2H_5_08_00 " );	// Don't forget to defend yourself. But the best defense is still to dodge the enemy's blow.
	};
	Info_ClearChoices(DIA_Girion_DI_Teach);
	Info_AddChoice(DIA_Girion_DI_Teach,Dialog_Back,DIA_Girion_DI_Teach_Back);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),DIA_Girion_DI_Teach_CROSSBOW_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),DIA_Girion_DI_Teach_CROSSBOW_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),DIA_Girion_DI_Teach_2H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),DIA_Girion_DI_Teach_2H_5);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),DIA_Girion_DI_Teach_1H_1);
	Info_AddChoice(DIA_Girion_DI_Teach,b_buildlearnstringforfight(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),DIA_Girion_DI_Teach_1H_5);
};

func void DIA_Girion_DI_Teach_Back()
{
	Info_ClearChoices(DIA_Girion_DI_Teach);
};


instances of DIA_Girion_DI_OrcEliteRing (C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 99;
	condition = DIA_Girion_DI_OrcEliteRing_Condition;
	information = DIA_Girion_DI_OrcEliteRing_Info;
	permanent = TRUE;
	description = " I have a ring of orc leaders. " ;
};


func int DIA_Girion_DI_OrcEliteRing_Condition()
{
	if(Npc_HasItems(other,ItRi_OrcEliteRing))
	{
		return TRUE;
	};
};


var int DIA_Girion_DI_OrcEliteRing_OneTime;

func void DIA_Girion_DI_OrcEliteRing_Info()
{
	AI_Output(other,self, " DIA_Girion_DI_OrcEliteRing_15_00 " );	// I have a ring of orc leaders.
	if(DIA_Girion_DI_OrcEliteRing_OneTime == FALSE)
	{
		AI_Output(self,other, " DIA_Girion_DI_OrcEliteRing_08_01 " );	// I think Lord Hagen can do something.
		DIA_Girion_DI_OrcEliteRing_OneTime = TRUE ;
	};
	AI_Output(self,other, " DIA_Girion_DI_OrcEliteRing_08_02 " );	// Give it to me. I'll show it to Lord Hagen.
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
	Info_AddChoice(DIA_Girion_DI_OrcEliteRing, " I'd rather keep him. " ,DIA_Girion_DI_OrcEliteRing_behalten);
	Info_AddChoice(DIA_Girion_DI_OrcEliteRing, " Вот, возьми. " ,DIA_Girion_DI_OrcEliteRing_geben);
};

func void DIA_Girion_DI_OrcEliteRing_give()
{
	AI_Output(other,self, " DIA_Girion_DI_OrcEliteRing_geben_15_00 " );	// Here, take this.
	AI_Output(self,other, " DIA_Girion_DI_OrcEliteRing_geben_08_01 " );	// Thank you. Still, I don't think it will be of any use to you.
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
	B_GiveInvItems(other,self,ItRi_OrcEliteRing,1);
	B_GivePlayerXP(XP_PAL_OrcRing);
};

func void DIA_Girion_DI_OrcEliteRing_keep()
{
	AI_Output(other,self, " DIA_Girion_DI_OrcEliteRing_behalten_15_00 " );	// I'd rather keep it to myself.
	AI_Output(self,other, " DIA_Girion_DI_OrcEliteRing_behalten_08_01 " );	// As you know. Still, it probably won't work for you.
	Info_ClearChoices(DIA_Girion_DI_OrcEliteRing);
};


instance DIA_Girion_DI_UndeadDragonDead(C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 2;
	condition = DIA_Girion_DI_UndeadDragonDead_Condition;
	information = DIA_Girion_DI_UndeadDragonDead_Info;
	permanent = TRUE;
	description = " We are ready to sail. " ;
};


func int DIA_Girion_DI_UndeadDragonDead_Condition()
{
	if(UndeadDragonIsDead == TRUE)
	{
		return TRUE;
	};
};

var int DIA_Girion_DI_UndeadDragonDead_OneTime;

func void DIA_Girion_DI_UndeadDragonDead_Info()
{
	AI_Output(other,self, " DIA_Girion_DI_UndeadDragonDead_15_00 " );	// We're ready to sail.
	AI_Output(self,other, " DIA_Girion_DI_UndeadDragonDead_08_01 " );	// This is good. And then I already began to think that I would rot here on this cliff.
	if(DIA_Girion_DI_UndeadDragonDead_OneTime == FALSE)
	{
		AI_Output(self,other, " DIA_Girion_DI_UndeadDragonDead_08_02 " );	// Now you will hand over the ship to me immediately!
		AI_Output(other,self, " DIA_Girion_DI_UndeadDragonDead_15_03 " );	// We're not in Khorinis yet. And to be honest, I don't really want to go back to Khorinis.
		AI_Output(other,self, " DIA_Girion_DI_UndeadDragonDead_15_04 " );	// I stayed there long enough.
		AI_Output(self,other, " DIA_Girion_DI_UndeadDragonDead_08_05 " );	// I've already thought about something like this. However, now is not the time or place. Let's talk about it again at sea.
		AI_Output(self,other, " DIA_Girion_DI_UndeadDragonDead_08_06 " );	// What does that mean... I'm still glad to see you safe on board again.
		if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
		{
			AI_Output(self,other, " DIA_Girion_DI_UndeadDragonDead_08_07 " );	// You are a true warrior of Innos. I have no doubts about this. I'm glad you're on our side.
		}
		else
		{
			AI_Output(self,other, " DIA_Girion_DI_UndeadDragonDead_08_08 " );	// Even though you're a swindler, lately you've been acting like a true righteous man.
		};
		DIA_Girion_DI_UndeadDragonDead_OneTime = TRUE;
	};
	AI_Output(self,other, " DIA_Girion_DI_UndeadDragonDead_08_09 " );	// Good. Now go to the captain. Let him raise the anchor.
	AI_StopProcessInfos(self);
};


instances DIA_Girion_DI_PICKPOCKET (C_Info)
{
	npc = Pal_207_Girion_DI;
	nr = 900;
	condition = DIA_Girion_DI_PICKPOCKET_Condition;
	information = DIA_Girion_DI_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Girion_DI_PICKPOCKET_Condition()
{
	return  C_Robbery ( 71 , 260 );
};

func void DIA_Girion_DI_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Girion_DI_PICKPOCKET);
	Info_AddChoice(DIA_Girion_DI_PICKPOCKET,Dialog_Back,DIA_Girion_DI_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Girion_DI_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Girion_DI_PICKPOCKET_DoIt);
};

func void DIA_Girion_DI_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Girion_DI_PICKPOCKET);
};

func void DIA_Girion_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Girion_DI_PICKPOCKET);
};

