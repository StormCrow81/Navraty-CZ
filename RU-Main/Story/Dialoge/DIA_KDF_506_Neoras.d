
instance DIA_Neoras_Kap1_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap1_EXIT_Condition;
	information = DIA_Neoras_Kap1_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap1_EXIT_Condition()
{
	if (chapter <=  1 )
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap1_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instances DIA_Neoras_NoEnter_PissOff (C_Info)
{
	npc = KDF_506_Neoras;
	nr = 1;
	condition = DIA_Neoras_NoEnter_PissOff_Condition;
	information = DIA_Neoras_NoEnter_PissOff_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Neoras_NoEnter_PissOff_Condition()
{
	if((CanEnterKloster == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Neoras_NoEnter_PissOff_Info()
{
	AI_Output(self,other,"DIA_Neoras_NoEnter_PissOff_01_00");	//Хммм...(сердито)
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuildEnemy,0);
};

var int NeorasFT;

instance DIA_Neoras_Hallo (C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = DIA_Neoras_Hallo_Condition;
	information = DIA_Neoras_Hallo_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Neoras_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel < 6) && (NeorasFT == FALSE))
	{
		NeorasFT = TRUE;
		return TRUE;
	};
};

func void DIA_Neoras_Hallo_Info()
{
	AI_Output(self,other, " DIA_Neoras_Hallo_01_00 " );	// What... did something happen? Why are you bothering me, can't you see I'm doing a very complicated experiment?
	AI_Output(other,self, " DIA_Neoras_Hallo_15_01 " );	// I didn't mean to disturb you.
	AI_Output(self,other, " DIA_Neoras_Hallo_01_02 " );	// You already bothered... (sighs) Okay, tell me what you want?
};

instance DIA_Neoras_work (C_Info)
{
	npc = KDF_506_Neoras;
	nr = 5;
	condition = DIA_Neoras_Work_Condition;
	information = DIA_Neoras_Arbeit_Info;
	permanent = FALSE;
	description = " Do you have a job for me? " ;
};

func int DIA_Neoras_Work_Condition()
{
	if(MIS_KlosterArbeit == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_work_info()
{
	AI_Output(other,self, " DIA_Neoras_Arbeit_15_00 " );	// Do you have a job for me?
	AI_Output(self,other, " DIA_Neoras_Arbeit_01_01 " );	// Yes, I need herbs for my experiments. We grow them ourselves, but we're completely out of fire nettles.
	AI_Output(self,other, " DIA_Neoras_Arbeit_01_02 " );	// Seven flowers will suffice. Bring them to me - oh yes, more - I've lost the magic potion recipe.
	AI_Output(self,other, " DIA_Neoras_Arbeit_01_03 " );	// If you find it, I'll be very grateful.
	MIS_NeorasPflanzen = LOG_Running;
	MIS_NeorasRezept = LOG_Running;
	Log_CreateTopic(Topic_NeorasPflanzen,LOG_MISSION);
	Log_SetTopicStatus(Topic_NeorasPflanzen,LOG_Running);
	B_LogEntry(Topic_NeorasPflanzen, " I must bring seven bushes of firenettle to Master Neoras, the alchemist. " );
	Log_CreateTopic(Topic_Neorasrezept,LOG_MISSION);
	Log_SetTopicStatus(Topic_Neorasrezept,LOG_Running);
	B_LogEntry(Topic_Neorasrezept, " Master Neoras has lost the recipe for making a magical drink. " );
	if (Npc_KnowsInfo(other,DIA_Opolos_teach))
	{
		B_LogEntry(Topic_Neorasrezept, " This is definitely a recipe that Opolos wants to see. " );
	};
};


instance DIA_Neoras_Rezept (C_Info)
{
	npc = KDF_506_Neoras;
	nr = 6;
	condition = DIA_Neoras_Rezept_Condition;
	information = DIA_Neoras_Rezept_Info;
	permanent = TRUE;
	description = " Recipe... " ;
};


func int DIA_Neoras_Rezept_Condition()
{
	if(MIS_NeorasRezept == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Rezept_Info()
{
	AI_Output(other,self, " DIA_Neoras_Rezept_15_00 " );	// About the recipe...
	if(B_GiveInvItems(other,self,ItWr_ManaRezept,1))
	{
		AI_Output(other,self, " DIA_Neoras_Rezept_15_01 " );	// I found it.
		AI_Output(self,other, " DIA_Neoras_Rezept_01_02 " );	// Good. I feared that he was lost to me forever.
		AI_Output(self,other, " DIA_Neoras_Rezept_01_03 " );	// Here, take this magic potion as a token of my gratitude.
		MIS_NeorasRezept = LOG_SUCCESS;
		B_GivePlayerXP(XP_NeorasRezept);
		B_GiveInvItems(self,other,ItPo_Mana_02,1);
	}
	else
	{
		AI_Output(other,self, " DIA_Neoras_Rezept_15_04 " );	// I haven't found it yet.
		AI_Output(self,other, " DIA_Neoras_Rezept_01_05 " );	// Well, I still hope you manage to find it.
	};
};


instance DIA_Neoras_Flieder (C_Info)
{
	npc = KDF_506_Neoras;
	nr = 7;
	condition = DIA_Neoras_Flieder_Condition;
	information = DIA_Neoras_Lilac_Info;
	permanent = TRUE;
	description = " I brought you a fire nettle. " ;
};


func int DIA_Neoras_Lilac_Condition()
{
	if(MIS_NeorasPflanzen == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Neoras_Flieder_Info()
{
	AI_Output(other,self, " DIA_Neoras_Flieder_15_00 " );	// I brought you a fire nettle.
	if(B_GiveInvItems(other,self,ItPl_Mana_Herb_01,7))
	{
		AI_Output(self,other, " DIA_Neoras_Flieder_01_01 " );	// Great, now I can work. Take this 'Wind Fist' spell scroll, I hope you find it useful.
		MIS_NeorasPflanzen = LOG_SUCCESS;
		B_GivePlayerXP(XP_NeorasPflanzen);
		B_GiveInvItems(self,other,ItSc_Windfist,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Neoras_Flieder_01_02 " );	// Oh, really? But you didn't bring enough. I need SEVEN copies.
	};
};


instance DIA_Neoras_TEACH(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 10;
	condition = DIA_Neoras_TEACH_Condition;
	information = DIA_Neoras_TEACH_Info;
	permanent = TRUE;
	description = " Can I learn something from you? " ;
};


func int DIA_Neoras_TEACH_Condition()
{
	return TRUE;
};

func void DIA_Neoras_TEACH_Info()
{
	AI_Output(other,self, " DIA_Neoras_TEACH_15_00 " );	// Can I learn something from you?
	if((other.guild == GIL_KDF) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Neoras_TEACH_01_01 " );	// I can teach you the secrets of alchemy.
		Info_ClearChoices(DIA_Neoras_TEACH);
		Info_AddChoice(DIA_Neoras_TEACH,Dialog_Back,DIA_Neoras_TEACH_BACK);
		if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Лечебная эссенция ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),DIA_Neoras_TEACH_HEALTH_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Лечебный экстракт ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),DIA_Neoras_TEACH_Health_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Лечебный эликсир",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),DIA_Neoras_TEACH_Health_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Эликсир жизни ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),DIA_Neoras_TEACH_Perm_Health);
		};
		if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Эссенция маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),DIA_Neoras_TEACH_Mana_01);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Экстракт маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),DIA_Neoras_TEACH_Mana_02);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Эликсир маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),DIA_Neoras_TEACH_Mana_03);
		};
		if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
		{
			Info_AddChoice(DIA_Neoras_TEACH,b_buildlearnstringforalchemy("Эликсир духа",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),DIA_Neoras_TEACH_Perm_Mana);
		};
	}
	else if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other, " DIA_Neoras_TEACH_01_02 " );	// I don't teach beginners. If, one day, you are accepted into the Circle of Fire...
		AI_Output(self,other, " DIA_Neoras_TEACH_01_03 " );	// ...then I'll show you how to create powerful potions.
	}
	else
	{
		AI_Output(self,other, " DIA_Neoras_TEACH_01_04 " );	// I pass on my knowledge only to members of our church.
	};
};

func void DIA_Neoras_TEACH_BACK()
{
	Info_ClearChoices(DIA_Neoras_TEACH);
};

func void DIA_Neoras_TEACH_HEALTH_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void DIA_Neoras_TEACH_Health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void DIA_Neoras_TEACH_Health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void DIA_Neoras_TEACH_Perm_Health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void DIA_Neoras_TEACH_Mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void DIA_Neoras_TEACH_Mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void DIA_Neoras_TEACH_Mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void DIA_Neoras_TEACH_Perm_Mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};


instance DIA_Neoras_Kap2_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap2_EXIT_Condition;
	information = DIA_Neoras_Kap2_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap2_EXIT_Condition()
{
	if (chapter ==  2 )
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap2_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Neoras_Kap3_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap3_EXIT_Condition;
	information = DIA_Neoras_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Neoras_BrewPotion(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 39;
	condition = DIA_Neoras_BrewPotion_Condition;
	information = DIA_Neoras_BrewPotion_Info;
	permanent = TRUE;
	description = " Could you make me a potion? " ;
};


func int DIA_Neoras_BrewPotion_Condition()
{
	if(NeorasBrewsForYou == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_BrewPotion_Info()
{
	AI_Output(other,self, " DIA_Neoras_BrewPotion_15_00 " );	// Could you brew a potion for me?
	if(hero.guild == GIL_NOV)
	{
		AI_Output(self,other, " DIA_Neoras_BrewPotion_01_01 " );	// You're too impatient for a beginner. Go do your duty.
		AI_Output(self,other, " DIA_Neoras_BrewPotion_01_02 " );	// You can buy everything you need from Gorax.
	}
	else
	{
		AI_Output(self,other, " DIA_Neoras_BrewPotion_01_03 " );	// Do you doubt my abilities? I can brew any potion.
		AI_Output(other,self, " DIA_Neoras_BrewPotion_15_04 " );	// Great!
		AI_Output(self,other, " DIA_Neoras_BrewPotion_01_05 " );	// Not so fast. First, you must bring me the necessary ingredients and pay a modest fee for my labors. Also for materials.
		AI_Output(other,self, " DIA_Neoras_BrewPotion_15_06 " );	// How much do you want?
		AI_Output(self,other, " DIA_Neoras_BrewPotion_01_07 " );	// For the preparation itself, I take ten gold coins.
		NeorasBrewsForYou = TRUE;
	};
};


var int neoras_orcpotiononetime;

instance DIA_NEORAS_ORCPOTION(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 39;
	condition = dia_neoras_orcpotion_condition;
	information = dia_neoras_orcpotion_info;
	permanent = TRUE;
	description = " I've got an orc potion here. " ;
};


func int dia_neoras_orcpotion_condition()
{
	if(Npc_HasItems(other,itpo_xorcpotion) > 0)
	{
		return TRUE;
	};
};

func void dia_neoras_orcpotion_back()
{
	AI_StopProcessInfos(self);
};

func void dia_neoras_orcpotion_create()
{
	B_GiveInvItems(other,self,itpo_xorcpotion,1);
	Npc_RemoveInvItems(self,itpo_xorcpotion,1);
	B_GiveInvItems(self,other,itpo_xorcpotion02,1);
	AI_Output(self,other, " DIA_Neoras_OrcPotion_01_17 " );	// Here, we're done.
	AI_StopProcessInfos(self);
};

func void dia_neoras_orcpotion_pay()
{
	AI_Output(other,self, " DIA_Neoras_OrcPotion_15_15 " );	// Make me a potion.
	Info_ClearChoices(dia_neoras_orcpotion);
	if(Npc_HasItems(hero,ItMi_Gold) >= 300)
	{
		Npc_RemoveInvItems(hero,ItMi_Gold,300);
		dia_neoras_orcpotion_create();
	}
	else
	{
		AI_Output(self,other, " DIA_Neoras_OrcPotion_01_16 " );	// Unfortunately, you didn't stock up on gold.
	};
};

func void dia_neoras_orcpotion_info()
{
	AI_Output(other,self, " DIA_Neoras_OrcPotion_15_00 " );	// I've got an orc potion here.
	if(NEORAS_ORCPOTIONONETIME == FALSE)
	{
		AI_Output(other,self, " DIA_Neoras_OrcPotion_15_01 " );	// Is there anything we can do with it?
		AI_Output(self,other, " DIA_Neoras_OrcPotion_01_02 " );	// Hmm, interesting. I've seen this before.
		AI_Output(self,other, " DIA_Neoras_OrcPotion_01_03 " );	// You can add one natural salt to it and it will become harmless.
		AI_Output(self,other, " DIA_Neoras_OrcPotion_01_04 " );	// And add orcish strength and dexterity to the drinker.
		AI_Output(self,other, " DIA_Neoras_OrcPotion_01_05 " );	// But, unfortunately, it will weaken his magic power. And this effect cannot be eliminated in any way.
		AI_Output(other,self, " DIA_Neoras_OrcPotion_15_06 " );	// Can you do this?
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other, " DIA_Neoras_OrcPotion_01_07 " );	// I can. But be careful - you will have to make up for the losses in your magician abilities.
		}
		else
		{
			AI_Output(self,other, " DIA_Neoras_OrcPotion_01_08 " );	// Of course, only the necessary salt is imported, and is expensive. Especially now.
			AI_Output(other,self,"DIA_Neoras_OrcPotion_15_09");	//Сколько?
			AI_Output(self,other, " DIA_Neoras_OrcPotion_01_10 " );	// Three hundred gold.
		};
		NEORAS_ORCPOTIONONETIME = TRUE;
	}
	else
	{
		AI_Output(other,self, " DIA_Neoras_OrcPotion_15_11 " );	// Can you add what you need to it?
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other, " DIA_Neoras_OrcPotion_01_12 " );	// Of course, brother.
		}
		else
		{
			AI_Output(self,other, " DIA_Neoras_OrcPotion_01_13 " );	// Of course. But I think you remember the price?
		};
	};
	if(hero.guild == GIL_KDF)
	{
		Info_ClearChoices(dia_neoras_orcpotion);
		Info_AddChoice(dia_neoras_orcpotion,Dialog_Back,dia_neoras_orcpotion_back);
		Info_AddChoice(dia_neoras_orcpotion, " Make me a potion. " ,dia_neoras_orcpotion_create);
	}
	else
	{
		Info_ClearChoices(dia_neoras_orcpotion);
		Info_AddChoice(dia_neoras_orcpotion,Dialog_Back,dia_neoras_orcpotion_back);
		Info_AddChoice(dia_neoras_orcpotion, " Make me a potion. (Price: 300 gold coins). " ,dia_neoras_orcpotion_pay);
	};
};


instance DIA_Neoras_BrewForMe(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 39;
	condition = DIA_Neoras_BrewForMe_Condition;
	information = DIA_Neoras_BrewForMe_Info;
	permanent = TRUE;
	description = " Cook me... " ;
};


func int DIA_Neoras_BrewForMe_Condition()
{
	if(NeorasBrewsForYou == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_BrewForMe_Info()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe, " ...speed drink. " ,DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe, " ...mana extract. " ,DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe, " ...healing extract. " ,DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Back()
{
	Info_ClearChoices(DIA_Neoras_BrewForMe);
};

func void DIA_Neoras_BrewForMe_Speed()
{
	AI_Output(other,self, " DIA_Neoras_BrewForMe_Speed_15_00 " );	// Brew me a potion of speed.
	AI_Output(self,other, " DIA_Neoras_BrewForMe_Speed_01_01 " );	// Okay, do you have the necessary ingredients and gold?

	if((Npc_HasItems(other,ItFo_Alcohol) >= 1) && (Npc_HasItems(other,ItPl_Speed_Herb_01) >= 1) && (Npc_HasItems(other,ItPl_Temp_Herb) >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(other,self, " DIA_Neoras_BrewForMe_Speed_15_02 " );	// Yes. Here you are.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItFo_Alcohol,1);
		Npc_RemoveInvItems(other,ItPl_Speed_Herb_01,1);
		Npc_RemoveInvItems(other,ItPl_Temp_Herb,1);
		Npc_RemoveInvItems(other,ItMi_Gold,10);
		AI_Output(self,other, " DIA_Neoras_BrewForMe_Speed_01_03 " );	// Ok, thanks. Now I'll give you a potion - you won't have to wait long.
		B_GiveInvItems(self,other,ItPo_Speed,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Neoras_BrewForMe_Speed_01_04 " );	// You don't have the required ingredients. Come back when you've got them.
	};

	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe, " Prepare me a drink of speed. " ,DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe, " Brew me a mana extract. " ,DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe, " Brew me a healing extract. " ,DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Mana()
{
	AI_Output(other,self, " DIA_Neoras_BrewForMe_Mana_15_00 " );	// Brew me an elixir of mana.
	AI_Output(self,other, " DIA_Neoras_BrewForMe_Mana_01_01 " );	// Good. Do you have the necessary ingredients and gold?

	if((Npc_HasItems(other,ItFo_Alcohol) >= 1) && (Npc_HasItems(other,ItPl_Mana_Herb_02) >= 2) && (Npc_HasItems(other,ItPl_Blueplant) >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(other,self, " DIA_Neoras_BrewForMe_Mana_15_02 " );	// Yes. Here you are.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItFo_Alcohol,1);
		Npc_RemoveInvItems(other,ItPl_Mana_Herb_02,2);
		Npc_RemoveInvItems(other,ItPl_Blueplant,1);
		Npc_RemoveInvItems(other,ItMi_Gold,10);
		AI_Output(self,other, " DIA_Neoras_BrewForMe_Mana_01_03 " );	// Good. Now I'll give you a potion - you won't have to wait long.
		B_GiveInvItems(self,other,ItPo_Mana_02,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Neoras_BrewForMe_Mana_01_04 " );	// You don't have the required ingredients. Come back when you've got them.
	};

	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe, " Prepare me a drink of speed. " ,DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe, " Brew me a mana extract. " ,DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe, " Brew me a healing extract. " ,DIA_Neoras_BrewForMe_Health);
};

func void DIA_Neoras_BrewForMe_Health()
{
	AI_Output(other,self, " DIA_Neoras_BrewForMe_Health_15_00 " );	// Brew me a healing elixir.
	AI_Output(self,other, " DIA_Neoras_BrewForMe_Health_01_01 " );	// Good. Do you have the necessary ingredients and gold?

	if((Npc_HasItems(other,ItFo_Alcohol) >= 1) && (Npc_HasItems(other,ItPl_Health_Herb_02) >= 2) && (Npc_HasItems(other,ItPl_Blueplant) >= 1) && (Npc_HasItems(other,ItMi_Gold) >= 10))
	{
		AI_Output(other,self, " DIA_Neoras_BrewForMe_Health_15_02 " );	// Yes. Here you are.
		B_GiveInvItemsManyThings(other,self);
		Npc_RemoveInvItems(other,ItFo_Alcohol,1);
		Npc_RemoveInvItems(other,ItPl_Health_Herb_02,2);
		Npc_RemoveInvItems(other,ItPl_Blueplant,1);
		Npc_RemoveInvItems(other,ItMi_Gold,10);
		AI_Output(self,other, " DIA_Neoras_BrewForMe_Health_01_03 " );	// Okay, I'll give it to you, you won't have to wait long.
		B_GiveInvItems(self,other,ItPo_Health_02,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Neoras_BrewForMe_Health_01_04 " );	// Good. Now I'll give you a potion - you won't have to wait long.
	};
	Info_ClearChoices(DIA_Neoras_BrewForMe);
	Info_AddChoice(DIA_Neoras_BrewForMe,Dialog_Back,DIA_Neoras_BrewForMe_Back);
	Info_AddChoice(DIA_Neoras_BrewForMe, " Prepare me a drink of speed. " ,DIA_Neoras_BrewForMe_Speed);
	Info_AddChoice(DIA_Neoras_BrewForMe, " Brew me a mana extract. " ,DIA_Neoras_BrewForMe_Mana);
	Info_AddChoice(DIA_Neoras_BrewForMe, " Brew me a healing extract. " ,DIA_Neoras_BrewForMe_Health);
};


instance DIA_Neoras_Kap4_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap4_EXIT_Condition;
	information = DIA_Neoras_Kap4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Neoras_DRACHENEIER (C_Info)
{
	npc = KDF_506_Neoras;
	nr = 40;
	condition = DIA_Neoras_DRACHENEIER_Condition;
	information = DIA_Neoras_DRACHENEIER_Info;
	permanent = TRUE;
	description = " You're working so hard you're sweating. " ;
};


func int DIA_Neoras_DRACHENEIER_Condition()
{
	if ((Chapter >=  4 ) && ((hero.guild ==  GIL_MIL ) || (hero.guild ==  GIL_PAL ) || (hero.guild ==  GIL_KDF )) && (MY_Neoras_DragonEgg ==  0 )) ;
	{
		return TRUE;
	};
};

func void DIA_Neoras_DRACHENEIER_Info()
{
	AI_Output(other,self, " DIA_Neoras_DRACHENEIER_15_00 " );	// You're working so hard you're sweating.
	AI_Output(self,other, " DIA_Neoras_DRACHENEIER_01_01 " );	// Yes, I'm completely exhausted. I've been trying to make this damn potion for days now. And nothing works.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
	Info_AddChoice(DIA_Neoras_DRACHENEIER, " These are not my problems. " ,DIA_Neoras_DRACHENEIER_no);
	Info_AddChoice(DIA_Neoras_DRACHENEIER, " What potion should this be? " ,DIA_Neoras_DRACHENEIER_trank);
	Info_AddChoice(DIA_Neoras_DRACHENEIER, " What's the problem? " ,DIA_Neoras_DRACHENEIER_ei);
};

func void DIA_Neoras_DRACHENEIER_ei()
{
	AI_Output(other,self, " DIA_Neoras_DRACHENEIER_ei_15_00 " );	// What's the problem?
	AI_Output(self,other, " DIA_Neoras_DRACHENEIER_ei_01_01 " );	// The recipe says something about a dragon egg. Of course, I don't have it.
	AI_Output(self,other, " DIA_Neoras_DRACHENEIER_ei_01_02 " );	// So I tried to replace this ingredient. So far, however, all in vain.
	AI_Output(self,other, " DIA_Neoras_DRACHENEIER_ei_01_03 " );	// If one day, in some cave, you stumble upon one of these things, please don't forget about me.
	Info_AddChoice(DIA_Neoras_DRACHENEIER, " What do you use instead of a dragon egg? " ,DIA_Neoras_DRACHENEIER_ei_statt);
	Info_AddChoice(DIA_Neoras_DRACHENEIER, " I'll try. " ,DIA_Neoras_DRACHENEIER_ei_jep);
};

func void DIA_Neoras_DRACHENEIER_ei_jep()
{
	AI_Output(other,self, " DIA_Neoras_DRACHENEIER_ei_jep_15_00 " );	// I'll try to do something.
	AI_Output(self,other, " DIA_Neoras_DRACHENEIER_ei_jep_01_01 " );	// Hey. I was just joking. I don't believe you'll actually be able to find the dragon's egg.
	AI_Output(other,self, " DIA_Neoras_DRACHENEIER_ei_jep_15_02 " );	// Let's just wait.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
	Log_CreateTopic(TOPIC_DRACHENEIERNeoras,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENEIERNeoras,LOG_Running);
	B_LogEntry(TOPIC_DRACHENEIEERNeoras, " Neorace needs a dragon egg for experiments. He thinks I might be able to find one in a cave somewhere. " );
	MIS_Neoras_DragonEgg = LOG_Running;
};

func void DIA_Neoras_DRACHENEIER_ei_statt()
{
	AI_Output(other,self, " DIA_Neoras_DRACHENEIER_ei_statt_15_00 " );	// What do you use instead of a dragon egg?
	AI_Output(self,other, " DIA_Neoras_DRACHENEIER_ei_statt_01_01 " );	// Trust me, you're better off not knowing.
};

func void DIA_Neoras_DRACHENEIER_trank()
{
	AI_Output(other,self, " DIA_Neoras_DRACHENEIER_trank_15_00 " );	// And what should this potion be?
	AI_Output(self,other, " DIA_Neoras_DRACHENEIER_trank_01_01 " );	// I bought this recipe from a traveling merchant. It talks about rather strange, but very interesting things.
	AI_Output(self,other, " DIA_Neoras_DRACHENEIER_trank_01_02 " );	// I'm not sure if this potion actually does anything, but my thirst for knowledge makes me continue this experiment.
};

func void DIA_Neoras_DRACHENEIER_no()
{
	AI_Output(other,self, " DIA_Neoras_DRACHENEIER_no_15_00 " );	// This problem does not concern me.
	AI_Output(self,other, " DIA_Neoras_DRACHENEIER_no_01_01 " );	// Then please don't bother me anymore.
	Info_ClearChoices(DIA_Neoras_DRACHENEIER);
};


instance DIA_Neoras_FOUNDDRAGONEGG(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_FOUNDDRAGONEGG_Condition;
	information = DIA_Neoras_FOUNDDRAGONEGG_Info;
	description = " Here, I found a dragon egg for you. " ;
};


func int DIA_Neoras_FOUNDDRAGONEGG_Condition()
{
	if(Npc_HasItems(other,ItAt_DragonEgg_MIS) && (MIS_Neoras_DragonEgg == LOG_Running))
	{
		return TRUE;
	};
};


var int Neoras_DragonEggDrink_Day;

func void DIA_Neoras_FOUNDDRAGONEGG_Info()
{
	AI_Output(other,self, " DIA_Neoras_FOUNDDRAGONEGG_15_00 " );	// Here, I found a dragon egg for you.
	AI_Output(self,other, " DIA_Neoras_FOUNDDRAGONEGG_01_01 " );	// You're mocking me.
	B_GiveInvItems(other,self,ItAt_DragonEgg_MIS,1);
	Npc_RemoveInvItems(self,ItAt_DragonEgg_MIS,1);
	AI_Output(self,other, " DIA_Neoras_FOUNDDRAGONEGG_01_02 " );	// It's real! I didn't even think it was possible. Where did you find it?
	AI_Output(other,self, " DIA_Neoras_FOUNDDRAGONEGG_15_03 " );	// You better not know.
	AI_Output(self,other, " DIA_Neoras_FOUNDDRAGONEGG_01_04 " );	// Excellent. What do you want for him?
	MIS_Neoras_DragonEgg = LOG_SUCCESS;
	B_GivePlayerXP(XP_Neoras_DragonEgg);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG, " Not yet. " ,DIA_Neoras_FOUNDDRAGONEGG_irgendwas);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG, " How about some healing potions? " ,DIA_Neoras_FOUNDDRAGONEGG_heil);
	Info_AddChoice(DIA_Neoras_FOUNDDRAGONEGG, " Give me some of this potion when it's ready. " ,DIA_Neoras_FOUNDDRAGONEGG_trank);
};


var int Neoras_SCWantsDragonEggDrink;

func void DIA_Neoras_FOUNDDRAGONEGG_trank()
{
	AI_Output(other,self, " DIA_Neoras_FOUNDDRAGONEGG_trank_15_00 " );	// Give me some of this potion when it's ready.
	AI_Output(self,other, " DIA_Neoras_FOUNDDRAGONEGG_trank_01_01 " );	// Good. But like I said, I have no idea how it works.
	AI_Output(self,other, " DIA_Neoras_FOUNDDRAGONEGG_trank_01_02 " );	// Come back later when I finish it.
	Neoras_DragonEggDrink_Day = Wld_GetDay();
	Neoras_SCWantsDragonEggDrink = TRUE;
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_heil()
{
	AI_Output(other,self, " DIA_Neoras_FOUNDDRAGONEGG_heil_15_00 " );	// How about some healing potions?
	AI_Output(self,other, " DIA_Neoras_FOUNDDRAGONEGG_heil_01_01 " );	// Good choice. Here you are. I hope you find them useful.
	CreateInvItems(self,ItPo_Health_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};

func void DIA_Neoras_FOUNDDRAGONEGG_irgendwas()
{
	AI_Output(other,self, " DIA_Neoras_FOUNDDRAGONEGG_irgendwas_15_00 " );	// I don't even know.
	AI_Output(self,other, " DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_01 " );	// Mmm. Good. Then take this magical ring. I'm sure it will help you in the fight against your enemies.
	AI_Output(self,other, " DIA_Neoras_FOUNDDRAGONEGG_irgendwas_01_02 " );	// It will protect you from magical creature attacks.
	CreateInvItems(self,ItRi_Prot_Mage_02,1);
	B_GiveInvItems(self,other,ItRi_Prot_Mage_02,1);
	Info_ClearChoices(DIA_Neoras_FOUNDDRAGONEGG);
};


instance DIA_Neoras_DRAGONEGGDRINK(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_DRAGONEGGDRINK_Condition;
	information = DIA_Neoras_DRAGONEGGDRINK_Info;
	description = " I've come to get this mystical dragon egg potion. " ;
};


func int DIA_Neoras_DRAGONEGGDRINK_Condition()
{
	if((Neoras_DragonEggDrink_Day <= (Wld_GetDay() - 2)) && (Neoras_SCWantsDragonEggDrink == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Neoras_DRAGONEGGDRINK_Info()
{
	AI_Output(other,self, " DIA_Neoras_DRAGONEGGDRINK_15_00 " );	// I've come to get this mysterious dragon egg potion.
	AI_Output(self,other, " DIA_Neoras_DRAGONEGGDRINK_01_01 " );	// Yes. I just finished it. I have not yet tested it and do not take any responsibility for its operation. Do you hear?
	AI_Output(other,self, " DIA_Neoras_DRAGONEGGDRINK_15_02 " );	// Give it here.
	AI_Output(self,other, " DIA_Neoras_DRAGONEGGDRINK_01_03 " );	// Good. I hope this swill doesn't make your head explode.
	CreateInvItems(self,ItPo_DragonEggDrinkNeoras_MIS,1);
	B_GiveInvItems(self,other,ItPo_DragonEggDrinkNeoras_MIS,1);
};


instance DIA_Neoras_USEDDRAGONEGGDRINK(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 3;
	condition = DIA_Neoras_USEDDRAGONEGGDRINK_Condition;
	information = DIA_Neoras_USEDDRAGONEGGDRINK_Info;
	description = " I tried your dragon egg potion. Great stuff! " ;
};


func int DIA_Neoras_USEDDRAGONEGGDRINK_Condition()
{
	if(Neoras_SCUsedDragonEggDrink == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Neoras_USEDDRAGONEGGDRINK_Info()
{
	AI_Output(other,self, " DIA_Neoras_USEDDRAGONEGGDRINK_15_00 " );	// I tried your dragon egg potion. Great stuff!
	AI_Output(self,other, " DIA_Neoras_USEDDRAGONEGGDRINK_01_01 " );	// Mmm. Very interesting. I must continue my research.
	AI_Output(other,self, " DIA_Neoras_USEDDRAGONEGGDRINK_15_02 " );	// Could you make me some more?
	AI_Output(self,other, " DIA_Neoras_USEDDRAGONEGGDRINK_01_03 " );	// It'll be better if we do this again in a few weeks. Otherwise, I'm afraid you might grow horns.
};


instance DIA_Neoras_Kap5_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = DIA_Neoras_Kap5_EXIT_Condition;
	information = DIA_Neoras_Kap5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Neoras_Kap5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Neoras_Kap5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Neoras_PICKPOCKET(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 900;
	condition = DIA_Neoras_PICKPOCKET_Condition;
	information = DIA_Neoras_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Neoras_PICKPOCKET_Condition()
{
	return  C_Robbery ( 72 , 140 );
};

func void DIA_Neoras_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
	Info_AddChoice(DIA_Neoras_PICKPOCKET,Dialog_Back,DIA_Neoras_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Neoras_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Neoras_PICKPOCKET_DoIt);
};

func void DIA_Neoras_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
};

func void DIA_Neoras_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Neoras_PICKPOCKET);
};

func void b_endneorasreceptfortyon()
{
	KNOWABOUTRECEPTFORTYON = TRUE;
	Info_ClearChoices(dia_neoras_receptfortyon);
	AI_StopProcessInfos(self);
};

instance DIA_NEORAS_RECEPTFORTYON(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = dia_neoras_receptfortyon_condition;
	information = dia_neoras_receptfortyon_info;
	permanent = FALSE;
	description = " (ask for a potion recipe) " ;
};

func int dia_neoras_receptfortyon_condition()
{
	if((MIS_RECEPTFORTYON == LOG_Running) && (Npc_HasItems(other,itwr_tyonrecept) < 1))
	{
		return TRUE;
	};
};

func void dia_neoras_receptfortyon_info()
{
	if(KNOWABOUTRECEPTFORTYON == FALSE)
	{
		AI_Output(other,self, " DIA_Neoras_ReceptForTyon_01_00 " );	// I heard that there is a potion that can affect a person's mind in some way.
		AI_Output(other,self, " DIA_Neoras_ReceptForTyon_01_03 " );	// Have you ever heard of this?
		AI_Output(self,other, " DIA_Neoras_ReceptForTyon_01_04 " );	// Hmmm...(in disbelief) Why are you interested in this?
		Info_ClearChoices(dia_neoras_receptfortyon);
		Info_AddChoice(dia_neoras_receptfortyon, " I really need this recipe! " ,dia_neoras_receptfortyon_wants);
		Info_AddChoice(dia_neoras_receptfortyon, " I would like to know more about this elixir. " ,dia_neoras_receptfortyon_alchimik);
		Info_AddChoice(dia_neoras_receptfortyon, " Just asking. " ,dia_neoras_receptfortyon_interest);
	}
	else
	{
		AI_Output(other,self, " DIA_Neoras_ReceptForTyon_01_07 " );	// I heard that there is a potion that can affect a person's mind in some way.
		AI_Output(other,self, " DIA_Neoras_ReceptForTyon_01_08 " );	// I've also heard that you, the Firebenders, may have knowledge of this elixir.
		AI_Output(self,other, " DIA_Neoras_ReceptForTyon_01_11 " );	// (in disbelief) Why are you interested in this?
		Info_ClearChoices(dia_neoras_receptfortyon);
		Info_AddChoice(dia_neoras_receptfortyon, " I really need this recipe! " ,dia_neoras_receptfortyon_wants);
		Info_AddChoice(dia_neoras_receptfortyon, " I would like to learn more about the properties of this elixir. " ,dia_neoras_receptfortyon_alchimik);
		Info_AddChoice(dia_neoras_receptfortyon, " Just asking. " ,dia_neoras_receptfortyon_interest);
	};
};

func void dia_neoras_receptfortyon_wants()
{
	AI_Output(other,self, " DIA_Neoras_ReceptForTyon_Wants_01_00 " );	// I really need this recipe!

	if(KNOWABOUTRECEPTFORTYON == TRUE)
	{
		AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Wants_01_02 " );	// Even if the Firebenders had this kind of knowledge, do you really think they would entrust this secret to a ragamuffin like you?
		AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Wants_01_03 " );	// Such valuable knowledge is available only to a select few, and I do not think that you belong to this category.
		AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Wants_01_05 " );	// Don't waste your time trying in vain to master something you can't.
		AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Wants_01_06 " );	// Now let's end this conversation. My research doesn't leave me much time for chatter.
		b_endneorasreceptfortyon();
	}
	else
	{
		AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Wants_01_07 " );	// I don't even know where you can get this recipe.
		AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Wants_01_08 " );	// Maybe in town you can learn more about it.
		b_endneorasreceptfortyon();
	};
};

func void dia_neoras_receptfortyon_alchimik()
{
	AI_Output(other,self, " DIA_Neoras_ReceptForTyon_Alchimik_01_00 " );	// I would like to know more about the properties of this elixir.

	if(Npc_GetTalentSkill(other,NPC_TALENT_ALCHEMY) > 0)
	{
		if(KNOWABOUTRECEPTFORTYON == TRUE)
		{
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_01 " );	// So you are a seeker of knowledge!
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_02 " );	// But I'm afraid I can't help you in this matter.
			AI_Output(other,self,"DIA_Neoras_ReceptForTyon_Alchimik_01_03");	//Почему?
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_04 " );	// I can only pass this knowledge on to a member of our order. And yet you are not.
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_05 " );	// If suddenly this secret falls into the wrong hands, then the consequences can be simply catastrophic.
			AI_Output(other,self, " DIA_Neoras_ReceptForTyon_Alchimik_01_06 " );	// That's why you Firebenders keep the recipe for this potion a closely guarded secret.
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_07 " );	// Yes. But don't even try to get to him. It's stored in a place where you'll never get to.
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_08 " );	// This treasure belongs only to the chosen of Innos! And only they are allowed to use it for its intended purpose.
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_10 " );	// Now let's end this conversation. My research doesn't leave me much time for chatter.
			B_LogEntry( TOPIC_RECEPTFORTYON , " Neoras confessed that this recipe is kept here by the fire mages in the monastery. Now it only remains to find the place where they hide it. " );
			B_LogEntry_Quiet( TOPIC_RECEPTFORTYON , " Neoras also mentioned that he would reveal the secret of the mind transformation elixir only to the Fire Mage. " );
			b_endneorasreceptfortyon();
		}
		else
		{
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_11 " );	// So you're a seeker of knowledge! Well, I'm ready to share what I know myself.
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_12 " );	// I've heard of this elixir, and it does have a number of truly unusual alchemical properties.
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_13 " );	// Impact on the mind is just one of them. Moreover, each of these properties can change from time to time in an unpredictable way.
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_14 " );	// It should also be noted that the preparation of this potion is a rather complicated process, and only a very experienced alchemist can handle it.
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_15 " );	// In addition, its composition includes very rare ingredients.
			AI_Output(other,self, " DIA_Neoras_ReceptForTyon_Alchimik_01_16 " );	// Do you have this composition?
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_17 " );	// No...(laughs) I've only heard about this elixir, but I don't have its secret.
			AI_Output(other,self, " DIA_Neoras_ReceptForTyon_Alchimik_01_18 " );	// And who can know how to make this potion?
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_19 " );	// I have no idea. The city is full of alchemists - maybe someone can tell you more about it.
			AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_20 " );	// Now let's end this conversation. My research doesn't leave me much time for all sorts of chatter.
			b_endneorasreceptfortyon();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_22 " );	// Tell me, how can this knowledge help you if you don't even know how to make potions?
		AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_24 " );	// You're wasting my time!
		AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Alchimik_01_25 " );	// This concludes our conversation. My research doesn't leave me much time for chatter.
		b_endneorasreceptfortyon();
	};
};

func void dia_neoras_receptfortyon_interest()
{
	AI_Output(other,self, " DIA_Neoras_ReceptForTyon_Interest_01_00 " );	// I just asked.
	AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Interest_01_01 " );	// Then I have no idea what you're talking about.
	AI_Output(self,other, " DIA_Neoras_ReceptForTyon_Interest_01_02 " );	// And this is where our conversation ends. My research doesn't leave me much time for idle chatter.
	b_endneorasreceptfortyon();
};

instance DIA_NEORAS_RECEPTFORKDF(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = dia_neoras_receptforkdf_condition;
	information = dia_neoras_receptforkdf_info;
	permanent = FALSE;
	description = " Tell me the secret of the consciousness transformation elixir. " ;
};

func int dia_neoras_receptforkdf_condition()
{
	if((other.guild == GIL_KDF) && (NEORASCANTEACHRECEPTFORKDF == TRUE))
	{
		return TRUE;
	};
};

func void dia_neoras_receptforkdf_info()
{
	AI_Output(other,self, " DIA_Neoras_ReceptForKDF_01_00 " );	// Reveal to me the secret of the consciousness transformation elixir.
	AI_Output(other,self, " DIA_Neoras_ReceptForKDF_01_01 " );	// Now that I'm a Firebender, could you do this?
	AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_02 " );	// Since you are now one of the chosen of Innos, I can pass on this arcane knowledge to you.
	AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_03 " );	// The potion you call the elixir of consciousness transformation is more simply called the drink of Amun-Su.
	AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_04 " );	// In ancient times, that was the name of the creator of this divine solution - a powerful magician of Light, whose name hardly anyone remembers.
	AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_05 " );	// I want to warn you right away that the preparation of this potion is a rather complicated process, and only a very experienced alchemist can handle it.
	AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_06 " );	// You will need a much deeper knowledge of alchemy than knowledge of the basics.
	AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_07 " );	// This is not an easy task, but it is also one of the conditions for comprehending the secret of the elixir of consciousness transformation.

	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == TRUE)
	{
		AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_0A " );	// You know a lot about alchemy...

		if(B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_SUPERMANA))
		{
			AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_08 " );	// And, as I see it, you are quite ready to comprehend it.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_09 " );	// Good. Listen carefully and remember.
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoWP(self,"NW_MONASTERY_ALCHEMY_01");
			AI_AlignToWP(self);
			AI_UseMob(self,"LAB",5);
			AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_10 " );	// First of all, you need to prepare all the necessary components for this potion.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_11 " );	// This elixir will require a lot of them to make, so be careful not to miss any of them.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_12 " );	// Next, on the alchemy table, you sequentially add each of these components in the right proportion to the saline solution.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_13 " );	// And here the most important thing is not to make a mistake. The correct order of addition must be observed.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_14 " );	// Then you bring the resulting solution to a homogeneous mass and heat it to the boiling stage...
			AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_15 " );	// See how I do it? A little more and...
			AI_UseMob(self,"LAB",-1);
			B_TurnToNpc(self,other);
			AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_16 " );	// That's it! The divine elixir of Amun-Su is ready.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_17 " );	// Now you can try it yourself.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_18 " );	// Yes, and more. The essence of the elixir is such that all its magical properties are fully revealed only at the first use.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_19 " );	// Subsequent uses of this drink will have a much weaker effect than the previous one. Remember this.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_21 " );	// And as far as I can tell, you don't have enough experience to comprehend it yet.
		AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_22 " );	// You don't yet have some knowledge of the alchemist's craft, which is fundamental to learning how to make this potion.
		AI_Output(self,other, " DIA_Neoras_ReceptForKDF_01_23 " );	// Comprehend them - then you will be able to touch this mystery.
	};
};


instance DIA_NEORAS_RECEPTFORKDFAGAIN(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = dia_neoras_receptforkdfagain_condition;
	information = dia_neoras_receptforkdfagain_info;
	permanent = TRUE;
	description = " Tell me the secret of Amun-Su's drink. " ;
};

func int dia_neoras_receptforkdfagain_condition()
{
	if ((other.guild ==  GIL_KDF ) && ( NEORASCANTEACHRECEPTFORKDF  ==  TRUE ) && Npc_KnowsInfo(hero, dia_neoras_receptforkdf ) && ( PLAYER_TALENT_ALCHEMY [ 16 ] ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_neoras_receptforkdfagain_info()
{
	AI_Output(other,self, " DIA_Neoras_ReceptForKDFAgain_01_00 " );	// Reveal to me the secret of the Amun-Su drink.

	if(PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == TRUE)
	{
		AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_0A " );	// You know a lot about alchemy...

		if(B_TeachPlayerTalentAlchemy(self,other,POTION_PERM_SUPERMANA))
		{
			AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_01 " );	// I see you are quite ready to comprehend this secret!
			AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_02 " );	// Good. Listen carefully and remember.
			AI_SetWalkMode(self,NPC_WALK);
			AI_GotoWP(self,"NW_MONASTERY_ALCHEMY_01");
			AI_AlignToWP(self);
			AI_UseMob(self,"LAB",5);
			AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_03 " );	// First of all, you need to prepare all the necessary components for this potion.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_04 " );	// This elixir will require a lot of them to make, so be careful not to miss any of them.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_05 " );	// Next, on the alchemy table, you add each of these components in succession in the right proportion to the salt solution.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_06 " );	// And here the most important thing is not to make a mistake. The correct order of addition must be observed.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_07 " );	// Then you bring the resulting solution to a homogeneous mass and heat it to the boiling stage...
			AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_08 " );	// See how I do it? A little more and...
			AI_UseMob(self,"LAB",-1);
			B_TurnToNpc(self,other);
			AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_09 " );	// That's it! The divine elixir of Amun-Su is ready.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_10 " );	// Now you can try it yourself.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_11 " );	// Yes, and more. The essence of the elixir is such that all its magical properties are fully revealed only at the first use.
			AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_12 " );	// Subsequent uses of this drink will have a much weaker effect than the previous one. Remember this.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_14 " );	// You are still lacking the experience to comprehend this mystery.
		AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_15 " );	// You don't yet have some knowledge of the alchemist's craft, which is fundamental to learning how to make this potion.
		AI_Output(self,other, " DIA_Neoras_ReceptForKDFAgain_01_16 " );	// Comprehend them - then you can touch her too.
	};
};

instance DIA_NEORAS_KAP6_EXIT(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 999;
	condition = dia_neoras_kap6_exit_condition;
	information = dia_neoras_kap6_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_neoras_kap6_exit_condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void dia_neoras_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NEORAS_RUNEMAGICNOTWORK(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 1;
	condition = dia_neoras_runemagicnotwork_condition;
	information = dia_neoras_runemagicnotwork_info;
	permanent = FALSE;
	description = " Your magic runes - do they still work? " ;
};


func int dia_neoras_runemagicnotwork_condition()
{
	if((STOPBIGBATTLE == TRUE) && (MIS_RUNEMAGICNOTWORK == LOG_Running) && (FIREMAGERUNESNOT == FALSE))
	{
		return TRUE;
	};
};

func void dia_neoras_runemagicnotwork_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Neoras_RuneMagicNotWork_01_00 " );	// Are your magical runes still active?
	AI_Output(self,other, " DIA_Neoras_RuneMagicNotWork_01_01 " );	// That's just the point, no! And I can't understand why I can't use them.
	AI_Output(other,self, " DIA_Neoras_RuneMagicNotWork_01_02 " );	// What about the rest?
	AI_Output(self,other, " DIA_Neoras_RuneMagicNotWork_01_03 " );	// Apparently, it affected us all! The other Firebenders also fail to do anything.
	B_LogEntry( TOPIC_RUNEMAGICNOTWORK , " The runestones of the other Firebenders have also lost their power. " );
	FIREMAGERUNESNOT = TRUE;
};


instance DIA_NEORAS_TRADE(C_Info)
{
	npc = KDF_506_Neoras;
	nr = 1;
	condition = dia_neoras_trade_condition;
	information = dia_neoras_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show your products " ;
};

func int dia_neoras_trade_condition()
{
	if (( hero . guild ==  GIL_KDF ) && Wld_IsTime ( 8 , 0 , 22 , 0 ))
	{
		return TRUE;
	};
};

func void dia_neoras_trade_info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_NEORAS_TRADE_01_01 " );	// Display your products
	B_GiveTradeInv(self);
};


instances DIA_neoras_LOKIPOTION (C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = DIA_neoras_LOKIPOTION_Condition;
	information = DIA_neoras_LOKIPOTION_Info;
	permanent = FALSE;
	description = " Did you recently buy a rare plant from merchant Zuris? " ;
};


func int DIA_neoras_LOKIPOTION_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (FindCactus == TRUE))
	{
		return TRUE;
	};
};

func void DIA_neoras_LOKIPOTION_Info()
{
	AI_Output(other,self, " DIA_neoras_LOKIPOTION_01_00 " );	// Did you recently buy a rare plant from Zuris the trader?
	AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_01 " );	// (stammered) I often buy various kinds of ingredients from him for my experiments.
	AI_Output(other, self, " DIA_neoras_LOKIPOTION_01_02 " );	// I mean cactus flower.
	AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_03 " );	// Ah, you mean that. Yes, it was a great fortune that he had one copy of this wonderful flower.
	AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_04 " );	// You see, I'm working on a magical elixir that will allow me to develop some immunity to fire.
	AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_05 " );	// And, by my calculations, I urgently needed a natural extract from the flower of this plant.
	AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_06 " );	// And why are you actually interested in this?
	AI_Output(other,self, " DIA_neoras_LOKIPOTION_01_07 " );	// I also really need this plant. But your copy seems to be the only one on the whole island.
	AI_Output(other,self, " DIA_neoras_LOKIPOTION_01_08 " );	// Can you sell it to me?
	AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_09 " );	// Forget it! Money doesn't interest me much.

	if(hero.guild == GIL_PAL)
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_neoras_LOKIPOTION_01_10 " );	// Then tell me what can make you give it to me?
		AI_Output(other,self, " DIA_neoras_LOKIPOTION_01_11 " );	// Or maybe I should take advantage of my status as a paladin...
		AI_Output(other,self, " DIA_neoras_LOKIPOTION_01_12 " );	// ...and claim it for the good of deeds in the name of Innos?
		AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_13 " );	// Okay, okay... (bewildered) And really, you shouldn't do this.
		AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_14 " );	// Okay, I'll give it to you just like that.
		AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_15 " );	// Here, take this. I hope you really use this plant for good deeds.
		B_GiveInvItems(self,other,ItPl_CactusFlower,1);
		AI_Output(other,self, " DIA_neoras_LOKIPOTION_01_16 " );	// You can be sure of that.
		B_LogEntry(TOPIC_PrioratStart, " Using my status as a paladin, I forced the mage Neoras to give me the plant I needed. It's time to return to the Tion idol. " );
	}
	else if(hero.guild == GIL_KDF)
	{
		B_GivePlayerXP(750);
		AI_Output(other,self, " DIA_neoras_LOKIPOTION_01_17 " );	// Then tell me what can make you give it to me?
		AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_18 " );	// I don't think this is possible. Even though you belong to our order.
		AI_Output(other,self, " DIA_neoras_LOKIPOTION_01_19 " );	// Look, I'm asking him for a reason.
		AI_Output(other,self, " DIA_neoras_LOKIPOTION_01_20 " );	// Trust me, your elixir is not so important now compared to what benefit this plant can bring if you give it to me.
		AI_Output(other,self, " DIA_neoras_LOKIPOTION_01_21 " );	// Think carefully about my words.
		AI_Output(other,self, " DIA_neoras_LOKIPOTION_01_22 " );	// Otherwise, I'll be forced to seek help from Pyrokar and other high firebenders.
		AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_23 " );	// Hmmm... (thoughtfully) Well, well, well... I'll give it to you... Just like that.
		AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_24 " );	// Here, take this. I hope that in the future I will not regret what I have done now.
		B_GiveInvItems(self,other,ItPl_CactusFlower,1);
		B_LogEntry(TOPIC_PrioratStart, " Using my status as a Firemage, I convinced the mage Neoras to give me the plant I needed. It's time to return to the Tion idol... " );
	}
	else
	{
		AI_Output(other,self, " DIA_neoras_LOKIPOTION_01_26 " );	// But maybe there is something else that would interest you more than your elixir?
		AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_27 " );	// Hmmm...(thoughtfully) Perhaps there really is such a thing.
		AI_Output(other,self,"DIA_neoras_LOKIPOTION_01_28");	//И что же?
		AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_29 " );	// Well, for example, black ore. It is said that its magical properties are much stronger than those of ordinary ore mined here on the island.
		AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_30 " );	// True, getting a sample of this breed is quite difficult.
		AI_Output(self,other, " DIA_neoras_LOKIPOTION_01_31 " );	// But if you can get it for me, I'll give you the plant you need.
		AI_Output(other,self, " DIA_neoras_LOKIPOTION_01_32 " );	// Agreed.
		B_LogEntry(TOPIC_PrioratStart, " Mage Neoras agreed to give me the plant I needed if I brought him a piece of black ore. " );
		BringNeorasBlackOre = TRUE;
	};
};


instance DIA_neoras_BringNeorasBlackOre (C_Info)
{
	npc = KDF_506_Neoras;
	nr = 2;
	condition = DIA_neoras_BringNeorasBlackOre_Condition;
	information = DIA_neoras_BringNeorasBlackOre_Info;
	permanent = FALSE;
	description = " Here's your black wonder. " ;
};

func int DIA_neoras_BringNeorasBlackOre_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BringNeorasBlackOre == TRUE) && (Npc_HasItems(other,ItMi_Zeitspalt_Addon) >= 1))
	{
		return TRUE;
	};
};

func void DIA_neoras_BringNeorasBlackOre_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_neoras_BringNeorasBlackOre_01_00 " );	// Here's your black miracle.
	B_GiveInvItems(other,self,ItMi_Zeitspalt_Addon, 1 );
	Npc_RemoveInvItems(self,ItMi_Zeitspalt_Addon,Npc_HasItems(self,ItMi_Zeitspalt_Addon));
	AI_Output(self,other, " DIA_neoras_BringNeorasBlackOre_01_01 " );	// Hmmm. Is this really her?
	AI_Output(other,self, " DIA_neoras_BringNeorasBlackOre_01_02 " );	// See for yourself if you don't believe me.
	AI_Output(self,other, " DIA_neoras_BringNeorasBlackOre_01_03 " );	// Well, yes, it looks like it.
	AI_Output(self,other, " DIA_neoras_BringNeorasBlackOre_01_04 " );	// Good. Here is your plant, as we agreed.
	B_GiveInvItems(self,other,ItPl_CactusFlower,1);
	B_LogEntry(TOPIC_PrioratStart, " I brought the black ore to the mage Neoras, and he in turn gave me the plant. " );
};
