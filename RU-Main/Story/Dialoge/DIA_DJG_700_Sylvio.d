
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
		AI_Output(self,other, " DIA_SylvioDJG_HelloAgain_09_00 " );	// Oh, damn me! You also decided to earn extra money, huh? I knew it! You have the soul of a mercenary.
		AI_Output(self,other, " DIA_SylvioDJG_HelloAgain_09_01 " );	// Look, if you think you're going to rake in a lot of gold here, you're sorely mistaken. I was here first.
	}
	else if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other, " DIA_SylvioDJG_HelloAgain_09_02 " );	// Hey you! I'm sick of magicians! Go somewhere else! There is nothing here for you.
	}
	else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_SylvioDJG_HelloAgain_09_02A " );	// Hey you swamp! You never know what to expect from these guys. Take a walk somewhere else. There's nothing here.
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
	AI_Output(self,other, " DIA_Sylvio_DEINELEUTE_09_01 " );	// No more. Not such a big loss. Those idiots weren't worth much anyway.
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
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_09_02 " );	// If you're so cool, maybe you could try?
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
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_02 " );	// There, behind these cliffs, is an icy valley. You've never seen one like this before.
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_03 " );	// The ice dragon lurks there with its horde.
	AI_Output(self,other, " DIA_Sylvio_WASISTPASSIERT_keinInteresse_09_04 " );	// I need this. Because? Yes or no?
};

func void DIA_Sylvio_WASISTPASSIERT_ok()
{
	AI_Output(other,self, " DIA_Sylvio_WASISTPASSIERT_ok_15_00 " );	// Good. Why not?
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
		AI_Output(self,other, " DIA_Sylvio_ICEGOLEMSKILLED_09_03 " );	// Everything has its time.
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
	AI_Output(self,other, " DIA_Sylvio_WASJETZT_trennen_09_01 " );	// Nonsense! Stop talking. Walk straight!
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
	AI_Output(self,other, " DIA_Sylvio_DUHIER_09_01 " );	// Nonsense! You are doing such a great job.
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
	AI_Output(other,self,"DIA_SylvioDJG_WHATNEXT_15_01");	//Ни за что!
	AI_Output(self,other, " DIA_SylvioDJG_WHATNEXT_09_02 " );	// I'll get all the credit for killing the ice dragon.
	AI_Output(self,other, " DIA_SylvioDJG_WHATNEXT_09_03 " );	// And your little part in this business is over!
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
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Hello_01_02 " );	// Now they are only mine. (threateningly) So stay away from them! Unless, of course, you value your life.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Hello_01_03 " );	// I thought you'd share with the rest of the guys.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Hello_01_04 " );	// Of course. But so far we have not even decided what to do with this mountain of gold.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Hello_01_05 " );	// You don't know what to do with gold?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Hello_01_06 " );	// Imagine! It will make little sense here.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Hello_01_07 " );	// Yes, and in Khorinis now the situation is also not pleasant.
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
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Plan_01_01 " );	// Yes, I have a plan. That's why I'm in charge here!
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Plan_01_02 " );	// And what does it consist of?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Plan_01_03 " );	// I want to get off this damned island and take all this gold with me.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Plan_01_04 " );	// But for that, you'll need a ship.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Plan_01_05 " );	// How smart you are! I know this even without you.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Plan_01_06 " );	// But the only ship on the island is now in the harbor of Khorinis.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Plan_01_07 " );	// And I doubt the paladins will let us ride it!
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
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Bullco_01_01 " );	// This bastard has escaped. He said that he had had enough of all these difficulties.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Bullco_01_02 " );	// Hope it got eaten by the local critters!
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
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_02 " );	// Really?! And where is he?
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_01_03 " );	// On the other side of the valley is a huge orc drakar.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_04 " );	// Hmmm... This is already interesting! But he must be well guarded.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_01_05 " );	// Most likely.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_06 " );	// So we'll have to get the orcs out of there somehow.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_01_07 " );	// Then go ahead, show them!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_08 " );	// You don't understand. We can't give up our gold!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_09 " );	// As soon as we're out of here, orc muzzles will surely come here.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_10 " );	// And then we won't be able to see him!
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_01_11 " );	// What do you suggest?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_12 " );	// (grinning) Well, you're our hero! Here, solve the problem.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_01_13 " );	// Why should I do this?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_14 " );	// (smiling) Well, we've had, let's say, a little disagreement up to this point.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_15 " );	// But if you help us now, I'm ready to share with you.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_01_16 " );	// Are you offering me gold that is rightfully mine?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_17 " );	// It's not yours anymore, mate. So, if you want to profit from them, you have to help us.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_01_18 " );	// Well, agreed?
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
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_01_03 " );	// Therefore, there is no reason for us to leave this camp now.
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
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Done_01_00 " );	// Orc drakar is clean!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_01 " );	// Great. Now we need to think about how to transport our gold to the ship.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Done_01_02 " );	// What about my share?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_03 " );	// Don't rush! There is another small problem here.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Done_01_04 " );	// What?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_05 " );	// I've been talking to the guys here, and it turned out that none of them know how to handle the steering wheel.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_06 " );	// In that case, we won't even be able to sail away from here.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Done_01_07 " );	// Do you want me to find you a captain?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_08 " );	// (smirking) You're not a fool after all, as far as I can see.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_09 " );	// Naturally, we need someone who could handle this vessel.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_10 " );	// After all, it was your idea to take the ship from the orcs.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_11 " );	// Now get out as you want!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_12 " );	// Oh, and one more thing... (casually) We could also use a good cook there on the ship.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_13 " );	// I don't want to starve to death at sea before I can spend my gold.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_14 " );	// I hope I'm making myself clear?
	AI_Output(other,self,"DIA_SylvioDJG_Camp_Drakar_Done_01_15");	//Вполне.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Done_01_16 " );	// Then get down to business. Come on, don't waste your time!
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
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Orcs_Up_01_04 " );	// You didn't ask.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_01_05 " );	// (feverishly) We're all in big danger now! You must kill them! Kill them all!
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Orcs_Up_01_06 " );	// What, me again?!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_01_07 " );	// But you're the one who told me about this camp. Besides, we can't leave now!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_01_08 " );	// So come on, legs in hands and forward.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_01_09 " );	// All orcs must be dead!
	MIS_SylvioOrcs = LOG_Running;
	Log_CreateTopic(Topic_SylvioOrcs,LOG_MISSION);
	Log_SetTopicStatus(Topic_SylvioOrcs,LOG_Running);
	B_LogEntry(Topic_SylvioOrcs, " Sylvio almost fainted when he learned about the orc camp above the Ice Dragon Cave. Now I have to make sure the orcs don't give him any more headaches. " );
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
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_Done_01_01 " );	// In what sense?
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Orcs_Up_Done_01_02 " );	// They are no longer there.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_Done_01_03 " );	// Good! This calms me down a bit.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Orcs_Up_Done_01_04 " );	// Now get on with other things. You probably have them.
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
		AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Crew_01_02 " );	// I'm afraid I can't find the captain here anymore.
		AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Crew_01_03 " );	// And hardly anyone in Khorinis would agree to go here.
		AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Crew_01_04 " );	// Damn! Okay, let's think of something ourselves.
		AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Crew_01_05 " );	// (seriously) Now it's time for us to move out...
		AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Crew_01_06 " );	// Have you forgotten about my share?
		AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Crew_01_07 " );	// Later! Let's get to the ship, and there we'll talk about your reward.
		MIS_SylvioCrew = LOG_Success;
		Log_SetTopicStatus(Topic_SylvioCrew,LOG_Success);
		B_LogEntry(Topic_SylvioCrew, " I informed Silvio that I couldn't find the captain in the valley. " );
		AI_StopProcessInfos(self);
	}
	else
	{
		if(RatfordAgree == TRUE)
		{
			B_GivePlayerXP(1000);
			AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Crew_01_08 " );	// A guy named Ratford is ready to take on this job.
			AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Crew_01_09 " );	// But first, you'll have to pay him at least five hundred coins.
			AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Crew_01_10 " );	// (greedily) Five hundred coins?! Ah, okay! We still don't have a choice.
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
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Cook_01_01 " );	// Okay...(sighing) I hope he can cook.
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_Cook_01_02 " );	// Paladins in the castle didn't seem to complain about him.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_Cook_01_03 " );	// Well, if so, then everything is in order.
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
	AI_Output(self,other,"DIA_SylvioDJG_Camp_Drakar_LastChance_01_01");	//И что?
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_LastChance_01_02 " );	// But you promised you'd pay him!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChance_01_03 " );	// (carelessly) Why should I pay him?
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
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_01 " );	// (grinning) All right, here you go.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_02 " );	// What?! Some pathetic hundred coins?
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_03 " );	// You don't deserve this either.
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_04 " );	// And what did you want - the ship is broken, we are still here, and there are a lot of orcs around!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_05 " );	// Say thank you for getting this too. Now get out!
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_06 " );	// No, wait. That's not how things are done!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_07 " );	// And what, did you think to teach me how to do things?!
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_08 " );	// Yes! And either you give me exactly half of your booty right now...
	AI_Output(other,self, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_09 " );	// ...or I'll have to give you a good beating, you greedy pig!
	AI_Output(self,other, " DIA_SylvioDJG_Camp_Drakar_LastChanceKill_01_10 " );	// (laughs) Well, you can try, motherfucker!
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
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_01");	//Туда. А что?
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_02 " );	// And the fact that you can't go there! Understood?
	AI_Output(other,self, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_03 " );	// Why else?
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_04 " );	// Now this is our place and our camp! And we won't let anyone in.
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_05 " );	// So you better get the hell out of here!
	AI_Output(other,self, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_06 " );	// Interesting! So, do you have a camp here? And who is your boss?
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_07 " );	// You don't know him. His name is Silvio.
	AI_Output(other,self, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_08 " );	// Silvio? I just know him. He was one of the mercenaries at Onar's farm.
	AI_Output(other,self, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_09 " );	// And, apparently, he finally got to the treasures of the ice dragon!
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_10 " );	// (frightened) What?! So, do you know about this too?
	AI_Output(other,self,"DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_11");	//Знаю о чем?
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_12 " );	// Well, about the fact that there is a whole mountain of gold nearby!
	AI_Output(other,self, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_13 " );	// Of course. After all, it was I who killed the ice dragon.
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_14 " );	// You?! (laughs) Well, you're a lot of fun, man.
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_15 " );	// A whole army would not have coped with this dragon! Where are you alone.
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_16 " );	// Oh, okay. Since you are already aware of everything that is happening, you can pass.
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_HelloAgain_01_17 " );	// If you want Silvio himself, he's in the big cave next to the treasure.
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
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_01 " );	// We all didn't really like him.
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_02 " );	// So no one will miss him.
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_03 " );	// Now the main thing is to quickly get out of here before the orcs remember about their ship.
	AI_Output(other,self, " DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_04 " );	// Then you better help Ratford deal with the broken steering wheel.
	AI_Output(self,other, " DIA_DJG_7312_ToterDrachenjaeger_KillHim_01_05 " );	// Definitely help, buddy! Necessarily.
	AI_StopProcessInfos(self);
};
