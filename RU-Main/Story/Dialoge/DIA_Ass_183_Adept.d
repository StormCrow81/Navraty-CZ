instance DIA_Ass_183_Adept_EXIT(C_Info)
{
	npc = Ass_183_Adept;
	No. = 999 ;
	condition = DIA_Ass_183_Adept_exit_condition;
	information = DIA_Ass_183_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_183_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_183_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_183_Adept_Hello(C_Info)
{
	npc = Ass_183_Adept;
	no. = 1 ;
	condition = DIA_Ass_183_Adept_hello_condition;
	information = DIA_Ass_183_Adept_hello_info;
	permanent = FALSE ;
	description = "Кто ты?";
};
	
func int DIA_Ass_183_Adept_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_183_Adept_hello_info()
{
	AI_Output(other,self,"DIA_Ass_183_Adept_hello_01_01");	//Who are you?
	AI_Output (self, other, " DIA_Ass_183_Adept_hello_01_02 " );	// My name is Kadu ibn Akbar ibn Imam ibn Hasim ibn Salim ibn Aman ibn Jadir ibn Omar ibn Khalid bin Haji al Mudari.
	AI_Output (other, self, " DIA_Ass_183_Adept_hello_01_03 " );	// Um...?
	AI_Output (self, other, " DIA_Ass_183_Adept_hello_01_04 " );	// My brothers just call me Caduin for short.
	AI_Output(other,self,"DIA_Ass_183_Adept_hello_01_05");	//Thank Beliar for that.
};	

instance DIA_Ass_183_Adept_WhatDo(C_Info)
{
	npc = Ass_183_Adept;
	no. = 1 ;
	condition = DIA_Ass_183_Adept_WhatDo_condition;
	information = DIA_Ass_183_Adept_WhatDo_info;
	permanent = FALSE ;
	description = " What are you doing here? " ;
};
	
func int DIA_Ass_183_Adept_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_183_Adept_Hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_183_Adept_WhatDo_info()
{
	AI_Output (other, self, " DIA_Ass_183_Adept_WhatDo_01_01 " );	// What are you doing here?
	AI_Output (self, other, " DIA_Ass_183_Adept_WhatDo_01_02 " );	// I'm usually here running errands for Master Nrozas.
	AI_Output (self, other, " DIA_Ass_183_Adept_WhatDo_01_03 " );	// I get him all sorts of ingredients that he usually uses in his experiments with poisons.
	AI_Output (self, other, " DIA_Ass_183_Adept_WhatDo_01_04 " );	// But you, I think, will not be too interested in hearing about all that.
};
	
instance DIA_Ass_183_Adept_TalkAboutJoin(C_Info)
{
	npc = Ass_183_Adept;
	no. = 1 ;
	condition = DIA_Ass_183_Adept_TalkAboutJoin_condition;
	information = DIA_Ass_183_Adept_TalkAboutJoin_info;
	permanent = FALSE ;
	description = " You look a little upset. " ;
};
	
func int DIA_Ass_183_Adept_TalkAboutJoin_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_183_Adept_Hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_183_Adept_TalkAboutJoin_info()
{
	AI_Output (other, self, " DIA_Ass_183_Adept_TalkAboutJoin_01_00 " );	// You look a little upset.
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_01_01 " );	// (dejected) Is it that noticeable? Although, you're right. I really have a little problem.
	AI_Output(other,self,"DIA_Ass_183_Adept_TalkAboutJoin_01_02");	//What's the matter?
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_01_03 " );	// The fact is that Master Nrozas sent me to retrieve a rare poisonous extract from the core of a muritan's fang.
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_01_04 " );	// But I have no idea where to look for it.
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_01_05 " );	// Besides, I heard that this creature is extremely dangerous, and finding one could cost me my life.
	AI_Output (other, self, " DIA_Ass_183_Adept_TalkAboutJoin_01_06 " );	// You can be sure of that.
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_01_07 " );	// see my problem? But if I return to Nrozas with nothing, he will skin me alive.
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_01_08 " );	// He doesn't like to be dissapointed.
	AI_Output (other, self, " DIA_Ass_183_Adept_TalkAboutJoin_01_09 " );	// Maybe I can help you in this matter?
	AI_Output (other, self, " DIA_Ass_183_Adept_TalkAboutJoin_01_10 " );	// I heard that Prior Tiamant has a Muritan fang.
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_01_11 " );	// That's just the point. Nrozas had already talked about it with Tiamant, but he refused.
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_01_12 " );	// Nrozas was then so furious that he nearly killed a few of his own men!
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_01_13 " );	// Then he sent me to look for the cursed thing.
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_01_14 " );	// What did I do to deserve this?
	MIS_KaduinTooth = LOG_Running;
	B_LogEntry (TOPIC_Intriges, " Master Nrozas ordered poor Caduin to retrieve a Muritan's poisonous fang. Nrozas has already approached Prior Tiamant, who has one, but refused him. If I help Caduin, it will help me find out more about Nrozas and Tiamant. " );
	Wld_InsertNpc(Muritan_PW_02,"PW_MURITAN_02");
};	


instance DIA_Ass_183_Adept_TalkAboutJoin_Done(C_Info)
{
	npc = Ass_183_Adept;
	no. = 1 ;
	condition = DIA_Ass_183_Adept_TalkAboutJoin_Done_condition;
	information = DIA_Ass_183_Adept_TalkAboutJoin_Done_info;
	permanent = FALSE ;
	description = " I have a Muritan's Fang with me. " ;
};
	
func int DIA_Ass_183_Adept_TalkAboutJoin_Done_condition()
{
	if((MIS_KaduinTooth == LOG_Running) && (Npc_HasItems(other,ItAt_PW_MuritanTooth) >= 1))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_183_Adept_TalkAboutJoin_Done_info()
{
	B_GivePlayerXP(200);
	AI_Output (other, self, " DIA_Ass_183_Adept_TalkAboutJoin_Done_01_00 " );	// I have a muritan fang with me. And I could give it to you.
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_Done_01_01 " );	// What? Are you kidding me, buddy?
	AI_Output (other, self, " DIA_Ass_183_Adept_TalkAboutJoin_Done_01_02 " );	// I personally finished off one of these critters.
	AI_Output (other, self, " DIA_Ass_183_Adept_TalkAboutJoin_Done_01_03 " );	// I don't need it, but it could be useful to you.
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_Done_01_04 " );	// (confused) Well, it would literally save my hide! What do you want for it?
	AI_Output (other, self, " DIA_Ass_183_Adept_TalkAboutJoin_Done_01_05 " );	// It will be enough for me if you just answer one of my questions.
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_Done_01_06 " );	// Agreed. Ask me anything!
	AI_Output (other, self, " DIA_Ass_183_Adept_TalkAboutJoin_Done_01_07 " );	// Here's what I'm interested in: How does Prior Nrozas feel about Prior Tiamant?
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_Done_01_08 " );	// How ... They didn't get along very well until recently.
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_Done_01_09 " );	// And after the whole "fang" conversation, Nrozas seems to harbor an even stronger grudge against Tiamant.
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_Done_01_10 " );	// At least that's what It seems like, since Nrozas constantly mutters to himself that someday he will have his revenge.
	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_Done_01_11 " );	// I don't really know anything more.
	AI_Output (other, self, " DIA_Ass_183_Adept_TalkAboutJoin_Done_01_12 " );	// That will do. Here, don't cut yourself, I hear its quite poisonous.
	B_GiveInvItems(other,self,ItAt_PW_MuritanTooth,1);
	Npc_RemoveInvItems(self,ItAt_PW_MuritanTooth,1);

	if(Trophy_MuritanTooth  == TRUE)
	{
		if((Npc_HasItems(other,ItAt_PW_MuritanTooth) == FALSE) && (Npc_HasItems(other,ItAt_BuritanTooth) == FALSE))
		{
			Ext_RemoveFromSlot(other,"BIP01 PELVIS");
			Npc_RemoveInvItems(other,ItUt_MuritanTooth,Npc_HasItems(other,ItUt_MuritanTooth));
			Trophy_MuritanTooth  = FALSE;
		};
	};

	AI_Output (self, other, " DIA_Ass_183_Adept_TalkAboutJoin_Done_01_13 " );	// Thanks buddy! You just saved me.
	MIS_KaduinTooth = LOG_SUCCESS;
	KnowNrozasToTiamant = TRUE;
	B_LogEntry (TOPIC_Intriges, " Nrozas seems to harbor a deep grudge against Tiamant and wants revenge on him. I'm sure Haniar will be greatly interested in that. " );
};	

instance DIA_Ass_183_Adept_Trade(C_Info)
{
	npc = Ass_183_Adept;
	n ° = 80 ;
	condition = DIA_Ass_183_Adept_Trade_Condition;
	information = DIA_Ass_183_Adept_Trade_Info;
	trade = TRUE;
	permanent = TRUE;
	description = " What can you suggest? " ;
};

func int DIA_Ass_183_Adept_Trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ass_183_Adept_WhatDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ass_183_Adept_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output (other, self, " DIA_Addon_Martin_Trade_15_00 " );	// What can you suggest?
	B_GiveTradeInv(self);
};
