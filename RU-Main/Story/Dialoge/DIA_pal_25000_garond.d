

instance DIA_PAL_25000_GAROND_EXIT(C_Info)
{
	npc = pal_25000_garond;
	nr = 999;
	condition = dia_pal_25000_garond_exit_condition;
	information = dia_pal_25000_garond_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_25000_garond_exit_condition()
{
	return TRUE;
};

func void dia_pal_25000_garond_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_25000_GAROND_EXITNW(C_Info)
{
	npc = pal_25000_garond;
	nr = 1;
	condition = dia_pal_25000_garond_exitnw_condition;
	information = dia_pal_25000_garond_exitnw_info;
	permanent = FALSE;
	description = " Your people and yourself are safe now. " ;
};


func int dia_pal_25000_garond_exitnw_condition()
{
	return TRUE;
};

func void dia_pal_25000_garond_exitnw_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_PAL_25000_Garond_ExitNW_01_00 " );	// Now your people and you are safe.
	AI_Output(self,other, " DIA_PAL_25000_Garond_ExitNW_01_01 " );	// Yes, but the orcs are still besieging Khorinis, and that's no good.
	AI_Output(self,other, " DIA_PAL_25000_Garond_ExitNW_01_02 " );	// We need to do something to kick them off the island! Otherwise, all our labors will be in vain.
	AI_Output(other,self, " DIA_PAL_25000_Garond_ExitNW_01_03 " );	// Don't worry. We'll come up with something.
	AI_Output(self,other,"DIA_PAL_25000_Garond_ExitNW_01_04");	//Надеюсь.
};


instance DIA_PAL_25000_GAROND_PERMEXITNW (C_Info)
{
	npc = pal_25000_garond;
	nr = 1;
	condition = dia_pal_25000_garond_permexitnw_condition;
	information = dia_pal_25000_garond_permexitnw_info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int pal_day_25000_garond_permexitnw_condition()
{
	return TRUE;
};

func void dia_pal_25000_garond_permexitnw_info()
{
	AI_Output(other,self, " DIA_PAL_25000_Garond_PermExitNW_01_01 " );	// How are things going?
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_donejoinothersagreed))
	{
		AI_Output(self,other, " DIA_PAL_25000_Garond_PermExitNW_01_06 " );	// Better... (belligerently) Lord Hagen has finally given the general order to march.
		AI_Output(self,other, " DIA_PAL_25000_Garond_PermExitNW_01_07 " );	// Soon we will have a big battle with the orcs, and I swear by Innos that now these creatures will definitely not be in trouble!
		AI_Output(other,self, " DIA_PAL_25000_Garond_PermExitNW_01_08 " );	// Let's hope it stays that way.
	}
	else
	{
		AI_Output(self,other, " DIA_PAL_25000_Garond_PermExitNW_01_02 " );	// Lord Hagen still hasn't decided to attack the orcs, and I don't understand why.
		AI_Output(self,other, " DIA_PAL_25000_Garond_PermExitNW_01_03 " );	// Perhaps he is waiting for a more convenient moment, but in my opinion - he has come a long time ago!
		AI_Output(other,self, " DIA_PAL_25000_Garond_PermExitNW_01_04 " );	// I don't think this will last long. I am sure that the paladins will still have their say in this war.
		AI_Output(self,other, " DIA_PAL_25000_Garond_PermExitNW_01_05 " );	// Be sure - it will. I swear by Innos!
	};
};

instance DIA_PAL_25000_Garond_VenzelDone(C_Info)
{
	npc = PAL_25000_Garond;
	nr = 2;
	condition = DIA_PAL_25000_Garond_VenzelDone_condition;
	information = DIA_PAL_25000_Garond_VenzelDone_info;
	permanent = FALSE;
	description = " I found out what happened to Wenzel. " ;
};

func int DIA_PAL_25000_Garond_VenzelDone_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (MIS_EscapeMine == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_PAL_25000_Garond_VenzelDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_PAL_25000_Garond_VenzelDone_01_01 " );	// I found out what happened to Wenzel.
	AI_Output(self,other, " DIA_PAL_25000_Garond_VenzelDone_01_02 " );	// Tell me everything you know. Is he alive?
	AI_Output(other,self, " DIA_PAL_25000_Garond_VenzelDone_01_03 " );	// Alive, but captured by orcs. They sent him to an iron mine to extract ore.
	AI_Output(self,other, " DIA_PAL_25000_Garond_VenzelDone_01_04 " );	// Praise Innos... (relieved) So, all is not lost! We must try to get him out of there.
	AI_Output(other,self, " DIA_PAL_25000_Garond_VenzelDone_01_05 " );	// This is no longer necessary. In the orc mine, I found a magical portal.
	AI_Output(other,self, " DIA_PAL_25000_Garond_VenzelDone_01_06 " );	// Wenzel, along with the rest of the slaves, will use it to escape from captivity.
	AI_Output(other,self, " DIA_PAL_25000_Garond_VenzelDone_01_07 " );	// However, there is a suspicion that the portal leads directly to the mainland.
	AI_Output(other,self, " DIA_PAL_25000_Garond_VenzelDone_01_08 " );	// Therefore, Wenzel asked me to tell you that most likely he will not return back to Khorinis.
	AI_Output(self,other, " DIA_PAL_25000_Garond_VenzelDone_01_09 " );	// Well, so be it. The main thing is that everything will be fine with him.
	AI_Output(other,self, " DIA_PAL_25000_Garond_VenzelDone_01_10 " );	// He said he would return to Myrtana and fight the orcs there.
	AI_Output(other,self, " DIA_PAL_25000_Garond_VenzelDone_01_11 " );	// Apparently, he was right when he said that the king is no better off there than you are.
	AI_Output(self,other, " DIA_PAL_25000_Garond_VenzelDone_01_12 " );	// Those damn orcs...(angrily) They've swept across the country like locusts!
	AI_Output(self,other, " DIA_PAL_25000_Garond_VenzelDone_01_13 " );	// But we will fight to the last! They just won't break us.
	AI_Output(self,other, " DIA_PAL_25000_Garond_VenzelDone_01_14 " );	// As for the situation on the mainland... (reluctantly) I won't lie to you! Yes it is.
	AI_Output(self,other, " DIA_PAL_25000_Garond_VenzelDone_01_15 " );	// The king is doing his best to hold back the hordes of orcs that have broken through from Nordmar.
	AI_Output(self,other, " DIA_PAL_25000_Garond_VenzelDone_01_16 " );	// But he's not good at it. There are too many orcs, and the king does not have enough people or weapons.
	AI_Output(self,other, " DIA_PAL_25000_Garond_VenzelDone_01_17 " );	// Therefore, all hope lies with us! With the help of magic ore, it may still be possible to turn the tide of the war.
	AI_Output(self,other, " DIA_PAL_25000_Garond_VenzelDone_01_18 " );	// But as you can see, we ourselves are struggling to fight off the orcs here.
	AI_Output(self,other, " DIA_PAL_25000_Garond_VenzelDone_01_19 " );	// I'm not used to giving up prematurely...(doomed) But it looks like we've already lost this war.
	AI_Output(self,other, " DIA_PAL_25000_Garond_VenzelDone_01_20 " );	// But don't you dare tell anyone about it!
	AI_Output(self,other, " DIA_PAL_25000_Garond_VenzelDone_01_21 " );	// I won't let my soldiers lose heart just because of some stupid speculation.
	AI_Output(other,self, " DIA_PAL_25000_Garond_VenzelDone_01_22 " );	// Of course.
	MIS_LostPaladins = LOG_Success;
	Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Success);
	B_LogEntry(TOPIC_LostPaladins, " I told Garond about Wenzel's fate. " );
};
