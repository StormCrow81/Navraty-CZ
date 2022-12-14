
var int Trinkfass_UnCan;
var int Trinkfass_RestoreCount;
var int Trinkfass_RestoreDay;
var int Trinkfass_HolyRestoreDay;
var int Trinkfass_HolyWaterDay_01;
var int Trinkfass_HolyWaterDay_02;
var int Trinkfass_HolyWaterDay_03;
var int Trinkfass_HolyWaterDay_04;
var int WaitMasDone;
var int MasCampfireRest;

FUNC VOID Trinkfass_S1()
{
	var C_NPC her; 	
	var int DayNow;

	DayNow = Wld_GetDay();
	her = Hlp_GetNpc(PC_Hero); 
	
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};		

		self.aivar[AIV_INVINCIBLE] = TRUE;
		PLAYER_MOBSI_PRODUCTION = MOBSI_TRINKFASS;

		if(Trinkfass_HolyRestoreDay <= (DayNow - 1))
		{
			if((Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_01") < 500) || (Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_02") < 500) || (Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_03") < 500) || (Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_04") < 500))
			{
				RestoreHealth = TRUE;
				SumTempHPRes = FALSE;
				RestoreHealth_Proc = (hero.attribute[ATR_HITPOINTS_MAX] * 5) / 100;
			
				if((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV))
				{
					RestoreMana = TRUE;
					SumTempManaRes = FALSE;
					RestoreMana_Proc = (hero.attribute[ATR_HITPOINTS_MAX] * 5) / 100;
				};

				Drinking barrel_HolyRestoreDay = Wld_GetDay();
				AI_Print( " You feel energized! " );
			};
		};

		Ai_ProcessInfos(her);
	};
}; 

INSTANCE PC_Trinkfass_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_Trinkfass_End_Condition;
	information = PC_Trinkfass_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK; 
};

FUNC INT PC_Trinkfass_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION == MOBSI_TRINKFASS)
	{	
		return TRUE;
	};
};

FUNC  VOID PC_TRINKFASS_End_Info()
{
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE TRINKFASS_HolyNWasser(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = TRINKFASS_HolyNWasser_Condition;
	information = TRINKFASS_HolyNWasser_Info;
	permanent = TRUE;
	description = " Collect holy water. " ;
};

FUNC INT TRINKFASS_HolyNWasser_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TRINKFASS) && ((Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_01") < 500) || (Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_02") < 500) || (Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_03") < 500) || (Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_04") < 500)))
	{	
		return TRUE;
	};
};

FUNC  VOID DRINKING BARREL_HolyNWater_Info()
{
	var int DayNow;

	DayNow = Wld_GetDay();
	
	if((Trinkfass_HolyWaterDay_01 <= (DayNow - 1)) && (Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_01") < 500))
	{
 		if(Npc_HasItems(hero,ItMi_Bottle_Empty) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_Bottle_Empty,1);
			CreateInvItems(hero,ItMi_HolyWater,1);
			Trinkfass_HolyWaterDay_01 = Wld_GetDay();
		}
		else
		{
			Print(PRINT_WaterSuck);
			B_Say_Overlay(self,self,"$MISSINGITEM");
		};
	}
	else
	{
		if(Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_01") < 500)
		{
			Print(PRINT_NOTHINGTOGET03);
			B_Say_Overlay(self,self,"$NOTHINGTOGET03");
		};
	};
	if((Trinkfass_HolyWaterDay_02 <= (DayNow - 1)) && (Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_02") < 500))
	{
 		if(Npc_HasItems(hero,ItMi_Bottle_Empty) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_Bottle_Empty,1);
			CreateInvItems(hero,ItMi_HolyWater,1);
			Trinkfass_HolyWaterDay_02 = Wld_GetDay();
		}
		else
		{
			Print(PRINT_WaterSuck);
			B_Say_Overlay(self,self,"$MISSINGITEM");
		};
	}
	else
	{
		if(Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_02") < 500)
		{
			Print(PRINT_NOTHINGTOGET03);
			B_Say_Overlay(self,self,"$NOTHINGTOGET03");
		};
	};
	if((Trinkfass_HolyWaterDay_03 <= (DayNow - 1)) && (Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_03") < 500))
	{
 		if(Npc_HasItems(hero,ItMi_Bottle_Empty) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_Bottle_Empty,1);
			CreateInvItems(hero,ItMi_HolyWater,1);
			Trinkfass_HolyWaterDay_03 = Wld_GetDay();
		}
		else
		{
			Print(PRINT_WaterSuck);
			B_Say_Overlay(self,self,"$MISSINGITEM");
		};
	}
	else
	{
		if(Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_03") < 500)
		{
			Print(PRINT_NOTHINGTOGET03);
			B_Say_Overlay(self,self,"$NOTHINGTOGET03");
		};
	};
	if((Trinkfass_HolyWaterDay_04 <= (DayNow - 1)) && (Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_04") < 500))
	{
 		if(Npc_HasItems(hero,ItMi_Bottle_Empty) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_Bottle_Empty,1);
			CreateInvItems(hero,ItMi_HolyWater,1);
			Trinkfass_HolyWaterDay_04 = Wld_GetDay();
		}
		else
		{
			Print(PRINT_WaterSuck);
			B_Say_Overlay(self,self,"$MISSINGITEM");
		};
	}
	else
	{
		if(Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_04") < 500)
		{
			Print(PRINT_NOTHINGTOGET03);
			B_Say_Overlay(self,self,"$NOTHINGTOGET03");
		};
	};

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE TRINKFASS_NWasser(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = TRINKFASS_NWasser_Condition;
	information = TRINKFASS_NWater_Info;
	permanent = TRUE;
	description = " Drink some water. " ;
};

FUNC  INT DRINKING BARREL_NWater_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_TRINKFASS) && (Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_01") > 500) && (Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_02") > 500) && (Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_03") > 500) && (Npc_GetDistToWP(hero,"NW_MONASTERY_KUPEL_04") > 500))
	{	
		return TRUE;
	};
};

FUNC  VOID DRINKING BAG_NWater_Info()
{
	if(Hero_Thirst < 5)
	{
		if(hero.attribute[ATR_HITPOINTS] < hero.attribute[ATR_HITPOINTS_MAX])
		{
			hero.attribute[ATR_HITPOINTS] += 10;
		}
		else if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
		};

		ATR_STAMINA[0] = ATR_STAMINA[0] + 20;
	
		if(ATR_STAMINA[0] > (ATR_STAMINA_MAX[0] * 10))
		{
			ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;
		};

		Hero_Thirst = Hero_Thirst + 3;

		if(Hero_Thirst > 5)
		{
			Hero_Thirst = 5;
		};
	}
	else
	{
		AI_Print( " You're not thirsty! " );
		B_Say(hero,hero,"$Aargh_3");
		AI_PlayAni(hero,"T_TRINKFASS_SEP");
		Hero_Thirst = 5;
	};

	B_ENDPRODUCTIONDIALOG();
};

var int HolyChan_01;
var int HolyChan_02;
var int HolyChan_03;
var int HolyChan_04;

FUNC VOID WELL_S1()
{
	var C_NPC her; 	
	her = Hlp_GetNpc(PC_Hero); 
	
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[ AIV_INVINCIBLE ] = TRUE ;
		PLAYER_MOBSI_PRODUCTION = MOBSI_WELL;
		Ai_ProcessInfos(her);
	};
}; 

INSTANCE PC_WELL_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_WELL_End_Condition;
	information = PC_WELL_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK; 
};

FUNC INT PC_WELL_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION	== MOBSI_WELL)
	{	
 		return TRUE;
	};
};

FUNC VOID PC_WELL_End_Info()
{
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_WELL_NWasser(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_WELL_NWasser_Condition;
	information = PC_WELL_NWasser_Info;
	permanent = TRUE;
	description = " Get some water. " ;
};

FUNC INT PC_WELL_NWasser_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WELL) && (Npc_GetDistToWP(hero,"AV_WELL") < 1000)) 
	{	
		return TRUE;
	};
};

FUNC VOID PC_WELL_NWasser_Info()
{
 	if(Npc_HasItems(hero,ItMi_Bottle_Empty) >= 1)
	{
		Snd_Play("DRINKBOTTLE");
		AI_Wait(hero,1);
		CreateInvItems(hero,ItFo_AdanosWater,1);
		Npc_RemoveInvItems(hero,ItMi_Bottle_Empty,1);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		Print(PRINT_WaterSuck);
		AI_PlayAni(self, " T_DONTKNOW " );
		B_Say_Overlay(self,self,"$MISSINGITEM");
	};
};

INSTANCE PC_WELL_NWasserMany(C_Info)
{
	npc = PC_Hero;
	nr = 556;
	condition = PC_WELL_NWasserMany_Condition;
	information = PC_WELL_NWasserMany_Info;
	permanent = TRUE;
	description = " Get plenty of water (Requires: 5 empty bottles) " ;
};

FUNC INT PC_WELL_NWasserMany_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WELL) && (Npc_GetDistToWP(hero,"AV_WELL") < 1000)) 
	{	
		return TRUE;
	};
};

FUNC VOID PC_WELL_NWasserMany_Info()
{
 	if(Npc_HasItems(hero,ItMi_Bottle_Empty) >= 5)
	{
		Snd_Play("DRINKBOTTLE");
		AI_Wait(hero,1);
		CreateInvItems(hero,ItFo_AdanosWater,5);
		Npc_RemoveInvItems(hero,ItMi_Bottle_Empty,5);
		Print(PRINT_Success);
		//B_Say(self,self,"$ITEMREADY");
	}
	else
	{
		Print(PRINT_WaterSuck);
		AI_PlayAni(self, " T_DONTKNOW " );
		B_Say_Overlay(self,self,"$MISSINGITEM");
	};
};

INSTANCE PC_WELL_DrainHolyChan_01(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_WELL_DrainHolyChan_01_Condition;
	information = PC_WELL_DrainHolyChan_01_Info;
	permanent = TRUE;
	description = " Fill the sacred vessel. " ;
};

FUNC INT PC_WELL_DrainHolyChan_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WELL) && (TaskHram_01 == TRUE) && (HolyChanDone == FALSE) && (Npc_HasItems(hero,ItFo_AdanosWater) >= 1) && (Npc_GetDistToWP(hero,"AV_ADANOSHOLYCHAN_01") < 1000) && (HolyChan_01 == FALSE)) 
	{	
		return TRUE;
	};

	return  FALSE ;
};

FUNC VOID PC_WELL_DrainHolyChan_01_Info()
{
	B_GivePlayerXP(500);
	HolyChan_01 = TRUE;
	Snd_Play("DRINKBOTTLE");
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_SendTrigger("EVT_ADANOSCHAN_01");
	Npc_RemoveInvItems(hero,ItFo_AdanosWater,1);
	Print(PRINT_Success);

	if((HolyChan_01 == TRUE) && (HolyChan_02 == TRUE) && (HolyChan_03 == TRUE) && (HolyChan_04 == TRUE) && (HolyChanDone == FALSE))
	{
		Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
		HolyChanDone = TRUE;
		AI_Print(PRINT_TEMPLETASK_01_DONE);
		B_LogEntry(TOPIC_AdanosCrone, " I've filled all the sacred vats with water! This seems to be what the ancient scripture meant... " );
	};

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_WELL_DrainHolyChan_02(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_WELL_DrainHolyChan_02_Condition;
	information = PC_WELL_DrainHolyChan_02_Info;
	permanent = TRUE;
	description = " Fill the sacred vessel. " ;
};

FUNC INT PC_WELL_DrainHolyChan_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WELL) && (TaskHram_01 == TRUE) && (HolyChanDone == FALSE) && (Npc_HasItems(hero,ItFo_AdanosWater) >= 1) && (Npc_GetDistToWP(hero,"AV_ADANOSHOLYCHAN_02") < 1000) && (HolyChan_02 == FALSE)) 
	{	
		return TRUE;
	};

	return  FALSE ;
};

FUNC VOID PC_WELL_DrainHolyChan_02_Info()
{
	B_GivePlayerXP(500);
	HolyChan_02 = TRUE;
	Snd_Play("DRINKBOTTLE");
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_SendTrigger("EVT_ADANOSCHAN_02");
	Npc_RemoveInvItems(hero,ItFo_AdanosWater,1);
	Print(PRINT_Success);

	if((HolyChan_01 == TRUE) && (HolyChan_02 == TRUE) && (HolyChan_03 == TRUE) && (HolyChan_04 == TRUE) && (HolyChanDone == FALSE))
	{
		Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
		HolyChanDone = TRUE;
		AI_Print(PRINT_TEMPLETASK_01_DONE);
		B_LogEntry(TOPIC_AdanosCrone, " I've filled all the sacred vats with water! This seems to be what the ancient scripture meant... " );
	};

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_WELL_DrainHolyChan_03(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_WELL_DrainHolyChan_03_Condition;
	information = PC_WELL_DrainHolyChan_03_Info;
	permanent = TRUE;
	description = " Fill the sacred vessel. " ;
};

FUNC INT PC_WELL_DrainHolyChan_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WELL) && (TaskHram_01 == TRUE) && (HolyChanDone == FALSE) && (Npc_HasItems(hero,ItFo_AdanosWater) >= 1) && (Npc_GetDistToWP(hero,"AV_ADANOSHOLYCHAN_03") < 1000) && (HolyChan_03 == FALSE)) 
	{	
		return TRUE;
	};

	return  FALSE ;
};

FUNC VOID PC_WELL_DrainHolyChan_03_Info()
{
	B_GivePlayerXP(500);
	HolyChan_03 = TRUE;
	Snd_Play("DRINKBOTTLE");
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_SendTrigger("EVT_ADANOSCHAN_03");
	Npc_RemoveInvItems(hero,ItFo_AdanosWater,1);
	Print(PRINT_Success);

	if((HolyChan_01 == TRUE) && (HolyChan_02 == TRUE) && (HolyChan_03 == TRUE) && (HolyChan_04 == TRUE) && (HolyChanDone == FALSE))
	{
		Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
		HolyChanDone = TRUE;
		AI_Print(PRINT_TEMPLETASK_01_DONE);
		B_LogEntry(TOPIC_AdanosCrone, " I've filled all the sacred vats with water! This seems to be what the ancient scripture meant... " );
	};

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_WELL_DrainHolyChan_04(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_WELL_DrainHolyChan_04_Condition;
	information = PC_WELL_DrainHolyChan_04_Info;
	permanent = TRUE;
	description = " Fill the sacred vessel. " ;
};

FUNC INT PC_WELL_DrainHolyChan_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_WELL) && (TaskHram_01 == TRUE) && (HolyChanDone == FALSE) && (Npc_HasItems(hero,ItFo_AdanosWater) >= 1) && (Npc_GetDistToWP(hero,"AV_ADANOSHOLYCHAN_04") < 1000) && (HolyChan_04 == FALSE)) 
	{	
		return TRUE;
	};

	return  FALSE ;
};

FUNC VOID PC_WELL_DrainHolyChan_04_Info()
{
	B_GivePlayerXP(500);
	HolyChan_04 = TRUE;
	Snd_Play("DRINKBOTTLE");
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_SendTrigger("EVT_ADANOSCHAN_04");
	Npc_RemoveInvItems(hero,ItFo_AdanosWater,1);
	Print(PRINT_Success);

	if((HolyChan_01 == TRUE) && (HolyChan_02 == TRUE) && (HolyChan_03 == TRUE) && (HolyChan_04 == TRUE) && (HolyChanDone == FALSE))
	{
		Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
		HolyChanDone = TRUE;
		AI_Print(PRINT_TEMPLETASK_01_DONE);
		B_LogEntry(TOPIC_AdanosCrone, " I've filled all the sacred vats with water! This seems to be what the ancient scripture meant... " );
	};

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_WELL_DragonEgg(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_WELL_DragonEgg_Condition;
	information = PC_WELL_DragonEgg_Info;
	permanent = TRUE;
	description = " Place dragon egg. " ;
};

FUNC INT PC_WELL_DragonEgg_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_WELL ) && (TaskHram_02 ==  TRUE ) && (Npc_HasItems(hero,ItAt_DragonEgg_MIS) >=  1 ) && (Npc_GetDistToWP(hero, " AV_DRAGONEGG " ) <  1000 ) && (DragEggPray )) ==  FALSE ;
	{	
		return TRUE;
	};

	return  FALSE ;
};

FUNC VOID PC_WELL_DragonEgg_Info()
{
	B_GivePlayerXP(500);
	DragEggPray = TRUE;
	Wld_PlayEffect("spellFX_INCOVATION_RED",hero,hero,0,0,0,FALSE);
	Wld_SendTrigger("EVT_DRAGONEGG");
	Npc_RemoveInvItems(hero,ItAt_DragonEgg_MIS,1);
	AI_Print(PRINT_TEMPLETASK_02_DONE);
	B_LogEntry(TOPIC_AdanosCrone, " I gave Adanos a gift of a mighty dragon's egg... He seems to like it! " );
	B_ENDPRODUCTIONDIALOG();
};

FUNC  VOID  STEINDESWISSENS_S1 ()
{
	var C_NPC her; 	
	her = Hlp_GetNpc(PC_Hero); 
	
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[ AIV_INVINCIBLE ] = TRUE ;
		PLAYER_MOBSI_PRODUCTION = MOBSI_STEINDESWISSENS;
		Ai_ProcessInfos(her);
	};
}; 

INSTANCE PC_STEINDESWISSENS_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition =  PC_STEINDESWISSENS_End_Condition;
	information = PC_STEINDESWISSENS_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK; 
};

FUNC INT  PC_STEINDESWISSENS_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION	== MOBSI_STEINDESWISSENS)
	{	
 		return TRUE;
	};
};

FUNC  VOID PC_STEINDESWISSENS_End_Info()
{
	B_ENDPRODUCTIONDIALOG();
};

var int FireCamp_MeatRoast;

FUNC VOID firecamp_S1()
{
	var C_NPC her; 	
	her = Hlp_GetNpc(PC_Hero); 
	
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[ AIV_INVINCIBLE ] = TRUE ;
		PLAYER_MOBSI_PRODUCTION = MOBSI_FIRECAMP;
		AI_PlayAniBS(hero,"T_STAND_2_SIT",BS_SIT);
		Ai_ProcessInfos(her);
	};
}; 

INSTANCE PC_Firecamp_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_Firecamp_End_Condition;
	information = PC_Firecamp_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK; 
};

FUNC INT PC_Firecamp_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION	== MOBSI_FIRECAMP)
	{	
 		return TRUE;
	};
};

FUNC VOID PC_Firecamp_End_Info()
{
	B_ENDPRODUCTIONDIALOG ();
	AI_Wait(hero,2);
	AI_PlayAniBS(hero,"T_SIT_2_STAND",BS_STAND);
};

INSTANCE PC_Firecamp_Wait(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_Firecamp_Wait_Condition;
	information = PC_Firecamp_Wait_Info;
	permanent = TRUE;
	description = " Wait till morning. " ;
};

FUNC INT PC_Firecamp_Wait_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FIRECAMP) && (WaitMasDone == FALSE) && (MasCampfireRest == FALSE) && (FireCamp_MeatRoast == FALSE) && (CurrentLevel == PRIORATWORLD_ZEN) && (MIS_MasiafStory == LOG_Running) && (PW_BeginFake == FALSE))
	{	
		return TRUE;
	};
};

FUNC VOID PC_Firecamp_Wait_Info()
{
	PlayVideo("RET2_BlackScreen.bik");
	Wld_SetTime( 7 , 0 );
	AI_Wait(hero,2);
	B_ENDPRODUCTIONDIALOG ();
	WaitMasDone = TRUE;
	AI_PlayAniBS(hero,"T_SIT_2_STAND",BS_STAND);	
};

instance PC_Firecamp_CampfireRest(C_Info)
{
	npc = PC_Hero;
	nr = 900;
	condition = PC_Firecamp_CampfireRest_Condition;
	information = PC_Firecamp_CampfireRest_Info;
	permanent = TRUE;
	description = " Rest... " ;
};

func int PC_Firecamp_CampfireRest_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FIRECAMP) && (WaitMasDone == TRUE) && (FireCamp_MeatRoast == FALSE) && (MasCampfireRest == FALSE) && (CurrentLevel == PRIORATWORLD_ZEN))
	{
		return TRUE;
	};
};

func void PC_Firecamp_CampfireRest_Info()
{
	MasCampfireRest = TRUE;
};

instance PC_Firecamp_CampfireRest_No(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_Firecamp_CampfireRest_No_condition;
	information = PC_Firecamp_CampfireRest_No_info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_Firecamp_CampfireRest_No_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FIRECAMP) && (WaitMasDone == TRUE) && (FireCamp_MeatRoast == FALSE) && (MasCampfireRest == TRUE) && (CurrentLevel == PRIORATWORLD_ZEN))
	{
		return TRUE;
	};
};

func void PC_Firecamp_CampfireRest_No_info()
{
	MasCampfireRest = FALSE;
};


instance PC_Firecamp_CampfireRest_1H(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_Firecamp_CampfireRest_1H_condition;
	information = PC_Firecamp_CampfireRest_1H_info;
	permanent = TRUE;
	description = "...1 час";
};

func int PC_Firecamp_CampfireRest_1H_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FIRECAMP) && (WaitMasDone == TRUE) && (FireCamp_MeatRoast == FALSE) && (MasCampfireRest == TRUE) && (CurrentLevel == PRIORATWORLD_ZEN) && (RestPool >= 1))
	{
		return TRUE;
	};
};

func void PC_Firecamp_CampfireRest_1H_info()
{
	var int bHour;
	var int bMinute;

	if(SBMODE == TRUE)
	{
		Hero_Fatigue = Hero_Fatigue + 1;

		if(Hero_Fatigue >= 10)
		{
			Hero_Fatigue = 10;
		};
	};

	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + ((hero.attribute[ATR_HITPOINTS_MAX] * 10) / 100);

	if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};

	ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;

	RestPool = RestPool -  1 ;
	bHour = Wld_GetTimeHour();
	bMinute = Wld_GetTimeMin();
	bHour +=  1 ;
	Wld_SetTime(bHour,bMinute);
	MasCampfireRest = FALSE;
};

instance PC_Firecamp_CampfireRest_2H(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_Firecamp_CampfireRest_2H_condition;
	information = PC_Firecamp_CampfireRest_2H_info;
	permanent = TRUE;
	description = "...2 часа";
};

func int PC_Firecamp_CampfireRest_2H_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FIRECAMP) && (WaitMasDone == TRUE) && (FireCamp_MeatRoast == FALSE) && (MasCampfireRest == TRUE) && (CurrentLevel == PRIORATWORLD_ZEN) && (RestPool >= 2))
	{
		return TRUE;
	};
};

func void PC_Firecamp_CampfireRest_2H_info()
{
	var int bHour;
	var int bMinute;

	if(SBMODE == TRUE)
	{
		Hero_Fatigue = Hero_Fatigue + 2;

		if(Hero_Fatigue >= 10)
		{
			Hero_Fatigue = 10;
		};
		if(Hero_Hunger > 1)
		{
			Hero_Hunger -= 1;
		}		
		else
		{
			Hero_Hunger = FALSE ;
		};	
		if(Hero_Thirst > 1)
		{
			Hero_Thirst -= 1;
		}		
		else
		{
			Hero_Thirst = FALSE;
		};	
	};

	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + ((hero.attribute[ATR_HITPOINTS_MAX] * 20) / 100);

	if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};

	ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;

	RestPool = RestPool -  2 ;
	bHour = Wld_GetTimeHour();
	bMinute = Wld_GetTimeMin();
	bHour +=  2 ;
	Wld_SetTime(bHour,bMinute);
	MasCampfireRest = FALSE;
};

instance PC_Firecamp_CampfireRest_3H(C_Info)
{
	npc = PC_Hero;
	nr = 3;
	condition = PC_Firecamp_CampfireRest_3H_condition;
	information = PC_Firecamp_CampfireRest_3H_info;
	permanent = TRUE;
	description = "...3 часа";
};

func int PC_Firecamp_CampfireRest_3H_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FIRECAMP) && (WaitMasDone == TRUE) && (FireCamp_MeatRoast == FALSE) && (MasCampfireRest == TRUE) && (CurrentLevel == PRIORATWORLD_ZEN) && (RestPool >= 3))
	{
		return TRUE;
	};
};

func void PC_Firecamp_CampfireRest_3H_info()
{
	var int bHour;
	var int bMinute;

	if(SBMODE == TRUE)
	{
		Hero_Fatigue = Hero_Fatigue + 3;

		if(Hero_Fatigue >= 10)
		{
			Hero_Fatigue = 10;
		};
		if(Hero_Hunger > 2)
		{
			Hero_Hunger -= 2;
		}		
		else
		{
			Hero_Hunger = FALSE ;
		};	
		if(Hero_Thirst > 2)
		{
			Hero_Thirst -= 2;
		}		
		else
		{
			Hero_Thirst = FALSE;
		};	
	};

	hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] + ((hero.attribute[ATR_HITPOINTS_MAX] * 30) / 100);

	if(hero.attribute[ATR_HITPOINTS] > hero.attribute[ATR_HITPOINTS_MAX])
	{
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS_MAX];
	};

	ATR_STAMINA[0] = ATR_STAMINA_MAX[0] * 10;

	RestPool = RestPool -  3 ;
	bHour = Wld_GetTimeHour();
	bMinute = Wld_GetTimeMin();
	bHour +=  3 ;
	Wld_SetTime(bHour,bMinute);
	MasCampfireRest = FALSE;
};

instance PC_Firecamp_MEATFIRE(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_Firecamp_MEATFIRE_condition;
	information = PC_Firecamp_MEATFIRE_info;
	permanent = TRUE;
	description = " Fry meat... " ;
};

func int PC_Firecamp_MEATFIRE_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FIRECAMP) && (WaitMasDone == TRUE) && (WaitMasDone == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 1) && (FireCamp_MeatRoast == FALSE) && (MasCampfireRest == FALSE))
	{
		return TRUE;
	};
};

func void PC_Firecamp_MEATFIRE_info()
{
	FireCamp_MeatRoast = TRUE;
};

instance PC_Firecamp_FLEISCHBRATEN(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_Firecamp_fleischbraten_condition;
	information = PC_Firecamp_fleischbraten_info;
	permanent = TRUE;
	description = " ...fry a piece of meat " ;
};

func int PC_Firecamp_fleischbraten_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FIRECAMP) && (WaitMasDone == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 1) && (FireCamp_MeatRoast == TRUE) && (MasCampfireRest == FALSE))
	{
		return TRUE;
	};
};

func void PC_Firecamp_fleischbraten_info()
{
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,1);
	CreateInvItems(hero,ItFoMutton,1);
	FireCamp_MeatRoast = FALSE;
	b_endproductiondialog();
	AI_Wait(hero,2);
	AI_PlayAniBS(hero,"T_SIT_2_STAND",BS_STAND);
};

instance PC_Firecamp_FLEISCHBRATEN_10X(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_Firecamp_fleischbraten10x_condition;
	information = PC_Firecamp_fleischbraten10x_info;
	permanent = TRUE;
	description = " ...fry 10 pieces of meat " ;
};

func int PC_Firecamp_fleischbraten10x_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FIRECAMP) && (WaitMasDone == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 10) && (FireCamp_MeatRoast == TRUE) && (MasCampfireRest == FALSE))
	{
		return TRUE;
	};
};

func void PC_Firecamp_fleischbraten10x_info()
{
	FireCamp_MeatRoast = FALSE;
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,10);
	CreateInvItems(hero,ItFoMutton,10);
	b_endproductiondialog();
	AI_Wait(hero,2);
	AI_PlayAniBS(hero,"T_SIT_2_STAND",BS_STAND);
};

instance PC_Firecamp_FLEISCHBRATEN_50X(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_Firecamp_fleischbraten50x_condition;
	information = PC_Firecamp_fleischbraten50x_info;
	permanent = TRUE;
	description = " ...fry 50 pieces of meat " ;
};

func int PC_Firecamp_fleischbraten50x_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FIRECAMP) && (WaitMasDone == TRUE) && (Npc_HasItems(hero,ItFoMuttonRaw) >= 50) && (FireCamp_MeatRoast == TRUE) && (MasCampfireRest == FALSE))
	{
		return TRUE;
	};
};

func void PC_Firecamp_fleischbraten50x_info()
{
	Npc_RemoveInvItems(hero,ItFoMuttonRaw,50);
	CreateInvItems(hero,ItFoMutton,50);
	FireCamp_MeatRoast = FALSE;
	b_endproductiondialog();
	AI_Wait(hero,2);
	AI_PlayAniBS(hero,"T_SIT_2_STAND",BS_STAND);
};

instance PC_Firecamp_MEATFIRE_No(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_Firecamp_MEATFIRE_No_condition;
	information = PC_Firecamp_MEATFIRE_No_info;
	permanent = TRUE;
	description = Dialog_Back;
};

func int PC_Firecamp_MEATFIRE_No_condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_FIRECAMP) && (WaitMasDone == TRUE) && (FireCamp_MeatRoast == TRUE) && (MasCampfireRest == FALSE))
	{
		return TRUE;
	};
};

func void PC_Firecamp_MEATFIRE_No_info()
{
	FireCamp_MeatRoast = FALSE;
};

FUNC VOID PYRAMID_WRITE_S1()
{
	var C_NPC her; 	
	her = Hlp_GetNpc(PC_Hero); 
	
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[ AIV_INVINCIBLE ] = TRUE ;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PYRAMID_WRITE;
		Ai_ProcessInfos(her);
	};
}; 

INSTANCE PC_PYRAMID_WRITE_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PYRAMID_WRITE_End_Condition;
	information = PC_PYRAMID_WRITE_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK; 
};

FUNC INT PC_PYRAMID_WRITE_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION	== MOBSI_PYRAMID_WRITE)
	{	
 		return TRUE;
	};
};

FUNC VOID PC_PYRAMID_WRITE_End_Info()
{
	B_ENDPRODUCTIONDIALOG();
};

var int GetPasswordText;
var int KnowMissAncientText;
var int CanReadGreatBook_01;
var int CanReadGreatBook_02;

INSTANCE PC_PYRAMID_WRITE_WatchPass(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_PYRAMID_WRITE_WatchPass_Condition;
	information = PC_PYRAMID_WRITE_WatchPass_Info;
	permanent = TRUE;
	description = " Examine the tablet... " ;
};

FUNC INT PC_PYRAMID_WRITE_WatchPass_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PYRAMID_WRITE) && (KnowMissAncientText == FALSE))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PYRAMID_WRITE_WatchPass_Info()
{
	KnowMissAncientText = TRUE;
	AI_Print(PRINT_MISSPARTANCIENTTEXT);
	B_LogEntry(TOPIC_AdanosCrone, " I found a very strange altar of the ancients. It looks like a few pieces are missing from the broken slate board. I think I should look for them. But where?! " );
};


INSTANCE PC_PYRAMID_WRITE_LostPiesis_01(C_Info)
{
	npc = PC_Hero;
	nr = 1;
	condition = PC_PYRAMID_WRITE_LostPiesis_01_Condition;
	information = PC_PYRAMID_WRITE_LostPiesis_01_Info;
	permanent = TRUE;
	description = " Insert the left piece of the tablet. " ;
};

FUNC INT PC_PYRAMID_WRITE_LostPiesis_01_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_PYRAMID_WRITE ) && ( KnowMissAncientText ==  TRUE ) && ( Npc_HasItems ( hero , ItI_DuneAdanos ) >=  1 ) && ( CanReadGreatBook_01 ==  FALSE )) ;
	{	
		return TRUE;
	};
};

FUNC VOID PC_PYRAMID_WRITE_LostPiesis_01_Info()
{
	Snd_Play("TOUCHPLATE_STONE_PUSH");
	Npc_RemoveInvItems(hero,ItMi_DuneAdanos,1);
	CanReadGreatBook_01 = TRUE;

	if((CanReadGreatBook_01 == TRUE) && (CanReadGreatBook_02 == TRUE) && (CanReadGreatBook == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
		CanReadGreatBook = TRUE;
		B_LogEntry(TOPIC_AdanosCrone, " I've completed the tablet at the altar! Now you can look at the whole picture... " );
	};
};

INSTANCE PC_PYRAMID_WRITE_LostPiesis_02(C_Info)
{
	npc = PC_Hero;
	nr = 2;
	condition = PC_PYRAMID_WRITE_LostPiesis_02_Condition;
	information = PC_PYRAMID_WRITE_LostPiesis_02_Info;
	permanent = TRUE;
	description = " Insert right tablet piece. " ;
};

FUNC INT PC_PYRAMID_WRITE_LostPiesis_02_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_PYRAMID_WRITE ) && ( KnowMissAncientText ==  TRUE ) && ( Npc_HasItems ( hero , ItMi_GuneAdanos_02 ) >=  1 ) && ( CanReadGreatBook_02 ==  FALSE )) ;
	{	
		return TRUE;
	};
};

FUNC VOID PC_PYRAMID_WRITE_LostPiesis_02_Info()
{
	Snd_Play("TOUCHPLATE_STONE_PUSH");
	Npc_RemoveInvItems(hero,ItMi_GuneAdanos_02,1);
	CanReadGreatBook_02 = TRUE;

	if((CanReadGreatBook_01 == TRUE) && (CanReadGreatBook_02 == TRUE) && (CanReadGreatBook == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
		CanReadGreatBook = TRUE;
		B_LogEntry(TOPIC_AdanosCrone, " I've completed the tablet at the altar! Now you can look at the whole picture... " );
	};
};

INSTANCE PC_PYRAMID_WRITE_GetPassword(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_PYRAMID_WRITE_GetPassword_Condition;
	information = PC_PYRAMID_WRITE_GetPassword_Info;
	permanent = TRUE;
	description = " Retrieve the collected magic tablet. " ;
};

FUNC INT PC_PYRAMID_WRITE_GetPassword_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PYRAMID_WRITE) && (CanReadGreatBook == TRUE) && (GetPasswordText == FALSE))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PYRAMID_WRITE_GetPassword_Info()
{
	Snd_Play("TOUCHPLATE_STONE_PUSH");
	GetPasswordText = TRUE;
	CreateInvItems(hero,ItMi_LuneAdanos_Full,1);
	B_ENDPRODUCTIONDIALOG();
};

FUNC VOID PYRAMID_PASSWORD_S1()
{
	var C_NPC her; 	
	her = Hlp_GetNpc(PC_Hero); 
	
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[ AIV_INVINCIBLE ] = TRUE ;
		PLAYER_MOBSI_PRODUCTION = MOBSI_PYRAMID_PASSWORD;
		Ai_ProcessInfos(her);
	};
}; 

INSTANCE PC_PYRAMID_PASSWORD_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_PYRAMID_PASSWORD_End_Condition;
	information = PC_PYRAMID_PASSWORD_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK; 
};

FUNC INT PC_PYRAMID_PASSWORD_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION	== MOBSI_PYRAMID_PASSWORD)
	{	
 		return TRUE;
	};
};

FUNC VOID PC_PYRAMID_PASSWORD_End_Info()
{
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_PYRAMID_PASSWORD_OpenPyramid(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_PYRAMID_PASSWORD_OpenPyramid_Condition;
	information = PC_PYRAMID_PASSWORD_OpenPyramid_Info;
	permanent = TRUE;
	description = " Click on the stone symbols... " ;
};

FUNC INT PC_PYRAMID_PASSWORD_OpenPyramid_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_PYRAMID_PASSWORD) && (EnterBigPyramid == FALSE))
	{	
		return TRUE;
	};
};

FUNC VOID PC_PYRAMID_PASSWORD_OpenPyramid_Info()
{
	AI_PlayAni(hero,"T_TOUCHPLATE_STAND_2_S0");
	Snd_Play("TOUCHPLATE_STONE_PUSH");

 	if(KnowPassBigPyramid == TRUE)
	{
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_SendTrigger("EVT_BIGPYRAMIDDOOR_02");
		Wld_SendTrigger("EVT_PASSWORD_PLATE");
		EnterBigPyramid = TRUE;
		B_ENDPRODUCTIONDIALOG();
		B_LogEntry(TOPIC_AdanosCrone, " The passage to the huge pyramid has opened! I think it's worth exploring it carefully... " );
	}
	else
	{
		B_Say(hero,hero,"$DONTWORK");
		B_ENDPRODUCTIONDIALOG();
	};
};

var int EnterTearsTemple;
var int ADANOSBRIDGEIS;
var int  RAVENDOORISOPEN_AV ;


FUNC VOID ADANOSBRIDGE_S1()
{
	var C_NPC her; 	
	her = Hlp_GetNpc(PC_Hero); 
	
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[ AIV_INVINCIBLE ] = TRUE ;
		PLAYER_MOBSI_PRODUCTION = MOBSI_ADANOSBRIDGE;
		Ai_ProcessInfos(her);
	};
}; 

INSTANCE PC_ADANOSBRIDGE_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_ADANOSBRIDGE_End_Condition;
	information = PC_ADANOSBRIDGE_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK; 
};

FUNC INT PC_ADANOSBRIDGE_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION	== MOBSI_ADANOSBRIDGE)
	{	
 		return TRUE;
	};
};

FUNC VOID PC_ADANOSBRIDGE_End_Info()
{
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_ADANOSBRIDGE_Bridge(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSBRIDGE_Bridge_Condition;
	information = PC_ADANOSBRIDGE_Bridge_Info;
	permanent = TRUE;
	description = " Pray to Adanos... " ;
};

FUNC INT PC_ADANOSBRIDGE_Bridge_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_ADANOSBRIDGE) && (ADANOSBRIDGEIS == FALSE))
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSBRIDGE_Bridge_Info()
{
	if((CrownIsUp == TRUE) && (ScipIsUp == TRUE))
	{
		if(Npc_HasItems(hero,ItMi_LuneAdanos_Full) >= 1)
		{
			Npc_RemoveInvItems(hero,ItMi_LuneAdanos_Full,1);
		};

		Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_SendTrigger("EVT_TEMPLEPATH_01");
		ADANOSBRIDGEIS = TRUE;
		B_LogEntry(TOPIC_AdanosCrone, " Adanos has heard my plea! It seems that a magical bridge has sparkled ahead, through which you can cross to the other side... " );
	}
	else
	{
		B_Say(hero,hero,"$DONTREADYFORTHIS");
	};

	B_ENDPRODUCTIONDIALOG();
};

FUNC  VOID  ADANOSSCIP_S1 ()
{
	var C_NPC her; 	
	her = Hlp_GetNpc(PC_Hero); 
	
	if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(her))
	{	
		if(CinemaMod == TRUE)
		{
			Wld_PlayEffect("DIALOGSCOPE_FX",hero,hero,0,0,0,FALSE);
		};

		self.aivar[ AIV_INVINCIBLE ] = TRUE ;
		PLAYER_MOBSI_PRODUCTION = MOBSI_ADANOSSCIP;
		Ai_ProcessInfos(her);
	};
}; 

INSTANCE PC_ADANOSSCIP_End(C_Info)
{
	npc = PC_Hero;
	nr = 999;
	condition = PC_ADANOSSCIP_End_Condition;
	information = PC_ADANOSSCIP_End_Info;
	permanent = TRUE;
	description = DIALOG_ENDE_WORK; 
};

FUNC INT PC_ADANOSSCIP_End_Condition()
{
	if(PLAYER_MOBSI_PRODUCTION	== MOBSI_ADANOSSCIP)
	{	
 		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_End_Info()
{
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_ADANOSSCIP_Raven(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_Raven_Condition;
	information = PC_ADANOSSCIP_Raven_Info;
	permanent = TRUE;
	description = " Lay down the scepter of Adanos... " ;
};

FUNC INT PC_ADANOSSCIP_Raven_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_ADANOSSCIP ) && ( Npc_GetDistToWP ( hero , " AV_SCIPPLACE " ) <  1000 ) && ( Npc_HasItems ( hero , ItRi_AdanosGoldSkipetr ) >=  1 ) && ( RAVENDOORISOPEN_AV  ==  FALSE )) ;
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_Raven_Info()
{
	Snd_Play("MFX_TELEKINESIS_STARTINVEST");
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
	Npc_RemoveInvItems(hero,ItRi_AdanosGoldSkipetr,1);
	Wld_SendTrigger("EVT_INPLACE_SKIPETR");
	Wld_SendTrigger("EVT_RAVENTEMPLEDOOR_MAIN_01");
	Wld_SendTrigger( " CAM_RAVENTEMPLEDOOR_MAIN_01 " );
	RAVENDOORISOPEN_AV = TRUE ;
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_ADANOSSCIP_OpenTearsTemple(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_OpenTearsTemple_Condition;
	information = PC_ADANOSSCIP_OpenTearsTemple_Info;
	permanent = TRUE;
	description = " Use 'Stone of Tears'... " ;
};

FUNC INT PC_ADANOSSCIP_OpenTearsTemple_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_ADANOSSCIP ) && ( Npc_GetDistToWP ( hero , " AV_TEMPLEOFTEARS " ) <  1000 ) && ( Npc_HasItems ( hero , ItMy_TearsRune ) >=  1 ) && ( EnterTearsTemple ==  FALSE )) ;
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_OpenTearsTemple_Info()
{
	Snd_Play("MFX_TELEKINESIS_STARTINVEST");
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Npc_RemoveInvItems(hero,ItMi_TearsRune,1);
	Wld_SendTrigger("CAM_TEMPLEDOOR");
	Wld_SendTrigger("EVT_TEMPLEDOOR");
	EnterTearsTemple = TRUE;
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_ADANOSSCIP_TempleTask_01(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_TempleTask_01_Condition;
	information = PC_ADANOSSCIP_TempleTask_01_Info;
	permanent = TRUE;
	description = " Study ancient inscriptions... " ;
};

FUNC INT PC_ADANOSSCIP_TempleTask_01_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_ADANOSSCIP ) && ( TaskHram_01 ==  FALSE ) && ( Npc_GetDistToWP ( hero , " AV_TEMPLETASK_01 " ) <  500 )) ;
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_TempleTask_01_Info()
{
	if((BookBonus_114 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_114 = TRUE ;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};
	};

	RankPoints = RankPoints + 1;
	B_Say(hero,hero,"$HOWINTEREST");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_Print(PRINT_TEMPLETASK_01);
	B_LogEntry(TOPIC_AdanosCrone, " The following is written here - '...VESSELS WILL BE FILLED WITH DIVINE MOISTURE AGAIN...'. And what would that mean? All I understood is that I need to fill some containers with water... but what are these? And where can I get water here? " );
	TaskHram_01 = TRUE;
	AI_Wait(hero,5);
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_ADANOSSCIP_TempleTask_02(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_TempleTask_02_Condition;
	information = PC_ADANOSSCIP_TempleTask_02_Info;
	permanent = TRUE;
	description = " Study ancient inscriptions... " ;
};

FUNC INT PC_ADANOSSCIP_TempleTask_02_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_ADANOSSCIP ) && ( TaskHram_02 ==  FALSE ) && ( Npc_GetDistToWP ( hero , " AV_TEMPLETASK_02 " ) <  500 )) ;
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_TempleTask_02_Info()
{
	if((BookBonus_115 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_115 = TRUE ;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};
	};

	RankPoints = RankPoints + 1;
	B_Say(hero,hero,"$HOWINTEREST");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_Print(PRINT_TEMPLETASK_02);
	B_LogEntry(TOPIC_AdanosCrone, " The following is written here - '...THE POWERFUL CREATION WILL BE GRANTED TO THE LORD...'. Very interesting, but absolutely incomprehensible! What kind of powerful creature are we talking about, and to whom should I present it? Riddles, riddles, riddles. .. " );
	TaskHram_02 = TRUE;
	AI_Wait(hero,5);
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_ADANOSSCIP_TempleTask_03(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_TempleTask_03_Condition;
	information = PC_ADANOSSCIP_TempleTask_03_Info;
	permanent = TRUE;
	description = " Study ancient inscriptions... " ;
};

FUNC INT PC_ADANOSSCIP_TempleTask_03_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_ADANOSSCIP ) && ( TaskHram_03 ==  FALSE ) && ( Npc_GetDistToWP ( hero , " AV_TEMPLETASK_03 " ) <  500 )) ;
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_TempleTask_03_Info()
{
	if((BookBonus_116 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_116 = TRUE ;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};
	};

	RankPoints = RankPoints + 1;
	B_Say(hero,hero,"$HOWINTEREST");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_Print(PRINT_TEMPLETASK_03);
	TaskHram_03 = TRUE;
	B_LogEntry(TOPIC_AdanosCrone, " It says the following - '...THE BEING BORN BY THE MAGIC OF MY BROTHER WILL BE DESTROYED AT THE HOUR THAT IT IS WEAK AND WITHOUT THE SUPPORT OF ITS LORD...'. Apparently, it is necessary to kill someone! who was most likely spawned either by Innos or Beliar. We'll have to look here for something similar, not the creation of the gods. And apparently, it will be possible to kill him only at a certain time! " );
	AI_Wait(hero,5);
	B_ENDPRODUCTIONDIALOG();
	Wld_InsertNpc( FIREGOLEM_UNIQ , " MAGOLEMUS " );

	if(Wld_IsTime(4,0,22,0) == TRUE)
	{
		Wld_SendTrigger( " EVT_MAGOLEMUS_AOE " );
		AOE_IsDown = FALSE;
		AOE_IsUp = TRUE;
	}
	else
	{
		AOE_IsDown = TRUE;
		AOE_IsUp = FALSE ;
	};
};

INSTANCE PC_ADANOSSCIP_TempleTask_04(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_TempleTask_04_Condition;
	information = PC_ADANOSSCIP_TempleTask_04_Info;
	permanent = TRUE;
	description = " Study ancient inscriptions... " ;
};

FUNC INT PC_ADANOSSCIP_TempleTask_04_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_ADANOSSCIP ) && ( TaskHram_04 ==  FALSE ) && ( Npc_GetDistToWP ( hero , " AV_TEMPLETASK_04 " ) <  500 )) ;
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_TempleTask_04_Info()
{
	if((BookBonus_117 == FALSE) && ((self.guild == GIL_KDF) || (self.guild == GIL_KDW) || (self.guild == GIL_KDM) || (self.guild == GIL_GUR) || (self.guild == GIL_NDM) || (self.guild == GIL_NDW) || (self.guild == GIL_NOV)))
	{
		ATR_INTELLECT += 1;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_Print( " Intelligence + 1 " );
		BookBonus_117 = TRUE ;

		if(RhetorikSkillValue[1] < 100)
		{
			RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
			AI_Print( " Rhetoric + 1 " );
		};
	};

	RankPoints = RankPoints + 1;
	B_Say(hero,hero,"$HOWINTEREST");
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_Print(PRINT_TEMPLETASK_04);
	B_LogEntry(TOPIC_AdanosCrone, " The following is written here - '...THE ANCIENT ALTARS WILL RETURN TO THEIR OLD GREAT...'. I think I've already seen something like altars here. But it's not clear what to do with them! Maybe the Water Mages will tell me the answer to this question. " );
	TaskHram_04 = TRUE;
	AI_Wait(hero,5);
	B_ENDPRODUCTIONDIALOG();
};

var int ANCIENTALTAR01IsAwake;
var int ANCIENTALTAR02IsAwake;
var int ANCIENTALTAR03IsAwake;
var int ANCIENTALTAR04IsAwake;
var int ANCIENTALTAR05IsAwake;


INSTANCE PC_ADANOSSCIP_ANCIENTALTAR_01(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_ANCIENTALTAR_01_Condition;
	information = PC_ADANOSSCIP_ANCIENTALTAR_01_Info;
	permanent = TRUE;
	description = " Insert magic unit... " ;
};

FUNC INT PC_ADANOSSCIP_ANCIENTALTAR_01_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_ADANOSSCIP ) && (TaskHram_04 ==  TRUE ) && (ANCIENTALTAR01IsAwake ==  FALSE ) && (Npc_HasItems(hero,ItMi_MagicCrystal) >=  1 ) && (Npc_GetDistToWP(hero, " AV_010 " )) < ANCIENTALTAR_5  ;
	{	
		return TRUE;
	};

	return  FALSE ;
};

FUNC VOID PC_ADANOSSCIP_ANCIENTALTAR_01_Info()
{
	B_GivePlayerXP(500);
	Snd_Play("MFX_TELEKINESIS_STARTINVEST");
	Npc_RemoveInvItems(hero,ItMi_MagicCrystal,1);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	Wld_SendTrigger("EVT_AWAKETEMPLE_01");
	ANCIENTALTAR01IsAwake = TRUE;
	AI_Wait(hero,2);


	if((ANCIENTALTARSIsAwake == FALSE) && (ANCIENTALTAR01IsAwake == TRUE) && (ANCIENTALTAR02IsAwake == TRUE) && (ANCIENTALTAR03IsAwake == TRUE) && (ANCIENTALTAR04IsAwake == TRUE) && (ANCIENTALTAR05IsAwake == TRUE))
	{
		ANCIENTALTARSIsAwake = TRUE;
		AI_Print(PRINT_TEMPLETASK_04_DONE);
		B_LogEntry(TOPIC_AdanosCrone, " All the altars of the ancients are filled with magic again. Is this what the ancient scriptures meant?! " );
	};

	B_ENDPRODUCTIONDIALOG();
};


INSTANCE PC_ADANOSSCIP_ANCIENTALTAR_02(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_ANCIENTALTAR_02_Condition;
	information = PC_ADANOSSCIP_ANCIENTALTAR_02_Info;
	permanent = TRUE;
	description = " Insert magic unit... " ;
};

FUNC INT PC_ADANOSSCIP_ANCIENTALTAR_02_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_ADANOSSCIP ) && (TaskHram_04 ==  TRUE ) && (ANCIENTALTAR02IsAwake ==  FALSE ) && (Npc_HasItems(hero,ItMi_MagicCrystal) >=  1 ) && (Npc_GetDistToWP(hero, " AV_020 " )) < ANCIENTALTAR_5  ;
	{	
		return TRUE;
	};

	return  FALSE ;
};

FUNC VOID PC_ADANOSSCIP_ANCIENTALTAR_02_Info()
{
	B_GivePlayerXP(500);
	Snd_Play("MFX_TELEKINESIS_STARTINVEST");
	Npc_RemoveInvItems(hero,ItMi_MagicCrystal,1);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	Wld_SendTrigger("EVT_AWAKETEMPLE_02");
	ANCIENTALTAR02IsAwake = TRUE;
	AI_Wait(hero,2);


	if((ANCIENTALTARSIsAwake == FALSE) && (ANCIENTALTAR01IsAwake == TRUE) && (ANCIENTALTAR02IsAwake == TRUE) && (ANCIENTALTAR03IsAwake == TRUE) && (ANCIENTALTAR04IsAwake == TRUE) && (ANCIENTALTAR05IsAwake == TRUE))
	{
		ANCIENTALTARSIsAwake = TRUE;
		AI_Print(PRINT_TEMPLETASK_04_DONE);
		B_LogEntry(TOPIC_AdanosCrone, " All the altars of the ancients are filled with magic again. Is this what the ancient scriptures meant?! " );
	};

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_ADANOSSCIP_ANCIENTALTAR_03(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_ANCIENTALTAR_03_Condition;
	information = PC_ADANOSSCIP_ANCIENTALTAR_03_Info;
	permanent = TRUE;
	description = " Insert magic unit... " ;
};

FUNC INT PC_ADANOSSCIP_ANCIENTALTAR_03_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_ADANOSSCIP ) && (TaskHram_04 ==  TRUE ) && (ANCIENTALTAR03IsAwake ==  FALSE ) && (Npc_HasItems(hero,ItMi_MagicCrystal) >=  1 ) && (Npc_GetDistToWP(hero, " AV_030 " ) ) < 5  .
	{	
		return TRUE;
	};

	return  FALSE ;
};

FUNC VOID PC_ADANOSSCIP_ANCIENTALTAR_03_Info()
{
	B_GivePlayerXP(500);
	Snd_Play("MFX_TELEKINESIS_STARTINVEST");
	Npc_RemoveInvItems(hero,ItMi_MagicCrystal,1);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	Wld_SendTrigger("EVT_AWAKETEMPLE_03");
	ANCIENTALTAR03IsAwake = TRUE;
	AI_Wait(hero,2);


	if((ANCIENTALTARSIsAwake == FALSE) && (ANCIENTALTAR01IsAwake == TRUE) && (ANCIENTALTAR02IsAwake == TRUE) && (ANCIENTALTAR03IsAwake == TRUE) && (ANCIENTALTAR04IsAwake == TRUE) && (ANCIENTALTAR05IsAwake == TRUE))
	{
		ANCIENTALTARSIsAwake = TRUE;
		AI_Print(PRINT_TEMPLETASK_04_DONE);
		B_LogEntry(TOPIC_AdanosCrone, " All the altars of the ancients are filled with magic again. Is this what the ancient scriptures meant?! " );
	};

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_ADANOSSCIP_ANCIENTALTAR_04(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_ANCIENTALTAR_04_Condition;
	information = PC_ADANOSSCIP_ANCIENTALTAR_04_Info;
	permanent = TRUE;
	description = " Insert magic unit... " ;
};

FUNC INT PC_ADANOSSCIP_ANCIENTALTAR_04_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_ADANOSSCIP ) && (TaskHram_04 ==  TRUE ) && (ANCIENTALTAR04IsAwake ==  FALSE ) && (Npc_HasItems(hero,ItMi_MagicCrystal) >=  1 ) && (Npc_GetDistToWP(hero, " AV_00 " )) < 5  .
	{	
		return TRUE;
	};

	return  FALSE ;
};

FUNC VOID PC_ADANOSSCIP_ANCIENTALTAR_04_Info()
{
	B_GivePlayerXP(500);
	Snd_Play("MFX_TELEKINESIS_STARTINVEST");
	Npc_RemoveInvItems(hero,ItMi_MagicCrystal,1);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	Wld_SendTrigger("EVT_AWAKETEMPLE_04");
	ANCIENTALTAR04IsAwake = TRUE;
	AI_Wait(hero,2);


	if((ANCIENTALTARSIsAwake == FALSE) && (ANCIENTALTAR01IsAwake == TRUE) && (ANCIENTALTAR02IsAwake == TRUE) && (ANCIENTALTAR03IsAwake == TRUE) && (ANCIENTALTAR04IsAwake == TRUE) && (ANCIENTALTAR05IsAwake == TRUE))
	{
		ANCIENTALTARSIsAwake = TRUE;
		AI_Print(PRINT_TEMPLETASK_04_DONE);
		B_LogEntry(TOPIC_AdanosCrone, " All the altars of the ancients are filled with magic again. Is this what the ancient scriptures meant?! " );
	};

	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_ADANOSSCIP_ANCIENTALTAR_05(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_ANCIENTALTAR_05_Condition;
	information = PC_ADANOSSCIP_ANCIENTALTAR_05_Info;
	permanent = TRUE;
	description = " Insert magic unit... " ;
};

FUNC INT PC_ADANOSSCIP_ANCIENTALTAR_05_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_ADANOSSCIP ) && (TaskHram_04 ==  TRUE ) && (ANCIENTALTAR05IsAwake ==  FALSE ) && (Npc_HasItems(hero,ItMi_MagicCrystal) >=  1 ) && (Npc_GetDistToWP(hero, " AV_05 " ) ) <  ANCIENTALTAR_5 ;
	{	
		return TRUE;
	};

	return  FALSE ;
};

FUNC VOID PC_ADANOSSCIP_ANCIENTALTAR_05_Info()
{
	B_GivePlayerXP(500);
	Snd_Play("MFX_TELEKINESIS_STARTINVEST");
	Npc_RemoveInvItems(hero,ItMi_MagicCrystal,1);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	Wld_SendTrigger("EVT_AWAKETEMPLE_05");
	ANCIENTALTAR05IsAwake = TRUE;
	AI_Wait(hero,2);


	if((ANCIENTALTARSIsAwake == FALSE) && (ANCIENTALTAR01IsAwake == TRUE) && (ANCIENTALTAR02IsAwake == TRUE) && (ANCIENTALTAR03IsAwake == TRUE) && (ANCIENTALTAR04IsAwake == TRUE) && (ANCIENTALTAR05IsAwake == TRUE))
	{
		ANCIENTALTARSIsAwake = TRUE;
		AI_Print(PRINT_TEMPLETASK_04_DONE);
		B_LogEntry(TOPIC_AdanosCrone, " All the altars of the ancients are filled with magic again. Is this what the ancient scriptures meant?! " );
	};

	B_ENDPRODUCTIONDIALOG();
};

var int Gong_Count;
var int MineKingArrive;

INSTANCE PC_ADANOSSCIP_GONG(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_GONG_Condition;
	information = PC_ADANOSSCIP_GONG_Info;
	permanent = TRUE;
	description = " Strike the gong... " ;
};

FUNC INT PC_ADANOSSCIP_GONG_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_ADANOSSCIP) && (Npc_GetDistToWP(hero,"AV_GONG") < 500))
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_GONG_Info()
{
	var C_Npc MineKing;

	if(Gong_Count == FALSE)
	{
		Snd_Play("INST_CONGA01");
		AI_Print(PRINT_GONG_01);
		Gong_Count = Gong_Count + 1;
	}
	else if(Gong_Count == TRUE)
	{
		Snd_Play("INST_CONGA01");
		AI_Print(PRINT_GONG_02);
		Gong_Count = Gong_Count + 1;
	}
	else
	{
		if (MineKingArrive ==  FALSE )
		{
			Snd_Play("INST_CONGA01");
			AI_Print(PRINT_GONG_03);
			Gong_Count = FALSE;
			MineKingArrive = TRUE ;
			B_ENDPRODUCTIONDIALOG();
		}
		else
		{
			Snd_Play("INST_CONGA01");
		};
	};
};

INSTANCE PC_ADANOSSCIP_TempleTask_Final(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_TempleTask_Final_Condition;
	information = PC_ADANOSSCIP_TempleTask_Final_Info;
	permanent = TRUE;
	description = " Study ancient inscriptions... " ;
};

FUNC INT PC_ADANOSSCIP_TempleTask_Final_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_ADANOSSCIP) && (LastAdanosTask == FALSE) && (Npc_GetDistToWP(hero,"PYRAMIDE124") < 500))
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_TempleTask_Final_Info()
{
	AI_Print(PRINT_TEMPLETASK_FINAL);
	LastAdanosTask = TRUE ;
	B_LogEntry(TOPIC_AdanosCrone, " The following is written here - '...THE GREAT TREE OF LIFE WILL BLOOM AGAIN...'. And how many more of these puzzles do I have?! I need to talk to Saturas, because here I will definitely not do without his advice. " ) ;
	AI_Wait(hero,5);
	B_Say(hero,hero,"$HOWINTEREST");
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_ADANOSSCIP_TempleTask_Tree(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_TempleTask_Tree_Condition;
	information = PC_ADANOSSCIP_TempleTask_Tree_Info;
	permanent = TRUE;
	description = " Use 'Root of Life'... " ;
};

FUNC INT PC_ADANOSSCIP_TempleTask_Tree_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_ADANOSSCIP ) && (TreeIsUp ==  FALSE ) && (Npc_HasItems(hero,ItPl_MagicRoot) >=  1 ) && (LastAdanosTask ==  TRUE ) && (Npc_GetDistToWP(hero, " AV_ADANOSTREE_RITUAL " )) < 5  ;
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_TempleTask_Tree_Info()
{
	if(Npc_IsDead(Troll_Black_AV) == TRUE)
	{
		B_GivePlayerXP(1000);
		Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Snd_Play("OPEN_PORTAL");
		Wld_SendTrigger("EVT_MAGICROOT");
		AI_Print(PRINT_TEMPLETASK_FINAL_DONE);
		B_LogEntry(TOPIC_AdanosCrone, " The great tree's leaves have blossomed again, and the grass around it has turned green. I feel like life is returning to this dead place again! " );
		TreeIsUp = TRUE;
		Npc_RemoveInvItems(hero,ItPl_MagicRoot,1);
		B_ENDPRODUCTIONDIALOG();
		Wld_SendTrigger("EVT_ADANOSTREE");
		Wld_SendTrigger("EVT_ADANOSTREE_NEW");
		Wld_SendTrigger("CAM_ADANOSTREE");
	}
	else
	{
		AI_Print(PRINT_TREEGUARDALIVE);
		B_ENDPRODUCTIONDIALOG();
	};
};

INSTANCE PC_ADANOSSCIP_TempleTask_Final_Done(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_TempleTask_Final_Done_Condition;
	information = PC_ADANOSSCIP_TempleTask_Final_Done_Info;
	permanent = TRUE;
	description = " Touch the base of the tablet... " ;
};

FUNC INT PC_ADANOSSCIP_TempleTask_Final_Done_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_ADANOSSCIP) && (LastAdanosTaskDone == FALSE) && (TreeIsUp == TRUE) && (LastAdanosTask == TRUE) && (Npc_GetDistToWP(hero,"PYRAMIDE124") < 500))
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_TempleTask_Final_Done_Info()
{
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	LastAdanosTaskDone = TRUE ;
	B_LogEntry(TOPIC_AdanosCrone, " There are two bright flashes behind me! What could it be? " );
	B_ENDPRODUCTIONDIALOG();
	Wld_SendTrigger("EVT_TELEPORT_UPHRAM_01");
	Wld_SendTrigger("EVT_TELEPORT_UPHRAM_02");
};

INSTANCE PC_ADANOSSCIP_TempleTask_Quest(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_TempleTask_Quest_Condition;
	information = PC_ADANOSSCIP_TempleTask_Quest_Info;
	permanent = TRUE;
	description = " Complete a cleansing ritual... " ;
};

FUNC INT PC_ADANOSSCIP_TempleTask_Quest_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_ADANOSSCIP) && (AdanosQuestPass == FALSE) && (Npc_GetDistToWP(hero,"AV_UPPYRAMIDE_QUEST") < 500))
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_TempleTask_Quest_Info()
{
	var int karma_innos;

	B_GivePlayerXP(500);
	B_LogEntry(TOPIC_AdanosCrone, " I passed the Adanos cleanse! I wonder what now? " );
	B_ENDPRODUCTIONDIALOG();
	Wld_SendTrigger("EVT_TELEPORT_UPHRAM_DOWN");
	Snd_Play("OPEN_PORTAL");
	AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_GEYSER_FOUNTAIN",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
	AI_Wait(hero,7);
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_PlayAni(hero,"T_HEASHOOT_2_STAND");
	AdanosQuestPass = TRUE;
	AI_Print(PRINT_CLEARKARMA_DONE);
	karma_innos = INNOSPRAYCOUNT - INNOSCRIMECOUNT;

	if(karma_innos < 0)
	{
		INNOSCRIMECOUNT = FALSE;
		INNOSPRAYCOUNT = FALSE;
	};
	if(BELIARPRAYCOUNT < 0)
	{
		BELIARPRAYCOUNT = FALSE;
	};
	if(hero.guild == GIL_KDW)
	{
		Wld_InsertItem(ITPO_PERM_MANA,"FP_ITEM_ADANOS_GIFT_01");
		Wld_InsertItem(ITPO_WATERFIRE,"FP_ITEM_ADANOS_GIFT_02");
		Wld_InsertItem(ItPo_Perm_Health,"FP_ITEM_ADANOS_GIFT_03");
	}
	else if(hero.guild == GIL_KDF)
	{
		Wld_InsertItem(ITPO_PERM_MANA,"FP_ITEM_ADANOS_GIFT_03");
	}
	else  if (hero.guild ==  GIL_GUR )
	{
		Wld_InsertItem(ITPO_PERM_MANA,"FP_ITEM_ADANOS_GIFT_01");
		Wld_InsertItem(ItPo_Perm_Health,"FP_ITEM_ADANOS_GIFT_02");
	}
	else  if (hero.guild ==  GIL_KDM )
	{
		Wld_InsertItem(ItPo_Perm_Health,"FP_ITEM_ADANOS_GIFT_03");
	}
	else
	{
		if(hero.HitChance[NPC_TALENT_2H] >= hero.HitChance[NPC_TALENT_1H])
		{
			Wld_InsertItem(ItWr_OneHStonePlate1_Addon,"FP_ITEM_ADANOS_GIFT_01");
		}
		else
		{
			Wld_InsertItem(ItWr_TwoHStonePlate1_Addon,"FP_ITEM_ADANOS_GIFT_02");
		};

		if(hero.HitChance[NPC_TALENT_BOW] >= hero.HitChance[NPC_TALENT_CROSSBOW])
		{
			Wld_InsertItem(ItWr_BowStonePlate1_Addon,"FP_ITEM_ADANOS_GIFT_01");
		}
		else
		{
			Wld_InsertItem(ItWr_CrsBowStonePlate1_Addon,"FP_ITEM_ADANOS_GIFT_02");
		};

		Wld_InsertItem(ItPo_Perm_Health,"FP_ITEM_ADANOS_GIFT_03");
	};
};

INSTANCE PC_ADANOSSCIP_TempleTask_Power(C_Info)
{
	npc = PC_Hero;
	nr = 557;
	condition = PC_ADANOSSCIP_TempleTask_Power_Condition;
	information = PC_ADANOSSCIP_TempleTask_Power_Info;
	permanent = TRUE;
	description = " Ask to grant strength and power " ;
};

FUNC INT PC_ADANOSSCIP_TempleTask_Power_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_ADANOSSCIP) && (NETBEKLEADME_STEP1 == TRUE) && (ADANOSGIVEPOWER == FALSE) && (Npc_GetDistToWP(hero,"AV_UPPYRAMIDE_QUEST") < 500))
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_TempleTask_Power_Info()
{
	b_giveplayerxpquiet(2000);
	Snd_Play("OPEN_PORTAL");
	Wld_PlayEffect("SPELLFX_GEYSER_FOUNTAIN",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_Print(PRINT_ADANOSGIVEPOWER);
	ADANOSGIVEPOWER = TRUE;
	B_LogEntry( TOPIC_GUARDIANS , " I received Adanos' support. " );
	AI_Wait(hero,3);

	if((INNOSGIVEPOWER == TRUE) && (BELIARGIVEPOWER == TRUE) && (ADANOSGIVEPOWER == TRUE))
	{
		NETBEKLEADME_STEP1DONE = TRUE;
		Log_AddEntry( TOPIC_GUARDIANS , " I have now enlisted the support of all three deities by becoming their Chosen One! " );
		CreateInvItems(hero,ItAr_GodArmor,1);
		AI_PlayAni(hero,"T_MAGRUN_2_HEASHOOT");
		Wld_PlayEffect("spellFX_BELIARSRAGE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("SFX_Circle",hero,hero,0,0,0,FALSE);
		AI_Wait(hero,3);
		AI_EquipArmor(hero,ItAr_GodArmor);
	};
};

INSTANCE PC_ADANOSSCIP_CurseAncient(C_Info)
{
	npc = PC_Hero;
	nr = 556;
	condition = PC_ADANOSSCIP_CurseAncient_Condition;
	information = PC_ADANOSSCIP_CurseAncient_Info;
	permanent = TRUE;
	description = " Pray for the Builders' curse to be lifted... " ;
};

FUNC INT PC_ADANOSSCIP_CurseAncient_Condition()
{
	if (( PLAYER_MOBSI_PRODUCTION  ==  MOBSI_ADANOSSCIP ) && ( AncientCurseRemove ==  FALSE ) && ( MY_AncientCourse == LOG_Running ) && ( Npc_GetDistToWP ( hero , " AV_UPPYRAMIDE_QUEST " ) <  500 )) ;
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_CurseAncient_Info()
{
	if(RavenIsDead == TRUE)
	{
		AI_Wait(hero,5);
		B_GivePlayerXP(2000);
		Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",hero,hero,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
		Snd_Play("OPEN_PORTAL");
		AI_Print(PRINT_CurseAncient_Remove);
		B_LogEntry(TOPIC_CurseAncient, " Adanos heard my prayers and lifted the curse of the Builders. Now I have to report this to Rademes! " );
		CurseAncientRemove = TRUE;
		B_ENDPRODUCTIONDIALOG();
	}
	else
	{
		AI_Wait(hero,5);
		AI_Print(PRINT_CurseAncient_Remain);
		B_ENDPRODUCTIONDIALOG();
	};
};

INSTANCE PC_ADANOSSCIP_RiordanBack(C_Info)
{
	npc = PC_Hero;
	nr = 556;
	condition = PC_ADANOSSCIP_RiordanBack_Condition;
	information = PC_ADANOSSCIP_RiordanBack_Info;
	permanent = TRUE;
	description = " Pray for the soul of Riordian... " ;
};

FUNC INT PC_ADANOSSCIP_RiordanBack_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_ADANOSSCIP) && (RiordianIsAlive == FALSE) && (RIORDANEVILDEAD == TRUE) && (Npc_GetDistToWP(hero,"AV_UPPYRAMIDE_QUEST") < 500))
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_RiordanBack_Info()
{
	AI_Wait(hero,5);
	B_GivePlayerXP(1000);
	Wld_PlayEffect("SPELLFX_THUNDERSTORM_RAIN",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_WHITE",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RingRitual",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	RiordianIsAlive = TRUE;
	AI_Print(PRINT_RiordianIsAlive);
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_ADANOSSCIP_TempleTears_Key(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_TempleTears_Key_Condition;
	information = PC_ADANOSSCIP_TempleTears_Key_Info;
	permanent = TRUE;
	description = " Touch the altar... " ;
};

FUNC INT PC_ADANOSSCIP_TempleTears_Key_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_ADANOSSCIP) && (TT_WayClear == FALSE) && ((Npc_GetDistToWP(hero,"TT_WAY_01") < 500) || (Npc_GetDistToWP(hero,"TT_WAY_02") < 500)))
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_TempleTears_Key_Info()
{
	TT_WayClear = TRUE;
	Wld_PlayEffect("SPELLFX_HEALSHRINE",hero,hero,0,0,0,FALSE);
	AI_Wait(hero,5);
	B_ENDPRODUCTIONDIALOG();
	Wld_SendTrigger("CAM_LASTSTANDDOOR");
	Wld_SendTrigger("EVT_LASTSTANDDOOR");
	Wld_SendTrigger( " TT_MAINGATE_PREROOM " );
};

INSTANCE PC_ADANOSSCIP_OrcAltar_01(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_OrcAltar_01_Condition;
	information = PC_ADANOSSCIP_OrcAltar_01_Info;
	permanent = TRUE;
	description = " Pray to the spirits of the ancestors... " ;
};

FUNC INT PC_ADANOSSCIP_OrcAltar_01_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_ADANOSSCIP) && (MIS_OrcHolyPlaces == LOG_Running) && (OrcHolyPlaces_01 == FALSE) && (Npc_GetDistToWP(hero,"OW_ORC_ALTAR_01") < 500))
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_OrcAltar_01_Info()
{
	B_GivePlayerXP(100);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	OrcHolyPlaces_01 = TRUE;
	AI_Wait(hero,5);
	AI_Print(PRINT_ORCRITUAL_DONE);
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_ADANOSSCIP_OrcAltar_02(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_OrcAltar_02_Condition;
	information = PC_ADANOSSCIP_OrcAltar_02_Info;
	permanent = TRUE;
	description = " Pray to the spirits of the ancestors... " ;
};

FUNC INT PC_ADANOSSCIP_OrcAltar_02_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_ADANOSSCIP) && (MIS_OrcHolyPlaces == LOG_Running) && (OrcHolyPlaces_02 == FALSE) && (Npc_GetDistToWP(hero,"OW_ORC_ALTAR_02") < 500))
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_OrcAltar_02_Info()
{
	B_GivePlayerXP(100);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	OrcHolyPlaces_02 = TRUE;
	AI_Wait(hero,5);
	AI_Print(PRINT_ORCRITUAL_DONE);
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_ADANOSSCIP_OrcAltar_03(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_OrcAltar_03_Condition;
	information = PC_ADANOSSCIP_OrcAltar_03_Info;
	permanent = TRUE;
	description = " Pray to the spirits of the ancestors... " ;
};

FUNC INT PC_ADANOSSCIP_OrcAltar_03_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_ADANOSSCIP) && (MIS_OrcHolyPlaces == LOG_Running) && (OrcHolyPlaces_03 == FALSE) && (Npc_GetDistToWP(hero,"OW_ORC_ALTAR_03") < 500))
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_OrcAltar_03_Info()
{
	B_GivePlayerXP(100);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	OrcHolyPlaces_03 = TRUE;
	AI_Wait(hero,5);
	AI_Print(PRINT_ORCRITUAL_DONE);
	B_ENDPRODUCTIONDIALOG();
};

INSTANCE PC_ADANOSSCIP_OrcAltar_04(C_Info)
{
	npc = PC_Hero;
	nr = 555;
	condition = PC_ADANOSSCIP_OrcAltar_04_Condition;
	information = PC_ADANOSSCIP_OrcAltar_04_Info;
	permanent = TRUE;
	description = " Pray to the spirits of the ancestors... " ;
};

FUNC INT PC_ADANOSSCIP_OrcAltar_04_Condition()
{
	if((PLAYER_MOBSI_PRODUCTION == MOBSI_ADANOSSCIP) && (MIS_OrcHolyPlaces == LOG_Running) && (OrcHolyPlaces_04 == FALSE) && (Npc_GetDistToWP(hero,"OW_ORC_ALTAR_04") < 500))
	{	
		return TRUE;
	};
};

FUNC VOID PC_ADANOSSCIP_OrcAltar_04_Info()
{
	B_GivePlayerXP(100);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	OrcHolyPlaces_04 = TRUE;
	AI_Wait(hero,5);
	AI_Print(PRINT_ORCRITUAL_DONE);
	B_ENDPRODUCTIONDIALOG();
};
