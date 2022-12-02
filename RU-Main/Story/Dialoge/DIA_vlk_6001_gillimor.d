

instance DIA_GILLIMOR_EXIT(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 999;
	condition = dia_gillimor_exit_condition;
	information = dia_gillimor_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gillimor_exit_condition()
{
	return TRUE;
};

func void dia_gillimor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GILLIMOR_HELLO(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 1;
	condition = dia_gillimor_hello_condition;
	information = dia_gillimor_hello_info;
	permanent = TRUE;
	important = FALSE;
	description = " Hello " ;
};


func int dia_gillimor_hello_condition()
{
	if(MEETGILLIMOR == FALSE)
	{
		return TRUE;
	};
};

func void dia_gillimor_hello_info()
{
	AI_Output(other,self,"DIA_Gillimor_Hello_01_01");	//Привет.
	AI_Output(self,other, " DIA_Gillimor_Hello_01_02 " );	// Greetings, outlander. It was very brave of you to come into this valley.
	AI_Output(self,other, " DIA_Gillimor_Hello_01_03 " );	// What brings you to this place?
	AI_Output(other,self, " DIA_Gillimor_Hello_01_04 " );	// I'm looking for a black dragon. I heard that he would live here.
	AI_Output(other,self, " DIA_Gillimor_Hello_01_05 " );	// Did you happen to meet him in the valley?
	AI_Output(self,other, " DIA_Gillimor_Hello_01_06 " );	// Hmm... I rarely leave the camp. And I don't know much.
	AI_Output(other,self, " DIA_Gillimor_Hello_01_07 " );	// Don't you go hunting like the other guys do?
	AI_Output(self,other, " DIA_Gillimor_Hello_01_08 " );	// No, I don't go. You see, the hunter came out of me useless.
	AI_Output(self,other, " DIA_Gillimor_Hello_01_09 " );	// If I'm leaving the camp, it's only to replenish my stock of medicinal herbs.
	AI_Output(other,self, " DIA_Gillimor_Hello_01_10 " );	// Are you good with herbs?
	AI_Output(self,other, " DIA_Gillimor_Hello_01_11 " );	// Well, more or less I understand them.
	MEETGILLIMOR = TRUE;
};


instance DIA_GILLIMOR_HELLO_TEACH(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 1;
	condition = dia_gillimor_hello_teach_condition;
	information = dia_gillimor_hello_teach_info;
	permanent = TRUE;
	important = FALSE;
	description = " I hear you're good at alchemy. " ;
};


func int dia_gillimor_hello_teach_condition()
{
	if((MEETGILLIMOR == TRUE) && (GILLIMORTEACHER == TRUE) && (GILLIMORREADYTEACH == FALSE))
	{
		return TRUE;
	};
};

func void dia_gillimor_hello_teach_info()
{
	AI_Output(other,self, " DIA_Gillimor_Hello_Teach_01_01 " );	// I hear you're good at alchemy.
	AI_Output(self,other, " DIA_Gillimor_Hello_Teach_01_02 " );	// Yes, not bad. Preparing various potions or potions is my forte.
	AI_Output(self,other, " DIA_Gillimor_Hello_Teach_01_03 " );	// Unfortunately, it's not easy to find the ingredients for some of them in these places.
	AI_Output(self,other, " DIA_Gillimor_Hello_Teach_01_04 " );	// So basically I practice making healing elixirs and essences.
	AI_Output(other,self, " DIA_Gillimor_Hello_Teach_01_05 " );	// Can you brew some of these potions for me?
	AI_Output(self,other, " DIA_Gillimor_Hello_Teach_01_06 " );	// Well, I could brew a couple of elixirs for you, as long as you bring me the right ingredients for them.
	AI_Output(self,other, " DIA_Gillimor_Hello_Teach_01_07 " );	// I could teach you how to cook them yourself, if you're interested, of course.
	AI_Output(self,other, " DIA_Gillimor_Hello_Teach_01_09 " );	// Just say if you need anything.
	GILLIMORREADYTEACH = TRUE;
};


instance DIA_GILLIMOR_BREWFORME(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 39;
	condition = dia_gillimor_brewforme_condition;
	information = dia_gillimor_brewforme_info;
	permanent = TRUE;
	description = " Cook me... " ;
};


func int dia_gillimor_brewforme_condition()
{
	if((MEETGILLIMOR == TRUE) && (GILLIMORREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_gillimor_brewforme_info()
{
	Info_ClearChoices(dia_gillimor_brewforme);
	Info_AddChoice(dia_gillimor_brewforme,Dialog_Back,dia_gillimor_brewforme_back);
	Info_AddChoice(dia_gillimor_brewforme, " ...healing extract. " ,dia_gillimor_brewforme_health);
};

func void dia_gillimor_brewforme_back()
{
	Info_ClearChoices(dia_gillimor_brewforme);
};

func void dia_gillimor_brewforme_health()
{
	AI_Output(other,self, " DIA_Gillimor_BrewForMe_Health_01_01 " );	// Prepare me an elixir of healing.
	AI_Output(self,other, " DIA_Gillimor_BrewForMe_Health_01_02 " );	// Do you have components?
	if((Npc_HasItems(other,ItPl_Health_Herb_02) >= 2) && (Npc_HasItems(other,ItPl_Temp_Herb) >= 1))
	{
		AI_Output(other,self,"DIA_Gillimor_BrewForMe_Health_01_03");	//Держи.
		B_GiveInvItems(other,self,ItPl_Health_Herb_02,2);
		B_GiveInvItems(other,self,ItPl_Temp_Herb,1);
		AI_Output(self,other, " DIA_Gillimor_BrewForMe_Health_01_04 " );	// Okay, I'll give it to you, you won't have to wait long.
		B_GiveInvItems(self,other,ItPo_Health_02,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Gillimor_BrewForMe_Health_01_05 " );	// You don't have the required components. Come back when you find them.
	};
	Info_ClearChoices(dia_gillimor_brewforme);
	Info_AddChoice(dia_gillimor_brewforme,Dialog_Back,dia_gillimor_brewforme_back);
	Info_AddChoice(dia_gillimor_brewforme, " Brew me a healing extract. " ,dia_gillimor_brewforme_health);
};


instance DIA_GILLIMOR_TEACH(C_Info)
{
	npc = vlk_6001_gillimor;
	nr = 10;
	condition = dia_gillimor_teach_condition;
	information = dia_gillimor_teach_info;
	permanent = TRUE;
	description = " Teach me how to brew potions... " ;
};


func int dia_gillimor_teach_condition()
{
	if((MEETGILLIMOR == TRUE) && (GILLIMORREADYTEACH == TRUE))
	{
		return TRUE;
	};
};

func void dia_gillimor_teach_info()
{
	AI_Output(other,self, " DIA_Gillimor_Teach_01_01 " );	// Teach me how to brew potions.
	AI_Output(self,other, " DIA_Gillimor_Teach_01_02 " );	// I will reveal to you all the secrets of alchemy.
	Info_ClearChoices(dia_gillimor_teach);
	Info_AddChoice(dia_gillimor_teach,Dialog_Back,dia_gillimor_teach_back);
	if(PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Лечебная эссенция ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_01)),dia_gillimor_teach_health_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Лечебный экстракт ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_02)),dia_gillimor_teach_health_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Лечебный эликсир",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Health_03)),dia_gillimor_teach_health_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Эликсир жизни ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Health)),dia_gillimor_teach_perm_health);
	};
	if(PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Эссенция маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_01)),dia_gillimor_teach_mana_01);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Экстракт маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_02)),dia_gillimor_teach_mana_02);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Эликсир маны ",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Mana_03)),dia_gillimor_teach_mana_03);
	};
	if((PLAYER_TALENT_ALCHEMY[POTION_Perm_Mana] == FALSE) && (PLAYER_TALENT_ALCHEMY[POTION_Mana_03] == TRUE))
	{
		Info_AddChoice(dia_gillimor_teach,b_buildlearnstringforalchemy("Эликсир духа",B_GetLearnCostTalent(other,NPC_TALENT_ALCHEMY,POTION_Perm_Mana)),dia_gillimor_teach_perm_mana);
	};
};

func void dia_gillimor_teach_back()
{
	Info_ClearChoices(dia_gillimor_teach);
};

func void dia_gillimor_teach_health_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_01);
};

func void dia_gillimor_teach_health_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_02);
};

func void dia_gillimor_teach_health_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Health_03);
};

func void dia_gillimor_teach_perm_health()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Health);
};

func void dia_gillimor_teach_mana_01()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_01);
};

func void dia_gillimor_teach_mana_02()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_02);
};

func void dia_gillimor_teach_mana_03()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Mana_03);
};

func void dia_gillimor_teach_perm_mana()
{
	B_TeachPlayerTalentAlchemy(self,other,POTION_Perm_Mana);
};

