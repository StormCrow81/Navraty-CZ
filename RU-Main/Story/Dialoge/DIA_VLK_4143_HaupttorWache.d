

instance DIA_Haupttorwache_EXIT(C_Info)
{
	npc = VLK_4143_HaupttorWache;
	nr = 999;
	condition = DIA_Haupttorwache_EXIT_Condition;
	information = DIA_Haupttorwache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Haupttorwache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Haupttorwache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Haupttorwache_AUSGABE (C_Info)
{
	npc = VLK_4143_Main GateGuard;
	nr = 4;
	condition = DIA_Haupttorwache_AUFGABE_Condition;
	information = DIA_Haupttorwache_AUSGABE_Info;
	permanent = TRUE;
	description = " What are you doing here? " ;
};


func int DIA_main gate guard_TASK_Condition()
{
	return TRUE;
};

func void DIA_main gate guard_TASK_Info()
{
	AI_Output(other,self, " DIA_Haupttorwache_AUFGABE_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Haupttorwache_AUFGABE_13_01 " );	// My task is simple. I have to make sure the orcs don't come closer than 30 feet to the gate.
	AI_Output(self,other, " DIA_Haupttorwache_AUFGABE_13_02 " );	// If you try to raise the bars, I'll sound the alarm. That's all.
};


instance DIA_Haupttorwache_TOROEFFNEN (C_Info)
{
	npc = VLK_4143_Main GateGuard;
	nr = 5;
	condition = DIA_Haupttorwache_TOROEFFNEN_Condition;
	information = DIA_Haupttorwache_TOROEFFNEN_Info;
	permanent = TRUE;
	description = " What do I need to do to open the main gate? " ;
};


func int DIA_Haupttorwache_TOROEFFNEN_Condition()
{
	if (Chapter >=  5 )
	{
		return TRUE;
	};
};

func void DIA_Haupttorwache_TOROEFFNEN_Info()
{
	AI_Output(other,self, " DIA_Haupttorwache_TOROEFFNEN_15_00 " );	// What needs to be done to open the main gate?
	AI_Output(self,other, " DIA_Haupttorwache_TOROEFFNEN_13_01 " );	// For God's sake! Why do you need to know this?
	self.flags = 0;
	Info_ClearChoices(DIA_Haupttorwache_TOROEFFNEN);
	Info_AddChoice(DIA_Haupttorwache_TOROEFFNEN, " I'm worried about the lock's security. " ,DIA_Haupttorwache_TOROEFFNEN_sicherheit);
	Info_AddChoice(DIA_Haupttorwache_TOROEFFNEN, " I just asked. " ,DIA_Haupttorwache_TOROEFFNEN_frage);
};

func void DIA_Haupttorwache_TOROEFFNEN_Sicherheit()
{
	AI_Output(other,self, " DIA_Haupttorwache_TOROEFFNEN_sicherheit_15_00 " );	// I'm worried about the security of the lock.
	AI_Output(self,other, " DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_01 " );	// Me too, trust me.
	AI_Output(self,other, " DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_02 " );	// I am a very conscientious guard, and Garond even entrusted me with the key to the gatekeeper.
	AI_Output(self,other, " DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_03 " );	// (proudly) That's a big responsibility. I will keep it carefully. I swore this to Garond.
	AI_Output(self,other, " DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_04 " );	// Yes. Just imagine that someone comes and lifts the lever to open the gate, and suddenly this rusty old grate is jammed.
	AI_Output(self,other, " DIA_Haupttorwache_TOROEFFNEN_sicherheit_13_05 " );	// Nobody can then close this gate. I don't even want to think about what will happen next. It's good that no one knows that I have the key.
	AI_StopProcessInfos(self);
};

func void DIA_Haupttorwache_TOROEFFNEN_frage()
{
	AI_Output(other,self, " DIA_Haupttorwache_TOROEFFNEN_frage_15_00 " );	// Yes, I just asked.
	AI_Output(self,other, " DIA_Haupttorwache_TOROEFFNEN_frage_13_01 " );	// Next time think about what you're asking. You could be in big trouble because of this. You know what times are now. Now leave. I'm busy.
	AI_StopProcessInfos(self);
};


instance DIA_Haupttorwache_PICKPOCKET (C_Info)
{
	npc = VLK_4143_Main GateGuard;
	nr = 900;
	condition = DIA_Haupttorwache_PICKPOCKET_Condition;
	information = DIA_Haupttorwache_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};

func int DIA_Haupttorwache_PICKPOCKET_Condition()
{
	if ((Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET ) >=  1 ) && (self.aivar[AIV_PlayerHasPickedMyPocket] ==  ​​FALSE ) && (Npc_HasItems(self,itke_oc_maingate_mis) >=  1 ) && (Chapter >=  5 )) ;
	{
		return TRUE;
	};
};

func void DIA_Haupttorwache_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Haupttorwache_PICKPOCKET);
	Info_AddChoice(DIA_Haupttorwache_PICKPOCKET,Dialog_Back,DIA_Haupttorwache_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Haupttorwache_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Haupttorwache_PICKPOCKET_DoIt);
};

func void DIA_Haupttorwache_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,itke_oc_maingate_mis, 1 );
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP(XP_Ambient);
		Info_ClearChoices(DIA_Haupttorwache_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_main gate guard_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Haupttorwache_PICKPOCKET);
};

