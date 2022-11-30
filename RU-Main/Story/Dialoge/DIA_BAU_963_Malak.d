
instance DIA_Malak_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_EXIT_Condition;
	information = DIA_Malak_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Malak_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Malak_HALLO (C_Info)
{
	npc = BAU_963_Malak;
	nr = 3;
	condition = DIA_Malak_HALLO_Condition;
	information = DIA_Malak_HALLO_Info;
	description = " Is everything okay? " ;
};


func int DIA_Malak_HALLO_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Malak_HELLO_Info()
{
	AI_Output(other,self, " DIA_Malak_HALLO_15_00 " );	// Is everything okay?
	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Malak_HALLO_08_01 " );	// Another day laborer who doesn't know what to do? No problem. Talk to our farmer Bengar.
	}
	else
	{
		AI_Output(self,other, " DIA_Malak_HALLO_08_02 " );	// Of course.
	};
};


instance DIA_Malak_WASMACHSTDU (C_Info)
{
	npc = BAU_963_Malak;
	nr = 4;
	condition = DIA_Malak_WASMACHSTDU_Condition;
	information = DIA_Malak_WASMACHSTDU_Info;
	description = " What are you doing here? " ;
};


func int DIA_Malak_WASMACHSTDU_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Malak_HELLO ) && ( Capital <  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Malak_WASMACHSTDU_Info()
{
	AI_Output(other,self, " DIA_Malak_WASMACHSTDU_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Malak_WASMACHSTDU_08_01 " );	// I tend sheep. It's not that hard work.
	AI_Output(self,other, " DIA_Malak_WASMACHSTDU_08_02 " );	// But sometimes you have to be very careful. Especially if you're approaching the Passage.
};


instance DIA_Malak_PASS(C_Info)
{
	npc = BAU_963_Malak;
	nr = 5;
	condition = DIA_Malak_PASS_Condition;
	information = DIA_Malak_PASS_Info;
	description = " What do you know about the passage? " ;
};


func int DIA_Malak_PASS_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Malak_WASMACHSTDU ) && ( Capital <  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Malak_PASS_Info()
{
	AI_Output(other,self, " DIA_Malak_PASS_15_00 " );	// What do you know about the passage?
	AI_Output(self,other, " DIA_Malak_PASS_08_01 " );	// Not much! Only that it leads to the old Valley of Mines, which was surrounded by the Barrier a few weeks ago.
	AI_Output(self,other, " DIA_Malak_PASS_08_02 " );	// And then the only thing we farmers had to fear was the monthly caravan delivering various cargoes to the Valley of Mines.
	AI_Output(self,other, " DIA_Malak_PASS_08_03 " );	// These thugs made our lives very difficult.
};


DIA_Malak_WOPASS (C_Info) instances
{
	npc = BAU_963_Malak;
	nr = 6;
	condition = DIA_Malak_WOPASS_Condition;
	information = DIA_Malak_WOPASS_Info;
	description = " Where can I find a passage to the old Valley of Mines? " ;
};


func int DIA_Malak_WOPASS_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Malak_HELLO ) && ( Capital <  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Malak_WOPASS_Info()
{
	AI_Output(other,self, " DIA_Malak_WOPASS_15_00 " );	// Where can I find a passage to the old Valley of Mines?
	AI_Output(self,other, " DIA_Malak_WOPASS_08_01 " );	// Near two waterfalls on the other side of this pasture.
};


instance DIA_Malak_MINENTAL(C_Info)
{
	npc = BAU_963_Malak;
	nr = 7;
	condition = DIA_Malak_MINENTAL_Condition;
	information = DIA_Malak_MINENTAL_Info;
	description = " What do they say about the Valley of Mines? " ;
};


func int DIA_Malak_MINENTAL_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Malak_PASS ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Malak_MINENTAL_Info()
{
	AI_Output(other,self, " DIA_Malak_MINENTAL_15_00 " );	// What do they say about the Valley of Mines?
	AI_Output(self,other, " DIA_Malak_MINENTAL_08_01 " );	// Miscellaneous. Some say they heard screams at night, others saw a strange light over the mountains.
	AI_Output(self,other, " DIA_Malak_MINENTAL_08_02 " );	// But I think it's all empty gossip.
};


instance DIA_Malak_WARSTDUSCHONDA (C_Info)
{
	npc = BAU_963_Malak;
	nr = 8;
	condition = DIA_Malak_WARSTDUSCHONDA_Condition;
	information = DIA_Malak_WARSTDUSCHONDA_Info;
	description = " Have you been to the Valley of Mines? " ;
};


func int DIA_Malak_WARSTDUSCHONDA_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Malak_PASS ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Malak_WARSTDUSCHONDA_Info()
{
	AI_Output(other,self, " DIA_Malak_WARSTDUSCHONDA_15_00 " );	// Have you been to the Valley of Mines?
	AI_Output(self,other, " DIA_Malak_WARSTDUSCHONDA_08_01 " );	// No. But sometimes I tend sheep near the Pass. And I always see two paladins standing guard there.
	AI_Output(self,other, " DIA_Malak_WARSTDUSCHONDA_08_02 " );	// Looks like they're there to keep anyone out of the valley.
	AI_Output(self,other, " DIA_Malak_WARSTDUSCHONDA_08_03 " );	// The Valley of Mines used to be a natural prison. Once you got there, you could never get back.
};


instance DIA_Malak_PALADINE(C_Info)
{
	npc = BAU_963_Malak;
	nr = 9;
	condition = DIA_Malak_PALADINE_Condition;
	information = DIA_Malak_PALADINE_Info;
	description = " Tell me about paladins. " ;
};


func int DIA_Malak_PALADINE_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Malak_WARSTDUSCHONDA ) && Npc_KnowsInfo ( other , DIA_Malak_MINENTAL ) && ( Capital <  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Malak_PALADINE_Info()
{
	AI_Output(other,self, " DIA_Malak_PALADINE_15_00 " );	// Tell me about these paladins. How long have they been here?
	AI_Output(self,other, " DIA_Malak_PALADINE_08_01 " );	// A week or two, I think. I do not remember exactly.
	AI_Output(self,other, " DIA_Malak_PALADINE_08_02 " );	// Not so long ago, there was even a whole squad of paladins here. They went through the aisle! Since then I have not seen them again.
};


instances DIA_Malak_KEINEFRAUEN (C_Info)
{
	npc = BAU_963_Malak;
	nr = 10;
	condition = DIA_Malak_KEINEFRAUEN_Condition;
	information = DIA_Malak_KEINEFRAUEN_Info;
	description = " I don't see women here. " ;
};


func int DIA_Malak_KEINEFRAUEN_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Malak_WASMACHSTDU ) && ( Capital <  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Malak_KEINEFRAUEN_Info()
{
	AI_Output(other,self, " DIA_Malak_KEINEFRAUEN_15_00 " );	// I don't see women here.
	AI_Output(self,other, " DIA_Malak_KEINEFRAUEN_08_01 " );	// You're right. It's a men's farm, so to speak. And it's even better, I think.
};


instance DIA_Malak_PERMKAP1 (C_Info)
{
	npc = BAU_963_Malak;
	nr = 11;
	condition = DIA_Malak_PERMKAP1_Condition;
	information = DIA_Malak_PERMKAP1_Info;
	permanent = TRUE;
	description = " Look, don't overwork yourself. " ;
};


func int DIA_Malak_PERMKAP1_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Malak_HALLO) && Npc_KnowsInfo(other,DIA_Malak_WASMACHSTDU) && Npc_KnowsInfo(other,DIA_Malak_PASS) && Npc_KnowsInfo(other,DIA_Malak_MINENTAL) && Npc_KnowsInfo(other,DIA_Malak_WARSTDUSCHONDA) && Npc_KnowsInfo(other,DIA_Malak_PALADINE) && Npc_KnowsInfo(other,DIA_Malak_KEINEFRAUEN) && (Chapter <  3 ))
	{
		return TRUE;
	};
};

func void DIA_Malak_PERMKAP1_Info()
{
	AI_Output(other,self, " DIA_Malak_PERMKAP1_15_00 " );	// Look, don't overwork yourself.
	AI_Output(self,other, " DIA_Malak_PERMKAP1_08_01 " );	// I'll try.
	AI_StopProcessInfos(self);
};


instance DIA_Malak_KAP3_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_KAP3_EXIT_Condition;
	information = DIA_Malak_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP3_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_FLEEFROMPASS (C_Info)
{
	npc = BAU_963_Malak;
	nr = 30;
	condition = DIA_Malak_FLEEFROMPASS_Condition;
	information = DIA_Malak_FLEEFROMPASS_Info;
	description = " What are you doing here? " ;
};


func int DIA_Malak_FLEEFROMPASS_Condition()
{
	if ((Chapter >=  3 ) && (DarkPathStart ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Malak_FLEEFROMPASS_Info()
{
	if((NpcObsessedByDMT_Malak == FALSE) && (hero.guild == GIL_KDF))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output(other,self, " DIA_Malak_FLEEFROMPASS_15_00 " );	// What are you doing here?
		AI_Output(self,other, " DIA_Malak_FLEEFROMPASS_08_01 " );	// I escaped Bengar's farm. I don't want to be devoured by all these creatures that are pouring in droves from the Passage.
		AI_Output(self,other, " DIA_Malak_FLEEFROMPASS_08_02 " );	// You can't imagine the horrors that have come out of there in the past few days.
		AI_Output(other,self,"DIA_Malak_FLEEFROMPASS_15_03");	//Могу.

		if(MIS_BengarsHelpingSLD == LOG_Running)
		{
			B_LogEntry(TOPIC_BengarALLEIN, " Malak hid in a fortified place to the south because he was afraid of the creatures coming to his pasture from the Passage. " );
		};

		B_GivePlayerXP(XP_FoundMalakFLEEFROMPASS);
	};
};


instance DIA_Malak_Healing (C_Info)
{
	npc = BAU_963_Malak;
	nr = 55;
	condition = DIA_Malak_Healing_Condition;
	information = DIA_Malak_Healing_Info;
	permanent = TRUE;
	description = " You need help. " ;
};


func int DIA_Malak_Healing_Condition()
{
	if ((NpcObsessedByDMT_Malak ==  TRUE ) && (DarkPathStart ==  FALSE ) && (NpcObsessedByDMT ==  FALSE ) && (hero.guild ==  GIL_KDF ) && (Chapter >=  3 )) ;
	{
		return TRUE;
	};
};


var int DIA_Malak_Healing_oneTime;

func void DIA_Malak_Healing_Info()
{
	AI_Output(other,self, " DIA_Malak_Heilung_15_00 " );	// You need help.
	if (DIA_Malak_Heilung_oneTime ==  FALSE )
	{
		AI_Output(self,other, " DIA_Malak_Heilung_08_01 " );	// (tearfully) I just want to go home. I will return to Bengar. Hope he's still alive.
		B_NpcClearObsessionByDMT(self);
		Npc_ExchangeRoutine(self,"Start");
		B_StartOtherRoutine(BAU_962_Bauer,"Start");
		B_StartOtherRoutine(BAU_964_Bauer,"Start");
		B_StartOtherRoutine(BAU_965_Bauer,"Start");
		B_StartOtherRoutine(BAU_966_Bauer,"Start");
		B_StartOtherRoutine(BAU_967_Bauer,"Start");
		B_StartOtherRoutine(BAU_968_Bauer,"Start");
		B_StartOtherRoutine(BAU_969_Bauer,"Start");
		DIA_Malak_Heilung_oneTime = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Malak_Heilung_08_02 " );	// Leave me alone, mage. I can handle.
		B_NpcClearObsessionByDMT(self);
	};
};


instances DIA_Malak_PERMCASTLE (C_Info)
{
	npc = BAU_963_Malak;
	nr = 31;
	condition = DIA_Malak_PERMCASTLE_Condition;
	information = DIA_Malak_PERMCASTLE_Info;
	permanent = TRUE;
	description = " How are you here? " ;
};


func int DIA_Malak_PERMCASTLE_Condition()
{
	if ((Npc_GetDistToWP(self, " CASTLEMINE " ) <  4000 ) && (MIS_GetMalakBack !=  LOG_SUCCESS ) && Npc_KnowsInfo(other,DIA_Malak_FLEEFROMPASS) && (NpcObsessedByDMT_Malak ==  FALSE ) && (hero.guild !=  GIL_Chapter 3 ) >= (3.KDF ) && ; )) 
	{
		return TRUE;
	};
};

func void DIA_Malak_PERMCASTLE_Info()
{
	AI_Output(other,self, " DIA_Malak_PERMCASTLE_15_00 " );	// How are you here?
	AI_Output(self,other, " DIA_Malak_PERMCASTLE_08_01 " );	// I only have to deal with bandits here. It's still the lesser evil.
};

var int MalakHelpFT;

instance DIA_Malak_BACKTOBENGAR (C_Info)
{
	npc = BAU_963_Malak;
	nr = 31;
	condition = DIA_Malak_BACKTOBENGAR_Condition;
	information = DIA_Malak_BACKTOBENGAR_Info;
	permanent = TRUE;
	description = " Bengar needs you! " ;
};

func int DIA_Malak_BACKTOBENGAR_Condition()
{
	if ((MIS_GetMalakBack == LOG_Running) && Npc_KnowsInfo(other,DIA_Malak_FLEEFROMPASS) && (Npc_IsDead(Bengar) ==  FALSE ) && (NpcObsessedByDMT_Malak ==  FALSE ) && (hero.guild !=  GIL_KDF ) && (Capital >=  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Malak_BACKTOBENGAR_Info()
{
	AI_Output(other,self, " DIA_Malak_BACKTOBENGAR_15_00 " );	// Bengar needs you! He wants you back to his farm.
	AI_Output(self,other, " DIA_Malak_BACKTOBENGAR_08_01 " );	// I'm not crazy. As long as the farm is defenseless, I will not leave this place!

	if((MIS_BengarsHelpingSLD == LOG_Running) && (MalakHelpFT == FALSE))
	{
		B_LogEntry(TOPIC_BengarALLEIN, " Malak will not return to Bengar's farm until it is well protected. " );
		MalakHelpFT = TRUE ;
	};
	if(MIS_BengarsHelpingSLD == LOG_SUCCESS)
	{
		AI_Output(other,self, " DIA_Malak_BACKTOBENGAR_15_02 " );	// I hired a mercenary. He will look after your farm.
		AI_Output(self,other, " DIA_Malak_BACKTOBENGAR_08_03 " );	// Well, that's another matter, of course. But wait a minute. Who will pay this guy?
		AI_Output(other,self, " DIA_Malak_BACKTOBENGAR_15_04 " );	// This is my problem.
		AI_Output(self,other, " DIA_Malak_BACKTOBENGAR_08_05 " );	// Can you tell me, huh?
		Info_AddChoice(DIA_Early_BACKTOBENGAR, " Нет. " ,DIA_Early_BACKTOBENGAR_los);
	};
};

func void DIA_Malak_BACKTOBENGAR_los()
{
	AI_Output(other,self,"DIA_Malak_BACKTOBENGAR_los_15_00");	//Нет.
	AI_Output(self,other, " DIA_Malak_BACKTOBENGAR_los_08_01 " );	// Good! Then I return. I hope this guy knows his stuff.
	MIS_GetMalakBack = LOG_SUCCESS;
	B_GivePlayerXP(XP_Malak_BACKTOBENGAR);
	B_NpcClearObsessionByDMT(self);
	Npc_ExchangeRoutine(self,"Start");
	B_StartOtherRoutine(BAU_962_Bauer,"Start");
	B_StartOtherRoutine(BAU_964_Bauer,"Start");
	B_StartOtherRoutine(BAU_965_Bauer,"Start");
	B_StartOtherRoutine(BAU_966_Bauer,"Start");
	B_StartOtherRoutine(BAU_967_Bauer,"Start");
	B_StartOtherRoutine(BAU_968_Bauer,"Start");
	B_StartOtherRoutine(BAU_969_Bauer,"Start");
};

instances of DIA_Malak_BACK (C_Info)
{
	npc = BAU_963_Malak;
	nr = 32;
	condition = DIA_Malak_BACK_Condition;
	information = DIA_Malak_BACK_Info;
	permanent = TRUE;
	description = " Will you stay at Bengar's farm now? " ;
};


func int DIA_Malak_BACK_Condition()
{
	if ((MIS_GetMalakBack ==  LOG_SUCCESS ) && (NpcObsessedByDMT_Malak ==  FALSE ) && (hero.guild !=  GIL_KDF ) && (Chapter >=  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Malak_BACK_Info()
{
	AI_Output(other,self, " DIA_Malak_BACK_15_00 " );	// Will you stay at Bengar's farm now?
	AI_Output(self,other, " DIA_Malak_BACK_08_01 " );	// Of course. I got hope. We'll manage somehow.
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_KAP4_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_KAP4_EXIT_Condition;
	information = DIA_Malak_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP4_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_KAP5_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_KAP5_EXIT_Condition;
	information = DIA_Malak_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_KAP6_EXIT(C_Info)
{
	npc = BAU_963_Malak;
	nr = 999;
	condition = DIA_Malak_KAP6_EXIT_Condition;
	information = DIA_Malak_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Malak_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Malak_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Malak_PICKPOCKET(C_Info)
{
	npc = BAU_963_Malak;
	nr = 900;
	condition = DIA_Malak_PICKPOCKET_Condition;
	information = DIA_Malak_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Malak_PICKPOCKET_Condition()
{
	return  C_Robbery ( 43 , 40 );
};

func void DIA_Malak_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Malak_PICKPOCKET);
	Info_AddChoice(DIA_Malak_PICKPOCKET,Dialog_Back,DIA_Malak_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Malak_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Malak_PICKPOCKET_DoIt);
};

func void DIA_Malak_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Malak_PICKPOCKET);
};

func void DIA_Malak_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Malak_PICKPOCKET);
};
