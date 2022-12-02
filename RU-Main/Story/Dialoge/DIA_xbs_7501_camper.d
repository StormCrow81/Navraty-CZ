

instance DIA_CAMPER01_EXIT(C_Info)
{
	npc = xbs_7501_camper;
	nr = 999;
	condition = dia_camper01_exit_condition;
	information = dia_camper01_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_camper01_exit_condition()
{
	return TRUE;
};

func void dia_camper01_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_CAMPER01_PICKPOCKET(C_Info)
{
	npc = xbs_7501_camper;
	nr = 900;
	condition = dia_camper01_pickpocket_condition;
	information = dia_camper01_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_camper01_pickpocket_condition()
{
	return  C_Robbery ( 25 , 30 );
};

func void dia_camper01_pickpocket_info()
{
	Info_ClearChoices(dia_camper01_pickpocket);
	Info_AddChoice(dia_camper01_pickpocket,Dialog_Back,dia_camper01_pickpocket_back);
	Info_AddChoice(dia_camper01_pickpocket,DIALOG_PICKPOCKET,dia_camper01_pickpocket_doit);
};

func void dia_camper01_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_camper01_pickpocket);
};

func void dia_camper01_pickpocket_back()
{
	Info_ClearChoices(dia_camper01_pickpocket);
};


instance DIA_CAMPER01_HELLO (C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_hallo_condition;
	information = dia_camper01_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_camper01_hallo_condition()
{
	if((Npc_GetDistToWP(self,"WP_COAST_WAY05") < 1000) && (Npc_RefuseTalk(self) == FALSE) && (CAMPER_7501_TALK == FALSE))
	{
		return TRUE;
	};
};

func void dia_camper01_hallo_info()
{
	AI_Output(self,other, " DIA_Camper01_Hallo_01_00 " );	// Hey man! Are you, by any chance, going to the swamps?!
	AI_Output(other,self, " DIA_Camper01_Hallo_01_01 " );	// Possibly. And what?
	AI_Output(self,other, " DIA_Camper01_Hallo_01_02 " );	// And the fact that now it's better not to go there. It has become too dangerous!
	AI_Output(self,other, " DIA_Camper01_Hallo_01_04 " );	// Some strange people in black cassocks settled there. And I'll tell you honestly: it's better to stay away from them - they smell of death!
	AI_Output(self,other, " DIA_Camper01_Hallo_01_05 " );	// The swamps themselves are teeming with various dangerous creatures and, in addition to everything else, strange kind of creatures that look like lizards.
	AI_Output(other, self, " DIA_Camper01_Hallo_01_07 " );	// And what happened to the former inhabitants of the camp?
	AI_Output(self,other, " DIA_Camper01_Hallo_01_08 " );	// Eh... most of them either died or went insane...
	AI_Output(self,other, " DIA_Camper01_Hallo_01_09 " );	// However, as I heard, some still managed to get out of this valley alive.
	AI_Output(self,other, " DIA_Camper01_Hallo_01_10 " );	// Well, those who did not have time to do this - for example, like me - went to another place.
	AI_Output(self,other, " DIA_Camper01_Hallo_01_12 " );	// Now our new home is in the ruins of an old monastery to the north of this place.
	AI_Output(other,self, " DIA_Camper01_Hallo_01_14 " );	// Who is in charge of you?
	AI_Output(self,other, " DIA_Camper01_Hallo_01_15 " );	// His name is Netback! He is the former Guru of the Brotherhood of the Sleeper.
	AI_Output(other,self, " DIA_Camper01_Hallo_01_16 " );	// Wait, isn't that the guy that was talking to the trees all the time?
	AI_Output(self,other, " DIA_Camper01_Hallo_01_17 " );	// Yes, it is. Do you know him?
	AI_Output(other,self, " DIA_Camper01_Hallo_01_18 " );	// Met before. He seems to have always been a little out of his mind.
	AI_Output(self,other, " DIA_Camper01_Hallo_01_19 " );	// (seriously) I wouldn't say that if I were you.
	AI_Output(self,other, " DIA_Camper01_Hallo_01_21 " );	// If it weren't for him, we'd all be in a really hard time.
	AI_Output(self,other, " DIA_Camper01_Hallo_01_22 " );	// With his magic, he drove all those nasty orcs out of here, and now only this beautiful forest grows here!
	AI_Output(other,self, " DIA_Camper01_Hallo_01_23 " );	// How?! Aren't any of those green-skinned creatures here anymore?
	AI_Output(self,other, " DIA_Camper01_Hallo_01_24 " );	// Well... almost. Of course, there are many of them on the coast, but they are afraid to enter the forest.
	AI_Output(self,other, " DIA_Camper01_Hallo_01_25 " );	// So it's quite safe here, just like in our camp.
	AI_Output(self,other, " DIA_Camper01_Hallo_01_26 " );	// By the way, if you want, I can show you to take you there, otherwise I'm already tired of hanging around here.
	Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
	B_LogEntry( TOPIC_XBS , " Part of the Brotherhood of the Sleeper has set up camp at the site of an old monastery. " );
	Info_ClearChoices(dia_camper01_hallo);
	Info_AddChoice(dia_camper01_hallo, " Of course! Let's go. " ,dia_camper01_hallo_gobase);
	Info_AddChoice(dia_camper01_hallo, " Don't! I'll do it myself somehow. " ,dia_camper01_hallo_nobase);
};

func void dia_camper01_hallo_nobase()
{
	AI_Output(other,self, " DIA_Camper01_Hallo_NoBase_15_01 " );	// Don't! I'm on my own somehow.
	AI_Output(self,other, " DIA_Camper01_Hallo_NoBase_01_01 " );	// Okay! As you say.
	AI_StopProcessInfos(self);
	CAMPER_7501_TALK = TRUE;
};

func void dia_camper01_hallo_gobase()
{
	AI_Output(other,self, " DIA_Camper01_Hallo_GoBase_15_01 " );	// Of course! Let's go.
	AI_Output(self,other, " DIA_Camper01_Hallo_GoBase_01_01 " );	// Then follow me.
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Npc_ExchangeRoutine(self,"GUIDETOCAMP");
	CAMPER_7501_TALK = FALSE;
};


instance DIA_CAMPER01_ARRIVEDBASE(C_Info)
{
	npc = xbs_7501_camper;
	nr = 1;
	condition = dia_camper01_arrivedbase_condition;
	information = dia_camper01_arrivedbase_info;
	important = TRUE;
};


func int dia_camper01_arrivedbase_condition()
{
	if(Hlp_StrCmp(Npc_GetNearestWP(self),"WP_COAST_BASE_04") && (self.aivar[AIV_PARTYMEMBER] == TRUE))
	{
		return TRUE;
	};
};

func void dia_camper01_arrivedbase_info()
{
	AI_Output(self,other, " DIA_Camper01_ArrivedBase_01_00 " );	// Here we are!
	AI_Output(self,other, " DIA_Camper01_ArrivedBase_01_01 " );	// Here you can feel completely safe.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	self.flags = 0;
	Npc_ExchangeRoutine(self,"STAYINCAMP");
	b_heroknowforestbase();
	Wld_InsertNpc(DragonSnapper,"WP_COAST_FOREST_106");
};


instance DIA_CAMPER01_HALLO2(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_hallo2_condition;
	information = dia_camper01_hallo2_info;
	permanent = TRUE;
	description = " I'd love to go camping. " ;
};


func int dia_camper01_hallo2_condition()
{
	if((Hlp_StrCmp(Npc_GetNearestWP(self),"WP_COAST_WAY05") == TRUE) && (CAMPER_7501_TALK == TRUE))
	{
		return TRUE;
	};
};

func void dia_camper01_hallo2_info()
{
	AI_Output(other,self, " DIA_Camper01_Hallo2_01_00 " );	// I wouldn't mind going to camp.
	AI_Output(self,other,"DIA_Camper01_Hallo2_01_01");	//Ты уверен?
	Info_ClearChoices(dia_camper01_hallo2);
	Info_AddChoice(dia_camper01_hallo2, " Not yet. " ,dia_camper01_hallo_nobase);
	Info_AddChoice(dia_camper01_hallo2,"Да! Пошли.",dia_camper01_hallo_gobase);
};


var int camper01aboutcook;

instance DIA_CAMPER01_BASERUMORS_RUMORS(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_baserumors_rumors_condition;
	information = dia_camper01_baserumors_rumors_info;
	permanent = TRUE;
	description = " What do you hear in the camp? " ;
};


func int dia_camper01_baserumors_rumors_condition()
{
	if(Npc_GetDistToWP(self,"WP_COAST_BASE_23") <= 3000)
	{
		return TRUE;
	};
};

func void dia_camper01_baserumors_rumors_info()
{
	b_heroknowforestbase();
	AI_Output(other,self, " DIA_Camper01_BaseRumors_Rumors_01_00 " );	// What is heard in the camp?

	if((MIS_OCCOOKFLEE == LOG_SUCCESS) && (CAMPER01ABOUTCOOK == FALSE))
	{
		CAMPER01ABOUTCOOK = TRUE;
		AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_01 " );	// The main news is a new person in the camp!
		AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_02 " );	// And the rest - as usual.
	};
	if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_03 " );	// Now we're watching the dragons raid the castle.
		AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_04 " );	// The guys are already betting on what will collapse next.
		COAST_WASINKAPITEL1 = TRUE ;
	}
	else  if (chapter ==  2 )
	{
		if ( COAST_WASINKAPITEL1  ==  TRUE )
		{
			AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_05 " );	// Continue watching dragons.
			AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_06 " );	// One of them even tried to set fire to our forest, but then ran away.
		}
		else
		{
			AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_07 " );	// Watch with interest as the dragons raid the castle.
			AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_08 " );	// The guys are already betting on what will collapse next.
		};
	}
	else  if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_09 " );	// Strange guys in black were seen on the shore near the waterfall.
		AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_10 " );	// They stood and watched for a long time. Where once was the camp of our Brotherhood.
		AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_11 " );	// For some reason, the hair on my head is moving.
	}
	else  if (chapter ==  4 )
	{
		if(MIS_AllDragonsDead == TRUE)
		{
			AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_12 " );	// Most talk about dragons!
			AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_13 " );	// All the guys seem to be very happy that they are no longer here.
		}
		else if(MIS_KilledDragons > 0)
		{
			AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_14 " );	// They say you've killed several dragons already!
			AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_15 " );	// If everyone were as restless as you, things could be different.
		}
		else
		{
			AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_16 " );	// It is said that a new band of orcs landed on the coast and headed straight for the castle.
			AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_17 " );	// I feel that soon the orcs will attack again!
		};
	}
	else if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_18 " );	// Orcs stormed the castle. Some bastard opened the gate for them.
		AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_19 " );	// It's not that we all really like paladins around here, but I just really feel bad for those guys!
	}
	else
	{
		AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_20 " );	// The siege continues, but it's not as interesting as it used to be.
		AI_Output(self,other, " DIA_Camper01_BaseRumors_Rumors_01_21 " );	// When those dragons were flying around, it was much more fun.
	};
};


instance DIA_CAMPER01_ABOUTTRADE(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_abouttrade_condition;
	information = dia_camper01_abouttrade_info;
	permanent = FALSE;
	description = " Are you selling something here in the camp? " ;
};

func int dia_camper01_abouttrade_condition()
{
	if(Npc_GetDistToWP(self,"WP_COAST_BASE_23") <= 3000)
	{
		return TRUE;
	};
};

func void dia_camper01_abouttrade_info()
{
	AI_Output(other,self, " DIA_Camper01_AboutTRADE_15_00 " );	// Do you sell anything?
	AI_Output(self,other, " DIA_Camper01_AboutTRADE_01_01 " );	// Guessed! What I do myself or collect, wandering through the forest.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, " Ysidro sells goods in the Netback camp. " );
};


instance DIA_CAMPER01_TRADE(C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_trade_condition;
	information = dia_camper01_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show your products. " ;
};

func int dia_camper01_trade_condition()
{
	if(Npc_KnowsInfo(other,dia_camper01_abouttrade) && Wld_IsTime(6,50,22,0))
	{
		return TRUE;
	};
};

func void dia_camper01_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Camper01_TRADE_15_00 " );	// Display your products.
	AI_Output(self,other,"DIA_Camper01_TRADE_01_01");	//Выбирай.
	B_GiveTradeInv(self);
};


instance DIA_CAMPER01_DRAKAR (C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_drakar_condition;
	info = dia_camper01_drakar_info;
	permanent = FALSE;
	description = " What's that ship down there? " ;
};


func int dia_camper01_drakar_condition()
{
	if(Npc_GetDistToWP(self,"WP_COAST_BASE_23") <= 3000)
	{
		return TRUE;
	};
};

func void dia_camper01_drakar_info()
{
	AI_Output(other,self, " DIA_Camper01_Drakar_01_00 " );	// What's that ship down there?
	AI_Output(self,other, " DIA_Camper01_Drakar_01_01 " );	// Man, that's an orc war drakar!
	AI_Output(self,other, " DIA_Camper01_Drakar_01_07 " );	// This ship usually delivers new reinforcements for a castle siege.
	AI_Output(other,self, " DIA_Camper01_Drakar_01_10 " );	// And how often do new units arrive here?
	AI_Output(self,other, " DIA_Camper01_Drakar_01_11 " );	// I don't know for sure... But just a couple of days ago, this drakar brought another batch of these creatures here.
	AI_Output(self,other, " DIA_Camper01_Drakar_01_12 " );	// Eh... and let's hope they don't decide to visit our camp.
};


instance DIA_CAMPER01_DRAKAREXT (C_Info)
{
	npc = xbs_7501_camper;
	nr = 2;
	condition = dia_camper01_drakarext_condition;
	info = dia_camper01_drakarext_info;
	permanent = FALSE;
	description = " Are there any other ships here? " ;
};


func int dia_camper01_drakarext_condition()
{
	if (Npc_KnowsInfo(hero,dia_camper01_drakar))
	{
		return TRUE;
	};
};

func void dia_camper01_drakarext_info()
{
	AI_Output(other,self, " DIA_Camper01_DrakarExt_01_00 " );	// Are there any other ships here?
	AI_Output(self,other, " DIA_Camper01_DrakarExt_01_01 " );	// (sadly) Unfortunately not. This colossus is the only ship in these places.
	AI_Output(self,other, " DIA_Camper01_DrakarExt_01_02 " );	// Otherwise, the guys and I would have tried to swim away from here long ago.
	AI_Output(self,other, " DIA_Camper01_DrakarExt_01_03 " );	// To be honest, I'm already pretty tired of hanging around here!
	AI_Output(other,self, " DIA_Camper01_DrakarExt_01_04 " );	// Why not take the ship from the orcs then?
	AI_Output(self,other, " DIA_Camper01_DrakarExt_01_05 " );	// Are you completely crazy?! I won't even get close to him!
	AI_Output(self,other, " DIA_Camper01_DrakarExt_01_06 " );	// It's full of orcs, mate!
	AI_Output(self,other, " DIA_Camper01_DrakarExt_01_08 " );	// Even from here you can hear their roar from the deck at night.
	AI_Output(self,other, " DIA_Camper01_DrakarExt_01_09 " );	// Plus, I have no idea how to operate this thing.
	AI_Output(self,other, " DIA_Camper01_DrakarExt_01_16 " );	// Compared to him, paladin galleys are boats. Not even a hundred people can handle it!
	AI_Output(self,other, " DIA_Camper01_DrakarExt_01_18 " );	// So throw your idea out of your head - nothing good will come of it.
};

