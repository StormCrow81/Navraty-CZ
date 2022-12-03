
instance DIA_HUN_741_FALK_EXIT(C_Info)
{
	npc = hun_741_falk;
	nr = 999;
	condition = dia_hun_741_falk_exit_condition;
	information = dia_hun_741_falk_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_hun_741_falk_exit_condition()
{
	return TRUE;
};

func void dia_hun_741_falk_exit_info()
{
	AI_StopProcessInfos(self);
	AI_EquipBestMeleeWeapon(self);
	AI_EquipBestRangedWeapon(self);
};

instance DIA_HUN_741_FALK_BACKSWORD(C_Info)
{
	npc = hun_741_falk;
	nr = 1;
	condition = dia_hun_741_falk_backsword_condition;
	information = dia_hun_741_falk_backsword_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hun_741_falk_backsword_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Npc_HasItems(self,itmw_2h_master_01) == 0) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_backsword_info()
{
	AI_Output(self,other, " DIA_HUN_741_Falk_BackSword_01_00 " );	// Before we discuss anything, there's one thing you need to do.
	AI_Output(other,self, " DIA_HUN_741_Falk_BackSword_01_01 " );	// Which one exactly?
	AI_Output(self,other, " DIA_HUN_741_Falk_BackSword_01_02 " );	// (terribly) Give me back my sword!
	Info_ClearChoices(dia_hun_741_falk_backsword);

	if(Npc_HasItems(other,itmw_2h_master_01) > 0)
	{
		Info_AddChoice(dia_hun_741_falk_backsword, " Джи свой ме! " ,dia_hun_741_falk_backsword_yes);
	};

	Info_AddChoice(dia_hun_741_falk_backsword,"Как же!",dia_hun_741_falk_backsword_no);
};

func void dia_hun_741_falk_backsword_yes()
{
	B_GiveInvItems(other,self,itmw_2h_master_01,1);
	Npc_RemoveInvItems(other,itmw_2h_master_01,Npc_HasItems(other,itmw_2h_master_01));
	AI_Output(other,self,"DIA_Rod_GiveItBack_15_00");	//Держи.
	AI_Output(self,other, " DIA_Falk_BackSword_06_01 " );	// Just in time!
	Info_ClearChoices(dia_hun_741_falk_backsword);
};

func void dia_hun_741_falk_backsword_no()
{
	AI_Output(other,self, " DIA_Rod_Wette_KeepIt_15_02 " );	// I think I'll keep it for now.
	AI_Output(self,other, " DIA_Falk_KeepIt_06_03 " );	// Wait, you bastard!
	Info_ClearChoices(dia_hun_741_falk_backsword);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_HUN_741_FALK_HELLO(C_Info)
{
	npc = hun_741_falk;
	nr = 1;
	condition = dia_hun_741_falk_hello_condition;
	information = dia_hun_741_falk_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_hun_741_falk_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hello_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);

	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_Hello_01_00 " );	// Hey buddy! Are you a hunter too?
		AI_Output(other,self, " DIA_HUN_741_Falk_Hello_01_01 " );	// Where did you get it from?
		AI_Output(self,other, " DIA_HUN_741_Falk_Hello_01_02 " );	// You're wearing hunting clothes. Only hunters wear such armor.
		AI_Output(self,other, " DIA_HUN_741_Falk_Hello_01_04 " );	// We're always happy to have guys like you in our camp.
		AI_Output(self,other, " DIA_HUN_741_Falk_Hello_01_05 " );	// Come on, sit down closer to the light, take a break from the road...
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_Hello_01_06 " );	// Hey, who are you? And what are you doing here?
		AI_Output(other,self, " DIA_HUN_741_Falk_Hello_01_07 " );	// Me? Yes, just walking, breathing air ...
		AI_Output(self,other, " DIA_HUN_741_Falk_Hello_01_08 " );	// Kid, it's pretty dangerous out here for weaklings like you!
		AI_Output(self,other, " DIA_HUN_741_Falk_Hello_01_11 " );	// I'll give you advice: look for another place to walk.
		AI_StopProcessInfos(self);
	};
};


instance DIA_HUN_741_FALK_NEWS(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_news_condition;
	information = dia_hun_741_falk_news_info;
	permanent = TRUE;
	description = " What's new in camp? " ;
};

func int dia_hun_741_falk_news_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_news_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_News_01_00 " );	// What's new in the camp?

	if (chapter ==  1 )
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_01 " );	// Nothing like this has happened here lately.
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_02 " );	// Well, except that there's a new hunter in our camp.
		AI_Output(other,self, " DIA_HUN_741_Falk_News_01_03 " );	// You mean me, am I right?
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_04 " );	// Of course...(laughs) I knew you were a smart guy.
	}
	else  if ((Chapter ==  2 ) && ( MIS_INSORCWARRIOR  ==  FALSE ))
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_07 " );	// Recently, Barem and Raffa, on their way back to the camp, stumbled upon a small band of orcs in the forest.
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_08 " );	// The guys barely got away from these creatures. And there were at least ten orcs.
		AI_Output(other,self, " DIA_HUN_741_Falk_News_01_09 " );	// And what is so surprising here?
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_10 " );	// Like what? Yes, in these places there have never been so many orcs, and even armed to the teeth!
		AI_Output(other,self, " DIA_HUN_741_Falk_News_01_12 " );	// Where exactly did they meet these creatures?
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_13 " );	// I think Barem said it happened near Akila's farm. But if I were you, I wouldn't even think of messing with them.
		MIS_INSORCWARRIOR = LOG_Running;
		Log_CreateTopic(TOPIC_INSORCWARRIOR,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_INSORCWARRIOR,LOG_Running);
		B_LogEntry( TOPIC_INSORCWARRIOR , " Falk told me that a couple of hunters recently came across a small band of orcs in the woods near Akila's farm. I had an idea to hunt them. " );
		Wld_InsertNpc(orcwarrior_roam_hunt_01,"FP_ROAM_NW_HUNTORK_01");
		Wld_InsertNpc(orcwarrior_roam_hunt_02,"FP_ROAM_NW_HUNTORK_02");
		Wld_InsertNpc(orcwarrior_roam_hunt_03,"FP_ROAM_NW_HUNTORK_03");
		Wld_InsertNpc(orcwarrior_roam_hunt_04,"FP_ROAM_NW_HUNTORK_04");
		Wld_InsertNpc(orcwarrior_roam_hunt_05,"FP_ROAM_NW_HUNTORK_05");
		Wld_InsertNpc(orcwarrior_roam_hunt_06,"FP_ROAM_NW_HUNTORK_06");
		Wld_InsertNpc(orcwarrior_roam_hunt_07,"FP_ROAM_NW_HUNTORK_07");
		Wld_InsertNpc(orcwarrior_roam_hunt_08,"FP_ROAM_NW_HUNTORK_08");
	}
	else  if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_15 " );	// Have you met any of them yet?
		AI_Output(other,self, " DIA_HUN_741_Falk_News_01_16 " );	// Yes, it happened several times.
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_18 " );	// I'll tell you honestly - they are too suspicious. They're acting weird!
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_21 " );	// All the guys are on their nerves because of these types.
		AI_Output(other,self, " DIA_HUN_741_Falk_News_01_23 " );	// Calm down. I think everything will work out.
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_24 " );	// Hope you're right.
	}
	else  if (chapter ==  4 )
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_25 " );	// Several mercenaries came here recently.
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_27 " );	// Offered me and our boys to join them for dragon hunting.
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_28 " );	// But we're not out of our minds yet! After all, it is certain death.
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_31 " );	// And I don't see the point in throwing away my life for a couple of gold coins.
	}
	else  if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_33 " );	// Nothing in the camp. But outside it becomes more and more dangerous!
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_34 " );	// From the passage to the Valley of Mines, more and more monsters constantly come.
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_35 " );	// If things go on like this - soon everything will be just teeming with them.
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_36 " );	// Not to mention orcs!
	}
	else  if (chapter ==  6 )
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_37 " );	// All the guys lose their nerves. This orc situation is just terrible.
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_38 " );	// I've heard what these creatures have done in the city, and I imagine what awaits everyone else.
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_39 " );	// And what are paladins thinking about?
		AI_Output(other,self, " DIA_HUN_741_Falk_News_01_40 " );	// It's hard for paladins to stop such hordes of orcs alone! There are too few of them.
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_41 " );	// Then we have little chance at all.
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_42 " );	// But let's hope for the best.
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_News_01_43 " );	// Everything is as usual. Nothing new.
	};
};


instance DIA_HUN_741_FALK_INSORCWARRIOR (C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_insorcwarrior_condition;
	information = dia_hun_741_falk_insorcwarrior_info;
	permanent = FALSE;
	description = " I finished off those orcs! " ;
};


func int dia_hun_741_falk_insorcwarrior_condition()
{
	if (( MIS_INSORCWARRIOR  == LOG_Running) && Npc_IsDead(orcwarrior_roam_hunt_01) && Npc_IsDead(orcwarrior_roam_hunt_02) && Npc_IsDead(orcwarrior_roam_hunt_03) && Npc_IsDead(orcwarrior_roam_hunt_04) && Npc_IsDead(orcwarrior_roam_hunt_05) && Npc_IsDead(orcwarrior_roam_hunt_06) && Npc_IsDead(orcwarrior_roam_hunt_07) && Npc_IsDead(orcwarrior_roam_hunt_08))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_insorcwarrior_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_HUN_741_Falk_InsOrcWarrior_01_00 " );	// I finished off those orcs that Barem and Raffa stumbled upon while hunting.
	AI_Output(self,other, " DIA_HUN_741_Falk_InsOrcWarrior_01_03 " );	// What?! Are you serious?
	AI_Output(self,other, " DIA_HUN_741_Falk_InsOrcWarrior_01_05 " );	// Well... I don't even know what to say.
	AI_Output(self,other, " DIA_HUN_741_Falk_InsOrcWarrior_01_06 " );	// You hit me, boy. We are very grateful to you.
	MIS_INSORCWARRIOR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_INSORCWARRIOR,LOG_SUCCESS);
	B_LogEntry( TOPIC_INSORCWARRIOR , " Falk was surprised to learn that I was able to deal with these orcs. " );
};


instance DIA_HUN_741_FALK_LEADER(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_leader_condition;
	information = dia_hun_741_falk_leader_info;
	permanent = FALSE;
	description = " Are you in charge here? " ;
};

func int dia_hun_741_falk_leader_condition()
{
	if (( HEROISHUNTER  ==  FALSE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_leader_info()
{
	var C_Item itm;

	itm = Npc_GetEquippedArmor(other);

	AI_Output(other,self, " DIA_HUN_741_Falk_Leader_01_00 " );	// Are you in charge here?

	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_Leader_01_01 " );	// Sort of. Let's just say I'm the most experienced here.
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_Leader_01_02 " );	// (dryly) It doesn't concern you much. Better get lost!
		AI_StopProcessInfos(self);
	};
};

instance DIA_HUN_741_FALK_JOIN(C_Info)
{
	npc = hun_741_falk;
	nr = 5;
	condition = dia_hun_741_falk_join_condition;
	information = dia_hun_741_falk_join_info;
	permanent = FALSE;
	description = " I want to join you. " ;
};

func int dia_hun_741_falk_join_condition()
{
	if ( Npc_KnowsInfo ( other , dia_hun_741_falk_leader ) && ( HEROISHUNTER  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_join_info()
{
	var C_Item itm;

	itm = Npc_GetEquippedArmor(other);

	AI_Output(other,self, " DIA_HUN_741_Falk_Join_01_00 " );	// I want to join you.

	if(Hlp_IsItem(itm,ITAR_Leather_L) == TRUE)
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_Join_01_09_1 " );	// That you're wearing a hunter's armor...
		AI_Output(self,other, " DIA_HUN_741_Falk_Join_01_09_2 " );	// ...still does not convince me that you are a hunter and that you are worthy to join us.
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_DuelWon_Hunter_01_01 " );	// Do you want to become a hunter?
		AI_Output(self,other, " DIA_HUN_741_Falk_DuelWon_Hunter_01_02 " );	// (laughs) What can you do?
		AI_Output(other,self, " DIA_HUN_741_Falk_DuelWon_Hunter_01_03 " );	// Well... I'm a pretty fast learner!
		AI_Output(self,other, " DIA_HUN_741_Falk_DuelWon_Hunter_01_07 " );	// Oh, okay! I don't think you can just leave me alone.
		AI_Output(other,self, " DIA_HUN_741_Falk_Join_01_03 " );	// So you agree to accept me?
		AI_Output(self,other, " DIA_HUN_741_Falk_Join_01_10 " );	// Maybe...
		AI_Output(self,other, " DIA_HUN_741_Falk_DuelWon_Hunter_01_13 " );	// But first, show what you can do.
	};

	AI_Output(self,other, " DIA_HUN_741_Falk_Join_01_91 " );	// Bring me three mrakoris skins, then we'll talk.
	MIS_SKINBLACKTROLLFALK = LOG_Running;
	Log_CreateTopic(TOPIC_SKINBLACKTROLLFALK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SKINBLACKTROLLFALK,LOG_Running);
	B_LogEntry( TOPIC_SKINBLACKTROLLFALK , " Falk needs 3 mrakoris skins, and then maybe he'll take me to the hunter camp. " );
	AI_StopProcessInfos(self);
};

instance DIA_HUN_741_FALK_CAMP(C_Info)
{
	npc = hun_741_falk;
	nr = 4;
	condition = dia_hun_741_falk_camp_condition;
	information = dia_hun_741_falk_camp_info;
	permanent = FALSE;
	description = " I brought the hides of the mrakoris. " ;
};

func int dia_hun_741_falk_camp_condition()
{
	if (( MY_SKINBLACKTROLLFALK  == LOG_Running) && (Npc_HasItems(other,ItAt_ShadowFur) >=  3 ) && ( HEROISHUNTER  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_camp_info()
{
	var C_Item itm;

	itm = Npc_GetEquippedArmor(other);

	AI_Output(other,self, " DIA_HUN_741_Falk_Camp_01_90 " );	// I brought the skins of the mrakoris.
	B_GiveInvItems(other,self,ItAt_ShadowFur,3);
	Npc_RemoveInvItems(self,ItAt_ShadowFur,3);
	AI_Output(self,other, " DIA_HUN_741_Falk_Camp_01_03 " );	// Can't be! And you're a no-brainer guy! Who would have thought.
	AI_Output(other,self, " DIA_HUN_741_Falk_Join_01_03 " );	// So are you willing to accept me?
	AI_Output(self,other, " DIA_HUN_741_Falk_Join_01_04 " );	// Yes. Make yourself at home - now this is your camp too.

	if(Hlp_IsItem(itm,ITAR_Leather_L) == FALSE)
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_DuelWon_Hunter_01_09 " );	// Yes, and more. Throw out those clothes you have on.
		AI_Output(self,other, " DIA_HUN_741_Falk_DuelWon_Hunter_01_12 " );	// I have a decent set of hunting armor. Take him.
		B_GiveInvItems(self,other,ITAR_Leather_L,1);
	};

	HEROISHUNTER = TRUE;
	MIS_SKINBLACKTROLLFALK = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_SKINBLACKTROLLFALK,LOG_SUCCESS);
	B_LogEntry( TOPIC_SKINBLACKTROLLFALK , " I've brought Falk three darkoris skins. " );
	MIS_HUNTERSWORK = LOG_Running;
	Log_CreateTopic(TOPIC_HUNTERSWORK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HUNTERSWORK,LOG_Running);
	B_LogEntry_Quiet( TOPIC_HUNTERSWORK , " Falk accepted me to the hunters' camp. " );
};

instance DIA_HUN_741_Falk_MakeHuntArmor (C_Info)
{
	npc = HUN_741_Falk;
	nr = 1;
	condition = DIA_HUN_741_Falk_MakeHuntArmor_condition;
	information = DIA_HUN_741_Falk_MakeHuntArmor_info;
	permanent = FALSE;
	description = " Do you have better armor? " ;
};

func int DIA_HUN_741_Falk_MakeHuntArmor_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void DIA_HUN_741_Falk_MakeHuntArmor_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_MakeHuntArmor_01_00 " );	// Do you have better armor?
	AI_Output(self,other, " DIA_HUN_741_Falk_MakeHuntArmor_01_01 " );	// (thoughtfully) If for sale, then no.
	AI_Output(self,other, " DIA_HUN_741_Falk_MakeHuntArmor_01_02 " );	// But since you're one of us...
	AI_Output(self,other, " DIA_HUN_741_Falk_MakeHuntArmor_01_03 " );	// ...then I could teach you how to make armor from the skins of various animals.
	AI_Output(self,other, " DIA_HUN_741_Falk_MakeHuntArmor_01_04 " );	// They are much stronger and more durable than usual and will be able to reliably protect you during the hunt.
	AI_Output(other,self, " DIA_HUN_741_Falk_MakeHuntArmor_01_05 " );	// Interesting!
	AI_Output(self,other, " DIA_HUN_741_Falk_MakeHuntArmor_01_06 " );	// Not so fast, my friend. First you have to prove that you deserve it!
	AI_Output(self,other, " DIA_HUN_741_Falk_MakeHuntArmor_01_07 " );	// I need to make sure I'm passing on my knowledge to a real hunter, not a log with a bow in hand.
	AI_Output(self,other, " DIA_HUN_741_Falk_MakeHuntArmor_01_08 " );	// Let's agree this: I won't charge you gold for training...
	AI_Output(self,other, " DIA_HUN_741_Falk_MakeHuntArmor_01_09 " );	// ...but for each lesson, I'll ask you to bring me some rare trophy.
	AI_Output(self,other, " DIA_HUN_741_Falk_MakeHuntArmor_01_10 " );	// Only it should be really rare, if you know what I'm talking about. Well, agreed?
	AI_Output(other,self, " DIA_HUN_741_Falk_MakeHuntArmor_01_11 " );	// Deal!
	AI_Output(self,other, " DIA_HUN_741_Falk_MakeHuntArmor_01_12 " );	// That's nice. Then I'm waiting for you back and, I hope, not empty-handed.
	FalkCanTeachArmor = TRUE;
	Log_CreateTopic(TOPIC_TalentHuntArmor,LOG_NOTE);
	B_LogEntry(TOPIC_TalentHuntArmor, " Falk can teach me how to make hunting armor from animal skins. For each lesson, he wants to get some rare trophy. " );
};

instance DIA_HUN_741_Falk_TeachHuntArmor(C_Info)
{
	npc = HUN_741_Falk;
	nr = 1;
	condition = DIA_HUN_741_Falk_TeachHuntArmor_condition;
	information = DIA_HUN_741_Falk_TeachHuntArmor_info;
	permanent = TRUE;
	description = " Regarding rare loot... " ;
};

func int DIA_HUN_741_Falk_TeachHuntArmor_condition()
{
	if((HEROISHUNTER == TRUE) && (FalkCanTeachArmor == TRUE) && ((FalkCanTeachArmor_01 == FALSE) || (FalkCanTeachArmor_02 == FALSE) || (FalkCanTeachArmor_03 == FALSE) || (FalkCanTeachArmor_04 == FALSE)))
	{
		return TRUE;
	};
};

func void DIA_HUN_741_Falk_TeachHuntArmor_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_TeachHuntArmor_01_00 " );	// Regarding the rare trophies you are interested in.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_01_01 " );	// Yes? What will make you happy?

	Info_ClearChoices(DIA_HUN_741_Falk_TeachHuntArmor);
	Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor,Dialog_Back,DIA_HUN_741_Falk_TeachHuntArmor_Back);

	if((Npc_HasItems(other,ItAt_XtoneClaw) >= 1) && (FalkCanTeachArmor_01 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor, " (give stone claw) " ,DIA_HUN_741_Falk_TeachHuntArmor_H1);
	};
	if((Npc_HasItems(other,ItAt_DlackTeeth) >= 1) && (FalkCanTeachArmor_02 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor, " (Give Black Fang) " ,DIA_HUN_741_Falk_TeachHuntArmor_H2);
	};
	if((Npc_HasItems(other,ItAt_GturTrollHorn) >= 1) && (FalkCanTeachArmor_03 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor, " (отдать рог Утура) " ,DIA_HUN_741_Falk_TeachHuntArmor_H3);
	};
	if((Npc_HasItems(other,ItAt_CaveBlackFurTroll) >= 1) && (FalkCanTeachArmor_04 == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmor, " (Give Black Cave Troll Hide) " ,DIA_HUN_741_Falk_TeachHuntArmor_H4);
	};
};

func void DIA_HUN_741_Falk_TeachHuntArmor_Back()
{
	Info_ClearChoices(DIA_HUN_741_Falk_TeachHuntArmor);
};

func void DIA_HUN_741_Falk_TeachHuntArmor_H1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAt_XtoneClaw,1);
	Npc_RemoveInvItems(self,ItAt_XtoneClaw,1);

	if(Trophy_StoneClaw == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_StoneClaw,Npc_HasItems(other,ItUt_StoneClaw));
		Trophy_StoneClaw = FALSE;
	};

	AI_Output(other,self, " DIA_HUN_741_Falk_TeachHuntArmor_H1_01_00 " );	// Here, take this stone claw.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_H1_01_01 " );	// How interesting! It seems to be a really rare thing.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_H1_01_02 " );	// Well, for that, I'll teach you how to make armor from wolf skins.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_H1_01_03 " );	// Tell me when you're ready, and we'll get started right away.
	FalkCanTeachArmor_01 = TRUE;
	B_LogEntry(TOPIC_TalentHuntArmor, " I brought Falk a stone claw. In return, he will teach me how to make wolfskin armor. " );
};


func void DIA_HUN_741_Falk_TeachHuntArmor_H2()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItAt_DlackTeeth,1);
	Npc_RemoveInvItems(self,ItAt_DlackTeeth,1);

	if(Trophy_BlackTeeth == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_BlackTeeth,Npc_HasItems(other,ItUt_BlackTeeth));
		Trophy_BlackTeeth = FALSE;
	};

	AI_Output(other,self, " DIA_HUN_741_Falk_TeachHuntArmor_H2_01_00 " );	// I'm sure you'll be interested in this fang.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_H2_01_01 " );	// Hmmm... Yes, you're right! A very unusual item.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_H2_01_02 " );	// Well, for that, I'll teach you how to make warg hide armor.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_H2_01_03 " );	// Tell me when you're ready, and we'll get started right away.
	FalkCanTeachArmor_02 = TRUE;
	B_LogEntry(TOPIC_TalentHuntArmor, " I brought a black fang to Falk. Now he will teach me how to make warg hide armor. " );
};


func void DIA_HUN_741_Falk_TeachHuntArmor_H3()
{
	B_GivePlayerXP(300);
	B_GiveInvItems(other,self,ItAt_GturTrollHorn,1);
	Npc_RemoveInvItems(self,ItAt_GturTrollHorn,1);

	if(Trophy_UturTrollHorn == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItUt_UturTrollHorn,Npc_HasItems(other,ItUt_UturTrollHorn));
		Trophy_UturTrollHorn = FALSE;
	};

	AI_Output(other,self, " DIA_HUN_741_Falk_TeachHuntArmor_H3_01_00 " );	// Here, take this horn.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_H3_01_01 " );	// Whoa, buddy! For the first time in my life I see such a thing. Who did you take it from?
	AI_Output(other,self, " DIA_HUN_741_Falk_TeachHuntArmor_H3_01_02 " );	// From a very huge and evil troll.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_H3_01_03 " );	// Okay, hero. In that case, I will teach you how to make armor from the skins of these gigantic creatures.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_H3_01_04 " );	// Tell me when you're ready.
	FalkCanTeachArmor_03 = TRUE;

	if(SBMode == FALSE)
	{
		FalkCanTeachArmor_04 = TRUE;
	};

	; _ _ _ _
};


func void DIA_HUN_741_Falk_TeachHuntArmor_H4()
{
	B_GivePlayerXP(1000);
	B_GiveInvItems(other,self,ItAt_CaveBlackFurTroll,1);
	Npc_RemoveInvItems(self,ItAt_CaveBlackFurTroll,1);
	AI_Output(other,self, " DIA_HUN_741_Falk_TeachHuntArmor_H4_01_00 " );	// This skin is for you.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_H4_01_01 " );	// Oh, Innos! Did you manage to fill up the cave black troll?!
	AI_Output(other,self, " DIA_HUN_741_Falk_TeachHuntArmor_H4_01_02 " );	// As you can see.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_H4_01_03 " );	// Incredible! I have not yet met a single person who has succeeded in this.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_H4_01_04 " );	// Well, as a sign of respect to you and my gratitude...
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_H4_01_05 " );	// ...I will teach you how to create armor that will make you a true master of the hunt.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmor_H4_01_06 " );	// Even I can't afford to wear this kind of armor. So believe me, it's a huge honor!
	AI_Output(other,self, " DIA_HUN_741_Falk_TeachHuntArmor_H4_01_07 " );	// No doubt.
	FalkCanTeachArmor_04 = TRUE;
	B_LogEntry(TOPIC_TalentHuntArmor, " I brought Falk a Black Cave Troll Hide. He was impressed, and as a token of respect, he will now teach me how to make Black Troll Hide Armor. " );
};

var int TeachHuntArmorFT;

instance DIA_HUN_741_Falk_TeachHuntArmorDone(C_Info)
{
	npc = HUN_741_Falk;
	nr = 1;
	condition = DIA_HUN_741_Falk_TeachHuntArmorDone_condition;
	information = DIA_HUN_741_Falk_TeachHuntArmorDone_info;
	permanent = TRUE;
	description = " Teach me how to make skin armor. " ;
};

func int DIA_HUN_741_Falk_TeachHuntArmorDone_condition()
{
	if((HEROISHUNTER == TRUE) && (FalkCanTeachArmorDone == FALSE) && ((FalkCanTeachArmor_01 == TRUE) || (FalkCanTeachArmor_02 == TRUE) || (FalkCanTeachArmor_03 == TRUE) || (FalkCanTeachArmor_04 == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_TeachHuntArmorDone_01_00 " );	// Teach me how to make skin armor.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_01_01 " );	// Good! What kind of armor do you want to make?

	Info_ClearChoices(DIA_HUN_741_Falk_TeachHuntArmorDone);
	Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone,Dialog_Back,DIA_HUN_741_Falk_TeachHuntArmorDone_Back);

	if((FalkCanTeachArmor_01 == TRUE) && (Know_HuntArmor_01 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone, " Wolfhide Armor " ,DIA_HUN_741_Falk_TeachHuntArmorDone_H1);
	};
	if((FalkCanTeachArmor_02 == TRUE) && (Know_HuntArmor_02 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone, " Warg Hide Armor " ,DIA_HUN_741_Falk_TeachHuntArmorDone_H2);
	};
	if((FalkCanTeachArmor_03 == TRUE) && (Know_HuntArmor_03 == FALSE))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone, " Troll Skin Armor " ,DIA_HUN_741_Falk_TeachHuntArmorDone_H3);
	};
	if((FalkCanTeachArmor_04 == TRUE) && (Know_HuntArmor_04 == FALSE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		Info_AddChoice(DIA_HUN_741_Falk_TeachHuntArmorDone, " Black Troll Hide Armor " ,DIA_HUN_741_Falk_TeachHuntArmorDone_H4);
	};
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_Back()
{
	Info_ClearChoices(DIA_HUN_741_Falk_TeachHuntArmorDone);
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_H1()
{
	if(TeachHuntArmorFT == FALSE)
	{
    		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_00 " );   // Okay, listen carefully! To get started, you will need a skinner and a carving knife.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_01 " );   // And, of course, wolf skins. Collect more of them. You also need claws and fangs.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_02 " );   // Of all the skins, choose the largest and smallest.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_03 " );   // Set aside the big one, get rid of the paws and ventral edges of the small one, leaving only that strip of skin that covers the back of the creature - this area is the most heat retaining and is great for a belt.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_04 " );   // Next, you cut out the same strips from the skins, which is larger, throw them over your shoulders, wrapping your chest securely - the hunter's lungs need to be protected.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_05 " );   // You fix the ends of the strips behind your back with a clasp of two strong claws.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_06 " );   // Well, it's the turn of the biggest skin. You throw it on your back, fasten it in front, using fangs instead of buttons.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_07 " );   // That's all.
		TeachHuntArmorFT = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_08 " );   // Okay, listen carefully!
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_09 " );   // Naturally, you'll need wolf skins. Collect more of them. You also need claws and fangs.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_10 " );   // Of all the skins, choose the largest and smallest.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_11 " );   // Set aside the big one, get rid of the paws and ventral edges of the small one, leaving only that strip of skin that covers the back of the creature - this area is the most heat retaining and is great for a belt.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_12 " );   // Next, you cut out the same strips from the skins, which is larger, throw them over your shoulders, wrapping your chest securely - the hunter's lungs need to be protected.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_13 " );   // You fix the ends of the strips behind your back with a clasp of two strong claws.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_14 " );   // Well, it's the turn of the biggest skin. You throw it on your back, fasten it in front, using fangs instead of buttons.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H1_01_15 " );   // That's all.
	};

	Know_HuntArmor_01 = TRUE;

	if((Know_HuntArmor_01 == TRUE) && (Know_HuntArmor_02 == TRUE) && (Know_HuntArmor_03 == TRUE) && (Know_HuntArmor_04 == TRUE))
	{
		FalkCanTeachArmorDone = TRUE;
	};

	AI_Print( " Learned the recipe for crafting armor - 'Wolfskin Armor' " );
	; _ _ _ _
	Snd_Play("LevelUP");
	AI_StopProcessInfos(self);
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_H2()
{
	if(TeachHuntArmorFT == FALSE)
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_00 " );   // Listen and remember. To get started, you will need a skinner and a carving knife.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_01 " );   // In general, the manufacturing process is not much different from the previous one. The dorsal lobe is the warmest, take more skins. Remember these simple truths.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_02 " );   // The only moment... The skin of the warg has a very unpleasant smell, so it needs to be treated with resin and be sure to cover a piece of sulfur somewhere. Do this and the stench will be gone.
		AI_Output(other,self, " DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_03 " );   // Like the long chatter of my interlocutors... (under his breath) Just what you need.
		TeachHuntArmorFT = TRUE;
     	}
     else
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_04 " );   // Listen and remember.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_05 " );   // In general, the manufacturing process is not much different from the previous one. The dorsal lobe is the warmest, take more skins. Remember these simple truths.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_06 " );   // The only moment... The skin of the warg has a very unpleasant smell, so it needs to be treated with resin and be sure to cover a piece of sulfur somewhere. Do this and the stench will be gone.
		AI_Output(other,self, " DIA_HUN_741_Falk_TeachHuntArmorDone_H2_01_07 " );   // Like the long chatter of my interlocutors. (under his breath) Just what you need.
	};

	Know_HuntArmor_02 = TRUE;

	if((Know_HuntArmor_01 == TRUE) && (Know_HuntArmor_02 == TRUE) && (Know_HuntArmor_03 == TRUE) && (Know_HuntArmor_04 == TRUE))
	{
		FalkCanTeachArmorDone = TRUE;
	};

	AI_Print( " Learned the recipe for crafting armor - 'Warg Hide Armor' " );
	; _ _ _ _
	Snd_Play("LevelUP");
	AI_StopProcessInfos(self);
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_H3()
{
	if(TeachHuntArmorFT == FALSE)
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_00 " );   // It won't be easy! So listen carefully. To get started, you will need a skinner and a carving knife.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_01 " );   // The principle is the same, but the skin of the troll is massive, which means that the process of cutting it will be more laborious and time-consuming.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_02 " );   // Fangs will go on all kinds of fasteners and rivets. Resin and coal are required to process the skin in order to free it from small harmful insects that have accumulated between the villi.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_03 " );   // The largest piece is used as always to cover the back and shoulders. Just look, don’t overstrain, put on the hump the weight with which you can run.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_04 " );   // To hold this part of the armor, huge troll fangs are called upon, which should be placed in the armpits - two on each side.
		TeachHuntArmorFT = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_05 " );   // It won't be easy! So listen carefully.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_06 " );   // The principle is the same, but the skin of the troll is massive, which means that the process of cutting it will be more laborious and time-consuming.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_07 " );   // Fangs will go on all kinds of fasteners and rivets. Resin and coal are required to process the skin in order to free it from small harmful insects that have accumulated between the villi.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_08 " );   // The largest piece is used as always to cover the back and shoulders. Just look, don’t overstrain, put on the hump the weight with which you can run.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H3_01_09 " );   // To hold this part of the armor, huge troll fangs are called upon, which should be placed in the armpits - two on each side.
	};

	Know_HuntArmor_03 = TRUE;

	if((Know_HuntArmor_01 == TRUE) && (Know_HuntArmor_02 == TRUE) && (Know_HuntArmor_03 == TRUE) && (Know_HuntArmor_04 == TRUE))
	{
		FalkCanTeachArmorDone = TRUE;
	};

	AI_Print( " Learned the recipe for making armor - 'Troll Skin Armor' " );
	; _ _ _ _
	Snd_Play("LevelUP");
	AI_StopProcessInfos(self);
};

func void DIA_HUN_741_Falk_TeachHuntArmorDone_H4()
{
	if(TeachHuntArmorFT == FALSE)
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_00 " );	// The process of creating this armor is not much different from the usual troll.
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_01 " );	// Then you slowly get to work... (tells)... That's all!
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_02 " );	// If you do it right, you'll get one of the finest armors I've ever seen in my life.
		AI_Output(other,self, " DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_03 " );	// Good! I'll try not to forget anything.
		TeachHuntArmorFT = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_04 " );	// It takes an art to craft this armor!
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_05 " );	// Then you slowly get to work... (tells)... That's all!
		AI_Output(self,other, " DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_06 " );	// If you do it right, you'll get one of the finest armors I've ever seen in my life.
		AI_Output(other,self, " DIA_HUN_741_Falk_TeachHuntArmorDone_H4_01_07 " );	// Good! I'll try not to forget anything.
	};

	Know_HuntArmor_04 = TRUE;

	if((Know_HuntArmor_01 == TRUE) && (Know_HuntArmor_02 == TRUE) && (Know_HuntArmor_03 == TRUE) && (Know_HuntArmor_04 == TRUE))
	{
		FalkCanTeachArmorDone = TRUE;
	};

	AI_Print( " Learned armor crafting recipe - 'Black Troll Skin Armor' " );
	B_LogEntry(TOPIC_TalentHuntArmor, " Now I can make black troll hunting armor. To do this, I need: a carving knife, three black troll skins, a black troll horn, six troll fangs, four dozen fangs, eight steel billets, three pieces of sulfur, resin , six pieces of coal and black pearls. " );
	Snd_Play("LevelUP");
	AI_StopProcessInfos(self);
};

instance DIA_HUN_741_FALK_HUNT(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_hunt_condition;
	information = dia_hun_741_falk_hunt_info;
	permanent = FALSE;
	description = " How are you hunting? " ;
};

func int dia_hun_741_falk_hunt_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hunt_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_Hunt_01_00 " );	// How's the hunting?
	AI_Output(self,other, " DIA_HUN_741_Falk_Hunt_01_01 " );	// Not much of a problem as long as you don't go too far into the forest.
	AI_Output(self,other, " DIA_HUN_741_Falk_Hunt_01_02 " );	// And recently, in one of the caves, we found a real dragon egg!
	AI_Output(self,other, " DIA_HUN_741_Falk_Hunt_01_03 " );	// A very rare thing - I can't even imagine where it came from...
};


instance DIA_HUN_741_FALK_DRAGON(C_Info)
{
	npc = hun_741_falk;
	nr = 5;
	condition = dia_hun_741_falk_dragon_condition;
	information = dia_hun_741_falk_dragon_info;
	permanent = FALSE;
	description = " Dragons may soon come here as well. " ;
};


func int dia_hun_741_falk_dragon_condition()
{
	if ( Npc_KnowsInfo ( other , dia_time_741_falk_hunt ) && ( HEROISHUNTER  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_dragon_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_HUN_741_Falk_Dragon_01_00 " );	// Dragons may soon be here as well.
	AI_Output(self,other, " DIA_HUN_741_Falk_Dragon_01_01 " );	// (frightened) What? Why do you say that?
	AI_Output(other,self, " DIA_HUN_741_Falk_Dragon_01_02 " );	// Rumor has it that several dragons have been sighted in the Valley of Mines.
	AI_Output(self,other, " DIA_HUN_741_Falk_Dragon_01_03 " );	// If this is true, we'll all have a hard time!
	AI_Output(self,other, " DIA_HUN_741_Falk_Dragon_01_08 " );	// Damn!
};


instance DIA_HUN_741_FALK_TEACHABOUT(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_teachabout_condition;
	information = dia_hun_741_falk_teachabout_info;
	permanent = FALSE;
	description = " Who can teach me something? " ;
};


func int dia_hun_741_falk_teachabout_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_teachabout_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_TeachAbout_01_00 " );	// Who here can teach me something?
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachAbout_01_03 " );	// Niklas will teach you how to make arrows and bolts.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachAbout_01_05 " );	// The rest - Alfred, Grom, Gahan and Grimbald will be able to tell you how to butcher the carcasses of animals you have killed.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachAbout_01_06 " );	// After all, collecting hunting trophies is the most important part of our business.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachAbout_01_07 " );	// Unfortunately, many guys are not in the camp now.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachAbout_01_08 " );	// Niklas hunts on the hunting grounds near the lighthouse. He is responsible for the regular supply of meat to the camp.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachAbout_01_09 " );	// Gahan is hunting near the passage to the Valley of Mines. I remember he was tracking some strange animal, obviously not from these places.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachAbout_01_10 " );	// Thunder hangs around Onar's farm. I gave him one very difficult order. He's probably still busy with it.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachAbout_01_11 " );	// Well, Grimbald hunts snappers in the northern part of the island, not far from the black troll's lair.
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachAbout_01_12 " );	// By the way, we even argued with the guys - who will be the first to fill up this monster. You can participate! (laughs)
	AI_Output(other,self, " DIA_HUN_741_Falk_TeachAbout_01_13 " );	// And what do I get if I kill him?
	AI_Output(self,other, " DIA_HUN_741_Falk_TeachAbout_01_14 " );	// Kill first, and then you'll know.
	MIS_BLACKTROLLPARI = LOG_Running;
	Log_CreateTopic(TOPIC_BLACKTROLLPARI,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_BLACKTROLLPARI,LOG_Running);
	B_LogEntry( TOPIC_BLACKTROLLPARI , " The hunters have a competition to see who can kill the big black troll first. I can also participate in it. " );
};


instance DIA_HUN_741_FALK_WOLFFURFALK(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_wolffurfalk_condition;
	information = dia_hun_741_falk_wolfurfalk_info;
	permanent = FALSE;
	description = " Do you have an errand for me? " ;
};


func int dia_hun_741_falk_wolffurfalk_condition()
{
	if (( HEROISHUNTER  ==  TRUE ) && Npc_KnowsInfo(hero,dia_hun_741_falk_teachabout))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_wolfurfalk_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_WolfFurFalk_01_00 " );	// Do you have any errand for me?
	AI_Output(self,other, " DIA_HUN_741_Falk_WolfFurFalk_01_01 " );	// Good thing you asked. There is just something here for you.
	AI_Output(self,other, " DIA_HUN_741_Falk_WolfFurFalk_01_03 " );	// One merchant from the city ordered me two dozen wolf skins.
	AI_Output(self,other, " DIA_HUN_741_Falk_WolfFurFalk_01_04 " );	// Will you take it?
	AI_Output(other,self, " DIA_HUN_741_Falk_WolfFurFalk_01_05 " );	// Of course. I will bring you wolf skins.
	AI_Output(self,other, " DIA_HUN_741_Falk_WolfFurFalk_01_06 " );	// Then I'll be waiting for you with these skins no later than next week.
	AI_Output(self,other, " DIA_HUN_741_Falk_WolfFurFalk_01_07 " );	// Try not to delay doing this - my client doesn't like to wait too long.
	MIS_WOLFFURFALK = LOG_Running;
	Log_CreateTopic(TOPIC_WOLFFURFALK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WOLFFURFALK,LOG_Running);
	B_LogEntry( TOPIC_WOLFFURFALK , " Falk has received an order for twenty wolf pelts. I volunteered to bring them to him. " );
};


instance DIA_HUN_741_FALK_WOLFFURFALKDONE (C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_wolffurfalkdone_condition;
	information = dia_hun_741_falk_wolfurfalkdone_info;
	permanent = FALSE;
	description = " I brought wolf skins. " ;
};


func int dia_hun_741_falk_wolffurfalkdone_condition()
{
	if((HEROISHUNTER == TRUE) && (MIS_WOLFFURFALK == LOG_Running) && (Npc_HasItems(other,ItAt_WolfFur) >= 20))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_wolfurfalkdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_HUN_741_Falk_WolfFurFalkDone_01_00 " );	// I brought wolf skins.
	AI_Output(other,self, " DIA_HUN_741_Falk_WolfFurFalkDone_01_02 " );	// Here, as you asked, - exactly twenty.
	B_GiveInvItems(other,self,ItAt_WolfFur,20);
	AI_Output(self,other, " DIA_HUN_741_Falk_WolfFurFalkDone_01_03 " );	// Great job, man! I think that will please old Bosper a little.
	AI_Output(self,other, " DIA_HUN_741_Falk_WolfFurFalkDone_01_04 " );	// And as for you, here - keep your share. You honestly deserve it.
	B_GiveInvItems(self,other,ItMi_Gold,250);
	AI_Output(other,self, " DIA_HUN_741_Falk_WolfFurFalkDone_01_05 " );	// So you work for the merchant Bosper?
	AI_Output(self,other, " DIA_HUN_741_Falk_WolfFurFalkDone_01_06 " );	// No, I just do small jobs for him sometimes.
	AI_Output(self,other, " DIA_HUN_741_Falk_WolfFurFalkDone_01_07 " );	// And he, in turn, pays me well for them. But no more.
	AI_Output(self,other, " DIA_HUN_741_Falk_WolfFurFalkDone_01_09 " );	// There are orders from other merchants.
	AI_Output(self,other, " DIA_HUN_741_Falk_WolfFurFalkDone_01_11 " );	// For example, recently a merchant from the city was interested in the claws of some special snapper.
	AI_Output(self,other, " DIA_HUN_741_Falk_WolfFurFalkDone_01_12 " );	// But where can we find this?
	MIS_WOLFFURFALK = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_WOLFFURFALK,LOG_SUCCESS);
	B_LogEntry( TOPIC_WOLFFURFALK , " I brought Falk two dozen wolf pelts. " );
};

instance DAY_TIME_741_FALK_BLACKTROLLPARI (C_Info);
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_blacktrollpari_condition;
	information = dia_hun_741_falk_blacktrollpari_info;
	permanent = FALSE;
	description = " The black troll is dead! " ;
};

func int dia_hun_741_falk_blacktrollpari_condition()
{
	if((HEROISHUNTER == TRUE) && (MIS_BLACKTROLLPARI == LOG_Running) && (Npc_HasItems(other,ItAt_TrollBlackFur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_blacktrollpari_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_HUN_741_Falk_BlackTrollPari_01_00 " );	// The black troll is dead!
	AI_Output(self,other, " DIA_HUN_741_Falk_BlackTrollPari_01_01 " );	// Where's the evidence?
	AI_Output(other,self, " DIA_HUN_741_Falk_BlackTrollPari_01_02 " );	// Here is his skin.
	B_GiveInvItems(other,self,ItAt_TrollBlackFur,1);
	Npc_RemoveInvItems(self,ItAt_TrollBlackFur,1);
	AI_Output(self,other, " DIA_HUN_741_Falk_BlackTrollPari_01_03 " );	// (surprised) It can't be! Wow...
	AI_Output(self,other, " DIA_HUN_741_Falk_BlackTrollPari_01_04 " );	// It turns out that it was you who won our argument. And therefore, here - take your prize.
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	AI_Output(self,other, " DIA_HUN_741_Falk_BlackTroll_01_05 " );	// Rare item! You are my skin, I am your potion.
	MIS_BLACKTROLLPARI = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BLACKTROLLPARI,LOG_SUCCESS);
	B_LogEntry( TOPIC_BLACKTROLLPARI , " I showed Falk the skin of a black troll, and he declared me the winner of the hunters' argument. " );
};

instance DIA_HUN_741_FALK_MAIN(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_main_condition;
	information = dia_hun_741_falk_main_info;
	permanent = FALSE;
	description = " Why are you in charge here? " ;
};


func int dia_hun_741_falk_main_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_main_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_Main_01_00 " );	// Why are you in charge here?
	AI_Output(self,other, " DIA_HUN_741_Falk_Main_01_01 " );	// I run the show here because I'm the best hunter in this camp.
	AI_Output(other,self, " DIA_HUN_741_Falk_Main_01_05 " );	// And what makes you the best?
	AI_Output(self,other, " DIA_HUN_741_Falk_Main_01_06 " );	// Like what? First of all, the ability to hunt, of course.
	AI_Output(self,other, " DIA_HUN_741_Falk_Main_01_07 " );	// Among other things, you must also have an inexorable craving and love for this craft.
	AI_Output(self,other, " DIA_HUN_741_Falk_Main_01_08 " );	// After all, being a hunter is not just about being able to accurately shoot a bow or butcher animal carcasses.
	AI_Output(self,other, " DIA_HUN_741_Falk_Main_01_09 " );	// Hunting should be part of you!
	AI_Output(self,other, " DIA_HUN_741_Falk_Main_01_13 " );	// It is the meaning of my whole life! And without it, I can not imagine my existence in this world.
};


instance DIA_HUN_741_FALK_GRAND(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_grand_condition;
	information = dia_hun_741_falk_grand_info;
	permanent = FALSE;
	description = " Who taught you how to hunt? " ;
};


func int dia_hun_741_falk_grand_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_grand_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_Grand_01_00 " );	// And who taught you to hunt?
	AI_Output(self,other, " DIA_HUN_741_Falk_Grand_01_01 " );	// I owe all this to only one person in my life - my grandfather Ben!
	AI_Output(other,self, " DIA_HUN_741_Falk_Grand_01_03 " );	// Was your grandfather a hunter too?
	AI_Output(self,other, " DIA_HUN_741_Falk_Grand_01_04 " );	// Yes. And not just a hunter, but the best hunter in these parts!
	AI_Output(other,self, " DIA_HUN_741_Falk_Grand_01_09 " );	// Where is he now?
	AI_Output(self,other, " DIA_HUN_741_Falk_Grand_01_10 " );	// I don't know this. Seven years ago, he went hunting in the mountains to the north, and since then no one has seen him here again.
};

instance DIA_HUN_741_FALK_HUNTFORWHAT(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_huntforwhat_condition;
	information = dia_hun_741_falk_huntforwhat_info;
	permanent = FALSE;
	description = " Who do you usually hunt? " ;
};

func int dia_hun_741_falk_huntforwhat_condition()
{
	if(HEROISHUNTER == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_huntforwhat_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_HuntForWhat_01_00 " );	// Who do you usually hunt?
	AI_Output(self,other, " DIA_HUN_741_Falk_HuntForWhat_01_03 " );	// Any living creature is of interest to us if it is possible to remove some valuable hunting trophy from it.
	AI_Output(self,other, " DIA_HUN_741_Falk_HuntForWhat_01_02 " );	// Wolves, scavengers, snappers or trolls.
	AI_Output(self,other, " DIA_HUN_741_Falk_HuntForWhat_01_04 " );	// You can hunt anyone. The main thing is to know how it's done.
};


instance DIA_HUN_741_FALK_TALKFORWHAT(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_talkforwhat_condition;
	information = dia_hun_741_falk_talkforwhat_info;
	permanent = FALSE;
	description = " Tell me something about hunting. " ;
};


func int dia_hun_741_falk_talkforwhat_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_huntforwhat))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_talkforwhat_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_TalkForWhat_01_00 " );	// Tell me something about hunting.
	AI_Output(self,other, " DIA_HUN_741_Falk_TalkForWhat_01_03 " );	// In each specific case, there are some peculiarities.
	AI_Output(self,other, " DIA_HUN_741_Falk_TalkForWhat_01_05 " );	// First you need to know that each animal has its own habits and has a special demeanor.
	AI_Output(self,other, " DIA_HUN_741_Falk_TalkForWhat_01_08 " );	// For example, hunting a pack of snappers is completely different than hunting a pack of wolves.
	AI_Output(self,other, " DIA_HUN_741_Falk_TalkForWhat_01_09 " );	// You should also take into account that different animals attack and defend themselves in completely different ways.
	AI_Output(self,other, " DIA_HUN_741_Falk_TalkForWhat_01_11 " );	// If you're good at all of this, you'll be able to take on any beast without too much trouble.
};


instance DIA_TIME_741_FALK_TALKBOUTHUNT (C_Info);
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_talkabouthunt_condition;
	information = dia_time_741_falk_talkabouthunt_info;
	permanent = TRUE;
	description = " Can you tell me more about hunting? " ;
};


func int dia_time_741_falk_talkabouthunt_condition();
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_talkforwhat))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_talkabouthunt_info()
{
	AI_Output(other,self, " DIA_HUN_741_TA_01_00 " );	// Can you tell me more about hunting?
	AI_Output(self,other, " DIA_HUN_741_TA_01_01 " );	// I have a lot to say about local creatures.
	AI_Output(self,other, " DIA_HUN_741_TA_01_02 " );	// What exactly are you interested in?
	Info_ClearChoices(dia_time_741_falk_talkabouthunt);
	Info_AddChoice(dia_time_741_falk_talkabouthunt,Dialog_Back,dia_time_741_falk_talkabouthunt_back);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt, " Tell me about hunting animals. " ,dia_hun_741_falk_talkabouthunt_other);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt, " Tell me about reptile hunting. " ,dia_hun_741_falk_talkabouthunt_reptile);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt, " I want to learn more about predator hunting. " ,dia_hun_741_falk_talkabouthunt_predators);
};

func void dia_hun_741_falk_talkabouthunt_other()
{
	AI_Output(other,self, " DIA_HUN_741_TA_Other_01_00 " );	// Tell me about hunting animals.
	AI_Output(self,other, " DIA_HUN_741_TA_Other_01_01 " );	// Who exactly do you want to know about?
	Info_ClearChoices(dia_time_741_falk_talkabouthunt);
	Info_AddChoice(dia_time_741_falk_talkabouthunt,Dialog_Back,dia_time_741_falk_talkabouthunt_back);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt, " Tell me about crawlers. " ,dia_hun_741_falk_talkabouthunt_minecrawler);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt, " Subject matter to the manufacturer. " ,dia_hun_741_falk_talkabouthunt_keiler);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt, " Even if you want to do this. " ,dia_hun_741_falk_talkabouthunt_bloodfly);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt, " Scavenger doesn't have to be a scavenger. " ,dia_hun_741_falk_talkabouthunt_scavenger);
};

func void dia_hun_741_falk_talkabouthunt_reptile();
{
	AI_Output(other,self, " DIA_HUN_741_TA_Reptile_01_00 " );	// Tell me about reptile hunting.
	AI_Output(self,other, " DIA_HUN_741_TA_Reptile_01_01 " );	// Good! Who exactly do you want to hear about?
	Info_ClearChoices(dia_time_741_falk_talkabouthunt);
	Info_AddChoice(dia_time_741_falk_talkabouthunt,Dialog_Back,dia_time_741_falk_talkabouthunt_back);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt, " How to hunt fire lizards? " ,dia_hun_741_falk_talkabouthunt_firewaran);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt, " Tell me how to hunt schnygs. " ,dia_hun_741_falk_talkabouthunt_luker);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt, " Even if you want to do this. " ,dia_hun_741_falk_talkabouthunt_waran);
};

func void dia_hun_741_falk_talkabouthunt_predators();
{
	AI_Output(other,self, " DIA_HUN_741_TA_Predators_01_00 " );	// I want to learn more about hunting predators.
	AI_Output(self,other, " DIA_HUN_741_TA_Predators_01_01 " );	// No problem! Who exactly do you want me to talk about?
	Info_ClearChoices(dia_time_741_falk_talkabouthunt);
	Info_AddChoice(dia_time_741_falk_talkabouthunt,Dialog_Back,dia_time_741_falk_talkabouthunt_back);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt, " Tell me about trolls. " ,dia_hun_741_falk_talkabouthunt_troll);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt, " Shadow shadow. " ,dia_hun_741_falk_talkabouthunt_shadow);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt, " Snapper snapper. " ,dia_hun_741_falk_talkabouthunt_snapper);
	Info_AddChoice(dia_hun_741_falk_talkabouthunt, " Do not go to wolf. " ,dia_hun_741_falk_talkabouthunt_wolf);
};

func void dia_hun_741_falk_talkabouthunt_back()
{
	Info_ClearChoices(dia_time_741_falk_talkabouthunt);
};

func void dia_hun_741_falk_talkabouthunt_scavenger()
{
	if(BONUSHUNTTELL_01 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_01 = TRUE;
	};
	AI_Output(other,self, " DIA_HUN_741_TA_Scavenger_01_00 " );	// Tell me about the scavengers.
	AI_Output(self,other, " DIA_HUN_741_TA_Scavenger_01_01 " );	// We call these big birds scavengers. You need to attack them one by one. It's pretty easy to lure one scavenger out of a pack.
	AI_Output(self,other, " DIA_HUN_741_TA_Scavenger_01_02 " );	// When you get close, the bird will first get worried and then rush at you. You should already be waiting for her with a weapon in your hand.
	AI_Output(self,other, " DIA_HUN_741_TA_Scavenger_01_03 " );	// If you manage to land a hit before this creature bites you, don't stop, keep fighting and you'll win without getting a single scratch.
	AI_Output(self,other, " DIA_HUN_741_TA_Scavenger_01_04 " );	// If SHE hits you first... well, don't bring it up.
};

func void dia_hun_741_falk_talkabouthunt_bloodfly()
{
	if(BONUSHUNTTELL_02 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_02 = TRUE;
	};
	AI_Output(other,self, " DIA_HUN_741_TA_BloodFly_01_00 " );	// Tell me about the blood hornets.
	AI_Output(self,other, " DIA_HUN_741_TA_BloodFly_01_01 " );	// The main thing in this case is attention and a good reaction.
	AI_Output(self,other, " DIA_HUN_741_TA_BloodFly_01_02 " );	// It is quite difficult to deliver an accurate blow with a sword in a battle with a hornet - these creatures are painfully evasive.
	AI_Output(self,other, " DIA_HUN_741_TA_BloodFly_01_03 " );	// Therefore, I will give you one piece of advice - do not rush headlong into the attack!
	AI_Output(self,other, " DIA_HUN_741_TA_BloodFly_01_04 " );	// Just stand still and keep a close eye on its flight path. Wait for the moment when the hornet decides to attack you.
	AI_Output(self,other, " DIA_HUN_741_TA_BloodFly_01_06 " );	// When the hornet flies up to sting you, strike a single blow and step back!
	AI_Output(self,other, " DIA_HUN_741_TA_BloodFly_01_07 " );	// And it's best to do it from the bottom up! Like this...
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HATTACKMOVE");
	AI_Output(self,other, " DIA_HUN_741_TA_BloodFly_01_08 " );	// Remember?
	AI_RemoveWeapon(self);
	AI_TurnToNPC(self,other);
	AI_Output(other,self,"DIA_HUN_741_TA_BloodFly_01_09");	//Да.
	AI_Output(self,other, " DIA_HUN_741_TA_BloodFly_01_10 " );	// Good. If you do everything as I said, then without much difficulty you will cope with this creature.
	AI_Output(self,other, " DIA_HUN_741_TA_BloodFly_01_11 " );	// Although, of course, even easier is to shoot the hornets with a bow.
	AI_Output(self,other, " DIA_HUN_741_TA_BloodFly_01_12 " );	// Even a clumsily fired arrow, if it hits the target, can easily break the membranes near its wings.
	AI_Output(self,other, " DIA_HUN_741_TA_BloodFly_01_13 " );	// And with broken wings, the blood hornet is no longer so dangerous.
	AI_Output(self,other, " DIA_HUN_741_TA_BloodFly_01_14 " );	// Finishing it off will only be a matter of technique.
	AI_Output(other,self, " DIA_HUN_741_TA_BloodFly_01_15 " );	// Thanks for the tip.
};

func void dia_hun_741_falk_talkabouthunt_keiler()
{
	if(BONUSHUNTTELL_03 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_03 = TRUE;
	};
	AI_Output(other,self, " DIA_HUN_741_TA_Keiler_01_00 " );	// Tell me about the boars.
	AI_Output(self,other, " DIA_HUN_741_TA_Keiler_01_01 " );	// Boars aren't very smart, and mostly rely on their own power.
	AI_Output(self,other, " DIA_HUN_741_TA_Keiler_01_04 " );	// Remember: the boar's main weapon is its first, terrifying blow!
	AI_Output(self,other, " DIA_HUN_741_TA_Keiler_01_05 " );	// It can easily knock you off your feet, and its powerful fangs can tear you to shreds.
	AI_Output(self,other, " DIA_HUN_741_TA_Keiler_01_06 " );	// Therefore, the most important thing is not to let him hit you first.
	AI_Output(self,other, " DIA_HUN_741_TA_Keiler_01_08 " );	// Just take a step back or sideways, though it's more difficult. Then go on the attack!
	AI_Output(self,other, " DIA_HUN_741_TA_Keiler_01_09 " );	// Throw a few hits, then move to the side again and attack again.
	AI_Output(self,other, " DIA_HUN_741_TA_Keiler_01_10 " );	// Boar is not very agile in close combat. And if you're smart enough, it won't be hard for you to finish the job.
	AI_Output(self,other, " DIA_HUN_741_TA_Keiler_01_11 " );	// I also don't advise you to hunt a boar with a bow or crossbow.
	AI_Output(self,other, " DIA_HUN_741_TA_Keiler_01_12 " );	// Arrows or bolts won't hurt him much if you're not well trained with these weapons.
	AI_Output(self,other, " DIA_HUN_741_TA_Keiler_01_13 " );	// Trust me, the skin of the boar is very strong!
	AI_Output(other,self, " DIA_HUN_741_TA_Keiler_01_14 " );	// I'll keep that in mind.
};

func void dia_hun_741_falk_talkabouthunt_minecrawler();
{
	if(BONUSHUNTTELL_04 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_04 = TRUE;
	};
	AI_Output(other,self, " DIA_HUN_741_TA_MineCrawler_01_00 " );	// Tell me about crawlers.
	AI_Output(self,other, " DIA_HUN_741_TA_MineCrawler_01_01 " );	// When dealing with these creatures, it's important to remember one thing: if you see a crawler, run towards it and attack it first.
	AI_Output(self,other, " DIA_HUN_741_TA_MineCrawler_01_04 " );	// The main thing is not to give the crawler the opportunity to attack you himself - he has long tentacles, and he will easily get you.
	AI_Output(self,other, " DIA_HUN_741_TA_MineCrawler_01_05 " );	// But if you're facing a Warrior Crawler, you'll need a completely different tactic.
	AI_Output(self,other, " DIA_HUN_741_TA_MineCrawler_01_06 " );	// These creatures' shell plates are the strongest material I've ever seen. They are practically unbreakable!
	AI_Output(self,other, " DIA_HUN_741_TA_MineCrawler_01_07 " );	// Crossbows and bows are completely useless here. Trying to penetrate such armor with a bolt or arrow is just a waste of time.
	AI_Output(self,other, " DIA_HUN_741_TA_MineCrawler_01_08 " );	// The blade of your sword will be much more effective against the shells of these creatures.
	AI_Output(self,other, " DIA_HUN_741_TA_MineCrawler_01_09 " );	// Always keep the crawler within striking distance - don't let it get close to you.
	AI_Output(self,other, " DIA_HUN_741_TA_MineCrawler_01_11 " );	// The Warrior Crawler is a dangerous creature, but extremely stubborn and primitive. They act instinctively, killing everyone in their path.
	AI_Output(self,other, " DIA_HUN_741_TA_MineCrawler_01_12 " );	// He will look for trouble even if he gets some serious wounds. And you should use it.
	AI_Output(self,other, " DIA_HUN_741_TA_MineCrawler_01_13 " );	// Your sword must never rest until it has finished the crawler.
	AI_Output(self,other, " DIA_HUN_741_TA_MineCrawler_01_14 " );	// By the way, I heard that in addition to the normal crawlers and warrior crawlers, there is also another special representative of these...creatures.
	AI_Output(self,other, " DIA_HUN_741_TA_MineCrawler_01_15 " );	// This creature is called the crawler queen.
	AI_Output(self,other, " DIA_HUN_741_TA_MineCrawler_01_16 " );	// She lays eggs that hatch into new crawlers.
	AI_Output(self,other, " DIA_HUN_741_TA_MineCrawler_01_17 " );	// True, I have never met such creatures here. But you might have better luck! (laughs)
};

func void dia_hun_741_falk_talkabouthunt_war()
{
	if(BONUSHUNTTELL_05 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_05 = TRUE;
	};
	AI_Output(other,self, " DIA_HUN_741_TA_Waran_01_00 " );	// Tell me about lizards.
	AI_Output(self,other, " DIA_HUN_741_TA_Waran_01_01 " );	// They mostly live on the coast because they love to bask in the sun.
	AI_Output(self,other, " DIA_HUN_741_TA_Waran_01_02 " );	// Although sometimes they can be found in small thickets or in the forest.
	AI_Output(self,other, " DIA_HUN_741_TA_Waran_01_06 " );	// If I were you, I'd be wary of their sharp claws with which they butcher their prey.
	AI_Output(self,other, " DIA_HUN_741_TA_Waran_01_07 " );	// Now, as for the monitor lizard hunting itself...
	AI_Output(self,other, " DIA_HUN_741_TA_Waran_01_08 " );	// The best weapon for this job is a hunting bow or crossbow.
	AI_Output(self,other, " DIA_HUN_741_TA_Waran_01_09 " );	// The skin of these creatures is not very durable.
	AI_Output(self,other, " DIA_HUN_741_TA_Waran_01_10 " );	// Pretty much any arrow you shoot will easily pierce through it and seriously injure the beast.
	AI_Output(self,other, " DIA_HUN_741_TA_Waran_01_11 " );	// You'll have to sweat a lot more if you don't have a bow or a crossbow with you.
	AI_Output(self,other, " DIA_HUN_741_TA_Waran_01_12 " );	// Monitor lizards are extremely agile creatures, and so in this case, the best tactic in a battle with them is a counterattack.
	AI_Output(self,other, " DIA_HUN_741_TA_Waran_01_13 " );	// Let the creature get closer to you and wait until it tries to bite you.
	AI_Output(self,other, " DIA_HUN_741_TA_Waran_01_14 " );	// Dodge and strike instantly. No matter how dexterous this creature is, it cannot dodge this attack!
	AI_Output(self,other, " DIA_HUN_741_TA_Waran_01_15 " );	// Usually only one accurate hit is enough, but if you miss, step back and repeat all over again.
};

func void dia_hun_741_falk_talkabouthunt_luker()
{
	if(BONUSHUNTTELL_06 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_06 = TRUE;
	};
	AI_Output(other,self, " DIA_HUN_741_TA_Luker_01_00 " );	// Tell me how to hunt sniffs.
	AI_Output(self,other, " DIA_HUN_741_TA_Luker_01_02 " );	// Shnygs are dangerous animals, and extremely unpredictable.
	AI_Output(self,other, " DIA_HUN_741_TA_Luker_01_03 " );	// Even one of these beasts can be hard to deal with, let alone two or three.
	AI_Output(self,other, " DIA_HUN_741_TA_Luker_01_05 " );	// But they have one weakness - slowness, and this should be used.
	AI_Output(self,other, " DIA_HUN_741_TA_Luker_01_06 " );	// So don't wait for the moment when the beast will attack you - attack him first!
	AI_Output(self,other, " DIA_HUN_741_TA_Luker_01_07 " );	// Strike one after the other, keeping the beast from coming to its senses.
	AI_Output(self,other, " DIA_HUN_741_TA_Luker_01_09 " );	// But don't forget about your safety as well.
	AI_Output(self,other, " DIA_HUN_741_TA_Luker_01_10 " );	// If you feel like your punches are off target, it's best to back off.
	AI_Output(self,other, " DIA_HUN_741_TA_Luker_01_11 " );	// Wait for the right moment and repeat your attack again.
	AI_Output(self,other, " DIA_HUN_741_TA_Luker_01_12 " );	// And remember: the length of your weapon is of great importance in the battle with shnyg.
	AI_Output(self,other, " DIA_HUN_741_TA_Luker_01_13 " );	// This beast must be kept at a distance, otherwise it will easily reach you with its long paws.
};

func void dia_hun_741_falk_talkabouthunt_firewater()
{
	if(BONUSHUNTTELL_07 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_07 = TRUE;
	};
	AI_Output(other,self, " DIA_HUN_741_TA_FireWaran_01_00 " );	// How to hunt fire lizards?
	AI_Output(self,other, " DIA_HUN_741_TA_FireWaran_01_01 " );	// These creatures are not often seen in these parts.
	AI_Output(self,other, " DIA_HUN_741_TA_FireWaran_01_02 " );	// And none of our guys hunt them - it's too dangerous.
	AI_Output(self,other, " DIA_HUN_741_TA_FireWaran_01_06 " );	// Their most important distinguishing mark is the bright red color of the skin and the large crest that grows on their back.
	AI_Output(self,other, " DIA_HUN_741_TA_FireWaran_01_08 " );	// These beasts will easily turn you into a big flaming torch if you're foolish enough to stand in their way.
	AI_Output(self,other, " DIA_HUN_741_TA_FireWaran_01_09 " );	// While the fangs and claws can still be dodged somehow, the fiery breath of these creatures is almost impossible.
	AI_Output(self,other, " DIA_HUN_741_TA_FireWaran_01_10 " );	// As far as I know, the only safe way to kill them is to learn how to shoot accurately with a bow or crossbow.
	AI_Output(self,other, " DIA_HUN_741_TA_FireWaran_01_13 " );	// Find a spot where this creature can't reach you, then aim well and shoot!
	AI_Output(self,other, " DIA_HUN_741_TA_FireWaran_01_14 " );	// Finishing off this creature is no easy task.
};

func void dia_hun_741_falk_talkabouthunt_wolf()
{
	if(BONUSHUNTTELL_08 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_08 = TRUE;
	};
	AI_Output(other,self, " DIA_HUN_741_TA_Wolf_01_00 " );	// Tell me about wolves.
	AI_Output(self,other, " DIA_HUN_741_TA_Wolf_01_01 " );	// The wolf is a very aggressive and dangerous animal.
	AI_Output(self,other, " DIA_HUN_741_TA_Wolf_01_03 " );	// Of course, one such beast won't be too much of a problem for you.
	AI_Output(self,other, " DIA_HUN_741_TA_Wolf_01_04 " );	// But the fact is that wolves always hunt only in packs.
	AI_Output(self,other, " DIA_HUN_741_TA_Wolf_01_05 " );	// The most important thing when hunting a pack of wolves is, first of all, secrecy and then the clarity of your further actions.
	AI_Output(self,other, " DIA_HUN_741_TA_Wolf_01_06 " );	// Remember that you won't be able to lure each wolf out of the pack one by one. These are not scavengers for you.
	AI_Output(self,other, " DIA_HUN_741_TA_Wolf_01_07 " );	// If at least one beast notices you, all the rest of his relatives will immediately pounce on you.
	AI_Output(self,other, " DIA_HUN_741_TA_Wolf_01_08 " );	// So, stealthily sneak up to the flock within arrow flight range, aim accurately and shoot!
	AI_Output(self,other, " DIA_HUN_741_TA_Wolf_01_09 " );	// If you're lucky, you'll kill one beast right away, giving you a slight advantage.
	AI_Output(self,other, " DIA_HUN_741_TA_Wolf_01_10 " );	// After that, draw your weapon and wait for the rest of the wolves to attack you.
	AI_Output(self,other, " DIA_HUN_741_TA_Wolf_01_11 " );	// Usually, these beasts attack their prey from different sides. This cannot be allowed!
	AI_Output(self,other, " DIA_HUN_741_TA_Wolf_01_12 " );	// Do a couple of lunges and step back. This will make it impossible for the wolves to get around you from behind.
	AI_Output(self,other, " DIA_HUN_741_TA_Wolf_01_13 " );	// When attacking, wait for the moment when the wolf rushes at you, and only then strike.
};

func void dia_hun_741_falk_talkabouthunt_snapper()
{
	if(BONUSHUNTTELL_09 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_09 = TRUE;
	};
	AI_Output(other,self, " DIA_HUN_741_TA_Snapper_01_00 " );	// Tell me about snappers.
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_01 " );	// Only a truly skilled hunter can hunt these creatures.
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_02 " );	// Of course, with one snapper you still somehow manage, but most often they hunt in packs.
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_04 " );	// Never attack snappers in a pack with a crossbow or bow!
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_06 " );	// This will draw the attention of the rest of the snappers, and they will immediately rush at you in droves!
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_07 " );	// Better sneak around and just let one of them find you.
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_08 " );	// Seeing you, the beast will not want to miss its potential prey, and will slowly begin to move towards you.
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_09 " );	// Try to lure him away from the pack, and then prepare for battle and wait.
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_11 " );	// When getting closer, the snapper will rush towards you. Here comes the most crucial moment.
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_12 " );	// Don't try to fend off his attempt to bite you! It's almost impossible - you just don't have enough reaction to it.
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_13 " );	// Just quickly step back a few steps and land one hit! Remember, only one lunge.
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_14 " );	// If you attempt to land multiple hits at once, you won't have time to react to the beast's next throw.
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_15 " );	// And don't you dare retreat! Wait until the beast runs at you again.
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_16 " );	// As soon as the snapper tries to bite you again, jump back and attack again.
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_19 " );	// Great, huh? And I almost forgot - there is something else ...
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_21 " );	// If you're already in combat with the snapper, don't run away. It still won't help.
	AI_Output(self,other, " DIA_HUN_741_TA_Snapper_01_22 " );	// Snapper runs a lot faster than you and will easily overtake you.
};

func void dia_hun_741_falk_talkabouthunt_shadow()
{
	if(BONUSHUNTTELL_10 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_10 = TRUE;
	};
	AI_Output(other,self, " DIA_HUN_741_TA_Shadow_01_00 " );	// Tell me about the darkness.
	AI_Output(self,other, " DIA_HUN_741_TA_Shadow_01_03 " );	// The Mrakoris is one of the most dangerous creatures I've ever encountered!
	AI_Output(self,other, " DIA_HUN_741_TA_Shadow_01_04 " );	// In most cases, they live in the depths of the forest or in caves, because they cannot stand daylight.
	AI_Output(self,other, " DIA_HUN_741_TA_Shadow_01_06 " );	// These predators hunt only at night - their eyes see perfectly in the dark, and at this time of day it is better to stay away from him.
	AI_Output(self,other, " DIA_HUN_741_TA_Shadow_01_07 " );	// Truly, this beast is unusually strong and dexterous - you can't even imagine how much!
	AI_Output(self,other, " DIA_HUN_741_TA_Shadow_01_10 " );	// Therefore, the only thing that can help you in a fight with him is excellent weapon skills, incredible dexterity and great luck!
	AI_Output(self,other, " DIA_HUN_741_TA_Shadow_01_11 " );	// Of course, the most effective way to kill a mrakoris is to use a crossbow.
	AI_Output(self,other, " DIA_HUN_741_TA_Shadow_01_12 " );	// However, one bolt is unlikely to be enough to take down this beast. Two or three at best.
	AI_Output(self,other, " DIA_HUN_741_TA_Shadow_01_14 " );	// You can also use your sword.
	AI_Output(self,other, " DIA_HUN_741_TA_Shadow_01_15 " );	// Sneak up behind the beast while it sleeps. Swing with all your might and strike.
	AI_Output(self,other, " DIA_HUN_741_TA_Shadow_01_16 " );	// Then deliver more blows one after the other until the beast comes to its senses.
	AI_Output(self,other, " DIA_HUN_741_TA_Shadow_01_17 " );	// As soon as the obscurantist turns towards you, jump back a couple of steps and take a waiting stance.
	AI_Output(self,other, " DIA_HUN_741_TA_Shadow_01_18 " );	// When the predator rushes at you and tries to hit you with its paw - again take a step back, and then a few lunges forward.
	AI_Output(self,other, " DIA_HUN_741_TA_Shadow_01_19 " );	// Then back away from the beast again and wait for its next attack.
};

func void dia_hun_741_falk_talkabouthunt_troll()
{
	if(BONUSHUNTTELL_11 == FALSE)
	{
		B_GivePlayerXP(50);
		BONUSHUNTTELL_11 = TRUE;
	};
	AI_Output(other,self, " DIA_HUN_741_TA_Troll_01_00 " );	// What should I know if I want to hunt trolls?
	AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_01 " );	// Usually trolls live high in the mountains, where there is a lot of free space.
	AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_02 " );	// Although sometimes they can be found in other places, but this is very rare.
	AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_03 " );	// Trust me, taking down a monster like that is INCREDIBLY difficult!
	AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_05 " );	// Trolls have such a tough hide that regular bolts or arrows won't penetrate it even at close range.
	AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_06 " );	// Therefore, the only way to kill this creature is to fight it in close combat.
	AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_07 " );	// But these monsters have monstrous strength, and if you miss even one hit, you will be left with nothing but a wet spot!
	AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_08 " );	// Trolls have virtually no weaknesses, but these creatures do have one very serious flaw.
	AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_09 " );	// Due to their huge size and mass, they are extremely clumsy.
	AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_10 " );	// When you start to get close to the troll, it will first roar terribly.
	AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_11 " );	// Run to him, don't stop! Your main task is to go behind him. Where his huge fists can't reach you.
	AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_12 " );	// If you can do that, you already have an advantage against him.
	AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_13 " );	// Well, then start using your sword. And be careful that you stay behind him.
	AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_14 " );	// You'll have to sweat a lot to finally inflict a mortal wound on this creature.
	if(Npc_KnowsInfo(other,dia_hun_741_falk_teachabout))
	{
		AI_Output(other,self, " DIA_HUN_741_TA_Troll_01_16 " );	// What about the black troll?
		AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_17 " );	// Ha! This creature will be more terrible than usual.
		AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_18 " );	// I'll just tell you one thing: the last time we hunted him, the black troll killed two of our guys with one blow of his fist!
		AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_19 " );	// So it's better not to tempt fate once again.
	};
	AI_Output(self,other, " DIA_HUN_741_TA_Troll_01_20 " );	// This island is full of other creatures that you can hunt.
};


instance DIA_HUN_741_FALK_BRINGARROW(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_bringarrow_condition;
	information = dia_hun_741_falk_bringarrow_info;
	permanent = FALSE;
	description = " Don't you have any work for me? " ;
};


func int dia_hun_741_falk_bringarrow_condition()
{
	if(MIS_WOLFFURFALK == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_bringarrow_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_BringArrow_01_00 " );	// Don't you have any work for me?
	AI_Output(self,other, " DIA_HUN_741_Falk_BringArrow_01_01 " );	// We need to take this letter to the merchant Bosper in the city.
	AI_Output(self,other, " DIA_HUN_741_Falk_BringArrow_01_06 " );	// Here, hold it. And try not to lose.
	B_GiveInvItems(self,other,itwr_letterfalk,1);
	MIS_LETTERFALK = LOG_Running;
	Log_CreateTopic(TOPIC_LETTERFALK,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LETTERFALK,LOG_Running);
	B_LogEntry( TOPIC_LETTERFALK , " Falk asked me to deliver his letter to the merchant Bosper. " );
};


instance DIA_HUN_741_FALK_BRINGARROWFAIL(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_bringarrowfail_condition;
	information = dia_hun_741_falk_bringarrowfail_info;
	permanent = FALSE;
	description = " Regarding your errand... " ;
};


func int dia_hun_741_falk_bringarrowfail_condition()
{
	if((FALKLETTEROPENED == TRUE) && (MIS_LETTERFALK == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_bringarrowfail_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_BringArrowFail_01_00 " );	// About your order...
	AI_Output(self,other,"DIA_HUN_741_Falk_BringArrowFail_01_01");	//Да?
	if ( BOSPERREFUSEARROW  ==  FALSE )
	{
		if(Npc_HasItems(other,ItRw_Arrow) >= 100)
		{
			AI_Output(other,self, " DIA_HUN_741_Falk_BringArrowFail_01_02 " );	// I have a good hundred arrows for you, which you ask Bosper for in your letter.
			AI_Output(other,self, " DIA_HUN_741_Falk_BringArrowFail_01_03 " );	// And I can sell them to you for a very reasonable price.
			AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowFail_01_04 " );	// What? Did you open my letter?!
			AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowFail_01_05 " );	// Get out of my sight you idiot!
		}
		else
		{
			AI_Output(other,self, " DIA_HUN_741_Falk_BringArrowFail_01_06 " );	// I learned from your letter to Bosper that you need arrows.
			AI_Output(other,self, " DIA_HUN_741_Falk_BringArrowFail_01_07 " );	// So I wanted to offer to get them for you. And for a very reasonable price!
			AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowFail_01_08 " );	// How? Did you open my letter?! How dare you do that?
			AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowFail_01_09 " );	// Get out of my sight you idiot!
		};
	}
	else
	{
		AI_Output(other,self, " DIA_HUN_741_Falk_BringArrowFail_01_10 " );	// I took your letter to Bosper, but he sent me to hell!
		AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowFail_01_11 " );	// What? But why?
		AI_Output(other,self, " DIA_HUN_741_Falk_BringArrowFail_01_12 " );	// I just accidentally opened your letter.
		AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowFail_01_13 " );	// What? How dare you do that?!
		AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowFail_01_16 " );	// Get out of my sight you idiot! I no longer need your services.
	};
	MIS_LETTERFALK = LOG_FAILED;
	B_LogEntry_Failed(TOPIC_LETTERFALK);
	FALKPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_HUN_741_FALK_FUCKOFF(C_Info)
{
	npc = hun_741_falk;
	nr = 10;
	condition = dia_hun_741_falk_fuckoff_condition;
	information = dia_hun_741_falk_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_hun_741_falk_fuckoff_condition()
{
	if((FALKPISSOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");

	if((Npc_HasItems(other,itam_benkenob) >= 1) || ((FINDFALKGRANDFATHERSEEK_01 == TRUE) && (FINDFALKGRANDFATHERSEEK_01_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_02 == TRUE) && (FINDFALKGRANDFATHERSEEK_02_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_03 == TRUE) && (FINDFALKGRANDFATHERSEEK_03_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_04 == TRUE) && (FINDFALKGRANDFATHERSEEK_04_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_FINAL == TRUE) && (FINDFALKGRANDFATHERSEEK_FINAL_DONE == FALSE)) || ((FINDFALKGRANDFATHERSEEK_FINALEXT == TRUE) && (FINDFALKGRANDFATHERSEEK_FINALEXT_DONE == FALSE)))
	{
		AI_Output(other,self, " DIA_HUN_741_Falk_FuckOff_01_01 " );	// Wait! I have something for you...
		AI_Output(self,other, " DIA_HUN_741_Falk_FuckOff_01_02 " );	// I don't want anything from a bastard like you! Or do you want my sword to tell you this for me?!
		AI_Output(other,self, " DIA_HUN_741_Falk_FuckOff_01_03 " );	// Don't get excited, just listen to me! I have news regarding your grandfather Ben.
		AI_Output(self,other, " DIA_HUN_741_Falk_FuckOff_01_04 " );	// (changing face) What?
		AI_Output(self,other, " DIA_HUN_741_Falk_FuckOff_01_06 " );	// Hmmm. OK then. Post what you have there.
		FALKPISSOFF = FALSE;
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

instance DIA_HUN_741_FALK_BRINGARROWDONE (C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_bringarrowdone_condition;
	info = dia_hun_741_falk_bringarrowdone_info;
	permanent = FALSE;
	description = " Regarding your errand... " ;
};

func int dia_hun_741_falk_bringarrowdone_condition()
{
	if((BOSPERGIVEARROWS == TRUE) && (Npc_HasItems(other,ITRW_ZUNTARROW) >= 100) && (MIS_LETTERFALK == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_bringarrowdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_HUN_741_Falk_BringArrowDone_01_00 " );	// About your order...
	AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowDone_01_01 " );	// Yes? Do you have something to please me?
	AI_Output(other,self, " DIA_HUN_741_Falk_BringArrowDone_01_02 " );	// Here, Bosper is handing you a hundred branded arrows.
	B_GiveInvItems(other,self,ITRW_ZUNTARROW,100);
	AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowDone_01_03 " );	// Great! I just missed them!
	AI_Output(other,self, " DIA_HUN_741_Falk_BringArrowDone_01_04 " );	// What are those arrows?
	AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowDone_01_05 " );	// Well, as you probably already understood, these are not simple arrows.
	AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowDone_01_06 " );	// In addition to the fact that they have my mark on the tip, they are also much better than ordinary ones.
	AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowDone_01_07 " );	// These arrows travel farther than normal and deal more damage.
	AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowDone_01_08 " );	// The tip for them is forged from hardened steel, and their feathers are made in such a special way that it allows you to shoot much more accurately.
	AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowDone_01_10 " );	// Bosper makes these arrows just for me.
	AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowDone_01_11 " );	// And before, he only did it for my grandfather! And Bosper's father, in turn, sold them only to my grandfather's father.
	AI_Output(self,other, " DIA_HUN_741_Falk_BringArrowDone_01_12 " );	// So, we can say that these arrows are our family heirloom!
	MIS_LETTERFALK = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_LETTERFALK,LOG_SUCCESS);
	B_LogEntry( TOPIC_LETTERFALK , " Falk thanked me for delivering the one hundred branded arrows that Bosper gave him for him. " );
};


instance DIA_HUN_741_FALK_F(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_f_condition;
	information = dia_hun_741_falk_f_info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};


func int dia_hun_741_falk_f_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_teachabout))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_f_info()
{
	AI_Output(other, self, " DIA_HUN_741_Falk_F_01_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_HUN_741_Falk_F_01_01 " );	// I can show you how to fight with two-handed weapons.
	Log_CreateTopic(TOPIC_HUNTERTEACHERS,LOG_NOTE);
	B_LogEntry( TOPIC_HUNTERTEACHERS , " Falk can teach me two-handed combat. " );
};


instance DIA_HUN_741_FALK_2H(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_2h_condition;
	information = dia_hun_741_falk_2h_info;
	permanent = TRUE;
	description = " I want to learn how to use a two-handed sword. " ;
};


func int dia_hun_741_falk_2h_condition()
{
	if ( Npc_KnowsInfo ( other , their_time_741_falk_f ))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_2h_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_2H_01_00 " );	// I want to learn how to wield a two-handed sword.
	Info_ClearChoices(dia_hun_741_falk_2h);
	Info_AddChoice(dia_hun_741_falk_2h,Dialog_Back,dia_hun_741_falk_2h_back);
	Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_hun_741_falk_2h_1);
	Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_hun_741_falk_2h_5);
};

func void dia_hun_741_falk_2h_back()
{
	Info_ClearChoices(dia_hun_741_falk_2h);
};

func void dia_hun_741_falk_2h_1()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,60))
	{
		if ( FALKTEACHFT  ==  FALSE )
		{
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_1_01_01 " );	// Okay, let's start with the simplest.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_1_01_02 " );	// Hold the sword horizontally. You will need a big swing to attack the enemy with heavy weapons.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_1_01_03 " );	// Raise your hand and strike vertically down. Usually this is enough to get rid of any enemy.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_1_01_04 " );	// Use the momentum of the movement to return to the starting position.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_1_01_05 " );	// A two-handed sword is just perfect for side slashes to keep the enemy at bay.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_1_01_06 " );	// Try starting with this.
			FALKTEACHFT = TRUE;
		};
		if((FALKTEACHST == FALSE) && (other.HitChance[NPC_TALENT_2H] >= 60))
		{
			AI_Output(other,self, " DIA_HUN_741_Falk_2H_1_01_07 " );	// I want to learn more about the two-handed sword.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_1_01_08 " );	// First of all, change the original stance. Hold the sword upright, grasp the hilt with both hands and draw it to the side.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_1_01_09 " );	// Now quickly move him down and swing from the shoulder. And now - a chopping blow to the right!
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_1_01_10 " );	// The enemy won't stand a chance.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_1_01_11 " );	// From the same position, you can deliver a sharp thrust forward to drive the enemy away.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_1_01_12 " );	// Turn around to give the sword its proper boost - and another slash!
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_1_01_13 " );	// If this is not enough, the sword will easily return to its original position by inertia.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_1_01_14 " );	// When the combo is over, block and wait for the moment to attack again.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_1_01_15 " );	// The secret of success lies in the alternation of strikes and fighting stances.
			FALKTEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_741_falk_2h);
		Info_AddChoice(dia_hun_741_falk_2h,Dialog_Back,dia_hun_741_falk_2h_back);
		Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_hun_741_falk_2h_1);
		Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_hun_741_falk_2h_5);
	};
};

func void dia_hun_741_falk_2h_5()
{
	if(B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,60))
	{
		if ( FALKTEACHFT  ==  FALSE )
		{
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_5_01_01 " );	// Okay, let's start with the simplest.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_5_01_02 " );	// Hold the sword horizontally. You will need a big swing to attack the enemy with heavy weapons.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_5_01_03 " );	// Raise your hand and strike vertically down. Usually this is enough to get rid of any enemy.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_5_01_04 " );	// Use the momentum of the movement to return to the starting position.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_5_01_05 " );	// A two-handed sword is just perfect for side slashes to keep the enemy at bay.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_5_01_06 " );	// Try starting with this.
			FALKTEACHFT = TRUE;
		};
		if((FALKTEACHST == FALSE) && (other.HitChance[NPC_TALENT_2H] >= 60))
		{
			AI_Output(other,self, " DIA_HUN_741_Falk_2H_5_01_07 " );	// I want to learn more about the two-handed sword.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_5_01_08 " );	// First of all, change the original stance. Hold the sword upright, grasp the hilt with both hands and draw it to the side.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_5_01_09 " );	// Now quickly move him down and swing from the shoulder. And now - a chopping blow to the right!
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_5_01_10 " );	// The enemy won't stand a chance.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_5_01_11 " );	// From the same position, you can deliver a sharp thrust forward to drive the enemy away.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_5_01_12 " );	// Turn around to give the sword its proper boost - and another slash!
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_5_01_13 " );	// If this is not enough, the sword will easily return to its original position by inertia.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_5_01_14 " );	// When the combo is over, block and wait for the moment to attack again.
			AI_Output(self,other, " DIA_HUN_741_Falk_2H_5_01_15 " );	// The secret of success lies in the alternation of strikes and fighting stances.
			FALKTEACHST = TRUE;
		};
		Info_ClearChoices(dia_hun_741_falk_2h);
		Info_AddChoice(dia_hun_741_falk_2h,Dialog_Back,dia_hun_741_falk_2h_back);
		Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_hun_741_falk_2h_1);
		Info_AddChoice(dia_hun_741_falk_2h,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_hun_741_falk_2h_5);
	};
};


instance DIA_HUN_741_FALK_FALKGRANDFATHER(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_falkgrandfather_condition;
	information = dia_hun_741_falk_falkgrandfather_info;
	permanent = FALSE;
	description = " I found something very interesting. " ;
};


func int dia_hun_741_falk_falkgrandfather_condition()
{
	if(Npc_KnowsInfo(other,dia_hun_741_falk_grand) && (FINDFALKGRANDFATHERSEEK_01 == TRUE) && (Npc_HasItems(other,itwr_falkgrandfather_01) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_falkgrandfather_info()
{
	B_GivePlayerXP(50);
	AI_Output(other, self, " DIA_HUN_741_GF_01_00 " );	// I found one very interesting thing. And she might be of interest to you.
	AI_Output(self,other, " DIA_HUN_741_GF_01_01 " );	// What's the thing?
	AI_Output(other, self, " DIA_HUN_741_GF_01_02 " );	// This old note. It mentions the name Ben. I think that was your grandfather's name too. It is so?
	AI_Output(self,other, " DIA_HUN_741_GF_01_03 " );	// (lost) What? Let me see her!
	B_GiveInvItems(other,self,itwr_falkgrandfather_01,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_HUN_741_GF_01_05 " );	// Judging by the text, it was written by a hunter.
	AI_Output(self,other, " DIA_HUN_741_GF_01_06 " );	// Where did you find this piece of paper?
	AI_Output(other,self, " DIA_HUN_741_GF_01_07 " );	// Not far from the old ruins in the north.
	AI_Output(self,other,"DIA_HUN_741_GF_01_08");	//Правда?
	AI_Output(self,other, " DIA_HUN_741_GF_01_09 " );	// I don't know - maybe it's a coincidence, but that's where my grandfather went hunting seven years ago.
	AI_Output(self,other, " DIA_HUN_741_GF_01_10 " );	// (with sadness) After that, he disappeared without a trace.
	Info_ClearChoices(dia_hun_741_falk_falkgrandfather);
	Info_AddChoice(dia_hun_741_falk_falkgrandfather, " I'm sorry again. " ,dia_hun_741_falk_falkgrandfather_no);
	Info_AddChoice(dia_hun_741_falk_falkgrandfather, " Is there anything I can help you with? " ,dia_hun_741_falk_falkgrandfather_yes);
};

func void dia_hun_741_falk_falkgrandfather_no()
{
	AI_Output(self,other, " DIA_HUN_741_GF_No_01_02 " );	// In any case, nothing can be changed now.
	Info_ClearChoices(dia_hun_741_falk_falkgrandfather);
};

func void dia_hun_741_falk_falkgrandfather_yes()
{
	AI_Output(other,self, " DIA_HUN_741_GF_Yes_01_00 " );	// Maybe I can help you with something?
	AI_Output(self,other,"DIA_HUN_741_GF_Yes_01_01");	//Ты? И чем же?
	AI_Output(other,self, " DIA_HUN_741_GF_Yes_01_02 " );	// Well, for example, find out what happened to your grandfather.
	AI_Output(self,other, " DIA_HUN_741_GF_Yes_01_06 " );	// You're doing me a huge favor, mate!
	AI_Output(self,other, " DIA_HUN_741_GF_Yes_01_11 " );	// Old Ben was always interested in all sorts of unusual things.
	AI_Output(self,other, " DIA_HUN_741_GF_Yes_01_12 " );	// By the way, this was the reason why he then decided to go hunting to those old ruins.
	AI_Output(self,other, " DIA_HUN_741_GF_Yes_01_14 " );	// He often talked about this, and he was constantly tormented by the question: where did they come from and who built them.
	AI_Output(self,other, " DIA_HUN_741_GF_Yes_01_15 " );	// Perhaps these ancient buildings are somehow connected with his disappearance. But it's most likely just speculation.
	AI_Output(other,self, " DIA_HUN_741_GF_Yes_01_16 " );	// I think this is enough to get started. I'll start searching.
	AI_Output(self,other, " DIA_HUN_741_GF_Yes_01_17 " );	// Then good luck on your quest, mate!
	FINDFALKGRANDFATHERSEEK_01_DONE = TRUE;
	if(MIS_FALKGRANDFATHERSEEK == FALSE)
	{
		MIS_FALKGRANDFATHERSEEK = LOG_Running;
		Log_CreateTopic(TOPIC_FALKGRANDFATHERSEEK,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_FALKGRANDFATHERSEEK,LOG_Running);
		B_LogEntry( TOPIC_FALKGRANDFATHERSEEK , " After Falk told me about his grandfather Ben, I decided to show him the note I found, which also mentions the name Ben. It seems that it was his grandfather who wrote it - old Ben was always interested in everything unusual. Therefore, he could go in search of a place where that strange beast that Ben shot during his last hunt could come from. " );
	}
	else if(MIS_FALKGRANDFATHERSEEK == LOG_Running)
	{
		B_LogEntry( TOPIC_FALKGRANDFATHERSEEK , " I showed Falk a note I found that mentions the name Ben. It looks like it was his grandfather who wrote it - old Ben was always interested in everything unusual. So he could go in search of a place where that strange beast could come from Ben shot during his last hunt. " );
	};
	Info_ClearChoices(dia_hun_741_falk_falkgrandfather);
};


instance DIA_HUN_741_FALK_FALKGRANDFATHERPROGRESS(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_falkgrandfatherprogress_condition;
	information = dia_hun_741_falk_falkgrandfatherprogress_info;
	permanent = TRUE;
	description = " Regarding my searches... " ;
};


func int dia_hun_741_falk_falkgrandfatherprogress_condition()
{
	if((MIS_FALKGRANDFATHERSEEK == LOG_Running) && (FINDFALKGRANDFATHERSEEK_01_DONE == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_falkgrandfatherprogress_info()
{
	var int bonuscount;

	bonuscount = FALSE ;
	AI_Output(other,self, " DIA_HUN_741_GFProgress_Info_01_00 " );	// Regarding my searches...
	AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_01 " );	// Yes? Any news?

	if((Npc_HasItems(other,itam_benkenob) >= 1) || ((FINDFALKGRANDFATHERSEEK_02 == TRUE) && (FINDFALKGRANDFATHERSEEK_02_DONE == FALSE) && (Npc_HasItems(other,itwr_galkgrandfather_02) >= 1)) || ((FINDFALKGRANDFATHERSEEK_03 == TRUE) && (FINDFALKGRANDFATHERSEEK_03_DONE == FALSE) && (Npc_HasItems(other,itwr_halkgrandfather_03) >= 1)) || ((FINDFALKGRANDFATHERSEEK_04 == TRUE) && (FINDFALKGRANDFATHERSEEK_04_DONE == FALSE) && (Npc_HasItems(other,itwr_jalkgrandfather_04) >= 1)) || ((FINDFALKGRANDFATHERSEEK_FINAL == TRUE) && (FINDFALKGRANDFATHERSEEK_FINAL_DONE == FALSE) && (Npc_HasItems(other,itwr_kalkgrandfather_final) >= 1)) || ((FINDFALKGRANDFATHERSEEK_FINALEXT == TRUE) && (FINDFALKGRANDFATHERSEEK_FINALEXT_DONE == FALSE) && (Npc_HasItems(other,itwr_lalkgrandfather_finalext) >= 1)))
	{
		AI_Output(other,self, " DIA_HUN_741_GFProgress_Info_01_02 " );	// You guessed it. I really learned something.
		AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_03 " );	// Then don't delay - speak!

		if (Npc_HasItems(other,itam_benkenob) >=  1 )
		{
			if(FINDFALKGRANDFATHERSEEK_02_DONE == FALSE)
			{
				bonuscount = bonuscount + 100;
				FINDFALKGRANDFATHERSEEK_02_DONE = TRUE;
			};
			if(FINDFALKGRANDFATHERSEEK_03_DONE == FALSE)
			{
				bonuscount = bonuscount + 100;
				FINDFALKGRANDFATHERSEEK_03_DONE = TRUE;
			};
			if(FINDFALKGRANDFATHERSEEK_FINAL_DONE == FALSE)
			{
				bonuscount = bonuscount + 100;
				FINDFALKGRANDFATHERSEEK_FINAL_DONE = TRUE;
			};
			if(FINDFALKGRANDFATHERSEEK_FINALEXT_DONE == FALSE)
			{
				bonuscount = bonuscount + 100;
				FINDFALKGRANDFATHERSEEK_FINALEXT_DONE = TRUE;
			};
			bonuscount = bonuscount + 500;
			B_GivePlayerXP(bonuscount);
			AI_Output(other,self, " DIA_HUN_741_GFProgress_Info_01_04 " );	// Here, I found this old amulet. The name 'Ben Kenob' is engraved on the back.
			B_GiveInvItems(other,self,itam_benkenob, 1 );
			Npc_RemoveInvItems(self,itam_benkenob,1);
			AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_07 " );	// Yes, I know this thing! So we weren't wrong.
			AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_10 " );	// Where did you find it?
			AI_Output(other,self, " DIA_HUN_741_GFProgress_Info_01_11 " );	// In the stomach of one of the creatures I killed - a huge female praying mantis.
			AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_13 " );	// Now everything is clear. It looks like this bastard killed my grandfather.
			AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_15 " );	// Okay, there's nothing you can do about it.
			AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_16 " );	// But I thank you for your help. And as a token of my gratitude, please accept this modest reward from me.
			B_GiveInvItems(self,other,ItMi_Gold,1000);
			MIS_FALKGRANDFATHERSEEK = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_FALKGRANDFATHERSEEK,LOG_SUCCESS);
   			; _ _ _ _ _ _
		}
		else
		{
			if((FINDFALKGRANDFATHERSEEK_02 == TRUE) && (FINDFALKGRANDFATHERSEEK_02_DONE == FALSE) && (Npc_HasItems(other,itwr_galkgrandfather_02) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self, " DIA_HUN_741_GFProgress_Info_01_20 " );	// Here, I found this note in one of the caves on the northeast coast of the island.
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_21 " );	// True? I wonder where he comes from?
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_22 " );	// As far as I know, you can only get there by ship.
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_23 " );	// (confused) Let me see...
				B_GiveInvItems(other,self,itwr_galkgrandfather_02,1);
				B_UseFakeScroll();
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_26 " );	// Hmmm... Very interesting. Anything else?
				FINDFALKGRANDFATHERSEEK_02_DONE = TRUE;
			};
			if((FINDFALKGRANDFATHERSEEK_03 == TRUE) && (FINDFALKGRANDFATHERSEEK_03_DONE == FALSE) && (Npc_HasItems(other,itwr_halkgrandfather_03) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self, " DIA_HUN_741_GFProgress_Info_01_27 " );	// Another note I found in a small crevice.
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_29 " );	// Give me this letter.
				B_GiveInvItems(other,self,itwr_halkgrandfather_03,1);
				B_UseFakeScroll();
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_31 " );	// Judging by the notes, that part of the island impressed him a lot!
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_32 " );	// Looks like he decided to investigate it thoroughly.
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_34 " );	// Good. The picture seems to be starting to clear up. Is that all you've learned?
				FINDFALKGRANDFATHERSEEK_03_DONE = TRUE;
			};
			if((FINDFALKGRANDFATHERSEEK_04 == TRUE) && (FINDFALKGRANDFATHERSEEK_04_DONE == FALSE) && (Npc_HasItems(other,itwr_jalkgrandfather_04) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self, " DIA_HUN_741_GFProgress_Info_01_35 " );	// I found this piece of paper in the great canyon, which is located in the west of that valley.
				B_GiveInvItems(other,self,itwr_jalkgrandfather_04,1);
				B_UseFakeScroll();
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_39 " );	// Hmmm...(thoughtfully) He writes that he thought this place was too dangerous.
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_40 " );	// I hope nothing bad happened to him there.
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_42 " );	// Any other news?
				FINDFALKGRANDFATHERSEEK_04_DONE = TRUE;
			};
			if((FINDFALKGRANDFATHERSEEK_FINAL == TRUE) && (FINDFALKGRANDFATHERSEEK_FINAL_DONE == FALSE) && (Npc_HasItems(other,itwr_kalkgrandfather_final) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self, " DIA_HUN_741_GFProgress_Info_01_43 " );	// I found this letter not far from the swamp, which is located in the east of the valley.
				B_GiveInvItems(other,self,itwr_kalkgrandfather_final,1);
				B_UseFakeScroll();
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_49 " );	// Interesting. No more news?
				FINDFALKGRANDFATHERSEEK_FINAL_DONE = TRUE;
			};
			if((FINDFALKGRANDFATHERSEEK_FINALEXT == TRUE) && (FINDFALKGRANDFATHERSEEK_FINALEXT_DONE == FALSE) && (Npc_HasItems(other,itwr_lalkgrandfather_finalext) >= 1))
			{
				bonuscount = bonuscount + 50;
				AI_Output(other,self, " DIA_HUN_741_GFProgress_Info_01_50 " );	// Here's a note I found in the swamps. Ben went there in search of this strange creature.
				AI_Output(other,self, " DIA_HUN_741_GFProgress_Info_01_51 " );	// And his hunt doesn't seem to be going too well.
				B_GiveInvItems(other,self,itwr_lalkgrandfather_finalext,1);
				B_UseFakeScroll();
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_54 " );	// Hmmm... Yes, judging by the notes, that's the way it is.
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_55 " );	// Looks like that beast turned out to be very cunning, since he can’t track her down in any way.
				AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_58 " );	// Did you find anything else?
				FINDFALKGRANDFATHERSEEK_FINALEXT_DONE = TRUE;
			};

			B_GivePlayerXP(bonuscount);
			AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_59");	//Пока все.
			AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_60 " );	// Good! Keep looking, maybe you'll find something else.
		};
	}
	else
	{
		AI_Output(other,self,"DIA_HUN_741_GFProgress_Info_01_62");	//Пока нет.
		AI_Output(self,other, " DIA_HUN_741_GFProgress_Info_01_63 " );	// (sadly) Okay, if you find out anything, let me know.
	};
};


instance DIA_HUN_741_FALK_HUNTERCHALLANGE(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_hunterchallange_condition;
	information = dia_hun_741_falk_hunterchallange_info;
	permanent = FALSE;
	description = " Can I lead your camp? " ;
};


func int dia_hun_741_falk_hunterchallange_condition()
{
	if ( Npc_KnowsInfo ( other , dia_time_741_falk_main ) && ( MIS_HUNTERCHALLANGE  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hunterchallange_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_HCh_01_00 " );	// Can I lead your camp?
	AI_Output(self,other, " DIA_HUN_741_Falk_HCh_01_01 " );	// Since I'm the best hunter in the camp right now, you can challenge me.
	AI_Output(self,other, " DIA_HUN_741_Falk_HCh_01_02 " );	// After that, we will have a hunting duel, which will show which of us is the best.
	AI_Output(other,self, " DIA_HUN_741_Falk_HCh_01_03 " );	// Then I challenge you!
	AI_Output(self,other, " DIA_HUN_741_Falk_HCh_01_05 " );	// Wish alone won't be enough here.
	AI_Output(self,other, " DIA_HUN_741_Falk_HCh_01_07 " );	// If you want to compete with me in the art of hunting, you must first gain the respect and support of other hunters.
	AI_Output(self,other, " DIA_HUN_741_Falk_HCh_01_10 " );	// When most of them are in your favor, then we'll talk about it.
	B_LogEntry( TOPIC_HUNTERSWORK , " Falk is considered the best hunter among the other guys settled in the camp. In order to compete with him for this title, first of all, I must enlist the support of other hunters. " );
	CANHUNTERCHALLANGE = TRUE;
};


instance DIA_HUN_741_FALK_CANIHUNTERCHALLANGE(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_canihunterchallange_condition;
	information = dia_hun_741_falk_canihunterchallange_info;
	permanent = TRUE;
	description = " What do they say about me at camp? " ;
};


func int dia_hun_741_falk_canihunterchallange_condition()
{
	if((CANHUNTERCHALLANGE == TRUE) && (MIS_HUNTERCHALLANGE == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_canihunterchallange_info()
{
	was int ransl;

	AI_Output(other,self, " DIA_HUN_741_Falk_CanIHCh_01_00 " );	// What do they say about me in the camp?
	if(HUNTCHALLENGECOUNT == FALSE)
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_01 " );	// Nothing yet. So better get down to business instead of wagging your tongue.
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_02 " );	// Well, I talked to a few people...
		AI_Output(other,self,"DIA_HUN_741_Falk_CanIHCh_01_03");	//И?
		if(HUNTCHALLENGECOUNT >= 7)
		{
			B_GivePlayerXP(500);
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_04 " );	// It seems that many in the camp are already ready to support you.
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_05 " );	// You have earned the respect of many hunters!
			AI_Output(other,self, " DIA_HUN_741_Falk_CanIHCh_01_06 " );	// Does this mean that now I can compete with you for the title of the best hunter?
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_07 " );	// Yes, - consider that you have such a chance!
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_09 " );	// Now, to resolve our dispute, we'll have a little contest with you.
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_10 " );	// And its winner will be able to call himself the best hunter of this camp.
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_14 " );	// Listen carefully...
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_15 " );	// Somewhere on the island there is one rather rare animal. Hunters gave him the nickname Slockers.
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_16 " );	// This creature looks a bit like a scavenger, but unlike those stupid birds, it's pretty cunning and extremely cautious.
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_17 " );	// Many have tried to track him down, but no one has been able to do so.
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_19 " );	// That's what we'll be hunting for.
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_20 " );	// We need to track down this animal and shoot it, and bring the skin taken from it as evidence.
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_21 " );	// If you can do it before me, you'll win our bet... (doubtfully)
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_23 " );	// So don't waste your time and go hunting.
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_24 " );	// I'll leave a little later - I'll give you a little chance. (laughs)
			AI_Output(other,self, " DIA_HUN_741_Falk_CanIHCh_01_25 " );	// See you then.
			TIMER_HUNTERCHALLANGE = Wld_GetDay();
			MIS_HUNTERCHALLANGE = LOG_Running;
			Log_CreateTopic(TOPIC_HUNTERCHALLANGE,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_HUNTERCHALLANGE,LOG_Running);
			B_LogEntry( TOPIC_HUNTERCHALLANGE , " I decided to challenge Falk and compete with him for the title of the best hunter in the camp. Falk offered me a contest in which the winner as the strongest would acquire this status. The essence of the contest is this: hunt down and shoot a small animal called Slocers " Judging by Falk's description, this creature resembles a scavenger. As evidence that it was I who first killed this beast, it is enough for me to show Falk the skin of the killed Slocers. " );
			Log_AddEntry( TOPIC_HUNTERSWORK , " Falk has accepted my challenge. Now it's up to me to prove to everyone that I can rightfully hold the title of the best hunter. " );
			Npc_ExchangeRoutine(self,"HuntSlokers");
			AI_StopProcessInfos(self);
			ransl = Hlp_Random( 7 );

			if(ransl == 0)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_SLOKERS_01");
			}
			else if(ransl == 1)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_MEDIUMFOREST_KAP2_29");
			}
			else if(ransl == 2)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_NW_FOREST_PATH_80_1_MOVEMENT8_M_04");
			}
			else if(ransl == 3)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_CITY_TO_FOREST_32");
			}
			else if(ransl == 4)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_TAVERNE_TROLLAREA_03_03");
			}
			else if(ransl == 5)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_NW_FARM3_PATH_11_SMALLRIVER_03");
			}
			else if(ransl == 6)
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_NW_BIGFARM_LAKE_03_MOVEMENT13");
			}
			else
			{
				Wld_InsertNpc(scavenger_sprint,"FP_ROAM_SLOKERS_01");
			};
		}
		else
		{
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_31 " );	// (smiles) Looks like you've already enlisted the support of some hunters. Pretty good, buddy!
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_32 " );	// However, this is still not enough for you to challenge me.
			AI_Output(self,other, " DIA_HUN_741_Falk_CanIHCh_01_34 " );	// But you're on the right track...
		};
	};
};


instance DIA_HUN_741_FALK_HUNTERCHALLANGEPROGRESS(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_hunterchallangeprogress_condition;
	information = dia_hun_741_falk_hunterchallangeprogress_info;
	permanent = TRUE;
	description = " How is the hunt going? " ;
};


func int dia_hun_741_falk_hunterchallangeprogress_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if((MIS_HUNTERCHALLANGE == LOG_Running) && (TIMER_HUNTERCHALLANGE <= (daynow - 1)))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hunterchallangeprogress_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_HChProgress_01_00 " );	// How is the hunt going?
	AI_Output(self,other, " DIA_HUN_741_Falk_HChProgress_01_01 " );	// Nothing to brag about yet. It seems that this creature really cannot be found during the day with fire.
	AI_Output(self,other, " DIA_HUN_741_Falk_HChProgress_01_02 " );	// But be sure - she will definitely not leave me, and I will win our argument.
	AI_Output(other,self, " DIA_HUN_741_Falk_HChProgress_01_03 " );	// We'll see about that!
};


instance DIA_TIME_741_FALK_HUNTERCHALLANGEDONE (C_Info);
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_hunterchallangedone_condition;
	information = dia_hun_741_falk_hunterchallangedone_info;
	permanent = TRUE;
	description = " I won our bet! " ;
};


func int dia_hun_741_falk_hunterchallangedone_condition()
{
	if((MIS_HUNTERCHALLANGE == LOG_Running) && (Npc_HasItems(other,itat_slokersfur) >= 1))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_hunterchallangedone_info()
{
	B_GivePlayerXP(500);
	self.flags = 0;
	AI_Output(other,self, " DIA_HUN_741_Falk_HChDone_01_00 " );	// I won our bet!
	AI_Output(other,self, " DIA_HUN_741_Falk_HChDone_01_02 " );	// I have a Slockers skin.
	AI_Output(self,other, " DIA_HUN_741_Falk_HChDone_01_03 " );	// Come on? It just can't be!
	B_GiveInvItems(other,self,itat_slokersfur,1);
	Npc_RemoveInvItems(self,itat_slokersfur,1);
	AI_Output(self,other, " DIA_HUN_741_Falk_HChDone_01_05 " );	// Incredible! I can't believe my eyes... (quite confused) But how did you manage to track down this beast?
	AI_Output(other,self, " DIA_HUN_741_Falk_HChDone_01_06 " );	// This was pretty simple. Well, now you're ready to face the fact that I'm the best hunter in the camp?
	AI_Output(self,other, " DIA_HUN_741_Falk_HChDone_01_07 " );	// (sighing) Well, yes, it turns out that way. Well, you're the best, mate!

	if ((hero.attribute[ ATR_DEXTERITY ] > hero.attribute[ ATR_STRENGTH ]) && (hero.guild !=  GIL_KDF ) && (hero.guild !=  GIL_KDW ) && ( hero.guild != GIL_KDM ) && (hero.guild !=  GIL_KDM ! = GIL_NDM ) && (hero.guild != GIL_NDW ) && (hero.guild != GIL_NOV ) && (hero.guild != GIL_GUR ))    
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_HChDone_01_09 " );	// So accept my congratulations, and with them... (he hesitated) ...and this Keren bow.
		B_GiveInvItems(self,other,itrw_shadowbow,1);
		AI_Output(other,self, " DIA_HUN_741_Falk_HChDone_01_10 " );	// What is this bow?
		AI_Output(self,other, " DIA_HUN_741_Falk_HChDone_01_12 " );	// I have never held the best weapon in my hands!
		AI_Output(self,other, " DIA_HUN_741_Falk_HChDone_01_13 " );	// It is made from the wood of an old keren oak, which grows only in the distant forests of Myrtana, and at one time I inherited from my grandfather Ben.
		AI_Output(self,other, " DIA_HUN_741_Falk_HChDone_01_15 " );	// True, to shoot this bow you will need special arrows, a little different from the usual ones.
		AI_Output(self,other, " DIA_HUN_741_Falk_HChDone_01_17 " );	// Trader Bosper can make them.
		AI_Output(self,other, " DIA_HUN_741_Falk_HChDone_01_18 " );	// Just show him this bow and he'll understand.
		AI_Output(self,other, " DIA_HUN_741_Falk_HChDone_01_19 " );	// Well, good luck to you, mate!
		Log_AddEntry( TOPIC_HUNTERSWORK , " Falk also gave me a Keren bow. I'll need special arrows to shoot it, but Bosper can make them without any problem if I show him this bow. " );
		TakeShadowBow = TRUE;
	};

	MIS_HUNTERCHALLANGE = LOG_SUCCESS;
	MIS_HUNTERSWORK = LOG_SUCCESS;
	SAVESPOTHUNTER = TRUE;
	Log_SetTopicStatus(TOPIC_HUNTERCHALLANGE,LOG_SUCCESS);
	Log_SetTopicStatus(TOPIC_HUNTERSWORK,LOG_SUCCESS);
	B_LogEntry( TOPIC_HUNTERCHALLANGE , " I brought Slockers skin to Falk. He was discouraged by my victory, but kept his word and recognized me as the best hunter in the camp. " );
};


instance DIA_HUN_741_FALK_GATHERARMY(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_gatherarmy_condition;
	information = dia_hun_741_falk_gatherarmy_info;
	permanent = FALSE;
	description = " You seem to be excited about something. " ;
};

func int dia_hun_741_falk_gatherarmy_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_gatherarmy_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_GatherArmy_01_00 " );	// You seem to be excited about something.
	AI_Output(self,other, " DIA_HUN_741_Falk_GatherArmy_01_01 " );	// The area is full of orcs!
	AI_Output(self,other, " DIA_HUN_741_Falk_GatherArmy_01_06 " );	// Good thing our camp is off the main road and the orcs haven't found it yet.
	AI_Output(self,other, " DIA_HUN_741_Falk_GatherArmy_01_08 " );	// And where the hell have all the king's paladins gone? Aren't they supposed to protect us from these creatures?
	AI_Output(other,self, " DIA_HUN_741_Falk_GatherArmy_01_09 " );	// Lord Hagen is about to march with his paladins against them.
	AI_Output(other,self, " DIA_HUN_741_Falk_GatherArmy_01_10 " );	// But he doesn't have enough men yet to openly fight them.
};


instance DIA_HUN_741_FALK_GATHERARMYANSWER(C_Info)
{
	npc = hun_741_falk;
	nr = 3;
	condition = dia_hun_741_falk_gatherarmyanswer_condition;
	information = dia_hun_741_falk_gatherarmyanswer_info;
	permanent = FALSE;
	description = " By the way, would you like to join his army? " ;
};

func int dia_hun_741_falk_gatherarmyanswer_condition()
{
	if(Npc_KnowsInfo(hero,DIA_HUN_741_Falk_GatherArmy) == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_gatherarmyanswer_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_GatherArmyAnswer_01_01 " );	// Would you like to join the paladin army yourself?
	AI_Output(other,self, " DIA_HUN_741_Falk_GatherArmyAnswer_01_02 " );	// I'm sure your help would be helpful.
	AI_Output(self,other, " DIA_HUN_741_Falk_GatherArmyAnswer_01_03 " );	// Are you suggesting we fight the orcs? But we are hunters, not warriors!
	AI_Output(self,other, " DIA_HUN_741_Falk_GatherArmyAnswer_01_04 " );	// Of course, any of us is quite good with a sword and a bow, but I'm afraid that in an open battle we have no chance against them.

	if((MIS_BAREMCRAWLERARMOR == LOG_SUCCESS) && !Npc_IsDead(hun_744_barem))
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_GatherArmyAnswer_01_05 " );	// Besides, we don't even have normal armor... Well, except for Barem, of course.
		AI_Output(self,other, " DIA_HUN_741_Falk_GatherArmyAnswer_01_06 " );	// He somehow managed to get himself a fine armor made from the shells of crawlers.
		AI_Output(self,other, " DIA_HUN_741_Falk_GatherArmyAnswer_01_08 " );	// The rags that I and the rest of the guys are wearing will hardly be able to reliably protect us from orc axes.
		AI_Output(other,self, " DIA_HUN_741_Falk_GatherArmyAnswer_01_09 " );	// And if I get you the same armor?
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_GatherArmyAnswer_01_10 " );	// Besides, we don't even have normal armor.
		AI_Output(self,other, " DIA_HUN_741_Falk_GatherArmyAnswer_01_11 " );	// The rags that I and the rest of the guys are wearing will hardly be able to reliably protect us from orc axes.
		AI_Output(other,self, " DIA_HUN_741_Falk_GatherArmyAnswer_01_12 " );	// What if I get you some armor?
	};

	AI_Output(self,other, " DIA_HUN_741_Falk_GatherArmyAnswer_01_14 " );	// In them we would feel more confident than now.
	AI_Output(other,self, " DIA_HUN_741_Falk_GatherArmyAnswer_01_15 " );	// And how much armor do you need then?
	AI_Output(self,other, " DIA_HUN_741_Falk_GatherArmyAnswer_01_16 " );	// Well, with all the other guys, I think ten sets should be enough.
	AI_Output(other,self, " DIA_HUN_741_Falk_GatherArmyAnswer_01_17 " );	// I'll see what I can do.
	MIS_HUNTERSARMOR = LOG_Running;
	Log_CreateTopic(TOPIC_HUNTERSARMOR,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HUNTERSARMOR,LOG_Running);
	B_LogEntry( TOPIC_HUNTERSARMOR , " I've talked to Falk, head of the hunters. They seem to want to join Lord Hagen's army too. However, going out against a whole army of orcs in normal hunting armor is foolish and reckless, Falk thinks. If I can get it for them some more durable armor, then they will gladly help the paladins in the war with the orcs. Ten sets of armor will be enough. " );
	Log_AddEntry( TOPIC_HUNTERSARMOR , " As far as I remember, the mercenary Wolf could make armor from the shells of crawlers. I think they would be quite suitable for hunters. " );
	AI_StopProcessInfos(self);
};


instance DIA_HUN_741_FALK_GATHERARMYANSWERDONE(C_Info)
{
	npc = hun_741_falk;
	nr = 1;
	condition = dia_hun_741_falk_gatherarmyanswerdone_condition;
	information = dia_hun_741_falk_gatherarmyanswerdone_info;
	permanent = TRUE;
	description = " I got you some armor. " ;
};


func int dia_hun_741_falk_gatherarmyanswerdone_condition()
{
	if((MIS_HUNTERSARMOR == LOG_Running) && (Npc_HasItems(hero,ITAR_DJG_Crawler) >= 10))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_gatherarmyanswerdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_HUN_741_Falk_GatherArmyAnswerDone_01_01 " );	// I got you some armor.
	AI_Output(other,self, " DIA_HUN_741_Falk_GatherArmyAnswerDone_01_03 " );	// Here, take this. There are ten grand, just like you asked.
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,10);
	AI_Output(self,other, " DIA_HUN_741_Falk_GatherArmyAnswerDone_01_04 " );	// (assessing) Excellent armor! And, most importantly, they look very durable.
	AI_Output(self,other, " DIA_HUN_741_Falk_GatherArmyAnswerDone_01_07 " );	// Alright, we'll take on the orcs!
	HUN_JOINHAGEN = TRUE;
	MIS_HUNTERSARMOR = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_HUNTERSARMOR,LOG_SUCCESS);
	B_LogEntry( TOPIC_HUNTERSARMOR , " I got the hunters some new armor and Falk was pleased. " );
	Log_AddEntry( TOPIC_OR with GREATWAR , " The hunters have decided to join the paladin army. I'm sure this news will please Lord Hagen. " );
};


instance DIA_HUN_741_FALK_TRAVELONBIGLAND(C_Info)
{
	npc = hun_741_falk;
	nr = 1;
	condition = dia_hun_741_falk_travelonbigland_condition;
	information = dia_hun_741_falk_travelonbigland_info;
	permanent = FALSE;
	description = " Would you like to go to the mainland with me? " ;
};


func int dia_hun_741_falk_travelonbigland_condition()
{
	if(WHOTRAVELONBIGLAND == TRUE)
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_travelonbigland_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_HUN_741_Falk_TravelOnBigLand_01_00 " );	// Would you like to go to the mainland with me?
	AI_Output(self,other, " DIA_HUN_741_Falk_TravelOnBigLand_01_01 " );	// Not a bad idea, mate!
	AI_Output(self,other, " DIA_HUN_741_Falk_TravelOnBigLand_01_02 " );	// I've wanted to go there for a long time.
	AI_Output(other,self, " DIA_HUN_741_Falk_TravelOnBigLand_01_04 " );	// Then I'll wait for you on the ship.
	COUNTTRAVELONBIGLAND = COUNTTRAVELONBIGLAND + 1;
	FALKTOBIGLAND = TRUE ;
	B_LogEntry( TOPIC_SALETOBIGLAND , " Hunter Falk decided to sail with me. He has long wanted to visit the mainland. " );
	Npc_ExchangeRoutine(self,"SHIP");
	AI_StopProcessInfos(self);
};

instance DIA_TIME_741_Falk_IshiCurrat (C_Info) .
{
	npc = HUN_741_Falk;
	nr = 1;
	condition = DIA_HUN_741_Falk_IshiCurrat_condition;
	information = DIA_TIME_741_Falk_IshiCurrat_info;
	permanent = TRUE;
	description = " Do you think anyone would be interested in this trophy? " ;
};

func int DAY_TIME_741_Falk_IshiCurrat_condition();
{
	if (( HEROISHUNTER  ==  TRUE ) && ( FalkCanTeachArmor ==  TRUE ) && ( Npc_HasItems ( hero , ItAt_CurratIshi ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DAY_TIME_741_Falk_IshiCurrat_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_HUN_741_Falk_IshiCurrat_01_00 " );	// Do you think anyone would be interested in this trophy?
	AI_Output(self,other, " DIA_HUN_741_Falk_IshiCurrat_01_01 " );	// (with interest) Let me take a look.
	AI_Output(other,self,"DIA_HUN_741_Falk_IshiCurrat_01_02");	//Вот.
	B_GiveInvItems(other,self,ItAt_CurratIshi,1);
	Npc_RemoveInvItems(self,ItAt_CurratIshi,1);

	if(Trophy_IshiCurrat == TRUE)
	{
		Ext_RemoveFromSlot(other,"BIP01 PELVIS");
		Npc_RemoveInvItems(other,ItOut_IshiCurrat,Npc_HasItems(other,ItOut_IshiCurrat));
		Trophy_IshiCurrat = FALSE;
	};

	AI_Output(self,other, " DIA_HUN_741_Falk_IshiCurrat_01_03 " );	// Wow! Where did you get this thing?
	AI_Output(other,self, " DIA_HUN_741_Falk_IshiCurrat_01_04 " );	// What, impressive?
	AI_Output(self,other, " DIA_HUN_741_Falk_IshiCurrat_01_05 " );	// Say it too! I have never seen anything like it in my life.
	AI_Output(self,other, " DIA_HUN_741_Falk_IshiCurrat_01_06 " );	// At first glance, it resembles the ossified sting of a creature of monstrous proportions. Although...
	AI_Output(self,other, " DIA_HUN_741_Falk_IshiCurrat_01_08 " );	// (thoughtfully) You know, I was just thinking...
	AI_Output(other,self,"DIA_HUN_741_Falk_IshiCurrat_01_09");	//...и?
	AI_Output(self,other, " DIA_HUN_741_Falk_IshiCurrat_01_10 " );	// I guess I'll keep this trophy for myself. You don't mind, do you?
	AI_Output(other,self, " DIA_HUN_741_Falk_IshiCurrat_01_11 " );	// Well, it all depends on what you can offer me in return.
	AI_Output(self,other, " DIA_HUN_741_Falk_IshiCurrat_01_12 " );	// Fair. Here, I have a very rare magical drink with me.
	AI_Output(self,other, " DIA_HUN_741_Falk_IshiCurrat_01_13 " );	// True, I don't know its properties. But I think it's worth as much as your thing.
	AI_Output(self,other, " DIA_HUN_741_Falk_IshiCurrat_01_14 " );	// Well, how's the deal?
	AI_Output(other,self, " DIA_HUN_741_Falk_IshiCurrat_01_15 " );	// Okay, leave it to yourself.
	AI_Output(self,other, " DIA_HUN_741_Falk_IshiCurrat_01_16 " );	// (pretty) Well, nice. Here, have your drink! Just like I knew what the shore was for you.
	B_GiveInvItems(self,other,ItPo_ElixirSHadow,1);
};

instance DIA_HUN_741_FALK_NeedMorePeople(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_NeedMorePeople_condition;
	information = dia_hun_741_falk_NeedMorePeople_info;
	permanent = FALSE;
	description = " So I'm in charge now? " ;
};

func int dia_hun_741_falk_NeedMorePeople_condition()
{
	if((MIS_HUNTERCHALLANGE == LOG_SUCCESS) && (FalkHunters > 0))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_NeedMorePeople_info()
{
	Snd_Play("LevelUp");
	hero.exp = hero.exp + 500;
	AI_NoticePrint(3000,4098,NAME_Addon_HuntBonus);
	HuntBonus = TRUE;
	AI_Output(other,self, " DIA_HUN_741_Falk_NeedMorePeople_01_00 " );	// So I'm in charge now?
	AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_01_01 " );	// It turns out that yes. And here the fun begins for you!
	AI_Output(other,self, " DIA_HUN_741_Falk_NeedMorePeople_01_02 " );	// What do you mean?
	AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_01_03 " );	// As a senior hunter, you will now have to keep track of all the affairs in the camp.
	AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_01_04 " );	// In addition, you will have to deal with various issues with the city merchants.
	AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_01_05 " );	// For example, about the supply of meat and skins to the city.
	AI_Output(other,self, " DIA_HUN_741_Falk_NeedMorePeople_01_06 " );	// Ummm... you know, I was thinking... let's just leave it as it is.
	AI_Output(other,self, " DIA_HUN_741_Falk_NeedMorePeople_01_07 " );	// And one bow is enough for me.
	AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_01_08 " );	// (laughs) That's it, mate! Being in charge is not just empty words.
	AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_01_09 " );	// It's also a big responsibility. Including for those guys who live here.
	AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_01_10 " );	// By the way, since we're talking about guys...
	AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_01_11 " );	// I think we could use new hunters in the camp.
	AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_01_13 " );	// Orders from city merchants have been increasing in recent years. Especially for meat.
	AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_01_14 " );	// Looks like those fat boobies want to stock up on provisions in case the orcs encircle the city.
	AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_01_15 " );	// And of course, as you understand, there are not enough people for everyone!
	AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_01_16 " );	// So if you want to benefit the camp, you can look into this matter.
	AI_Output(other,self, " DIA_HUN_741_Falk_NeedMorePeople_01_17 " );	// And where can I find them?
	AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_01_18 " );	// I don't know. Try to look for them in the city or somewhere in the area.
	MIS_NewHunters = LOG_Running;
	Log_CreateTopic(TOPIC_NewHunters,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NewHunters,LOG_Running);
	) ; _ _ _
};

var int FalkHuntersUp;
var int FalkAbountNewHanters;

instance DIA_HUN_741_FALK_NeedMorePeople_Done(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_NeedMorePeople_Done_condition;
	information = dia_hun_741_falk_NeedMorePeople_Done_info;
	permanent = TRUE;
	important = TRUE;
};

func int dia_hun_741_falk_NeedMorePeople_Done_condition()
{
	if ((MIS_NewHunters == LOG_Running) && (TalbinBecameHunt ==  TRUE ) && (Npc_IsDead(VLK_4132_Talbin_NW) ==  FALSE ) && (Talbin_NW_InCamp ==  FALSE )) ;
	{
		return TRUE;
	}
	else  if ((MY_NewHunters == LOG_Running) && (GestatInHorinis ==  TRUE ) && (Npc_IsDead(VLK_4149_Gestath) ==  FALSE ) && (Gestath_InCamp ==  FALSE ))
	{
		return TRUE;
	}
	else  if ((MY_NewHunters == LOG_Running) && (BartokBecameHunt ==  TRUE ) && (Npc_IsDead(VLK_440_Bartok) ==  FALSE ) && (Bartok_InCamp ==  FALSE ))
	{
		return TRUE;
	}
	else if((MIS_NewHunters == LOG_Running) && (FalkHuntersUp >= FalkHunters))
	{
		return TRUE;
	};

	return  FALSE ;
};

func void dia_hun_741_falk_NeedMorePeople_Done_info()
{
	var int Xp_Hunt;

	if(FalkHuntersUp < FalkHunters)
	{
		if(FalkAbountNewHanters == FALSE)
		{
			AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_00 " );	// Great news! There are new hunters in the camp.
		}
		else
		{
			AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_01 " );	// While you were gone, there were still new hunters in the camp.
		};

		AI_Output(other,self, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_20 " );	// Who exactly?

		if (( TalbinBecameHunt ==  TRUE ) && ( Npc_IsDead ( VLK_4132_Talbin_NW ) ==  FALSE ) && ( Talbin_NW_InCamp ==  FALSE ))
		{
			Xp_Hunt += 500;
			AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_02 " );	// A guy named Talbin. I think it's a very good hunter!
			AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_03 " );	// It will certainly be useful to us.
			AI_Output(other,self, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_04 " );	// Clear. Anyone else?
			Talbin_NW_InCamp = TRUE;
			FalkHuntersUp += 1;
		};
		if ((GestatInHorinis ==  TRUE ) && (Npc_IsDead(VLK_4149_Gestath) ==  FALSE ) && (Gestath_InCamp ==  FALSE ))
		{
			Xp_Hunt += 300;
			AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_05 " );	// Hunter Gestat. I know this guy.
			AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_06 " );	// It's worth a lot to get such a master of hunting to our camp!
			AI_Output(other,self, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_07 " );	// I'm glad he came. No one else?
			Gestath_InCamp = TRUE;
			FalkHuntersUp += 1;
		};
		if ((BartokBecameHunt ==  TRUE ) && (Npc_IsDead(VLK_440_Bartok) ==  FALSE ) && (Bartok_InCamp ==  FALSE ))
		{
			Xp_Hunt += 200;
			AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_08 " );	// His name is Bartok. Although he is, of course, a little cowardly for a hunter.
			AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_09 " );	// But this is fixable. In the meantime, let him dry himself in the camp.
			AI_Output(other,self, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_10 " );	// Is that everyone who came?
			Bartok_InCamp = TRUE;
			FalkHuntersUp += 1;
		};
		if ((FalkHuntersUp >= FalkHunters) || ((Talbin_NW_InCamp ==  TRUE ) && (Gestath_InCamp ==  TRUE ) && (Bartok_InCamp ==  TRUE )))
		{
			Xp_Hunt += 1000;
			B_GivePlayerXP(Xp_Hunt);
			AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_11 " );	// For now, yes. But I guess we don't need more now.
			AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_12 " );	// You did a good job, mate.
			AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_13 " );	// Here, take this for your work. This ring is a great value for a hunter.
			B_GiveInvItems(self,other,ItRi_HuntRing,1);
			MIS_NewHunters = LOG_Success;
			Log_SetTopicStatus(TOPIC_NewHunters,LOG_Success);
			B_LogEntry(TOPIC_NewHunters, " Falk thinks there are enough hunters in the camp now. I did as he asked! " );
		}
		else
		{
			B_GivePlayerXP(Xp_Hunt);
			AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_16 " );	// For now, yes. But we need more people.
			AI_Output(other,self, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_17 " );	// Well, we need it so much.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_18 " );	// I believe that the problem in people has disappeared for now. Don't waste any more time looking.
		AI_Output(other,self, " DIA_HUN_741_Falk_NeedMorePeople_Done_01_19 " );	// As you say.
		MIS_NewHunters = LOG_Success;
		Log_SetTopicStatus(TOPIC_NewHunters,LOG_Success);
		B_LogEntry(TOPIC_NewHunters, " Falk thinks it's okay to stop searching. " );
	};
};


instance DIA_HUN_741_FALK_OrcBiter(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_OrcBiter_condition;
	information = dia_hun_741_falk_OrcBiter_info;
	permanent = FALSE;
	description = " Do you have another job for me? " ;
};

func int dia_hun_741_falk_OrcBiter_condition()
{
	if (Chapter >=  3 )
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_OrcBiter_info()
{
	AI_Output(other,self, " DIA_HUN_741_Falk_OrcBiter_01_00 " );	// Do you have another job for me?
	AI_Output(self,other, " DIA_HUN_741_Falk_OrcBiter_01_01 " );	// Locals say that a pack of orc biters has appeared near Bengar's farm.
	AI_Output(self,other, " DIA_HUN_741_Falk_OrcBiter_01_02 " );	// Apparently, they came from the passage that leads to the Valley of Mines.
	AI_Output(self,other, " DIA_HUN_741_Falk_OrcBiter_01_03 " );	// By itself, this creature is not very dangerous.
	AI_Output(self,other, " DIA_HUN_741_Falk_OrcBiter_01_04 " );	// But when they pack, they become a real problem!
	AI_Output(other,self, " DIA_HUN_741_Falk_OrcBiter_01_05 " );	// And what do you want from me?
	AI_Output(self,other, " DIA_HUN_741_Falk_OrcBiter_01_06 " );	// So you can deal with them, of course! For this, Bengar, and other peasants in the district, will thank us generously.
	AI_Output(self,other, " DIA_HUN_741_Falk_OrcBiter_01_07 " );	// Will this job suit you?
	AI_Output(other,self, " DIA_HUN_741_Falk_OrcBiter_01_08 " );	// Okay, I'll fix the biter problem.
	AI_Output(self,other, " DIA_HUN_741_Falk_OrcBiter_01_09 " );	// Great! Just let me know how you send them to the next world.
	AI_Output(other,self, " DIA_HUN_741_Falk_OrcBiter_01_10 " );	// Of course.
	MIS_OrcBiter = LOG_Running;
	Log_CreateTopic(TOPIC_OrcBiter,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OrcBiter,LOG_Running);
	B_LogEntry(TOPIC_OrcBiter, " Falk asked me to fix a problem with Orc Biters that have recently appeared near Bengar's farm. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(OrcBiter_Falk_01,"NW_FARM3_PATH_11_SMALLRIVER_112");
	Wld_InsertNpc(OrcBiter_Falk_02,"NW_FARM3_PATH_11_SMALLRIVER_17");
	Wld_InsertNpc(OrcBiter_Falk_03,"NW_FARM3_PATH_11_SMALLRIVER_16");
	Wld_InsertNpc(OrcBiter_Falk_04,"NW_FARM3_PATH_11_SMALLRIVER_11");
	Wld_InsertNpc(OrcBiter_Falk_05,"NW_FARM3_PATH_11_SMALLRIVER_18");
};

instance DIA_HUN_741_FALK_OrcBiter_Done(C_Info)
{
	npc = hun_741_falk;
	nr = 2;
	condition = dia_hun_741_falk_OrcBiter_Done_condition;
	information = dia_hun_741_falk_OrcBiter_Done_info;
	permanent = FALSE;
	description = " All biters are dead. " ;
};

func int dia_hun_741_falk_OrcBiter_Done_condition()
{
	if((MIS_OrcBiter == LOG_Running) && (Npc_IsDead(OrcBiter_Falk_01) == TRUE) && (Npc_IsDead(OrcBiter_Falk_02) == TRUE) && (Npc_IsDead(OrcBiter_Falk_03) == TRUE) && (Npc_IsDead(OrcBiter_Falk_04) == TRUE) && (Npc_IsDead(OrcBiter_Falk_05) == TRUE))
	{
		return TRUE;
	};
};

func void dia_hun_741_falk_OrcBiter_Done_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_HUN_741_Falk_OrcBiter_Done_01_00 " );	// All biters are dead.
	AI_Output(self,other, " DIA_HUN_741_Falk_OrcBiter_Done_01_01 " );	// Great, mate! I didn't even doubt that you could handle it.
	AI_Output(self,other, " DIA_HUN_741_Falk_OrcBiter_Done_01_02 " );	// Here, take your share of the work done.
	B_GiveInvItems(self,other,ItMi_Gold,300);
	AI_Output(other,self, " DIA_HUN_741_Falk_OrcBiter_Done_01_03 " );	// Thank you.
	MIS_OrcBiter = LOG_Success;
	Log_SetTopicStatus(TOPIC_OrcBiter,LOG_Success);
	B_LogEntry(TOPIC_OrcBiter, " I informed Falk that all the biters are dead. " );
};
