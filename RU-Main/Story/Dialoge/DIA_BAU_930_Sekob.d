instance DIA_Sekob_EXIT(C_Info)
{
	npc = BAU_930_Sekob;
	No. = 999 ;
	condition = DIA_Sekob_EXIT_Condition;
	information = DIA_Sekob_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sekob_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Sekob_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_HALLO (C_Info)
{
	npc = BAU_930_Sekob;
	No. = 3 ;
	condition = DIA_Sekob_HALLO_Condition;
	information = DIA_Sekob_HALLO_Info;
	permanent = FALSE ;
	important = TRUE;
};


func int DIA_Sekob_HELLO_Condition()
{
	if((Kapitel < 3) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_HELLO_Info()
{
	AI_Output (self, other, " DIA_Sekob_HALLO_01_00 " );	// What are you doing on my land? There is nothing to steal here. Get out.
	AI_Output (other, self, " DIA_Sekob_HALLO_15_01 " );	// Is there really not a piece of land in this damned country that does not belong to anyone?
	AI_Output (self, other, " DIA_Sekob_HALLO_01_02 " );	// Perhaps one day you will have a piece of land to call your own. Until then, get off mine if you please.
};


instance DIA_Sekob_PermVorMis (C_Info)
{
	npc = BAU_930_Sekob;
	No. = 3 ;
	condition = DIA_Sekob_PermVorMis_Condition;
	information = DIA_Sekob_PermVorMis_Info;
	permanent = TRUE;
	description = " Listen ... " ;
};


func int DIA_Sekob_PermVorMis_Condition()
{
	if((Kapitel < 3) && (MIS_Torlof_HolPachtVonSekob == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PermVorMis_Info()
{
	AI_Output(other,self,"DIA_Sekob_PermVorMis_15_00");	//Listen...
	AI_Output (self, other, " DIA_Sekob_PermVorMis_01_01 " );	// I don't have any job for you right now. Leave!
};


instance DIA_Sekob_ZAHLPACHT (C_Info)
{
	npc = BAU_930_Sekob;
	No. = 5 ;
	condition = DIA_Sekob_ZAHLPACHT_Condition;
	information = DIA_Sekob_ZAHLPACHT_Info;
	permanent = FALSE ;
	description = " Onar wants you to pay your rent. " ;
};


func int DIA_Sekob_ZAHLPACHT_Condition ()
{
	if(MIS_Torlof_HolPachtVonSekob == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Sekob_ZAHLPACHT_Info ()
{
	AI_Output (other, self, " DIA_Sekob_ZAHLPACHT_15_00 " );	// Onar want his rent. You're long overdue. Pay up.
	AI_Output (self, other, " DIA_Sekob_ZAHLPACHT_01_01 " );	 // What? And he sent a thug like you to squeeze me? 
	AI_Output (self, other, " DIA_Sekob_ZAHLPACHT_01_02 " );	 // Get out of here before I lose my temper.
	self.aivar[AIV_DefeatedByPlayer] = FALSE;
};


instance DIA_Sekob_KohleRaus(C_Info)
{
	npc = BAU_930_Sekob;
	No. = 5 ;
	condition = DIA_Sekob_KohleRaus_Condition;
	information = DIA_Sekob_KohleRaus_Info;
	permanent = TRUE;
	description = " Give me some money or I'll knock out your teeth. " ;
};


func int DIA_Sekob_KohleRaus_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_ZAHLPACHT) && (self.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_KohleRaus_Info()
{
	AI_Output (other, self, " DIA_Sekob_KohleRaus_15_00 " );	// Give me some money, or I'll knock out your teeth.
	AI_Output (self, other, " DIA_Sekob_KohleRaus_01_01 " );	// Oh yeah? Come and get them if you can!
	AI_StopProcessInfos(self);
	self.aivar[AIV_ToughGuy] = TRUE;
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Sekob_InformOnar (C_Info)
{
	npc = BAU_930_Sekob;
	No. = 5 ;
	condition = DIA_Sekob_InformOnar_Condition;
	information = DIA_Sekob_InformOnar_Info;
	permanent = FALSE ;
	description = " Then I'll have to report this to Onar. " ;
};


func int DIA_Sekob_InformOnar_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_ZAHLPACHT) && (self.aivar[AIV_DefeatedByPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_InformOnar_Info ()
{
	AI_Output (other, self, " DIA_Sekob_InformOnar_15_00 " );	// Then I'll have to report this to Onar.
	AI_Output (self, other, " DIA_Sekob_InformOnar_01_01 " );	// I don't care, I don't have it. Tell Onar you can't squeeze blood from a stone.
	MIS_Sekob_RedeMitOnar = LOG_Running;
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_Defeated(C_Info)
{
	npc = BAU_930_Sekob;
	No. = 5 ;
	condition = DIA_Sekob_Defeated_Condition;
	information = DIA_Sekob_Defeated_Info;
	permanent = FALSE ;
	description = " Where do you keep your money ?! " ;
};


func int DIA_Sekob_Defeated_Condition()
{
	if((self.aivar[AIV_DefeatedByPlayer] == TRUE) && Npc_KnowsInfo(other,DIA_Sekob_ZAHLPACHT) && (Sekob_Pachtbezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_Defeated_Info()
{
	AI_Output (other, self, " DIA_Sekob_Defeated_15_00 " );	// Where do you keep the money?!
	AI_Output (self, other, " DIA_Sekob_Defeated_01_01 " );	// Don't hit me again, please. I will do whatever you say.
	AI_Output(other,self,"DIA_Sekob_Defeated_15_02");	//Pay up.
	AI_Output (self, other, " DIA_Sekob_Defeated_01_03 " );	// (whimpering) But, sir, I have nothing. I am a simple poor man, I'm starving...
	AI_Output (self, other, " DIA_Sekob_Defeated_01_04 " );	// My last crop was completely destroyed by drought. I WANT to pay the rent, but I have NOTHING. I'm really sorry.
	Info_ClearChoices(DIA_Sekob_Defeated);
	Info_AddChoice (DIA_Sekob_Defeated, " Pay the rent or I'll kill you. " , DIA_Sekob_Defeated_hart);
	Info_AddChoice (DIA_Sekob_Defeated, " Okay, I'll talk to Onar. " , DIA_Sekob_Defeated_weich);
};

func void DIA_Sekob_Defeated_weich()
{
	AI_Output (other, self, " DIA_Sekob_Defeated_weich_15_00 " );	// Okay, I'll talk to Onar.
	AI_Output (self, other, " DIA_Sekob_Defeated_weich_01_01 " );	// Thank you sir. Innos bless you!
	MIS_Sekob_RedeMitOnar = LOG_Running;
	AI_StopProcessInfos(self);
};

func void B_Sekob_Kassieren ()
{
	AI_Output (other, self, " DIA_Sekob_Kassieren_15_00 " );	// Stop talking nonsense. It rained almost incessantly, and your store are bursting with grain. Pay the rent or I will kill you.
	AI_Output (self, other, " DIA_Sekob_Kassieren_01_01 " );	// (obsequiously) No, please, here, take the gold. I'll even give you some of it if you promise to stop hurting me.
	B_GiveInvItems(self,other,ItMi_Gold,60);
	AI_Output (other, self, " DIA_Sekob_Kassieren_15_02 " );	// You see, that wasn't so hard.
	AI_Output (self, other, " DIA_Sekob_Kassieren_01_03 " );	// (desperate) I'm broke.
	Sekob_Pachtbezahlt = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Sekob_Defeated_hart()
{
	B_Sekob_Kassieren ();
};


instance DIA_Sekob_Again(C_Info)
{
	npc = BAU_930_Sekob;
	No. = 5 ;
	condition = DIA_Sekob_Again_Condition;
	information = DIA_Sekob_Again_Info;
	permanent = TRUE;
	description = " About rent ... " ;
};


func int DIA_Sekob_Again_Condition()
{
	if((MIS_Sekob_RedeMitOnar == LOG_Running) && Npc_KnowsInfo(other,DIA_Sekob_Defeated) && (Sekob_Pachtbezahlt == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_Again_Info()
{
	AI_Output(other,self,"DIA_Sekob_Again_15_00");	//About the rent...
	AI_Output (self, other, " DIA_Sekob_Again_01_01 " );	// You’ll talk to Onar, right?
	Info_ClearChoices(DIA_Sekob_Again);
	Info_AddChoice (DIA_Sekob_Again, " I changed my mind. " , DIA_Sekob_Again_Nein);
	if(Onar_WegenSekob == TRUE)
	{
		Info_AddChoice (DIA_Sekob_Again, " It's mine... " , DIA_Sekob_Again_verarscht);
	}
	else
	{
		Info_AddChoice(DIA_Sekob_Again,"Certainly.",DIA_Sekob_Again_Ja);
	};
};

func void DIA_Sekob_Again_Nein ()
{
	AI_Output(other,self,"DIA_Sekob_Again_Nein_15_00");	//I changed my mind.
	B_Sekob_Kassieren ();
};

func void DIA_Sekob_Again_Ja()
{
	AI_Output(other,self,"DIA_Sekob_Again_Ja_15_00");	//Certainly.
	AI_Output (self, other, " DIA_Sekob_Again_Ja_01_01 " );	// You can do it.
	AI_StopProcessInfos(self);
};

func void DIA_Sekob_Again_verarscht ()
{
	MIS_Sekob_RedeMitOnar = LOG_SUCCESS;
	AI_Output(other,self,"DIA_Sekob_Again_verarscht_15_00");	//I spoke to him...
	AI_Output (self, other, " DIA_Sekob_Again_verarscht_01_01 " );	// And? What did he say?
	AI_Output (other, self, " DIA_Sekob_Again_verarscht_15_02 " );	// Sorry, but now I have to rip your head off.
	AI_Output (self, other, " DIA_Sekob_Again_verarscht_01_03 " );	// Why? What have I done?
	AI_Output (other, self, " DIA_Sekob_Again_verarscht_15_04 " );	// You tried to trick me.
	AI_Output (self, other, " DIA_Sekob_Again_verarscht_01_05 " );	// I told the truth - honestly!
	B_Sekob_Kassieren ();
};


instance DIA_Sekob_PERMKAP1 (C_Info)
{
	npc = BAU_930_Sekob;
	No. = 6 ;
	condition = DIA_Sekob_PERMKAP1_Condition;
	information = DIA_Sekob_PERMKAP1_Info;
	permanent = TRUE;
	description = " Next time you pay on time, okay? " ;
};


func int DIA_Sekob_PERMKAP1_Condition()
{
	if((Sekob_Pachtbezahlt == TRUE) && (Kapitel < 3))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PERMKAP1_Info()
{
	AI_Output (other, self, " DIA_Sekob_PERMKAP1_15_00 " );	// Next time you pay on time, okay?
	AI_Output (self, other, " DIA_Sekob_PERMKAP1_01_01 " );	// What did I do to deserve this ...
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_KAP3_EXIT(C_Info)
{
	npc = BAU_930_Sekob;
	No. = 999 ;
	condition = DIA_Sekob_KAP3_EXIT_Condition;
	information = DIA_Sekob_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sekob_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Sekob_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_DMT(C_Info)
{
	npc = BAU_930_Sekob;
	NO = 30 ;
	condition = DIA_Sekob_DMT_Condition;
	information = DIA_Sekob_DMT_Info;
	description = " Has anything happened? " ;
};


func int DIA_Sekob_DMT_Condition()
{
	if((Kapitel >= 3) && (DarkPathStart == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_DMT_Info()
{
	AI_Output (other, self, " DIA_Sekob_DMT_15_00 " );	// Has anything happened?
	AI_Output (self, other, " DIA_Sekob_DMT_01_01 " );	// You have to help me. People in black robes took over my house.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output (self, other, " DIA_Sekob_DMT_01_02 " );	// Servants of the king have to take care of the population, right?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output (self, other, " DIA_Sekob_DMT_01_03 " );	// I know you mercenaries don't do charity work, but I will pay you.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output (self, other, " DIA_Sekob_DMT_01_04 " );	// You have to help me, oh great magician.
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output (self, other, " DIA_Sekob_DMT_01_04A " );	// You guys from the Brotherhood are not as callous as those stupid mercenaries or royal dogs!
	};
	if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other,"DIA_Sekob_DMT_01_04B");	//Adanos is with you!
	};
	if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output (self, other, " DIA_Sekob_DMT_01_04C " );	// Please, Dark One!
	};
	AI_Output (self, other, " DIA_Sekob_DMT_01_05 " );	// These people say they are looking for someone, in my house!
	AI_Output (self, other, " DIA_Sekob_DMT_01_06 " );	// Please help me. Make them get out.
	Log_CreateTopic(TOPIC_SekobDMT,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SekobDMT,LOG_Running);
	B_LogEntry (TOPIC_SekobDMT, "The black magicians kicked Secob out of kis house. Secob wants me to drive them out. " );
};


instance DIA_Sekob_DMTWEG(C_Info)
{
	npc = BAU_930_Sekob;
	NO = 31 ;
	condition = DIA_Sekob_DMTWEG_Condition;
	information = DIA_Sekob_DMTWEG_Info;
	description = " Your house is empty. " ;
};


func int DIA_Sekob_DMTWEG_Condition()
{
	if((Kapitel >= 3) && Npc_KnowsInfo(other,DIA_Sekob_DMT) && Npc_IsDead(DMT_DementorAmbientSekob1) && Npc_IsDead(DMT_DementorAmbientSekob2) && Npc_IsDead(DMT_DementorAmbientSekob3) && Npc_IsDead(DMT_DementorAmbientSekob4))
	{
		return TRUE;
	};
};

func void DIA_Sekob_DMTWEG_Info()
{
	AI_Output (other, self, " DIA_Sekob_DMTWEG_15_00 " );	// Your house is empty. No more scary robed people.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output (self, other, " DIA_Sekob_DMTWEG_01_01 " );	// I knew the guard could be relied on.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output (self, other, " DIA_Sekob_DMTWEG_01_02 " );	// You did a great job. Onar can be proud to have such people on his side.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output (self, other, " DIA_Sekob_DMTWEG_01_03 " );	// Thank you, great magician. What would become of us without the protection of the clergy.
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output (self, other, " DIA_Sekob_DMTWEG_01_04 " );	// Thank you, swamp dweller. Still, there are worthy people among you!
	};
	if((other.guild == GIL_NDW) || (other.guild == GIL_KDW))
	{
		AI_Output (self, other, " DIA_Sekob_DMTWEG_01_05 " );	// Thank you, magician. What would have happened to us if we had not been protected by Adanos!
	};
	if((other.guild == GIL_NDM) || (other.guild == GIL_KDM))
	{
		AI_Output (self, other, " DIA_Sekob_DMTWEG_01_06 " );	// Take my thanks, necromancer. I never thought that Beliar's servants were capable of doing good!
	};
	TOPIC_END_SekobDMT = TRUE;
	B_GivePlayerXP(XP_SekobDMTWEG);
	if(Kapitel < 5)
	{
		Npc_ExchangeRoutine(self,"Start");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Obsessed");
	};
	if(Rosi_FleeFromSekob_Kap5 == FALSE)
	{
		B_StartOtherRoutine(Rosi,"Start");
		B_StartOtherRoutine(Till,"Start");
	};
	B_StartOtherRoutine(Balthasar,"Start");
	B_StartOtherRoutine(BAU_933_Rega,"Start");
	B_StartOtherRoutine(BAU_934_Babera,"Start");
	B_StartOtherRoutine(BAU_937_Bauer,"Start");
	B_StartOtherRoutine(BAU_938_Bauer,"Start");
};


instance DIA_Sekob_BELOHNUNG (C_Info)
{
	npc = BAU_930_Sekob;
	NO = 32 ;
	condition = DIA_Sekob_BELOHNUNG_Condition;
	information = DIA_Sekob_BELOHNUNG_Info;
	description = " Not so fast my friend. " ;
};


func int DIA_Sekob_BELOHNUNG_Condition ()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_DMTWEG) && (Kapitel >= 3))
	{
		return TRUE;
	};
};

func void DIA_Sekob_BELOHNUNG_Info ()
{
	AI_Output (other, self, " DIA_Sekob_BELOHNUNG_15_00 " );	// Not so fast my friend.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		if(Npc_KnowsInfo(other,DIA_Rosi_WASMACHSTDU))
		{
			AI_Output (other, self, " DIA_Sekob_BELOHNUNG_15_01 " );	// From now on, you will have to leave your dirty deeds and follow the path of good, or I will return ...
		};
		AI_Output (self, other, " DIA_Sekob_BELOHNUNG_01_02 " );	// I don't understand. What else do you need?
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output (other, self, " DIA_Sekob_BELOHNUNG_15_03 " );	// I overheard something about a reward?
	};
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_NDW) || (hero.guild == GIL_KDW) || (hero.guild == GIL_NDM) || (hero.guild == GIL_KDM))
	{
		AI_Output (other, self, " DIA_Sekob_BELOHNUNG_15_04 " );	// I'm only interested in one thing. What were these people in black robes doing in your house?
		AI_Output (self, other, " DIA_Sekob_BELOHNUNG_01_05 " );	// I don't understand myself, oh great magician. Perhaps they ...
		AI_Output(other,self,"DIA_Sekob_BELOHNUNG_15_06");	//Yes?
		AI_Output (self, other, " DIA_Sekob_BELOHNUNG_01_07 " );	// It's a shame. Many years ago I vowed to be silent about this, and I have no desire to break my promise.
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output (other, self, " DIA_Sekob_BELOHNUNG_01_07A " );	// Of course, we - people from the Brotherhood - are always ready to help those who need it. But you understand that any service must be repaid...
	};
	AI_Output (self, other, " DIA_Sekob_BELOHNUNG_01_08 " );	// All I can do is give you some gold and ask you to spare me.
	AI_Output (other, self, " DIA_Sekob_BELOHNUNG_15_09 " );	// Then give it here. I'm in a hurry.
	AI_Output(self,other,"DIA_Sekob_BELOHNUNG_01_10");	//Here.
	CreateInvItems(self,ItMi_Gold,250);
	B_GiveInvItems(self,other,ItMi_Gold,250);
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_PERM(C_Info)
{
	npc = BAU_930_Sekob;
	n ° = 80 ;
	condition = DIA_Sekob_PERM_Condition;
	information = DIA_Sekob_PERM_Info;
	permanent = TRUE;
	description = " Did anything interesting happen? " ;
};

func int DIA_Sekob_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Sekob_BELOHNUNG) && (Kapitel >= 3) && (NpcObsessedByDMT_Sekob == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Sekob_PERM_Info()
{
	if((hero.guild == GIL_KDF) && (Kapitel >= 5))
	{
		B_NpcObsessedByDMT(self);
	}
	else
	{
		AI_Output (other, self, " DIA_Sekob_PERM_15_00 " );	// Anything interesting happened?

		if(MIS_bringRosiBackToSekob == LOG_FAILED)
		{
			AI_Output(self,other,"DIA_Sekob_PERM_01_01");	//Fail...
		}
		else if(MIS_bringRosiBackToSekob == LOG_SUCCESS)
		{
			AI_Output (self, other, " DIA_Sekob_PERM_01_02 " );	// No! Nothing special.
		}
		else if((Kapitel >= 5) && (MIS_bringRosiBackToSekob != LOG_SUCCESS) && (MIS_bringRosiBackToSekob != LOG_Running)) 
		{
			AI_Output (self, other, " DIA_Sekob_PERM_01_03 " );	// My wife disappeared. At first I didn’t think much of it, but she never came back.
			AI_Output (self, other, " DIA_Sekob_PERM_01_04 " );	// I suspect she ran into the forest to escape the field predators.
			AI_Output (self, other, " DIA_Sekob_PERM_01_05 " );	// Do me a favor: if you find her, bring her home.
			MIS_bringRosiBackToSekob = LOG_Running;
			Log_CreateTopic(TOPIC_bringRosiBackToSekob,LOG_MISSION);
			Log_SetTopicStatus(TOPIC_bringRosiBackToSekob,LOG_Running);
			B_LogEntry (TOPIC_bringRosiBackToSekob, " Rosie is missing! Secob wants me to find her and bring her back. " );
		}
		else
		{
			AI_Output (self, other, " DIA_Sekob_PERM_01_06 " );	// Nothing since these strangers in black took over my house.
		};
	};
};


instance DIA_Sekob_KAP4_EXIT(C_Info)
{
	npc = BAU_930_Sekob;
	No. = 999 ;
	condition = DIA_Sekob_KAP4_EXIT_Condition;
	information = DIA_Sekob_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sekob_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Sekob_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sekob_KAP5_EXIT(C_Info)
{
	npc = BAU_930_Sekob;
	No. = 999 ;
	condition = DIA_Sekob_KAP5_EXIT_Condition;
	information = DIA_Sekob_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sekob_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Sekob_KAP5_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Sekob_Hheilung (C_Info)
{
	npc = BAU_930_Sekob;
	NO = 55 ;
	condition = DIA_Sekob_Hichtung_Condition;
	information = DIA_Sekob_Hichtung_Info;
	permanent = TRUE;
	description = " You have a problem. " ;
};


func int DIA_Sekob_Hichtung_Condition ()
{
	if((NpcObsessedByDMT_Sekob == TRUE) && (NpcObsessedByDMT == FALSE) && (hero.guild == GIL_KDF) && (Kapitel >= 5))
	{
		return TRUE;
	};
};


var int DIA_Sekob_Hheil_oneTime;

func void DIA_Sekob_Hichtung_Info ()
{
	AI_Output (other, self, " DIA_Sekob_Heilung_15_00 " );	// You have a problem.
	if(DIA_Sekob_Heilung_oneTime == FALSE)
	{
		AI_Output (self, other, " DIA_Sekob_Heilung_01_01 " );	// Yes, that's for sure. YOU are my problem, filthy wizard. Get away before I skin you alive.
		AI_Output (other, self, " DIA_Sekob_Heilung_15_02 " );	// (to himself) Nutcase.
		B_NpcClearObsessionByDMT(self);
		DIA_Sekob_Heilung_oneTime = TRUE;
	}
	else
	{
		AI_Output (self, other, " DIA_Sekob_Heilung_01_03 " );	// Can't you hear me ?!
		AI_Output (other, self, " DIA_Sekob_Heilung_15_04 " );	// (to himself) Hopeless case.
		B_NpcClearObsessionByDMT(self);
		B_Attack(self,other,AR_NONE,1);
	};
};


instance DIA_Sekob_ROSIBACKATSEKOB (C_Info)
{
	npc = BAU_930_Sekob;
	NO = 53 ;
	condition = DIA_Sekob_ROSIBACKATSEKOB_Condition;
	information = DIA_Sekob_ROSIBACKATSEKOB_Info;
	description = " I brought your wife back. " ;
};

func int DIA_Sekob_ROSIBACKATSEKOB_Condition ()
{
	if((Kapitel >= 5) && (hero.guild != GIL_KDF) && (Npc_GetDistToWP(Rosi,"NW_FARM4_SEKOB") < 3000) && (MIS_bringRosiBackToSekob == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Sekob_ROSIBACKATSEKOB_Info ()
{
	B_GivePlayerXP(XP_Ambient);
	AI_Output (other, self, " DIA_Sekob_ROSIBACKATSEKOB_15_00 " );	// I brought your wife back.
	AI_Output (self, other, " DIA_Sekob_ROSIBACKATSEKOB_01_01 " );	// Excellent! Here, take this for your trouble.
	MIS_BringRosiBackToSekob = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BringRosiBackToSekob,LOG_SUCCESS);
	B_GiveInvItems(self,other,ItMi_Gold,650);
	Rosi.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Till.aivar [ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
	B_NpcClearObsessionByDMT(self);
	B_StartOtherRoutine(Rosi,"Start");
	B_StartOtherRoutine(Till,"Start");
};

instance DIA_Sekob_ROSINEVERBACK (C_Info)
{
	npc = BAU_930_Sekob;
	NO = 56 ;
	condition = DIA_Sekob_ROSINEVERBACK_Condition;
	information = DIA_Sekob_ROSINEVERBACK_Info;
	description = " Rosie will never return to you. " ;
};


func int DIA_Sekob_ROSINEVERBACK_Condition()
{
	if((MIS_bringRosiBackToSekob == LOG_OBSOLETE) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Sekob_ROSINEVERBACK_Info()
{
	AI_Output (other, self, " DIA_Sekob_ROSINEVERBACK_15_00 " );	// Rosie will never come back to you. I took her to safety.
	AI_Output (self, other, " DIA_Sekob_ROSINEVERBACK_01_01 " );	// Safe. From whom?
	AI_Output(other,self,"DIA_Sekob_ROSINEVERBACK_15_02");	//From her bastard of a husband.
	AI_Output (self, other, " DIA_Sekob_ROSINEVERBACK_01_03 " );	// You will regret this, you filthy pig.
	B_NpcClearObsessionByDMT(self);
	B_GivePlayerXP(XP_Ambient);
	MIS_BringRosiBackToSekob = LOG_OBSOLETE;
	Log_SetTopicStatus(TOPIC_BringRosiBackToSekob,LOG_OBSOLETE);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

instance DIA_Sekob_KAP6_EXIT(C_Info)
{
	npc = BAU_930_Sekob;
	No. = 999 ;
	condition = DIA_Sekob_KAP6_EXIT_Condition;
	information = DIA_Sekob_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sekob_KAP6_EXIT_Condition()
{
	if(Kapitel >= 6)
	{
		return TRUE;
	};
};

func void DIA_Sekob_KAP6_EXIT_Info()
{
	B_NpcClearObsessionByDMT(self);
};


instance DIA_Sekob_PICKPOCKET(C_Info)
{
	npc = BAU_930_Sekob;
	NO = 900 ;
	condition = DIA_Sekob_PICKPOCKET_Condition;
	information = DIA_Sekob_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Sekob_PICKPOCKET_Condition()
{
	return  C_Beklauen ( 75 , 230 );
};

func void DIA_Sekob_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Sekob_PICKPOCKET);
	Info_AddChoice (DIA_Sekob_PICKPOCKET, Dialog_Back, DIA_Sekob_PICKPOCKET_BACK);
	Info_AddChoice (DIA_Sekob_PICKPOCKET, DIALOG_PICKPOCKET , DIA_Sekob_PICKPOCKET_DoIt);
};

func void DIA_Sekob_PICKPOCKET_DoIt ()
{
	B_Beklauen ();
	Info_ClearChoices(DIA_Sekob_PICKPOCKET);
};

func void DIA_Sekob_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Sekob_PICKPOCKET);
};
