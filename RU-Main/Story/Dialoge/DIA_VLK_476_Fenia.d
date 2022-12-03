

instance DIA_Fenia_EXIT(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 999;
	condition = DIA_Fenia_EXIT_Condition;
	information = DIA_Fenia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Fenia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Fenia_EXIT_Info()
{
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Fenia_EXIT_17_00 " );	// Greetings, Mr. Paladin.
	};
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Fenia_EXIT_17_01 " );	// Good luck to you, oh venerable mage.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Fenia_PICKPOCKET(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 900;
	condition = DIA_Fenia_PICKPOCKET_Condition;
	information = DIA_Fenia_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Fenia_PICKPOCKET_Condition()
{
	return  C_Robbery ( 50 , 75 );
};

func void DIA_Fenia_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fenia_PICKPOCKET);
	Info_AddChoice(DIA_Fenia_PICKPOCKET,Dialog_Back,DIA_Fenia_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fenia_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fenia_PICKPOCKET_DoIt);
};

func void DIA_Fenia_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Fenia_PICKPOCKET);
};

func void DIA_Fenia_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fenia_PICKPOCKET);
};


instance DIA_Fenia_Hallo (C_Info)
{
	npc = VLK_476_Fenia;
	nr = 3;
	condition = DIA_Fenia_Hallo_Condition;
	information = DIA_Fenia_Hello_Info;
	important = TRUE;
};


func int DIA_Fenia_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Hallo_Info()
{
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Fenia_Hallo_17_00 " );	// You look tired. Haven't slept in a while, huh?
		AI_Output(other,self, " DIA_Fenia_Hallo_15_01 " );	// Too long, I would say.
	};
	AI_Output(self,other, " DIA_Fenia_Hallo_17_02 " );	// Come closer, don't be shy. With me you will find everything you need!
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Fenya trades food on her way to the harbor. " );
};


instance DIA_Fenia_HANDELN (C_Info)
{
	npc = VLK_476_Fenia;
	nr = 10;
	condition = DIA_Fenia_HANDELN_Condition;
	information = DIA_Fenia_HANDELN_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your products. " ;
};


func int DIA_Fenia_HANDELN_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Fenia_Hallo ) & & Wld_IsTime ( 4 , 55 , 20 , 5 ))
	{
		return TRUE;
	};
};

func void DIA_Fenia_HANDELN_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Fenia_HANDELN_15_00 " );	// Show me your products.
	B_GiveTradeInv(self);
};


instance DIA_Fenia_Infos (C_Info)
{
	npc = VLK_476_Fenia;
	nr = 10;
	condition = DIA_Fenia_Infos_Condition;
	information = DIA_Fenia_Infos_Info;
	permanent = FALSE;
	description = " You said you have everything I need. Does that include information? " ;
};


func int DIA_Fenia_Infos_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Fenia_Hallo))
	{
		return TRUE;
	};
};

func void DAY_Fenia_Infos_Info()
{
	AI_Output(other,self, " DIA_Fenia_Infos_15_00 " );	// You said you have everything I need. Does it include information?
	AI_Output(self,other, " DIA_Fenia_Infos_17_01 " );	// Of course. What do you want to know?
};


instance DIA_Fenia_MoreTraders(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 11;
	condition = DIA_Fenia_MoreTraders_Condition;
	information = DIA_Fenia_MoreTraders_Info;
	permanent = FALSE;
	description = " Are there any other merchants here at the port? " ;
};


func int DIA_Fenia_MoreTraders_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fenia_Infos))
	{
		return TRUE;
	};
};

func void DIA_Fenia_MoreTraders_Info()
{
	AI_Output(other,self, " DIA_Fenia_Infos_haendler_15_00 " );	// Are there other merchants here at the port?
	AI_Output(self,other, " DIA_Fenia_Infos_haendler_17_01 " );	// If you go left along the dock, you will see Halvor, my husband. He sells fish.
	AI_Output(self,other, " DIA_Fenia_Infos_haendler_17_02 " );	// And if you go the other way, Ibrahim, the cartographer, lives there.
};


instance DIA_Fenia_OV (C_Info)
{
	npc = VLK_476_Fenia;
	nr = 13;
	condition = DIA_Fenia_OV_Condition;
	information = DIA_Fenia_OV_Info;
	permanent = FALSE;
	description = " Do you know anyone from the Upper Quarter? " ;
};


func int DIA_Fenia_OV_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Fenia_Info ) & & ( other . guild == GIL_NONE  ) )
	{
		return TRUE;
	};
};

func void DIA_Fenia_OV_Info()
{
	AI_Output(other,self, " DIA_Fenia_Infos_oberesViertel_15_00 " );	// Do you know anyone from the upper quarter?
	AI_Output(self,other, " DIA_Fenia_Infos_oberesViertel_17_01 " );	// If I knew anyone there, I wouldn't be standing here, kid.
};


instance DIA_Fenia_Interesting(C_Info)
{
	npc = VLK_476_Fenia;
	nr = 14;
	condition = DIA_Fenia_Interesting_Condition;
	information = DIA_Fenia_Interesting_Info;
	permanent = FALSE;
	description = " What interesting things to pay attention to in the port? " ;
};


func int DIA_Fenia_Interesting_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fenia_Infos))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Interesting_Info()
{
	AI_Output(other,self, " DIA_Fenia_Infos_interessantes_15_00 " );	// What interesting things to look out for in the port?
	AI_Output(self,other, " DIA_Fenia_Infos_interessantes_17_01 " );	// Well... If you're looking for adventure, go to Cardiff's bar by the pier. There is always something going on.
	AI_Output(self,other, " DIA_Fenia_Infos_interessantes_17_02 " );	// You're unlikely to miss it. The guy standing in front of the entrance there will definitely draw your attention to him.
	AI_Output(self,other, " DIA_Fenia_Infos_interessantes_17_03 " );	// In addition, there is a large paladin ship in the port. Royal war galley. It's really worth looking at.
	AI_Output(self,other, " DIA_Fenia_Infos_interessantes_17_04 " );	// You'll see it if you go left along the dock and then go under the big rock.
};


instance DIA_Fenia_Exciting (C_Info)
{
	npc = VLK_476_Fenia;
	nr = 15;
	condition = DIA_Fenia_Aufregend_Condition;
	information = DIA_Fenia_Exciting_Info;
	permanent = FALSE;
	description = " Nothing interesting? " ;
};


func int DIA_Fenia_Aufregend_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Fenia_Infos))
	{
		return TRUE;
	};
};

func void DIA_Fenia_Exciting_Info()
{
	AI_Output(other,self, " DIA_Fenia_Add_15_00 " );	// Was there anything interesting?
	AI_Output(self,other, " DIA_Fenia_Add_17_01 " );	// It was. And very recently.
	AI_Output(self,other, " DIA_Fenia_Add_17_02 " );	// A thief ran through here. He seems to have stolen the bow somewhere in the lower part of the city.
	AI_Output(self,other, " DIA_Fenia_Add_17_03 " );	// Of course, as always, the militia arrived too late.
	AI_Output(self,other, " DIA_Fenia_Add_17_04 " );	// He managed to escape from them - he jumped into the sea and was like that.
};

