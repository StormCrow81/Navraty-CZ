


instance DIA_Peck_EXIT(C_Info)
{
	npc = MIL_324_Peck;
	nr = 999;
	condition = DIA_Peck_EXIT_Condition;
	information = DIA_Peck_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Peck_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Peck_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Peck_PICKPOCKET(C_Info)
{
	npc = MIL_324_Peck;
	nr = 998;
	condition = DIA_Peck_PICKPOCKET_Condition;
	information = DIA_Peck_PICKPOCKET_Info;
	permanent = TRUE;
	description = "(Попытаться украсть его ключ)";
};

func int DIA_Peck_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_05) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Peck_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Peck_PICKPOCKET);
	Info_AddChoice(DIA_Peck_PICKPOCKET,Dialog_Back,DIA_Peck_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Peck_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Peck_PICKPOCKET_DoIt);
};

func void DIA_Peck_PICKPOCKET_DoIt()
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
		B_GiveInvItems(self,other,ItKe_City_Tower_05,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Peck_PICKPOCKET);
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

func void DIA_Peck_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Peck_PICKPOCKET);
};


instance DIA_Peck_HEY(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_HEY_Condition;
	information = DIA_Peck_HEY_Info;
	permanent = TRUE;
	description = " Hey, what are you doing here? " ;
};


func int DIA_Peck_HEY_Condition()
{
	if((MIS_Andre_Peck != LOG_Running) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Peck_HEY_Info()
{
	AI_Output(other,self, " DIA_Peck_HEY_15_00 " );	// Hey, what are you doing here?
	AI_Output(self,other, " DIA_Peck_HEY_12_01 " );	// Look, I'm busy. Leave me alone.
	AI_StopProcessInfos(self);
};


instance DIA_Peck_FOUND_PECK(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_FOUND_PECK_Condition;
	information = DIA_Peck_FOUND_PECK_Info;
	permanent = FALSE;
	description = " Hey, it's time for you to head back. " ;
};


func int DIA_Peck_FOUND_PECK_Condition()
{
	if((MIS_Andre_Peck == LOG_Running) && (Npc_GetDistToWP(self,"NW_CITY_HABOUR_PUFF_PECK") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Peck_FOUND_PECK_Info()
{
	AI_Output(other,self, " DIA_Peck_FOUND_PECK_15_00 " );	// Hey, it's time for you to head back.
	AI_Output(self,other, " DIA_Peck_FOUND_PECK_12_01 " );	// What do you need? Can't you see I'm busy?
	AI_Output(other,self, " DIA_Peck_FOUND_PECK_15_02 " );	// I need a weapon, so get back to the barracks.
	AI_Output(self,other, " DIA_Peck_FOUND_PECK_12_03 " );	// Damn, your weapon can wait.
	AI_Output(other,self, " DIA_Peck_FOUND_PECK_15_04 " );	// Come on, Andre is already looking for you too.
	AI_Output(self,other, " DIA_Peck_FOUND_PECK_12_05 " );	// Hmmm...(unsettled) Damn, okay, I'm on my way! But when you report to Andre, don't tell him I was here.
	PeckOutBordel = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"STORAGE");
	B_StartOtherRoutine(VLK_491_Vanja,"ALONE");
};

instance DIA_Peck_WEAPON(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_WEAPON_Condition;
	information = DIA_Peck_WEAPON_Info;
	permanent = TRUE;
	description = " I came for a weapon. " ;
};

var int DIA_Peck_WEAPON_perm;

func int DIA_Peck_WEAPON_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Andre_FOUND_PECK) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (Kapitel < 3) && (DIA_Peck_WEAPON_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Peck_WEAPON_Info()
{
	AI_Output(other,self, " DIA_Peck_WEAPON_15_00 " );	// I've come for a weapon.

	if(MIS_Andre_Peck == LOG_Running)
	{
		AI_Output(self,other, " DIA_Peck_WEAPON_12_01 " );	// Go to Andre first and report to him.
	}
	else if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		if(PeckCatch == FALSE)
		{
			AI_Output(self,other, " DIA_Peck_WEAPON_12_02 " );	// Look who's here. Our new friend. And he needs a sword.
			AI_Output(self,other, " DIA_Peck_WEAPON_12_03 " );	// You didn't tell Andre I was in the Red Lantern. Looks like you're a normal guy. Here, hold your sword.
			AI_Output(self,other, " DIA_Peck_Add_12_00 " );	// This is the best I have.
			B_GiveInvItems(self,hero,ItMw_1h_Mil_Sword,1);
		}
		else
		{
			AI_Output(self,other, " DIA_Peck_WEAPON_12_04 " );	// I won't forget this for you. Who told Andre that I was in the Red Lantern, huh?
			AI_Output(self,other, " DIA_Peck_WEAPON_12_05 " );	// And now you want a sword from me. Okay, you'll get the sword. Here. Now go to hell!
			B_GiveInvItems(self,hero,ItMw_ShortSword1,1);
		};

		DIA_Peck_WEAPON_perm = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Peck_WEAPON_12_06 " );	// If you need a better weapon, go to the merchants in the market.
	};

	AI_StopProcessInfos(self);
};

func void B_Peck_LeckMich()
{
	AI_Output(self,other, " DIA_Peck_Add_12_07 " );	// Kiss my ass!
};

instance DIA_Peck_WEAPON2(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_WEAPON2_Condition;
	information = DIA_Peck_WEAPON2_Info;
	permanent = TRUE;
	description = " Don't you have a better weapon for me? " ;
};

var int DIA_Peck_WEAPON2_perm;

func int DIA_Peck_WEAPON2_Condition()
{
	if((other.guild == GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000) && (EnterOW_Kapitel2 == TRUE) && (DIA_Peck_WEAPON_perm == TRUE) && (DIA_Peck_WEAPON2_perm == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Peck_WEAPON2_Info()
{
	AI_Output(other,self, " DIA_Peck_Add_15_01 " );	// Don't you have a better weapon for me?

	if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Peck_Add_12_06 " );	// I haven't forgotten that you denounced me to Lord Andre.
		B_Peck_LeckMich();
	}
	else  if (chapter <  3 )
	{
		AI_Output(self,other,"DIA_Peck_Add_12_02");	//Пока нет.
	}
	else
	{
		AI_Output(self,other, " DIA_Peck_Add_12_03 " );	// Good thing you asked. We got some very good blades from Onar's mercenaries.
		AI_Output(self,other, " DIA_Peck_Add_12_04 " );	// They won't need them anymore... (dirty laughter)
		AI_Output(self,other, " DIA_Peck_Add_12_05 " );	// Here, take this.
		B_GiveInvItems(self,other,ItMw_Rubinklinge,1);
		DIA_Peck_WEAPON2_perm = TRUE;
	};
};

instance DIA_Peck_PERM(C_Info)
{
	npc = MIL_324_Peck;
	nr = 998;
	condition = DIA_Peck_PERM_Condition;
	information = DIA_Peck_PERM_Info;
	permanent = TRUE;
	description = " Are you all right? " ;
};

func int DIA_Peck_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Peck_WEAPON) || ((other.guild != GIL_MIL) && (Npc_GetDistToWP(self,"NW_CITY_ARMORY_PECK") <= 1000)))
	{
		return TRUE;
	};
};

func void DIA_Peck_PERM_Info()
{
	AI_Output(other,self, " DIA_Peck_PERM_15_00 " );	// Are you all right?
	if(MIS_Andre_Peck == LOG_SUCCESS)
	{
		B_Peck_LeckMich();
	}
	else  if (chapter !=  3 )
	{
		AI_Output(self,other, " DIA_Peck_PERM_12_01 " );	// Yes, what about you?
	}
	else  if (chapter ==  3 )
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other, " DIA_Peck_PERM_12_02 " );	// Not really. I care about these mercenaries. I mean, they might try to get their boyfriend out of prison by force.
				AI_Output(self,other, " DIA_Peck_PERM_12_03 " );	// I don't really want to go up against a gang of experienced fighters.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other, " DIA_Peck_PERM_12_04 " );	// Of course. We are ready for anything. Magicians can be sure that this prisoner will not be able to escape.
			}
			else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
			{
				AI_Output(self,other, " DIA_Peck_PERM_12_05 " );	// I know what you're up to, but you won't succeed, you won't escape with a prisoner.
			}
			else
			{
				AI_Output(self,other, " DIA_Peck_PERM_12_05A " );	// Quite. If not for this murder of the paladin Lothar, it would be even better.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Peck_PERM_12_06 " );	// I'm very glad this murder case is now closed.
			AI_Output(other,self,"DIA_Peck_PERM_15_07");	//Почему?
			AI_Output(self,other, " DIA_Peck_PERM_12_08 " );	// Mercenaries just wouldn't back down. They wouldn't sit back and watch while we hang one of them.
			AI_Output(self,other, " DIA_Peck_PERM_12_09 " );	// They could even attack the city. I don't even want to think about what it could lead to.
		};
	};
};

instance DIA_Peck_FuckOff(C_Info)
{
	npc = MIL_324_Peck;
	nr = 2;
	condition = DIA_Peck_FuckOff_Condition;
	information = DIA_Peck_FuckOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Peck_FuckOff_Condition()
{
	if((MIS_WulfgarBandits == LOG_Success) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Peck_FuckOff_Info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};
