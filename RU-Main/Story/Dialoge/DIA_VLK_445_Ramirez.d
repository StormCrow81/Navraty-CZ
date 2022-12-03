

instance DIA_Ramirez_EXIT(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 999;
	condition = DIA_Ramirez_EXIT_Condition;
	information = DIA_Ramirez_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ramirez_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ramirez_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ramirez_PICKPOCKET(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 900;
	condition = DIA_Ramirez_PICKPOCKET_Condition;
	information = DIA_Ramirez_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_40;
};

func int DIA_Ramirez_PICKPOCKET_Condition()
{
	return  C_Robbery ( 90 , 300 );
};

func void DIA_Ramirez_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
	Info_AddChoice(DIA_Ramirez_PICKPOCKET,Dialog_Back,DIA_Ramirez_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ramirez_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ramirez_PICKPOCKET_DoIt);
};

func void DIA_Ramirez_PICKPOCKET_DoIt()
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

func void DIA_Ramirez_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ramirez_PICKPOCKET);
};

instance DIA_Ramirez_Hallo(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Hallo_Condition;
	information = DIA_Ramirez_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ramirez_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Hallo_Info()
{
	if(IS_LOVCACH == FALSE)
	{
		AI_Output(self,other, " DIA_Ramirez_Hallo_14_00 " );	// Are you lost? I don't think this is the right place for you.
		AI_Output(self,other, " DIA_Ramirez_Hallo_14_01 " );	// If something happens to you here, no one will come to your aid. So be careful.
	}
	else
	{
		AI_Output(self,other, " DIA_Ramirez_Hallo_14_02 " );	// So, you're with us! Well, then I wish you success - but be careful.
		AI_Output(self,other, " DIA_Ramirez_Hallo_14_03 " );	// Oh, and one more thing - I'm not interested in who you are up there, and what you work.
		AI_Output(self,other, " DIA_Ramirez_Hallo_14_04 " );	// But down here, you're one of us - a thief! No more and no less.
	};
};

var int RamirezPissOff;

instance DIA_Ramirez_First(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_First_condition;
	information = DIA_Ramirez_First_info;
	permanent = FALSE;
	description = " Cassia sent me. " ;
};

func int DIA_Ramirez_First_condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Ramirez_First_info()
{
	AI_Output(other,self, " DIA_Ramirez_First_01_00 " );	// Cassia sent me. She said you could teach me something.

	if(AttilaIsDead == TRUE)
	{
		AI_Output(self,other, " DIA_Ramirez_First_01_20 " );	// Did she say that? Hmmm... For starters, she should have asked my opinion.
		AI_Output(other,self, " DIA_Ramirez_First_01_21 " );	// Is there any problem with this?
		AI_Output(self,other, " DIA_Ramirez_First_01_22 " );	// The only problem is that you killed Attila, and until recently he was my best friend.
		AI_Output(self,other, " DIA_Ramirez_First_01_23 " );	// So you'll have to look for teachers somewhere else. I won't teach you anything.
		AI_Output(other,self,"DIA_Ramirez_First_01_24");	//Постой...
		AI_Output(self,other, " DIA_Ramirez_First_01_25 " );	// I've already said everything. The conversation is over!
		RamirezPissOff = TRUE;
		B_LogEntry(Topic_Bonus, " Ramirez refused to teach me anything because I killed his friend Attila. Perhaps there is a way to convince him? " );
		AI_StopProcessInfos(self);
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(self,other, " DIA_Ramirez_First_01_02 " );	// Well, since she said so... First of all, welcome to our guild, my friend!
		AI_Output(self,other, " DIA_Ramirez_First_01_03 " );	// As far as teaching goes, I can actually teach you things that won't be taught anywhere else in Myrtana.
		AI_Output(self,other, " DIA_Ramirez_First_01_04 " );	// Few people know the secrets of creating swords and rapiers that our guild has.
		AI_Output(other,self, " DIA_Ramirez_First_01_05 " );	// Why are swords and rapiers so good?
		AI_Output(self,other, " DIA_Ramirez_First_01_06 " );	// I'm sure you know that conventional weapons are very bulky and sometimes too heavy. While you swing it, while you strike...
		AI_Output(self,other, " DIA_Ramirez_First_01_07 " );	// While you're doing all this, a good master of the sword will inflict a fatal injection on you a dozen times!
		AI_Output(self,other, " DIA_Ramirez_First_01_08 " );	// It is understandable, because the sword is the choice of thieves, murderers and all those who want to always be one step ahead of their enemy.
		AI_Output(other,self, " DIA_Ramirez_First_01_09 " );	// And do you know how to make such a weapon?
		AI_Output(self,other, " DIA_Ramirez_First_01_10 " );	// There are many different methods. The main thing in this business is to know which components should be mixed with steel.
		AI_Output(self,other, " DIA_Ramirez_First_01_11 " );	// Even an ordinary sword sharpened with sulfur becomes much more dangerous than before!
		AI_Output(other,self, " DIA_Ramirez_First_01_12 " );	// How interesting!
		AI_Output(self,other, " DIA_Ramirez_First_01_13 " );	// Hmm, still. I will teach you gradually, telling you more and more new recipes for turning swords, as well as rapiers.
		AI_Output(self,other, " DIA_Ramirez_First_01_14 " );	// But as you can see, our guild does not do charity work.
		AI_Output(self,other, " DIA_Ramirez_First_01_15 " );	// You will have to prove that we are passing our information on to a useful person.
		AI_Output(self,other, " DIA_Ramirez_First_01_16 " );	// Complete Cassia's quests, help the guild members, and maybe someday you'll be armed in a way you never dreamed of!
		AI_Output(self,other, " DIA_Ramirez_First_01_17 " );	// Oh, and I almost forgot - before you start learning from me, go to some blacksmith and learn the basics of forging.
		AI_Output(self,other, " DIA_Ramirez_First_01_18 " );	// This knowledge will be useful to you in the future.
		AI_Output(other,self, " DIA_Ramirez_First_01_19 " );	// I got it.
		B_LogEntry(Topic_Bonus, " Ramirez, Master of the Thieves Guild, will teach me how to make swords and rapiers, and provide me with various necessary things. " );
		RamirezTechMe = TRUE;
	};
};

instance DIA_Ramirez_RamirezPissOff(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_RamirezPissOff_condition;
	information = DIA_Ramirez_RamirezPissOff_info;
	permanent = TRUE;
	description = " Maybe we can sort out our differences somehow? " ;
};

func int DIA_Ramirez_RamirezPissOff_condition()
{
	if((RamirezPissOff == TRUE) && (RamirezTechMe == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_RamirezPissOff_info()
{
	AI_Output(other,self, " DIA_Ramirez_RamirezPissOff_01_00 " );	// Can we sort out our differences somehow?

	if(RamirezMagicDone == FALSE)
	{
		AI_Output(self,other, " DIA_Ramirez_RamirezPissOff_01_01 " );	// Ha... And how are you going to settle them?
		Info_ClearChoices(DIA_Ramirez_RamirezPissOff);
		Info_AddChoice(DIA_Ramirez_RamirezPissOff, " Пока не знаю. " ,DIA_Ramirez_RamirezPissOff_No);

		if(RhetorikSkillValue[1] >= 25)
		{
			Info_AddChoice(DIA_Ramirez_RamirezPissOff, " Let's look at the situation from the other side. " ,DIA_Ramirez_RamirezPissOff_Deal);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Ramirez_RamirezPissOff_01_02 " );	// Hmm... Do we have anything to settle?
		AI_Output(other,self, " DIA_Ramirez_RamirezPissOff_01_03 " );	// It doesn't seem to exist anymore.
		AI_Output(self,other, " DIA_Ramirez_RamirezPissOff_01_04 " );	// Then what do you want from me?
		AI_Output(other,self, " DIA_Ramirez_First_01_00 " );	// Cassia sent me. She said you could teach me something.
		AI_Output(self,other, " DIA_Ramirez_First_01_03 " );	// As far as teaching goes, I can actually teach you things that won't be taught anywhere else in Myrtana.
		AI_Output(self,other, " DIA_Ramirez_First_01_04 " );	// Few people know the secrets of creating swords and rapiers that our guild has.
		AI_Output(other,self, " DIA_Ramirez_First_01_05 " );	// Why are swords and rapiers so good?
		AI_Output(self,other, " DIA_Ramirez_First_01_06 " );	// I'm sure you know that conventional weapons are very bulky and sometimes too heavy. While you swing it, while you strike...
		AI_Output(self,other, " DIA_Ramirez_First_01_07 " );	// While you're doing all this, a good master of the sword will inflict a fatal injection on you a dozen times!
		AI_Output(self,other, " DIA_Ramirez_First_01_08 " );	// It is understandable, because the sword is the choice of thieves, murderers and all those who want to always be one step ahead of their enemy.
		AI_Output(other,self, " DIA_Ramirez_First_01_09 " );	// And do you know how to make such a weapon?
		AI_Output(self,other, " DIA_Ramirez_First_01_10 " );	// There are many different methods. The main thing in this business is to know which components should be mixed with steel.
		AI_Output(self,other, " DIA_Ramirez_First_01_11 " );	// Even an ordinary sword sharpened with sulfur becomes much more dangerous than before!
		AI_Output(other,self, " DIA_Ramirez_First_01_12 " );	// How interesting!
		AI_Output(self,other, " DIA_Ramirez_First_01_13 " );	// Hmm, still! I will teach you gradually, telling you more and more new recipes for turning swords, as well as rapiers.
		AI_Output(self,other, " DIA_Ramirez_First_01_14 " );	// But as you can see, our guild doesn't do charity work.
		AI_Output(self,other, " DIA_Ramirez_First_01_15 " );	// You will have to prove that we are passing our information on to a useful person.
		AI_Output(self,other, " DIA_Ramirez_First_01_16 " );	// Complete Cassia's quests, help the guild members, and maybe someday you'll be armed in a way you never dreamed of!
		AI_Output(self,other, " DIA_Ramirez_First_01_17 " );	// Oh, and I almost forgot - before you start learning from me, go to some blacksmith and learn the basics of forging.
		AI_Output(self,other, " DIA_Ramirez_First_01_18 " );	// This knowledge will be useful to you in the future.
		AI_Output(other,self, " DIA_Ramirez_First_01_19 " );	// I got it.
		B_LogEntry(Topic_Bonus, " Ramirez, Master of the Thieves Guild will teach me how to make swords and rapiers, and provide me with various necessary things. " );
		RamirezTechMe = TRUE;
		Info_ClearChoices(DIA_Ramirez_RamirezPissOff);
	};
};

func void DIA_Ramirez_RamirezPissOff_No()
{
	AI_Output(other,self, " DIA_Ramirez_RamirezPissOff_No_01_00 " );	// Don't know yet.
	AI_Output(self,other, " DIA_Ramirez_RamirezPissOff_No_01_01 " );	// Then why are you wasting my time?!
	AI_StopProcessInfos(self);
};

func void DIA_Ramirez_RamirezPissOff_Deal()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Ramirez_RamirezPissOff_Deal_01_00 " );	// Let's look at the situation from the other side.
	AI_Output(other,self, " DIA_Ramirez_RamirezPissOff_Deal_01_01 " );	// Attila tried to kill me! He just left me no choice.
	AI_Output(self,other, " DIA_Ramirez_RamirezPissOff_Deal_01_02 " );	// But you could have at least saved his life!
	AI_Output(other,self, " DIA_Ramirez_RamirezPissOff_Deal_01_03 " );	// Innos witness, I didn't want to kill him. It just so happened that one of my blows fell right on the heart.
	AI_Output(other,self, " DIA_Ramirez_RamirezPissOff_Deal_01_04 " );	// I bet he didn't even feel a thing. He just fell dead on the ground and that was it.
	AI_Output(self,other, " DIA_Ramirez_RamirezPissOff_Deal_01_05 " );	// Well, anyway... at least he didn't have to suffer for a long time.
	AI_Output(self,other, " DIA_Ramirez_RamirezPissOff_Deal_01_06 " );	// Oh, okay. Beliar is with you! In the end, the orders that Cassia gave him, anyway, sooner or later would have brought him to the grave.
	AI_Output(self,other, " DIA_Ramirez_RamirezPissOff_Deal_01_07 " );	// And therefore, consider that I am no longer offended by you for the death of Attila.
	AI_Output(other,self, " DIA_Ramirez_RamirezPissOff_Deal_01_08 " );	// That's great.
	RamirezTechMe = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Ramirez_Beute (C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 3;
	condition = DIA_Ramirez_Beute_Condition;
	information = DIA_Ramirez_Prey_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Ramirez_Prey_Condition()
{
	if((Mob_HasItems("THIEF_CHEST_01",ItMi_Gold) < 50) || (Mob_HasItems("THIEF_CHEST_02",ItMi_Gold) < 100) || (Mob_HasItems("THIEF_CHEST_02",ItMi_SilverCup) == FALSE) || (Mob_HasItems("THIEF_CHEST_03",ItMi_Gold) < 75))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Lot_Info()
{
	AI_Output(self,other, " DIA_Ramirez_Beute_14_00 " );	// Look, are you trying to make a joke like that? You line your pockets with our gold... are you trying to steal from us?
	AI_Output(other,self, " DIA_Ramirez_Beute_15_01 " );	// Don't get so upset over a couple of coins.
	AI_Output(other,self, " DIA_Ramirez_Beute_15_02 " );	// I mean, this little thing that's here is ALL you managed to loot? Is that all the Khorinis Thieves Guild has to offer?
	AI_Output(self,other, " DIA_Ramirez_Beute_14_03 " );	// Who said our treasures are stored here?
	AI_Output(other,self, " DIA_Ramirez_Beute_15_04 " );	// Yeah, I can't believe it either. Where do you hide your treasures?
	AI_Output(self,other, " DIA_Ramirez_Beute_14_05 " );	// In a very safe place.
	AI_Output(other,self, " DIA_Ramirez_Beute_15_06 " );	// I understand.
	AI_Output(self,other, " DIA_Ramirez_Beute_14_07 " );	// Okay, you can keep this gold. But I will watch over you. So don't try this trick.
};

instance DIA_Ramirez_Pay (C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 9;
	condition = DIA_Ramirez_Bezahlen_Condition;
	information = DIA_Ramirez_Bezahlen_Info;
	permanent = FALSE;
	description = " Is there anything else you can teach me? " ;
};

func int DIA_Ramirez_Payment_Condition()
{
	if((IS_LOVCACH == TRUE) && (RamirezTechMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Payment_Info()
{
	AI_Output(other,self, " DIA_Ramirez_Bezahlen_14_99 " );	// Is there anything else you can teach me?

	if(Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == TRUE)
	{
		AI_Output(self,other, " DIA_Ramirez_Bezahlen_14_01 " );	// There's nothing more I can teach you - you know how to pick locks.

		if(other.attribute[ATR_DEXTERITY] < T_MAX)
		{
			AI_Output(self,other, " DIA_Ramirez_Add_14_00 " );	// Now you just have to increase your dexterity...
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Ramirez_Bezahlen_14_02 " );	// I can show you how to use lockpicks.
		Ramirez_TeachPlayer = TRUE;
	};
};

instance DIA_Ramirez_Teach(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 99;
	condition = DIA_Ramirez_Teach_Condition;
	information = DIA_Ramirez_Teach_Info;
	permanent = TRUE;
	description = " Teach me how to pick locks. (Training Points: 10) " ;
};

func int DIA_Ramirez_Teach_Condition()
{
	if((IS_LOVCACH == TRUE) && (Ramirez_TeachPlayer == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_Info()
{
	AI_Output(other,self, " DIA_Ramirez_Teach_15_00 " );	// Show me how to pick locks.

	if (Ramirez_twice ==  FALSE )
	{
		AI_Output(self,other, " DIA_Ramirez_Teach_14_06 " );	// Picking locks is the highest art.
		AI_Output(self,other, " DIA_Ramirez_Teach_14_01 " );	// This requires sensitive fingers and intuition. And a couple of good picks!
		AI_Output(self,other, " DIA_Ramirez_Teach_14_02 " );	// Some chests, however, have special locks that can only be opened with the correct key.
		Ramirez_twice = TRUE ;
	};
	if(b_teachthieftalentfree(self,other,NPC_TALENT_PICKLOCK))
	{
		AI_Output(self,other, " DIA_Ramirez_Teach_14_03 " );	// So, stand in front of the lock, and turn the lockpick left and right.
		AI_Output(self,other, " DIA_Ramirez_Teach_14_04 " );	// If you turn it too fast or too hard, it will break.
		AI_Output(self,other, " DIA_Ramirez_Teach_14_05 " );	// But the more experienced you become, the easier it will be for you to use this thief's tool.
	};
};

instance DIA_Ramirez_Quarter (C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 8;
	condition = DIA_Ramirez_Quarter_Condition;
	information = DIA_Ramirez_Quarter_Info;
	permanent = FALSE;
	description = " Where would you recommend me to try my hand at it? " ;
};

func int DIA_Ramirez_Quarter_Condition()
{
	if((IS_LOVCACH == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKLOCK) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Quarter_Info()
{
	AI_Output(other,self, " DIA_Ramirez_Viertel_15_00 " );	// Where would you recommend me to try my hand?
	AI_Output(self,other, " DIA_Ramirez_Viertel_14_01 " );	// Uptown, of course.
	AI_Output(self,other, " DIA_Ramirez_Viertel_14_02 " );	// But if you want to sneak into some house, it's better to wait until night, everyone sleeps at night - except for the city guards.
	AI_Output(self,other, " DIA_Ramirez_Viertel_14_03 " );	// They patrol the city all night. I know one of them - Wambo. He is only interested in gold.
	AI_Output(self,other, " DIA_Ramirez_Viertel_14_04 " );	// His services aren't cheap, but if you pay him, you won't have to worry about anything else.
};

instance DIA_Ramirez_Sextant(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Sextant_Condition;
	information = DIA_Ramirez_Sextant_Info;
	permanent = FALSE;
	description = " Do you have a job for me? " ;
};

func int DIA_Ramirez_Sextant_Condition()
{
	if((IS_LOVCACH == TRUE) && (RamirezTechMe == TRUE) && (Kapitel >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Sextant_Info()
{
	AI_Output(other,self, " DIA_Ramirez_Sextant_15_00 " );	// Do you have a job for me?
	AI_Output(self,other, " DIA_Ramirez_Sextant_14_01 " );	// Hmm... there's a little thing I'd like to get my hands on. But I can't find it anywhere.
	AI_Output(other,self, " DIA_Ramirez_Sextant_15_02 " );	// What would you like to receive?
	AI_Output(self,other, " DIA_Ramirez_Sextant_14_03 " );	// Sextant! Bring me a sextant - I'll pay a good price for it.
	MIS_RamirezSextant = LOG_Running;
	Log_CreateTopic(Topic_RamirezSextant,LOG_MISSION);
	Log_SetTopicStatus(Topic_RamirezSextant,LOG_Running);
	B_LogEntry(Topic_RamirezSextant, " Ramirez wants me to bring him a sextant. " );
};

instance DIA_Ramirez_Success(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 2;
	condition = DIA_Ramirez_Success_Condition;
	information = DIA_Ramirez_Success_Info;
	permanent = FALSE;
	description = " I brought you a sextant. " ;
};

func int DIA_Ramirez_Success_Condition()
{
	if((MIS_RamirezSextant == LOG_Running) && (Npc_HasItems(other,ItMi_Sextant) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Success_Info()
{
	B_GivePlayerXP(XP_RamirezSextant);
	AI_Output(other,self, " DIA_Ramirez_Success_15_00 " );	// I brought you a sextant.
	B_GiveInvItems(other,self,ItMi_Sextant,1);
	Npc_RemoveInvItems(self,ItMi_Sextant,1);
	AI_Output(self,other, " DIA_Ramirez_Success_14_01 " );	// Incredible. You managed to find it!
	AI_Output(self,other, " DIA_Ramirez_Success_14_02 " );	// Here you go, you deserve this money.
	B_GiveInvItems(self,other,ItMi_Gold,200);
	THIEF_REPUTATION = THIEF_REPUTATION + 1;
	Ramirez_Sextant = TRUE;
	MIS_RamirezSextant = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_RamirezSextant,LOG_SUCCESS);
	B_LogEntry(Topic_RamirezSextant, " Ramirez got his sextant. " );
};

instance DIA_RAMIREZ_GUILDKILL (C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 1;
	condition = dia_ramirez_guildkill_condition;
	information = dia_ramirez_guildkill_info;
	permanent = FALSE;
	description = " Do you know anything about the Assassin's Guild? " ;
};

func int dia_ramirez_guildkill_condition()
{
	if (( MY_GUILDKILL  == LOG_Running) && ( IS_LOVCACH  ==  TRUE ) && Npc_KnowsInfo(hero,dia_cassia_guildkill) && ( CANCOMPLETEGUILDKILL  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_ramirez_guildkill_info()
{
	AI_Output(other,self, " DIA_Ramirez_GuildKill_01_00 " );	// Do you know anything about the Assassin's Guild?
	AI_Output(self,other, " DIA_Ramirez_GuildKill_01_01 " );	// (frightened) Why are you asking this?
	AI_Output(other,self, " DIA_Ramirez_GuildKill_01_02 " );	// Cassia said you should know something.
	AI_Output(self,other, " DIA_Ramirez_GuildKill_01_03 " );	// Did she say that? Crap!
	AI_Output(self,other, " DIA_Ramirez_GuildKill_01_04 " );	// You know, it's always better to keep quiet about things like this! And then, not even the hour, you can run into big trouble.
	AI_Output(other,self, " DIA_Ramirez_GuildKill_01_05 " );	// Can you please tell me?
	AI_Output(self,other, " DIA_Ramirez_GuildKill_01_06 " );	// Well, well... (reluctantly) But mind you, I won't tell you much, because I don't want to sit here and shake for my life later.
	AI_Output(self,other, " DIA_Ramirez_GuildKill_01_07 " );	// Anyway, you should talk to a man named Gillian.
	AI_Output(self,other, " DIA_Ramirez_GuildKill_01_08 " );	// He's from a troupe of itinerant musicians who perform in the town square. Turn to him - he will help you find what you are looking for.
	AI_Output(other,self, " DIA_Ramirez_GuildKill_01_09 " );	// Is that all you know?
	AI_Output(self,other, " DIA_Ramirez_GuildKill_01_10 " );	// (nervously) That's it...
	B_LogEntry( TOPIC_GUILDKILL , " Ramirez was very frightened when I started talking to him about the Assassin's Guild, but he advised me to talk to Gillian, a traveling marketplace musician, about it. " );
};

DIA_RAMIREZ_WAREZ (C_Info) instances
{
	npc = VLK_445_Ramirez;
	nr = 1;
	condition = dia_ramirez_warez_condition;
	information = dia_ramirez_warez_info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your products. " ;
};

func int dia_ramirez_warez_condition()
{
	if((IS_LOVCACH == TRUE) && (RamirezTechMe == TRUE))
	{
		return TRUE;
	};
};

func void dia_ramirez_warez_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Ramirez_WAREZ_15_00 " );	// Show me your products.
	AI_Output(self,other, " DIA_Ramirez_WAREZ_15_01 " );	// Just try to fool me - I'll tear off my skin!
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
};

instance DIA_Ramirez_Teach_W1(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W1_condition;
	information = DIA_Ramirez_Teach_W1_info;
	permanent = TRUE;
	description = " Show me how to make a good sword. " ;
};

func int DIA_Ramirez_Teach_W1_condition()
{
	if((Lovkach_W1 == FALSE) && (RamirezTechMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W1_info()
{
	AI_Output(other,self, " DIA_Ramirez_Teach_W1_01_00 " );	// Show me how to make a good sword.
	AI_Output(self,other, " DIA_Ramirez_Teach_W1_01_01 " );	// Do you know how to handle a hammer and anvil?

	if(PLAYER_TALENT_SMITH[WEAPON_Common] == TRUE)
	{
		AI_Output(other,self,"DIA_Ramirez_Teach_W1_01_02");	//Конечно.
		AI_Output(self,other, " DIA_Ramirez_Teach_W1_01_03 " );	// That's nice! Then you take a steel billet and a lump of sulfur...
		AI_Output(self,other, " DIA_Ramirez_Teach_W1_01_04 " );	// ...and turn slightly like this and like this, swiping the gray over the workpiece.
		AI_Output(self,other, " DIA_Ramirez_Teach_W1_01_05 " );	// Then do the same with the second piece, but on the other side of the blade.
		AI_Output(self,other, " DIA_Ramirez_Teach_W1_01_06 " );	// It should sharpen very soon, then the job will be done.
		AI_Output(other,self, " DIA_Ramirez_Teach_W1_01_07 " );	// Doesn't look very complicated.
		AI_Output(self,other, " DIA_Ramirez_Teach_W1_01_08 " );	// I'm sure you'll be fine.
		AI_Print( " Learned the forging recipe - 'Thief's Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " I learned how to make a simple thief's sword. To do this, I need a steel billet and two pieces of sulfur. " );
		Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
		Lovkach_W1 = TRUE;
	}
	else
	{
		AI_Output(other,self, " DIA_Ramirez_Teach_W1_01_09 " );	// Not yet.
		AI_Output(self,other, " DIA_Ramirez_Teach_W1_01_10 " );	// So you should at least somehow learn how to handle the blacksmith's tools first.
		AI_Output(self,other, " DIA_Ramirez_Teach_W1_01_11 " );	// Come in later and we'll talk.
		AI_StopProcessInfos(self);
	};

};


instance DIA_Ramirez_Teach_W2(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W2_condition;
	information = DIA_Ramirez_Teach_W2_info;
	permanent = TRUE;
	description = " Show me how to make a good rapier. (Learning points: 2, Cost: 1000 coins) " ;
};

func int DIA_Ramirez_Teach_W2_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W1 == TRUE) && (THIEF_REPUTATION >= 5) && (Lovkach_W2 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W2_info()
{
	AI_Output(other,self, " DIA_Ramirez_Teach_W2_01_01 " );	// Show me how to make a good rapier.

	if((hero.lp >= 2) && (Npc_HasItems(other,ItMi_Gold) >= 1000))
	{
		AI_Output(self,other, " DIA_Ramirez_Teach_W2_01_02 " );	// Okay, listen carefully.
		AI_Output(self,other, " DIA_Ramirez_Teach_W2_01_03 " );	// You take a steel billet, heat it up, shape it, and cool it down.
		AI_Output(self,other, " DIA_Ramirez_Teach_W2_01_04 " );	// Everything is as usual! Just use aquamarine for sharpening. The mineral will only benefit your sword.
		AI_Output(self,other, " DIA_Ramirez_Teach_W2_01_05 " );	// Finally, coat the entire blade from base to tip with resin.
		AI_Output(self,other, " DIA_Ramirez_Teach_W2_01_06 " );	// She will give your sword a special gloomy tint!
		hero.lp = hero.lp - 2;
		RankPoints = RankPoints + 2;
		Npc_RemoveInvItems(other,ItMi_Gold,1000);
		AI_Print( " Learned crafting recipe - 'Thief's Rapier' " );
		B_LogEntry(TOPIC_TalentSmith, " Now I can make rapiers. To do this, I need to have aquamarine, resin and steel billet. " );
		Lovkach_W2 = TRUE;
	}
	else
	{
		if(hero.lp < 2)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 1000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other, " DIA_Ramirez_Teach_W2_03_90 " );	// You don't have enough gold for this! Come back later.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Ramirez_Teach_W3(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W3_condition;
	information = DIA_Ramirez_Teach_W3_info;
	permanent = TRUE;
	description = " Show me how to make a master sword. (Learning points: 3, Cost: 1500 coins) " ;
};

func int DIA_Ramirez_Teach_W3_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W2 == TRUE) && (THIEF_REPUTATION >= 10) && (Lovkach_W3 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W3_info()
{
	AI_Output(other,self, " DIA_Ramirez_Teach_W3_01_01 " );	// Show me how to make a master sword.

	if((hero.lp >= 3) && (Npc_HasItems(other,ItMi_Gold) >= 1500))
	{
		AI_Output(self,other, " DIA_Ramirez_Teach_W3_01_02 " );	// This is already a serious weapon! Be careful when choosing components. Choose only the best, and you will get a wonderful sword.
		AI_Output(self,other, " DIA_Ramirez_Teach_W3_01_03 " );	// Now listen carefully...
		AI_Output(self,other, " DIA_Ramirez_Teach_W3_01_04 " );	// You must do the same as you did when making the rapier.
		AI_Output(self,other, " DIA_Ramirez_Teach_W3_01_05 " );	// But besides this, also encrust a black pearl into the guard of the sword.
		AI_Output(self,other, " DIA_Ramirez_Teach_W3_01_06 " );	// Its mysterious, alluring brilliance will divert the enemy's attention during combat.
		hero.lp = hero.lp - 3;
		RankPoints = RankPoints + 3;
		Npc_RemoveInvItems(other,ItMi_Gold,1500);
		AI_Print( " Learned the forging recipe - 'Master's Sword' " );
		B_LogEntry(TOPIC_TalentSmith, " Now I can make a master's sword. To do this, I need to have resin, a steel billet and a black pearl. " );
		Lovkach_W3 = TRUE;
	}
	else
	{
		if(hero.lp < 3)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 1500)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other, " DIA_Ramirez_Teach_W3_03_90 " );	// You don't have enough gold for this! Come back later.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Ramirez_Teach_W4(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W4_condition;
	information = DIA_Ramirez_Teach_W4_info;
	permanent = TRUE;
	description = " Crafting the sword 'Silent Death'. (Training Points: 4, Cost: 2000 coins) " ;
};

func int DIA_Ramirez_Teach_W4_condition()
{
	if((IS_LOVCACH == TRUE) && (Lovkach_W3 == TRUE) && (THIEF_REPUTATION >= 15) && (Lovkach_W4 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W4_info()
{
	AI_Output(other,self, " DIA_Ramirez_Teach_W4_01_01 " );	// Show me how to make a Silent Death sword.

	if((hero.lp >= 4) && (Npc_HasItems(other,ItMi_Gold) >= 2000))
	{
		AI_Output(self,other, " DIA_Ramirez_Teach_W4_01_02 " );	// Few can wield such a magnificent murder weapon.
		AI_Output(self,other, " DIA_Ramirez_Teach_W4_01_03 " );	// Now listen carefully...
		AI_Output(self,other, " DIA_Ramirez_Teach_W4_01_04 " );	// Resin is no longer required here, but two black pearls must be inlaid.
		AI_Output(self,other, " DIA_Ramirez_Teach_W4_01_05 " );	// One for each end of the guard.
		hero.lp = hero.lp - 4;
		RankPoints = RankPoints + 4;
		Npc_RemoveInvItems(other,ItMi_Gold,2000);
		AI_Print( " Forging recipe learned - 'Silent Death' " );
		B_LogEntry(TOPIC_TalentSmith, " Now I can make a 'Silent Death' sword. To do this, I need a steel billet and two black pearls. " );
		Lovkach_W4 = TRUE;
	}
	else
	{
		if(hero.lp < 4)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 2000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other, " DIA_Ramirez_Teach_W4_03_90 " );	// You don't have enough gold for this! Come back later.
			AI_StopProcessInfos(self);
		};
	};
};


instance DIA_Ramirez_Teach_W5(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W5_condition;
	information = DIA_Ramirez_Teach_W5_info;
	permanent = TRUE;
	description = " Craft a sword, Piercing Steel. (Learning Points: 5, Cost: 3000 coins) " ;
};

func int DIA_Ramirez_Teach_W5_condition()
{
	if (( IS_LOVCACH  ==  TRUE ) && ( Lovcach_W4 ==  TRUE ) && ( THIEF_REPUTATION  >=  20 ) && ( Lovcach_W5 ==  FALSE ) && ( RavenAway ==  TRUE )) .
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W5_info()
{
	AI_Output(other,self, " DIA_Ramirez_Teach_W5_01_01 " );	// Show me how to make a Piercing Steel sword.

	if((hero.lp >= 5) && (Npc_HasItems(other,ItMi_Gold) >= 3000))
	{
		AI_Output(self,other, " DIA_Ramirez_Teach_W5_01_02 " );	// A very complex weapon, because it uses a huge number of different components when sharpening.
		AI_Output(self,other, " DIA_Ramirez_Teach_W5_01_03 " );	// And be careful when choosing an ore - this is especially important for this sword!
		AI_Output(self,other, " DIA_Ramirez_Teach_W5_01_04 " );	// Now listen carefully...
		AI_Output(self,other, " DIA_Ramirez_Teach_W5_01_05 " );	// This sword should be decorated with the same decorations as the previous one.
		AI_Output(self,other, " DIA_Ramirez_Teach_W5_01_06 " );	// Steel this time requires an admixture of ore, and the blade is sharpened using sulfur.
		AI_Output(self,other, " DIA_Ramirez_Teach_W5_01_07 " );	// Pay special attention to the sharpness of the tip!
		AI_Output(self,other, " DIA_Ramirez_Teach_W5_01_08 " );	// The sword should easily pierce the enemy, and the name should justify itself.
		hero.lp = hero.lp - 5;
		RankPoints = RankPoints + 5;
		Npc_RemoveInvItems(other,ItMi_Gold,3000);
		AI_Print( " Learned forging recipe - 'Piercing Steel' " );
		B_LogEntry(TOPIC_TalentSmith, " Now I can make a sword, Piercing Steel. To do this, I need a steel billet, two black pearls, an ore ingot, and a dozen lumps of sulfur. " );
		Lovkach_W5 = TRUE;
	}
	else
	{
		if(hero.lp < 5)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 3000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other, " DIA_Ramirez_Teach_W5_03_90 " );	// You don't have enough gold for this! Come back later.
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Ramirez_Teach_W6(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W6_condition;
	information = DIA_Ramirez_Teach_W6_info;
	permanent = TRUE;
	description = " Craft a Scorpion Sting sword. (Training Points: 6, Cost: 4000 coins) " ;
};

func int DIA_Ramirez_Teach_W6_condition()
{
	if (( IS_LOVCACH  ==  TRUE ) && ( Lawcach_W5 ==  TRUE ) && ( THIEF_REPUTATION  >=  30 ) && ( Chapter >=  2 ) && ( Lawcach_W6 ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W6_info()
{
	AI_Output(other,self, " DIA_Ramirez_Teach_W6_01_01 " );	// Show me how to make a 'Scorpion Sting' sword.

	if((hero.lp >= 6) && (Npc_HasItems(other,ItMi_Gold) >= 4000))
	{
		AI_Output(self,other, " DIA_Ramirez_Teach_W6_01_02 " );	// You have reached the most interesting stage in your training! Simple swords should no longer interest you...
		AI_Output(self,other, " DIA_Ramirez_Teach_W6_01_03 " );	// The nature of the next weapon is somewhat magical!
		AI_Output(self,other, " DIA_Ramirez_Teach_W6_01_04 " );	// Now listen carefully...
		AI_Output(self,other, " DIA_Ramirez_Teach_W6_01_05 " );	// You throw more coal into the forge - the workpiece should quickly become hot.
		AI_Output(self,other, " DIA_Ramirez_Teach_W6_01_06 " );	// Aquamarine will now serve as decoration. Lay out with them the entire outer side of the protective bow of the hilt.
		AI_Output(self,other, " DIA_Ramirez_Teach_W6_01_07 " );	// This will make her look like a curved scorpion stinger!
		AI_Output(self,other, " DIA_Ramirez_Teach_W6_01_08 " );	// And the pommel in the form of a black pearl symbolizes a black drop of scorpion venom.
		AI_Output(self,other, " DIA_Ramirez_Teach_W6_01_09 " );	// Well, to make the sword resemble a sting not only in appearance, but also in action - apply real poison to its blade.
		hero.lp = hero.lp - 6;
		RankPoints = RankPoints + 6;
		Npc_RemoveInvItems(other,ItMi_Gold,4000);
		AI_Print( " Forging recipe learned - 'Scorpion's Sting' " );
		B_LogEntry(TOPIC_TalentSmith, " Now I can make a Scorpion Sting sword. To do this, I need to have: a steel billet, five pieces of coal, five aquamarines, a black pearl and two bottles of poison. " );
		Lovkach_W6 = TRUE;
	}
	else
	{
		if(hero.lp < 6)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 4000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other, " DIA_Ramirez_Teach_W6_03_90 " );	// You don't have enough gold for this! Come back later.
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Ramirez_Teach_W7(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_Teach_W7_condition;
	information = DIA_Ramirez_Teach_W7_info;
	permanent = TRUE;
	description = " Crafting the Scream in the Night sword. (Learning Points: 7, Cost: 5000 coins) " ;
};

func int DIA_Ramirez_Teach_W7_condition()
{
	if (( IS_LOVCACH  ==  TRUE ) && ( Lawcach_W6 ==  TRUE ) && ( THIEF_REPUTATION  >=  40 ) && ( Chapter >=  2 ) && ( Lawcach_W7 ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Ramirez_Teach_W7_info()
{
	AI_Output(other,self, " DIA_Ramirez_Teach_W7_01_01 " );	// Show me how to make a 'Scream in the Night' sword.

	if((hero.lp >= 7) && (Npc_HasItems(other,ItMi_Gold) >= 5000))
	{
		AI_Output(self,other, " DIA_Ramirez_Teach_W7_01_02 " );	// It's hard to get components for the Scream in the Night sword, but it's the best weapon I can offer you so far.
		AI_Output(self,other, " DIA_Ramirez_Teach_W7_01_03 " );	// As you can see, it takes a lot of experience to make such a thing, but what can you do - it's a real work of art.
		AI_Output(self,other, " DIA_Ramirez_Teach_W7_01_04 " );	// The sword emits a dark aura and is deadly to any of your enemies!
		AI_Output(self,other, " DIA_Ramirez_Teach_W7_01_05 " );	// Now, listen carefully...
		AI_Output(self,other, " DIA_Ramirez_Teach_W7_01_06 " );	// A billet of steel, coal, rock crystal, a black pearl, and three particles of ectoplasm are its components.
		AI_Output(self,other, " DIA_Ramirez_Teach_W7_01_07 " );	// The manufacture of this sword is completed by a completely mystical ritual. You must cut through dead flesh with it!
		AI_Output(self,other, " DIA_Ramirez_Teach_W7_01_08 " );	// The masters who came up with this said that, cutting through dead flesh, the sword literally remembers what kind of living one needs to be brought to.
		hero.lp = hero.lp - 7;
		RankPoints = RankPoints + 7;
		Npc_RemoveInvItems(other,ItMi_Gold,5000);
		AI_Print( " Learned crafting recipe - 'Scream in the Night' " );
		B_LogEntry(TOPIC_TalentSmith, " Now I can make the Scream in the Night sword. To do this, I need a steel billet, five pieces of coal, five samples of rock crystal, a black pearl, dead flesh, and three particles of ectoplasm. " );
		Lovkach_W7 = TRUE;
	}
	else
	{
		if(hero.lp < 7)
		{
			AI_Print(PRINT_NotEnoughLearnPoints);
			B_Say(self,other,"$NOLEARNNOPOINTS");
			AI_StopProcessInfos(self);
		};
		if(Npc_HasItems(other,ItMi_Gold) < 5000)
		{
			AI_Print(Print_NotEnoughGold);
			AI_Output(self,other, " DIA_Ramirez_Teach_W7_03_90 " );	// You don't have enough gold for this! Come back later.
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_Ramirez_TellAboutFingers(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 50;
	condition = DIA_Ramirez_TellAboutFingers_condition;
	information = DIA_Ramirez_TellAboutFingers_info;
	permanent = FALSE;
	description = " Is there a better sword than the last one you told me about? " ;
};

func int DIA_Ramirez_TellAboutFingers_condition()
{
	if (( IS_LOVCACH  ==  TRUE ) && ( Lawcach_W7 ==  TRUE ) && ( THIEF_REPUTATION  >=  50 ) && ( Chapter >=  2 ) && ( Lawcach_W8 ==  FALSE ) && ( FingersIsDead ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Ramirez_TellAboutFingers_info()
{
	AI_Output(other,self, " DIA_Ramirez_TellAboutFingers_01_01 " );	// Is there a better sword than the last one you told me about?
	AI_Output(self,other, " DIA_Ramirez_TellAboutFingers_01_02 " );	// Hmmm... (thoughtfully) Rumor has it that Master Fingers once had such a sword.
	AI_Output(self,other, " DIA_Ramirez_TellAboutFingers_01_03 " );	// It was truly a beautiful and deadly weapon! Whether this is true or not, I can't tell you for sure.
	AI_Output(self,other, " DIA_Ramirez_TellAboutFingers_01_04 " );	// And if anyone knows about this, then only Fingers himself.
	AI_Output(self,other, " DIA_Ramirez_TellAboutFingers_01_05 " );	// But I haven't heard from him since he was left to rot in the colony.
	MIS_TellAboutFingers = LOG_Running;
	Log_CreateTopic(TOPIC_TellAboutFingers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TellAboutFingers,LOG_Running);
	) ; _ _ _
};

instance DIA_Ramirez_BanditShpaga(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 7;
	condition = DIA_Ramirez_BanditShpaga_condition;
	information = DIA_Ramirez_BanditShpaga_info;
	permanent = FALSE;
	description = " Are you interested in bandit swords? " ;
};

func int DIA_Ramirez_BanditShpaga_condition()
{
	if((THIEF_REPUTATION >= 5) && Npc_HasItems(hero,ItMw_Addon_BanditTrader))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_BanditShpaga_info()
{
	AI_Output(other,self, " DIA_Ramirez_BanditShpaga_01_00 " );	// Are you interested in bandit swords?
	AI_Output(self,other, " DIA_Ramirez_BanditShpaga_01_01 " );	// Of course not... (contemptuously) Why do I need this garbage? However, I can buy them from you.
	AI_Output(self,other, " DIA_Ramirez_BanditShpaga_01_02 " );	// The guild would benefit if there were far fewer of those damn bandits... damn competitors!
	B_LogEntry(Topic_Bonus, " Ramirez has agreed to buy bandit swords from me. You can make a small business out of this! " );
	RamirezBuyBanditShpaga = TRUE;
};

instance DIA_Ramirez_BanditShpaga_Buy(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 7;
	condition = DIA_Ramirez_BanditShpaga_Buy_condition;
	information = DIA_Ramirez_BanditShpaga_Buy_info;
	permanent = TRUE;
	important = FALSE;
	description = " I have bandit swords. " ;
};

func int DIA_Ramirez_BanditShpaga_Buy_condition()
{
	if((RamirezBuyBanditShpaga == TRUE) && Npc_HasItems(hero,ItMw_Addon_BanditTrader))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_BanditShpaga_Buy_info()
{
	var C_Item EquipWeap;
	var int tempgoldrap;

	AI_Output(other,self, " DIA_Ramirez_BanditShpaga_Buy_01_01 " );	// I have bandit swords.
	EquipWeap = Npc_GetEquippedMeleeWeapon(hero);
	tempgoldrap = Npc_HasItems(hero,ItMw_Addon_BanditTrader);

	if(Hlp_IsItem(EquipWeap,ItMw_Addon_BanditTrader) == TRUE)
	{
		if(tempgoldrap > 1)
		{
			tempgoldrap -= 1;
		};
	};

	AI_Output(self,other, " DIA_Ramirez_BanditShpaga_Buy_01_02 " );	// Well, let's get them over here... (grimly) I hope we can sell all this scrap metal someday!
	Npc_RemoveInvItems(hero,ItMw_Addon_BanditTrader,Npc_HasItems(hero,ItMw_Addon_BanditTrader));
	B_GiveInvItems(self,other,ItMi_Gold,tempgoldrap * 80);
};

instance DIA_Ramirez_MagicBook(C_Info)
{
	npc = VLK_445_Ramirez;
	nr = 7;
	condition = DIA_Ramirez_MagicBook_condition;
	information = DIA_Ramirez_MagicBook_info;
	permanent = FALSE;
	description = " I heard you robbed Vatras' house. " ;
};

func int DIA_Ramirez_MagicBook_condition()
{
	if((MagicBookFindTradeExt == TRUE) && (MIS_VatrasMagicBook == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Ramirez_MagicBook_info()
{
	AI_Output(other,self, " DIA_Ramirez_MagicBook_01_00 " );	// I heard that you robbed Vatras' house.
	AI_Output(self,other, " DIA_Ramirez_MagicBook_01_01 " );	// Well, if you're so confident about it... (appreciatively) That means it was me. Why are you actually asking?
	AI_Output(other,self, " DIA_Ramirez_MagicBook_01_02 " );	// I'm looking for one item that belonged to him.
	AI_Output(self,other, " DIA_Ramirez_MagicBook_01_03 " );	// And what exactly are we talking about?
	AI_Output(other,self, " DIA_Ramirez_MagicBook_01_04 " );	// It should be something like a book or diary.
	AI_Output(self,other, " DIA_Ramirez_MagicBook_01_05 " );	// Hmmm... (thoughtfully) Oh yes, I remember! I noticed her at the very last moment.
	AI_Output(self,other, " DIA_Ramirez_MagicBook_01_06 " );	// And I figured it might be of some value.
	AI_Output(self,other, " DIA_Ramirez_MagicBook_01_07 " );	// But it turned out to be a completely useless piece of paper! I don't think I'll be able to get a decent amount of money for it.
	AI_Output(other,self, " DIA_Ramirez_MagicBook_01_08 " );	// So you have the book now?
	AI_Output(self,other, " DIA_Ramirez_MagicBook_01_09 " );	// Yes, she's here. I haven't figured out what to do with it yet.
	AI_Output(other,self, " DIA_Ramirez_MagicBook_01_10 " );	// Then just give it to me.
	AI_Output(self,other, " DIA_Ramirez_MagicBook_01_11 " );	// Hmmm... well, if you really want to get her, then why not.
	AI_Output(self,other, " DIA_Ramirez_MagicBook_01_12 " );	// However, I still want to get something out of this little thing! So let's make a deal...
	AI_Output(self,other, " DIA_Ramirez_MagicBook_01_13 " );	// ...let's say you give me a hundred gold pieces and the book is yours. Well, how is it going?
	B_LogEntry(TOPIC_VatrasMagicBook, " Ramirez still has Vatras' diary. He will sell it to me for one hundred gold pieces. " );	
	Info_ClearChoices(DIA_Ramirez_MagicBook);

	if(Npc_HasItems(hero,ItMi_Gold) >= 100)
	{
		Info_AddChoice(DIA_Ramirez_MagicBook, " Sure. Here's your money. " ,DIA_Ramirez_MagicBook_Yes);
	};

	Info_AddChoice(DIA_Ramirez_MagicBook, " No! It's too expensive. " ,DIA_Ramirez_MagicBook_No);

	if(RhetorikSkillValue[1] >= 30)
	{
		Info_AddChoice(DIA_Ramirez_MagicBook, " You want me to buy something from you that isn't worth a dime? " ,DIA_Ramirez_MagicBook_Nothing);
	};
};

func void DIA_Ramirez_MagicBook_Yes()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Ramirez_MagicBook_Yes_01_01 " );	// Of course. Here is your money.
	B_GiveInvItems(other,self,ItMi_Gold,100);
	Npc_RemoveInvItems(self,ItMi_Gold,100);
	AI_Output(self,other, " DIA_Ramirez_MagicBook_Yes_01_02 " );	// Great, mate. And I'm not in the flight with her, and you're not in the loser.
	AI_Output(self,other, " DIA_Ramirez_MagicBook_Yes_01_03 " );	// Here, take your book!
	B_GiveInvItems(self,other,ItWr_VatrasDiary,1);
	Info_ClearChoices(DIA_Ramirez_MagicBook);
};

func void DIA_Ramirez_MagicBook_No()
{
	AI_Output(other,self, " DIA_Ramirez_MagicBook_No_01_01 " );	// It's too expensive.
	AI_Output(self,other, " DIA_Ramirez_MagicBook_No_01_02 " );	// As you say... (grudgingly) But then, perhaps, I'll keep it with me.
	AI_Output(self,other, " DIA_Ramirez_MagicBook_No_01_03 " );	// And you never know, you know... suddenly come in handy?
	MagicBookFindTrade = TRUE;
	Info_ClearChoices(DIA_Ramirez_MagicBook);
};

func void DIA_Ramirez_MagicBook_Nothing()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Ramirez_MagicBook_Nothing_01_00 " );	// Do you want me to buy a thing from you that is not worth a penny?
	AI_Output(self,other,"DIA_Ramirez_MagicBook_Nothing_01_01");	//Эммм...
	AI_Output(other,self, " DIA_Ramirez_MagicBook_Nothing_01_02 " );	// Are you trying to fool me?
	AI_Output(self,other, " DIA_Ramirez_MagicBook_Nothing_01_03 " );	// Me?! No, what are you... I just thought that if you need her so much...
	AI_Output(self,other, " DIA_Ramirez_MagicBook_Nothing_01_04 " );	// Oh, okay! Beliar is with her... (in her heart) Here, take her like this! It still makes no sense to her.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	B_GiveInvItems(self,other,ItWr_VatrasDiary,1);
	Info_ClearChoices(DIA_Ramirez_MagicBook);
};
