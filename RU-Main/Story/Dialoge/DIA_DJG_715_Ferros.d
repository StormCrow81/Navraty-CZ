
instance DIA_DJG_715_Ferros_EXIT (C_Info)
{
	npc = DJG_715_Ferros;
	nr = 999;
	condition = DIA_DJG_715_Ferros_EXIT_Condition;
	information = DIA_DJG_715_Ferros_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_DJG_715_Ferros_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DJG_715_Ferros_Hello (C_Info)
{
	npc = DJG_715_Ferros;
	nr = 4;
	condition = DIA_DJG_715_Ferros_Hello_Condition;
	information = DIA_DJG_715_Ferros_Hello_Info;
	permanent = FALSE;
	description = " Where are you from? " ;
};


func int DIA_DJG_715_Ferros_Hello_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_Hello_Info()
{
	AI_Output(other,self, " DIA_DJG_715_Ferros_Hello_15_00 " );	// Where are you from?
	AI_Output(self,other, " DIA_DJG_715_Ferros_Hello_01_01 " );	// From the mainland. My people and I fled from there.
	AI_Output(self,other, " DIA_DJG_715_Ferros_Hello_01_02 " );	// It's getting worse there. Orcs burn everything that burns behind them.
	AI_Output(self,other, " DIA_DJG_715_Ferros_Hello_01_03 " );	// The king has lost control of his kingdom.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_DJG_715_Ferros_Hello_01_04 " );	// You paladins failed the whole thing, if you want my opinion.
	};
};


instance DIA_DJG_715_Ferros_Friends(C_Info)
{
	npc = DJG_715_Ferros;
	nr = 5;
	condition = DIA_DJG_715_Ferros_Friends_Condition;
	information = DIA_DJG_715_Ferros_Friends_Info;
	permanent = FALSE;
	description = " Where are your people now? " ;
};


func int DIA_DJG_715_Ferros_Friends_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_Friends_Info()
{
	AI_Output(other,self, " DIA_DJG_715_Ferros_Friends_15_00 " );	// Where are your people now?
	AI_Output(self,other, " DIA_DJG_715_Ferros_Friends_01_01 " );	// I left them.
	AI_Output(self,other, " DIA_DJG_715_Ferros_Friends_01_02 " );	// They thought they were allowed to take whatever they wanted, even if it wasn't theirs. I don't want to take part in this.
};


instance DIA_DJG_715_Ferros_War (C_Info)
{
	npc = DJG_715_Ferros;
	nr = 6;
	condition = DIA_DJG_715_Ferros_War_Condition;
	information = DIA_DJG_715_Ferros_War_Info;
	permanent = FALSE;
	description = " What else do you know about war? " ;
};


func int DIA_DJG_715_Ferros_War_Condition()
{
	if(Npc_KnowsInfo(other,DIA_DJG_715_Ferros_Hello))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_War_Info()
{
	AI_Output(other,self, " DIA_DJG_715_Ferros_War_15_00 " );	// What else do you know about war?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_DJG_715_Ferros_War_01_01 " );	// You haven't seen your king for a long time, have you?
	};
	AI_Output(self,other, " DIA_DJG_715_Ferros_War_01_02 " );	// Orcs have surrounded the capital. But whether it has already fallen or not, I do not know.
	AI_Output(self,other, " DIA_DJG_715_Ferros_War_01_03 " );	// Last I heard, the king is dead. But I don't believe in it.
};

var int FerrosRing;

instance DIA_DJG_715_Ferros_OldCamp (C_Info)
{
	npc = DJG_715_Ferros;
	nr = 7;
	condition = DIA_DJG_715_Ferros_OldCamp_Condition;
	information = DIA_DJG_715_Ferros_OldCamp_Info;
	permanent = FALSE;
	description = " What are you doing here in the castle? " ;
};

func int DIA_DJG_715_Ferros_OldCamp_Condition()
{
	return TRUE;
};

func void DIA_DJG_715_Ferros_OldCamp_Info()
{
	AI_Output(other,self, " DIA_DJG_715_Ferros_OldCamp_15_00 " );	// What are you doing here in the castle?
	AI_Output(self,other, " DIA_DJG_715_Ferros_OldCamp_01_01 " );	// I heard about dragons and came to help fight them.
	AI_Output(self,other, " DIA_DJG_715_Ferros_OldCamp_01_02 " );	// Unfortunately, I lost my sword while making my way past the orcs. And so I'm stuck here.
	AI_Output(self,other, " DIA_DJG_715_Ferros_OldCamp_01_03 " );	// I can't get out of here without a sword, and the swords they sell here are useless junk.
	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp, " I wish you good luck in your quest. " ,DIA_DJG_715_Ferros_OldCamp_No);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp, " What will you give me if I find your sword? " ,DIA_DJG_715_Ferros_OldCamp_Price);
	Info_AddChoice(DIA_DJG_715_Ferros_OldCamp, " I will find your sword. " ,DIA_DJG_715_Ferros_OldCamp_Yes);
	Wld_InsertItem(ItMW_1H_FerrosSword_Mis,"FP_OW_ITEM_08");
	MIS_FErrosSword = LOG_Running;
	Log_CreateTopic(TOPIC_FerrosSword,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FerrosSword,LOG_Running);
	B_LogEntry(TOPIC_FerrosSword, " Feros lost his sword to the orcs! That was stupid. " );
};

func void DIA_DJG_715_Ferros_OldCamp_No()
{
	AI_Output(other,self, " DIA_DJG_715_Ferros_OldCamp_No_15_00 " );	// I wish you luck in your quest.
	AI_Output(self,other, " DIA_DJG_715_Ferros_OldCamp_No_01_01 " );	// I keep asking myself the question - why did I even come here?
	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};

func void DIA_DJG_715_Ferros_OldCamp_Price()
{
	AI_Output(other,self, " DIA_DJG_715_Ferros_OldCamp_Price_15_00 " );	// What will you give me if I find your sword?
	AI_Output(self,other, " DIA_DJG_715_Ferros_OldCamp_Price_01_01 " );	// God, I can't give anything. I spent all my money on this sword.

	if(RhetorikSkillValue[1] >= 50)
	{
		AI_Output(other,self, " DIA_DJG_715_Ferros_OldCamp_Price_New_15_00 " );	// I'm afraid this won't work!
		AI_Output(other,self, " DIA_DJG_715_Ferros_OldCamp_Price_New_15_01 " );	// Besides, you don't look like a person who has no money.
		AI_Output(self,other, " DIA_DJG_715_Ferros_OldCamp_Price_New_15_02 " );	// I really don't have them, mate.
		AI_Output(self,other, " DIA_DJG_715_Ferros_OldCamp_Price_New_15_03 " );	// The only thing I can give you as a reward is my family ring.
		AI_Output(self,other, " DIA_DJG_715_Ferros_OldCamp_Price_New_15_04 " );	// The last thing I haven't sold yet...
		FerrosRing = TRUE;
	};

	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};

func void DIA_DJG_715_Ferros_OldCamp_Yes()
{
	AI_Output(other,self, " DIA_DJG_715_Ferros_OldCamp_Yes_15_00 " );	// I'll find your sword.
	AI_Output(self,other, " DIA_DJG_715_Ferros_OldCamp_Yes_01_01 " );	// That would be great. You should look around the big cliff to the south.
	AI_Output(self,other, " DIA_DJG_715_Ferros_OldCamp_Yes_01_02 " );	// I probably lost it there, near the orc tents.
	B_LogEntry(TOPIC_FerrosSword, " Looks like Feros lost his sword on the high cliff to the south, where the orcs' tents are. " );
	Info_ClearChoices(DIA_DJG_715_Ferros_OldCamp);
};


instance DIA_DJG_715_Ferros_FerrosAnySword (C_Info)
{
	npc = DJG_715_Ferros;
	nr = 6;
	condition = DIA_DJG_715_Ferros_FerrosAnySword_Condition;
	information = DIA_DJG_715_Ferros_FerrosAnySword_Info;
	permanent = FALSE;
	description = " Maybe I have another sword for you. " ;
};


func int DIA_DJG_715_Ferros_FerrosAnySword_Condition()
{
	if((MIS_FErrosSword == LOG_Running) && ((Npc_HasItems(other,ItMw_1H_Special_01) >= 1) || (Npc_HasItems(other,ItMw_1H_Special_02) >= 1)))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Info()
{
	AI_Output(other,self, " DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_15_00 " );	// Maybe I have another sword for you.
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,Dialog_Back,DIA_DJG_715_Ferros_FerrosAnySword_Back);
	if(Npc_HasItems(other,ItMw_1H_Special_01) >= 1)
	{
		Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,ItMw_1H_Special_01.name,DIA_DJG_715_Ferros_FerrosAnySword_Silverblade);
	};
	if(Npc_HasItems(other,ItMw_1H_Special_02) >= 1)
	{
		Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword,ItMw_1H_Special_02.name,DIA_DJG_715_Ferros_FerrosAnySword_Oreblade);
	};
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Back()
{
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

func void B_Ferros_FerrosAnySword_Give()
{
	AI_Output(self,other, " DIA_DJG_715_Ferros_FerrosAnySword_Give_01_00 " );	// This is a good blade. Excellent work.
	AI_Output(self,other, " DIA_DJG_715_Ferros_FerrosAnySword_Give_01_01 " );	// Are you sure you want to give it to me just like that?
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade()
{
	B_Ferros_FerrosAnySword_Give();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, " No, I need it myself. " ,DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, " Да, забирай. " ,DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade()
{
	B_Ferros_FerrosAnySword_Give();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, " No, I need it myself. " ,DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No);
	Info_AddChoice(DIA_DJG_715_Ferros_FerrosAnySword, " Да, забирай. " ,DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes);
};

func void B_Ferros_FerrosAnySword_Yes1()
{
	AI_Output(other,self, " DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_15_00 " );		// Yes, take it.
	AI_Output(self,other, " DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_01_00 " );		// Thank you. You are a good person.
	AI_Output(self,other, " DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_01_01 " );		// Money, as you know, I don't have. But I will show you one technique that will allow you to better use your power in battle.
	AI_Output(self,other, " DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes_01_02 " );		// Would be nice.

	if(RhetorikSkillValue[1] >= 50)
	{
		AI_Output(self,other, " DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_03 " );	// Then listen. When you strike, use not only the strength of your hand, but also the momentum of your whole body.
		AI_Output(self,other, " DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_04 " );	// You must rotate your hip at the same time, bring your shoulder forward and straighten your arm.
		AI_Output(self,other, " DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_05 " );	// Your strike will be stronger and more accurate. You will understand it yourself when you try it.
		B_RaiseAttribute_Bonus(hero,ATR_STRENGTH,1);
	};
};

func void B_Ferros_FerrosAnySword_Yes2()
{
	AI_Output(self,other, " DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_00 " );	// Thank you! I owe you.
	AI_Output(self,other, " DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_01 " );	// In return, I'll show you a couple of tricks that will allow you to better use your strength and agility in combat.

	if(FerrosRing == TRUE)
	{
		AI_Output(self,other, " DIA_DJG_715_Ferros_FerrosAnySword_Blade_Yes2_01_02 " );	// Oh yeah, take this ring. Just don't lose it.
		B_GiveInvItems(self,hero,ItRi_FerrosRing, 1 );
	};

	Log_CreateTopic(TOPIC_Teacher,LOG_NOTE);
	B_LogEntry(TOPIC_Teacher, " Feros can increase my strength and agility. " );
};

func void B_Ferros_FerrosAnySword_No()
{
	AI_Output(other,self, " DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_15_00 " );	// No, I need it myself.
	AI_Output(self,other, " DIA_DJG_715_Ferros_FerrosAnySword_Blade_No_01_01 " );	// I understand.
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_Yes()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems(other,self,ItMw_1H_Special_01,1);
	B_Ferros_FerrosAnySword_Yes2();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FErrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Silverblade_No()
{
	B_Ferros_FerrosAnySword_No();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_Yes()
{
	B_Ferros_FerrosAnySword_Yes1();
	B_GiveInvItems(other,self,ItMw_1H_Special_02,1);
	B_Ferros_FerrosAnySword_Yes2();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
	MIS_FErrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};

func void DIA_DJG_715_Ferros_FerrosAnySword_Oreblade_No()
{
	B_Ferros_FerrosAnySword_No();
	Info_ClearChoices(DIA_DJG_715_Ferros_FerrosAnySword);
};

instance DIA_DJG_715_Ferros_FerrosHisSword (C_Info)
{
	npc = DJG_715_Ferros;
	nr = 6;
	condition = DIA_DJG_715_Ferros_FerrosHisSword_Condition;
	information = DIA_DJG_715_Ferros_FerrosHisSword_Info;
	permanent = FALSE;
	description = " I found your sword. " ;
};

func int DIA_DJG_715_Ferros_FerrosHisSword_Condition()
{
	if((MIS_FErrosSword == LOG_Running) && (Npc_HasItems(other,ItMW_1H_FerrosSword_Mis) >= 1))
	{
		return TRUE;
	};
};

func void DIA_DJG_715_Ferros_FerrosHisSword_Info()
{
	AI_Output(other,self, " DIA_DJG_715_Ferros_FerrosHisSword_15_00 " );	// I found your sword.
	B_GiveInvItems(other,self,ItMW_1H_FerrosSword_Mis,1);
	B_Ferros_FerrosAnySword_Yes2();
	MIS_FErrosSword = LOG_SUCCESS;
	B_GivePlayerXP(XP_FerrosSword);
};


instance DIA_Ferros_Teach (C_Info)
{
	npc = DJG_715_Ferros;
	nr = 1;
	condition = DIA_Ferros_Teach_Condition;
	information = DIA_Ferros_Teach_Info;
	permanent = TRUE;
	description = " Show me how I can improve my abilities. " ;
};


func int DIA_Ferros_Teach_Condition()
{
	if(MIS_FErrosSword == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Ferros_Teach_Info()
{
	AI_Output(other,self, " DIA_Ferros_Teach_15_00 " );	// Show me how to improve my abilities.
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other, " DIA_Ferros_Teach_01_01 " );	// After all these orc attacks, I don't do it anymore. I'm glad I'm still alive, man.
	}
	else
	{
		AI_Output(self,other, " DIA_Ferros_Teach_01_02 " );	// A good fighter should be able to transfer their abilities directly to their weapons.
		Info_ClearChoices(DIA_Ferros_Teach);
		Info_AddChoice(DIA_Ferros_Teach,Dialog_Back,DIA_Ferros_Teach_Back);
		Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ferros_Teach_STR_1);
		Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ferros_Teach_STR_5);
		Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ferros_Teach_DEX_1);
		Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ferros_Teach_DEX_5);
	};
};

func void DIA_Ferros_Teach_Back()
{
	Info_ClearChoices(DIA_Ferros_Teach);
};

func void DIA_Ferros_Teach_STR_1()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,1,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),DIA_Ferros_Teach_STR_1);
};

func void DIA_Ferros_Teach_STR_5()
{
	B_TeachAttributePoints(self,other,ATR_STRENGTH,5,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),DIA_Ferros_Teach_STR_5);
};

func void DIA_Ferros_Teach_DEX_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Ferros_Teach_DEX_1);
};

func void DIA_Ferros_Teach_DEX_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MED);
	Info_AddChoice(DIA_Ferros_Teach,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Ferros_Teach_DEX_5);
};


instance DIA_Ferros_AllDragonsDead (C_Info)
{
	npc = DJG_715_Ferros;
	nr = 5;
	condition = DIA_Ferros_AllDragonsDead_Condition;
	information = DIA_Ferros_AllDragonsDead_Info;
	permanent = FALSE;
	description = " All dragons are dead. " ;
};


func int DIA_Ferros_AllDragonsDead_Condition()
{
	if(MIS_AllDragonsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ferros_AllDragonsDead_Info()
{
	AI_Output(other,self, " DIA_Ferros_AllDragonsDead_15_00 " );	// All dragons are dead.
	AI_Output(self,other, " DIA_Ferros_AllDragonsDead_01_01 " );	// Great! If we had more people like you, things might not have gone this far.
};


instance DIA_Ferros_PICKPOCKET (C_Info)
{
	npc = DJG_715_Ferros;
	nr = 900;
	condition = DIA_Ferros_PICKPOCKET_Condition;
	information = DIA_Ferros_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Ferros_PICKPOCKET_Condition()
{
	return  C_Robbery ( 56 , 75 );
};

func void DIA_Ferros_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
	Info_AddChoice(DIA_Ferros_PICKPOCKET,Dialog_Back,DIA_Ferros_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ferros_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Ferros_PICKPOCKET_DoIt);
};

func void DIA_Ferros_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
};

func void DIA_Ferros_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ferros_PICKPOCKET);
};
