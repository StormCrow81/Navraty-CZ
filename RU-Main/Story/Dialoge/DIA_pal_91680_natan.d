

instance DIA_PAL_91680_NATAN_EXIT(C_Info)
{
	npc = pal_91680_natan;
	nr = 999;
	condition = dia_pal_91680_natan_exit_condition;
	information = dia_pal_91680_natan_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_91680_natan_exit_condition()
{
	return TRUE;
};

func void dia_pal_91680_natan_exit_info()
{
	AI_StopProcessInfos(self);
};


instances DIA_PAL_91680_NATAN_PERM (C_Info)
{
	npc = pal_91680_natan;
	nr = 1;
	condition = dia_pal_91680_natan_perm_condition;
	information = dia_pal_91680_natan_perm_info;
	permanent = FALSE;
	description = " What are you thinking of doing? " ;
};


func int dia_pal_91680_natan_perm_condition()
{
	if ( HAGENOTHERSAGREED  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_pal_91680_natan_perm_info()
{
	AI_Output(other,self, " DIA_Pal_91680_Natan_Perm_01_00 " );	// What are you thinking of doing?
	AI_Output(self,other, " DIA_Pal_91680_Natan_Perm_01_01 " );	// I guess we'll go to the fort. It's too dangerous to stay here now!
	AI_Output(self,other, " DIA_Pal_91680_Natan_Perm_01_02 " );	// In addition, I need to report to Lord Hagen about the current situation in the Valley of Mines as soon as possible.
	AI_Output(self,other, " DIA_Pal_91680_Natan_Perm_01_03 " );	// He needs to know what's going on there now!
	AI_Output(other,self, " DIA_Pal_91680_Natan_Perm_01_04 " );	// Good! Then follow your orders, soldier.
};


instance DIA_PAL_91680_NATAN_UDAR (C_Info)
{
	npc = pal_91680_natan;
	nr = 1;
	condition = dia_pal_91680_natan_udar_condition;
	information = dia_pal_91680_natan_udar_info;
	permanent = FALSE;
	description = " Paladin Strike is with us again! " ;
};


func int dia_pal_91680_previous_udar_condition()
{
	if (( MIS_NATANDOLG  == LOG_Running) &&  ! Npc_IsDead(pal_2680_udar))
	{
		return TRUE;
	};
};

func void pal_day_91680_natan_udar_info()
{
	AI_Output(other,self, " DIA_Pal_91680_Natan_Udar_01_00 " );	// Paladin Strike is back with us!
	AI_Output(self,other, " DIA_Pal_91680_Natan_Udar_01_01 " );	// Fortunately, yes. Of course, I'm very happy!
	AI_Output(self,other, " DIA_Pal_91680_Natan_Udar_01_02 " );	// If he died, I'd probably go crazy.
	AI_Output(other,self, " DIA_Pal_91680_Natan_Udar_01_03 " );	// Then I guess you've already done enough to fulfill your vow of honor towards him.
	AI_Output(self,other, " DIA_Pal_91680_Natan_Udar_01_04 " );	// I'm afraid that's not entirely true. After all, I still really did nothing for him!
	AI_Output(other,self, " DIA_Pal_91680_Natan_Udar_01_05 " );	// But you fought the orcs, helping him get out of the Valley of Mines. Is this not enough?
	AI_Output(self,other, " DIA_Pal_91680_Natan_Udar_01_06 " );	// Certainly not enough. You see, all my life I've been doing nothing but fighting these vile creatures.
	AI_Output(self,other, " DIA_Pal_91680_Natan_Udar_01_07 " );	// And, frankly, I don't see much merit in this! This is my sacred duty as a paladin, mine and many other guys.
	AI_Output(self,other, " DIA_Pal_91680_Natan_Udar_01_08 " );	// And the Impact saved my life! This is an exceptional move! And I have to do something similar for him.
	AI_Output(self,other, " DIA_Pal_91680_Natan_Udar_01_09 " );	// And stop trying to calm or convince me!
	AI_Output(other,self, " DIA_Pal_91680_Natan_Udar_01_10 " );	// M-yes... In general, everything is clear.
};


instances DIA_PAL_91680_NATAN_ZASADA (C_Info)
{
	npc = pal_91680_natan;
	nr = 900;
	condition = dia_pal_91680_natan_zasada_condition;
	information = dia_pal_91680_natan_zasada_info;
	permanent = FALSE;
	description = " (distract by talking...) " ;
};


func int pal_day_91680_natan_zasada_condition()
{
	if (( MY_NATANDOLG  == LOG_Running ) && ( EXTERNAL ORCSTRAP  ==  TRUE ) && ( EXTERNAL ORCSTRAPDONE  ==  FALSE ) &&  ! Npc_IsDead(pal_2680_external)) .
	{
		return TRUE;
	};
};

func void pal_day_91680_natan_zasada_info()
{
	PlayVideo("RET2_BlackScreen.bik");
	UDARORCSTRAPDONE = TRUE;
	AI_Teleport(pal_2680_stroke, " NW_STROKE_PRINCIPLE " );
	Wld_InsertNpc(orkelite_udar,"FP_ROAM_ZASADAORCS_01");
	Wld_InsertNpc(orcwarrior_udar_01,"FP_ROAM_ZASADAORCS_02");
	Wld_InsertNpc(orcwarrior_udar_02,"FP_ROAM_ZASADAORCS_03");
	Wld_InsertNpc(orcwarrior_udar_03,"FP_ROAM_ZASADAORCS_04");
	Wld_InsertNpc(orcwarrior_udar_04,"FP_ROAM_ZASADAORCS_05");
	Wld_InsertNpc(orcwarrior_udar_05,"FP_ROAM_ZASADAORCS_06");
	AI_StopProcessInfos(self);
};


instances DIA_PAL_91680_NATAN_WHEREUDAR (C_Info)
{
	npc = pal_91680_natan;
	nr = 1;
	condition = dia_pal_91680_natan_whereudar_condition;
	information = dia_pal_91680_natan_whereudar_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_91680_natan_whereudar_condition()
{
	if (( MY_NATANDOLG  == LOG_Running) &&  ! Npc_IsDead(pal_2680_udar) && ( UDAORCSTRAPDONE  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_pal_91680_natan_whereudar_info()
{
	AI_Output(self,other, " DIA_Pal_91680_Natan_WhereUdar_01_00 " );	// (excited) Wait, wait! While we were chatting here, I did not notice at all that the paladin Strike had disappeared somewhere.
	AI_Output(self,other, " DIA_Pal_91680_Natan_WhereUdar_01_01 " );	// Do you happen to know where he is?
	AI_Output(other,self, " DIA_Pal_91680_Natan_WhereUdar_01_02 " );	// Looks like he was going to hunt some orcs.
	AI_Output(self,other, " DIA_Pal_91680_Natan_WhereUdar_01_03 " );	// At the orcs, alone?! But it's damn dangerous!
	AI_Output(self,other, " DIA_Pal_91680_Natan_WhereUdar_01_04 " );	// I guess he thought it was a good idea to finish off a couple of those nasty things.
	AI_Output(self,other, " DIA_Pal_91680_Natan_WhereUdar_01_05 " );	// Damn! And what was he thinking? He could easily die. Oh, idiot, how could I let this happen?
	AI_Output(self,other, " DIA_Pal_91680_Natan_WhereUdar_01_06 " );	// Nothing to lament, we need to find it. Where exactly did he go?
	AI_Output(other,self, " DIA_Pal_91680_Natan_WhereUdar_01_07 " );	// I believe that somewhere in the direction of Orlan's tavern. As he said, there is a great place for an ambush nearby.
	AI_Output(self,other, " DIA_Pal_91680_Natan_WhereUdar_01_08 " );	// Can you take me there?
	AI_Output(other,self, " DIA_Pal_91680_Natan_WhereUdar_01_09 " );	// Okay! Follow me.
	AI_Output(self,other, " DIA_Pal_91680_Natan_WhereUdar_01_10 " );	// Okay, drive on.
	B_LogEntry( TOPIC_NATANDOLG , " As expected, Nathan was very dismayed to learn that Impact had gone hunting orcs alone and asked me to help find his comrade. " );
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Npc_ExchangeRoutine(self,"Follow");
	AI_StopProcessInfos(self);
};


instances DIA_PAL_91680_NATAN_WHEREUDARDONE (C_Info)
{
	npc = pal_91680_natan;
	nr = 1;
	condition = dia_pal_91680_natan_whereudardone_condition;
	information = dia_pal_91680_natan_whereudardone_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_91680_natan_whereudardone_condition()
{
	if (( MY_NATANDOF  == LOG_Running) && ( EXTERIORORCSTRAPISDONE  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_pal_91680_natan_whereudardone_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_Pal_91680_Natan_WhereUdarDone_01_00 " );	// (excited) Good thing we made it. A slight delay - and he would be dead!
	AI_Output(other,self, " DIA_Pal_91680_Natan_WhereUdarDone_01_01 " );	// But, as you can see, everything worked out! By the way, I think that now the paladin Strike is in your debt - after all, you actually saved his life.
	AI_Output(self,other, " DIA_Pal_91680_Natan_WhereUdarDone_01_02 " );	// I don't even know... It all happened so fast. I didn't even drag him on my own hump with orcs on my tail.
	AI_Output(other,self, " DIA_Pal_91680_Natan_WhereUdarDone_01_03 " );	// The main thing is that you fulfilled your vow of honor, but how it happened is no longer important.
	AI_Output(self,other, " DIA_Pal_91680_Natan_WhereUdarDone_01_04 " );	// Well, yes, you're right... (smiles) Well, thanks for the help. Hope to see you again!
	AI_Output(other,self, " DIA_Pal_91680_Natan_WhereUdarDone_01_05 " );	// Of course.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"Start");
	MIS_NATANDOLG = LOG_SUCCESS ;
	Log_SetTopicStatus(TOPIC_NATANDOLG,LOG_SUCCESS);
	AI_StopProcessInfos(self);
};

