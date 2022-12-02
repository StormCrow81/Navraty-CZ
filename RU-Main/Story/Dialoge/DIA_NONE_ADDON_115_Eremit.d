

instance DIA_Addon_Eremit_EXIT(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 999;
	condition = DIA_Addon_Eremit_EXIT_Condition;
	information = DIA_Addon_Eremit_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Eremit_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Eremit_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Eremit_Hello(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 1;
	condition = DIA_Addon_Eremit_Hello_Condition;
	information = DIA_Addon_Eremit_Hello_Info;
	description = " What are you doing here? " ;
};


func int DIA_Addon_Eremit_Hello_Condition()
{
	return TRUE;
};

func void DIA_Addon_Eremit_Hello_Info()
{
	AI_Output(other,self, " DIA_Addon_Eremit_Add_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_00 " );	// What am I doing here?! What the hell are YOU doing here?
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_01 " );	// I went to the most deserted part of the island, because I was looking for peace!
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_02 " );	// Civil war, bandit raids, orc attacks...
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_03 " );	// I'm tired of all this madness, so I decided to leave him behind.
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_04 " );	// Here, of course, there are also orcs, but very few.
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_05 " );	// But people, praise Innos, do not appear here ... or rather, they have not yet appeared.
};


instance DIA_Addon_Eremit_SeekTafeln (C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 2;
	condition = DIA_Addon_Eremit_SeekTafeln_Condition;
	information = DIA_Addon_Eremit_SeekTafeln_Info;
	description = " I'm looking for stone tablets... " ;
};


func int DIA_Addon_Eremit_SearchTablen_Condition();
{
	if(Npc_KnowsInfo(other,DIA_Addon_Eremit_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Export_SeekTable_Info()
{
	AI_Output(other,self, " DIA_Addon_Eremit_Add_15_02 " );	// I'm looking for stone tablets. Didn't you get them?
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_06 " );	// Yes, I have a couple of signs. But I won't give them to you!
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_07 " );	// This is the only thing I have to read.
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_08 " );	// Of course, I do not fully understand what is written on them, but I have already deciphered some texts.
};


var int Eremit_Teach_Once;

instance DIA_Addon_Eremit_Teach(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 3;
	condition = DIA_Addon_Eremit_Teach_Condition;
	information = DIA_Addon_Eremit_Teach_Info;
	permanent = TRUE;
	description = " About the stone tablets... " ;
};


func int DIA_Addon_Eremit_Teach_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Addon_Eremit_SeekTablen) && (Eremit_Teach_Once ==  FALSE ) && ( PLAYER_TALENT_FOREIGNLANGUAGE [ LANGUAGE_3 ] ==  FALSE )) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Eremit_Teach_Info()
{
	AI_Output(other,self, " DIA_Addon_Eremit_Add_15_03 " );	// About stone tablets...
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_25 " );	// Do you want me to teach you how to read them?
	if (MIS_Eremit_Klamotten !=  LOG_SUCCESS )
	{
		AI_Output(self,other, " DIA_Addon_Eremit_Add_04_26 " );	// (quickly) But I won't give you mine! Find your own signs!
	};
	Info_ClearChoices(DIA_Addon_Eremit_Teach);
	Info_AddChoice(DIA_Addon_Eremit_Teach,Dialog_Back,DIA_Addon_Eremit_Teach_No);
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == FALSE)
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_1,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_1)),DIA_Addon_Eremit_Teach_Yes);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE))
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_2,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_2)),DIA_Addon_Eremit_Teach_Yes);
	}
	else if((PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == FALSE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE) && (PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE))
	{
		Info_AddChoice(DIA_Addon_Eremit_Teach,b_buildlearnstringforlanguage(NAME_ADDON_LEARNLANGUAGE_3,B_GetLearnCostTalent(other,NPC_TALENT_FOREIGNLANGUAGE,LANGUAGE_3)),DIA_Addon_Eremit_Teach_Yes);
	};
};

func void B_Addon_Eremit_TeachLanguage()
{
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_27 " );	// In general, it's all pretty simple. 'G' is read as 'O', 'T' is read as 'X', and 'I' is read as 'C'.
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_28 " );	// If you understand this, then you will understand everything else pretty quickly...
	Eremit_Teach_Once = TRUE;
};

func void DIA_Addon_Eremit_Teach_No()
{
	Info_ClearChoices(DIA_Addon_Eremit_Teach);
};

func void DIA_Addon_Eremit_Teach_Yes()
{
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_3] == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Eremit_Add_04_29 " );	// I don't think I can teach you anything else.
		Eremit_Teach_Once = TRUE;
	}
	else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_2] == TRUE)
	{
		if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_3))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	}
	else if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_2))
		{
			B_Addon_Eremit_TeachLanguage();
		};
	}
	else if(B_TeachPlayerTalentForeignLanguage(self,other,LANGUAGE_1))
	{
		B_Addon_Eremit_TeachLanguage();
	};
};


instance DIA_Addon_Eremit_Klamotten (C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 4;
	condition = DIA_Addon_Eremit_Klamotten_Condition;
	information = DIA_Addon_Eremit_Klamotten_Info;
	permanent = TRUE;
	description = " I brought you some clothes... " ;
};


func int DIA_Addon_Eremit_Klamotten_Condition()
{
	if (MIS_Eremit_Klamotten == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_Klamotten_Info()
{
	AI_Output(other,self, " DIA_Addon_Eremit_Add_15_01 " );	// I brought you some clothes...
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_19 " );	// True? Give it to me, I want to try it on!
	Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
	Info_AddChoice(DIA_Addon_Eremit_Klamotten,Dialog_Back,DIA_Addon_Eremit_Klamotten_BACK);
	if(Npc_HasItems(other,ITAR_PIR_L_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, " Give Pirate Light Armor " ,DIA_Addon_Eremit_Klamotten_PIR_L);
	};
	if(Npc_HasItems(other,ITAR_PIR_M_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, " Give Pirate Medium Armor " ,DIA_Addon_Eremit_Klamotten_PIR_M);
	};
	if(Npc_HasItems(other,ITAR_PIR_H_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, " Give Pirate Captain Armor " ,DIA_Addon_Eremit_Klamotten_PIR_H);
	};
	if(Npc_HasItems(other,ITAR_RANGER_Addon) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, " Give Water Ring Mail " ,DIA_Addon_Eremit_Klamotten_Ranger);
	};
	if(Npc_HasItems(other,ITAR_Vlk_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, " Give Light Citizen Clothing " ,DIA_Addon_Eremit_Klamotten_VLK_L);
	};
	if(Npc_HasItems(other,ITAR_Vlk_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, " Give Citizen Clothes " ,DIA_Addon_Eremit_Klamotten_VLK_M);
	};
	if(Npc_HasItems(other,ITAR_Vlk_H) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, " Give luxurious clothes to a citizen " ,DIA_Addon_Eremit_Klamotten_VLK_H);
	};
	if(Npc_HasItems(other,ITAR_Bau_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, " Give Farmer's Light Clothes " ,DIA_Addon_Eremit_Klamotten_BAU_L);
	};
	if(Npc_HasItems(other,ITAR_Bau_M) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, " Give Peasant Clothes " ,DIA_Addon_Eremit_Klamotten_BAU_M);
	};
	if(Npc_HasItems(other,ITAR_DJG_Crawler) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, " Give Crawler Shell Armor " ,DIA_Addon_Eremit_Klamotten_DJG_Crawler);
	};
	if(Npc_HasItems(other,ITAR_Leather_L) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, " Give Leather Armor " ,DIA_Addon_Eremit_Klamotten_Leather);
	};
	if(Npc_HasItems(other,ITAR_Prisoner) > 0)
	{
		Info_AddChoice(DIA_Addon_Eremit_Klamotten, " Give Prospector Pants " ,DIA_Addon_Eremit_Klamotten_Prisoner);
	};
};

func void B_Hermit_fact()
{
	AI_EquipBestArmor(self);
	AI_Output(self,other,"DIA_Addon_Eremit_Add_04_20");	//Подходит!
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_21 " );	// Well, well, how can I pay you? I gave all the gold to the pirates because they brought me here.
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_22 " );	// All I can give you is these old stone tablets.
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_23 " );	// Take it! I'll look for new ones.
	B_GiveInvItems(self,other,ItWr_StonePlateCommon_Addon,2);
	MIS_Hermit_Clothes = LOG_SUCCESS ;

	if(MIS_LanceChange == LOG_Success)
	{
		AI_Output(self,other, " DIA_Addon_Eremit_Add_Done_01_01 " );	// Well, now you can go to the magicians!
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(NONE_ADDON_115_Eremit,"WaterMage");
	}
	else
	{
		Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
	};
};

func void DIA_Addon_Eremit_Klamotten_BACK()
{
	AI_Output(self,other, " DIA_Addon_Eremit_Add_04_24 " );	// Well... At first you gave me hope, and then... (sighs)
	Info_ClearChoices(DIA_Addon_Eremit_Klamotten);
};

func void DIA_Addon_Eremit_Klamotten_PIR_L()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_PIR_L_Addon,1);
	B_Hermit_fact();
};

func void DIA_Addon_Eremit_Klamotten_PIR_M()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ITAR_PIR_M_Addon,1);
	B_Hermit_fact();
};

func void DIA_Addon_Eremit_Klamotten_PIR_H()
{
	B_GivePlayerXP(250);
	B_GiveInvItems(other,self,ITAR_PIR_H_Addon,1);
	B_Hermit_fact();
};

func void DIA_Addon_Eremit_Klamotten_Ranger()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_RANGER_Addon,1);
	B_Hermit_fact();
};

func void DIA_Addon_Eremit_Klamotten_VLK_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Vlk_L,1);
	B_Hermit_fact();
};

func void DIA_Addon_Eremit_Klamotten_VLK_M()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_Vlk_M,1);
	B_Hermit_fact();
};

func void DIA_Addon_Eremit_Klamotten_VLK_H()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ITAR_Vlk_H,1);
	B_Hermit_fact();
};

func void DIA_Addon_Eremit_Klamotten_BAU_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Bau_L,1);
	B_Hermit_fact();
};

func void DIA_Addon_Eremit_Klamotten_BAU_M()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_Bau_M,1);
	B_Hermit_fact();
};

func void DIA_Addon_Eremit_Klamotten_DJG_Crawler()
{
	B_GivePlayerXP(500);
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	B_Hermit_fact();
};

func void DIA_Addon_Eremit_Klamotten_Leather()
{
	B_GivePlayerXP(150);
	B_GiveInvItems(other,self,ITAR_Leather_L,1);
	B_Hermit_fact();
};

func void DIA_Addon_Eremit_Klamotten_Prisoner()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ITAR_Prisoner,1);
	B_Hermit_fact();
};

instance DIA_Addon_Eremit_PERM(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 99;
	condition = DIA_Addon_Eremit_PERM_Condition;
	information = DIA_Addon_Eremit_PERM_Info;
	permanent = TRUE;
	description = " How do you live here? " ;
};

func int DIA_Addon_Eremit_PERM_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_Eremit_Hello) == TRUE) && ((MIS_LanceChange != LOG_Success) || (MIS_Eremit_Klamotten != LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_PERM_Info()
{
	AI_Output(other,self, " DIA_Addon_Eremit_Add_15_04 " );	// How do you live here?

	if (MIS_Eremit_Klamotten ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Eremit_Add_04_09 " );	// (proudly) I did everything myself. House, weapons, tools - everything.
		AI_Output(self,other, " DIA_Addon_Eremit_Add_04_10 " );	// The only thing I brought with me was a good mood...
		AI_Output(self,other, " DIA_Addon_Eremit_Add_04_11 " );	// Sometimes, really...
		AI_Output(other,self,"DIA_Addon_Eremit_Doppelt_15_01");	//Да?
		AI_Output(self,other, " DIA_Addon_Eremit_Add_04_12 " );	// Sometimes I wish I had taken my clothes with me.
		AI_Output(self,other, " DIA_Addon_Eremit_Add_04_13 " );	// I can't sew or tan leather...
		AI_Output(self,other, " DIA_Addon_Eremit_Add_04_14 " );	// And it gets quite cold at night in this part of the island.
		MIS_Hermit_Clothes = LOG_Running;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Eremit_Add_04_15 " );	// While I manage...

		if (MIS_Eremit_Klamotten ==  LOG_SUCCESS )
		{
			AI_Output(self,other, " DIA_Addon_Eremit_Add_04_18 " );	// But it will be quite difficult for me to survive the winter without clothes...
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Eremit_Add_04_16 " );	// Okay, it's still better here than in the city!
			AI_Output(self,other, " DIA_Addon_Eremit_Add_04_17 " );	// Even without clothes.
		};
	};
};

instance DIA_Addon_Eremit_LanceChange(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 99;
	condition = DIA_Addon_Eremit_LanceChange_Condition;
	information = DIA_Addon_Eremit_LanceChange_Info;
	permanent = FALSE;
	description = " What do you think about Waterbenders? " ;
};

func int DIA_Addon_Eremit_LanceChange_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Eremit_Hello ) && ( MY_LanceChange == LOG_Running )) .
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_LanceChange_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Addon_Eremit_LanceChange_01_01 " );	// How do you feel about Waterbenders?
	AI_Output(self,other, " DIA_Addon_Eremit_LanceChange_01_02 " );	// To the Waterbenders? They are probably the only ones I would be glad to see in this part of the island.
	AI_Output(other,self, " DIA_Addon_Eremit_LanceChange_01_03 " );	// Even so? And with what it is connected?
	AI_Output(self,other, " DIA_Addon_Eremit_LanceChange_01_04 " );	// You'll be surprised, but I myself tried to become a Waterbender a long time ago.
	AI_Output(other,self, " DIA_Addon_Eremit_LanceChange_01_05 " );	// Are you serious?
	AI_Output(self,other, " DIA_Addon_Eremit_LanceChange_01_06 " );	// Absolutely! (offended) Or do you not believe me?
	AI_Output(other,self, " DIA_Addon_Eremit_LanceChange_01_07 " );	// No, why, I believe. And what stopped you from becoming a magician?
	AI_Output(self,other, " DIA_Addon_Eremit_LanceChange_01_08 " );	// Unfortunately, my magical ability was not high enough even to use normal spells.
	AI_Output(self,other, " DIA_Addon_Eremit_LanceChange_01_09 " );	// That's why I decided to leave this idea. By the way, why are you suddenly talking about them?
	AI_Output(other,self, " DIA_Addon_Eremit_LanceChange_01_10 " );	// The thing is, Waterbenders are here too.
	AI_Output(self,other,"DIA_Addon_Eremit_LanceChange_01_11");	//Правда?!
	AI_Output(other,self, " DIA_Addon_Eremit_LanceChange_01_12 " );	// Yes. Their mission is located in the large ancient ruins that are in the center of this valley.
	AI_Output(self,other, " DIA_Addon_Eremit_LanceChange_01_13 " );	// I know where it is. And what did the venerable magicians need in this abandoned part of the island?
	AI_Output(other,self, " DIA_Addon_Eremit_LanceChange_01_14 " );	// They study the culture of the Builders. And besides, they are looking for people who could help them with this.
	AI_Output(self,other, " DIA_Addon_Eremit_LanceChange_01_15 " );	// I have been living here for a long time, and I learned a lot about this ancient culture.
	AI_Output(other,self, " DIA_Addon_Eremit_LanceChange_01_16 " );	// I wonder where?
	AI_Output(self,other, " DIA_Addon_Eremit_LanceChange_01_17 " );	// From the stone tablets that are scattered here throughout the valley.
	AI_Output(other,self, " DIA_Addon_Eremit_LanceChange_01_18 " );	// So, do you still know how to read the ancient tablets?
	AI_Output(self,other, " DIA_Addon_Eremit_LanceChange_01_19 " );	// Yes! It is quite easy if you understand the symbols that are depicted on them.
	AI_Output(other,self, " DIA_Addon_Eremit_LanceChange_01_20 " );	// Then, it seems to me that the Waterbenders will need your knowledge.
	AI_Output(self,other, " DIA_Addon_Eremit_LanceChange_01_21 " );	// Do you think so?
	AI_Output(other,self, " DIA_Addon_Eremit_LanceChange_01_22 " );	// Sure. Would you like to join their mission?
	AI_Output(self,other, " DIA_Addon_Eremit_LanceChange_01_23 " );	// Well, if the magicians themselves don't mind my society, then... Why not.
	AI_Output(other,self, " DIA_Addon_Eremit_LanceChange_01_24 " );	// Then I'll talk to them and tell them about you.
	EremitAgreed = TRUE;
	B_LogEntry(TOPIC_LanceChange, " The hermit Hermit, who lives in the depths of the island, will do well to become the new helper of the Waterbenders. We need to tell Saturas about him. " );
};

instance DIA_Addon_Eremit_LanceChange_Done(C_Info)
{
	npc = NONE_ADDON_115_Eremit;
	nr = 99;
	condition = DIA_Addon_Eremit_LanceChange_Done_Condition;
	information = DIA_Addon_Eremit_LanceChange_Done_Info;
	permanent = FALSE;
	description = " Water Mages welcome you with pleasure. " ;
};

func int DIA_Addon_Eremit_LanceChange_Done_Condition()
{
	if(MIS_LanceChange == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_Addon_Eremit_LanceChange_Done_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Addon_Eremit_LanceChange_Done_01_01 " );	// The Waterbenders will gladly welcome you.
	AI_Output(self,other, " DIA_Addon_Eremit_LanceChange_Done_01_02 " );	// Then maybe you shouldn't make them wait.


	if (MIS_Eremit_Klamotten !=  LOG_SUCCESS )
	{
		AI_Output(self,other, " DIA_Addon_Eremit_LanceChange_Done_01_03 " );	// But I can't appear completely naked in front of them!
		AI_Output(self,other, " DIA_Addon_Eremit_LanceChange_Done_01_04 " );	// I need to somehow solve this problem.
	}
	else
	{
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(NONE_ADDON_115_Eremit,"WaterMage");
	};
};
