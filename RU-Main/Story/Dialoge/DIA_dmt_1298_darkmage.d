

instance DIA_DMT1298_HELLO(C_Info)
{
	npc = dmt_1298_darkmage;
	nr = 5;
	condition = dia_dmt1298_hello_condition;
	information = dia_dmt1298_hello_info;
	important = TRUE;
};

func int dia_dmt1298_hello_condition()
{
	return TRUE;
};

func void dia_dmt1298_hello_info()
{
	AI_UnequipWeapons(self);
	AI_Output(self,other, " DIA_DMT1298_Hello_01_00 " );	// Well, well. Who is it here?
	AI_Output(self,other, " DIA_DMT1298_Hello_01_02 " );	// Just a pitiful offspring of Innos. My Master watches over you every day.
	AI_Output(other,self, " DIA_DMT1298_Hello_01_03 " );	// What do you want from me?
	AI_Output(self,other, " DIA_DMT1298_Hello_01_04 " );	// Wretched worm! It's like you don't know who you're dealing with.
	MeetDarkTempleMage = TRUE;
	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello, " Another question. " ,dia_dmt1298_hello_one);
};

func void dia_dmt1298_hello_battle()
{
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");

	AI_Output(other,self, " DIA_DMT1298_Hello_Battle_01_90 " );	// Well, bite me!
	AI_Output(self,other, " DIA_DMT1298_Hello_Battle_01_00 " );	// (angrily) I'll take care of you, you little bastard!
	AI_Output(self,other, " DIA_DMT1298_Hello_Battle_01_01 " );	// And after your death, I will resurrect your body and add it to my army of evil.

	if((other.guild == GIL_KDF) || (other.guild == GIL_KDW) || (other.guild == GIL_KDM) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_DMT1298_Hello_Battle_01_02 " );	// You'll make a great Skeleton Mage!
	}
	else
	{
		AI_Output(self,other, " DIA_DMT1298_Hello_Battle_01_03 " );	// You'll make a great skeleton warrior!
	};

	if(SBMODE == 1)
	{
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_01,"FP_ROAM_KALOMGUARD_03");
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_02,"FP_ROAM_KALOMGUARD_04");
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_03,"FP_ROAM_NOVIZE_48");
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_04,"FP_ROAM_MEDITATE_10");
		Wld_InsertNpc(Demon_OT_BOSS_GUARD_05,"FP_ROAM_NOVIZE_52");
	}
	else if(SBMODE == 2)
	{
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_KALOMGUARD_03");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_KALOMGUARD_04");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NOVIZE_48");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_MEDITATE_10");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NOVIZE_52");
	}
	else 	if(SBMODE == 4)
	{
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_KALOMGUARD_03");
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_KALOMGUARD_04");
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_NOVIZE_48");
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_MEDITATE_10");
		Wld_InsertNpc(LESSER_SKELETON_DARK,"FP_ROAM_NOVIZE_52");
	};

	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello, " ...(time to kill him!) " ,dia_dmt1298_hello_End);
};

func void dia_dmt1298_hello_End()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
};

func void dia_dmt1298_hello_one()
{
	AI_Output(other,self, " DIA_DMT1298_Hello_One_01_00 " );	// Wait, I have another question.
	AI_Output(other,self, " DIA_DMT1298_Hello_One_01_01 " );	// Tell me, did you happen to find one sword here - such a big one with a blue shimmering stone at the base of the blade?
	AI_Output(self,other, " DIA_DMT1298_Hello_One_01_03 " );	// (thoughtfully) If you ask this question, it means that it was from your hand that the Sleeper fell.
	AI_Output(self,other, " DIA_DMT1298_Hello_One_01_04 " );	// My master warned me about our possible meeting.
	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello, " I'm afraid this meeting will end as badly for you as it did for the Sleeper... " ,dia_dmt1298_hello_video);
};

func void dia_dmt1298_hello_video()
{
	PlayVideo("RET2_Sleeper.bik");
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other, " DIA_DMT1298_Hello_Video_01_00 " );	// You mean this weapon... Urisel is an excellent blade, a weapon worthy of Beliar himself! This sword is one of the reasons my master ordered me to appear here.
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other, " DIA_DMT1298_Hello_Video_01_01 " );	// And, of course, the owner also told me to keep this sword - as I would keep his sacred peace!
	AI_Output(self,other, " DIA_DMT1298_Hello_Video_01_02 " );	// And be sure - he's in safe hands, and a pathetic dog like you will never get him... (laughs)
	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello, " What really made you show up here? " ,dia_dmt1298_hello_sleeper);
};

func void dia_dmt1298_hello_sleeper()
{
	AI_Output(other,self, " DIA_DMT1298_Hello_sleeper_01_00 " );	// What actually made you show up here?
	AI_Output(self,other, " DIA_DMT1298_Hello_sleeper_01_01 " );	// You don't even know, do you? (mockingly) Stupid!
	AI_Output(self,other, " DIA_DMT1298_Hello_sleeper_01_02 " );	// After all, it was you then who prevented one of the most powerful demons of the universe from appearing in this world!
	AI_Output(self,other, " DIA_DMT1298_Hello_sleeper_01_03 " );	// But thanks to my efforts, he will soon return to the vaults of this Temple.
	AI_Output(self,other, " DIA_DMT1298_Hello_sleeper_01_04 " );	// And then you'll still wish you were even born!
	AI_Output(other,self, " DIA_DMT1298_Hello_sleeper_01_05 " );	// Have you summoned the Sleeper again?!
	AI_Output(self,other, " DIA_DMT1298_Hello_sleeper_01_06 " );	// You finally got it, you idiot... (mockingly)
	AI_Output(self,other, " DIA_DMT1298_Hello_sleeper_01_07 " );	// I've already performed the summoning ritual, and now all I have to do is wait for him to appear!
	AI_Output(self,other, " DIA_DMT1298_Hello_sleeper_01_08 " );	// In the meantime, I'll deal with you, worm! So that you no longer get under the feet of my master.
	MIS_SleeperBack = LOG_Running;
	Log_CreateTopic(TOPIC_SleeperBack,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SleeperBack,LOG_Running);
	B_LogEntry(TOPIC_SleeperBack, " That damned necromancer said he's summoned the Sleeper back to this world! Is that possible? Let's wait and see... " );
	Info_ClearChoices(dia_dmt1298_hello);
	Info_AddChoice(dia_dmt1298_hello, " Come on, bite me! " ,dia_dmt1298_hello_battle);
};

// ----------------------------------------- -----------------

instance DMT_12987_Ituseld_EXIT(C_Info)
{
	npc = DMT_12987_Ituseld;
	nr = 999;
	condition = DMT_12987_Ituseld_EXIT_Condition;
	information = DMT_12987_Ituseld_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DMT_12987_Ituseld_EXIT_Condition()
{
	return TRUE;
};

func void DMT_12987_Ituseld_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DMT_12987_Ituseld_HELLO(C_Info)
{
	npc = DMT_12987_Ituseld;
	nr = 5;
	condition = DMT_12987_Ituseld_HELLO_condition;
	information = DMT_12987_Ituseld_HELLO_info;
	important = TRUE;
};

func int DMT_12987_Ituseld_HELLO_condition()
{
	return TRUE;
};

func void DMT_12987_Ituseld_HELLO_info()
{
	AI_Output(self,other, " DMT_12987_Ituseld_HELLO_01_00 " );	// Who are you?! And what are you doing in my tower?
	AI_Output(other,self, " DMT_12987_Ituseld_HELLO_01_01 " );	// I'm the one who came to cut your head off for killing the paladin Lothar.
	AI_Output(self,other, " DMT_12987_Ituseld_HELLO_01_02 " );	// Ahh...(bored) Another fanatic who thinks he's a hero.
	AI_Output(self,other, " DMT_12987_Ituseld_HELLO_01_03 " );	// Well, then you will suffer the same fate as that stupid paladin.
	AI_Output(self,other, " DMT_12987_Ituseld_HELLO_01_04 " );	// I'll crush you with one blow, worm!
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Snd_Play("MFX_FEAR_CAST");
};
