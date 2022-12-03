

instance DIA_Jesper_EXIT(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 999;
	condition = DIA_Jesper_EXIT_Condition;
	information = DIA_Jesper_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Jesper_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Jesper_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Jesper_PICKPOCKET(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 900;
	condition = DIA_Jesper_PICKPOCKET_Condition;
	information = DIA_Jesper_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};


func int DIA_Jesper_PICKPOCKET_Condition()
{
	return  C_Robbery ( 80 , 180 );
};

func void DIA_Jesper_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Jesper_PICKPOCKET);
	Info_AddChoice(DIA_Jesper_PICKPOCKET,Dialog_Back,DIA_Jesper_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Jesper_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Jesper_PICKPOCKET_DoIt);
};

func void DIA_Jesper_PICKPOCKET_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,30);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Jesper_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Jesper_PICKPOCKET);
};


instance DIA_Jesper_Hello (C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Hallo_Condition;
	information = DIA_Jesper_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jesper_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Jesper_Hello_Info()
{
	AI_Output(self,other, " DIA_Jesper_Hallo_09_00 " );	// Hey, what are you doing here? You don't belong here!
	AI_Output(self,other, " DIA_Jesper_Hallo_09_01 " );	// So tell me what are you doing here?
	Info_ClearChoices(DIA_Jesper_Hallo);
	Info_AddChoice(DIA_Jesper_Hallo, " I came to kill you. " ,DIA_Jesper_Hallo_Kill);
	Info_AddChoice(DIA_Jesper_Hallo, " I'm just walking around here. " ,DIA_Jesper_Hallo_NurSo);

	if(Attila_Key == TRUE)
	{
		Info_AddChoice(DIA_Jesper_Hallo, " Attila gave me the key... " ,DIA_Jesper_Hallo_Willkommen);
	}
	else
	{
		Info_AddChoice(DIA_Jesper_Hallo, " I killed Attila! " ,DIA_Jesper_Hallo_Umgelegt);
	};

	DG_found = TRUE ;
};

func void DIA_Jesper_Hello_Kill()
{
	AI_Output(other,self, " DIA_Jesper_Hallo_Kill_15_00 " );	// I've come to kill you.
	AI_Output(self,other, " DIA_Jesper_Hallo_Kill_09_01 " );	// Great idea! What do you think, am I here alone? Ah, okay. We will now resolve this issue.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_494_Attila,"ChiefLair");
	Npc_ExchangeRoutine(self,"START");
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Jesper_Hallo_NurSo()
{
	AI_Output(other,self, " DIA_Jesper_Hallo_NurSo_15_00 " );	// I'm just walking around here.
	AI_Output(self,other, " DIA_Jesper_Hallo_NurSo_09_01 " );	// You shouldn't walk here. It's too dangerous, okay?
	AI_Output(self,other, " DIA_Jesper_Hallo_NurSo_09_02 " );	// So leave your weapon where you are and tell me why you're here?
};

func void DIA_Jesper_Hello_Welcome()
{
	AI_Output(other,self, " DIA_Jesper_Hallo_Willkommen_15_00 " );	// Attila gave me the key. That's why I'm here. So what do you want from me?
	AI_Output(self,other, " DIA_Jesper_Hallo_Willkommen_09_01 " );	// Don't you want to know this? Don't get excited.
	AI_Output(self,other, " DIA_Jesper_Hallo_Willkommen_09_02 " );	// Go to Cassia! They are waiting for you.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_494_Attila,"ChiefLair");
	Npc_ExchangeRoutine(self,"START");
};

func void DIA_Jesper_Hello_Moved()
{
	AI_Output(other,self, " DIA_Jesper_Hallo_Umgelegt_15_00 " );	// I killed Attila! He had the key to the sewers.
	AI_Output(self,other, " DIA_Jesper_Hallo_Umgelegt_09_01 " );	// DID YOU kill Attila?!...(incredulously) Oh well, he was a worthless dog anyway.
	AI_Output(self,other, " DIA_Jesper_Hallo_Umgelegt_09_02 " );	// But I want to warn you. If you attack ME, I will kill you!
	Info_ClearChoices(DIA_Jesper_Hallo);
	Info_AddChoice(DIA_Jesper_Hallo, " What are you doing here? " ,DIA_Jesper_Hallo_Was);
	Info_AddChoice(DIA_Jesper_Hallo, " Take me to your ringleader. " ,DIA_Jesper_Hallo_Anfuehrer);
};

func void DIA_Jesper_Hallo_Was()
{
	AI_Output(other,self, " DIA_Jesper_Hallo_Was_15_00 " );	// What are you doing in that dark smelly hole?
	AI_Output(self,other, " DIA_Jesper_Hallo_Was_09_01 " );	// I live here! One more stupid question and holes will appear in your skin.
};

func void DIA_Jesper_Hallo_Anfuehrer()
{
	AI_Output(other,self, " DIA_Jesper_Hallo_Anfuehrer_15_00 " );	// Take me to your leader.
	AI_Output(self,other, " DIA_Jesper_Hallo_Anfuehrer_09_01 " );	// To the leader?... (chuckling) Well, yes! I'm sure Cassia will want to talk to you.
	AI_Output(self,other, " DIA_Jesper_Hallo_Anfuehrer_09_02 " );	// Go ahead and don't try to fool me.
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(VLK_494_Attila,"ChiefLair");
	Npc_ExchangeRoutine(self,"START");
};

instance DIA_Jesper_Bezahlen (C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Bezahlen_Condition;
	information = DIA_Jesper_Bezahlen_Info;
	permanent = FALSE;
	description = " Can you teach me something? " ;
};

func int DIA_Jesper_Bezahlen_Condition()
{
	if((IS_LOVCACH == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Bezahlen_Info()
{
	AI_Output(other,self, " DIA_Jesper_Bezahlen_15_00 " );	// Can you teach me something?
	AI_Output(self,other, " DIA_Jesper_Bezahlen_09_01 " );	// Of course! I'll even show you how to sneak up.
	Jesper_TeachSneak = TRUE;
};

instance DIA_Jesper_Schleichen (C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Sneak_Condition;
	information = DIA_Jesper_Sneak_Info;
	permanent = TRUE;
	description = " Teach me how to sneak. (Training Points: 5) " ;
};

var int DIA_Jesper_Sneak_permanent;

func int DIA_Jesper_Sneak_Condition()
{
	if ((Jesper_TeachSneak ==  TRUE ) && (DIA_Jesper_Schleichen_permanent ==  FALSE ) && (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK ) ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Sneak_Info()
{
	AI_Output(other,self, " DIA_Jesper_Schleichen_15_00 " );	// Show me the art of sneaking.

	if(b_teachthieftalentfree(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other, " DIA_Jesper_Schleichen_09_01 " );	// The ability to sneak is very important for any thief. Especially if you're walking around someone else's house.
		AI_Output(self,other, " DIA_Jesper_Schleichen_09_02 " );	// You can't stomp there like you're doing now. Most people sleep very light sleep.
		AI_Output(self,other, " DIA_Jesper_Schleichen_09_03 " );	// Only when you're sneaking will no one hear you and you can work unhindered.
		DIA_Jesper_Schleichen_permanent = TRUE ;
	};
};

instance DIA_Jesper_Killer(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 2;
	condition = DIA_Jesper_Killer_Condition;
	information = DIA_Jesper_Killer_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Jesper_Killer_Condition()
{
	if (Npc_IsDead(Cassia) || Npc_IsDead(Ramirez))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Killer_Info()
{
	if (Npc_IsDead(Cassia) && Npc_IsDead(Ramirez))
	{
		AI_Output(self,other, " DIA_Jesper_Killer_09_00 " );	// You killed my friends. Why did you do it, killer?
		AI_Output(self,other, " DIA_Jesper_Killer_09_01 " );	// I will send you to the realm of Beliar.
	}
	else if(Npc_IsDead(Cassia))
	{
		AI_Output(self,other, " DIA_Jesper_Killer_09_02 " );	// Killer! You killed Cassia! But you can't get away from me!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	}
	 else if ( Npc_IsDead (Ramirez))
	{
		AI_Output(self,other, " DIA_Jesper_Killer_09_03 " );	// I've been working with Ramirez for a long time, and I've got more gold for him than you can imagine.
		AI_Output(self,other, " DIA_Jesper_Killer_09_04 " );	// And you took and killed him, dirty dog! But now it's payback time!
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_KILL,1);
	};
};

instance DIA_Jesper_Bogen (C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Bogen_Condition;
	information = DIA_Jesper_Bogen_Info;
	permanent = FALSE;
	description = " Tell me, do you know anything about the Bosper bow? " ;
};

func int DIA_Jesper_Bogen_Condition()
{
	if((Npc_HasItems(other,ItRw_Bow_L_03_MIS) < 1) && (MIS_Bosper_Bogen == LOG_Running) && (IS_LOVCACH == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Bogen_Info()
{
	AI_Output(other,self, " DIA_Jesper_Bogen_15_00 " );	// Say you don't know anything about Bosper's bow?
	AI_Output(self,other, " DIA_Jesper_Bogen_09_01 " );	// You mean this artisan's bow? Yes, I packed it in one of the chests.
	AI_Output(self,other, " DIA_Jesper_Bogen_09_02 " );	// But there are a lot of rats around. You can take it if you're not afraid of these creatures.
	AI_Output(self,other, " DIA_Jesper_Bogen_09_03 " );	// Oh, yes, of course, this chest is locked! You'll have to pick the lock... (grins) I hope you have the lockpicks.
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_01");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_02");
	Wld_InsertNpc(Giant_Rat,"NW_CITY_KANAL_ROOM_01_03");
};

instance DIA_Jesper_Kill (C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Kill_Condition;
	info = DIA_Jesper_Kill_Info;
	permanent = FALSE;
	description = " What's behind that closed door? " ;
};

func int DIA_Jesper_Kill_Condition()
{
	if (( IS_LOVCACH  ==  TRUE ) && (Capital >=  1 )) .
	{
		return TRUE;
	};
};

func void DIA_Jesper_Tuer_Info()
{
	AI_Output(other,self, " DIA_Jesper_Tuer_15_00 " );	// What's behind that closed door?
	AI_Output(self,other, " DIA_Jesper_Tuer_09_01 " );	// Behind it is a chest... (grins) Master Bugbear Finger's Chest!
	AI_Output(self,other, " DIA_Jesper_Tuer_09_02 " );	// He put such an incredibly complex lock on it that no one has yet been able to open it.
	AI_Output(self,other, " DIA_Jesper_Tuer_09_03 " );	// Unfortunately, he was somehow caught and shoved behind the Barrier, where he probably died.
	AI_Output(self,other, " DIA_Jesper_Tuer_09_04 " );	// But if you want to try to open his chest, here is the key to this room.
	B_GiveInvItems(self,other,ItKe_Fingers,1);
};

instance DIA_Jesper_Chest (C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Truhe_Condition;
	information = DIA_Jesper_Chest_Info;
	permanent = FALSE;
	description = " I managed to open the chest. " ;
};

func int DIA_Jesper_Chest_Condition()
{
	if((Mob_HasItems("MOB_FINGERS",ItMi_Gold) < 30) || (Mob_HasItems("MOB_FINGERS",ItMi_SilverCup) < 5) || (Mob_HasItems("MOB_FINGERS",ItMi_CupGold) < 1) || (Mob_HasItems("MOB_FINGERS",ItAm_Strg_01) < 1) || (Mob_HasItems("MOB_FINGERS",ItPo_Perm_DEX) < 1))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Chest_Info()
{
	B_GivePlayerXP(XP_JesperTruhe);
	AI_Output(other,self, " DIA_Jesper_Truhe_15_00 " );	// I managed to open the chest.
	AI_Output(self,other, " DIA_Jesper_Truhe_09_01 " );	// This is impossible! Looks like we have a new master bugbear.
	AI_Output(self,other, " DIA_Jesper_Truhe_09_02 " );	// Congratulations!
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
};

instance DIA_Jesper_Quest(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Quest_condition;
	info = DIA_Jesper_Quest_info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Jesper_Quest_condition()
{
	if(Wld_IsTime(10,00,19,00) && (IS_LOVCACH == TRUE) && (MSINEXTREMO == FALSE) && (Npc_GetDistToWP(pir_1397_addon_inextremo_charlotte,"OCR_CHARLOTTE") <= 250) && (Npc_IsDead(pir_1397_addon_inextremo_charlotte) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Quest_info()
{
	AI_Output(self,other, " DIA_Jesper_Quest_01_00 " );	// Buddy, do another good deed.
	AI_Output(other, self, " DIA_Jesper_Quest_01_01 " );	// What do you want?
	AI_Output(self,other, " DIA_Jesper_Quest_01_02 " );	// Run down to the square and ask those guys upstairs to play something fun!
	AI_Output(self,other, " DIA_Jesper_Quest_01_03 " );	// Otherwise, I'll soon die of mortal anguish here.
	AI_Output(other, self, " DIA_Jesper_Quest_01_04 " );	// Okay, so be it, I won't let you die.
	MIS_JESPERMUSIC = LOG_Running;
	Log_CreateTopic(TOPIC_JESPERMUSIC,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_JESPERMUSIC,LOG_Running);
	B_LogEntry( TOPIC_JESPERMUSIC , " Jasper asked me to order music at Khorinis Square. And I'd better hurry before the musicians upstairs finish their performance. " );
};

instance DIA_Jesper_Quest_Done(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Quest_Done_condition;
	information = DIA_Jesper_Quest_Done_info;
	permanent = FALSE;
	description = " How do you like the music? " ;
};

func int DIA_Jesper_Quest_Done_condition()
{
	if((IS_INEXTREMO_PLAYING_DONE == TRUE) && (MIS_JESPERMUSIC == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Quest_Done_info()
{
	B_GivePlayerXP(XP_JesperTruhe);
	AI_Output(other,self, " DIA_Jesper_Quest_Done_01_01 " );	// How do you like the music?
	AI_Output(self,other, " DIA_Jesper_Quest_Done_01_02 " );	// Thanks mate...(enough) That was it!
	AI_Output(self,other, " DIA_Jesper_Quest_Done_01_03 " );	// Here, take these lockpicks as a reward.
	B_GiveInvItems(self,other,ItKE_lockpick,5);
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	JesperDanceDay = Wld_GetDay();
	MIS_JESPERMUSIC = LOG_SUCCESS;
	IS_INEXTREMO_PLAYING = FALSE;
	Log_SetTopicStatus(TOPIC_JESPERMUSIC,LOG_SUCCESS);
	B_LogEntry( TOPIC_JESPERMUSIC , " Jasper liked the music playing in the square. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Dance");
};

instance DIA_Jesper_Quest_StopDance(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 1;
	condition = DIA_Jesper_Quest_StopDance_condition;
	information = DIA_Jesper_Quest_StopDance_info;
	permanent = FALSE;
	description = " Hey, are you okay? " ;
};

func int DIA_Jesper_Quest_StopDance_condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if((MIS_JESPERMUSIC == LOG_SUCCESS) && (JesperDanceDay != FALSE) && (JesperDanceDay == (daynow - 1)))
	{
		return TRUE;
	};
};

func void DIA_Jesper_Quest_StopDance_info()
{
	AI_Output(other,self, " DIA_Jesper_Quest_StopDance_01_00 " );	// Hey, are you okay?! No one has been playing for a long time, and you are all dancing.
	AI_Output(self,other, " DIA_Jesper_Quest_StopDance_01_01 " );	// Oh, right... (out of breath) I didn't even notice!
	AI_Output(self,other, " DIA_Jesper_Quest_StopDance_01_02 " );	// I really should get back to my daily routine.
	AI_Output(self,other, " DIA_Jesper_Quest_StopDance_01_03 " );	// By the way, do you happen to have a glass of cold beer? And then I fell asleep...
	JesperCalm = TRUE;
	Info_ClearChoices(DIA_Jesper_Quest_StopDance);

	if(Npc_HasItems(hero,ItFo_Beer))
	{
		Info_AddChoice(DIA_Jesper_Quest_StopDance,"Конечно.",DIA_Jesper_Quest_StopDance_yes);
	};

	Info_AddChoice(DIA_Jesper_Quest_StopDance, " Unfortunately no. " ,DIA_Jesper_Quest_StopDance_no);
};

func void DIA_Jesper_Quest_StopDance_yes()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Jesper_Quest_StopDance_yes_01_01 " );	// Of course. Here you are.
	B_GiveInvItems(hero,self,ItFo_Beer,1);
	B_UseItem(self,ItFo_Beer);
	AI_Output(self,other, " DIA_Jesper_Quest_StopDance_yes_01_02 " );	// Oh, how delicious... Thanks, mate!
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

func void DIA_Jesper_Quest_StopDance_no()
{
	AI_Output(other,self, " DIA_Jesper_Quest_StopDance_no_01_01 " );	// Unfortunately not.
	AI_Output(self,other, " DIA_Jesper_Quest_StopDance_no_01_02 " );	// Well, no, no.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Jesper_Armor(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 10;
	condition = DIA_Jesper_Armor_Condition;
	information = DIA_Jesper_Armor_Info;
	permanent = FALSE;
	description = " Where can I find good armor? " ;
};

func int DIA_Jesper_Armor_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jesper_Armor_Info()
{
	AI_Output(other,self, " DIA_Jesper_Armor_01_00 " );	// Where can I find good armor?
	AI_Output(self,other, " DIA_Jesper_Armor_01_01 " );	// Hmmm...(snidely) Well, since you're one of us now, I think I can help you with that.
	AI_Output(self,other, " DIA_Jesper_Armor_01_02 " );	// I have a few things that might be of interest to you.
	AI_Output(self,other, " DIA_Jesper_Armor_01_03 " );	// But, as you understand, everything has a price.
	AI_Output(self,other, " DIA_Jesper_Armor_01_04 " );	// I won't give them to you just like that.
	Jesper_Armor = TRUE;
	B_LogEntry_Quiet(TOPIC_ThiefTeacher, " Jesper can sell me Thief armor. " );
};

var int BuyThiefArmor_01;
var int BuyThiefArmor_02;
var int BuyThiefArmor_03;
var int BuyThiefArmor_04;
var int BuyThiefArmor_05;
var int BuyThiefArmor_06;
var int BuyThiefArmor_07;

instance DIA_Jesper_TRADE(C_Info)
{
	npc = VLK_446_Jesper;
	nr = 2;
	condition = DIA_Jesper_TRADE_Condition;
	information = DIA_Jesper_TRADE_Info;
	permanent = TRUE;
	description = " Show me what you've got. " ;
};

func int DIA_Jesper_TRADE_Condition()
{
	if(Jesper_Armor == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Jesper_TRADE_Info()
{
	AI_Output(other,self, " DIA_Jesper_TRADE_01_00 " );	// Show what you have.
	AI_Output(self,other, " DIA_Jesper_TRADE_01_01 " );	// Well, look. If you're smart enough for them, of course.
	Info_ClearChoices(DIA_Jesper_TRADE);
	Info_AddChoice(DIA_Jesper_TRADE, " Maybe later. " ,DIA_Jesper_TRADE_Back);

	if(BuyThiefHelm_01 == FALSE)
	{
		Info_AddChoice(DIA_Jesper_TRADE, " Thief Hat (Price: 250 coins) " ,DIA_Jesper_TRADE_DHM);
	};
	if(BuyThiefArmor_01 == FALSE)
	{
		Info_AddChoice(DIA_Jesper_TRADE, " Trickster Armor (Cost: 500 Coins, Dexterity Required: 50) " ,DIA_Jesper_TRADE_DHT);
	};
	if ((Chapter >=  1 ) && (hero.guild !=  GIL_NONE ) && (BuyThiefArmor_02 ==  FALSE )) .
	{
		Info_AddChoice(DIA_Jesper_TRADE, " Thief Armor (Cost: 2000 Coins, Agility Required: 80) " ,DIA_Jesper_TRADE_DHT_1);
	};
	if ((Capital >=  2 ) && (BuyThiefArmor_03 ==  FALSE ))
	{
		Info_AddChoice(DIA_Jesper_TRADE, " Ghost Armor (Cost: 3000 Coins, Agility Required: 120) " ,DIA_Jesper_TRADE_DHT_2);
	};
	if ((Capital >=  2 ) && (RavenAway ==  TRUE ) && (BuyThiefArmor_04 ==  FALSE ))
	{
		Info_AddChoice(DIA_Jesper_TRADE, " Nightshade Armor (Cost: 5000 coins, Dexterity Required: 150) " ,DIA_Jesper_TRADE_DHT_3);
	};
	if ((Capital >=  3 ) && (BuyThiefArmor_05 ==  FALSE ))
	{
		Info_AddChoice(DIA_Jesper_TRADE, " Master Thief Armor (Cost: 8000 Coins, Dexterity Required: 180) " ,DIA_Jesper_TRADE_DHT_4);
	};
	if ((Capital >=  3 ) && ( MEETURNAZUL  ==  TRUE ) && (BuyThiefArmor_06 ==  FALSE ))
	{
		Info_AddChoice(DIA_Jesper_TRADE, " Thieves Chief Armor (Cost: 12000 Coins, Dexterity Required: 230) " ,DIA_Jesper_TRADE_DHT_5);
	};
	if ((Capital >=  4 ) && (BuyThiefArmor_07 ==  FALSE ))
	{
		Info_AddChoice(DIA_Jesper_TRADE, " Thieves King Armor (Price: 15000 coins, Dexterity Required: 350) " ,DIA_Jesper_TRADE_DHT_6);
	};
};

func void DIA_Jesper_TRADE_Back()
{
	AI_Output(other,self, " DIA_Jesper_TRADE_Back_01_00 " );	// Maybe later.
	AI_Output(self,other, " DIA_Jesper_TRADE_Back_01_01 " );	// As you know.
	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT()
{
	AI_Output(other,self, " DIA_Jesper_TRADE_DHT_01_00 " );	// Give me the Trickster Armor.

	if(hero.attribute[ATR_DEXTERITY] >= 50)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,500))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,500);
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_01_01 " );	// Hold on! Now they are yours.
			CreateInvItems(other,ITAR_DHT_END,1);
			BuyThiefArmor_01 = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_01_02 " );	// No! I want to see my gold first, mate.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Jesper_TRADE_DHT_01_03 " );	// You're not smart enough for them yet, mate.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHM()
{
	AI_Output(other,self, " DIA_Jesper_TRADE_DHM_01_00 " );	// Give me the thief's hat.

	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		Npc_RemoveInvItems(self,ItMi_Gold,250);
		AI_Output(self,other, " DIA_Jesper_TRADE_DHM_01_01 " );	// Hold on! Now she is yours.
		CreateInvItems(other,ItAr_ThiefHut,1);
		BuyThiefHelm_01 = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Jesper_TRADE_DHM_01_02 " );	// No! I want to see my gold first, mate.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_1()
{
	AI_Output(other,self, " DIA_Jesper_TRADE_DHT_1_01_00 " );	// Give me the thief's armor.

	if(hero.attribute[ATR_DEXTERITY] >= 80)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,2000))
		{
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_1_01_01 " );	// Here! Now they are yours.
			CreateInvItems(other,ITAR_DHT_END_1,1);
			BuyThiefArmor_02 = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_1_01_02 " );	// I want to see my gold first, mate.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Jesper_TRADE_DHT_01_03 " );	// You're not smart enough for them yet, mate.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_2()
{
	AI_Output(other,self, " DIA_Jesper_TRADE_DHT_2_01_00 " );	// Give me the ghost armor.

	if(hero.attribute[ATR_DEXTERITY] >= 120)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,3000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,3000);
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_2_01_01 " );	// Good choice! Just like the armor itself.
			CreateInvItems(other,ITAR_DHT_END_2,1);
			BuyThiefArmor_03 = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_2_01_02 " );	// I want to see my gold first, mate.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Jesper_TRADE_DHT_01_03 " );	// You're not smart enough for them yet, mate.
	};	

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_3()
{
	AI_Output(other,self, " DIA_Jesper_TRADE_DHT_3_01_00 " );	// Give me the Nightshade Armor.

	if(hero.attribute[ATR_DEXTERITY] >= 150)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,5000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,5000);
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_3_01_01 " );	// Great! In them you will feel much more secure.
			CreateInvItems(other,ITAR_DHT_END_3,1);
			BuyThiefArmor_04 = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_3_01_02 " );	// I want to see my gold first, mate.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Jesper_TRADE_DHT_01_03 " );	// You're not smart enough for them yet, mate.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_4()
{
	AI_Output(other,self, " DIA_Jesper_TRADE_DHT_4_01_00 " );	// Give me the master thief armor.

	if(hero.attribute[ATR_DEXTERITY] >= 180)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,8000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,8000);
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_4_01_01 " );	// Excellent choice! Such armor will not be for everyone at the time.
			CreateInvItems(other,ITAR_DHT_END_4,1);
			BuyThiefArmor_05 = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_4_01_02 " );	// I want to see my gold first, mate.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Jesper_TRADE_DHT_01_03 " );	// You're not smart enough for them yet, mate.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_5()
{
	AI_Output(other,self, " DIA_Jesper_TRADE_DHT_5_01_00 " );	// Give me the armor of the thief leader.

	if(hero.attribute[ATR_DEXTERITY] >= 230)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,12000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,12000);
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_5_01_01 " );	// Not armor, but a work of art itself!
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_5_01_02 " );	// Only the most experienced thieves can wear them.
			CreateInvItems(other,ITAR_DHT_END_5,1);
			BuyThiefArmor_06 = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_5_01_03 " );	// I want to see my gold first, mate.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Jesper_TRADE_DHT_01_03 " );	// You're not smart enough for them yet, mate.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};

func void DIA_Jesper_TRADE_DHT_6()
{
	AI_Output(other,self, " DIA_Jesper_TRADE_DHT_6_01_00 " );	// Give me the armor of the king of thieves.

	if(hero.attribute[ATR_DEXTERITY] >= 350)
	{
		if(B_GiveInvItems(other,self,ItMi_Gold,15000))
		{
			Npc_RemoveInvItems(self,ItMi_Gold,15000);
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_5_01_01 " );	// Not armor, but a work of art itself!
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_5_01_02 " );	// Only the most experienced thieves can wear them.
			CreateInvItems(other,ITAR_DHT_END_6,1);
			BuyThiefArmor_07 = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Jesper_TRADE_DHT_5_01_03 " );	// I want to see my gold first, mate.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Jesper_TRADE_DHT_01_03 " );	// You're not smart enough for them yet, mate.
	};

	Info_ClearChoices(DIA_Jesper_TRADE);
};
