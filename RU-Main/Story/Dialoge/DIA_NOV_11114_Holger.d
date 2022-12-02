

instance DIA_HOLGER_EXIT(C_Info)
{
	npc = nov_11114_holger;
	nr = 999;
	condition = dia_holger_exit_condition;
	information = dia_holger_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_holger_exit_condition()
{
	return TRUE;
};

func void dia_holger_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_HOLGER_STORY(C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = dia_holger_story_condition;
	information = dia_holger_story_info;
	important = FALSE;
	permanent = TRUE;
	description = " Tell me the whole story. " ;
};

func int dia_holger_story_condition()
{
	if(MIS_HOLGER_QUEST == 3)
	{
		return TRUE;
	};
};

func void dia_holger_story_info()
{
	B_GivePlayerXP(50);
	AI_Output(other, self, " DIA_Holger_01_01 " );	// Tell me the whole story, as you promised.
	AI_Output(self,other, " DIA_Holger_01_02 " );	// What's there to hide now. I have been in the monastery for about a year.
	AI_Output(self,other, " DIA_Holger_01_03 " );	// Then the Barrier stood over the Valley of the Mines, and Khorinis prospered. But one 'beautiful' day, I got into a fight with someone in the Koragon Inn.
	AI_Output(self,other, " DIA_Holger_01_04 " );	// I was drunk as hell, and I don't remember how it all started. But the fight ended badly for the two of us.
	AI_Output(self,other, " DIA_Holger_01_05 " );	// Ron - that was the name of that guy - I beat almost half to death, and they already wanted to throw me over the Barrier.
	AI_Output(self,other, " DIA_Holger_01_06 " );	// But my father collected all the money we had then and sent me to a monastery.
	AI_Output(self,other, " DIA_Holger_01_07 " );	// He was forced to sell almost everything. And after that, I can't look him in the eye.
	AI_Output(self,other, " DIA_Holger_01_08 " );	// And that's why I couldn't go to him myself.
	AI_Output(other,self, " DIA_Holger_01_09 " );	// Yeah, not a fun story. But I want to tell you that your parents miss you very much and want to see you.
	AI_Output(self,other, " DIA_Holger_01_10 " );	// True? Are they not angry with me? Are you lying?
	AI_Output(other,self, " DIA_Holger_01_11 " );	// Of course not.
	AI_Output(self,other, " DIA_Holger_01_12 " );	// Then I'll be with them soon!
	MIS_HOLGER_QUEST = 4;
	Log_SetTopicStatus(TOPIC_BADSON,LOG_SUCCESS);
	; _ _ _ _ _ _
	INNOSPRAYCOUNT += 1;
	Npc_ExchangeRoutine(nov_11114_holger,"Smoke");
};

instance DIA_HOLGER_HELLO (C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = dia_holger_hello_condition;
	information = dia_holger_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int dia_holger_hello_condition()
{
	if ( Wld_IsTime ( 20 , 0 , 8 , 0 ) && ( Chapter <=  2 ) && ( MY_HOLGER_QUEST  <  1 )) ;
	{
		return TRUE;
	};
};

func void dia_holger_hello_info()
{
	AI_Output(self,other, " DIA_Holger_Hello_01_01 " );	// Hey! Wait a minute.
	AI_Output(self,other, " DIA_Holger_Hello_01_02 " );	// I have one thing for you. Can you bring me something?
	AI_Output(other, self, " DIA_Holger_Hello_01_03 " );	// Water? Food? Bolotnik?
	AI_Output(self,other, " DIA_Holger_Hello_01_04 " );	// No, I don't need it. There is enough of this goodness here in the monastery.
	AI_Output(self,other, " DIA_Holger_Hello_01_05 " );	// And if you mention a swamp with magicians or do something else, you will have to sweep the dust in the cellars for a long time.
	AI_Output(self,other, " DIA_Holger_Hello_01_06 " );	// There, poor old Ram accidentally dropped a black mushroom into a vat of wine. So Gorax has been making him work with a broom for the third week.
	AI_Output(self,other, " DIA_Holger_Hello_01_07 " );	// And to be honest, I don't even know when it will cool down.
	AI_Output(other,self, " DIA_Holger_Hello_01_08 " );	// It's a pity, of course, this guy. But let's get down to business!
	AI_Output(self,other, " DIA_Holger_Hello_01_09 " );	// Oh yeah. I started talking about something ... So, could you take one little thing from Alvin? To be precise - one amulet.
	AI_Output(other, self, " DIA_Holger_Hello_01_10 " );	// And how can I get it - steal it, buy it?
	AI_Output(self,other, " DIA_Holger_Hello_01_11 " );	// No, what are you! Just tell o... uh... my name to him and give him this letter. He will understand what is at stake.
	AI_Output(other,self, " DIA_Holger_Hello_01_12 " );	// Why don't you go to Khorinis yourself to take this amulet from Alvin?
	AI_Output(self,other, " DIA_Holger_Hello_01_13 " );	// (hesitantly) You see, it's a long story...
	AI_Output(self,other, " DIA_Holger_Hello_01_14 " );	// Let's do this: you bring me an amulet, then I'll tell you the whole story and help you with something else. I agree?
	Info_ClearChoices(dia_holger_hello);
	Info_AddChoice(dia_holger_hello, " Okay, that'll be interesting to hear. " ,dia_holger_hello_yes);
	Info_AddChoice(dia_holger_hello, " No, I don't want to interfere in your business. " ,dia_holger_hello_no);
};

func void dia_holger_hello_yes()
{
	AI_Output(other,self, " DIA_Holger_Hello_Yes_01_01 " );	// Okay, interesting to hear.
	AI_Output(self,other, " DIA_Holger_Hello_Yes_01_02 " );	// Then I'll wait for you with the news.
	B_GiveInvItems(self,hero,itwr_holger_letter,1);
	Log_CreateTopic(TOPIC_BADSON,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BADSON,LOG_Running);
	MIS_HOLGER_QUEST = 1;
	B_LogEntry( TOPIC_BADSON , " I talked to a novice named Holger. He asked me to bring him some kind of amulet from the city. And for some reason this jewel is in the possession of the shepherd Alvin. Some kind of muddy story... It's worth figuring it out. " );
	Info_ClearChoices(dia_holger_hello);
};

func void dia_holger_hello_no()
{
	AI_Output(other,self, " DIA_Holger_Hello_No_01_01 " );	// No, I don't want to interfere in your business.
	AI_Output(self,other, " DIA_Holger_Hello_No_01_02 " );	// Well. No so no.
	Info_ClearChoices(dia_holger_hello);
};


instance DIA_Holger_GiveAmulet (C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = DIA_Holger_GiveAmulet_condition;
	information = DIA_Holger_GiveAmulet_info;
	permanent = FALSE;
	description = " I brought you your amulet. " ;
};

func int DIA_Holger_GiveAmulet_condition()
{
	if (( MY_HOLDER_QUEST  ==  2 ) && (Npc_HasItems(other,item_holder_amulet) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Holger_GiveAmulet_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Holger_GiveAmulet_01_01 " );	// I brought you your amulet.
	AI_Output(self,other, " DIA_Holger_GiveAmulet_01_02 " );	// You're not kidding, buddy?
	AI_Output(other,self, " DIA_Holger_GiveAmulet_01_03 " );	// Here, hold it.
	B_GiveInvItems(other,self,itam_holger_amulet,1);
	Npc_RemoveInvItems(self,itam_holger_amulet,1);
	AI_Output(self,other, " DIA_Holger_GiveAmulet_01_04 " );	// Yes, it's really him! Thank you very much.
	AI_Output(self,other, " DIA_Holger_GiveAmulet_01_05 " );	// Here, now this firestorm scroll is yours.
	B_GiveInvItems(self,other,ItSc_Firestorm,1);
	B_LogEntry( TOPIC_BADSON , " I talked to a novice named Holger. He asked me to bring him some kind of amulet from the city. And for some reason this jewel is in the possession of the shepherd Alvin. Some kind of muddy story... It's worth figuring it out. " );
	MIS_HOLGER_QUEST = 3;
};

instance DIA_Holger_Wurst (C_Info)
{
	npc = nov_11114_holger;
	nr = 2;
	condition = DIA_Holger_Wurst_Condition;
	information = DIA_Holger_Sausage_Info;
	permanent = FALSE;
	description = " Here, I have lamb sausage for you. " ;
};

func int DIA_Holger_Wurst_Condition()
{
	if ((Chapter ==  1 ) && ( MY_HOLGER_QUEST  <  4 ) && (MY_GoraxEssen == LOG_Running) && (Npc_HasItems(self,ItFo_Schafswurst) ==  0 ) && (Npc_HasItems(other,ItFo_Schafswurst) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Holger_Sausage_Info()
{
	var string NovizeText;
	var string NoviceLeft;
	AI_Output(other,self, " DIA_Agon_Wurst_15_00 " );	// Here, I have lamb sausage for you.
	AI_Output(self,other, " DIA_Agon_Wurst_07_03 " );	// Okay, give it here.
	B_GiveInvItems(other,self,ItFo_Schafswurst,1);
	Sausage_Given = Sausage_Given +  1 ;
	CreateInvItems(self,ItFo_Sausage,1);
	B_UseItem(self,ItFo_Sausage);
};

instance DIA_HOLGER_TRADE(C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = dia_holger_trade_condition;
	information = dia_holger_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = " Do you have anything for sale? " ;
};

func int dia_holger_trade_condition()
{
	if(HOLGER_TRADE_COND == TRUE)
	{
		return TRUE;
	};
};

func void dia_holger_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_holger_TRADE_01_01 " );	// Do you have anything for sale?
	AI_Output(self,other, " DIA_holger_TRADE_01_02 " );	// See for yourself...
	B_GiveTradeInv(self);
};

instance DIA_HOLGER_RELAX(C_Info)
{
	npc = nov_11114_holger;
	nr = 1;
	condition = dia_holger_relax_condition;
	information = dia_holger_relax_info;
	permanent = TRUE;
	description = " Well, how are you? " ;
};

func int dia_holger_relax_condition()
{
	if((MIS_HOLGER_QUEST == 4) && (Npc_GetDistToWP(nov_11114_holger,"NW_CITY_PATH_HABOUR_08_B") <= 100))
	{
		return TRUE;
	};
};

func void dia_holger_relax_info()
{
	AI_Output(other,self, " DIA_holger_Relax_01_01 " );	// Well, how are you?
	AI_Output(self,other, " DIA_holger_Relax_01_02 " );	// Great! My parents accepted me, forgiving past mistakes.
	AI_Output(self,other, " DIA_holger_Relax_01_03 " );	// Now I'm home again, and I can spend a little time with them.

	if(hero.guild != GIL_KDF)
	{
		AI_Output(self,other, " DIA_holger_Relax_01_04 " );	// And I'm damned happy to smoke a good old joint! And then in the monastery you don’t really work out this.
	};

	AI_Output(self,other, " DIA_holger_Relax_01_05 " );	// I only took a couple of weeks off. If you need me, you can then find me there, in the monastery.

	MIS_HOLGER_QUEST = 5;
	HOLGER_TRADE_COND = TRUE;
};

instance DIA_HOLGER_PICKPOCKET(C_Info)
{
	npc = nov_11114_holger;
	nr = 900;
	condition = dia_holger_pickpocket_condition;
	information = dia_holger_pickpocket_info;
	permanent = TRUE;
	description = Pickpocket_40;
};

func int dia_holger_pickpocket_condition()
{
	return  C_Robbery ( 54 , 70 );
};

func void dia_holger_pickpocket_info()
{
	Info_ClearChoices(dia_holger_pickpocket);
	Info_AddChoice(dia_holger_pickpocket,Dialog_Back,dia_holger_pickpocket_back);
	Info_AddChoice(dia_holger_pickpocket,DIALOG_PICKPOCKET,dia_holger_pickpocket_doit);
};

func void dia_holger_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,30);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void dia_holger_pickpocket_back()
{
	Info_ClearChoices(dia_holger_pickpocket);
};
