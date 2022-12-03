

instance DIA_ORC_8524_BUMSHAK_EXIT(C_Info)
{
	npc = orc_8524_bumshak;
	condition = dia_orc_8524_bumshak_exit_condition;
	information = dia_orc_8524_bumshak_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8524_bumshak_exit_condition()
{
	return TRUE;
};

func void dia_orc_8524_bumshak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8524_BUMSHAK_HELLO(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_hello_condition;
	information = dia_orc_8524_bumshak_hello_info;
	important = FALSE;
	permanent = TRUE;
	description = " Who are you? " ;
};


func int dia_orc_8524_bumshak_hello_condition()
{
	if(FIRSTTARROK == FALSE)
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_hello_info()
{
	AI_Output(other,self,"DIA_Orc_8524_Bumshak_Hello_Info_18_01");	//Кто ты?
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Hello_Info_18_03 " );	// Help, help!!!
	AI_Output(other,self, " DIA_Orc_8524_Bumshak_Hello_Info_18_04 " );	// What happened?
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Hello_Info_18_05 " );	// Tarrok needs help. Tarrok is wounded!
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Hello_Info_18_07 " );	// Tarrok needs a strong potion. And then Tarrok die!
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Hello_Info_18_08 " );	// Tarrok had a potion, but then lose it. Tarrok not to be found...
	FIRSTTARROK = TRUE;
	self.flags = 0;
};


instance DIA_ORC_8524_BUMSHAK_HELLO_2(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_hello_2_condition;
	information = dia_orc_8524_bumshak_hello_2_info;
	important = FALSE;
	permanent = TRUE;
	description = " Are you by any chance a friend of the shaman Ur-Shak? " ;
};


func int dia_orc_8524_bumshak_hello_2_condition()
{
	if (( FIRSTROCK  ==  TRUE ) && ( SECONDROCK  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_hello_2_info()
{
	AI_Output(other,self, " DIA_Orc_8524_Bumshak_Hello_2_Info_18_01 " );	// Are you by any chance a friend of the shaman Ur-Shak?
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Hello_2_Info_18_02 " );	// Tarrok think so. Tarrok to know Ur-Shak - to be once a great shaman... Tarrok to respect Ur-Shak!
	AI_Output(other,self, " DIA_Orc_8524_Bumshak_Hello_2_Info_18_03 " );	// Your friend told me what you can do for me Ulu-Mulu...
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Hello_2_Info_18_04 " );	// Stranger help Tarrok - Tarrok help the stranger.
	AI_Output(other, self, " DIA_Orc_8524_Bumshak_Hello_2_Info_18_04А " );	// How can I help you?
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Hello_2_Info_18_05 " );	// Tarrok is very weak, no potion! Tarrok die.
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Hello_2_Info_18_06 " );	// Stranger bring the potion, and Tarrok help.
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Hello_2_Info_18_07 " );	// Tarrok do Ulu-Mulu.
	AI_Output(other,self, " DIA_Orc_8524_Bumshak_Hello_2_Info_18_08 " );	// I'll find your cures!
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Hello_2_Info_18_09 " );	// Tarrok is very weak. Stranger quickly, otherwise Tarrok will die.
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
	Log_CreateTopic(TOPIC_TARROKWOUND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TARROKWOUND,LOG_Running);
	MEETTARROK = TRUE;
	TARROKHEALTHY = FALSE ;
	if(URSHAK_SUCKED == FALSE)
	{
		B_LogEntry( TOPIC_TARROKWOUND , " I helped an orc fight off some skeletons that attacked him. As it turns out, this orc is the friend Ur-Shak was talking about. Tarrok was badly injured in this mess, and I should quickly find an orc potion for him for Tarrok to recover. In return, he promised to make Ulu-Mulu for me. The question remains: where should I look for this potion? Maybe Ur-Shak will help me in my search. " );
	}
	else
	{
		B_LogEntry( TOPIC_TARROKWOUND , " I helped an orc fight off some skeletons that attacked him. As it turns out, this orc is the friend Ur-Shak was talking about. Tarrok was badly injured in this mess, and I should quickly find an orc potion for him so that Tarrok will get better. In return, he promised to make Ulu-Mulu for me. The question remains: where should I look for this potion? " );
	};
};


instance DIA_ORC_8524_BUMSHAK_POTION(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_potion_condition;
	information = dia_orc_8524_bumshak_potion_info;
	important = FALSE;
	permanent = TRUE;
	description = " Here, I found you a potion. " ;
};


func int dia_orc_8524_bumshak_potion_condition()
{
	if ((Npc_HasItems(other,itpo_xorcpotion) >=  1 ) && ( TARROKHEALTHY  ==  FALSE ) && ( MEETTARROK  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_potion_info()
{
	AI_Output(other,self, " DIA_Orc_8524_Bumshak_Potion_Info_18_01 " );	// Here, I found you a potion.
	B_GiveInvItems(other,self,itpo_xorcpotion,1);
	Npc_RemoveInvItems(self,itpo_xorcpotion,1);
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Potion_Info_18_02 " );	// The stranger is not bad, like the other soldier. The stranger is good!!!
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Potion_Info_18_03 " );	// Tarrok say thank you.
	TARROKHEALTHY = TRUE;
	SEARCHULUMULU = FALSE;
	B_GivePlayerXP(200);
	Log_SetTopicStatus(TOPIC_TARROKWOUND,LOG_SUCCESS);
	B_LogEntry( TOPIC_TARROKWOUND , " I brought Tarrok an orc potion. He'll get better now. " );
};


instance DIA_ORC_8524_BUMSHAK_ULUMULU (C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_ulumulu_condition;
	information = dia_orc_8524_bumshak_ulumulu_info;
	important = FALSE;
	permanent = TRUE;
	description = " Now can you give me Ulu-Mulu? " ;
};


func int dia_orc_8524_bumshak_ulumulu_condition()
{
	if((TARROKHEALTHY == TRUE) && (SEARCHULUMULU == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_ulumulu_info()
{
	AI_Output(other,self, " DIA_Orc_8524_Bumshak_Ulumulu_Info_18_04 " );	// Now can you give me Ulu-Mulu?
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Ulumulu_Info_18_05 " );	// Stranger help Tarrok - Tarrok help the stranger.
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Ulumulu_Info_18_06 " );	// A stranger is necessary: ​​KROTAK, HOSTAG, DVAKHTKAR and ORFARTAG!
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Ulumulu_Info_18_07 " );	// Outsider bring it and Tarrok do Ulu-Mulu.
	AI_Output(other,self, " DIA_Orc_8524_Bumshak_Ulumulu_Info_18_08 " );	// What is KROTAK?!
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Ulumulu_Info_18_09 " );	// Language of fire. Be the language of the fire lizard.
	AI_Output(other,self, " DIA_Orc_8524_Bumshak_Ulumulu_Info_18_10 " );	// What does HOSTAG mean?!
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Ulumulu_Info_18_11 " );	// Horn of darkness. Sharp as a knife, hard as a rock.
	AI_Output(other,self, " DIA_Orc_8524_Bumshak_Ulumulu_Info_18_12 " );	// DOUBLE CAR?! And what is it?
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Ulumulu_Info_18_13 " );	// Tooth from a swamp. When he bite - no one else run away.
	AI_Output(other,self, " DIA_Orc_8524_Bumshak_Ulumulu_Info_18_14 " );	// What is ORFARTAG?!
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Ulumulu_Info_18_15 " );	// Big troll tooth. Make a hole through.
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_Ulumulu_Info_18_16 " );	// Stranger search all. Tarrok wait here.
	SEARCHULUMULU = TRUE;
	FINDULUMULU = FALSE ;
	Log_CreateTopic(TOPIC_ULUMULUFIND,LOG_MISSION);
	Log_SetTopicStatus( TOPIC_ULUMULUFIND ,LOG_Running);
	B_LogEntry( TOPIC_ULUMULUFIND , " Tarrok will make me Ulu-Mula if I bring him KROTAK, HOSTAG, DVAKHTKAR and ORFARTAG. " );
	B_LogEntry_Quiet( TOPIC_ULUMULUFIND , " As I understood from the words of Tarrok: KROTAK is the tongue of the fire lizard, HOSTAG is the horn of the mrakoris, DVAHTKAR is the tooth of the swamp, and ORFARTAG is the fang of the troll. " );
	B_LogEntry_Quiet( TOPIC_ULUMULUFIND , " It remains to collect all these items and bring them to Tarrok. " );
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
};


instance DIA_ORC_8524_BUMSHAK_FINDULUMULU(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_findulumulu_condition;
	information = dia_orc_8524_bumshak_findulumulu_info;
	important = FALSE;
	permanent = TRUE;
	description = " I brought what you requested for Ulu Mulu. " ;
};


func int dia_orc_8524_bumshak_findulumulu_condition()
{
	if((Npc_HasItems(other,ItAt_WaranFiretongue) >= 1) && (Npc_HasItems(other,ItAt_ShadowHorn) >= 1) && (Npc_HasItems(other,ItAt_SharkTeeth) >= 1) && (Npc_HasItems(other,ItAt_TrollTooth) >= 1) && (FINDULUMULU == FALSE) && (SEARCHULUMULU == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_findulumulu_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_01 " );	// Now I have everything I need for Ulu-Mulu.
	b_giveinvitemsmanythings(other,self);
	Npc_RemoveInvItems(other,ItAt_WaranFiretongue,1);
	Npc_RemoveInvItems(other,ItAt_ShadowHorn,1);
	Npc_RemoveInvItems(other,ItAt_SharkTeeth,1);
	Npc_RemoveInvItems(other,ItAt_TrollTooth,1);
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_02 " );	// (admiringly) The stranger is a strong soldier! Give me things - Tarrok do Ulu-Mulu.
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_03 " );	// Here. Stranger to carry Ulu-Mulu and be proud. Tarrok now sleep.
	B_GiveInvItems(self,other,itmw_2h_orcprestige,1);
	AI_Output(other,self, " DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_04 " );	// Thanks, now I have to leave.
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_FindUlumulu_Info_18_05 " );	// Good road, stranger.
	FINDULUMULU = TRUE;
	URSHAKKNOWULUMULU = FALSE ;
	Log_SetTopicStatus(TOPIC_ULUMULUFIND,LOG_SUCCESS);
	B_LogEntry( TOPIC_ULUMULUFIND , " I brought Tharrok everything he needed and he made me Ulu-Mulu. Now I can go to the orc city and try to ask them how to open the portcullis at the entrance to the Temple of the Sleeper. " );
};


instance DIA_ORC_8524_BUMSHAK_AFTER(C_Info)
{
	npc = orc_8524_bumshak;
	nr = 1;
	condition = dia_orc_8524_bumshak_after_condition;
	information = dia_orc_8524_bumshak_after_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_orc_8524_bumshak_after_condition()
{
	if((FINDULUMULU == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_orc_8524_bumshak_after_info()
{
	AI_Output(self,other, " DIA_Orc_8524_Bumshak_After_Info_18_00 " );	// Stranger to go some more.
	AI_StopProcessInfos(self);
	FINDULUMULU = TRUE;
};

