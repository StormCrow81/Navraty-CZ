instance DIA_Ass_393_Adept_EXIT(C_Info)
{
	npc = Ass_393_Adept;
	No. = 999 ;
	condition = DIA_Ass_393_Adept_exit_condition;
	information = DIA_Ass_393_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_393_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_393_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_393_Adept_Hello(C_Info)
{
	npc = Ass_393_Adept;
	no. = 1 ;
	condition = DIA_Ass_393_Adept_hello_condition;
	information = DIA_Ass_393_Adept_hello_info;
	permanent = FALSE ;
	description = " I have business with you. " ;
};
	
func int DIA_Ass_393_Adept_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_393_Adept_hello_info()
{
	AI_Output (other, self, " DIA_Ass_393_Adept_hello_01_01 " );	// I have business with you.
	AI_Output (self, other, " DIA_Ass_393_Adept_hello_01_02 " );	// Interesting. What's your business with Nazim?
	AI_Output (other, self, " DIA_Ass_393_Adept_hello_01_03 " );	// Would you like to work for Prior Osair?
	AI_Output (self, other, " DIA_Ass_393_Adept_hello_01_04 " );	// I would wash the feet of Beliar himself...
	AI_Output (self, other, " DIA_Ass_393_Adept_hello_01_05 " );	// ...if he gets me out of this damn hole.
	AI_Output (self, other, " DIA_Ass_393_Adept_hello_01_06 " );	// I'm sick of guarding these stinking animals!
	AI_Output (self, other, " DIA_Ass_393_Adept_hello_01_07 " );	// But Haniar will have my skin if I leave my post.
	AI_Output (other, self, " DIA_Ass_393_Adept_hello_01_08 " );	// Maybe I can fix your problem.
	AI_Output (self, other, " DIA_Ass_393_Adept_hello_01_09 " );	// You get me out of here and I will forever be in your debt.
	NazimNeedGetOutCave = TRUE;
	B_LogEntry (TOPIC_CareOsair, " Nazim wants to get out of the mine. If I help him, he's ready to work for Osair. I think it's worth talking to Haniar about this. " );
};

instance DIA_Ass_393_Adept_GetOutCave(C_Info)
{
	npc = Ass_393_Adept;
	no. = 1 ;
	condition = DIA_Ass_393_Adept_GetOutCave_condition;
	information = DIA_Ass_393_Adept_GetOutCave_info;
	permanent = FALSE ;
	description = " I just talked to Haniar ... " ;
};
	
func int DIA_Ass_393_Adept_GetOutCave_condition()
{
	if((MIS_CareOsair == LOG_Running) && ((NazimPissOff == TRUE) || (NazimGetOutCave == TRUE) || (NazimStayInCave == TRUE)))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_393_Adept_GetOutCave_info()
{
	AI_Output (other, self, " DIA_Ass_393_Adept_GetOutCave_01_01 " );	// I just talked to Haniar ...

	if (NazimPissOff ==  TRUE )
	{
		AI_Output (self, other, " DIA_Ass_393_Adept_GetOutCave_01_02 " );	// (angrily) I've already heard!
		AI_Output (self, other, " DIA_Ass_393_Adept_GetOutCave_01_03 " );	// And now, thanks to you, I will be stuck in this cave for the rest of my life!
		AI_Output (self, other, " DIA_Ass_393_Adept_GetOutCave_01_04 " );	// So try not to let mee see you again.
		AI_Output (self, other, " DIA_Ass_393_Adept_GetOutCave_01_05 " );	// Otherwise, I won't be responsible for my actions!
		B_LogEntry (TOPIC_CareOsair, " Now Nazim doesn't even want to see me. Not to mention listening. " );
	}
	else if(NazimStayInCave == TRUE)
	{
		B_GivePlayerXP(100);
		AI_Output(self,other,"DIA_Ass_393_Adept_GetOutCave_01_06");	//And what did he say?
		AI_Output (other, self, " DIA_Ass_393_Adept_GetOutCave_01_07 " );	// You will have to spend a little more time in this mine.
		AI_Output (self, other, " DIA_Ass_393_Adept_GetOutCave_01_08 " );	// I thought so. That old bastard will drive me to my grave.
		AI_Output (self, other, " DIA_Ass_393_Adept_GetOutCave_01_09 " );	// Okay, Beliar is with him! But you gave me a great idea about joining Prior Osair.
		AI_Output (self, other, " DIA_Ass_393_Adept_GetOutCave_01_10 " );	// The main thing is to get out of here quickly. And then I'll take care of everything myself!
		B_LogEntry (TOPIC_CareOsair, " I was not able to help Nazim. Now I can hardly lure him over to Osair's side. Although this is not required - Nazim decided to change his mentor. Everything turned out well. " );
	}
	else if(NazimGetOutCave == TRUE)
	{
		B_GivePlayerXP(1000);
		AI_Output (other, self, " DIA_Ass_393_Adept_GetOutCave_01_11 " );	// You can leave your post in the mine.
		AI_Output (self, other, " DIA_Ass_393_Adept_GetOutCave_01_12 " );	// (incredulous) Is this true? Has Haniar finally had mercy on me?
		AI_Output (other, self, " DIA_Ass_393_Adept_GetOutCave_01_13 " );	// Yes, that's true. And if you do not want to find yourself here again, you better take advantage of my offer.
		AI_Output (self, other, " DIA_Ass_393_Adept_GetOutCave_01_14 " );	// About working for Prior Osair?
		AI_Output(other,self,"DIA_Ass_393_Adept_GetOutCave_01_15");	//Exactly.
		AI_Output (self, other, " DIA_Ass_393_Adept_GetOutCave_01_16 " );	// Hmmm ... (thoughtfully) I guess I will. I heard that people swim in luxury with him.
		AI_Output (self, other, " DIA_Ass_393_Adept_GetOutCave_01_17 " );	// So I'll go to him now. Thanks for your help, brother.
		B_LogEntry (TOPIC_CareOsair, " I got Nazim out of the mine, and only because Haniar was interested in it too. " );
		Npc_ExchangeRoutine(self,"WaitInOsairCave");
	};

	NazimKnowAboutCave = TRUE ;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_393_Adept_NazimPissOff (C_Info)
{
	npc = Ass_393_Adept;
	no. = 1 ;
	condition = DIA_Ass_393_Adept_NazimPissOff_condition;
	information = DIA_Ass_393_Adept_NazimPissOff_info;
	permanent = TRUE;
	important = TRUE;
};
	
func int DIA_Ass_393_Adept_NazimPissOff_condition ()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Ass_393_Adept_GetOutCave) && (NazimPissOff == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_393_Adept_NazimPissOff_info ()
{
	AI_Output (self, other, " DIA_Ass_393_Adept_NazimPissOff_01_01 " );	// I warned you...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};
