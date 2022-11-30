
instance DIA_DMT_2200_DarkSpeaker_Exit(C_Info)
{
	npc = DMT_2200_DarkSpeaker;
	nr = 999;
	condition = DIA_DMT_2200_DarkSpeaker_Exit_condition;
	information = DIA_DMT_2200_DarkSpeaker_Exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DMT_2200_DarkSpeaker_Exit_condition()
{
	return TRUE;
};

func void DIA_DMT_2200_DarkSpeaker_Exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DMT_2200_DarkSpeaker_Hello(C_Info)
{
	npc = DMT_2200_DarkSpeaker;
	nr = 1;
	condition = DIA_DMT_2200_DarkSpeaker_Hello_condition;
	information = DIA_DMT_2200_DarkSpeaker_Hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2200_DarkSpeaker_Hello_condition()
{
	return TRUE;
};

func void DIA_DMT_2200_DarkSpeaker_Hello_info()
{
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_Hello_01_00 " );	// So we finally met, hero...
	AI_Output(other,self, " DIA_DMT_2200_DarkSpeaker_Hello_01_01 " );	// Who are you?
	AI_Output(other,self, " DIA_DMT_2200_DarkSpeaker_Hello_01_02 " );	// Another minion of Beliar he sent to stop me?
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_Hello_01_03 " );	// My name won't tell you anything. But I have one suggestion for you.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_Hello_01_04 " );	// I hope you listen to him before you try to kill me.
	AI_Output(other,self, " DIA_DMT_2200_DarkSpeaker_Hello_01_05 " );	// Well, talk! Just fast and to the point.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_Hello_01_06 " );	// I've come with an offer from my master.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_Hello_01_07 " );	// He sees in you a great power that can forever change the face of this world.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_Hello_01_08 " );	// Now you're fighting on his brother's side, but think carefully - is it really worth it?
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_Hello_01_09 " );	// What did this god of yours do for you? What blessings has he bestowed on you for such faithful service?
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_Hello_01_10 " );	// I'm sure he didn't have anything like that in his mind. While you constantly risk your life for him!
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_Hello_01_11 " );	// And my master could give you much more than just the empty promises of this deceitful hypocrite.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_Hello_01_12 " );	// You will get everything - power, power, wealth to the extent that you consider necessary for yourself.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_Hello_01_13 " );	// And be sure he won't deceive you!
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_Hello_01_14 " );	// Well, what do you say?
	Info_ClearChoices(dia_dmt1298_hello);
	MeetDarkRavenSpeaker = TRUE;

	// if(DarkPathStartEnd == FALSE)
	//{
	// 	Info_AddChoice(DIA_DMT_2200_DarkSpeaker_Hello,"Sounds tempting!",DIA_DMT_2200_DarkSpeaker_Hello_Yes);
	//};

	Info_AddChoice(DIA_DMT_2200_DarkSpeaker_Hello, " I'll say it's time for you to die. " ,DIA_DMT_2200_DarkSpeaker_Hello_No);
};

func void DIA_DMT_2200_DarkSpeaker_Hello_Yes()
{
	AI_Output(other,self, " DIA_DMT_2200_DarkSpeakerHello_Yes_01_01 " );	// Sounds tempting!
	AI_Output(other,self, " DIA_DMT_2200_DarkSpeakerHello_Yes_01_02 " );	// But where is the guarantee that your master will really show me his favor if I agree to your proposal.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeakerHello_Yes_01_03 " );	// Don't worry! He will do it... He always does it!
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeakerHello_Yes_01_04 " );	// However, everything has its time. First you will have to prove your loyalty, and after that we will talk about your reward.
	AI_Output(other,self, " DIA_DMT_2200_DarkSpeakerHello_Yes_01_05 " );	// Well, okay. Let's say I agree!
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeakerHello_Yes_01_06 " );	// That's a wise decision...(pretty) I'm sure you won't regret it. Now to the point...
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeakerHello_Yes_01_07 " );	// I know that you are looking for a way to get a powerful artifact from the paladins - the Eye of Innos!
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeakerHello_Yes_01_08 " );	// I'm sure it will end up in your hands sooner or later.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeakerHello_Yes_01_09 " );	// And as a sign that you bow your head before the lord of Darkness and call yourself his servant, you will have to bring it to us.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeakerHello_Yes_01_10 " );	// As you can see, nothing complicated.
	AI_Output(other,self, " DIA_DMT_2200_DarkSpeakerHello_Yes_01_11 " );	// Just that! OK I will do it.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeakerHello_Yes_01_12 " );	// Then we'll be waiting for you in the circle of the Sun! Come there with the amulet when you have it.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeakerHello_Yes_01_13 " );	// And now goodbye...I'm sure we'll meet soon.
	DarkPathStart = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
};

func void DIA_DMT_2200_DarkSpeaker_Hello_No()
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

	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(other,self, " DIA_DMT_2200_DarkSpeaker_Hello_No_01_01 " );	// I'll say it's time for you to die.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_Hello_No_01_02 " );	// Well, as you know... (with a threat) You yourself chose your fate!
	Info_ClearChoices(DIA_DMT_2200_DarkSpeaker_Hello);
	Info_AddChoice(DIA_DMT_2200_DarkSpeaker_Hello,Dialog_Ende,DIA_DMT_2200_DarkSpeaker_Hello_Quit);
};

func void DIA_DMT_2200_DarkSpeaker_Hello_Quit()
{
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
	self.flags = FALSE;
	Snd_Play("MFX_FEAR_CAST");

	if(SBMODE == TRUE)
	{
		Wld_SpawnNpcRange(hero,Skeleton_Dark,2,500);
	}
	else
	{
		Wld_SpawnNpcRange(hero,Skeleton_Dark,1,500);
	};

	self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;

	// ---------------------------main-------------------- --------

	if (Npc_IsDead(Salandril) ==  FALSE )
	{
		Salandril.aivar[AIV_ToughGuy] = TRUE ;
	};

	Cornelius.flags = FALSE;
	NoDarkInsMe = TRUE;

	if(!Npc_IsDead(Hodges))
	{
		B_StartOtherRoutine(Hodges,"BENNETWEG");
	};
	if (Npc_IsDead(Sekob) ==  FALSE )
	{
		B_StartOtherRoutine(Sekob,"FleeDMT");
		B_StartOtherRoutine(Rosi,"FleeDMT");
		B_StartOtherRoutine(Till,"FleeDMT");
		B_StartOtherRoutine(Balthasar,"FleeDMT");
		B_StartOtherRoutine(BAU_933_Rega,"FleeDMT");
		B_StartOtherRoutine(BAU_934_Babera,"FleeDMT");
		B_StartOtherRoutine(BAU_937_Bauer,"FleeDMT");
		B_StartOtherRoutine(BAU_938_Bauer,"FleeDMT");
		Wld_InsertNpc(DMT_DementorAmbientSekob1,"NW_FARM4_IN_06");
		Wld_InsertNpc(DMT_DementorAmbientSekob2,"NW_FARM4_IN_02");
		Wld_InsertNpc(DMT_DementorAmbientSekob3,"NW_FARM4_IN_03");
		Wld_InsertNpc(DMT_DementorAmbientSekob4,"NW_FARM4_IN_04");
	};

	B_StartOtherRoutine(Lester,"WAITFORPLAYER");
	AI_Teleport(Lester,"NW_GREATPEASENT_TO_PASS");
	B_StartOtherRoutine(Bennet,"PRISON");
	B_RemoveNpc(PAL_203_Lothar);

	if(Bennet.flags == NPC_FLAG_IMMORTAL)
	{
		Bennet.flags = NPC_FLAG_NONE;
	};

	if (Npc_IsDead(Malak) ==  FALSE )
	{
		B_StartOtherRoutine(Malak,"FleeFromPass");
		Malak_isAlive_Kap3 = TRUE;
		B_StartOtherRoutine(BAU_962_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_964_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_965_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_966_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_967_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_968_Bauer,"FleeFromPass");
		B_StartOtherRoutine(BAU_969_Bauer,"FleeFromPass");

		if(hero.guild == GIL_KDF)
		{
			CreateInvItems(Malak,ITWR_DementorObsessionBook_MIS,1);
		};
	};

	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"NW_CITY_TO_FARM2_03");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_NW_BIGFARM_FELDREUBER11");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_02");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_03");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_04");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_05");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_06");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_CITY_TO_FOREST_01");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_ROAM_CITY_TO_FOREST_15");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_07");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_08");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_09");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_10");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_11");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_12");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_13");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_14");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_15");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_16");
	Wld_InsertNpc(DMT_DementorAmbient,"FP_STAND_DEMENTOR_17");
	Wld_InsertNpc(DMT_DementorAmbientSpeaker,"FP_STAND_DEMENTOR_18");
	Wld_InsertNpc(DMT_DementorAmbientWalker11,"CITY1");
	Wld_InsertNpc(DMT_DementorAmbientWalker9,"CITY1");
	Wld_InsertNpc(DMT_DementorAmbientWalker6,"CITY1");
	Wld_InsertNpc(DMT_DementorAmbientWalker3,"CITY1");
	Wld_InsertNpc(DMT_DementorAmbientWalker1,"CITY1");

	if(Npc_IsDead(skeletonmage_darktower) == TRUE)
	{
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_01");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_02");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_03");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_04");
		Wld_InsertNpc(DMT_DementorAmbient,"FP_ROAM_DARKTOWER_05");
	};
	if(hero.guild == GIL_KDF)
	{
		Wld_InsertItem(ItMi_KarrasBlessedStone_Mis,"FP_ITEM_FARM1_03");
		Wld_InsertItem(ItMi_KarrasBlessedStone_Mis,"FP_NW_ITEM_TROLL_10");
		B_StartOtherRoutine(Hilda,"KRANK");

		if ( Npc_IsDead ( Wine ) ==  FALSE )
		{
			B_StartOtherRoutine(Vino,"OBESESSIONRITUAL");
			CreateInvItems(Vino,ITWR_DementorObsessionBook_MIS,1);
			Vino_isAlive_Kap3 = TRUE;
			B_StartOtherRoutine(Lobart,"OBESESSIONRITUAL");
			Wld_InsertNpc(DMT_DementorSpeakerVino1,"FP_STAND_DEMENTOR_KDF_31");
			Wld_InsertNpc(DMT_DementorSpeakerVino2,"FP_STAND_DEMENTOR_KDF_32");
			Wld_InsertNpc(DMT_DementorSpeakerVino3,"FP_STAND_DEMENTOR_KDF_33");
			Wld_InsertNpc(DMT_DementorSpeakerVino4,"NW_LITTLESTONEHENDGE_02");
			B_KillNpc(YGiant_Bug_VinoRitual1);
			B_KillNpc(YGiant_Bug_VinoRitual2);
		};
		if (Npc_IsDead(Bromor) ==  FALSE )
		{
			CreateInvItems(Bromor,ITWR_DementorObsessionBook_MIS,1);
		};
	};

	CreateInvItems(Lester,ItMw_1h_Bau_Axe,1);
	CreateInvItems(Ehnim,ItMi_Moleratlubric_MIS,1);
	ShrineIsObsessed_NW_TROLLAREA_PATH_37 = TRUE;
	ShrineIsObsessed_NW_FARM1_CONNECT_XARDAS = TRUE;
	ShrineIsObsessed_NW_TROLLAREA_PATH_66 = TRUE;
	ShrineIsObsessed_NW_TROLLAREA_PATH_04 = TRUE;
	ShrineIsObsessed_ARROW = TRUE ;
	ShrineIsObsessed_NW_BIGMILL_MALAKSVERSTECK_02 = TRUE;
	ShrineIsObsessed_NW_FARM3_BIGWOOD_02 = TRUE;

	if((Npc_IsDead(BDT_1060_Dexter) == TRUE) && (DMTINCASTLEMINEISREADY == FALSE))
	{
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_01");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_REP_HUT");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_PATH_HUT_02");
		Wld_InsertNpc(DMT_DementorAmbient,"CASTLEMINE");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_01");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_PATH_OUTSIDEHUT_02");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_PATH_01");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_CAMPFIRE_01");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_CAMPFIRE_02");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_CAMPFIRE_03");
		Wld_InsertNpc(DMT_DementorAmbientSpeaker,"NW_CASTLEMINE_PATH_03");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_TOWER_CAMPFIRE_04");
		Wld_InsertNpc(DMT_DementorAmbient,"NW_CASTLEMINE_HUT_01");
		Wld_InsertNpc(CastlemineDMT,"NW_CASTLEMINE_HUT_10");
		DMTINCASTLEMINEISREADY = TRUE;
	};
};

instance DIA_DMT_2200_DarkSpeaker_InnosEye(C_Info)
{
	npc = DMT_2200_DarkSpeaker;
	nr = 1;
	condition = DIA_DMT_2200_DarkSpeaker_InnosEye_condition;
	information = DIA_DMT_2200_DarkSpeaker_InnosEye_info;
	permanent = FALSE;
	description = " I brought you an artifact of Innos. " ;
};

func int DIA_DMT_2200_DarkSpeaker_InnosEye_condition()
{
	if(Npc_HasItems(hero,ItMi_InnosEye_Bad) >= 1)
	{
		return TRUE;
	};
};

func void DIA_DMT_2200_DarkSpeaker_InnosEye_info()
{
	AI_Output(other,self, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_00 " );	// I brought you an artifact of Innos.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_01 " );	// Show it to me!
	AI_Output(other,self, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_02 " );	// Here it is.
	B_GiveInvItems(other,self,ItMi_InnosEye_Bad,1);
	Npc_RemoveInvItems(self,ItMi_InnosEye_Bad,1);
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_03 " );	// Great! You made a wise decision by giving it to me, and in doing so you proved your willingness to serve Beliar.
	AI_Output(other,self, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_04 " );	// What about the promised reward?
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_05 " );	// Of course! Here, take this gold as a reward for your labors.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	AI_Output(other,self, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_06 " );	// Thank you. Now what?
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_07 " );	// I think it's time for you to meet with our abbot.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_08 " );	// He is wise and powerful! He will explain everything to you better than me.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_09 " );	// Besides, I'm sure he'll probably have some errands for you.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_10 " );	// And I can give you one piece of advice - try not to disappoint him!
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_11 " );	// And if you're as zealous as you were with the amulet, you might soon become one of us.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_12 " );	// But it's still too early to talk about it.
	AI_Output(other,self, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_13 " );	// Okay. Where can I meet this rector of yours?
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_14 " );	// He'll be waiting for you in the ruined tower near the old lighthouse. There is still a passage to the fort of the paladins nearby.
	AI_Output(self,other, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_15 " );	// And you'd better go to him right now! Don't make him wait...
	AI_Output(other,self, " DIA_DMT_2200_DarkSpeaker_InnosEye_01_16 " );	// Okay, I'm on my way.
	TOPIC_END_INNOSEYE = TRUE;
	Log_SetTopicStatus(TOPIC_INNOSEYE,LOG_SUCCESS);
	; _ _ _ _ _ _
	MIS_MeetWithDark = LOG_Running;
	NazgulsAwayMe = TRUE;
	Log_CreateTopic(TOPIC_MeetWithDark,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MeetWithDark,LOG_Running);
	B_LogEntry(TOPIC_MeetWithDark, " I need to meet with the abbot of the Darkwalkers. He's waiting for me in the ruined tower, next to the lighthouse, not far from the entrance to the paladin fort. I don't think I should keep him waiting... " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ritual");
	Wld_InsertNpc(DMT_DementorFriendly,"NW_DARKMASTER_02_01");
	Wld_InsertNpc(DMT_DementorFriendly,"NW_DARKMASTER_02_02");
	Wld_InsertNpc(DMT_2201_Krah,"NW_DARKMASTER_02");
};

//---------------------------------------------------------------------------------------------

instance DIA_DMT_2201_Krah_Exit(C_Info)
{
	npc = DMT_2201_Krah;
	nr = 999;
	condition = DIA_DMT_2201_Krah_Exit_condition;
	information = DIA_DMT_2201_Krah_Exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DMT_2201_Krah_Exit_condition()
{
	return TRUE;
};

func void DIA_DMT_2201_Krah_Exit_info()
{
	AI_StopProcessInfos(self);
};

var int DS_CheckInfo_01;
var int DS_CheckInfo_02;
var int DS_CheckInfo_03;

instance DIA_DMT_2201_Krah_Hello (C_Info)
{
	npc = DMT_2201_Krah;
	nr = 1;
	condition = DIA_DMT_2201_Krah_Hello_condition;
	information = DIA_DMT_2201_Krah_Hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2201_Krah_Hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2201_Krah_Hello_info()
{
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_01_00 " );	// You make yourself wait...
	AI_Output(other,self, " DIA_DMT_2201_Krah_Hello_01_01 " );	// I came as soon as I could.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_01_02 " );	// Okay, it doesn't matter anymore.
	AI_Output(other,self,"DIA_DMT_2201_Krah_Hello_01_03");	//Кто ты?
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_01_04 " );	// My name is Ek'Rah.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_01_05 " );	// I am one of the tutors of the dark mages of Beliar or, as you people call them, Seekers.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_01_06 " );	// Although, in truth, we no longer need to search. After all, we have already found what we were looking for.
	AI_Output(other,self, " DIA_DMT_2201_Krah_Hello_01_07 " );	// And what were you looking for?
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_01_08 " );	// Of course you! Looking to make you an offer to join us.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_01_09 " );	// And as I see, you accepted it... Well, a wise decision!
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_01_10 " );	// For Beliar is always generous to those who serve him faithfully. Unlike their brothers.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_01_11 " );	// But enough talk! We have too little time to indulge in the boasts of our master.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_01_12 " );	// Changes are coming in the world, big changes, in which you have not the last role, hero.
	Info_ClearChoices(DIA_DMT_2201_Krah_Hello);
	Info_AddChoice(DIA_DMT_2201_Krah_Hello, " Why do you need the 'Eye of Innos'? " ,DIA_DMT_2201_Krah_Hello_Eye);
	Info_AddChoice(DIA_DMT_2201_Krah_Hello, " Who are the Seekers really? " ,DIA_DMT_2201_Krah_Hello_About);
	Info_AddChoice(DIA_DMT_2201_Krah_Hello, " What do you mean? " ,DIA_DMT_2201_Krah_Hello_Plan);
};

func void DIA_DMT_2201_Krah_Hello_Eye()
{
	AI_Output(other,self, " DIA_DMT_2201_Krah_Hello_Eye_01_00 " );	// Why do you need the 'Eye of Innos'?
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_Eye_01_01 " );	// I'm sure you're aware that this is a very powerful artifact created by our lord's brother.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_Eye_01_02 " );	// His very presence in this world is simply unacceptable on our part.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_Eye_01_03 " );	// Therefore, it must be destroyed by all means! Well, you helped us with this.
	DS_CheckInfo_01 = TRUE;
	
	if((DS_CheckInfo_01 == TRUE) || (DS_CheckInfo_02 == TRUE) || (DS_CheckInfo_03 == TRUE))
	{
		Info_ClearChoices(DIA_DMT_2201_Krah_Hello);
		Info_AddChoice(DIA_DMT_2201_Krah_Hello, " What's next? " ,DIA_DMT_2201_Krah_Hello_WhatDo);
	};
};

func void DIA_DMT_2201_Krah_Hello_About()
{
	AI_Output(other,self, " DIA_DMT_2201_Krah_Hello_About_01_00 " );	// Who are Seekers really?
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_About_01_01 " );	// They're just powerful mages who have devoted themselves to the service of the Dark God.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_About_01_02 " );	// Many of them have been on this path for a very long time, but there are those who have joined our brotherhood very recently.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_About_01_03 " );	// For example, crazy fanatics who worshiped the Sleeper even before you exiled him from this world.
	AI_Output(other,self, " DIA_DMT_2201_Krah_Hello_About_01_04 " );	// How do you know I killed the Sleeper?
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_About_01_05 " );	// Some things are pretty hard to hide from the eyes of those who can truly see.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_About_01_06 " );	// In addition, the surge of magical energy was so great that it was impossible not to feel it.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_About_01_07 " );	// However, I think this is not the last appearance of the Sleeper in this world.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_About_01_08 " );	// Surely there will be those who will try to bring him back to this world.
	AI_Output(other,self, " DIA_DMT_2201_Krah_Hello_About_01_09 " );	// I wonder why?
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_About_01_10 " );	// Sleeping is a very ancient and powerful demon, whose appearance is rooted in the very origins of the origin of this world.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_About_01_11 " );	// So, his strength might well be of interest to many. Including our master.
	DS_CheckInfo_02 = TRUE;

	if((DS_CheckInfo_01 == TRUE) || (DS_CheckInfo_02 == TRUE) || (DS_CheckInfo_03 == TRUE))
	{
		Info_ClearChoices(DIA_DMT_2201_Krah_Hello);
		Info_AddChoice(DIA_DMT_2201_Krah_Hello, " What's next? " ,DIA_DMT_2201_Krah_Hello_WhatDo);
	};
};

func void DIA_DMT_2201_Krah_Hello_Plan()
{
	AI_Output(other,self, " DIA_DMT_2201_Krah_Hello_Plan_01_00 " );	// What do you mean?
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_Plan_01_01 " );	// It's too early for you to know about it yet! The time will come and you yourself will understand everything.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_Plan_01_02 " );	// But I can only say one thing - this world will not be the same as before.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_Plan_01_03 " );	// And the place that we will take in it depends on the success of our deeds in the name of the Dark God!
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_Plan_01_04 " );	// So try to think only about this and not be distracted by worldly fuss.
	AI_Output(other,self, " DIA_DMT_2201_Krah_Hello_Plan_01_05 " );	// Okay, I'll try.
	DS_CheckInfo_03 = TRUE;

	if((DS_CheckInfo_01 == TRUE) || (DS_CheckInfo_02 == TRUE) || (DS_CheckInfo_03 == TRUE))
	{
		Info_ClearChoices(DIA_DMT_2201_Krah_Hello);
		Info_AddChoice(DIA_DMT_2201_Krah_Hello, " What's next? " ,DIA_DMT_2201_Krah_Hello_WhatDo);
	};
};

func void DIA_DMT_2201_Krah_Hello_WhatDo()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(other,self, " DIA_DMT_2201_Krah_Hello_WhatDo_01_00 " );	// Good. What's next?
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_WhatDo_01_01 " );	// Now I'll open a magical portal. Through it you will get to the abode of the dark wanderers, located on the island of Ir'Erat.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_WhatDo_01_02 " );	// There you will begin your training in the art of dark magic. Or you will embark on the path of the warrior Beliar!
	AI_Output(other,self, " DIA_DMT_2201_Krah_Hello_WhatDo_01_03 " );	// What, will they teach me?!
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_WhatDo_01_04 " );	// Looking at you, I understand that this is simply necessary! For now you are too weak to be truly useful to the Dark God.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_WhatDo_01_05 " );	// And when you're ready, we'll get back to our conversation.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_WhatDo_01_06 " );	// When you arrive on Ir'erath, speak to Abbot Kyrat. He will lead you on to the next step.
	AI_Output(self,other, " DIA_DMT_2201_Krah_Hello_WhatDo_01_07 " );	// That's it! Now don't waste your time...we don't have much left.
	AI_StopProcessInfos(self);
	WayToIrat = TRUE;
};

// ---------------------------------Abbot Kirat------------- -----------------------------------------------------

instance DIA_DMT_2202_Kirat_Exit(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 999;
	condition = DIA_DMT_2202_Kirat_Exit_condition;
	information = DIA_DMT_2202_Kirat_Exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DMT_2202_Kirat_Exit_condition()
{
	return TRUE;
};

func void DIA_DMT_2202_Kirat_Exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DMT_2202_Kirat_Hello (C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_Hello_condition;
	information = DIA_DMT_2202_Kirat_Hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2202_Kirat_Hello_condition()
{
		return TRUE;
};

func void DIA_DMT_2202_Kirat_Hello_info()
{
	AI_Output(self,other, " DIA_DMT_2202_Kirat_Hello_01_00 " );	// I won't ask you - who are you and why are you here.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_Hello_01_01 " );	// If you ended up in this place, then most likely one of our superiors sent you.
	AI_Output(other,self, " DIA_DMT_2202_Kirat_Hello_01_02 " );	// Ek'Rah sent me!
	AI_Output(self,other, " DIA_DMT_2202_Kirat_Hello_01_03 " );	// Master Ek'Rah?! I wonder... What did you do to deserve his attention?
	AI_Output(other,self, " DIA_DMT_2202_Kirat_Hello_01_04 " );	// What are you talking about?
	AI_Output(self,other, " DIA_DMT_2202_Kirat_Hello_01_05 " );	// How about what? After all, he is one of the most powerful mentors of our enclave.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_Hello_01_06 " );	// Only a select few were honored with such an honor.
	Info_ClearChoices(DIA_DMT_2202_Kirat_Hello);
	Info_AddChoice(DIA_DMT_2202_Kirat_Hello, " None of your business! " ,DIA_DMT_2202_Kirat_Hello_Bad);
	Info_AddChoice(DIA_DMT_2202_Kirat_Hello, " I brought him the Eye of Innos. " ,DIA_DMT_2202_Kirat_Hello_Good);
};

func void DIA_DMT_2202_Kirat_Hello_Bad()
{
	AI_Output(other,self, " DIA_DMT_2202_Kirat_Hello_Bad_01_00 " );	// none of your business!
	AI_Output(self,other, " DIA_DMT_2202_Kirat_Hello_Bad_01_01 " );	// Okay, whatever you say.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_Hello_Bad_01_02 " );	// Okay, let's go. I will take you to the temple.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_Hello_Bad_01_03 " );	// We'll talk about the rest later.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitInHram");
};

func void DIA_DMT_2202_Kirat_Hello_Good()
{
	AI_Output(other,self, " DIA_DMT_2202_Kirat_Hello_Good_01_00 " );	// I brought him the Eye of Innos.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_Hello_Good_01_01 " );	// Eye of Innos?! That mighty Palladin artifact?
	AI_Output(other,self, " DIA_DMT_2202_Kirat_Hello_Good_01_02 " );	// Yes, that's it.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_Hello_Good_01_03 " );	// Incredible! Then that explains your presence here.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_Hello_Good_01_04 " );	// Okay, let's go. I will take you to the temple.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_Hello_Good_01_05 " );	// We'll talk about the rest later.
	KirratPRP += 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaitInHram");
};

instance DIA_DMT_2202_Kirat_WelcomeHell(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WelcomeHell_condition;
	information = DIA_DMT_2202_Kirat_WelcomeHell_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2202_Kirat_WelcomeHell_condition()
{
	if(Npc_GetDistToWP(self,"DT_KIRATWAIT_02") <= 500)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WelcomeHell_info()
{
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WelcomeHell_01_00 " );	// Here we are.
	AI_Output(other,self, " DIA_DMT_2202_Kirat_WelcomeHell_01_01 " );	// Impressive! Whose temple is this?
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WelcomeHell_01_02 " );	// Temple of Beliar, of course! One of the two still in operation.
	AI_Output(other,self, " DIA_DMT_2202_Kirat_WelcomeHell_01_03 " );	// Were there others?
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WelcomeHell_01_04 " );	// They were, until they were destroyed by the paladins of Innos.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WelcomeHell_01_05 " );	// Now there are only two of them left - ours and the one that is located on the island of Irdorath.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WelcomeHell_01_06");	//Ирдорат?
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WelcomeHell_01_07 " );	// There is the great sanctuary of the Beast and the chambers of the one whom Beliar himself has chosen as his chosen ones in this world.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WelcomeHell_01_08 " );	// But you'll never get there. So, you better get it out of your head.
};

instance DIA_DMT_2202_Kirat_WhoMain(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 2;
	condition = DIA_DMT_2202_Kirat_WhoMain_condition;
	information = DIA_DMT_2202_Kirat_WhoMain_info;
	permanent = FALSE;
	description = " Who's in charge here? " ;
};

func int DIA_DMT_2202_Kirat_WhoMain_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WelcomeHell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhoMain_info()
{
	AI_Output(other,self, " DIA_DMT_2202_Kirat_WhoMain_01_00 " );	// Who's in charge here?
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoMain_01_01 " );	// Our enclave is led by Grand Master Mi'Argul. He is also the head priest of the temple!
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoMain_01_02 " );	// In addition, Masters Mulzog and Norrath are members of the shrine's high council.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoMain_01_03 " );	// The first is the mentor of the dark adepts and conducts their training in the magical arts.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoMain_01_04 " );	// The second one will train the warriors of Beliar - devoted fanatics, ready to give their lives for our master.
	AI_Output(other,self, " DIA_DMT_2202_Kirat_WhoMain_01_05 " );	// Is Beliar in need of warriors? Doesn't he have enough of the countless undead army?
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoMain_01_06 " );	// It's not that simple, my friend. Not all creatures of darkness follow his call.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoMain_01_07 " );	// There are enough powers in this world that even he can't control.
	AI_Output(other,self, " DIA_DMT_2202_Kirat_WhoMain_01_08 " );	// Whom do they worship then?
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoMain_01_09 " );	// To those who stood at the origins of the origin of this world. Those who created this world and the gods themselves.
};

instance DIA_DMT_2202_Kirat_WhoYou(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WhoYou_condition;
	information = DIA_DMT_2202_Kirat_WhoYou_info;
	permanent = FALSE;
	description = " Who are you? " ;
};

func int DIA_DMT_2202_Kirat_WhoYou_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WelcomeHell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhoYou_info()
{
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoYou_01_00");	//Кто ты?
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoYou_01_01 " );	// My name is Kirat. Though I'm sure it doesn't mean much to you.
	AI_Output(other,self, " DIA_DMT_2202_Kirat_WhoYou_01_02 " );	// And what are you doing, Kirat?
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoYou_01_03 " );	// I take care of the newly arrived acolytes and bring them up to date.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoYou_01_04 " );	// And also keep order.
	AI_Output(other,self, " DIA_DMT_2202_Kirat_WhoYou_01_05 " );	// Not a very hard job.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoYou_01_06 " );	// Hmmm...how to say.
};

instance DIA_DMT_2202_Kirat_WhatRules(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WhatRules_condition;
	information = DIA_DMT_2202_Kirat_WhatRules_info;
	permanent = FALSE;
	description = " What should I know about this place? " ;
};

func int DIA_DMT_2202_Kirat_WhatRules_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WelcomeHell) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhatRules_info()
{
	AI_Output(other,self, " DIA_DMT_2202_Kirat_WhatRules_01_00 " );	// What should I know about this place?
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatRules_01_01 " );	// First of all, you must remember that this is the sacred temple of Beliar himself.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatRules_01_02 " );	// No one should know about its existence. Nobody!
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatRules_01_03 " );	// This is especially true for the mages of Innos and his paladins.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatRules_01_04 " );	// These crazy fanatics will stop at nothing to get here.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatRules_01_05 " );	// And we are still too weak to face them in open battle.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatRules_01_06 " );	// Now for more pressing matters. Our enclave will not tolerate thieves or troublemakers.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatRules_01_07 " );	// For any fight or theft of the offender, only one punishment awaits - death!
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatRules_01_08 " );	// Always remember this.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatRules_01_09 " );	// And most importantly, don't forget to spend enough time in prayer to our master.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatRules_01_10 " );	// His cuteness can easily turn to anger if he sees that you are not too devoted to him.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatRules_01_11 " );	// Therefore, it must be proved constantly if you expect to stay here longer.
};


instance DIA_DMT_2202_Kirat_WhatPray(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WhatPray_condition;
	information = DIA_DMT_2202_Kirat_WhatPray_info;
	permanent = FALSE;
	description = " Where can I do this? " ;
};

func int DIA_DMT_2202_Kirat_WhatPray_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WhatRules) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhatPray_info()
{
	AI_Output(other,self, " DIA_DMT_2202_Kirat_WhatPray_01_00 " );	// Where can I do this?
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatPray_01_01 " );	// Altars of the Dark God are located throughout the temple. I'm sure you can easily find them.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatPray_01_02 " );	// In any of them, you can pray to our master or give him a small gift. Except the great altar of Darkness!
	AI_Output(other,self, " DIA_DMT_2202_Kirat_WhatPray_01_03 " );	// What is the great altar of Darkness?
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatPray_01_04 " );	// Through him, our master reveals his will to us and accepts exceptionally special offerings.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatPray_01_05 " );	// However, only Master Mi'Argul is allowed to use it! The rest will face severe punishment in case of disobedience.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhatPray_01_06 " );	// So my advice to you is to stay away from this altar.
};

instance DIA_DMT_2202_Kirat_WhoNow(C_Info)
{
	npc = DMT_2202_Kirat;
	nr = 1;
	condition = DIA_DMT_2202_Kirat_WhoNow_condition;
	information = DIA_DMT_2202_Kirat_WhoNow_info;
	permanent = FALSE;
	description = " What now? " ;
};

func int DIA_DMT_2202_Kirat_WhoNow_condition()
{
	if(Npc_KnowsInfo(other,DIA_DMT_2202_Kirat_WhoMain) == TRUE) 
	{
		return TRUE;
	};
};

func void DIA_DMT_2202_Kirat_WhoNow_info()
{
	AI_Output(other,self, " DIA_DMT_2202_Kirat_WhoNow_01_00 " );	// What now?
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_01 " );	// First you should talk to one of the masters.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_02 " );	// If they deem you worthy, you will soon begin your apprenticeship with one of them.
	AI_Output(other,self, " DIA_DMT_2202_Kirat_WhoNow_01_03 " );	// And how can I prove to them that I'm worthy?
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_04 " );	// They will all test you. And not just once...
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_05 " );	// And then everything is simple! Either you endure the trials and win their respect, or you will face a painful death.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_06 " );	// The rest is up to you.
	AI_Output(other,self,"DIA_DMT_2202_Kirat_WhoNow_01_07");	//Понимаю.


	if(KirratPRP > 0)
	{
		AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_08 " );	// But I can give you one piece of advice on how to make a good impression on the masters.
		AI_Output(other,self, " DIA_DMT_2202_Kirat_WhoNow_01_09 " );	// I'm all ears.
		AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_10 " );	// Master Mulzog can be too eloquent in his instructions and sometimes lose his temper if someone suddenly interrupts him.
		AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_11 " );	// Once he killed a novice on the spot just because he accidentally sneezed during his sermon.
		AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_12 " );	// Therefore, in his case, silence is not only gold, but also an opportunity to save one's life.
		AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_13 " );	// Master Norrath is rather silent! You can't tell from his face what he's thinking right now.
		AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_14 " );	// He ruthlessly chases his students from morning to night, teaching them martial arts.
		AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_15 " );	// And severely punishes those who cannot withstand these inhuman loads.
		AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_16 " );	// So, if I were you, I thought before I decided to talk to him.
		AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_17 " );	// If you give him your consent to pass his tests, there will be no turning back.
		AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_18 " );	// I hope you understand what I mean?
		AI_Output(other,self, " DIA_DMT_2202_Kirat_WhoNow_01_19 " );	// Yes, I understand perfectly.
	};

	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_20 " );	// Good! Then do not waste time and immediately go to them.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_21 " );	// True, if you want to look around here a little, no one will think against it.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_22 " );	// You're new here and you'll probably have more questions.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_23 " );	// These are best addressed to me, not to the masters themselves.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_24 " );	// Otherwise, all this can end very badly. For you, of course.
	AI_Output(self,other, " DIA_DMT_2202_Kirat_WhoNow_01_25 " );	// That's it, now go novice. Praised be the name of Beliar!
	AI_StopProcessInfos(self);
};

// --------------------------- Mulzog--------------------- ------------------------------------------

instance DIA_DMT_2204_Mulzog_Exit(C_Info)
{
	npc = DMT_2204_Mulzog;
	nr = 999;
	condition = DIA_DMT_2204_Mulzog_Exit_condition;
	information = DIA_DMT_2204_Mulzog_Exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_DMT_2204_Mulzog_Exit_condition()
{
	return TRUE;
};

func void DIA_DMT_2204_Mulzog_Exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_DMT_2204_Mulzog_Hello(C_Info)
{
	npc = DMT_2204_Mulzog;
	nr = 1;
	condition = DIA_DMT_2204_Mulzog_Hello_condition;
	information = DIA_DMT_2204_Mulzog_Hello_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_DMT_2204_Mulzog_Hello_condition()
{
	return TRUE;
};

func void DIA_DMT_2204_Mulzog_Hello_info()
{
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_00 " );	// Well, well... Who is this here? What are you, a new follower?
	AI_Output(other,self, " DIA_DMT_2204_Mulzog_Hello_01_01 " );	// Yes, master, he is the one.
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_02 " );	// Hmmm... (staring intently) I confess you look rather odd. You are clearly trying to hide something from me.
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_03 " );	// Oh well! We'll deal with this later.
	AI_Output(other,self, " DIA_DMT_2204_Mulzog_Hello_01_04 " );	// Is something wrong?
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_05 " );	// It just amazes me that a man like you would choose to serve Beliar.
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_06 " );	// Not many people are willing to devote their entire lives to it. And even more so, not many are ready to give it away for the sake of the greatness of the Dark God.
	AI_Output(other,self, " DIA_DMT_2204_Mulzog_Hello_01_07 " );	// If I didn't want to serve Beliar, I wouldn't be here.
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_08 " );	// But you're here! Although you don’t realize what the path you have chosen can lead you to.
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_09 " );	// Now you're more like a blind kitten wandering in the dark.
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_10 " );	// But I'll help you find what you came here for.
	AI_Output(other,self, " DIA_DMT_2204_Mulzog_Hello_01_11 " );	// Do you know what I need?
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_12 " );	// I know everything... (maliciously) Power and might - what else can people want? You will not be an exception in this case.
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_13 " );	// And I promise - you will get it all if you serve our master faithfully and faithfully.
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_14 " );	// Not immediately, of course, but over time, you will have everything you could ever dream of.
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_15 " );	// Unless, of course, you prove worthy of all these benefits.
	AI_Output(other,self, " DIA_DMT_2204_Mulzog_Hello_01_16 " );	// Haven't I proven this already?
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_17 " );	// You just proved that you are worthy to be called here, to this Temple.
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_18 " );	// But you still have to earn the right to stay here!
	AI_Output(other,self, " DIA_DMT_2204_Mulzog_Hello_01_19 " );	// What do you mean?
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_20 " );	// And the fact that serving Beliar is not only kissing the floor in front of his statue.
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_21 " );	// Something more serious and significant is needed for the Dark God, although in my person, to recognize you as worthy of these awards.
	AI_Output(other,self, " DIA_DMT_2204_Mulzog_Hello_01_22 " );	// And I was already relaxed.
	AI_Output(self,other, " DIA_DMT_2204_Mulzog_Hello_01_23 " );	// In that case, we'll have to get together again... (dryly)
};
