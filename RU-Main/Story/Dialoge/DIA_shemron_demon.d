

instance DIA_SHEMRON_DEMON_EXIT(C_Info)
{
	npc = shemron_demon;
	nr = 999;
	condition = dia_shemron_demon_exit_condition;
	information = dia_shemron_demon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_shemron_demon_exit_condition()
{
	if(SHEMRON_TALK == TRUE)
	{
		return TRUE;
	};
};

func void dia_shemron_demon_exit_info()
{
	AI_StopProcessInfos(self);
	self.flags = 0;
};


instance DIA_SHEMRON_DEMON_HELLO(C_Info)
{
	npc = shemron_demon;
	nr = 1;
	condition = dia_shemron_demon_hello_condition;
	information = dia_shemron_demon_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_shemron_demon_hello_condition()
{
	if (( SHEMRON_TALK  ==  FALSE ) && ( KNOWDEMENTORLANGUAGE  ==  TRUE ) && ( Npc_HasItems ( other , itmi_darkshpere ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void dia_shemron_demon_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_00 " );	// Man!?... (growls) And I thought - what kind of madman dared to disturb my peace!!!
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_01 " );	// You obviously haven't realized until now what you got yourself into when you came here...
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_02 " );	// But soon you will understand... (ominously)
	AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_03 " );	// Who are you, a creature of darkness?! Another henchman of Beliar?
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_04 " );	// Stupid human!...(laughs) My creator is not the Dark God!
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_06 " );	// I am Shemron, the fifth demon of the legion of Eligor, the faithful guardian of the Keepers of the divine Darkness, whose wisdom keeps the night!
	self.name[0] = "Шемррон";
	SHEMRONKNOWS = TRUE;
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_07 " );	// On their orders, I guard what you - a pathetic thief, just stole.
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_08 " );	// And now I'll make sure this never happens again... (growls)
	if(GUARDIAN_WAY == TRUE)
	{
		AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_09 " );	// Wait. Did you say Guardians? Are you saying that you, demon, serve the Guardians?
		AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_11 " );	// Hmm, what a surprise... The Keepers never mentioned that they had this kind of servant.
		AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_13 " );	// Hmm...would you like to say you pathetic worm that you have at least some idea of ​​what you just said!
		if(ADEPTGUARDIAN == TRUE)
		{
			AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_14 " );	// I am initiated into the sacred Circle of Guardians and am their adept.
			AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_15 " );	// I don't think they'd like it if something bad happened to me.
		}
		else
		{
			AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_16 " );	// I met the Guardians and they showed me the path that I started to follow.
			AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_17 " );	// I don't think they'd like it if something bad happened to me...
		};
		AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_18 " );	// It can't be! I don't believe a single word you say, miserable man!
		AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_19 " );	// It's unthinkable that the Elemental Guardians would turn their eyes on a lousy worm like you... (growls)
		AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_20 " );	// I'm telling the truth!
		AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_21 " );	// Otherwise, how do you think I would even be able to talk to you. It was the Guardians who taught me the language of demons.
		AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_22 " );	// Yes... it's very strange that you have this knowledge. But that's not enough for me to believe you.
		AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_24 " );	// If you can prove that you really are who you say you are...
		AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_25 " );	// ...then maybe I won't tear your flesh to pieces now. Although now I really want to do it! ... (growls)
		if(Npc_HasItems(other,itri_guardians_01) >= 1)
		{
			AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_26 " );	// I have this ring. It was given to me by the Guardian Dagoth during our first meeting.
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_27 " );	// ...(growls) Ring of Bhaal!!!... Only the Keeper could give you this thing.
			AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_28 " );	// Do you believe me now?
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_29 " );	// Yes. This is quite enough!
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_30 " );	// I'll keep you alive, human. But what you took will still be here.
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_31 " );	// The sphere will only leave this place if it is the will of the Guardians.
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_32 " );	// Give it to me.
			Info_ClearChoices(dia_shemron_demon_hello);
			Info_AddChoice(dia_shemron_demon_hello, " Good! Here, take her. " ,dia_shemron_demon_hello_ok);
			Info_AddChoice(dia_shemron_demon_hello, " I need it myself. " ,dia_shemron_demon_hello_no);
			if(MIS_STONNOSTEST == LOG_Running)
			{
				Info_AddChoice(dia_shemron_demon_hello, " Guardian Stonnos needs this Orb... " ,dia_shemron_demon_hello_stonnos);
			};
		}
		else if(Npc_HasItems(other,itri_guardians_02) >= 1)
		{
			AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_33 " );	// I have this holy circle adept's ring. Guardian Stonnos gave it to me at the initiation.
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_34 " );	// ...(growls) Ring of Elements!!!... Only the Guardian could give you this thing.
			AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_35 " );	// Do you believe me now?
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_36 " );	// Yes. This is quite enough!
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_37 " );	// I'll keep you alive, human. But what you took will still be here.
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_38 " );	// The sphere will only leave this place if it is the will of the Guardians.
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_39 " );	// Give it to me.
			Info_ClearChoices(dia_shemron_demon_hello);
			Info_AddChoice(dia_shemron_demon_hello, " Good! Here, take her. " ,dia_shemron_demon_hello_ok);
			Info_AddChoice(dia_shemron_demon_hello, " I need it myself. " ,dia_shemron_demon_hello_no);
			if(MIS_STONNOSTEST == LOG_Running)
			{
				Info_AddChoice(dia_shemron_demon_hello, " Guardian Stonnos needs this Orb... " ,dia_shemron_demon_hello_stonnos);
			};
		}
		else  if ( Npc_HasItems ( other , itri_narus ) >=  1 )
		{
			AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_40 " );	// I have this ring. It was given to me by Guardian Vakon during our first meeting.
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_41 " );	// ...(growls) Ring of Water!!!... Only the Keeper could give you this thing.
			AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_42 " );	// Do you believe me now?
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_43 " );	// Yes. This is quite enough!
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_44 " );	// I'll keep you alive, human. But what you took will still be here.
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_45 " );	// You acted wisely man! Otherwise, you would be dead by now.
			Info_ClearChoices(dia_shemron_demon_hello);
			Info_AddChoice(dia_shemron_demon_hello, " Good! Here, take her. " ,dia_shemron_demon_hello_ok);
			Info_AddChoice(dia_shemron_demon_hello, " I need it myself. " ,dia_shemron_demon_hello_no);
			if(MIS_STONNOSTEST == LOG_Running)
			{
				Info_AddChoice(dia_shemron_demon_hello, " Guardian Stonnos needs this Orb... " ,dia_shemron_demon_hello_stonnos);
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_47 " );	// Now continue on your way! Maybe someday our paths will cross again.
			AI_StopProcessInfos(self);
			Snd_Play("MFX_FEAR_CAST");
			B_Attack(self,other,AR_SuddenEnemyInferno,1);
			SHEMRON_TALK = TRUE;
			SHEMRON_FIGHT = TRUE;
			self.start_aistate = ZS_MM_AllScheduler;
		};
	}
	else
	{
		AI_StopProcessInfos(self);
		Snd_Play("MFX_FEAR_CAST");
		B_Attack(self,other,AR_SuddenEnemyInferno,1);
		SHEMRON_TALK = TRUE;
		SHEMRON_FIGHT = TRUE;
		self.start_aistate = ZS_MM_AllScheduler;
	};
};

func void dia_shemron_demon_hello_stonnos()
{
	AI_Output(other,self, " DIA_Shemron_Demon_Hello_Stonnos_01_01 " );	// Keeper Stonnos needs this Orb, and I intend to do whatever it takes to fulfill his errand.
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_Stonnos_01_03 " );	// Stonnos?! Hmmm... (growls) Well, if that's the case, then there's no need for that, human.
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_Stonnos_01_04 " );	// If everything you say is true, and High Guardian Stonnos himself sent you here, then I don't dare to detain you any longer!
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_Stonnos_01_05 " );	// You can keep this Orb for yourself and continue on your way!
	GIVESHEPHRESHEMRONBACK = TRUE;
	AI_StopProcessInfos(self);
	SHEMRON_TALK = TRUE;
	SHEMRON_FIGHT = FALSE;
	self.aivar[AIV_EnemyOverride] = FALSE ;
	self.start_aistate = zs_mm_rtn_demonrest;
};

func void dia_shemron_demon_hello_ok()
{
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_44 " );	// I'll keep you alive, human. But what you took will still be here.
	B_GiveInvItems(other,self,itmi_darkshpere,1);
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_45 " );	// You acted wisely man! Otherwise, you would be dead by now.
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_47 " );	// Now continue on your way! Maybe someday our paths will cross again.
	AI_StopProcessInfos(self);
	SHEMRON_TALK = TRUE;
	SHEMRON_FIGHT = FALSE;
	GIVESHEPHRESHEMRON = TRUE;
	self.aivar[AIV_EnemyOverride] = FALSE ;
};

func void dia_shemron_demon_hello_no()
{
	AI_Output(other,self, " DIA_Shemron_Demon_Hello_01_48 " );	// I need it myself.
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_49 " );	// Well, we'll see about that.
	AI_Output(self,other, " DIA_Shemron_Demon_Hello_01_51 " );	// Ha ha ha... (growls) You may be a good fighter, but you can't handle me!
	AI_StopProcessInfos(self);
	Snd_Play("MFX_FEAR_CAST");
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	SHEMRON_TALK = TRUE;
	SHEMRON_FIGHT = TRUE;
	self.start_aistate = ZS_MM_AllScheduler;
};


instance DIA_SHEMRON_DEMON_BACKSHEPHRE(C_Info)
{
	npc = shemron_demon;
	nr = 1;
	condition = dia_shemron_demon_backshephre_condition;
	information = dia_shemron_demon_backshephre_info;
	permanent = FALSE;
	description = " Guardian Stonnos needs a Shadow Orb! " ;
};


func int dia_shemron_demon_backshephre_condition()
{
	if((MIS_STONNOSTEST == LOG_Running) && (GIVESHEPHRESHEMRON == TRUE) && (GIVESHEPHRESHEMRONBACK == FALSE))
	{
		return TRUE;
	};
};

func void dia_shemron_demon_backshephre_info()
{
	AI_Output(other,self, " DIA_Shemron_Demon_BackShephre_01_01 " );	// Keeper Stonnos needs a Shadow Orb! And I intend to do whatever it takes to carry out his order.
	AI_Output(self,other, " DIA_Shemron_Demon_BackShephre_01_03 " );	// Stonnos?! Hmmm... (growls) Well, if that's the case, then there's no need for that, human.
	AI_Output(self,other, " DIA_Shemron_Demon_BackShephre_01_04 " );	// If everything you say is true, and the head of the sacred circle himself sent you here - then you can safely take it from me!
	AI_Output(self,other, " DIA_Shemron_Demon_BackShephre_01_05 " );	// Here, take this magical artifact and take it to the High Guardian!
	B_GiveInvItems(self,other,itmi_darkshpere,1);
	GIVESHEPHRESHEMRONBACK = TRUE;
	AI_StopProcessInfos(self);
	SHEMRON_TALK = TRUE;
	SHEMRON_FIGHT = FALSE;
	self.aivar[AIV_EnemyOverride] = FALSE ;
	self.start_aistate = zs_mm_rtn_demonrest;
};

