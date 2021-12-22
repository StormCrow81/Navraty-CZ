instance DIA_Ass_394_Adept_EXIT(C_Info)
{
	npc = Ass_394_Adept;
	No. = 999 ;
	condition = DIA_Ass_394_Adept_exit_condition;
	information = DIA_Ass_394_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_394_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_394_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_394_Adept_Hello(C_Info)
{
	npc = Ass_394_Adept;
	no. = 1 ;
	condition = DIA_Ass_394_Adept_hello_condition;
	information = DIA_Ass_394_Adept_hello_info;
	permanent = FALSE ;
	description = "Кудир?";
};
	
func int DIA_Ass_394_Adept_hello_condition()
{
	if(MIS_CareOsair == LOG_Running)
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_394_Adept_hello_info()
{
	AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_01");	//Kudir?
	AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_02 " );	// Yes, it's me. What brings you to me, brother?
	AI_Output (other, self, " DIA_Ass_394_Adept_hello_01_03 " );	// You were pretty hard to find.
	AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_04 " );	// Purposefully. You're lucky that you were able to find me here. Usually I rarely go to the temple.
	AI_Output (other, self, " DIA_Ass_394_Adept_hello_01_05 " );	// What are you doing?

	if(NrozasIsDead == FALSE)
	{
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_06 " );	// Mainly I collect rare herbs and ingredients for Master Nrozas.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_07 " );	// But this valley isn't exactly covered in rare specimens.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_08 " );	// So I usually travel all over the island.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_09 " );	// By the way, why were you looking for me?
		AI_Output (other, self, " DIA_Ass_394_Adept_hello_01_10 " );	// I have a proposition for you.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_11");	//Yeah?
		AI_Output (other, self, " DIA_Ass_394_Adept_hello_01_12 " );	// Prior Osair is looking for new people. I thought you might be interested.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_13 " );	// (arrogantly) Osair? Hmmm. I'm afraid you're barking up the wrong tree, brother.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_14 " );	// I already work for Prior Nrozas. And so far, the arrangement suits me just fine.
		AI_Output (other, self, " DIA_Ass_394_Adept_hello_01_15 " );	// Can I somehow convince you?
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_16 " );	// Hmmm. I've heard about you. You're a real go getter.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_17 " );	// There is something I want.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_18 " );	// So, if you can get it for me, we might just have a deal.
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_19");	//What exactly are we talking about?
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_20 " );	// One very rare plant. It's called Troll Cherry.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_21 " );	// I've tried to find it myself many times, but no luck.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_22 " );	// As the name suggests, it should grow in a troll habitat.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_23 " );	// But I,m not as young, and therfore not as crazy, as I once was!
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_24 " );	// You seem resourceful enough. Gonna give it a try?
		AI_Output (other, self, " DIA_Ass_394_Adept_hello_01_25 " );	// Ok, I'll see what I can do.
		KudirNeedTrollPlant = TRUE;
		B_LogEntry (TOPIC_CareOsair, " Kudir asked me to find a rare plant for him - troll cherry. Then he will agree to work for Osair. " );
		AI_StopProcessInfos(self);
		Wld_InsertItem(ITPL_SUPER_HERB,"FP_ITEMSPAWN_KUDIR_PLANT");
	}
	else
	{
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_26 " );	// Mainly I collect rare herbs and ingredients for Master Nrozas.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_27 " );	// But now I work for Prior Haniar. I do various jobs for him.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_28 " );	// By the way, why were you looking for me?
		AI_Output (other, self, " DIA_Ass_394_Adept_hello_01_29 " );	// I have a proposition for you.
		AI_Output(self,other,"DIA_Ass_394_Adept_hello_01_30");	//Yeah?
		AI_Output (other, self, " DIA_Ass_394_Adept_hello_01_31 " );	// Prior Osair is looking for new people. I thought you might be interested.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_32 " );	// (arrogantly) Osair? Hmmm. I'm afraid you're barking up the wrong tree, brother.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_33 " );	// That would be the last thing Id ever want to do.
		AI_Output(other,self,"DIA_Ass_394_Adept_hello_01_34");	//Why?
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_35 " );	// Because you never know what to expect from him. A real viper, that one.
		AI_Output (self, other, " DIA_Ass_394_Adept_hello_01_36 " );	// I never trusted him - and I don't advise you do either.
		
		KudirPissOff = TRUE;
		B_LogEntry (TOPIC_CareOsair, " Kudir now works for Prior Haniar. He is unlikely to agree to my proposal. " );
		AI_StopProcessInfos(self);
	};

};

instance DIA_Ass_394_Adept_GetPlant(C_Info)
{
	npc = Ass_394_Adept;
	no. = 1 ;
	condition = DIA_Ass_394_Adept_GetPlant_condition;
	information = DIA_Ass_394_Adept_GetPlant_info;
	permanent = FALSE ;
	description = " I brought you troll cherries. " ;
};
	
func int DIA_Ass_394_Adept_GetPlant_condition()
{
	if((MIS_CareOsair == LOG_Running) && (KudirNeedTrollPlant == TRUE) && (Npc_HasItems(other,ITPL_SUPER_HERB) >= 1))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_394_Adept_GetPlant_info()
{
	B_GivePlayerXP(300);
	AI_Output (other, self, " DIA_Ass_394_Adept_GetPlant_01_01 " );	// I brought you troll cherries.
	AI_Output (self, other, " DIA_Ass_394_Adept_GetPlant_01_02 " );	// You actually found some?
	AI_Output (other, self, " DIA_Ass_394_Adept_GetPlant_01_03 " );	// Naturally. Here.
	B_GiveInvItems(other,self,ITPL_SUPER_HERB,1);
	Npc_RemoveInvItems(self,ITPL_SUPER_HERB,1);
	AI_Output (self, other, " DIA_Ass_394_Adept_GetPlant_01_04 " );	// Great! Well, you've fulfilled your end of the bargain.
	AI_Output (self, other, " DIA_Ass_394_Adept_GetPlant_01_05 " );	// Now it's time for me to keep mine.
	AI_Output (self, other, " DIA_Ass_394_Adept_GetPlant_01_06 " );	// So you can tell Osair that I am his man from now on.
	KudirGetTrollPlant = TRUE;
	B_LogEntry (TOPIC_CareOsair, " I brought the troll cherries to Kudir. He is Osair's man now. " );
	AI_StopProcessInfos(self);
};


instance DIA_Ass_394_Adept_KadirPissOff(C_Info)
{
	npc = Ass_394_Adept;
	no. = 1 ;
	condition = DIA_Ass_394_Adept_KadirPissOff_condition;
	information = DIA_Ass_394_Adept_KadirPissOff_info;
	permanent = TRUE;
	important = TRUE;
};
	
func int DIA_Ass_394_Adept_KadirPissOff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KudirPissOff == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_394_Adept_KadirPissOff_info()
{
	AI_Output (self, other, " DIA_Ass_394_Adept_KadirPissOff_01_01 " );	// Sorry, brother, I'm busy.
	AI_StopProcessInfos(self);
};
