instance DIA_Ass_392_Adept_EXIT(C_Info)
{
	npc = Ass_392_Adept;
	No. = 999 ;
	condition = DIA_Ass_392_Adept_exit_condition;
	information = DIA_Ass_392_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_392_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_392_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_392_Adept_Hello(C_Info)
{
	npc = Ass_392_Adept;
	no. = 1 ;
	condition = DIA_Ass_392_Adept_hello_condition;
	information = DIA_Ass_392_Adept_hello_info;
	permanent = FALSE ;
	description = "Кто ты?";
};
	
func int DIA_Ass_392_Adept_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_392_Adept_hello_info()
{
	AI_Output(other,self,"DIA_Ass_392_Adept_hello_01_01");	//Who are you?
	AI_Output (self, other, " DIA_Ass_392_Adept_hello_01_02 " );	// My name is Rafat, brother.
	AI_Output (other, self, " DIA_Ass_392_Adept_hello_01_03 " );	// I haven't seen you in the temple before.
	AI_Output (self, other, " DIA_Ass_392_Adept_hello_01_04 " );	// I spend almost all of my time in prayer at Beliar's altar in the valley.
	AI_Output (other, self, " DIA_Ass_392_Adept_hello_01_05 " );	// Why don't you pray in the temple?
	AI_Output (self, other, " DIA_Ass_392_Adept_hello_01_06 " );	// Um ... that's a long story, brother.
	AI_Output (other, self, " DIA_Ass_392_Adept_hello_01_07 " );	// I'm ready to listen?
	AI_Output (self, other, " DIA_Ass_392_Adept_hello_01_08 " );	// I'm not allowed to pray there.
	AI_Output(other,self,"DIA_Ass_392_Adept_hello_01_09");	//Why not?
	AI_Output (self, other, " DIA_Ass_392_Adept_hello_01_10 " );	// Because Prior Haniar has forbidden me to until my spirit is worthy of it.
	AI_Output (other, self, " DIA_Ass_392_Adept_hello_01_11 " );	// It seems like you've done something wrong in his eyes.
	AI_Output (self, other, " DIA_Ass_392_Adept_hello_01_12 " );	// Yes, you're right. But I don’t want to talk about it.
};

instance DIA_Ass_392_Adept_Deal(C_Info)
{
	npc = Ass_392_Adept;
	no. = 1 ;
	condition = DIA_Ass_392_Adept_Deal_condition;
	information = DIA_Ass_392_Adept_Deal_info;
	permanent = FALSE ;
	description = " Do you work for Prior Haniar? " ;
};
	
func int DIA_Ass_392_Adept_Deal_condition()
{
	if(Npc_KnowsInfo(other,DIA_Ass_392_Adept_hello) && (MIS_CareOsair == LOG_Running))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_392_Adept_Deal_info()
{
	AI_Output (other, self, " DIA_Ass_392_Adept_Deal_01_01 " );	// Do you work for Prior Haniar?
	AI_Output (self, other, " DIA_Ass_392_Adept_Deal_01_02 " );	// Not really. Haniar is only my spiritual guide.
	AI_Output (self, other, " DIA_Ass_392_Adept_Deal_01_03 " );	// Though I now regret it. Especially after that incident with Hasim.
	AI_Output (other, self, " DIA_Ass_392_Adept_Deal_01_04 " );	// Have you thought about changing your mentor?
	AI_Output (self, other, " DIA_Ass_392_Adept_Deal_01_05 " );	// I don't think that any of the priors will want to take me under their protection.
	AI_Output (self, other, " DIA_Ass_392_Adept_Deal_01_06 " );	// Besides, Haniar will be furious if he finds out.
	AI_Output (other, self, " DIA_Ass_392_Adept_Deal_01_07 " );	// I heard that Prior Osair needs loyal people like you.
	AI_Output (self, other, " DIA_Ass_392_Adept_Deal_01_08 " );	// Are you serious? Or are you testing me?
	AI_Output (other, self, " DIA_Ass_392_Adept_Deal_01_09 " );	// There's a chance her. Don't let it pass you by.
	AI_Output (other, self, " DIA_Ass_392_Adept_Deal_01_10 " );	// Under Osair you will be allowed to pray in the temple again.
	AI_Output (self, other, " DIA_Ass_392_Adept_Deal_01_11 " );	// Hmmm ... (thoughtfully) That would be great!
	AI_Output (self, other, " DIA_Ass_392_Adept_Deal_01_12 " );	// But I can't do anything until I'm positive you're right.
	AI_Output (other, self, " DIA_Ass_392_Adept_Deal_01_13 " );	// What if I talk to Osair and he gives permission?
	AI_Output (self, other, " DIA_Ass_392_Adept_Deal_01_14 " );	// Then I'll take him as my mentor.
	AI_Output (self, other, " DIA_Ass_392_Adept_Deal_01_15 " );	// But not before.
	AI_Output (other, self, " DIA_Ass_392_Adept_Deal_01_16 " );	// Ok, I understand.
	RafatNeedPermission = TRUE;
	B_LogEntry (TOPIC_CareOsair, " Rafat wants to pray in the temple again, but without the permission of one of the priors, he cannot do it. I need to talk about this with Osair. " );
};

instance DIA_Ass_392_Adept_Deal_Done(C_Info)
{
	npc = Ass_392_Adept;
	no. = 1 ;
	condition = DIA_Ass_392_Adept_Deal_Done_condition;
	information = DIA_Ass_392_Adept_Deal_Done_info;
	permanent = FALSE ;
	description = " You can now pray in the temple. " ;
};
	
func int DIA_Ass_392_Adept_Deal_Done_condition()
{
	if((MIS_CareOsair == LOG_Running) && (RafatGetPermission == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_392_Adept_Deal_Done_info()
{
	B_GivePlayerXP(400);
	AI_Output (other, self, " DIA_Ass_392_Adept_Deal_Done_01_01 " );	// You can now pray in the temple.
	AI_Output (self, other, " DIA_Ass_392_Adept_Deal_Done_01_02 " );	// (incredulous) Are you serious?
	AI_Output (other, self, " DIA_Ass_392_Adept_Deal_Done_01_03 " );	// Prior Osair gave his permission. You don't have to worry about anything.
	AI_Output (self, other, " DIA_Ass_392_Adept_Deal_Done_01_04 " );	// Well, then, perhaps, it is worth repaying him in kind.
	B_LogEntry (TOPIC_CareOsair, " Rafat can now pray in the temple with the permission of Osair. The priors ranks of loyal men is filling quickly. " );
	RafatAgreed = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"PrayInHram");
};
