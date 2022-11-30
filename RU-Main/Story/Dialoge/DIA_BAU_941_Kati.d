
instance DIA_Kati_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_EXIT_Condition;
	information = DIA_Inside_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Kati_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


DIA_Kati_SLDNOCHDA (C_Info) instances
{
	npc = BAU_941_Kati;
	nr = 4;
	condition = DIA_Kati_SLDNOCHDA_Condition;
	information = DIA_Kati_SLDNOCHDA_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Kati_SLDNOCHDA_Condition()
{
	if(!Npc_IsDead(Alvares) && !Npc_IsDead(Engardo) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Kati_SLDNOCHDA_Info()
{
	var int help;
	if (help ==  FALSE )
	{
		AI_Output(self,other, " DIA_Kati_SLDNOCHDA_16_00 " );	// These thugs are threatening my husband! We are ordinary citizens of Khorinis, loyal to the king, and these mercenaries want to rob us!
		help = TRUE ;
	};
	AI_Output(self,other, " DIA_Kati_SLDNOCHDA_16_01 " );	// Well, don't just stand there. Do something! Help us!
	Akils_SLDStillthere = TRUE;
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere, " Farmer Akils is threatened by mercenaries. " );
	AI_StopProcessInfos(self);
};


instances DIA_Kati_HALLO (C_Info)
{
	npc = BAU_941_Kati;
	nr = 5;
	condition = DIA_Kati_HALLO_Condition;
	information = DIA_Kati_HALLO_Info;
	permanent = FALSE;
	description = " Are you all right? " ;
};


func int DIA_Kati_HALLO_Condition()
{
	if (Npc_IsDead(Alvares) && Npc_IsDead(Engardo))
	{
		return TRUE;
	};
};

func void DIA_Kati_HALLO_Info()
{
	AI_Output(other,self, " DIA_Kati_HALLO_15_00 " );	// Are you all right?
	if (Npc_IsDead(Akil))
	{
		AI_Output(self,other, " DIA_Kati_HALLO_16_01 " );	// My beloved husband is dead!...(sobs) Oh, Innos, why are you punishing me like that?!
		Npc_ExchangeRoutine(self,"Start");
		B_StartOtherRoutine(Randolph,"Start");
		B_GivePlayerXP(XP_Akil_Tot);
	}
	else
	{
		AI_Output(self,other, " DIA_Kati_HALLO_16_02 " );	// Yes, I'm fine, thanks.
	};
};


DIA_Kati_ESSEN (C_Info) instances
{
	npc = BAU_941_Kati;
	nr = 12;
	condition = DIA_Kati_ESSEN_Condition;
	information = DIA_Kati_ESSEN_Info;
	permanent = FALSE;
	description = " Akil says you can feed me. " ;
};


func int DIA_Kati_ESSEN_Condition()
{
	if ((Not_Dead ==  TRUE ) && (Npc_IsDead(Akil) ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Kati_ESSEN_Info()
{
	AI_Output(other,self, " DIA_Kati_ESSEN_15_00 " );	// Akil says you can feed me.
	AI_Output(self,other, " DIA_Kati_ESSEN_16_01 " );	// Ever since the Barrier collapsed, times have fallen on us. Living here has become unsafe.
	AI_Output(self,other, " DIA_Kati_ESSEN_16_02 " );	// Here, have a slice of bread, some milk and a bottle of water. I'm sorry, but that's all we can share.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItFo_Bread,1);
	CreateInvItems(other,ItFo_Water,1);
	CreateInvItems(other,ItFo_Milk,1);
};


instance DIA_Kati_Baltram (C_Info)
{
	npc = BAU_941_Kati;
	nr = 4;
	condition = DIA_Kati_Baltram_Condition;
	information = DIA_Kati_Baltram_Info;
	permanent = FALSE;
	description = " Baltram sent me. " ;
};


func int DIA_Kati_Baltram_Condition()
{
	if (Npc_IsDead(Akil) && (MIS_Baltram_ScoutAkil == LOG_Running) && (Delivery_Geholt ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Kati_Baltram_Info()
{
	AI_Output(other,self, " DIA_Kati_Baltram_15_00 " );	// Baltram sent me. I have to pick up a package for him.
	AI_Output(self,other, " DIA_Kati_Baltram_16_01 " );	// Yes, of course. Here, I already packed it.
	CreateInvItems(self,ItMi_BaltramPaket,1);
	B_GiveInvItems(self,other,ItMi_BaltramPaket,1);
	Delivery_Geholt = TRUE ;
};


instance DIA_Kati_BAUERNAUFSTAND (C_Info)
{
	npc = BAU_941_Kati;
	nr = 6;
	condition = DIA_Kati_BAUERNAUFSTAND_Condition;
	information = DIA_Kati_BAUERNAUFSTAND_Info;
	permanent = FALSE;
	description = " Why don't you resist Onar's tyranny? " ;
};


func int DIA_Kati_BAUERNAUFSTAND_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Now_HELLO ))
	{
		return TRUE;
	};
};

func void DIA_Kati_BAUERNAUFSTAND_Info()
{
	AI_Output(other,self, " DIA_Kati_BAUERNAUFSTAND_15_00 " );	// Why don't you resist Onar's tyranny?
	AI_Output(self,other, " DIA_Kati_BAUERNAUFSTAND_16_01 " );	// For farmers living near the city, this makes sense. They'd rather be on the side of the militia than rely on Onar's mercenaries.
	AI_Output(self,other, " DIA_Kati_BAUERNAUFSTAND_16_02 " );	// On the other hand, there are Bengar and Sekob who would rather give up their farms than work for the king.
};


instances DIA_Kati_ANDEREHOEFE (C_Info)
{
	npc = BAU_941_Kati;
	nr = 7;
	condition = DIA_Kati_ANDEREHOEFE_Condition;
	information = DIA_Kati_ANDEREHOEFE_Info;
	permanent = FALSE;
	description = " Where are the Bengar and Sekob farms? " ;
};


func int DIA_Kati_ANDEREHOEFE_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Current_BAUERNAUFSTAND ))
	{
		return TRUE;
	};
};

func void DIA_Kati_ANDEREHOEFE_Info()
{
	AI_Output(other,self, " DIA_Kati_ANDEREHOEFE_15_00 " );	// Where are the Bengar and Sekob farms?
	AI_Output(self,other, " DIA_Kati_ANDEREHOEFE_16_01 " );	// Not far from Onar's farm. Go east of here and you will find them.
};


instance DIA_Kati_HIERWEG (C_Info)
{
	npc = BAU_941_Kati;
	nr = 9;
	condition = DIA_Kati_HIERWEG_Condition;
	information = DIA_Kati_HIERWEG_Info;
	permanent = FALSE;
	description = " Have you thought about leaving here? " ;
};


func int DIA_Kati_HIERWEG_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Current_BAUERNAUFSTAND ))
	{
		return TRUE;
	};
};

func void DIA_Kati_HIERWEG_Info()
{
	AI_Output(other,self, " DIA_Kati_HIERWEG_15_00 " );	// Have you thought about leaving here?
	AI_Output(self,other, " DIA_Kati_HIERWEG_16_01 " );	// It's not easy to leave this part of the country. All this land is surrounded by a wall of high, impenetrable mountains.
	AI_Output(self,other, " DIA_Kati_HIERWEG_16_02 " );	// The only way out of here is through the Valley of Mines or through the city's harbor.
	AI_Output(self,other, " DIA_Kati_HIERWEG_16_03 " );	// Since we can't afford to buy a place on a ship, and the Valley of Mines is a place of no return, we're forced to stay here.
};


DIA_Kati_PASS (C_Info) instances
{
	npc = BAU_941_Kati;
	nr = 10;
	condition = DIA_Kati_PASS_Condition;
	information = DIA_Kati_PASS_Info;
	permanent = FALSE;
	description = " What do you know about the Passage? " ;
};


func int DIA_Kati_PASS_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Current_HIERWEG ))
	{
		return TRUE;
	};
};

func void DIA_Kati_PASS_Info()
{
	AI_Output(other,self, " DIA_Kati_PASS_15_00 " );	// What do you know about the Passage?
	AI_Output(self,other, " DIA_Kati_PASS_16_01 " );	// I've never been there myself. But I know he's somewhere near Bengar's farm in the high pastures.
};


instances DIA_Kati_PERMKAP1 (C_Info)
{
	npc = BAU_941_Kati;
	nr = 11;
	condition = DIA_Kati_PERMKAP1_Condition;
	information = DIA_Kati_PERMKAP1_Info;
	permanent = TRUE;
	description = " Take care of your husband. " ;
};


func int DIA_Kati_PERMKAP1_Condition()
{
	if ( ! C_NpcIsDown(Akil) && Npc_KnowsInfo(other,DIA_Kati_HALLO) && Npc_KnowsInfo(other,DIA_Kati_BAUERNAUFSTAND) && Npc_KnowsInfo(other,DIA_Kati_ANDEREHOEFE) && Npc_KnowsInfo(other,DIA_Kati_HIERWEG) && Npc_KnowsInfo(other,DIA_Kati_PASS) && (Kapitel <  3 ))
	{
		return TRUE;
	};
};

func void DIA_Kati_PERMKAP1_Info()
{
	AI_Output(other,self, " DIA_Kati_PERMKAP1_15_00 " );	// Take care of your husband.
	AI_Output(self,other, " DIA_Kati_PERMKAP1_16_01 " );	// I try my best.
	AI_StopProcessInfos(self);
};


instance DIA_Kati_KAP3_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_KAP3_EXIT_Condition;
	information = DIA_Kati_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances of DIA_Kati_PERM (C_Info)
{
	npc = BAU_941_Kati;
	nr = 3;
	condition = DIA_Kati_PERM_Condition;
	information = DIA_Kati_PERM_Info;
	permanent = TRUE;
	description = " Are you all right? " ;
};


func int DIA_Kati_PERM_Condition()
{
	if ((Capital >=  3 ) && Npc_KnowsInfo(other,DIA_Category_HELLO))
	{
		return TRUE;
	};
};

func void DIA_Kati_PERM_Info()
{
	AI_Output(other,self, " DIA_Kati_PERM_15_00 " );	// Are you all right?
	AI_Output(self,other, " DIA_Kati_PERM_16_01 " );	// We'll manage. I just don't know how much longer we'll have to put up with these devils in black.
	AI_Output(self,other, " DIA_Kati_PERM_16_02 " );	// I can't take this long. They snoop around the house and stick their nose everywhere.
};


instance DIA_Kati_KAP4_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_KAP4_EXIT_Condition;
	information = DIA_CAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kati_KAP5_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_KAP5_EXIT_Condition;
	information = DIA_CAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Kati_KAP6_EXIT(C_Info)
{
	npc = BAU_941_Kati;
	nr = 999;
	condition = DIA_Kati_KAP6_EXIT_Condition;
	information = DIA_Kati_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kati_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Kati_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_Kati_PICKPOCKET (C_Info)
{
	npc = BAU_941_Kati;
	nr = 900;
	condition = DIA_Kati_PICKPOCKET_Condition;
	information = DIA_Kati_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Kati_PICKPOCKET_Condition()
{
	return  C_Robbery ( 13 , 15 );
};

func void DIA_Kati_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kati_PICKPOCKET);
	Info_AddChoice(DIA_Kati_PICKPOCKET,Dialog_Back,DIA_Kati_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kati_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Kati_PICKPOCKET_DoIt);
};

func void DIA_Kati_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Kati_PICKPOCKET);
};

func void DIA_Kati_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kati_PICKPOCKET);
};
