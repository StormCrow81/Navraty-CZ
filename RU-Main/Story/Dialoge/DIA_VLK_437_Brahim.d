

var int Brahim_ShownMaps;

func void B_BrahimNewMaps()
{
	if(Brahim_ShowedMaps == TRUE)
	{
		AI_Output(self,other, " B_BrahimNewMaps_07_00 " );	// Come back later. I'm sure I can cook something interesting for you.
	};
};


instance DIA_Brahim_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_EXIT_Condition;
	information = DIA_Brahim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brahim_EXIT_Condition()
{
	if (chapter <=  2 )
	{
		return TRUE;
	};
};

func void DIA_Brahim_EXIT_Info()
{
	B_BrahimNewMaps();
	AI_StopProcessInfos(self);
};

instance DIA_Brahim_PICKPOCKET(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 900;
	condition = DIA_Brahim_PICKPOCKET_Condition;
	information = DIA_Brahim_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his sextant) " ;
};

func int DIA_Brahim_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brahim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
	Info_AddChoice(DIA_Brahim_PICKPOCKET,Dialog_Back,DIA_Brahim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brahim_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Brahim_PICKPOCKET_DoIt);
};

func void DIA_Brahim_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItMi_Sextant,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Brahim_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Brahim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brahim_PICKPOCKET);
};

instance DIA_Brahim_GREET(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_GREET_Condition;
	information = DIA_Brahim_GREET_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Brahim_GREET_Condition()
{
	return TRUE;
};

func void DIA_Brahim_GREET_Info()
{
	AI_Output(other,self, " DIA_Brahim_GREET_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Brahim_GREET_07_01 " );	// My name is Ibrahim. I draw cards and sell them.
	AI_Output(self,other, " DIA_Brahim_GREET_07_02 " );	// Since you're new here, you might need a map of the city.
	AI_Output(self,other, " DIA_Brahim_GREET_07_03 " );	// It's very inexpensive and very useful until you get the hang of it.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Ibrahim draws cards and sells them in the harbor. " );
};

instance DIA_Brahim_HelpPath(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_HelpPath_Condition;
	information = DIA_Brahim_HelpPath_Info;
	permanent = FALSE;
	description = " Do you need any help? " ;
};

func int DIA_Brahim_HelpPath_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brahim_GREET) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Brahim_HelpPath_Info()
{
	AI_Output(other,self, " DIA_Brahim_HelpPath_01_00 " );	// Do you need any help?
	AI_Output(self,other, " DIA_Brahim_HelpPath_01_01 " );	// Good thing you asked. How much more needed!
	AI_Output(other,self, " DIA_Brahim_HelpPath_01_02 " );	// Then lay it out - what's the matter?
	AI_Output(self,other, " DIA_Brahim_HelpPath_01_03 " );	// Yeah, you see... (scratches back of head) I recently got an order for a map of this whole island.
	AI_Output(self,other, " DIA_Brahim_HelpPath_01_04 " );	// The buyer pays a very decent amount for it. Almost half a thousand gold!
	AI_Output(self,other, " DIA_Brahim_HelpPath_01_05 " );	// And I, as it turned out, ran out of ink to sign it.
	AI_Output(self,other, " DIA_Brahim_HelpPath_01_06 " );	// Now I'm sitting and wondering where I can find them...
	AI_Output(other,self, " DIA_Brahim_HelpPath_01_07 " );	// Have you tried to buy them?
	AI_Output(self,other, " DIA_Brahim_HelpPath_01_08 " );	// They don't sell that kind of stuff in this part of town, and they don't let me in the upper quarter.
	AI_Output(other,self, " DIA_Brahim_HelpPath_01_09 " );	// I understand! Okay, I'll try to get them for you.
	AI_Output(other,self, " DIA_Brahim_HelpPath_01_10 " );	// By the way, what kind of person pays so generously for your card?
	AI_Output(self,other, " DIA_Brahim_HelpPath_01_11 " );	// To be honest, I've never seen him here before.
	AI_Output(self,other, " DIA_Brahim_HelpPath_01_12 " );	// I think his name is either Goales or Gonsles. In general, I did not remember his name.
	MIS_BrahimWax = LOG_Running;
	Log_CreateTopic(TOPIC_BrahimWax,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BrahimWax,LOG_Running);
	B_LogEntry(TOPIC_BrahimWax, " Ibrahim urgently needs ink. Without it, he can't sign the symbols on the map he was ordered to. I think it's worth looking for them somewhere in the market place or at the merchants. " );
};

instance DIA_Brahim_HelpPath_Done(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_HelpPath_Done_Condition;
	information = DIA_Brahim_HelpPath_Done_Info;
	permanent = FALSE;
	description = " Here is your ink. " ;
};

func int DIA_Brahim_HelpPath_Done_Condition()
{
	if((MIS_BrahimWax == LOG_Running) && (Npc_HasItems(other,ItMi_Wax) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Brahim_HelpPath_Done_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Brahim_HelpPath_Done_01_00 " );	// Here's your ink.
	B_GiveInvItems(other,self,ItMi_Wax,1);
	Npc_RemoveInvItems(self,ItMi_Wax,1);
	AI_Output(self,other, " DIA_Brahim_HelpPath_Done_01_01 " );	// Thank you! You just rescued me.
	AI_Output(self,other, " DIA_Brahim_HelpPath_Done_01_02 " );	// Now I can finally finish this map and get a huge pile of gold.
	AI_Output(other,self, " DIA_Brahim_HelpPath_Done_01_03 " );	// Will I get anything?
	AI_Output(self,other, " DIA_Brahim_HelpPath_Done_01_04 " );	// Unfortunately, I don't have anything of value for you right now.
	AI_Output(self,other, " DIA_Brahim_HelpPath_Done_01_05 " );	// But wait. Here, take this paper.
	AI_Output(self,other, " DIA_Brahim_HelpPath_Done_01_06 " );	// It's not as simple as it seems at first glance!
	B_GiveInvItems(self,other,itwr_magicpaper,3);
	AI_Output(self,other, " DIA_Brahim_HelpPath_Done_01_07 " );	// It can be used to make magic scrolls.
	AI_Output(self,other, " DIA_Brahim_HelpPath_Done_01_08 " );	// But I have nothing more.
	AI_Output(other,self, " DIA_Brahim_HelpPath_Done_01_09 " );	// Okay, this will do.
	CreateInvItems(self,itwr_map_newworld_1,1);
	MIS_BrahimWax = LOG_Success;
	Log_SetTopicStatus(TOPIC_BrahimWax,LOG_Success);
	B_LogEntry(TOPIC_BrahimWax, " I brought some ink for Ibrahim. " );
};

instance DIA_Addon_Brahim_MissingPeople(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 5;
	condition = DIA_Addon_Brahim_MissingPeople_Condition;
	information = DIA_Addon_Brahim_MissingPeople_Info;
	description = " Is it true that some residents have mysteriously disappeared? " ;
};


func int DIA_Addon_Brahim_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (ENTERED_ADDONWORLD == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Brahim_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Brahim_MissingPeople_15_00 " );	// Is it true that some residents have mysteriously disappeared?
	AI_Output(self,other, " DIA_Addon_Brahim_MissingPeople_07_01 " );	// I heard about it! But I'm not sure this is true.
	AI_Output(self,other, " DIA_Addon_Brahim_MissingPeople_07_02 " );	// Look around! Do you really want to spend your best years of your life in this hole?
	AI_Output(self,other, " DIA_Addon_Brahim_MissingPeople_07_03 " );	// No wonder people are leaving here.
};


var int brahimowmapready;

instance DIA_BRAHIM_COAST_MAP(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 5;
	condition = dia_brahim_coast_map_condition;
	information = dia_brahim_coast_map_info;
	permanent = FALSE;
	description = " Would you like to copy a good mine valley map? " ;
};

func int dia_brahim_coast_map_condition()
{
	if ((Npc_HasItems(other,itwr_map_oldworld_forest_1) >=  1 ) && Npc_KnowsInfo(other,DIA_Brahim_GREET))
	{
		return TRUE;
	};
};

func void dia_brahim_coast_map_info()
{
	AI_Output(other,self, " DIA_Brahim_Coast_Map_15_00 " );	// Would you like to copy a good mine valley map? You definitely don't have one.
	AI_Output(self,other, " DIA_Brahim_Coast_Map_07_01 " );	// Let's take a look...
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Brahim_Coast_Map_07_02 " );	// Very interesting!
	AI_Output(self,other, " DIA_Brahim_Coast_Map_07_03 " );	// What do you want for this? I don't have much money, but I can give you something.
	AI_Output(self,other, " DIA_Brahim_Coast_Map_07_04 " );	// Here, choose...
	Info_ClearChoices(dia_brahim_coast_map);
	Info_AddChoice(dia_brahim_coast_map, " Healing Elixir " ,dia_brahim_coast_map_health_03);
	Info_AddChoice(dia_brahim_coast_map, " Mana Elixir " ,dia_brahim_coast_map_mana_03);
	Info_AddChoice(dia_brahim_coast_map, " Thirty gold coins " ,dia_brahim_coast_map_gold_03);
};

func void dia_brahim_coast_give()
{
	AI_Output(self,other, " DIA_Brahim_Coast_Map_07_05 " );	// Great, take it.
	AI_Output(self,other, " DIA_Brahim_Coast_Map_07_06 " );	// And let me take another look to remember better.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Brahim_Coast_Map_07_07 " );	// Everything is clear. Come tomorrow for dinner - the card will already be on sale.
	Info_ClearChoices(dia_brahim_coast_map);
	B_GivePlayerXP(XP_Ambient);
	BRAHIMOWMAPREADY = Wld_GetDay() +  1 ;
};

func void dia_brahim_coast_map_mana_03()
{
	AI_Output(other,self, " DIA_Brahim_Coast_Map_15_01 " );	// Give me a mana drink.
	B_GiveInvItems(self,other,ItPo_Mana_03,1);
	dia_brahim_coast_give();
};

func void dia_brahim_coast_map_health_03()
{
	AI_Output(other,self, " DIA_Brahim_Coast_Map_15_02 " );	// Give me a health drink.
	B_GiveInvItems(self,other,ItPo_Health_03,1);
	dia_brahim_coast_give();
};

func void dia_brahim_coast_map_gold_03()
{
	AI_Output(other,self, " DIA_Brahim_Coast_Map_15_03 " );	// Give me the gold.
	B_GiveInvItems(self,other,ItMi_Gold,30);
	dia_brahim_coast_give();
};

instance DIA_Brahim_BUY(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 9;
	condition = DIA_Brahim_BUY_Condition;
	information = DIA_Brahim_BUY_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your cards. " ;
};

func int DIA_Brahim_BUY_Condition()
{
	if (( Npc_KnowsInfo(hero, DIA_Brahim_GREET) ==  TRUE ) && Wld_IsTime( 8 , 0 , 22 , 0 ))
	{
		return TRUE;
	};
};

func void DIA_Brahim_BUY_Info()
{
	var int today;

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	today = Wld_GetDay();

	if((BRAHIMOWMAPREADY != 0) && (Npc_HasItems(self,itwr_map_oldworld_forest_1) == 0) && ((today > BRAHIMOWMAPREADY) || ((today == BRAHIMOWMAPREADY) && Wld_IsTime(12,0,23,59))))
	{
		CreateInvItems(self,itwr_map_oldworld_forest_1,1);
		BRAHIMOWMAPREADY = 0;
	};

	AI_Output(other,self, " DIA_Brahim_BUY_15_00 " );	// Show me your cards.

	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Brahim_BUY_07_01 " );	// You won't find better even in a monastery.
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Brahim_BUY_07_02 " );	// A good map is very important, especially for people coming from the mainland, Mr. Paladin.
	};

	Brahim_ShowedMaps = TRUE;
	B_GiveTradeInv(self);
};


instance DIA_Brahim_Kap3_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_Kap3_EXIT_Condition;
	information = DIA_Brahim_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brahim_Kap3_EXIT_Condition()
{
	if ((Chapter >=  3 ) && (Npc_KnowsInfo(other,DIA_Brahim_Chapter3_First_EXIT) || (Npc_HasItems(other,itwr_shatteredgolem_mis_1) ==  0 ))) ;
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_EXIT_Info()
{
	if (chapter <=  4 )
	{
		B_BrahimNewMaps();
	};
	AI_StopProcessInfos(self);
};


instance DIA_Brahim_Kap3_First_EXIT(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 999;
	condition = DIA_Brahim_Kap3_First_EXIT_Condition;
	information = DIA_Brahim_Kap3_First_EXIT_Info;
	permanent = FALSE;
	description = Dialog_Ende;
};


func int DIA_Brahim_Kap3_First_EXIT_Condition()
{
	if ((Chapter >=  3 ) && (Npc_HasItems(other,itwr_shatteredgolem_mis_1) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Brahim_Kap3_First_EXIT_Info()
{
	AI_Output(self,other, " DIA_Brahim_Kap3_First_EXIT_07_00 " );	// I knew this piece of paper would interest you.
	AI_Output(other,self, " DIA_Brahim_Kap3_First_EXIT_15_01 " );	// What scrap?
	AI_Output(self,other, " DIA_Brahim_Kap3_First_EXIT_07_02 " );	// Well, that old card you just bought.
	AI_Output(self,other, " DIA_Brahim_Kap3_First_EXIT_07_03 " );	// I know people like you. You use every chance to find treasures.
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT,Dialog_Back,DIA_Brahim_Kap3_First_EXIT_BACK);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT, " Where did you get this card? " ,DIA_Brahim_Kap3_First_EXIT_WhereGetIt);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT, " What is this card? " ,DIA_Brahim_Kap3_First_EXIT_Content);
	Info_AddChoice(DIA_Brahim_Kap3_First_EXIT, " Why didn't you keep her? " ,DIA_Brahim_Kap3_First_EXIT_KeepIt);
};

func void DIA_Brahim_Kap3_First_EXIT_BACK()
{
	Info_ClearChoices(DIA_Brahim_Kap3_First_EXIT);
};

func void DIA_Brahim_Kap3_First_EXIT_WhereGetIt()
{
	AI_Output(other,self, " DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00 " );	// Where did you get this card?
	AI_Output(self,other, " DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01 " );	// Oh, I found it in a stack of old cards I bought recently.
	AI_Output(self,other, " DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02 " );	// The salesperson must have overlooked it.
};

func void DIA_Brahim_Kap3_First_EXIT_Content()
{
	AI_Output(other,self, " DIA_Brahim_Kap3_First_EXIT_Content_15_00 " );	// What is this map?
	AI_Output(self,other, " DIA_Brahim_Kap3_First_EXIT_Content_07_01 " );	// Looks like it's a treasure map or something.
	AI_Output(self,other, " DIA_Brahim_Kap3_First_EXIT_Content_07_02 " );	// But you seem to be the type to figure it out on your own.
};

func void DIA_Brahim_Kap3_First_EXIT_KeepIt()
{
	AI_Output(other,self, " DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00 " );	// Why didn't you keep it for yourself?
	AI_Output(self,other, " DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01 " );	// I'm an old man, and the days when I searched for treasure myself are long gone.
	AI_Output(self,other, " DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02 " );	// Let the younger ones do it.
};

instance DIA_Brahim_NeedWorldMap(C_Info)
{
	npc = VLK_437_Brahim;
	nr = 2;
	condition = DIA_Brahim_NeedWorldMap_Condition;
	information = DIA_Brahim_NeedWorldMap_Info;
	permanent = FALSE;
	description = " I need a sea chart. " ;
};

func int DIA_Brahim_NeedWorldMap_Condition()
{
	if((MIS_SylvioCrew == LOG_Running) && (RatfordNeedMap == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Brahim_NeedWorldMap_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Brahim_NeedWorldMap_01_00 " );	// I need a sea chart that shows an accurate course to the mainland.
	AI_Output(self,other, " DIA_Brahim_NeedWorldMap_01_01 " );	// Hmmm...(surprised) Where can I get it from?
	AI_Output(other,self, " DIA_Brahim_NeedWorldMap_01_02 " );	// But you're a cartographer!
	AI_Output(self,other, " DIA_Brahim_NeedWorldMap_01_03 " );	// Yes, but not a sailor! I only draw maps of places where I have been.
	AI_Output(self,other, " DIA_Brahim_NeedWorldMap_01_04 " );	// And I have never even been to the sea.
	AI_Output(other,self, " DIA_Brahim_NeedWorldMap_01_05 " );	// Can you at least tell me where I can get it?
	AI_Output(self,other, " DIA_Brahim_NeedWorldMap_01_06 " );	// Paladins might have it. They somehow got here.
	AI_Output(other,self, " DIA_Brahim_NeedWorldMap_01_07 " );	// Yes, they may well have it.
	B_LogEntry(Topic_SylvioCrew, " Cartographer Ibrahim doesn't have the card I need, but he says paladins might have one. " );
};
