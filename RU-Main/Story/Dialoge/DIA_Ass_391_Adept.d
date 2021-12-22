var int FazimRefuseTalk;
var int FazimFirstMeet;


instance DIA_Ass_391_Adept_EXIT(C_Info)
{
	npc = Ass_391_Adept;
	No. = 999 ;
	condition = DIA_Ass_391_Adept_exit_condition;
	information = DIA_Ass_391_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_391_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_391_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_391_Adept_Hello(C_Info)
{
	npc = Ass_391_Adept;
	no. = 1 ;
	condition = DIA_Ass_391_Adept_hello_condition;
	information = DIA_Ass_391_Adept_hello_info;
	permanent = FALSE ;
	description = " Is your name Famid? " ;
};
	
func int DIA_Ass_391_Adept_hello_condition()
{
	if((MIS_CareOsair == LOG_Running) && (FazimAgreed == FALSE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_391_Adept_hello_info()
{
	AI_Output (other, self, " DIA_Ass_391_Adept_hello_01_01 " );	// Is your name Famid?
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_01_02 " );	// Yes, brother. That is what they call me.
	AI_Output (other, self, " DIA_Ass_391_Adept_hello_01_03 " );	// I have a little business for you.
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_01_04 " );	// I'm listening?
	AI_Output (other, self, " DIA_Ass_391_Adept_hello_01_05 " );	// Would you like to do some work for Prior Osair?
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_01_06 " );	// What happened to his people? Did he finally kill them all?
	AI_Output (other, self, " DIA_Ass_391_Adept_hello_01_07 " );	// Not yet, but he does find himself in need of extra muscle.
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_01_08 " );	// This proposal is interesting, considering that other priors don't really like me.
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_01_09 " );	// But my loyalty will directly depend on his generosity.
	AI_Output (other, self, " DIA_Ass_391_Adept_hello_01_10 " );	// Do you mean gold?
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_01_11 " );	// Exactly. brother. Because the only thing that interests me in this life is gold. 
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_01_12 " );	// And the more I have, the happier I am.
	AI_Output (other, self, " DIA_Ass_391_Adept_hello_01_13 " );	// Then all that remains is to agree on the price?
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_01_14 " );	// As with all things, brother.
	FazimFirstMeet = TRUE;
	Info_ClearChoices(DIA_Ass_391_Adept_hello);

	if(Npc_HasItems(other,ItMi_Gold) < 100)
	{
		Info_AddChoice (DIA_Ass_391_Adept_hello, " Let's come back to this later. " , DIA_Ass_391_Adept_hello_NoGold);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice (DIA_Ass_391_Adept_hello, " How about five thousand gold? " , DIA_Ass_391_Adept_hello_5000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 3000)
	{
		Info_AddChoice (DIA_Ass_391_Adept_hello, " How about three thousand gold? " , DIA_Ass_391_Adept_hello_3000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		Info_AddChoice (DIA_Ass_391_Adept_hello, " How about a thousand gold? " , DIA_Ass_391_Adept_hello_1000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice (DIA_Ass_391_Adept_hello, " How about five hundred gold coins? " , DIA_Ass_391_Adept_hello_500);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice (DIA_Ass_391_Adept_hello, " How about a hundred gold coins? " , DIA_Ass_391_Adept_hello_100);
	};
};

func void DIA_Ass_391_Adept_hello_5000()
{
	B_GivePlayerXP(1000);
	AI_Output (other, self, " DIA_Ass_391_Adept_hello_5000_01_01 " );	// How about five thousand gold?
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_5000_01_02 " );	// Oh, father of generosity. I gladly accept your offer!
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_5000_01_03 " );	// So you can tell the Prior that he has a new, extremely loyal acolyte!
	AI_Output(other,self,"DIA_Ass_391_Adept_hello_5000_01_04");	//He will be overjoyed to hear it.
	FazimAgreed = TRUE;
	B_LogEntry (TOPIC_CareOsair, " I bought Famid's loyalty. Now he will work for Prior Osair. " );
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_hello_3000()
{
	B_GivePlayerXP(500);
	AI_Output (other, self, " DIA_Ass_391_Adept_hello_3000_01_01 " );	// How about three thousand gold?
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_3000_01_02 " );	// Well, a very realistic price for my services. Okay, I agree to work for Prior Osair.
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	Npc_RemoveInvItems(self,ItMi_Gold,3000);
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_3000_01_03 " );	// You can tell him so.
	FazimAgreed = TRUE;
	B_LogEntry (TOPIC_CareOsair, " I bought Famid's loyalty. Now he will work for Prior Osair. " );
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_hello_1000()
{
	AI_Output (other, self, " DIA_Ass_391_Adept_hello_1000_01_01 " );	// How about a thousand gold?
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_1000_01_02 " );	// Sorry brother, it seems you undervalue my services.
	AI_Output (other, self, " DIA_Ass_391_Adept_hello_1000_01_03 " );	// But this is a fortune!
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_1000_01_04 " );	// Not to me.
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_hello_500()
{
	AI_Output (other, self, " DIA_Ass_391_Adept_hello_500_01_01 " );	// How about five hundred gold coins?
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_500_01_02 " );	// (scornfully) Hmmm. For that kind of money, you can go work for Osair yourself!
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_500_01_03 " );	// You insult me.
	FazimRefuseTalk = TRUE;
	B_LogEntry (TOPIC_CareOsair, " I could not agree with Famid. Osair will not be too happy with this. " );
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_hello_100()
{
	AI_Output (other, self, " DIA_Ass_391_Adept_hello_100_01_01 " );	// How about a hundred gold coins?
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_100_01_02 " );	// (angrily) Is this a joke?
	AI_Output (self, other, " DIA_Ass_391_Adept_hello_100_01_03 " );	// You know, I'm something of a joker myself. Want to see?
	FazimRefuseTalk = TRUE;
	B_LogEntry (TOPIC_CareOsair, " I could not agree with Famid. It lead to violence. Osair will not be too happy with this. " );
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_391_Adept_hello_NoGold()
{
	AI_Output (other, self, " DIA_Ass_391_Adept_hello_NoGold_01_01 " );	// Let's come back to this later.
	AI_Output(self,other,"DIA_Ass_391_Adept_hello_NoGold_01_02");	//Whatever you say, brother.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_391_Adept_FazimRefuseTalk(C_Info)
{
	npc = Ass_391_Adept;
	no. = 1 ;
	condition = DIA_Ass_391_Adept_FazimRefuseTalk_condition;
	information = DIA_Ass_391_Adept_FazimRefuseTalk_info;
	permanent = TRUE;
	important = TRUE;
};
	
func int DIA_Ass_391_Adept_FazimRefuseTalk_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (FazimRefuseTalk == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_391_Adept_FazimRefuseTalk_info()
{
	AI_Output (self, other, " DIA_Ass_391_Adept_FazimRefuseTalk_01_01 " );	// You and I have nothing more to discuss! Get out.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_391_Adept_FazimFirstMeet(C_Info)
{
	npc = Ass_391_Adept;
	no. = 1 ;
	condition = DIA_Ass_391_Adept_FazimFirstMeet_condition;
	information = DIA_Ass_391_Adept_FazimFirstMeet_info;
	permanent = TRUE;
	description = " About my offer ... " ;
};
	
func int DIA_Ass_391_Adept_FazimFirstMeet_condition()
{
	if((MIS_CareOsair == LOG_Running) && (FazimAgreed == FALSE) && (FazimRefuseTalk == FALSE) && (FazimFirstMeet == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_391_Adept_FazimFirstMeet_info()
{
	AI_Output (other, self, " DIA_Ass_391_Adept_FazimFirstMeet_01_01 " );	// About my offer to work for Prior Osair ...
	AI_Output (self, other, " DIA_Ass_391_Adept_FazimFirstMeet_01_02 " );	// (with interest) Well, well ... What do you have to offer me?
	Info_ClearChoices(DIA_Ass_391_Adept_FazimFirstMeet);

	if(Npc_HasItems(other,ItMi_Gold) < 100)
	{
		Info_AddChoice (DIA_Ass_391_Adept_FazimFirstMeet, " Let's come back to this question later. " , DIA_Ass_391_Adept_FazimFirstMeet_NoGold);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 5000)
	{
		Info_AddChoice (DIA_Ass_391_Adept_FazimFirstMeet, " How about five thousand gold? " , DIA_Ass_391_Adept_FazimFirstMeet_5000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 3000)
	{
		Info_AddChoice (DIA_Ass_391_Adept_FazimFirstMeet, " How about three thousand gold? " , DIA_Ass_391_Adept_FazimFirstMeet_3000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 1000)
	{
		Info_AddChoice (DIA_Ass_391_Adept_FazimFirstMeet, " How about a thousand gold? " , DIA_Ass_391_Adept_FazimFirstMeet_1000);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 500)
	{
		Info_AddChoice (DIA_Ass_391_Adept_FazimFirstMeet, " How about five hundred gold coins? " , DIA_Ass_391_Adept_FazimFirstMeet_500);
	};

	if(Npc_HasItems(other,ItMi_Gold) >= 100)
	{
		Info_AddChoice (DIA_Ass_391_Adept_FazimFirstMeet, " How about a hundred gold coins? " , DIA_Ass_391_Adept_FazimFirstMeet_100);
	};
};

func void DIA_Ass_391_Adept_FazimFirstMeet_5000()
{
	B_GivePlayerXP(500);
	AI_Output (other, self, " DIA_Ass_391_Adept_FazimFirstMeet_5000_01_01 " );	// How about five thousand gold?
	AI_Output (self, other, " DIA_Ass_391_Adept_FazimFirstMeet_5000_01_02 " );	// Oh, father of generosity. Of course, I gladly accept your offer!
	B_GiveInvItems(other,self,ItMi_Gold,5000);
	Npc_RemoveInvItems(self,ItMi_Gold,5000);
	AI_Output (self, other, " DIA_Ass_391_Adept_FazimFirstMeet_5000_01_03 " );	// So you can tell the Prior that he has a new, extremely loyal acolyte!
	AI_Output(other,self,"DIA_Ass_391_Adept_FazimFirstMeet_5000_01_04");	//He will be overjoyed to hear it.
	FazimAgreed = TRUE;
	B_LogEntry (TOPIC_CareOsair, " I bought Famid's loyalty. Now he will work for Prior Osair. " );
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_3000()
{
	B_GivePlayerXP(250);
	AI_Output (other, self, " DIA_Ass_391_Adept_FazimFirstMeet_3000_01_01 " );	// How about three thousand gold?
	AI_Output (self, other, " DIA_Ass_391_Adept_FazimFirstMeet_3000_01_02 " );	// Well, a very realistic price for my services. Okay, I agree to work for Prior Osair.
	B_GiveInvItems(other,self,ItMi_Gold,3000);
	Npc_RemoveInvItems(self,ItMi_Gold,3000);
	AI_Output (self, other, " DIA_Ass_391_Adept_FazimFirstMeet_3000_01_03 " );	// You can tell him so.
	FazimAgreed = TRUE;
	B_LogEntry (TOPIC_CareOsair, " I bought Famid's loyalty. Now he will work for Prior Osair. " );
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_1000()
{
	AI_Output (other, self, " DIA_Ass_391_Adept_FazimFirstMeet_1000_01_01 " );	// How about a thousand gold?
	AI_Output (self, other, " DIA_Ass_391_Adept_FazimFirstMeet_1000_01_02 " );	// Sorry brother, it seems you undervalue my services.
	FazimRefuseTalk = TRUE;
	B_LogEntry (TOPIC_CareOsair, " I could not agree with Famid. Osair will not be too happy with this. " );
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_500()
{
	AI_Output (other, self, " DIA_Ass_391_Adept_FazimFirstMeet_500_01_01 " );	// How about five hundred gold coins?
	AI_Output (self, other, " DIA_Ass_391_Adept_FazimFirstMeet_500_01_02 " );	// (scornfully) Hmmm. For that kind of money, you can go work for Osair yourself!
	AI_Output (self, other, " DIA_Ass_391_Adept_FazimFirstMeet_500_01_03 " );	// You insult me.
	FazimRefuseTalk = TRUE;
	B_LogEntry (TOPIC_CareOsair, " I could not agree with Famid. Osair will not be too happy with this. " );
	AI_StopProcessInfos(self);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_100()
{
	AI_Output (other, self, " DIA_Ass_391_Adept_FazimFirstMeet_100_01_01 " );	// How about a hundred gold coins?
	AI_Output (self, other, " DIA_Ass_391_Adept_FazimFirstMeet_100_01_02 " );	// (angrily) Is this a joke?
	AI_Output (self, other, " DIA_Ass_391_Adept_FazimFirstMeet_100_01_03 " );	// You know, I'm something of a joker myself. Want to see?
	FazimRefuseTalk = TRUE;
	B_LogEntry (TOPIC_CareOsair, " I could not agree with Famid. It lead to violence. Osair will not be too happy with this. " );
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_391_Adept_FazimFirstMeet_NoGold()
{
	AI_Output (other, self, " DIA_Ass_391_Adept_FazimFirstMeet_NoGold_01_01 " );	// Let's come back to this question later.
	AI_Output(self,other,"DIA_Ass_391_Adept_FazimFirstMeet_NoGold_01_02");	//Whatever you say, brother.
	AI_StopProcessInfos(self);
};

instance DIA_Ass_391_Adept_FazimAgreed(C_Info)
{
	npc = Ass_391_Adept;
	no. = 1 ;
	condition = DIA_Ass_391_Adept_FazimAgreed_condition;
	information = DIA_Ass_391_Adept_FazimAgreed_info;
	permanent = TRUE;
	important = TRUE;
};
	
func int DIA_Ass_391_Adept_FazimAgreed_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (FazimAgreed == TRUE))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_391_Adept_FazimAgreed_info()
{
	AI_Output (self, other, " DIA_Ass_391_Adept_FazimAgreed_01_01 " );	// Let's talk later, brother.
	AI_StopProcessInfos(self);
};
