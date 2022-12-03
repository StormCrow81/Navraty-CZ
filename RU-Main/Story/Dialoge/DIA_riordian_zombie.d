

instance DIA_RIORDIAN_ZOMBIE_EXIT(C_Info)
{
	npc = riordian_zombie;
	nr = 999;
	condition = dia_riordian_zombie_exit_condition;
	information = dia_riordian_zombie_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_riordian_zombie_exit_condition()
{
	return TRUE;
};

func void dia_riordian_zombie_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_RIORDIAN_ZOMBIE_HALLO (C_Info)
{
	npc = riordian_zombie;
	nr = 1;
	condition = dia_riordian_zombie_hallo_condition;
	information = dia_riordian_zombie_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_riordian_zombie_hallo_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_riordian_zombie_hallo_info()
{
	Snd_Play("MFX_FEAR_CAST");
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_Riordian_Zombie_HALLO_01_00 " );	// (dead voice) Aarggg, there you are, human... I've been waiting for you!
	AI_Output(other,self, " DIA_Riordian_Zombie_HALLO_01_01 " );	// Riordian?!
	AI_Output(self,other, " DIA_Riordian_Zombie_HALLO_01_02 " );	// You're wrong, mortal... That's not Riordian! In fact, it's not him anymore.
	AI_Output(other,self, " DIA_Riordian_Zombie_HALLO_01_03 " );	// Then who are you?
	AI_Output(self,other, " DIA_Riordian_Zombie_HALLO_01_04 " );	// And you think...
	AI_Output(self,other, " DIA_Riordian_Zombie_HALLO_01_05 " );	// And don't be fooled by the false appearance of this rotting flesh that exudes a terrible stench.
	AI_Output(self,other, " DIA_Riordian_Zombie_HALLO_01_06 " );	// Better take a closer look into her dead eyes, and you will see your real enemy, chosen one!
	AI_Output(other,self, " DIA_Riordian_Zombie_HALLO_01_07 " );	// Can't be! Guardians?!
	AI_Output(self,other, " DIA_Riordian_Zombie_HALLO_01_08 " );	// (laughs ominously) Did you think it was someone else?
	AI_Output(self,other, " DIA_Riordian_Zombie_HALLO_01_09 " );	// We underestimated you a little last time. This time we are well prepared!
	AI_Output(other,self, " DIA_Riordian_Zombie_HALLO_01_12 " );	// Where is the ancient artifact that the Builders used for their rituals?
	AI_Output(self,other, " DIA_Riordian_Zombie_HALLO_01_13 " );	// I have it... But you'll never get it! Just like saving the world.
	AI_Output(self,other, " DIA_Riordian_Zombie_HALLO_01_14 " );	// Soon this land will know our wrath, no one can stop us!
	B_LogEntry( TOPIC_GUARDIANS , " In one of the temples of the ancients, I again had to face the Guardians. It seems that they will not rest until they kill me! " );
	Log_AddEntry( TOPIC_RESTOREHRAM , " I found Riordian, but it seems I was too late! The evil sown by the Guardians has already completely taken possession of him and turned him into a soulless zombie. Now it remains for me to put an end to his torment and take away the ancient artifact that Saturas wants from him. " ) ;
	Info_ClearChoices(dia_riordian_zombie_hallo);
	Info_AddChoice(dia_riordian_zombie_hallo, " We'll see about that! " ,dia_riordian_zombie_hallo_end);
};

func void dia_riordian_zombie_hallo_end()
{
	AI_Output(other,self, " DIA_Riordian_Zombie_Hallo_End_01_00 " );	// We'll see about that!
	AI_Output(self,other, " DIA_Riordian_Zombie_Hallo_End_01_01 " );	// (ominous scream) Die, mortal!
	self.aivar[AIV_EnemyOverride] = FALSE ;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

