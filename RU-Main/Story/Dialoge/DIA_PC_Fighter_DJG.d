

instance DIA_GornDJG_EXIT(C_Info)
{
	npc = PC_Fighter_DJG;
	nr = 999;
	condition = DIA_GornDJG_EXIT_Condition;
	information = DIA_GornDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_GornDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_GornDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GornDJG_STARTCAMP(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_STARTCAMP_Condition;
	information = DIA_GornDJG_STARTCAMP_Info;
	description = " I see you've joined the dragon hunters. " ;
};


func int DIA_GornDJG_STARTCAMP_Condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_STARTCAMP_01") < 1000)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_STARTCAMP_Info()
{
	AI_Output(other,self, " DIA_GornDJG_STARTCAMP_15_00 " );	// I see you've joined the dragon hunters.
	AI_Output(self,other, " DIA_GornDJG_STARTCAMP_12_01 " );	// I followed Silvio to the Valley of Mines because I know this area like the back of my hand and I wanted to understand for myself what was going on here.
	AI_Output(self,other, " DIA_GornDJG_STARTCAMP_12_02 " );	// I'll tell you this. There is definitely something wrong here. I have never seen so many orcs in one place in my life.
	AI_Output(self,other, " DIA_GornDJG_STARTCAMP_12_03 " );	// I wouldn't be surprised if Garond and the paladins from the castle fled a long time ago or if they've all been killed already.
	Info_AddChoice(DIA_GornDJG_STARTCAMP, " See you later. " ,DIA_GornDJG_STARTCAMP_By);
	Info_AddChoice(DIA_GornDJG_STARTCAMP, " What are you planning to do next? " ,DIA_GornDJG_STARTCAMP_Wohin);
};

func void DIA_GornDJG_STARTCAMP_Wohin()
{
	AI_Output(other,self, " DIA_GornDJG_STARTCAMP_Wohin_15_00 " );	// What are you planning to do next?
	AI_Output(self,other, " DIA_GornDJG_STARTCAMP_Wohin_12_01 " );	// I'll go with the guys to the Valley of Mines first, and then I'll go.
	AI_Output(self,other, " DIA_GornDJG_STARTCAMP_Wohin_12_02 " );	// I just really want to find out what the orks are planning.
};

func void DIA_GornDJG_STARTCAMP_By()
{
	AI_Output(other,self, " DIA_GornDJG_STARTCAMP_By_15_00 " );	// See you later.
	AI_Output(self,other, " DIA_GornDJG_STARTCAMP_By_12_01 " );	// Be careful.
	AI_StopProcessInfos(self);
};


instance DIA_GornDJG_HELLO (C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_HALLO_Condition;
	information = DIA_GornDJG_HELLO_Info;
	description = " So that's where you're at! " ;
};


func int DIA_GornDJG_HALLO_Condition()
{
	if(Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1500)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_HELLO_Info()
{
	AI_Output(other,self, " DIA_GornDJG_HALLO_15_00 " );	// So that's where you've gone!
	AI_Output(self,other, " DIA_GornDJG_HALLO_12_01 " );	// You don't look particularly suicidal either.
};


instances DIA_GornDJG_WHATSUP (C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_WHATSUP_Condition;
	information = DIA_GornDJG_WHATSUP_Info;
	description = " Did you find out anything? " ;
};


func int DIA_GornDJG_WHATSUP_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_HALLO))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WHATSUP_Info()
{
	AI_Output(other,self, " DIA_GornDJG_WHATSUP_15_00 " );	// Did you figure something out?
	AI_Output(self,other, " DIA_GornDJG_WHATSUP_12_01 " );	// I'm still waiting. It seems to me that up there, in these ruins on the rock, there might be something. At night, you can see the light and hear the screams.
	Info_ClearChoices(DIA_GornDJG_WHATSUP);
	Info_AddChoice(DIA_GornDJG_WHATSUP, " Could it be Lester? " ,DIA_GornDJG_WHATSUP_Lester);
	Info_AddChoice(DIA_GornDJG_WHATSUP,"Дракон?",DIA_GornDJG_WHATSUP_A_Dragon);
	B_LogEntry(TOPIC_Dragonhunter, " The forge is at the foot of the plateau leading to the old rock fortress. From here he can watch the plateau and the orc barrier. " );
};

func void DIA_GornDJG_WHATSUP_Lester()
{
	AI_Output(other,self, " DIA_GornDJG_WHATSUP_Lester_15_00 " );	// Maybe it's Lester, who returned to his old ruins on the rock?
	AI_Output(self,other, " DIA_GornDJG_WHATSUP_Lester_12_01 " );	// Maybe. But as far as I know, Lester no longer lives there.
};

func void DIA_GornDJG_WHATSUP_A_Dragon()
{
	AI_Output(other,self,"DIA_GornDJG_WHATSUP_A_Dragon_15_00");	//Дракон?
	AI_Output(self,other, " DIA_GornDJG_WHATSUP_A_Dragon_12_01 " );	// Very likely. The plateau that is there is better guarded than the royal treasury. Oh, and this is the only way to the fortress.
	AI_Output(self,other, " DIA_GornDJG_WHATSUP_A_Dragon_12_02 " );	// As if one dragon isn't enough. But they seem to surround themselves with a retinue of monsters.
	GornDJG_WhatMonsters = TRUE;
	B_LogEntry(TOPIC_Dragonhunter, " According to information from Gorn, there is a dragon in the old rock fort. " );
	Info_ClearChoices(DIA_GornDJG_WHATSUP);
};


instance DIA_GornDJG_WHATMONSTERS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_WHATMONSTERS_Condition;
	information = DIA_GornDJG_WHATMONSTERS_Info;
	description = " What are these monsters? " ;
};


func int DIA_GornDJG_WHATMONSTERS_Condition()
{
	if(GornDJG_WhatMonsters == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WHATMONSTERS_Info()
{
	AI_Output(other,self, " DIA_GornDJG_WHATMONSTERS_15_00 " );	// What are these monsters?
	AI_Output(self,other, " DIA_GornDJG_WHATMONSTERS_12_01 " );	// I couldn't get a good look at them, but they walk on two legs and have scaly skin. They scour the rocks like snappers smelling their prey.
	AI_Output(self,other, " DIA_GornDJG_WHATMONSTERS_12_02 " );	// I can hear them well down here, how they sniff and snort down there. It seems to me that they occupied the entire plateau there.
};


instance DIA_GornDJG_WAHTABOUTORCS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_WAHTABOUTORCS_Condition;
	information = DIA_GornDJG_WAHTABOUTORCS_Info;
	description = " What about orcs? " ;
};


func int DIA_GornDJG_WAHTABOUTORCS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_HALLO))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_WAHTABOUTORCS_Info()
{
	AI_Output(other,self, " DIA_GornDJG_WAHTABOUTORCS_15_00 " );	// What about orcs?
	AI_Output(self,other, " DIA_GornDJG_WAHTABOUTORCS_12_01 " );	// I watched them for a bit. The barricade they've built there must be hiding something. I suspect that there may simply be hordes of orcs behind her.
	if(HEROKNOWFORESTBASE == TRUE)
	{
		AI_Output(other,self, " DIA_GornDJG_WAHTABOUTORCS_15_05 " );	// Relax, I was there and they are definitely not there.
		AI_Output(self,other, " DIA_GornDJG_WAHTABOUTORCS_12_06 " );	// Come on, if they're not there yet, they will definitely be there.
	}
	else
	{
		AI_Output(other,self, " DIA_GornDJG_WAHTABOUTORCS_15_02 " );	// Do you think there's MORE than already?
	};
	AI_Output(self,other, " DIA_GornDJG_WAHTABOUTORCS_12_03 " );	// I wouldn't be surprised if one evening they took down their stockade and dammed up the whole valley. I don't like it all!
	AI_Output(self,other, " DIA_GornDJG_WAHTABOUTORCS_12_04 " );	// If this happens, I'll need to go back and warn Lee. He still wants to get off this island. And then it will no longer be possible to delay.
};


instance DIA_GornDJG_HELPKILLDRACONIANS(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_HELPKILLDRACONIANS_Condition;
	information = DIA_GornDJG_HELPKILLDRACONIANS_Info;
	description = " Will you help me break into this fortress? " ;
};


func int DIA_GornDJG_HELPKILLDRACONIANS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_WHATMONSTERS) && Npc_KnowsInfo(other,DIA_GornDJG_WAHTABOUTORCS) && (Npc_IsDead(RockDragon) == FALSE))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_HELPKILLDRACONIANS_Info()
{
	AI_Output(other,self, " DIA_GornDJG_HELPKILLDRACONIANS_15_00 " );	// Will you help me break into this fortress?
	AI_Output(self,other, " DIA_GornDJG_HELPKILLDRACONIANS_12_01 " );	// I don't even know. I'm afraid the orcs will, as luck would have it, launch an attack as soon as I turn my back.
	AI_Output(other,self, " DIA_GornDJG_HELPKILLDRACONIANS_15_02 " );	// This is paranoia!
	AI_Output(self,other, " DIA_GornDJG_HELPKILLDRACONIANS_12_03 " );	// Can't help. I'll never forgive myself if I'm late, you know? But on the other side...
	AI_Output(self,other, " DIA_GornDJG_HELPKILLDRACONIANS_12_04 " );	// Okay! Why am I even here then? Let's go to this plateau and make our way to the fortress.
	AI_Output(self,other, " DIA_GornDJG_HELPKILLDRACONIANS_12_05 " );	// A little warm-up never hurts. Besides, I want to get a closer look at the monsters that roam there.
	AI_Output(self,other, " DIA_GornDJG_HELPKILLDRACONIANS_12_06 " );	// Let me know when you're ready!
	B_LogEntry(TOPIC_Dragonhunter, " The Gorn wants to help me get across the plateau to the rock fort. " );
};


instance DIA_GornDJG_LOSGEHTS (C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_LOSGEHTS_Condition;
	information = DIA_GornDJG_LOSGEHTS_Info;
	description = " Let's attack! " ;
};


func int DIA_GornDJG_LOSGEHTS_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_HELPKILLDRACONIANS))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_LOSGEHTS_Info()
{
	AI_Output(other,self, " DIA_GornDJG_LOSGEHTS_15_00 " );	// Let's attack!
	AI_Output(self,other, " DIA_GornDJG_LOSGEHTS_12_01 " );	// Like in the old days, huh? But I want you to know this is my fight. This time, I'll go first!
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Npc_ExchangeRoutine(self,"RunToRockRuinBridge");
};


instance DIA_GornDJG_BISHIERHIN(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_BISHIERHIN_Condition;
	information = DIA_GornDJG_BISHIERHIN_Info;
	important = TRUE;
};


func int DIA_GornDJG_BISHIERHIN_Condition()
{
	if(Npc_GetDistToWP(self,"LOCATION_19_01") < 1000)
	{
		return TRUE;
	};
};

func void DIA_GornDJG_BISHIERHIN_Info()
{
	AI_Output(self,other, " DIA_GornDJG_BISHIERHIN_12_00 " );	// That was child's play. Now, my friend, you can handle the rest on your own. Give them heat! And I'll go back and watch the orcs.
	AI_Output(other,self, " DIA_GornDJG_BISHIERHIN_15_01 " );	// No problem. See you!
	AI_Output(self,other, " DIA_GornDJG_BISHIERHIN_12_02 " );	// I hope so too!
	B_LogEntry(TOPIC_Dragonhunter, " The Gorn has returned to his outpost. He will continue to watch the orcs. " );
	B_GivePlayerXP(XP_GornDJGPlateauClear);
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_GornDJG_DRAGONDEAD(C_Info)
{
	npc = PC_Fighter_DJG;
	condition = DIA_GornDJG_DRAGONDEAD_Condition;
	information = DIA_GornDJG_DRAGONDEAD_Info;
	description = " The stone dragon is dead! " ;
};


func int DIA_GornDJG_DRAGONDEAD_Condition()
{
	if(Npc_KnowsInfo(other,DIA_GornDJG_WHATSUP) && (Npc_GetDistToWP(self,"OW_DJG_ROCKCAMP_01") < 1000) && (Npc_IsDead(RockDragon) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GornDJG_DRAGONDEAD_Info()
{
	AI_Output(other,self, " DIA_GornDJG_DRAGONDEAD_15_00 " );	// The stone dragon is dead!
	AI_Output(self,other, " DIA_GornDJG_DRAGONDEAD_12_01 " );	// I can't hear the screams anymore! Have you been to this fortress in the rocks?
	AI_Output(other,self,"DIA_GornDJG_DRAGONDEAD_15_02");	//Да!
	AI_Output(self,other, " DIA_GornDJG_DRAGONDEAD_12_03 " );	// Ha, ha! I thought so. Wherever you appear, there is no stone left unturned.
	AI_Output(other,self, " DIA_GornDJG_DRAGONDEAD_15_04 " );	// What are you going to do next?
	AI_Output(self,other, " DIA_GornDJG_DRAGONDEAD_12_05 " );	// I'll stay here a little longer, and then I'll return to Lee. Maybe we'll meet there again!
	AI_Output(self,other, " DIA_GornDJG_DRAGONDEAD_12_06 " );	// I'm already sick of these places. It's time to get off this island.
	AI_Output(other,self, " DIA_GornDJG_DRAGONDEAD_15_07 " );	// See you again!
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Fighter_DJG_PICKPOCKET(C_Info)
{
	npc = PC_Fighter_DJG;
	nr = 900;
	condition = DIA_Fighter_DJG_PICKPOCKET_Condition;
	information = DIA_Fighter_DJG_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Fighter_DJG_PICKPOCKET_Condition()
{
	return  C_Robbery ( 10 , 35 );
};

func void DIA_Fighter_DJG_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Fighter_DJG_PICKPOCKET);
	Info_AddChoice(DIA_Fighter_DJG_PICKPOCKET,Dialog_Back,DIA_Fighter_DJG_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Fighter_DJG_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Fighter_DJG_PICKPOCKET_DoIt);
};

func void DIA_Fighter_DJG_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Fighter_DJG_PICKPOCKET);
};

func void DIA_Fighter_DJG_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Fighter_DJG_PICKPOCKET);
};

