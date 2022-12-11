
instance DIA_AmbientDementorFriendly_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_AmbientDementorFriendly_EXIT_Condition;
	information = DIA_AmbientDementorFriendly_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_AmbientDementorFriendly_EXIT_Condition()
{
	return TRUE;
};

func void DIA_AmbientDementorFriendly_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_AmbientDementorFriendly(C_Info)
{
	nr = 1;
	condition = DIA_AmbientDementorFriendly_Condition;
	information = DIA_AmbientDementorFriendly_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_AmbientDementorFriendly_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_IsInState(self,ZS_Talk) == TRUE) && (hero.guild <= GIL_SEPERATOR_HUM))
	{
		return TRUE;
	};
};

func void DIA_AmbientDementorFriendly_Info()
{
	var int randyspeech;

	randyspeech = Hlp_Random(2);

	if(randyspeech == FALSE)
	{
		Snd_Play("DEM_RITUAL_01");
	}
	else
	{
		Snd_Play("DEM_RITUAL_02");
	};

	AI_StopProcessInfos(self);
};

instance DIA_AmbientDementor_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_AmbientDementor_EXIT_Condition;
	information = DIA_AmbientDementor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_AmbientDementor_EXIT_Condition()
{
	if(NazgulsAwayMe == FALSE)
	{
		return TRUE;
	};
};

func void DIA_AmbientDementor_EXIT_Info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	B_SCIsObsessed(self);
	Npc_SetRefuseTalk(self,5);
	self.aivar[AIV_EnemyOverride] = FALSE;
	Snd_Play("MFX_FEAR_CAST");

	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino2)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino3)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4)))
	{
		DMT_Vino1.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino2.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino3.aivar[AIV_EnemyOverride] = FALSE;
		DMT_Vino4.aivar[AIV_EnemyOverride] = FALSE;
	};
};

instance DIA_AmbientDementor(C_Info)
{
	nr = 1;
	condition = DIA_AmbientDementor_Condition;
	information = DIA_AmbientDementor_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_AmbientDementor_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (hero.guild <= GIL_SEPERATOR_HUM) && (NazgulsAwayMe == FALSE))
	{
		return TRUE;
	};
};

func void DIA_AmbientDementor_Info()
{
	be int randy;
	was int randyspeech;

	randyspeech = Hlp_Random( 2 );

	if(randyspeech == FALSE)
	{
		Snd_Play("DEM_RITUAL_01");
	}
	else
	{
		Snd_Play("DEM_RITUAL_02");
	};

	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	randy = Hlp_Random( 4 );

	if (Npc_HasItems(hero,ItAm_Prot_BlackEye_Mis) ==  FALSE )
	{
		AI_PlayAni(hero,"T_INSANE");
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] / 2;
		Snd_Play3d(hero,"HERODEAD");
	};
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino2)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino3)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DMT_Vino4)))
	{
		AI_Output(self,other, " DIA_VinoDementor_19_00 " );	// Have you come to disrupt our ritual? His soul belongs to us. You can't save him, mage.
	}
	else if(CurrentLevel == DRAGONISLAND_ZEN)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(DragonIsle_Keymaster))
		{
			AI_Output(self,other, " DIA_AmbientDementor_19_01 " );	// (laughs) Have you come to challenge me and my work? You are doomed to fail.
			AI_Output(self,other, " DIA_AmbientDementor_19_02 " );	// No one has yet managed to pass my crypt. Turn back. You will never reach the sacred Halls of Irdorath.
		}
		else
		{
			if(randy == 0)
			{
				AI_Output(self,other, " DIA_AmbientDementor_19_03 " );	// You've already gone too far, you despicable worm! You will never reach the inner sanctuary.
			};
			if(randy == 1)
			{
				AI_Output(self,other, " DIA_AmbientDementor_19_04 " );	// Stay where you are! Not one step further.
			};
			if(randy == 2)
			{
				AI_Output(self,other, " DIA_AmbientDementor_19_05 " );	// Yes, you managed to get here, but you can't get past me!
			};
			if(randy == 3)
			{
				AI_Output(self,other, " DIA_AmbientDementor_19_06 " );	// You've come to challenge the Master, but first you'll have to get past me!
			};
		};
	}
	else if(hero.guild == GIL_KDF)
	{
		if(randy == 0)
		{
			AI_Output(self,other, " DIA_AmbientDementor_19_07 " );	// Poor pathetic mageling, you will never match the Master's strength!
		};
		if(randy == 1)
		{
			AI_Output(self,other, " DIA_AmbientDementor_19_08 " );	// You chose the path of magic to oppose us - a smart move! But even that won't help you.
		};
		if(randy == 2)
		{
			AI_Output(self,other, " DIA_AmbientDementor_19_09 " );	// Even a wizard of your power cannot stop us!
		};
		if(randy == 3)
		{
			AI_Output(self,other, " DIA_AmbientDementor_19_10 " );	// My Master will crush you! Your pathetic magics won't save you.
		};
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other, " DIA_AmbientDementor_19_11 " );	// Surrender to our mercy while you still can! You shall not leave here.
		};
		if(randy == 1)
		{
			AI_Output(self,other, " DIA_AmbientDementor_19_12 " );	// Now you will know the power of the Master. The only escape is death!
		};
		if(randy == 2)
		{
			AI_Output(self,other, " DIA_AmbientDementor_19_13 " );	// The Master wants your head! Nothing will save you now.
		};
		if(randy == 3)
		{
			AI_Output(self,other, " DIA_AmbientDementor_19_14 " );	// We have trapped you, and now we will destroy you!
		};
	};

	if(SBMODE == TRUE)
	{
		Wld_SpawnNpcRange(hero,Skeleton_Dark,2,500);
	}
	else
	{
		Wld_SpawnNpcRange(hero,Skeleton_Dark,1,500);
	};

	self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
};

func void B_AssignDementorTalk(var C_Npc slf)
{
	if((slf.guild == GIL_DMT) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Imarah)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ahiron)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Skeleton_Stefan)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ilesil_Evil)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Skeleton_Lord_LV)) && (slf.npcType == NPCTYPE_AMBIENT))
	{
		DIA_AmbientDementor_EXIT.npc = Hlp_GetInstanceID(slf);
		DIA_AmbientDementor.npc = Hlp_GetInstanceID(slf);
	};
};

func void B_AssignDementorTalkFriendly(var C_Npc slf)
{
	if((slf.guild == GIL_DMT) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Imarah)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ahiron)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Skeleton_Stefan)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ilesil_Evil)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Skeleton_Lord_LV)) && (slf.npcType == NPCTYPE_BL_AMBIENT))
	{
		DIA_AmbientDementorFriendly_EXIT.npc = Hlp_GetInstanceID(slf);
		DIA_AmbientDementorFriendly.npc = Hlp_GetInstanceID(slf);
	};
};

instance DIA_AmbientDead_EXIT(C_Info)
{
	nr = 999;
	condition = DIA_AmbientDead_EXIT_Condition;
	information = DIA_AmbientDead_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_AmbientDead_EXIT_Condition()
{
	return TRUE;
};

func void DIA_AmbientDead_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_AmbientDead(C_Info)
{
	nr = 1;
	condition = DIA_AmbientDead_Condition;
	information = DIA_AmbientDead_Info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_AmbientDead_Condition()
{
	if((Npc_RefuseTalk(self) == FALSE) && (Npc_IsInState(self,ZS_Talk) == TRUE) && (hero.guild <= GIL_SEPERATOR_HUM))
	{
		return TRUE;
	};
};

func void DIA_AmbientDead_Info()
{
	was int randyspeech;

	randyspeech = Hlp_Random( 2 );

	if(randyspeech == FALSE)
	{
		Snd_Play("DEM_RITUAL_01");
	}
	else
	{
		Snd_Play("DEM_RITUAL_02");
	};

	AI_StopProcessInfos(self);
};

func void B_AssignDeadTalk(var C_Npc slf)
{
	if((slf.guild == GIL_DMT) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Imarah)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ahiron)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Ilesil_Evil)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Skeleton_Stefan)) && (Hlp_GetInstanceID(slf) != Hlp_GetInstanceID(Skeleton_Lord_LV)) && (slf.npcType == NPCTYPE_AMBIENT))
	{
		DIA_AmbientDead_EXIT.npc = Hlp_GetInstanceID(slf);
		DIA_AmbientDead.npc = Hlp_GetInstanceID(slf);
	};
};
