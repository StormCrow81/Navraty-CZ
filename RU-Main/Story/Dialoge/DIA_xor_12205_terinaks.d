

instance DIA_XOR_12205_TERINAKS_EXIT(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 999;
	condition = dia_xor_12205_terinaks_exit_condition;
	information = dia_xor_12205_terinaks_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_xor_12205_terinaks_exit_condition()
{
	return TRUE;
};

func void dia_xor_12205_terinaks_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XOR_12205_TERINAKS_HALLO(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 5;
	condition = dia_xor_12205_terinaks_hallo_condition;
	information = dia_xor_12205_terinaks_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_xor_12205_terinaks_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_hallo_info()
{
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_HALLO_01_00 " );	// Hmmm. Your face is familiar to me, mortal!
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_HALLO_01_03 " );	// Oh, yes. You are the one sent by the Guardians to help me fight Lucian.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_HALLO_01_05 " );	// Well... Since you're here now, you may know the truth.
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_HALLO_01_06 " );	// This is one of the Guardians' trials.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_HALLO_01_07 " );	// And I assume you passed ALL of their tests?
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_HALLO_01_08 " );	// Yes! Guardian Stonnos has accepted me as an Adept of the Circle. Now I am one of you.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_HALLO_01_11 " );	// I'm a bit surprised at what you've managed to achieve in such a short amount of time.
};


instance DIA_XOR_12205_TERINAKS_WHOYOU(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_whoyou_condition;
	information = dia_xor_12205_terinaks_whoyou_info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int dia_xor_12205_terinaks_whoyou_condition()
{
	return TRUE;
};

func void dia_xor_12205_terinaks_whoyou_info()
{
	AI_Output(other,self,"DIA_XOR_12205_Terinaks_WhoYou_01_00");	//Who are you?
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_WhoYou_01_01 " );	// My name is Tarinax, and I am the mentor of the Asgardians, warriors of the elements.
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_WhoYou_01_02 " );	// And who are the Asgardians?
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_WhoYou_01_06 " );	// The main purpose of the Asgardians is to bring the divine wisdom of the Guardians into this world.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_WhoYou_01_07 " );	// We are all their devoted and obedient servants, unquestioningly following their divine will...
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_WhoYou_01_08 " );	// ...and are ready to sacrifice our lives without hesitation for the sake of the goals they pursue.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_WhoYou_01_09 " );	// The one who doubts his devotion is simply not worthy of being a warrior of the elements, for the meaning of our life is only in serving the Creators!
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_WhoYou_01_10 " );	// Asgardians are also the personal guardians of the Keepers and keep their sacred rest in these halls.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_WhoYou_01_12 " );	// Like all other deities, the Creators also have enemies looking to destroy them.
};


instance DIA_XOR_12205_TERINAKS_CANTEACHME(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_canteachme_condition;
	information = dia_xor_12205_terinaks_canteachme_info;
	permanent = FALSE;
	description = " What can you teach me? " ;
};


func int dia_xor_12205_terinaks_canteachme_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_xor_12205_terinaks_whoyou ) && ( GUARDIACHMEWAR  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_canteachme_info()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_CanTeachMe_01_00 " );	// What can you teach me?
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_CanTeachMe_01_01 " );	// Lots of things. But I only teach Asgardians and those who choose this path.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_CanTeachMe_01_02 " );	// You haven't taken this path yet. Therefore, we have nothing to talk about yet!
};


instance DIA_XOR_12205_TERINAKS_PERM(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 4;
	condition = dia_xor_12205_terinaks_perm_condition;
	information = dia_xor_12205_terinaks_perm_info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int dia_xor_12205_terinaks_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_xor_12205_terinaks_whoyou))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_perm_info()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_Perm_01_00 " );	// How are things?
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Perm_01_01 " );	// Everything is calm.
};


instance DIA_XOR_12205_TERINAKS_TEACHME(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_teachme_condition;
	information = dia_xor_12205_terinaks_teachme_info;
	permanent = FALSE;
	description = " The Guardians sent me to you. " ;
};


func int dia_xor_12205_terinaks_teachme_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_xor_12205_terinaks_whoyou ) && ( GUARDIACHMEWAR  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_teachme_info()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_TeachMe_01_00 " );	// I was sent to you by the Guardians.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_TeachMe_01_01 " );	// Good. What do the Creators want from me?
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_TeachMe_01_02 " );	// They want you to be my mentor. My path is the path of a warrior!
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_TeachMe_01_03 " );	// Well, if it is their will, then so be it - I will become your mentor and teacher.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_TeachMe_01_04 " );	// However, you must understand that embarking on the path of the Elemental Warrior...
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_TeachMe_01_05 " );	// ...this is a great honor bestowed on only a select few.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_TeachMe_01_08 " );	// Only one goal should remain in your life, and this goal is to serve the Creators and their precepts!
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_TeachMe_01_12 " );	// What can you teach me?
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_TeachMe_01_13 " );	// The art of combat.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_TeachMe_01_14 " );	// For the Asgardians, this is a core discipline in which they have no equal among other mortals.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_TeachMe_01_18 " );	// And when you're ready to join our ranks, I'll let you in on the secrets of forging the finest armor this reality has to offer.
	B_LogEntry( TOPIC_GUARDIANS , " I have spoken to Master Tarinax. He will now be my mentor and can teach me the art of the warrior. " );
	TARINAKSTEACHME = TRUE;
};


instance DIA_XOR_12205_TERINAKS_BEXOR(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_bexor_condition;
	information = dia_xor_12205_terinaks_bexor_info;
	permanent = FALSE;
	description = " How do I become Asgard? " ;
};


func int dia_xor_12205_terinaks_bexor_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_bexor_info()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_BeXOR_01_00 " );	// How do I become Asgard?
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_BeXOR_01_01 " );	// To do this, you will have to defeat one of us in a fair fight.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_BeXOR_01_03 " );	// But, as you know, this will be no small feat.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_BeXOR_01_04 " );	// However, if you suddenly feel the strength to challenge us, tell me about it.
	B_LogEntry( TOPIC_GUARDIANS , " To become Asgard, the warrior of the Elements, I must challenge and defeat one of these warriors. " );
};


var int challengeharadrimfirsttime;

instance DIA_XOR_12205_TERINAKS_BATTLE(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_battle_condition;
	information = dia_xor_12205_terinaks_battle_info;
	permanent = TRUE;
	description = " I'm ready to challenge one of you! " ;
};


func int dia_xor_12205_terinaks_battle_condition()
{
	if(Npc_KnowsInfo(hero,dia_xor_12205_terinaks_bexor) && (TARINAKSBATTLEWIN == FALSE) && (TARINAKSTEACHME == TRUE) && (CHALANGEHARADRIMSTART == FALSE))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_battle_info()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_Battle_01_00 " );	// I'm ready to challenge one of you!
	if (Chapter >=  5 )
	{
		AI_Output(self,other, " DIA_XOR_12205_Terinaks_Battle_01_01 " );	// Okay. Are you sure about this?
		Info_ClearChoices(dia_xor_12205_terinaks_battle);
		Info_AddChoice(dia_xor_12205_terinaks_battle, " No, I changed my mind. " ,dia_xor_12205_terinaks_battle_no);
		Info_AddChoice(dia_xor_12205_terinaks_battle, " Yes, I'm sure. " ,dia_xor_12205_terinaks_battle_ok);
	}
	else
	{
		AI_Output(self,other, " DIA_XOR_12205_Terinaks_Battle_01_02 " );	// You're not ready for this yet!
		AI_Output(self,other, " DIA_XOR_12205_Terinaks_Battle_01_04 " );	// You're still weak, and you haven't shown yourself yet for me to believe it.
		AI_Output(self,other, " DIA_XOR_12205_Terinaks_Battle_01_05 " );	// I'll only let you fight one of us when I can see for myself that you're ready for this challenge.
		AI_StopProcessInfos(self);
	};
};

func void dia_xor_12205_terinaks_battle_no()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_Battle_No_01_00 " );	// No, I changed my mind.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Battle_No_01_01 " );	// Good. Then come back to it when you're ready.
	Info_ClearChoices(dia_xor_12205_terinaks_battle);
};

func void dia_xor_12205_terinaks_battle_ok()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_Battle_Ok_01_00 " );	// Yes, I'm ready.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Battle_Ok_01_01 " );	// Well, okay. In that case, one of my warriors is waiting for you.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Battle_Ok_01_02 " );	// Defeat him and you will be accepted into our Sacred Circle!

	if(CHALANGEHARADRIMFIRSTTIME == FALSE)
	{
		AI_Output(other,self, " DIA_XOR_12205_Terinaks_Battle_Ok_01_03 " );	// Where exactly should I fight him?
		AI_Output(self,other, " DIA_XOR_12205_Terinaks_Battle_Ok_01_04 " );	// The teleportation stone at the center of these halls will lead you to the combat grounds.
		AI_Output(self,other, " DIA_XOR_12205_Terinaks_Battle_Ok_01_05 " );	// Now go! The battle is waiting for you.
		CHALANGEHARADRIMFIRSTTIME = TRUE;
	};

	CHALLENGEHARADRIMSTART = TRUE ;
	AI_StopProcessInfos(self);
};

instance DIA_XOR_12205_TERINAKS_BATTLEWIN(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 1;
	condition = dia_xor_12205_terinaks_battlewin_condition;
	information = dia_xor_12205_terinaks_battlewin_info;
	permanent = FALSE;
	description = " I won this fight. " ;
};

func int dia_xor_12205_terinaks_battlewin_condition()
{
	if(Npc_KnowsInfo(hero,dia_xor_12205_terinaks_bexor) && (TARINAKSBATTLEWIN == TRUE) && (TARINAKSTEACHME == TRUE))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_battlewin_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_BattleWin_01_00 " );	// I won the fight.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_BattleWin_01_01 " );	// Well, my lessons have not been in vain then.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_BattleWin_01_03 " );	// Only another Asgard can defeat an Asgard in a fair fight. And this means only one thing - you proved that you have always been one of us.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_BattleWin_01_05 " );	// Welcome home brother.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_BattleWin_01_06 " );	// As a token of my recognition of your status, accept this sword from me. A Sword of Asgard!
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_BattleWin_01_07 " );	// This weapon is unmatched in combat and is the symbol of our Sacred Circle.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_BattleWin_01_08 " );	// It will become a part of you, and from the edge of this blade you will carry the power and wisdom of the Creators into this world!
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_BattleWin_01_09 " );	// However, before I give it to you, you will have to answer one simple question.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_BattleWin_01_10 " );	// What type of weapon do you prefer - one-handed or two-handed?
	BEHARADRIM = TRUE ;
	Snd_Play("LevelUP");
	B_LogEntry( TOPIC_GUARDIANS , " Master Tarinax elevated me to the rank of Asgard. I am now an Elemental Warrior. " );
	Info_ClearChoices(dia_xor_12205_terinaks_battlewin);
	Info_AddChoice(dia_xor_12205_terinaks_battlewin, " I prefer a one-handed sword. " ,dia_xor_12205_terinaks_battlewin_1h);
	Info_AddChoice(dia_xor_12205_terinaks_battlewin, " I prefer a two-handed sword. " ,dia_xor_12205_terinaks_battlewin_2h);
};

func void dia_xor_12205_terinaks_battlewin_1h()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_BattleWin_1H_01_00 " );	// I prefer a one-handed sword.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_BattleWin_1H_01_01 " );	// Good. Take this blade. Wield it with pride and honor, the honor of Asgard!
	CreateInvItems(self,itmw_1h_xaradrim, 1 );
	B_GiveInvItems(self,other,itmw_1h_xaradrim, 1 );
	Info_ClearChoices(dia_xor_12205_terinaks_battlewin);
};

func void dia_xor_12205_terinaks_battlewin_2h()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_BattleWin_2H_01_00 " );	// I prefer a two-handed sword.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_BattleWin_2H_01_01 " );	// Good. Take this blade. Wield it with pride and honor, the honor of Asgard!
	CreateInvItems(self,itmw_2h_xaradrim,1);
	B_GiveInvItems(self,other,itmw_2h_xaradrim,1);
	Info_ClearChoices(dia_xor_12205_terinaks_battlewin);
};


instance DIA_XOR_12205_TERINAKS_ARMOR(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 2;
	condition = dia_xor_12205_terinaks_armor_condition;
	information = dia_xor_12205_terinaks_armor_info;
	permanent = FALSE;
	description = " What about armor? " ;
};


func int dia_xor_12205_terinaks_armor_condition()
{
	if((BEHARADRIM == TRUE) && ((SBMode == TRUE) || (RealMode[2] == TRUE)))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_armor_info()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_Armor_01_00 " );	// What about armor?
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_Armor_01_01 " );	// You said you could teach me the secret of forging it.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Armor_01_02 " );	// Of course. Every Asgard wears similar armor.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Armor_01_03 " );	// There are two types of armor that I can teach you how to forge.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Armor_01_04 " );	// However, you can only choose one. So think carefully before making your choice.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Armor_01_05 " );	// So which one do you choose?
	Info_ClearChoices(dia_xor_12205_terinaks_armor);
	Info_AddChoice(dia_xor_12205_terinaks_armor, " Armor of Darkness (Equipment Requirement: 500 or more Agility) " ,dia_xor_12205_terinaks_armor_dark);
	Info_AddChoice(dia_xor_12205_terinaks_armor, " Armor of Light (Equip Requirement: 500 or more power) " ,dia_xor_12205_terinaks_armor_light);
};

func void dia_xor_12205_terinaks_armor_dark()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_Armor_Dark_01_00 " );	// I choose Dark Ore Armor.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Armor_Dark_01_01 " );	// Good choice. Now you can forge this armor yourself.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Armor_Dark_01_02 " );	// This is a great honor that few get.
	AI_Print( " Learned forging recipe - 'Dark Ore Armor' " );
	Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
	Snd_Play("LevelUP");
	PLAYER_TALENT_SMITH[34] = TRUE;
	PLAYER_TALENT_SMITH_34 = TRUE;
	B_LogEntry( TOPIC_ARMORTEACHER , " In order to forge the Armor of Darkness, I need: ten ingots of magic ore, two pieces of black ore, ten pieces of sulfur, five resin solutions, five pieces of coal, black pearl and a piece of adamant. " );
	Info_ClearChoices(dia_xor_12205_terinaks_armor);
};

func void dia_xor_12205_terinaks_armor_light()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_Armor_Light_01_00 " );	// I choose the ore armor of the Light.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Armor_Light_01_01 " );	// Good choice. Now you can forge this armor yourself.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Armor_Light_01_02 " );	// This is a great honor that few get.
	AI_Print( " Learned crafting recipe - 'Ore Armor of Light' " );
	Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
	Snd_Play("LevelUP");
	PLAYER_TALENT_SMITH[33] = TRUE;
	PLAYER_TALENT_SMITH_33 = TRUE;
	B_LogEntry( TOPIC_ARMORTEACHER , " In order to forge the ore armor of Light, I need: ten ingots of magic ore, a piece of black ore, ten pieces of sulfur, five resin solutions, five pieces of quartz, aquamarine and a piece of adamant. " );
	Info_ClearChoices(dia_xor_12205_terinaks_armor);
};

instance DIA_XOR_12205_TERINAKS_ADAMANT(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 2;
	condition = dia_xor_12205_terinaks_ADAMANT_condition;
	information = dia_xor_12205_terinaks_ADAMANT_info;
	permanent = FALSE;
	description = " About the armor... " ;
};

func int dia_xor_12205_terinaks_ADAMANT_condition()
{
	if((PLAYER_TALENT_SMITH[33] == TRUE) || (PLAYER_TALENT_SMITH[34] == TRUE))
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_ADAMANT_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_ADAMANT_01_00 " );	// About armor...
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_ADAMANT_01_01 " );	// Forging them requires something called adamant. What it is?
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_ADAMANT_01_02 " );	// This is a very rare metal of almost divine origin. All Asgardian armor is made from it.
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_ADAMANT_01_03 " );	// And where can I get it?
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_ADAMANT_01_04 " );	// Usually, its deposits are found only in places of huge accumulation of magical energy.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_ADAMANT_01_05 " );	// For only very strong magic can turn ordinary ore into this priceless metal.
	B_LogEntry( TOPIC_ARMORTEACHER , " According to Tarinax, adamant can only be found in places with a huge concentration of magic. " );
};

instance DIA_XOR_12205_TERINAKS_PERMTASK(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 2;
	condition = dia_xor_12205_terinaks_permtask_condition;
	information = dia_xor_12205_terinaks_permtask_info;
	permanent = FALSE;
	description = " Do you have any errands for me? " ;
};

func int dia_xor_12205_terinaks_permtask_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_permtask_info()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_PermTask_01_00 " );	// Do you have any errands for me?
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_PermTask_01_01 " );	// I'm afraid not. I think you should talk to the Guardians if you wish for tasks to do.
};


instance DIA_XOR_12205_TERINAKS_TEACH_MELEE(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 7;
	condition = dia_xor_12205_terinaks_teach_melee_condition;
	information = dia_xor_12205_terinaks_teach_melee_info;
	permanent = TRUE;
	description = " Teach me how to use a melee weapon. " ;
};

func int dia_xor_12205_terinaks_teach_melee_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_teach_melee_info()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_Teach_Melee_01_00 " );	// Teach me how to use a melee weapon.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Teach_Melee_01_01 " );	// Good. What do you want to know?
	Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
};

func void dia_xor_12205_terinaks_teach_melee_back()
{
	Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
};

func void dia_xor_12205_terinaks_teach_melee_1h_1()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_1H,1,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_melee_1h_5()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_1H,5,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_melee_2h_1()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_2H,1,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_melee_2h_5()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_2H,5,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_melee);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,Dialog_Back,dia_xor_12205_terinaks_teach_melee_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_xor_12205_terinaks_teach_melee_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_xor_12205_terinaks_teach_melee_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h1,B_GetLearnCostTalent(other,NPC_TALENT_1H,1)),dia_xor_12205_terinaks_teach_melee_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_melee,B_BuildLearnString(PRINT_Learn1h5,B_GetLearnCostTalent(other,NPC_TALENT_1H,5)),dia_xor_12205_terinaks_teach_melee_1h_5);
	};
};


instance DIA_XOR_12205_TERINAKS_TEACH_RANGED(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 8;
	condition = dia_xor_12205_terinaks_teach_ranged_condition;
	information = dia_xor_12205_terinaks_teach_ranged_info;
	permanent = TRUE;
	description = " Teach me how to use ranged weapons. " ;
};


func int dia_xor_12205_terinaks_teach_ranged_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_teach_ranged_info()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_Teach_Ranged_01_00 " );	// Teach me how to use ranged weapons.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Teach_Ranged_01_01 " );	// Good. What do you want to know?
	Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
};

func void dia_xor_12205_terinaks_teach_ranged_back()
{
	Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
};

func void dia_xor_12205_terinaks_teach_ranged_1h_1()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_CROSSBOW,1,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_ranged_1h_5()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_CROSSBOW,5,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_ranged_2h_1()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_BOW,1,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
	};
};

func void dia_xor_12205_terinaks_teach_ranged_2h_5()
{
	if(b_teachfighttalentpercenttarinaks(self,other,NPC_TALENT_BOW,5,100))
	{
		Info_ClearChoices(dia_xor_12205_terinaks_teach_ranged);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,Dialog_Back,dia_xor_12205_terinaks_teach_ranged_back);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),dia_xor_12205_terinaks_teach_ranged_2h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),dia_xor_12205_terinaks_teach_ranged_2h_5);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow1,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,1)),dia_xor_12205_terinaks_teach_ranged_1h_1);
		Info_AddChoice(dia_xor_12205_terinaks_teach_ranged,B_BuildLearnString(PRINT_LearnCrossBow5,B_GetLearnCostTalent(other,NPC_TALENT_CROSSBOW,5)),dia_xor_12205_terinaks_teach_ranged_1h_5);
	};
};

instance DIA_XOR_12205_TERINAKS_TEACH_SKILLS(C_Info)
{
	npc = xor_12205_terinaks;
	nr = 9;
	condition = dia_xor_12205_terinaks_teach_skills_condition;
	information = dia_xor_12205_terinaks_teach_skills_info;
	permanent = TRUE;
	description = " I want to increase my skills. " ;
};

func int dia_xor_12205_terinaks_teach_skills_condition()
{
	if(TARINAKSTEACHME == TRUE)
	{
		return TRUE;
	};
};

func void dia_xor_12205_terinaks_teach_skills_info()
{
	AI_Output(other,self, " DIA_XOR_12205_Terinaks_Teach_Skills_01_00 " );	// I want to increase my skills.
	AI_Output(self,other, " DIA_XOR_12205_Terinaks_Teach_Skills_01_01 " );	// Good. What do you want to know?
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

func void dia_xor_12205_terinaks_teach_skills_back()
{
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
};

func void dia_xor_12205_terinaks_teach_skills_str_1()
{
	b_teachattributepointstarinaks(self,other,ATR_STRENGTH,1,T_MEGA);
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

func void dia_xor_12205_terinaks_teach_skills_str_5()
{
	b_teachattributepointstarinaks(self,other,ATR_STRENGTH,5,T_MEGA);
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

func void dia_xor_12205_terinaks_teach_skills_dex_1()
{
	b_teachattributepointstarinaks(self,other,ATR_DEXTERITY,1,T_MEGA);
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

func void dia_xor_12205_terinaks_teach_skills_dex_5()
{
	b_teachattributepointstarinaks(self,other,ATR_DEXTERITY,5,T_MEGA);
	Info_ClearChoices(dia_xor_12205_terinaks_teach_skills);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,Dialog_Back,dia_xor_12205_terinaks_teach_skills_back);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),dia_xor_12205_terinaks_teach_skills_dex_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),dia_xor_12205_terinaks_teach_skills_dex_5);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR1,B_GetLearnCostAttribute(other,ATR_STRENGTH)),dia_xor_12205_terinaks_teach_skills_str_1);
	Info_AddChoice(dia_xor_12205_terinaks_teach_skills,B_BuildLearnString(PRINT_LearnSTR5,B_GetLearnCostAttribute(other,ATR_STRENGTH) * 5),dia_xor_12205_terinaks_teach_skills_str_5);
};

