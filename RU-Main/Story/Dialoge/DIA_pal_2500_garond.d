

instance DIA_PAL_2500_GAROND_EXIT(C_Info)
{
	npc = pal_2500_garond;
	nr = 999;
	condition = dia_pal_2500_garond_exit_condition;
	information = dia_pal_2500_garond_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2500_garond_exit_condition()
{
	return TRUE;
};

func void dia_pal_2500_garond_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2500_GAROND_EXITNW(C_Info)
{
	npc = pal_2500_garond;
	nr = 1;
	condition = dia_pal_2500_garond_exitnw_condition;
	information = dia_pal_2500_garond_exitnw_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_2500_garond_exitnw_condition()
{
	return TRUE;
};

func void dia_pal_2500_garond_exitnw_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_PAL_2500_Garond_ExitNW_01_00 " );	// What's the problem?
	AI_Output(self,other, " DIA_PAL_2500_Garond_ExitNW_01_01 " );	// (breathing) I didn't think that the exit from the valley was so well guarded!
	AI_Output(other,self, " DIA_PAL_2500_Garond_ExitNW_01_02 " );	// Yeah, there really are a lot of orcs here now! Almost the entire valley is swarming with their patrols.
	AI_Output(self,other, " DIA_PAL_2500_Garond_ExitNW_01_03 " );	// Really? (anxiously) It turns out that the situation here now is not much better than in the Valley of Mines. And what about the city?
	AI_Output(other,self, " DIA_PAL_2500_Garond_ExitNW_01_06 " );	// Khorinis has fallen! Orcs are in charge now.
	AI_Output(self,other, " DIA_PAL_2500_Garond_ExitNW_01_07 " );	// Oh, Innos! The worst news I could not hear from you. Although he assumed that after the capture of the castle, they are unlikely to stop.
	AI_Output(other,self, " DIA_PAL_2500_Garond_ExitNW_01_08 " );	// As far as I know, the orcs stormed the city in just one day, and staged a real massacre there, killing all its inhabitants.
	AI_Output(other,self, " DIA_PAL_2500_Garond_ExitNW_01_09 " );	// Only Lord Hagen with the remnants of his garrison, and a few other lucky ones managed to get out of this trap. All the rest are dead!
	AI_Output(self,other, " DIA_PAL_2500_Garond_ExitNW_01_10 " );	// (angrily) Vile creatures! I wonder how much more of our blood they need to shed to finally calm down?
	AI_Output(self,other, " DIA_PAL_2500_Garond_ExitNW_01_13 " );	// And where is Hagen and his people now?
	AI_Output(other,self, " DIA_PAL_2500_Garond_ExitNW_01_14 " );	// They retreated to positions in Fort Azgan and took up defensive positions there. I think you should do the same.
	AI_Output(self,other, " DIA_PAL_2500_Garond_ExitNW_01_15 " );	// (angrily) Well, to be honest, retreating is not exactly my style.
	AI_Output(other,self, " DIA_PAL_2500_Garond_ExitNW_01_16 " );	// I'm afraid you have no other choice now.
	AI_Output(other,self, " DIA_PAL_2500_Garond_ExitNW_01_17 " );	// Your people are completely exhausted. They just need a little break right now.
	AI_Output(other,self, " DIA_PAL_2500_Garond_ExitNW_01_19 " );	// So take my advice and go to Azgan to Lord Hagen. You are needed there now.
	AI_Output(self,other, " DIA_PAL_2500_Garond_ExitNW_01_20 " );	// Okay. Perhaps you are indeed right, and we should not rush.
	AI_Output(self,other, " DIA_PAL_2500_Garond_ExitNW_01_21 " );	// Although if I had under my command now, even if only a hundred valiant knights, I would show these creatures what it means to be a paladin!
	AI_Output(self,other, " DIA_PAL_2500_Garond_ExitNW_01_24 " );	// (seriously) Good. We're going to the fort. Just a little rest after the battle.
	GARONDGOFORT = TRUE ;
	if(MIS_RESCUEGAROND == LOG_Running)
	{
		) ; _ _ _ _ _
	};
	AI_StopProcessInfos(self);
};

instance DIA_PAL_2500_GAROND_PERMEXITNW (C_Info)
{
	npc = pal_2500_garond;
	nr = 1;
	condition = dia_pal_2500_garond_permexitnw_condition;
	information = dia_pal_2500_garond_permexitnw_info;
	permanent = TRUE;
	important = TRUE;
};

func int pal_day_2500_garond_permexitnw_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_pal_2500_garond_exitnw ) && Npc_IsInState ( self , ZS_Talk ) && ( HAGENOTHERSAGREEMENT  ==  FALSE ) && ( MIS_LostPaladins == LOG_Success )) .
	{
		return TRUE;
	};
};

func void dia_pal_2500_garond_permexitnw_info()
{
	AI_Output(self,other, " DIA_PAL_2500_Garond_PermExitNW_01_01 " );	// See you at the fort, mate!
	AI_Output(other,self, " DIA_PAL_2500_Garond_PermExitNW_01_02 " );	// Of course.
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2500_Garond_VenzelDone(C_Info)
{
	npc = PAL_2500_Garond;
	nr = 2;
	condition = DIA_PAL_2500_Garond_VenzelDone_condition;
	information = DIA_PAL_2500_Garond_VenzelDone_info;
	permanent = FALSE;
	description = " I found out what happened to Wenzel. " ;
};

func int DIA_PAL_2500_Garond_VenzelDone_condition()
{
	if((MIS_LostPaladins == LOG_Running) && (MIS_EscapeMine == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_PAL_2500_Garond_VenzelDone_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_PAL_2500_Garond_VenzelDone_01_01 " );	// I found out what happened to Wenzel.
	AI_Output(self,other, " DIA_PAL_2500_Garond_VenzelDone_01_02 " );	// Tell me everything you know. Is he alive?
	AI_Output(other,self, " DIA_PAL_2500_Garond_VenzelDone_01_03 " );	// Alive, but captured by orcs. They sent him to an iron mine to extract ore.
	AI_Output(self,other, " DIA_PAL_2500_Garond_VenzelDone_01_04 " );	// Praise Innos... (relieved) So, all is not lost! We must try to get him out of there.
	AI_Output(other,self, " DIA_PAL_2500_Garond_VenzelDone_01_05 " );	// This is no longer necessary. In the orc mine, I found a magical portal.
	AI_Output(other,self, " DIA_PAL_2500_Garond_VenzelDone_01_06 " );	// Wenzel, along with the rest of the slaves, will use it to escape from captivity.
	AI_Output(other,self, " DIA_PAL_2500_Garond_VenzelDone_01_07 " );	// However, there is a suspicion that the portal leads directly to the mainland.
	AI_Output(other,self, " DIA_PAL_2500_Garond_VenzelDone_01_08 " );	// Therefore, Wenzel asked me to tell you that most likely he will not return back to Khorinis.
	AI_Output(self,other, " DIA_PAL_2500_Garond_VenzelDone_01_09 " );	// Well, so be it. The main thing is that everything will be fine with him.
	AI_Output(other,self, " DIA_PAL_2500_Garond_VenzelDone_01_10 " );	// He said he would return to Myrtana and fight the orcs there.
	AI_Output(other,self, " DIA_PAL_2500_Garond_VenzelDone_01_11 " );	// Apparently, he was right when he said that the king is no better off there than you are.
	AI_Output(self,other, " DIA_PAL_2500_Garond_VenzelDone_01_12 " );	// Those damn orcs...(angrily) They've swept across the country like locusts!
	AI_Output(self,other, " DIA_PAL_2500_Garond_VenzelDone_01_13 " );	// But we will fight to the last! They just won't break us.
	AI_Output(self,other, " DIA_PAL_2500_Garond_VenzelDone_01_14 " );	// As for the situation on the mainland... (reluctantly) I won't lie to you! Yes it is.
	AI_Output(self,other, " DIA_PAL_2500_Garond_VenzelDone_01_15 " );	// The king is doing his best to hold back the hordes of orcs that have broken through from Nordmar.
	AI_Output(self,other, " DIA_PAL_2500_Garond_VenzelDone_01_16 " );	// But he's not good at it. There are too many orcs, and the king does not have enough people or weapons.
	AI_Output(self,other, " DIA_PAL_2500_Garond_VenzelDone_01_17 " );	// Therefore, all hope lies with us! Perhaps with the help of magic ore, there is still a chance to turn the tide of the war.
	AI_Output(self,other, " DIA_PAL_2500_Garond_VenzelDone_01_18 " );	// But, as you can see, we ourselves here are hardly fighting off the orcs.
	AI_Output(self,other, " DIA_PAL_2500_Garond_VenzelDone_01_19 " );	// I'm not used to giving up prematurely...(doomed) But it looks like we've already lost this war.
	AI_Output(self,other, " DIA_PAL_2500_Garond_VenzelDone_01_20 " );	// But don't you dare tell anyone about it!
	AI_Output(self,other, " DIA_PAL_2500_Garond_VenzelDone_01_21 " );	// I won't let my soldiers lose heart just because of some stupid speculation.
	AI_Output(other,self, " DIA_PAL_2500_Garond_VenzelDone_01_22 " );	// Of course.
	MIS_LostPaladins = LOG_Success;
	Log_SetTopicStatus(TOPIC_LostPaladins,LOG_Success);
	B_LogEntry(TOPIC_LostPaladins, " I told Garond about Wenzel's fate. " );
};
