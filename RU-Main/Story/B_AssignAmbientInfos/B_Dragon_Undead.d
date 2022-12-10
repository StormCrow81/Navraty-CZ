
instance DIA_Dragon_Undead_Hello(C_Info)
{
	npc = Dragon_Undead;
	nr = 5;
	condition = DIA_Dragon_Undead_Hello_Condition;
	information = DIA_Dragon_Undead_Hello_Info;
	important = TRUE;
};

func int DIA_Dragon_Undead_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Undead_Hello_Info()
{
	AI_Output(self,other, " DIA_Dragon_Undead_Hello_20_00 " );	// You finally managed to find me! I've been waiting for your arrival for a long time.
	AI_Output(other,self, " DIA_Dragon_Undead_Hello_15_01 " );	// Are you saying you planned this?
	AI_Output(self,other, " DIA_Dragon_Undead_Hello_20_02 " );	// What do you know of my intentions?
	AI_Output(self,other, " DIA_Dragon_Undead_Hello_20_03 " );	// Haven't I sent my servants to you to put you on my trail?
	AI_Output(self,other, " DIA_Dragon_Undead_Hello_20_04 " );	// Didn't I leave signs of my presence so obvious that you couldn't help noticing them?

	if((hero.guild == GIL_DJG) && (DragonEggCounter >= 7))
	{
		AI_Output(self,other, " DIA_Dragon_Undead_Hello_20_05 " );	// Didn't the dragon eggs your armor is made of help you get to me?
	};
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Dragon_Undead_Hello_20_06 " );	// Were converted paladins not enough reason for you to seek the power to control them?
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Dragon_Undead_Hello_20_07 " );	// Were the Possessed of your tribe not enough reason for you to seek the power to control them?
	};

	AI_Output(self,other, " DIA_Dragon_Undead_Hello_20_08 " );	// Whether you like it or not, you cannot lie to yourself.
	B_LogEntry(TOPIC_HallenVonIrdorath, " My main enemy is the undead dragon, who is the chosen one of Beliar himself! I must kill him to leave this cursed island. " );

	if(ItarIsDead == FALSE)
	{
		Wld_InsertNpc(ItarMinion,"DRT_BOSS_01");
		B_KillNpc(Draconian_Elite_Boss);
	};
	if(YelaIsDead == FALSE)
	{
		Wld_InsertNpc(YelaMinion,"DRT_BOSS_02");
		B_KillNpc(UndeadWolf);
	};
	if((ItarIsDead == FALSE) || (YelaIsDead == FALSE))
	{
		Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);

		if(ItarIsDead == FALSE)
		{
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",ItarMinion,ItarMinion,0,0,0,FALSE);
		};
		if(YelaIsDead == FALSE)
		{
			Wld_PlayEffect("spellFX_LIGHTSTAR_RED",YelaMinion,YelaMinion,0,0,0,FALSE);
		};
	};

	Info_ClearChoices(DIA_Dragon_Undead_Hello);
	Info_AddChoice(DIA_Dragon_Undead_Hello,Dialog_Ende,DIA_Dragon_Undead_Hello_attack);
	Info_AddChoice(DIA_Dragon_Undead_Hello, " By what order do you lead your subordinates to war against humans? " ,DIA_Dragon_Undead_Hello_Auftraggeber);
	Info_AddChoice(DIA_Dragon_Undead_Hello, " Why are you here? " ,DIA_Dragon_Undead_Hello_warum);
	Info_AddChoice(DIA_Dragon_Undead_Hello, " Who are you? " ,DIA_Dragon_Undead_Hello_wer);
};

func void DIA_Dragon_Undead_Hello_wer()
{
	AI_Output(other,self,"DIA_Dragon_Undead_Hello_wer_15_00");	//Who are you?
	AI_Output(self,other, " DIA_Dragon_Undead_Hello_wer_20_01 " );	// Are you tired of asking this question yet? Look inside yourself, fool. You will understand who I am.
	AI_Output(self,other, " DIA_Dragon_Undead_Hello_wer_20_03 " );	// I was given divine power by my creator. Just like you own the power given to you by your god.
	AI_Output(self,other, " DIA_Dragon_Undead_Hello_wer_20_04 " );	// My destiny is the destruction of this world.

	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Dragon_Undead_Hello_wer_20_05 " );	// Just as your destiny is determined by the integrity and virtue of a paladin.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Dragon_Undead_Hello_wer_20_06 " );	// Just as your hand brings death to creatures so much better than you, dragon hunter.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Dragon_Undead_Hello_wer_20_07 " );	// Just as your destiny is to preach faith in Innos, Mage of Fire.
	};

	AI_Output(self,other, " DIA_Dragon_Undead_Hello_wer_20_08 " );	// Can't you feel the connection that connects us? Yes. You know who I am.
	AI_Output(other,self, " DIA_Dragon_Undead_Hello_wer_15_09 " );	// No. This cannot be. Xardas always said...
	AI_Output(self,other, " DIA_Dragon_Undead_Hello_wer_20_10 " );	// Xardas is weak, and poses no threat to me. You alone are worthy to resist me.
	AI_Output(self,other, " DIA_Dragon_Undead_Hello_wer_20_11 " );	// It is meant to be. It is time to accept your fate.
};

func void DIA_Dragon_Undead_Hello_why()
{
	AI_Output(other,self, " DIA_Dragon_Undead_Hello_warum_15_00 " );	// Why are you here?
	AI_Output(self,other, " DIA_Dragon_Undead_Hello_warum_20_01 " );	// The divinity bestowed on me inspires me to plunge this world into a sea of blood.
	AI_Output(self,other, " DIA_Dragon_Undead_Hello_warum_20_02 " );	// Only when the last stronghold of righteousness falls can I finally find peace.
};

func void DIA_Dragon_Undead_Hello_Client()
{
	AI_Output(other,self, " DIA_Dragon_Undead_Hello_Auftraggeber_15_00 " );	// By whose command are you leading your henchmen to war against humanity?
	AI_Output(self,other, " DIA_Dragon_Undead_Hello_Auftraggeber_20_01 " );	// My master is the Lord of the Night. You know him. You can hear him calling you from the dark.
	AI_Output(self,other, " DIA_Dragon_Undead_Hello_Auftraggeber_20_03 " );	// My armies will rise from the ground with his name on their lips and cover this world with a cloak of darkness.
};

func void DIA_Dragon_Undead_Hello_attack()
{
	AI_PlayAni(self,"T_WARN");
	AI_Output(self,other, " DIA_Dragon_Undead_Hello_attack_20_02 " );	// Your bones will help me release the winds of death into this world!

	if(ItarIsDead == FALSE)
	{
		B_KillNpc_Fire(ItarMinion);
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] + 150;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20000;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};
	if(YelaIsDead == FALSE)
	{
		B_KillNpc_Fire(YelaMinion);
		self.attribute[ATR_STRENGTH] = self.attribute[ATR_STRENGTH] + 150;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 20000;
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS_MAX];
	};	
	if((ItarIsDead == FALSE) || (YelaIsDead == FALSE))
	{
		Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
		Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
		Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
		AI_Output(self,other, " DIA_Dragon_Undead_Hello_attack_20_01 " );	// You're not ready to defeat me yet! A moment separates me from achieving my goal.
	};

	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
};
