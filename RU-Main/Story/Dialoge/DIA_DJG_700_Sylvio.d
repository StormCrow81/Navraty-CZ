
instance DIA_SylvioDJG_EXIT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 999;
	condition = DIA_SylvioDJG_EXIT_Condition;
	information = DIA_SylvioDJG_EXIT_Info;
	important = 0;
	permanent = 1;
	description = Dialog_Ende;
};


func int DIA_SylvioDJG_EXIT_Condition()
{
	return  1 ;
};

func void DIA_SylvioDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SylvioDJG_HelloAgain(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_HelloAgain_Condition;
	information = DIA_SylvioDJG_HelloAgain_Info;
	important = TRUE;
};


func int DIA_SylvioDJG_HelloAgain_Condition()
{
	if ((Npc_IsDead(IceDragon) ==  FALSE ) && (IceDragon.aivar[AIV_TalkedToPlayer] ==  FALSE ) && (SylvioCampUp ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_HelloAgain_Info()
{
	if((other.guild == GIL_SLD) || (other.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_SylvioDJG_HelloAgain_09_00 " );	// Well I'll be damned! You also decided to earn extra money, huh? I knew it! You have the soul of a mercenary.
		AI_Output(self,other, " DIA_SylvioDJG_HelloAgain_09_01 " );	// Look, if you think you're going to rake in a lot of gold here, you're sorely mistaken. I was here first.
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other, " DIA_SylvioDJG_HelloAgain_09_02 " );	// Hey you! I'm sick of mages! Go somewhere else! There is nothing here for you, stinking wizard!
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_SylvioDJG_HelloAgain_09_02A " );	// Hey you, swamp scum! One never know what to expect from you guys. Take a walk somewhere else. There's nothing for you here.
	}
	else
	{
		AI_Output(self,other, " DIA_SylvioDJG_HelloAgain_09_03 " );	// Hey paladin! Go back to your mine. There is nothing here for you.
	};
	AI_Output(other,self, " DIA_SylvioDJG_HelloAgain_15_04 " );	// Got it. Nobody wants to part with the loot.
	AI_Output(self,other, " DIA_SylvioDJG_HelloAgain_09_05 " );	// You said it yourself. Disappear.
};


instance DIA_Sylvio_VERSAGER (C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 6;
	condition = DIA_Sylvio_VERSAGER_Condition;
	information = DIA_Sylvio_VERSAGER_Info;
	description = " What if I don't disappear? " ;
};


func int DIA_Sylvio_VERSAGER_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_SylvioDJG_HelloAgain ) && ( IceDragon . aivar [ AIV_TalkedToPlayer ] ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Sylvio_VERSAGER_Info()
{
	AI_Output(other,self, " DIA_Sylvio_VERSAGER_15_00 " );	// What if I don't disappear?
	AI_Output(self,other, " DIA_Sylvio_VERSAGER_09_01 " );	// Don't play tough, upstart, or you'll end up the same way as those losers lying in the snow.
};


instance DIA_Sylvio_DEINELEUTE (C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 7;
	condition = DIA_Sylvio_DEINELEUTE_Condition;
	information = DIA_Sylvio_DEINELEUTE_Info;
	description = " Are these your people? " ;
};


func int DIA_Sylvio_DEINELEUTE_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Sylvio_VERSAGER ) && ( IceDragon . aivar [ AIV_TalkedToPlayer ] ==  FALSE ) && ( MY_DJG_Sylvio_KillIceGolem ==  0 )) ;
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DEINELEUTE_Info()
{
	AI_Output(other,self, " DIA_Sylvio_DEINELEUTE_15_00 " );	// Are these your people?
	AI_Output(self,other, " DIA_Sylvio_DEINELEUTE_09_01 " );	// Not anymore. Not such a big loss. Those idiots weren't worth much anyway.
};


instance DIA_Sylvio_WASISTPASSIERT (C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 8;
	condition = DIA_Sylvio_WASISTPASSIERT_Condition;
	information = DIA_Sylvio_WASISTPASSIERT_Info;
	description = " What happened to them? " ;
};


func int DIA_Sylvio_WASISTPASSIERT_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Sylvio_VERSAGER ) && ( IceDragon . aivar [ AIV_TalkedToPlayer ] ==  FALSE ) && ( SylvioCampUp ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASISTPASSIERT_Info()
{
	AI_Output(other,self, " DIA_Sylvio_WASISTPASSIERT_15_00 " );	// What happened to them?
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_09_01 " );	// They couldn't get past those frost giants. They trampled them.
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_09_02 " );	// If you're so powerful, maybe you could try?
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT, " Okay. Why not? " ,DIA_Sylvio_WASISTPASSIERT_ok);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT, " How will it help you if I do this? " ,DIA_Sylvio_WASISTPASSIERT_washastdudavon);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT, " What will happen to me? " ,DIA_Sylvio_WASISTPASSIERT_warum);
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT, " Why don't you deal with them yourself? " ,DIA_Sylvio_WASISTPASSIERT_selbst);
	Log_CreateTopic(TOPIC_SylvioKillIceGolem,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SylvioKillIceGolem,LOG_Running);
	B_LogEntry(TOPIC_SylvioKillIceGolem, " Sylvio got scared of two ice golems at the entrance to the snowy region of the Valley of Mines. " );
	MIS_DJG_Sylvio_KillIceGolem = LOG_Running;
};

func void DIA_Sylvio_WHAT HAPPENS_self()
{
	AI_Output(other,self, " DIA_Sylvio_WASISTPASSIERT_selbst_15_00 " );	// Why don't you deal with them yourself?
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_selbst_09_01 " );	// Come on, come on. Don't talk nonsense.
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_selbst_09_02 " );	// I think your knees are shaking.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT, " I don't play your games. " ,DIA_Sylvio_WASISTPASSIERT_keinInteresse);
};


var int DJG_Sylvio_PromisedMoney;

func void DIA_Sylvio_WASISTPASSIERT_why()
{
	AI_Output(other,self, " DIA_Sylvio_WASISTPASSIERT_warum_15_00 " );	// What do I get for this?
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_warum_09_01 " );	// I don't know. Let's say... a hundred gold coins. Fine?
	DJG_Sylvio_PromisedMoney = TRUE;
};

func void DIA_Sylvio_WASISTPASSIERT_washastdudavon()
{
	AI_Output(other,self, " DIA_Sylvio_WASISTPASSIERT_washastdudavon_15_00 " );	// How will it help you if I do this?
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_01 " );	// You don't care. But, answering your question, I will say: I want to get into this icy region.
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_washastdudavon_09_02 " );	// Unfortunately, these damn things are in my way.
	Info_AddChoice(DIA_Sylvio_WASISTPASSIERT, " What are you doing in this icy region? " ,DIA_Sylvio_WASISTPASSIERT_Eisregion);
};

func void DIA_Sylvio_WASISTPASSIERT_no interest()
{
	AI_Output(other,self, " DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_15_00 " );	// I don't play your games.
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_keinInteresse_NEIN_09_01 " );	// Ahh. Then get out of here, you coward.
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WHAT HAPPENED_ice region()
{
	AI_Output(other,self, " DIA_Sylvio_WASISTPASSIERT_keinInteresse_15_00 " );	// What are you doing in this icy area?
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_01 " );	// Will you ever stop asking questions, huh? Okay, I'll tell you.
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02 " );	// There, behind these cliffs, is an icy valley. You've never seen one like it before.
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03 " );	// An ice dragon lurks there with its horde.
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04 " );	// I need this alright? Yes or no?
};

func void DIA_Sylvio_WASISTPASSIERT_ok()
{
	AI_Output(other,self, " DIA_Sylvio_WASISTPASSIERT_ok_15_00 " );	// sure. Why not?
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_ok_09_01 " );	// Then hurry up. I can not wait long.
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_ICEGOLEMSKILLED(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 9;
	condition = DIA_Sylvio_ICEGOLEMSKILLED_Condition;
	information = DIA_Sylvio_ICEGOLEMSKILLED_Info;
	description = " Your path is clear! " ;
};


func int DIA_Sylvio_ICEGOLEMSKILLED_Condition()
{
	if (Npc_IsDead(IceGolem_Sylvio1) && Npc_IsDead(IceGolem_Sylvio2) && (MY_DJG_Sylvio_KillIceGolem == LOG_Running) && (IceDragon.aivar[AIV_TalkedToPlayer] ==  FALSE ) && (SylvioCampUp ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Sylvio_ICEGOLEMSKILLED_Info()
{
	AI_Output(other,self, " DIA_Sylvio_ICEGOLEMSKILLED_15_00 " );	// Your path is clear! There are no more ice giants.
	AI_Output(self,other, " DIA_Sylvio_ICEGOLEMSKILLED_09_01 " );	// Great job. Let's see what we have there.
	if(DJG_Sylvio_PromisedMoney == TRUE)
	{
		AI_Output(other,self, " DIA_Sylvio_ICEGOLEMSKILLED_15_02 " );	// Wait a minute. How about my money?
		AI_Output(self,other, " DIA_Sylvio_ICEGOLEMSKILLED_09_03 " );	// In due time.
	};
	AI_StopProcessInfos(self);
	MIS_DJG_Sylvio_KillIceGolem = LOG_SUCCESS;
	B_GivePlayerXP(XP_SylvioDJGIceGolemDead);
	Npc_ExchangeRoutine(self,"IceWait1");
	B_StartOtherRoutine(DJG_Bullco,"IceWait1");
};


instance DIA_Sylvio_WASJETZT (C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 10;
	condition = DIA_Sylvio_WASJETZT_Condition;
	information = DIA_Sylvio_WASJETZT_Info;
	description = " What else? " ;
};


func int DIA_Sylvio_WASJETZT_Condition()
{
	if ((MY_DJG_Sylvio_KillIceGolem ==  LOG_SUCCESS ) && (IceDragon.aivar[AIV_TalkedToPlayer] ==  FALSE ) && (SylvioCampUp ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Sylvio_WASJETZT_Info()
{
	AI_Output(other,self, " DIA_Sylvio_WASJETZT_15_00 " );	// What else?
	AI_Output(self,other, " DIA_Sylvio_WASJETZT_09_01 " );	// Well....I don't really like the atmosphere there!
	AI_Output(self,other, " DIA_Sylvio_WASJETZT_09_02 " );	// It's best if you go ahead and I follow you.
	Info_AddChoice(DIA_Sylvio_WASJETZT, " Okay let's go. " ,DIA_Sylvio_WASJETZT_ok);
	Info_AddChoice(DIA_Sylvio_WASJETZT, " Are you scared? " ,DIA_Sylvio_WASJETZT_trennen);
	Info_AddChoice(DIA_Sylvio_WASJETZT, " I'm not going to do all your dirty work for you. " ,DIA_Sylvio_WASJETZT_nein);
	if(DJG_Sylvio_PromisedMoney == TRUE)
	{
		Info_AddChoice(DIA_Sylvio_WASJETZT, " I want to see my money first. " ,DIA_Sylvio_WASJETZT_Geld);
	};
};

func void DIA_Sylvio_WASNOW_separate()
{
	AI_Output(other,self, " DIA_Sylvio_WASJETZT_trennen_15_00 " );	// Are you afraid?
	AI_Output(self,other, " DIA_Sylvio_WASJETZT_trennen_09_01 " );	// Stop talking, keep walking!
};

func void DIA_Sylvio_WASJETZT_ok()
{
	AI_Output(other,self, " DIA_Sylvio_WASJETZT_ok_15_00 " );	// Okay, let's go.
	AI_Output(self,other, " DIA_Sylvio_WASJETZT_ok_09_01 " );	// Come on, hurry up!
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_no()
{
	AI_Output(other,self, " DIA_Sylvio_WASJETZT_nein_15_00 " );	// I'm not going to do all the dirty work for you.
	AI_Output(self,other, " DIA_Sylvio_WASJETZT_nein_09_01 " );	// Coward!
	AI_StopProcessInfos(self);
};

func void DIA_Sylvio_WASJETZT_Geld()
{
	AI_Output(other,self, " DIA_Sylvio_WASJETZT_Geld_15_00 " );	// First, I want to see my money.
	AI_Output(self,other, " DIA_Sylvio_WASJETZT_Geld_09_01 " );	// When we kill the dragon, you'll have so much money you won't be able to carry it.
	Info_AddChoice(DIA_Sylvio_WASJETZT, " I want my money now. " ,DIA_Sylvio_WASJETZT_jetztGeld);
};

func void DIA_Sylvio_WASJETZT_nowMoney()
{
	AI_Output(other,self, " DIA_Sylvio_WASJETZT_jetztGeld_15_00 " );	// I want my money now.
	AI_Output(self,other, " DIA_Sylvio_WASJETZT_jetztGeld_09_01 " );	// Either you go ahead of me, or I'll have to deal with you.
};


instance DIA_Sylvio_KOMMSTDU (C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 11;
	condition = DIA_Sylvio_KOMMSTDU_Condition;
	information = DIA_Sylvio_KOMMSTDU_Info;
	permanent = TRUE;
	description = " I thought you were heading for an icy area. " ;
};


func int DIA_Sylvio_KOMMSTDU_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Sylvio_WASJETZT) && (TOPIC_END_SylvioKillIceGolem ==  FALSE ) && (Npc_IsDead(IceDragon) ==  FALSE ) && (IceDragon.aivar[AIV_TalkedToPlayer] ==  FALSE ) && (SylvioCampUp )) ==  FALSE ;
	{
		return TRUE;
	};
};

func void DIA_Sylvio_KOMMSTDU_Info()
{
	AI_Output(other,self, " DIA_Sylvio_KOMMSTDU_15_00 " );	// I thought you were heading for the icy area.
	AI_Output(self,other, " DIA_Sylvio_KOMMSTDU_09_01 " );	// Go ahead! And I'll go behind.
	AI_StopProcessInfos(self);
};


instance DIA_Sylvio_DUHIER (C_Info) .
{
	npc = DJG_700_Sylvio;
	nr = 11;
	condition = DIA_Sylvio_DUHIER_Condition;
	information = DIA_Sylvio_DUHIER_Info;
	permanent = TRUE;
	description = " I could use your help. " ;
};


func int DIA_Sylvio_DUHIER_Condition()
{
	if ((Npc_IsDead(IceDragon) ==  FALSE ) && (IceDragon.aivar[AIV_TalkedToPlayer] ==  TRUE ) && (TOPIC_END_SylvioKillIceGolem ==  FALSE ) && (Npc_IsDead(IceDragon) ==  FALSE ) && (SylvioCampUp ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Sylvio_DUHIER_Info()
{
	AI_Output(other,self, " DIA_Sylvio_DUHIER_15_00 " );	// I could use your help.
	AI_Output(self,other, " DIA_Sylvio_DUHIER_09_01 " );	// Nonsense! You are doing a great job.
	AI_StopProcessInfos(self);
};


instance DIA_SylvioDJG_WHATNEXT(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 12;
	condition = DIA_SylvioDJG_WHATNEXT_Condition;
	information = DIA_SylvioDJG_WHATNEXT_Info;
	important = TRUE;
};


func int DIA_SylvioDJG_WHATNEXT_Condition()
{
	if ( Npc_IsDead ( IceDragon ) && ( SylvioCampUp ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_WHATNEXT_Info()
{
	AI_Output(self,other, " DIA_SylvioDJG_WHATNEXT_09_00 " );	// The ice dragon is dead! And now you give me everything you have!
	AI_Output(other,self,"DIA_SylvioDJG_WHATNEXT_15_01");	//Never!
	AI_Output(self,other, " DIA_SylvioDJG_WHATNEXT_09_02 " );	// I'll get all the credit for killing the ice dragon.
	AI_Output(self,other, " DIA_SylvioDJG_WHATNEXT_09_03 " );	// And your little part in this story is over!
	TOPIC_END_SylvioKillIceGolem = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_SylvioDJG_WHATNEXT);
	Info_AddChoice(DIA_SylvioDJG_WHATNEXT,Dialog_Ende,DIA_SylvioDJG_WHATNEXT_ATTACK);
};

func void DIA_SylvioDJG_WHATNEXT_ATTACK()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(DJG_Bullco,"Start");
	B_LogEntry(TOPIC_Dragonhunter, " That dirty pig Silvio was going to claim my victory over the ice dragon! We had a bit of an argument... " );
	B_Attack(self,other,AR_NONE,1);
	B_Attack(DJG_Bullco,other,AR_NONE,1);
};

instance DIA_SylvioDJG_BUTNOW(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 13;
	condition = DIA_SylvioDJG_BUTNOW_Condition;
	information = DIA_SylvioDJG_BUTNOW_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_SylvioDJG_BUTNOW_Condition()
{
	if(Npc_IsDead(IceDragon) && (Npc_RefuseTalk(self) == FALSE) && Npc_KnowsInfo(other,DIA_SylvioDJG_WHATNEXT) && (SylvioCampUp == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_BUTNOW_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_Sylvio_PICKPOCKET(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 900;
	condition = DIA_Sylvio_PICKPOCKET_Condition;
	information = DIA_Sylvio_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Sylvio_PICKPOCKET_Condition()
{
	return  C_Robbery ( 78 , 560 );
};

func void DIA_Sylvio_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET,Dialog_Back,DIA_Sylvio_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Sylvio_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Sylvio_PICKPOCKET_DoIt);
};

func void DIA_Sylvio_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};

func void DIA_Sylvio_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sylvio_PICKPOCKET);
};



// -------------------------------- Silvio's Squad-------------- --------------------------------


instance DIA_SylvioDJG_Camp_Hello(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Hello_Condition;
	information = DIA_SylvioDJG_Camp_Hello_Info;
	important = TRUE;
};

func int DIA_SylvioDJG_Camp_Hello_Condition()
{
	if(SylvioCampUp == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Hello_Info()
{
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Hello_01_00 " );	// You again! You always get under my feet!
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Hello_01_01 " );	// And you didn't waste your time. Decided to appropriate the treasures of the ice dragon for yourself?!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Hello_01_02 " );	// It's all mine. Get close to it and die. Do you understand me?
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Hello_01_03 " );	// I thought you'd share with the rest of the guys.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Hello_01_04 " );	// Why should I? This mountain of gold has only ever known one master.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Hello_01_05 " );	// Do you even know what to do with so much gold?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Hello_01_06 " );	// I'm sure i'll think of something.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Hello_01_07 " );	// First, I must find a way to get it out of Khorinis...
};

instance DIA_SylvioDJG_Camp_Plan(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Plan_Condition;
	information = DIA_SylvioDJG_Camp_Plan_Info;
	permanent = FALSE;
	description = " Do you have a plan? " ;
};

func int DIA_SylvioDJG_Camp_Plan_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Plan_Info()
{
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Plan_01_00 " );	// Do you have a plan?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Plan_01_01 " );	// Yes, I have a plan. That's why I'm in charge!
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Plan_01_02 " );	// And what does it consist of?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Plan_01_03 " );	// I want to get off this damned island and take all this gold with me.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Plan_01_04 " );	// But for that, you'll need a ship.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Plan_01_05 " );	// Well aren't you smart! I never thought of that!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Plan_01_06 " );	// The only ship on the island is now in the harbor of Khorinis.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Plan_01_07 " );	// And I doubt the paladins will let us borrow it!
};

instance DIA_SylvioDJG_Camp_Bullco (C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Bullco_Condition;
	information = DIA_SylvioDJG_Camp_Bullco_Info;
	permanent = FALSE;
	description = " Where's your friend Bulko? " ;
};

func int DIA_SylvioDJG_Camp_Bullco_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Bullco_Info()
{
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Bullco_01_00 " );	// Where is your friend Bulko?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Bullco_01_01 " );	// The bastard has escaped. He said that he had had enough of all this bullshit.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Bullco_01_02 " );	// I hope he got eaten by the local critters!
};

instance DIA_SylvioDJG_Camp_Drakar (C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_Condition;
	info = DIA_SylvioDJG_Camp_Drakar_Info;
	permanent = FALSE;
	description = " There's another ship! " ;
};

func int DIA_SylvioDJG_Camp_Drakar_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Plan) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_Info()
{
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_01_00 " );	// There's another ship!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_02 " );	// Really?! And where is this imaginary boat?
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_01_03 " );	// On the other side of the valley is a huge orc drakar.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_04 " );	// Hmmm... Interesting... but it must be heavily guarded?
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_01_05 " );	// Most likely.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_06 " );	// So we'll have to get the orcs out of there somehow.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_01_07 " );	// Then go ahead, show them!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_08 " );	// You don't understand. We can't give up our gold!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_09 " );	// As soon as we're out of here, the greenskins will surely come here.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_10 " );	// And then we won't be able to see it!
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_01_11 " );	// What do you suggest?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_12 " );	// Well, you're the big hero, solve the problem.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_01_13 " );	// Why should I do that?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_14 " );	// (smiling) Well, we've had, let's say, a little friction up to this point.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_15 " );	// But if you help us now, I'm ready to share with you.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_01_16 " );	// Are you offering me gold that is rightfully mine?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_17 " );	// It's not yours anymore, mate. So, if you want some now, you have to help us.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_18 " );	// Agreed?
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_01_19 " );	// Okay. I'll try to come up with something.
	MIS_SylvioDrakar = LOG_Running;
	Log_CreateTopic(Topic_SylvioDrakar,LOG_MISSION);
	Log_SetTopicStatus(Topic_SylvioDrakar,LOG_Running);
	B_LogEntry(Topic_SylvioDrakar, " Sylvio wants me to help them capture the orc drakar. In return, he will share the ice dragon gold with me. " );
	AI_StopProcessInfos(self);

	if ( FLAG_ORCS_DRAKAR  ==  TRUE )
	{
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_01");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_02");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_03");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_04");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_05");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_06");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_07");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_08");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_09");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_10");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_11");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_12");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_13");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_14");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_15");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_16");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_17");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_18");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_19");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_20");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_21");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_22");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_23");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_24");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_25");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_26");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_27");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_28");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_29");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_30");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_31");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_32");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_33");
		Wld_InsertNpc(orcwarrior5,"FP_ROAM_DRAKARSHIP_34");
		Wld_InsertNpc(OrcElite_Rest,"FP_ROAM_DRAKARSHIP_35");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_01");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_02");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_03");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_04");
		Wld_InsertNpc(orkelite_bowmenrest,"FP_ROAM_DRAKARSHIP_BOWEN_05");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_01");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_02");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_03");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_04");
		Wld_InsertNpc(orkelite_addon3,"FP_ROAM_DRAKARSHIP_COMMAND_05");
		Wld_InsertNpc( ORKELITE_CHKFLG_SYLVIODRAKAR_CAPITAN , " FP_CAMPFIRE_DRAKARSHIP_CAPITAN " );
	};
};

instance DIA_SylvioDJG_Camp_Orcs(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Orcs_Condition;
	information = DIA_SylvioDJG_Camp_Orcs_Info;
	permanent = FALSE;
	description = " Have Orcs already tried to attack your camp? " ;
};

func int DIA_SylvioDJG_Camp_Orcs_Condition()
{
	if (Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Drakar) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Orcs_Info()
{
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Orcs_01_00 " );	// Orcs have already tried to attack your camp?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_01_01 " );	// Yes. But as you can see, they didn't succeed.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_01_02 " );	// This place is perfect for holding the line.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_01_03 " );	// I see no reason for us to leave this camp now.
};

instance DIA_SylvioDJG_Camp_OthTre(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_OthTre_Condition;
	information = DIA_SylvioDJG_Camp_OthTre_Info;
	permanent = FALSE;
	description = " What about other dragon treasures? " ;
};

func int DIA_SylvioDJG_Camp_OthTre_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_OthTre_Info()
{
	AI_Output(other,self, " DIA_SylvioDJG_Camp_OthTre_01_00 " );	// What about other dragons' treasures?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_OthTre_01_01 " );	// Hmmm... We'd take them too, but it's too dangerous!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_OthTre_01_02 " );	// The valley is full of orcs, and it's the only place where you can feel safe.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_OthTre_01_03 " );	// So we have no chance of even reaching them!
};

instance DIA_SylvioDJG_Camp_Drakar_Done (C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_Done_Condition;
	info = DIA_SylvioDJG_Camp_Drakar_Done_Info;
	permanent = FALSE;
	description = " Orc Drakar is clean! " ;
};

func int DIA_SylvioDJG_Camp_Drakar_Done_Condition()
{
	if ((MIS_SylvioDrakar == LOG_Running) && ( FLAG_ORCS_DRAKAR_02  ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_Done_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Done_01_00 " );	// The Orc drakar is clear!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_01 " );	// Great. Now we need to think about how to transport our gold to the ship.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Done_01_02 " );	// What about my share?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_03 " );	// Don't rush! There is another small problem here.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Done_01_04 " );	// What?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_05 " );	// I've been talking to the guys, and it turned out that none of them know how to handle the steering wheel.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_06 " );	// In that case, we won't even be able to sail away from here.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Done_01_07 " );	// Do you want me to find you a captain?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_08 " );	// (smirking) You're not a fool after all.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_09 " );	// Naturally, we need someone who can handle this kind of vessel.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_10 " );	// After all, it was your idea to take the ship from the orcs.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_11 " );	// Now get us what we need!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_12 " );	// Oh, and one more thing... We could also use a good cook on the ship.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_13 " );	// We can't eat gold out at sea now can we?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_14 " );	// I hope I'm making myself clear?
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Done_01_15");	//Quite.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_16 " );	// Then get down to business, Mr. Hero!
	MIS_SylvioDrakar = LOG_Success;
	Log_SetTopicStatus(Topic_SylvioDrakar,LOG_Success);
	B_LogEntry(Topic_SylvioDrakar, " Sylvio was glad that the orc drakar was no longer guarded. " );
	MIS_SylvioCrew = LOG_Running;
	Log_CreateTopic(Topic_SylvioCrew,LOG_MISSION);
	Log_SetTopicStatus(Topic_SylvioCrew,LOG_Running);
	) ; _ _ _
	AI_StopProcessInfos(self);
};

instance DIA_SylvioDJG_Camp_Orcs_Up(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Orcs_Up_Condition;
	information = DIA_SylvioDJG_Camp_Orcs_Up_Info;
	permanent = FALSE;
	description = " What about the orcs above this cave? " ;
};

func int DIA_SylvioDJG_Camp_Orcs_Up_Condition()
{
	if((Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Orcs) == TRUE) && (FLAG_ORCS_CHK_27 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Orcs_Up_Info()
{
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Orcs_Up_01_00 " );	// What about the orcs above this cave?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_01_01 " );	// What do you mean?
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Orcs_Up_01_02 " );	// They had a small camp there. What, you didn't know about it?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_01_03 " );	// No, damn you! Why were you silent earlier?
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Orcs_Up_01_04 " );	// It never came up.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_01_05 " );	// We're all in danger now! You must kill them! Kill them all!
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Orcs_Up_01_06 " );	// What, me again?!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_01_07 " );	// But you're the one who told me about this camp. Besides, we can't leave now!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_01_08 " );	// So come on, do what you do best!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_01_09 " );	// Spill some greenskin blood!!
	MIS_SylvioOrcs = LOG_Running;
	Log_CreateTopic(Topic_SylvioOrcs,LOG_MISSION);
	Log_SetTopicStatus(Topic_SylvioOrcs,LOG_Running);
	B_LogEntry(Topic_SylvioOrcs, " Sylvio almost fainted when he learned about the orc camp above the Ice Dragon Cave. Now I have to make sure the orcs don't give him us future headaches. " );
	AI_StopProcessInfos(self);
};

instance DIA_SylvioDJG_Camp_Orcs_Up_Done(C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Orcs_Up_Done_Condition;
	information = DIA_SylvioDJG_Camp_Orcs_Up_Done_Info;
	permanent = FALSE;
	description = " Forget about the orcs above the cave. " ;
};

func int DIA_SylvioDJG_Camp_Orcs_Up_Done_Condition()
{
	if((MIS_SylvioOrcs == LOG_Running) && (FLAG_ORCS_CHK_27 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Orcs_Up_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Orcs_Up_Done_01_00 " );	// You can forget about the orcs above the cave.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_Done_01_01 " );	// Tell me what I want to hear...
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Orcs_Up_Done_01_02 " );	// Because they are no longer there.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_Done_01_03 " );	// HA! You are truly a killer, my friend.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_Done_01_04 " );	// Now get on with other things. I'm sure there are many.
	MIS_SylvioOrcs = LOG_Success;
	Log_SetTopicStatus(Topic_SylvioOrcs,LOG_Success);
	B_LogEntry(Topic_SylvioOrcs, " I reassured Silvio that there were no more orcs over the dragon's cave. " );
	AI_StopProcessInfos(self);
};

instance DIA_SylvioDJG_Camp_Drakar_Crew (C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_Crew_Condition;
	info = DIA_SylvioDJG_Camp_Drakar_Crew_Info;
	permanent = TRUE;
	description = " About your captain... " ;
};

func int DIA_SylvioDJG_Camp_Drakar_Crew_Condition()
{
	if(MIS_SylvioCrew == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_Crew_Info()
{
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Crew_01_00 " );	// About your captain...
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Crew_01_01 " );	// Yes? What do you say?


	if(Npc_IsDead(xbs_7510_ratford) == TRUE)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Crew_01_02 " );	// I'm afraid I can't find a captain anywhere.
		AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Crew_01_03 " );	// And hardly anyone in Khorinis would agree to come here.
		AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Crew_01_04 " );	// Damn! Okay, let's think of something ourselves.
		AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Crew_01_05 " );	// Now it's time for us to move out...
		AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Crew_01_06 " );	// Have you forgotten about my share?
		AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Crew_01_07 " );	// Later! Let's get to the ship, and there we'll talk about your reward.
		MIS_SylvioCrew = LOG_Success;
		Log_SetTopicStatus(Topic_SylvioCrew,LOG_Success);
		B_LogEntry(Topic_SylvioCrew, " I informed Silvio that I couldn't find a captain in the valley. " );
		AI_StopProcessInfos(self);
	}
	else
	{
		if(RatfordAgree == TRUE)
		{
			B_GivePlayerXP(1000);
			AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Crew_01_08 " );	// A guy named Ratford is ready to take on the job.
			AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Crew_01_09 " );	// But first, you'll have to pay him at least five hundred coins.
			AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Crew_01_10 " );	// Five hundred coins?! Ah, okay! We don't have a choice.
			AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Crew_01_11 " );	// He said he'll be waiting for you on the ship.
			AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Crew_01_12 " );	// Good! We will be heading there soon too.
			AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Crew_01_13 " );	// Have you forgotten about my share?
			AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Crew_01_14 " );	// Later! We'll discuss it when we get there.
			MIS_SylvioCrew = LOG_Success;
			Log_SetTopicStatus(Topic_SylvioCrew,LOG_Success);
			B_LogEntry(Topic_SylvioCrew, " I've informed Silvio that Ratford has agreed to be captain of the Drakar. " );
			AI_StopProcessInfos(self);
		}
		else
		{
			AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Crew_01_15 " );	// Nothing yet.
			AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Crew_01_16 " );	// Then why are you bothering me? Better get busy!
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_SylvioDJG_Camp_Drakar_Cook (C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_Cook_Condition;
	info = DIA_SylvioDJG_Camp_Drakar_Cook_Info;
	permanent = FALSE;
	description = " I found a chef for you. " ;
};

func int DIA_SylvioDJG_Camp_Drakar_Cook_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Drakar_Done) ==  TRUE ) && (Npc_IsDead(STRF_1107_Straefling) ==  FALSE ) && (ClifAgree ==  TRUE ) && (MoveDracarBoard ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_Cook_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Cook_01_00 " );	// I found you a cook.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Cook_01_01 " );	// Okay... I hope he can cook.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Cook_01_02 " );	// The paladins in the castle didn't seem to complain about him.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Cook_01_03 " );	// Well, in that case everything is looking good.
};

instance DIA_DJG_700_Sylvio_FuckOff(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 13;
	condition = DIA_DJG_700_Sylvio_FuckOff_Condition;
	information = DIA_DJG_700_Sylvio_FuckOff_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_DJG_700_Sylvio_FuckOff_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (MoveDracarBoard == TRUE) && (MIS_SylvioDebts == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DJG_700_Sylvio_FuckOff_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_SylvioDJG_Camp_Drakar_LastChance (C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_LastChance_Condition;
	info = DIA_SylvioDJG_Camp_Drakar_LastChance_Info;
	permanent = FALSE;
	description = " You didn't pay Ratford. " ;
};

func int DIA_SylvioDJG_Camp_Drakar_LastChance_Condition()
{
	if((MoveDracarBoard == TRUE) && (MIS_SylvioDebts == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_LastChance_Info()
{
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_LastChance_01_00 " );	// You didn't pay Ratford.
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChance_01_01");	//So?
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_LastChance_01_02 " );	// But you promised you'd pay him!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChance_01_03 " );	// Why should I pay him?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChance_01_04 " );	// I thought we were going to sea right away! But instead we're stuck here because the ship's rudder is broken.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChance_01_05 " );	// So he won't get a penny from me until he fixes it.
};

instance DIA_SylvioDJG_Camp_Drakar_LastChanceKill (C_Info)
{
	npc = DJG_700_Sylvio;
	condition = DIA_SylvioDJG_Camp_Drakar_LastChanceKill_Condition;
	info = DIA_SylvioDJG_Camp_Drakar_LastChanceKill_Info;
	permanent = FALSE;
	description = " It's time to talk about my share. " ;
};

func int DIA_SylvioDJG_Camp_Drakar_LastChanceKill_Condition()
{
	if(Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Drakar_LastChance) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_SylvioDJG_Camp_Drakar_LastChanceKill_Info()
{
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_00 " );	// It's time to talk about my share.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_01 " );	// All right, here you go.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_02 " );	// What?! A pathetic hundred coins?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_03 " );	// You don't deserve even that.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_04 " );	// What do you want? The ship is broken, we are still here, and there are still a lot of orcs around!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_05 " );	// You should be thankful. Now get out!
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_06 " );	// No, wait. That's not how things are done!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_07 " );	// Do you think to teach me how to do things?!
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_08 " );	// Yes! And either you give me exactly half of your booty right now...
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_09 " );	// ...or I'll have to kick your ass!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_10 " );	// (laughs) Well, you can try, "Hero"!
	self.aivar[AIV_DropDeadAndKill] = TRUE ;
	self.guild = GIL_NONE;
	CreateInvItems(self,ItMi_Gold,10000);
	CreateInvItems(self,ItPo_Perm_STR,1);
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_DJG_700_Sylvio_FuckOffAgain(C_Info)
{
	npc = DJG_700_Sylvio;
	nr = 13;
	condition = DIA_DJG_700_Sylvio_FuckOffAgain_Condition;
	information = DIA_DJG_700_Sylvio_FuckOffAgain_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_DJG_700_Sylvio_FuckOffAgain_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_SylvioDJG_Camp_Drakar_LastChanceKill) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_DJG_700_Sylvio_FuckOffAgain_Info()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,60);
	B_Attack(self,other,AR_KILL,1);
};

// --------------------Guard--------------------------- -

instance DIA_DJG_7312_ToterDrachenjaeger_EXIT(C_Info)
{
	npc = DJG_7312_ToterDrachenjaeger;
	nr = 999;
	condition = DIA_DJG_7312_ToterDrachenjaeger_EXIT_Condition;
	information = DIA_DJG_7312_ToterDrachenjaeger_EXIT_Info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DJG_7312_ToterDrachenjaeger_EXIT_Condition()
{
	return TRUE;
};

func void DIA_DJG_7312_ToterDrachenjaeger_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DJG_7312_ToterDrachenjaeger_HelloAgain(C_Info)
{
	npc = DJG_7312_ToterDrachenjaeger;
	condition = DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_Condition;
	information = DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_Info;
	important = TRUE;
};

func int DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_Condition()
{
	if((MoveDracarBoard == FALSE) || (Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_Info()
{
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_00 " );	// (threateningly) Hey buddy! Where are you going?
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_01");	//Over there. What of it?
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_02 " );	// You can't go there! Understood?
	AI_Output(other,self, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_03 " );	// Why exactly?
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_04 " );	// This is our place and our camp! And we won't let anyone in.
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_05 " );	// So you better get the hell out of here!
	AI_Output(other,self, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_06 " );	// Interesting! So, do you have a camp here? Who is your boss?
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_07 " );	// You don't know him. His name is Silvio.
	AI_Output(other,self, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_08 " );	// Silvio? I know him well. He was one of the mercenaries at Onar's farm.
	AI_Output(other,self, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_09 " );	// And, apparently, he finally got to the treasures of the ice dragon!
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_10 " );	// (frightened) What?! So, you know about that too?
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_11");	//Know what?
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_12 " );	// Well, about the fact that there is a whole mountain of gold nearby!
	AI_Output(other,self, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_13 " );	// Of course. After all, it was I who killed the ice dragon.
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_14 " );	// You?! Either you are a liar, a madman, or...
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_15 " );	// ... a man who killed a dragon...
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_16 " );	// Um, okay. You may pass, sir.
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_17 " );	// If you want to find Silvio, he's in the big cave next to the treasure.
	AI_StopProcessInfos(self);
};

instance DIA_DJG_7312_ToterDrachenjaeger_BUTNOW(C_Info)
{
	npc = DJG_7312_ToterDrachenjaeger;
	nr = 13;
	condition = DIA_DJG_7312_ToterDrachenjaeger_BUTNOW_Condition;
	information = DIA_DJG_7312_ToterDrachenjaeger_BUTNOW_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_DJG_7312_ToterDrachenjaeger_BUTNOW_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (SylvioIsDead == FALSE) && ((Npc_KnowsInfo(other,DIA_DJG_7312_ToterDrachenjaeger_HelloAgain) == TRUE) || (Npc_KnowsInfo(other,DIA_SylvioDJG_Camp_Hello) == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_DJG_7312_ToterDrachenjaeger_BUTNOW_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};

instance DIA_DJG_7312_ToterDrachenjaeger_KillHim (C_Info)
{
	npc = DJG_7312_ToterDrachenjaeger;
	condition = DIA_DJG_7312_ToterDrachenjaeger_KillHim_Condition;
	information = DIA_DJG_7312_ToterDrachenjaeger_KillHim_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DJG_7312_ToterDrachenjaeger_KillHim_Condition()
{
	if(SylvioIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DJG_7312_ToterDrachenjaeger_KillHim_Info()
{
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_00 " );	// You did the right thing by killing that bastard Silvio!
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_01 " );	// We all disliked him.
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_02 " );	// So no one will miss him.
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_03 " );	// Now the main thing is to quickly get out of here before the orcs remember about their ship.
	AI_Output(other,self, " DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_04 " );	// Then you better help Ratford deal with the broken steering wheel.
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_05 " );	// Yes, definitely.
	AI_StopProcessInfos(self);
};
