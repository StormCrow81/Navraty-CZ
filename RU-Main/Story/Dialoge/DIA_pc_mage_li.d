

var int trd_mageli;

instance DIA_MILTEN_LI_EXIT(C_Info)
{
	npc = pc_mage_li;
	nr = 999;
	condition = dia_milten_li_exit_condition;
	information = dia_milten_li_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_milten_li_exit_condition()
{
	return TRUE;
};

func void dia_milten_li_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_MAGE_LI_HELLOS(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_hellos_condition;
	information = dia_mage_li_hellos_info;
	permanent = FALSE;
	description = " How are things? " ;
};


func int dia_mage_li_hellos_condition()
{
	return TRUE;
};

func void dia_mage_li_hellos_info()
{
	AI_Output(other,self, " DIA_Mage_LI_Ancient_01_01 " );	// How are things going?
	AI_Output(self,other, " DIA_Mage_LI_Ancient_01_02 " );	// So far, everything seems to be fine. All the guys are slowly recovering from this terrible storm!
	AI_Output(self,other, " DIA_Mage_LI_Ancient_01_04 " );	// But one thing still worries me...
	AI_Output(self,other, " DIA_Mage_LI_Ancient_01_06 " );	// When we first landed on this shore, I felt a little magical excitement.
	AI_Output(other,self, " DIA_Mage_LI_Ancient_01_08 " );	// And what do you think it was?
	AI_Output(self,other, " DIA_Mage_LI_Ancient_01_09 " );	// I don't know yet... But perhaps it was caused by the presence of some very strong magic here on this island.
	AI_Output(self,other, " DIA_Mage_LI_Ancient_01_10 " );	// And absolutely not familiar to me!
	AI_Output(self,other, " DIA_Mage_LI_Ancient_01_13 " );	// I think that, most likely, its source is located somewhere in the center of this island.
	AI_Output(self,other, " DIA_Mage_LI_Ancient_01_15 " );	// When I tried to follow a little deeper into these thickets, I felt a much stronger magical excitement.
	AI_Output(self,other, " DIA_Mage_LI_Ancient_01_21 " );	// And it seemed to me that in the distance I saw some small stone tower!
	AI_Output(self,other, " DIA_Mage_LI_Ancient_01_22 " );	// Most of it was hidden by the trees, so I couldn't see it very well.
	AI_Output(other,self, " DIA_Mage_LI_Ancient_01_24 " );	// Then we should check this tower as soon as possible!
	AI_Output(self,other, " DIA_Mage_LI_Ancient_01_26 " );	// But I'm afraid you'll have to do all this alone.
	AI_Output(self,other, " DIA_Mage_LI_Ancient_01_30 " );	// The influence of this magic power on me is too great, and I don't know what consequences it can lead to.
	AI_Output(other,self, " DIA_Mage_LI_Ancient_01_32 " );	// Okay, if I can figure something out, I'll let you know.
	if (self.aivar[ AIV_PARTYMEMBER ] ==  TRUE )
	{
		self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	};
	MIS_MILTENANCIENT = LOG_Running;
	Log_CreateTopic(TOPIC_MILTENANCIENT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MILTENANCIENT,LOG_Running);
	B_LogEntry( TOPIC_MILTENANCIENT , " Milten told me that as soon as he got ashore, he felt a magical commotion. Perhaps it was caused by the presence of some strange magical force on the island. According to Milten, the source of this magic is in the old stone tower that Milten discovered while exploring the island itself. I think it's worth visiting there and figuring out what's what. " );
};


instance DIA_MAGE_LI_ANCIENTPROGRESS(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogress_condition;
	information = dia_mage_li_ancientprogress_info;
	permanent = FALSE;
	description = " I searched this stone tower. " ;
};


func int dia_mage_li_ancientprogress_condition()
{
	if((MIS_MILTENANCIENT == LOG_Running) && (Npc_HasItems(other,itwr_ancient) >= 1))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogress_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Mage_LI_AncientProgress_01_01 " );	// I searched this stone tower.
	AI_Output(self,other, " DIA_Mage_LI_AncientProgress_01_02 " );	// (interested) And how? Did you manage to find out anything?
	AI_Output(other,self, " DIA_Mage_LI_AncientProgress_01_03 " );	// I'm afraid to disappoint you, but I did not find anything interesting in this tower.
	AI_Output(other,self, " DIA_Mage_LI_AncientProgress_01_04 " );	// But then I found this strange book there. It looks like it contains an unusual magical power.
	AI_Output(self,other, " DIA_Mage_LI_AncientProgress_01_05 " );	// Really? Let me take a look at her.
	B_GiveInvItems(other,self,itwr_ancient,1);
	AI_Output(self,other, " DIA_Mage_LI_AncientProgress_01_07 " );	// Hmmm... looks like you're right!
	AI_Output(self,other, " DIA_Mage_LI_AncientProgress_01_08 " );	// Apparently, this book really contains magic.
	AI_Output(self,other, " DIA_Mage_LI_AncientProgress_01_11 " );	// I may need some time to figure this out.
	AI_Output(other,self, " DIA_Mage_LI_AncientProgress_01_12 " );	// Good. But I still couldn't open it.
	AI_Output(other,self, " DIA_Mage_LI_AncientProgress_01_13 " );	// This book appears to be protected by some kind of magic spell.
	AI_Output(self,other, " DIA_Mage_LI_AncientProgress_01_14 " );	// (seriously) Then maybe I'll try to be more careful with her. Thank you.
	B_LogEntry( TOPIC_MILTENANCIENT , " I brought Milten the book I found in the stone tower. He promised to look into it all. " );
	MILTENDEMONTIMER = Wld_GetDay();
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTWO(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogresstwo_condition;
	information = dia_mage_li_ancientprogresstwo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogresstwo_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if((MIS_MILTENANCIENT == LOG_Running) && (MEANDMILTENTELEPORTDC == FALSE) && Npc_KnowsInfo(hero,dia_mage_li_ancientprogress) && (MILTENDEMONTIMER <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogresstwo_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressTwo_01_01 " );	// Wait! I have news about that book you brought me.
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressTwo_01_03 " );	// I think I figured out how to open it.
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressTwo_01_05 " );	// But I don't feel comfortable with this idea!
	AI_Output(other,self, " DIA_Mage_LI_AncientProgressTwo_01_06 " );	// What are you afraid of?
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressTwo_01_07 " );	// I'm not afraid... It's just that who knows what secret she hides...
	AI_Output(other,self, " DIA_Mage_LI_AncientProgressTwo_01_08 " );	// Come on! What can happen if we just open a book?
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressTwo_01_09 " );	// Well, whatever you say. Are you ready?
	B_LogEntry( TOPIC_MILTENANCIENT , " Milten seems to have figured out the secret of this book. Now we will try to open it. " );
	Info_ClearChoices(dia_mage_li_ancientprogresstwo);
	Info_AddChoice(dia_mage_li_ancientprogresstwo, " Давай, открывай! " ,dia_mage_li_ancientprogresstwo_freedemon);
};

func void dia_mage_li_ancientprogresstwo_freedemon()
{
	AI_StopProcessInfos(self);
	MEANDMILTENTELEPORTDC = TRUE;
	B_UseFakeScroll();
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN");
	Wld_SendTrigger("LI_TRIGGER_TELEPORTDC");
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTHREE(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogressthree_condition;
	information = dia_mage_li_ancientprogressthree_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogressthree_condition()
{
	if((MIS_MILTENANCIENT == LOG_Running) && (MEANDMILTENTELEPORTDC == TRUE) && (MEANDMILTENTELEPORTDCDONE == TRUE) && (Hlp_StrCmp(Npc_GetNearestWP(self),"DEM_CAVE_01") == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressthree_info()
{
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressThree_01_01 " );	// (confused) Damn! Where are we, and what was it all about?
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressThree_01_03 " );	// We shouldn't have opened this book - ancient magic is no joke!
	AI_Output(other,self, " DIA_Mage_LI_AncientProgressThree_01_04 " );	// And what do we do now?
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressThree_01_05 " );	// Are you asking me? I have no idea!
	AI_Output(other,self, " DIA_Mage_LI_AncientProgressThree_01_06 " );	// Okay, don't worry! We'll come up with something.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_01_07");	//Да уж...
	AI_Output(other,self, " DIA_Mage_LI_AncientProgressThree_01_08 " );	// Let's go explore this cave.
	AI_Output(self,other,"DIA_Mage_LI_AncientProgressThree_01_09");	//Хорошо!
	B_LogEntry( TOPIC_MILTENANCIENT , " Milten and I ended up in some kind of cave deep underground. I wonder where we got this time? " );
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTHREE_SLEEP(C_Info)
{
	npc = pc_mage_li;
	nr = 14;
	condition = dia_mage_li_ancientprogressthree_sleep_condition;
	information = dia_mage_li_ancientprogressthree_sleep_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogressthree_sleep_condition()
{
	if(((Npc_GetDistToWP(self,"EASTER_SKELETON_3") < 2000) || (Npc_GetDistToWP(self,"EASTER_SKELETON_2") < 2000) || (Npc_GetDistToWP(self,"EASTER_ASH") < 5000)) && (self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_MILTENANCIENT == LOG_Running) && (LIDEMCAVEAWAY != TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressthree_sleep_info()
{
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressThree_SLEEP_01_01 " );	// Damn!!! What the hell is fire-breathing?
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressThree_SLEEP_01_02 " );	// I just wanted to try out one rune!
	AI_StopProcessInfos(self);
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTHREE_WAIT(C_Info)
{
	npc = pc_mage_li;
	nr = 13;
	condition = dia_mage_li_ancientprogressthree_wait_condition;
	information = dia_mage_li_ancientprogressthree_wait_info;
	permanent = TRUE;
	description = " Wait here! " ;
};


func int dia_mage_li_ancientprogressthree_wait_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_MILTENANCIENT == LOG_Running) && (LIDEMCAVEAWAY != TRUE) && (MEANDMILTENTELEPORTDC == TRUE) && (MEANDMILTENTELEPORTDCDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressthree_wait_info()
{
	AI_Output(other,self, " DIA_Addon_Diego_WarteHier_15_00 " );	// Wait here!
	AI_Output(self,other, " DIA_Mage_LI_GoHome_11_05 " );	// I'll wait nearby.
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"CAVE");
};


instance DIA_MAGE_LI_ANCIENTPROGRESSTHREE_FOLL(C_Info)
{
	npc = pc_mage_li;
	nr = 12;
	condition = dia_mage_li_ancientprogressthree_foll_condition;
	information = dia_mage_li_ancientprogressthree_foll_info;
	permanent = TRUE;
	description = " Come with me. " ;
};


func int dia_mage_li_ancientprogressthree_foll_condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == FALSE) && (LIDEMCAVEAWAY != TRUE) && (MEANDMILTENTELEPORTDC == TRUE) && (MEANDMILTENTELEPORTDCDONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressthree_foll_info()
{
	AI_Output(other,self, " DIA_Addon_Diego_ComeOn_15_00 " );	// Come with me.
	AI_Output(self,other,"DIA_Mage_LI_ComeOn_11_02");	//Хорошо.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
};


instance DIA_MAGE_LI_ANCIENTPROGRESSDONE(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogressdone_condition;
	information = dia_mage_li_ancientprogressdone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogressdone_condition()
{
	if((MIS_MILTENANCIENT == LOG_Running) && (LIDEMONISDEAD == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDone_01_01 " );	// Are you all right?..(taking a breath) What kind of creature was that?!
	AI_Output(other,self, " DIA_Mage_LI_AncientProgressDone_01_04 " );	// Looks like a daemon. But now relax! Everything is already behind.
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDone_01_05 " );	// Okay... The good news is that he's no longer dangerous to us.
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDone_01_06 " );	// True, now we need to think about how to get out of this place. Do you have ideas?
	AI_Output(other,self, " DIA_Mage_LI_AncientProgressDone_01_07 " );	// I think I saw a teleport at the beginning of this tunnel.
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDone_01_10 " );	// Then let's go faster! And then I already have goosebumps from this cave.
	self.flags = 0;
	B_LogEntry( TOPIC_MILTENANCIENT , " This island seems to be full of surprises. We stumbled upon a huge dark demon in the cave. The creature turned out to be monstrously strong, but Milten and I still managed to defeat it. Now that the demon is dead, we must try to get out of this burial ground. " );
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_MAGE_LI_ANCIENTPROGRESSDONEEXT(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogressdoneext_condition;
	information = dia_mage_li_ancientprogressdoneext_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_ancientprogressdoneext_condition()
{
	if((MIS_MILTENANCIENT == LOG_Running) && (LIDEMCAVEAWAY == TRUE))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressdoneext_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDoneExt_01_01 " );	// Finally, it's all over.
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDoneExt_01_03 " );	// Fate taught us a good lesson for our imprudence!
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDoneExt_01_04 " );	// Good thing we're still alive! Otherwise things could have ended much worse for us...
	AI_Output(other,self, " DIA_Mage_LI_AncientProgressDoneExt_01_05 " );	// So everything is fine now?
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDoneExt_01_06 " );	// Yes. But I do feel like something has changed.
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDoneExt_01_08 " );	// I no longer feel the presence of the magical power that used to envelop this island. She disappeared!
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDoneExt_01_10 " );	// Apparently, the demon we killed in the cave was its source.
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDoneExt_01_11 " );	// I have no other explanation for all this.
	MIS_MILTENANCIENT = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_MILTENANCIENT,LOG_SUCCESS);
	B_LogEntry( TOPIC_MILTENANCIENT , " Something seems to have changed. Milten no longer senses the magic power that used to envelop this island. It most likely came from the demon we killed in the deep cave. " );
	MILTENDEMONTIMEREXT = Wld_GetDay();
};


instance DIA_MAGE_LI_ANCIENTPROGRESSDONEEXTBOOK(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientprogressdoneextbook_condition;
	information = dia_mage_li_ancientprogressdoneextbook_info;
	permanent = FALSE;
	description = " Do you have that book left? " ;
};


func int dia_mage_li_ancientprogressdoneextbook_condition()
{
	if(MIS_MILTENANCIENT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientprogressdoneextbook_info()
{
	AI_Output(other,self, " DIA_Mage_LI_AncientProgressDoneExtBook_01_01 " );	// Do you have that book with you?
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDoneExtBook_01_02 " );	// Yes, I still have it. Why are you asking?
	AI_Output(other,self, " DIA_Mage_LI_AncientProgressDoneExtBook_01_03 " );	// Could you give it to me?
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDoneExtBook_01_07 " );	// Apparently, what happened in the cave was not enough for you... (reproachfully)
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDoneExtBook_01_09 " );	// Okay. Here, take it.
	B_GiveInvItems(self,other,itwr_ancient,1);
	AI_Output(self,other, " DIA_Mage_LI_AncientProgressDoneExtBook_01_10 " );	// Be extremely careful!
};


instance DIA_MAGE_LI_ANCIENTAFTER(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_ancientafter_condition;
	information = dia_mage_li_ancientafter_info;
	permanent = TRUE;
	description = " Has anything else changed lately? " ;
};


func int dia_mage_li_ancientafter_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if((MIS_MILTENANCIENT == LOG_SUCCESS) && (MILTENDEMONTIMEREXT <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_mage_li_ancientafter_info()
{
	AI_Output(other,self, " DIA_Mage_LI_AncientAfter_01_01 " );	// Has anything else changed lately?
	if ( MILTENJOKE  ==  FALSE )
	{
		AI_Output(self,other, " DIA_Mage_LI_AncientAfter_01_02 " );	// No. All the same - quiet and calm.
		MILTENJOKE = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Mage_LI_AncientAfter_01_11 " );	// No.) Nothing like that.
	};
};


instance DIA_MILTEN_LI_TRADE(C_Info)
{
	npc = pc_mage_li;
	nr = 12;
	condition = dia_milten_li_trade_condition;
	information = dia_milten_li_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = " Do you have a couple of drinks? " ;
};


func int dia_milten_li_trade_condition()
{
	return TRUE;
};

func void dia_milten_li_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Milten_DI_TRADE_15_00 " );	// Got some extra potions?
	AI_Output(self,other, " DIA_Milten_DI_TRADE_03_01 " );	// As long as the supply is sufficient.

	if ( TRD_MAGELI  !=  TRUE )
	{
		CreateInvItems(self,ItPl_Temp_Herb,9);
		CreateInvItems(self,ItPl_Health_Herb_01,15);
		CreateInvItems(self,ItPl_Health_Herb_02,4);
		CreateInvItems(self,ItPl_Health_Herb_03,3);
		CreateInvItems(self,ItPl_Mana_Herb_01,13);
		CreateInvItems(self,ItPl_Mana_Herb_02,8);
		CreateInvItems(self,ItPl_Mana_Herb_03,2);
		CreateInvItems(self,ItPo_Health_02,5);
		CreateInvItems(self,ItPo_Health_03,2);
		CreateInvItems(self,ItPo_Mana_01,4);
		CreateInvItems(self,ItPo_Mana_02,2);
		CreateInvItems(self,ItMi_RuneBlank,1);
		CreateInvItems(self,ItPo_HealObsession_MIS,2);
		TRD_MAGELI = TRUE ;
	};
	if(Npc_HasItems(self,itpo_anpois) != 3)
	{
		Npc_RemoveInvItems(self,itpo_anpois,Npc_HasItems(self,itpo_anpois));
		CreateInvItems(self,itpo_anpois,3);
	};

	B_GiveTradeInv(self);
};


instance DIA_MILTEN_LI_TEACHMAGIC(C_Info)
{
	npc = pc_mage_li;
	nr = 31;
	condition = dia_milten_li_teachmagic_condition;
	information = dia_milten_li_teachmagic_info;
	permanent = TRUE;
	description = " I want to improve my magical abilities. " ;
};


func int dia_milten_li_teachmagic_condition()
{
	return TRUE;
};

func void dia_milten_li_teachmagic_info()
{
	AI_Output(other,self, " DIA_Milten_DI_TeachMagic_15_00 " );	// I want to increase my magical abilities.
	AI_Output(self,other, " DIA_Milten_DI_TeachMagic_03_03 " );	// Good. What do you require?
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_milten_li_teachmagic_mana_1);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_milten_li_teachmagic_mana_5);

	if((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE))
	{
		Info_AddChoice(dia_milten_li_teachmagic, " Create Rune " ,dia_milten_li_teachmagic_runes);
	};
};

func void dia_milten_li_teachmagic_runes()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	AI_Output(self,other, " DIA_Milten_DI_TeachMagic_RUNES_03_00 " );	// Oh no! I'm not much of an expert on this, but we'll manage somehow.

	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 4) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(dia_milten_li_teachmagic, " Circle Four " ,dia_milten_li_teachmagic_runen_circle_4);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 5) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(dia_milten_li_teachmagic, " Circle Five " ,dia_milten_li_teachmagic_runen_circle_5);
	};
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 6) && ((hero.guild == GIL_KDF) || (CHOOSEFIRE == TRUE)))
	{
		Info_AddChoice(dia_milten_li_teachmagic, " Circle Six " ,dia_milten_li_teachmagic_runen_circle_6);
	};
};

func void dia_milten_li_teachmagic_runen_circle_4()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	if(PLAYER_TALENT_RUNES[SPL_ChargeFireball] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_ChargeFireball,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_ChargeFireball)),dia_milten_li_teachmagic_runen_circle_4_spl_chargefireball);
	};
	if(PLAYER_TALENT_RUNES[93] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_FIRELIGHT,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_FIRELIGHT)),dia_milten_li_teachmagic_runen_circle_4_spl_firelight);
	};
};

func void dia_milten_li_teachmagic_runen_circle_4_spl_chargefireball()
{
	B_TeachPlayerTalentRunes(self,other,SPL_ChargeFireball);
};

func void dia_milten_li_teachmagic_runen_circle_4_spl_firelight()
{
	B_TeachPlayerTalentRunes(self,other,SPL_FIRELIGHT);
};

func void dia_milten_li_teachmagic_runen_circle_5()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);

	if(PLAYER_TALENT_RUNES[SPL_Pyrokinesis] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_Pyrokinesis,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Pyrokinesis)),dia_milten_li_teachmagic_runen_circle_5_spl_pyrokinesis);
	};
	if(PLAYER_TALENT_RUNES[SPL_Explosion] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_Explosion,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Explosion)),dia_milten_li_teachmagic_runen_circle_5_SPL_Explosion);
	};
};

func void dia_milten_li_teachmagic_runen_circle_5_spl_pyrokinesis()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Pyrokinesis);
};

func void dia_milten_li_teachmagic_runen_circle_5_SPL_Explosion()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Explosion);
};

func void dia_milten_li_teachmagic_runen_circle_6()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);

	if(PLAYER_TALENT_RUNES[SPL_Firerain] == FALSE)
	{
		Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforrunes(NAME_SPL_Firerain,B_GetLearnCostTalent(other,NPC_TALENT_RUNES,SPL_Firerain)),dia_milten_li_teachmagic_runen_circle_6_spl_firerain);
	};
};

func void dia_milten_li_teachmagic_runen_circle_6_spl_firerain()
{
	B_TeachPlayerTalentRunes(self,other,SPL_Firerain);
};

func void dia_milten_li_teachmagic_back()
{
	Info_ClearChoices(dia_milten_li_teachmagic);
};

func void dia_milten_li_teachmagic_mana_1()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,1,T_MAX))
	{
		AI_Output(self,other, " DIA_Milten_DI_TeachMagic_MANA_1_03_00 " );	// May the hand of Innos guide you.
	};
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_milten_li_teachmagic_mana_1);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_milten_li_teachmagic_mana_5);
};

func void dia_milten_li_teachmagic_mana_5()
{
	if(B_TeachAttributePoints(self,other,ATR_MANA_MAX,5,T_MAX))
	{
		AI_Output(self,other, " DIA_Milten_DI_TeachMagic_MANA_5_03_00 " );	// May Innos light your path.
	};
	Info_ClearChoices(dia_milten_li_teachmagic);
	Info_AddChoice(dia_milten_li_teachmagic,Dialog_Back,dia_milten_li_teachmagic_back);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA1,B_GetLearnCostAttribute(other,ATR_MANA_MAX)),dia_milten_li_teachmagic_mana_1);
	Info_AddChoice(dia_milten_li_teachmagic,b_buildlearnstringforskills(PRINT_LearnMANA5,B_GetLearnCostAttribute(other,ATR_MANA_MAX) * 5),dia_milten_li_teachmagic_mana_5);
};


instance DIA_MAGE_LI_PICKPOCKET(C_Info)
{
	npc = pc_mage_li;
	nr = 900;
	condition = dia_mage_li_pickpocket_condition;
	information = dia_mage_li_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_mage_li_pickpocket_condition()
{
	return  C_Robbery ( 45 , 120 );
};

func void dia_mage_li_pickpocket_info()
{
	Info_ClearChoices(dia_mage_li_pickpocket);
	Info_AddChoice(dia_mage_li_pickpocket,Dialog_Back,dia_mage_li_pickpocket_back);
	Info_AddChoice(dia_mage_li_pickpocket,DIALOG_PICKPOCKET,dia_mage_li_pickpocket_doit);
};

func void dia_mage_li_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_mage_li_pickpocket);
};

func void dia_mage_li_pickpocket_back()
{
	Info_ClearChoices(dia_mage_li_pickpocket);
};


instance DIA_MAGE_LI_MISSMYGOLD(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_missmygold_condition;
	information = dia_mage_li_missmygold_info;
	permanent = FALSE;
	description = " Do you happen to know where my gold is? " ;
};


func int dia_mage_li_missmygold_condition()
{
	if((BEGINGOLDSEEK == TRUE) && (MIS_MISSMYGOLD == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_mage_li_missmygold_info()
{
	AI_Output(other,self, " DIA_Mage_LI_MissMyGold_01_01 " );	// Do you happen to know where my gold is?
	AI_Output(self,other, " DIA_Mage_LI_MissMyGold_01_02 " );	// No, buddy. I do not know that.
	AI_Output(self,other, " DIA_Mage_LI_MissMyGold_01_05 " );	// The Firebender has absolutely no interest in this kind of thing!
	AI_Output(self,other, " DIA_Mage_LI_MissMyGold_01_06 " );	// For us, the most valuable substance is knowledge, not the brilliance of this despicable metal.
	B_LogEntry( TOPIC_MISSMYGOLD , " Milten has absolutely no idea what happened to my gold. " );
};


instance DIA_MAGE_LI_AWAY(C_Info)
{
	npc = pc_mage_li;
	nr = 3;
	condition = dia_mage_li_away_condition;
	information = dia_mage_li_away_info;
	permanent = FALSE;
	description = " Time to get back to the ship. " ;
};


func int dia_mage_li_away_condition()
{
	if((MIS_GATHERCREW == LOG_Running) && (MILTENLIONBOARD == FALSE))
	{
		return TRUE;
	};
};

func void dia_mage_li_away_info()
{
	var int countpeopple;
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Mage_LI_Away_01_01 " );	// Time to get back to the ship.
	AI_Output(self,other, " DIA_Mage_LI_Away_01_02 " );	// Are we leaving this island?
	AI_Output(other,self, " DIA_Mage_LI_Away_01_03 " );	// Yes. The ship is in perfect order, and now nothing prevents us from escaping from here.
	AI_Output(self,other, " DIA_Mage_LI_Away_01_04 " );	// Good! Then I'll be there soon.
	B_LogEntry( TOPIC_GATHERCREW , " I told Milten we're leaving the island. " );
	MILTENLIONBOARD = TRUE ;
	if((GORNLIHERE == TRUE) && (GORNLIONBOARD == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if (( MILTENLIONBOARD  ==  TRUE ) && ( MILTENLIHERE  ==  TRUE ))
	{
		countpeopple = countpeopple + 1;
	};
	if((LESTERLIONBOARD == TRUE) && (LESTERLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((DIEGOLIONBOARD == TRUE) && (DIEGOLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((ANGARLIONBOARD == TRUE) && (ANGARLIHERE == TRUE))
	{
		countpeopple = countpeopple + 1;
	};
	if((COUNTPEOPLEONBEACH <= countpeopple) && (LICREWONBOARD == FALSE))
	{
		LICREWONBOARD = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_MAGE_LI_FINDMAGICORECAVE(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_findmagicorecave_condition;
	information = dia_mage_li_findmagicorecave_info;
	permanent = FALSE;
	description = " I found a cave with magical ore deposits. " ;
};


func int dia_mage_li_findmagicorecave_condition()
{
	if((MIS_FINDMAGICORECAVE == LOG_Running) && (LIBEFORETESTOK == FALSE) && (LITESTOK == FALSE) && (GOTOORECAPITAN == FALSE))
	{
		return TRUE;
	};
};

func void dia_mage_li_findmagicorecave_info()
{
	AI_Output(other,self, " DIA_Mage_LI_FindMagicOreCave_01_01 " );	// I found a cave with magical ore deposits.
	AI_Output(self,other, " DIA_Mage_LI_FindMagicOreCave_01_02 " );	// Really? Then you should talk to our captain about it.
	AI_Output(self,other, " DIA_Mage_LI_FindMagicOreCave_01_03 " );	// I think he will be interested to hear this news.
	GOTOORECAPITAN = TRUE;
};


instance DIA_MAGE_LI_CHANGECOURSE(C_Info)
{
	npc = pc_mage_li;
	nr = 2;
	condition = dia_mage_li_changecourse_condition;
	information = dia_mage_li_changecourse_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_mage_li_changecourse_condition()
{
	if((MIS_CHANGECOURSE == LOG_Running) && Npc_IsInState(self,ZS_Talk) && (MIS_MILTENANCIENT != LOG_Running))
	{
		return TRUE;
	};
};

func void dia_mage_li_changecourse_info()
{
	B_GivePlayerXP(50);
	AI_Output(self,other, " DIA_Mage_LI_ChangeCourse_01_00 " );	// I heard you want to go back to Khorinis to inform the paladins about the ore?
	AI_Output(self,other, " DIA_Mage_LI_ChangeCourse_01_03 " );	// Lord Hagen needs to know about this. And for sure this news will be able to instill some hope in many.
	AI_Output(other,self, " DIA_Mage_LI_ChangeCourse_01_04 " );	// Will you go with me?
	AI_Output(self,other, " DIA_Mage_LI_ChangeCourse_01_05 " );	// Of course. Helping the king's paladins is my sacred duty to Innos.
	AI_Output(self,other, " DIA_Mage_LI_ChangeCourse_01_06 " );	// Also, the magicians in the monastery may need help soon.
	AI_Output(self,other, " DIA_Mage_LI_ChangeCourse_01_07 " );	// If the orcs suddenly decide to pass through the pass, then they are all in for extremely hard times.
	AI_Output(other,self, " DIA_Mage_LI_ChangeCourse_01_10 " );	// Glad to hear it, Milten!
	B_LogEntry( TOPIC_CHANGECOURSE , " Milten is glad we decided to return to Khorinis. He will sail with us. " );
	CREWAGREEAWAYBACKPAL = CREWAGREEAWAYBACKPAL + 1;
	COUNTPEOPLEDECIDEPRG = COUNTPEOPLEDECIDEPRG + 1;
	if(COUNTPEOPLEDECIDEPRG >= COUNTPEOPLEDECIDE)
	{
		READYCHANGECOURSE = TRUE;
		Log_AddEntry( TOPIC_CHANGECOURSE , " I think I've talked to all the guys. Time to tell our captain. " );
	};
};

