instance DIA_Ass_185_Adept_EXIT(C_Info)
{
	npc = Ass_185_Adept;
	No. = 999 ;
	condition = DIA_Ass_185_Adept_exit_condition;
	information = DIA_Ass_185_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_185_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_185_Adept_exit_info()
{
	AI_Output (self, other, " DIA_Ass_185_Adept_exit_01_01 " );	// (grim) Sorry pal. But, unfortunately, I can't let you go.
	AI_Output (self, other, " DIA_Ass_185_Adept_exit_01_02 " );	// My master doesn't want word spreading around about this mine.
	AI_Output (self, other, " DIA_Ass_185_Adept_exit_01_03 " );	// Don't worry, I'll kill you quickly.
	B_LogEntry (TOPIC_Intriges, " Luca planned to kill me. As always, I was in the wrong place at the wrong time. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_184_Adept,"Pray");
	B_Attack(self,other,AR_KILL,1);
};

instance DIA_Ass_185_Adept_Hello(C_Info)
{
	npc = Ass_185_Adept;
	no. = 1 ;
	condition = DIA_Ass_185_Adept_hello_condition;
	information = DIA_Ass_185_Adept_hello_info;
	permanent = FALSE ;
	important = TRUE;
};
	
func int DIA_Ass_185_Adept_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_185_Adept_hello_info()
{
	AI_Output (self, other, " DIA_Ass_185_Adept_hello_01_01 " );	// Well, well. What do we have here?
	AI_Output(other,self,"DIA_Ass_185_Adept_hello_01_02");	//Who's asking?
	AI_Output (self, other, " DIA_Ass_185_Adept_hello_01_03 " );	// My brothers call me Luca, not that it tells you much about me.
	AI_Output (self, other, " DIA_Ass_185_Adept_hello_01_04 " );	// (appraisingly) Hmmm. You don't strike me as particularly strong.
	AI_Output (self, other, " DIA_Ass_185_Adept_hello_01_05 " );	// Although, I heard you dealt with Hasim quite famously.
	AI_Output (other, self, " DIA_Ass_185_Adept_hello_01_06 " );	// How do you know this?
	AI_Output (self, other, " DIA_Ass_185_Adept_hello_01_07 " );	// How? Because I had to dispose of the corpse.
	AI_Output (self, other, " DIA_Ass_185_Adept_hello_01_08 " );	// Prior Tiamant for has decided to entrust this matter to you.
	AI_Output (self, other, " DIA_Ass_185_Adept_hello_01_09 " );	// And you jumped at the chance, didn't you.
	B_LogEntry (TOPIC_Intriges, " I met a Shadow named Luca in the gold mine. It seems that this meeting is not accidental, works for Prior Tiamant. I'll need to find out more from him. " );
};	

instance DIA_Ass_185_Adept_Tiamant(C_Info)
{
	npc = Ass_185_Adept;
	no. = 1 ;
	condition = DIA_Ass_185_Adept_Tiamant_condition;
	information = DIA_Ass_185_Adept_Tiamant_info;
	permanent = FALSE ;
	description = " Why did Tiamant order him to be killed? " ;
};
	
func int DIA_Ass_185_Adept_Tiamant_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_185_Adept_hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_185_Adept_Tiamant_info()
{
	B_GivePlayerXP(50);
	AI_Output (other, self, " DIA_Ass_185_Adept_Tiamant_01_01 " );	// Why did Tiamant order him to be killed?
	AI_Output (self, other, " DIA_Ass_185_Adept_Tiamant_01_02 " );	// The guy got into his business. That's all you need to know.
	AI_Output (self, other, " DIA_Ass_185_Adept_Tiamant_01_03 " );	// Do the same and you'll share his fate.
};	

instance DIA_Ass_185_Adept_WhatDo(C_Info)
{
	npc = Ass_185_Adept;
	no. = 1 ;
	condition = DIA_Ass_185_Adept_WhatDo_condition;
	information = DIA_Ass_185_Adept_WhatDo_info;
	permanent = FALSE ;
	description = " What are you doing here? " ;
};
	
func int DIA_Ass_185_Adept_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_185_Adept_hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_185_Adept_WhatDo_info()
{
	B_GivePlayerXP(50);
	AI_Output (other, self, " DIA_Ass_185_Adept_WhatDo_01_01 " );	// What are you doing here?
	AI_Output (self, other, " DIA_Ass_185_Adept_WhatDo_01_02 " );	// I don't really know myself. But since you came here, I’m probably waiting for you.
	AI_Output(other,self,"DIA_Ass_185_Adept_WhatDo_01_03");	//Why might that be?
	AI_Output (self, other, " DIA_Ass_185_Adept_WhatDo_01_04 " );	// You first. Why did you come here?
	AI_Output (other, self, " DIA_Ass_185_Adept_WhatDo_01_05 " );	// I am following orders from Prior Osair. He thinks there's gold mine here somewhere.
	AI_Output (other, self, " DIA_Ass_185_Adept_WhatDo_01_06 " );	// And, apparently, it really is!
	AI_Output(self,other,"DIA_Ass_185_Adept_WhatDo_01_07");	//Any idea where?
	AI_Output (other, self, " DIA_Ass_185_Adept_WhatDo_01_08 " );	// Behind you.
	AI_Output(self,other,"DIA_Ass_185_Adept_WhatDo_01_09");	//Ah.
	AI_Output (other, self, " DIA_Ass_185_Adept_WhatDo_01_10 " );	// I'ts literally glistening with gold. Are you blind?
	AI_Output (self, other, " DIA_Ass_185_Adept_WhatDo_01_11 " );	// I must be preoccupied.
};	


instance DIA_Ass_185_Adept_StrangeGuy(C_Info)
{
	npc = Ass_185_Adept;
	no. = 1 ;
	condition = DIA_Ass_185_Adept_StrangeGuy_condition;
	information = DIA_Ass_185_Adept_StrangeGuy_info;
	permanent = FALSE ;
	description = " So you work for Prior Tiamant? " ;
};
	
func int DIA_Ass_185_Adept_StrangeGuy_condition()
{
	if(Npc_KnowsInfo(hero,DIA_Ass_185_Adept_hello))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_185_Adept_StrangeGuy_info()
{
	B_GivePlayerXP(50);
	AI_Output (other, self, " DIA_Ass_185_Adept_StrangeGuy_01_01 " );	// So you work for Prior Tiamant?
	AI_Output (self, other, " DIA_Ass_185_Adept_StrangeGuy_01_02 " );	// Does that surprise you?
	AI_Output (other, self, " DIA_Ass_185_Adept_StrangeGuy_01_03 " );	// Why do you think decided to trust me with Hasim, and not you?
	AI_Output (self, other, " DIA_Ass_185_Adept_StrangeGuy_01_04 " );	// That's easy to explain.
	AI_Output (self, other, " DIA_Ass_185_Adept_StrangeGuy_01_05 " );	// If you messed things up, no one would even think that it was done on his orders.
	AI_Output (self, other, " DIA_Ass_185_Adept_StrangeGuy_01_06 " );	// You simply would not be believed.
	AI_Output (self, other, " DIA_Ass_185_Adept_StrangeGuy_01_07 " );	// And we deal with liars quickly and efficiently. Tiamant wins either way.
	AI_Output (self, other, " DIA_Ass_185_Adept_StrangeGuy_01_08 " );	// But you, apparently, are no pushover.
	AI_Output (self, other, " DIA_Ass_185_Adept_StrangeGuy_01_09 " );	// Hasim was a tough nut to crack, and I was very surprised when I found out that you managed to kill him.
	AI_Output (self, other, " DIA_Ass_185_Adept_StrangeGuy_01_10 " );	// I hope you reaffirm this new reputation of yours, otherwise this won't be very interesting!
	AI_Output(other,self,"DIA_Ass_185_Adept_StrangeGuy_01_11");	//What are you talking about?
	AI_Output (self, other, " DIA_Ass_185_Adept_StrangeGuy_01_12 " );	// Don't worry, you will soon find out.
};	
