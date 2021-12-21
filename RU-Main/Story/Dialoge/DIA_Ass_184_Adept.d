instance DIA_Ass_184_Adept_EXIT(C_Info)
{
	npc = Ass_184_Adept;
	No. = 999 ;
	condition = DIA_Ass_184_Adept_exit_condition;
	information = DIA_Ass_184_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_184_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_184_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_184_Adept_Hello(C_Info)
{
	npc = Ass_184_Adept;
	no. = 1 ;
	condition = DIA_Ass_184_Adept_hello_condition;
	information = DIA_Ass_184_Adept_hello_info;
	permanent = FALSE ;
	important = TRUE;
};
	
func int DIA_Ass_184_Adept_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_184_Adept_hello_info()
{
	AI_Output (self, other, " DIA_Ass_184_Adept_hello_01_01 " );	// A-ha. Who do we have here? Another novice who decided to try his luck?
	AI_Output (other, self, " DIA_Ass_184_Adept_hello_01_02 " );	// What do you mean?
	AI_Output (self, other, " DIA_Ass_184_Adept_hello_01_03 " );	// What? Didn't you come here to impress Prior Osair?
	AI_Output (other, self, " DIA_Ass_184_Adept_hello_01_04 " );	// I don't need to.
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_05");	//What do you mean?
	AI_Output (other, self, " DIA_Ass_184_Adept_hello_01_06 " );	// I already work for Master Osair, I am his murid.
	AI_Output (self, other, " DIA_Ass_184_Adept_hello_01_07 " );	// (dejected) What? You are his murid?

	if(PlayerIsAssNow == TRUE)
	{
		AI_Output (other, self, " DIA_Ass_184_Adept_hello_01_08 " );	// Are you blind? Is it not clear that I am already initiated into the Shadow of the Brotherhood?
		AI_Output (self, other, " DIA_Ass_184_Adept_hello_01_09 " );	// Please forgive me, brother. It's just that I was very upset when I learned that Prior Osair already has a murid.
		AI_Output (other, self, " DIA_Ass_184_Adept_hello_01_10 " );	// So you would like to become one yourself?
	}
	else
	{
		AI_Output (other, self, " DIA_Ass_184_Adept_hello_01_11 " );	// Yes, you're right. But soon I will be accepted into the Shadows of the Brotherhood.
		AI_Output (other, self, " DIA_Ass_184_Adept_hello_01_12 " );	// So you still have a chance to become one.
	};

	AI_Output (self, other, " DIA_Ass_184_Adept_hello_01_13 " );	// Oh! I would give anything for this. If only they gave me a chance.
	AI_Output (other, self, " DIA_Ass_184_Adept_hello_01_14 " );	// Perhaps I could help you with this.
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_15");	//How?
	AI_Output (other, self, " DIA_Ass_184_Adept_hello_01_16 " );	// Well, let's say I know how to impress Prior Osair.
	AI_Output(self,other,"DIA_Ass_184_Adept_hello_01_17");	//How is that?
	AI_Output (other, self, " DIA_Ass_184_Adept_hello_01_18 " );	// Bring him the skin of a very rare beast.
	AI_Output (other, self, " DIA_Ass_184_Adept_hello_01_19 " );	// As far as I know, Master Osair is very fond of this kind of thing.
	AI_Output (other, self, " DIA_Ass_184_Adept_hello_01_20 " );	// Only it should be a really exotic skin.
	AI_Output (other, self, " DIA_Ass_184_Adept_hello_01_21 " );	// That will be how you get your foot in the door.
	AI_Output (self, other, " DIA_Ass_184_Adept_hello_01_22 " );	// I understand. But where can I get such a skin?
	AI_Output (other, self, " DIA_Ass_184_Adept_hello_01_23 " );	// That's up to you. Buy it, trade it, hunt it. 
	AI_Output (self, other, " DIA_Ass_184_Adept_hello_01_24 " );	// alright, I'll see what I can do.
	TiamantNeedsSlaves = TRUE;
	B_LogEntry (TOPIC_Intriges, " In the cave of Osair, I met novice Joaquin, who dreams of becoming Osair's murid. I decided to help him with advice on how to attract the attention of the prior. And, if all goes well, the future murid of Osair will be in my debt. " ) ;
	AI_StopProcessInfos(self);
};

instance DIA_Ass_184_Adept_HelpWithAssair(C_Info)
{
	npc = Ass_184_Adept;
	no. = 1 ;
	condition = dia_Ass_184_Adept_HelpWithAssair_condition;
	information = dia_Ass_184_Adept_HelpWithAssair_info;
	permanent = FALSE ;
	description = " How are you doing? " ;
};

func int dia_Ass_184_Adept_HelpWithAssair_condition()
{
	if(TiamantSendsToOsair == TRUE)
	{
		return TRUE;
	};
};

func void dia_Ass_184_Adept_HelpWithAssair_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self,"DIA_Ass_184_Adept_HelpWithAssair_01_01");	//How are you doing?
	AI_Output (self, other, " DIA_Ass_184_Adept_HelpWithAssair_01_02 " );	// Much better. Master Osair appreciated my offering of a rare hide.
	AI_Output (self, other, " DIA_Ass_184_Adept_HelpWithAssair_01_03 " );	// So now I'm in his service as an assistant.
	AI_Output (other, self, " DIA_Ass_184_Adept_HelpWithAssair_01_04 " );	// Great, you went for it and got it. Good work.
};

instance DIA_Ass_184_Adept_GiveLetter(C_Info)
{
	npc = Ass_184_Adept;
	no. = 1 ;
	condition = dia_Ass_184_Adept_GiveLetter_condition;
	information = dia_Ass_184_Adept_GiveLetter_info;
	permanent = FALSE ;
	description = " What are you doing here? " ;
};

func int dia_Ass_184_Adept_GiveLetter_condition()
{
	if(MIS_PW_GOLDSHAHT == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_Ass_184_Adept_GiveLetter_info()
{
	AI_Output (other, self, " DIA_Ass_184_Adept_GiveLetter_01_01 " );	// What are you doing here?
	AI_Output (other, self, " DIA_Ass_184_Adept_GiveLetter_01_02 " );	// Shouldn't you be on your way to the temple now to deliver the letter to Prior Tiamant?
	AI_Output (self, other, " DIA_Ass_184_Adept_GiveLetter_01_03 " );	// I am... (hesitant) I just decided to stop and pray here.
	AI_Output (other, self, " DIA_Ass_184_Adept_GiveLetter_01_04 " );	// That's nice and all, but Osair is not a patient man.
	AI_Output (self, other, " DIA_Ass_184_Adept_GiveLetter_01_05 " );	// (nervously) Yes, you're right. I'll go to the temple immediately.
	AI_Output (other, self, " DIA_Ass_184_Adept_GiveLetter_01_06 " );	// Wait! That letter for Prior Tiamant, do you have it with you?
	AI_Output (self, other, " DIA_Ass_184_Adept_GiveLetter_01_07 " );	// Yes, I have it. Why do you ask?
	AI_Output(other,self,"DIA_Ass_184_Adept_GiveLetter_01_08");	//Let me read it.
	AI_Output (self, other, " DIA_Ass_184_Adept_GiveLetter_01_09 " );	// What? But I ... I can't do this!
	Info_ClearChoices(DIA_Ass_184_Adept_GiveLetter);
	Info_AddChoice (DIA_Ass_184_Adept_GiveLetter, " Give me the letter or I'll kill you! " , DIA_Ass_184_Adept_GiveLetter_M1);
	Info_AddChoice (DIA_Ass_184_Adept_GiveLetter, " I could always tell Osair that I helped you get his attention. " , DIA_Ass_184_Adept_GiveLetter_M2);
	Info_AddChoice (DIA_Ass_184_Adept_GiveLetter, " Don't worry. No one will know unless you tell them. " , DIA_Ass_184_Adept_GiveLetter_M3);
};


func void DIA_Ass_184_Adept_GiveLetter_M1()
{
	CreateInvItems(self,ItWr_OsaitToTiamant,1);
	AI_Output (other, self, " DIA_Ass_184_Adept_GiveLetter_M1_01_01 " );	// Give me the letter or I will kill you!
	AI_Output (self, other, " DIA_Ass_184_Adept_GiveLetter_M1_01_02 " );	// Listen, you can't intimidate me! I'm no coward!
	AI_Output (other, self, " DIA_Ass_184_Adept_GiveLetter_M1_01_03 " );	// You brought this on yourself!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
};

func void DIA_Ass_184_Adept_GiveLetter_M2()
{
	AI_Output (other, self, " DIA_Ass_184_Adept_GiveLetter_M2_01_01 " );	// I could always tell Osair that I helped you get his attention.
	AI_Output (other, self, " DIA_Ass_184_Adept_GiveLetter_M2_01_02 " );	// And then you will definitely be out of favor!
	AI_PlayAni(self,"T_SEARCH");
	AI_Output (self, other, " DIA_Ass_184_Adept_GiveLetter_M2_01_03 " );	// Beliar curse you! OK. Here, take it.
	AI_Output (other, self, " DIA_Ass_184_Adept_GiveLetter_M2_01_04 " );	// Don't worry. I'll read it and return it right away.
	B_GiveInvItems(self,other,ItWr_OsaitToTiamant,1);
	B_HeroUseFakeScroll();
	AI_Output (other, self, " DIA_Ass_184_Adept_GiveLetter_M2_01_05 " );	// Interesting.
	B_GiveInvItems(other,self,ItWr_OsaitToTiamant,1);
	AI_Output (self, other, " DIA_Ass_184_Adept_GiveLetter_M2_01_06 " );	// This has to stay between us, please!
	AI_Output (other, self, " DIA_Ass_184_Adept_GiveLetter_M2_01_07 " );	// Of course. Now go to the temple immediately. And after that I will wait for you in Osair's cave.
	AI_Output (self, other, " DIA_Ass_184_Adept_GiveLetter_M2_01_08 " );	// (incredulously) Why?
	AI_Output (other, self, " DIA_Ass_184_Adept_GiveLetter_M2_01_09 " );	// The Prior was ordered to take you and several other slaves to the gold mine, which was recently discovered in the foothill passage.
	AI_Output (other, self, " DIA_Ass_184_Adept_GiveLetter_M2_01_10 " );	// So don't drag it out.
	AI_Output (self, other, " DIA_Ass_184_Adept_GiveLetter_M2_01_11 " );	// Okay, we'll meet there.
	B_LogEntry (TOPIC_Intriges, " Based on the text from the letter, Osair is extremely unhappy with Tiamant. I'm sure Haniar will be interested to hear about this. " );
	KnowOsairToTiamant = TRUE;
	TiamantNeedsSlaves = TRUE;
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(Ass_184_Adept,"Tiamant");
};

func void DIA_Ass_184_Adept_GiveLetter_M3()
{
	AI_Output (other, self, " DIA_Ass_184_Adept_GiveLetter_M3_01_01 " );	// Don't worry. No one will know unless you tell them.
	AI_Output (self, other, " DIA_Ass_184_Adept_GiveLetter_M3_01_02 " );	// No, its too risky.
	AI_Output (self, other, " DIA_Ass_184_Adept_GiveLetter_M3_01_03 " );	// And who are you to read the correspondence of the prior, anyway?
};

instance DIA_Ass_184_Adept_GoShaht(C_Info)
{
	npc = Ass_184_Adept;
	no. = 1 ;
	condition = dia_Ass_184_Adept_GoShaht_condition;
	information = dia_Ass_184_Adept_GoShaht_info;
	permanent = FALSE ;
	description = " Time to hit the road. " ;
};

func int dia_Ass_184_Adept_GoShaht_condition()
{
	if((HaniarBlameTiamant == TRUE) && (HoakinIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_Ass_184_Adept_GoShaht_info()
{
	var C_Npc Slave_01;
	var C_Npc Slave_02;

	Slave_01 = Hlp_GetNpc(SEK_186_SLAVEOBSSEK);
	Slave_02 = Hlp_GetNpc(SEK_387_SLAVEOBSSEK);

	self.aivar [ AIV_PARTYMEMBER ] = TRUE ;
	Slave_01.aivar[AIV_PARTYMEMBER] = TRUE;
	Slave_02.aivar[AIV_PARTYMEMBER] = TRUE;

	AI_Output (other, self, " DIA_Ass_184_Adept_GoShaht_01_01 " );	// Time to hit the road. Are the slaves ready?
	AI_Output (self, other, " DIA_Ass_184_Adept_GoShaht_01_02 " );	// Yes, everything is fine. I have already selected a couple of the stronger ones.
	AI_Output (other, self, " DIA_Ass_184_Adept_GoShaht_01_03 " );	// Then follow me, and don't lag behind.
	AI_Output(self,other,"DIA_Ass_184_Adept_GoShaht_01_04");	//All right.
	MIS_PW_FollowGoldOre = LOG_Running;
	Log_CreateTopic(TOPIC_PW_FollowGoldOre,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PW_FollowGoldOre,LOG_Running);
	B_LogEntry (TOPIC_PW_FollowGoldOre, " By order of Prior Osair, I need to take Joaquin and the slaves to the gold mine. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_184_Adept,"FollowGoldOre");
	Npc_ExchangeRoutine(SEK_186_SLAVEOBSSEK,"FollowGoldOre");
	Npc_ExchangeRoutine(SEK_387_SLAVEOBSSEK,"FollowGoldOre");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_01");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_02");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_03");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_04");
	Wld_InsertNpc(MinecrawlerWarrior,"FP_ROAM_GOLDOREWAY_05");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_06");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_07");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_08");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_09");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_10");
	Wld_InsertNpc(Gobbo_Black,"FP_ROAM_GOLDOREWAY_11");
	Wld_InsertNpc(OreBug,"FP_ROAM_GOLDOREWAY_12");
	Wld_InsertNpc(OreBug,"FP_ROAM_GOLDOREWAY_13");
};

instance DIA_Ass_184_Adept_GoShaht_Done(C_Info)
{
	npc = Ass_184_Adept;
	no. = 1 ;
	condition = DIA_Ass_184_Adept_GoShaht_Done_condition;
	information = DIA_Ass_184_Adept_GoShaht_Done_info;
	permanent = FALSE ;
	description = "Мы на месте.";
};
	
func int DIA_Ass_184_Adept_GoShaht_Done_condition()
{
	if((MIS_PW_FollowGoldOre == LOG_Running) && (Npc_GetDistToWP(self,"PW_GOLD_CAVEORE_GUARD_03") <= 750))
	{
		return TRUE;
	};
};	
	
func void DIA_Ass_184_Adept_GoShaht_Done_info()
{
	var C_Npc Hoakin;
	var C_Npc Slave_01;
	var C_Npc Slave_02;
	var int XP_Count;

	Hoakin = Hlp_GetNpc(Ass_184_Adept);
	Slave_01 = Hlp_GetNpc(SEK_186_SLAVEOBSSEK);
	Slave_02 = Hlp_GetNpc(SEK_387_SLAVEOBSSEK);

	if(HoakinIsDead == FALSE)
	{
		XP_Count = XP_Count + 1;
		Hoakin.aivar [ AIV_PARTYMEMBER ] = FALSE ;
	};
	if(GoldSlave_01_IsDead == FALSE)
	{
		XP_Count = XP_Count + 1;
		Slave_01.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	if(GoldSlave_02_IsDead == FALSE)
	{
		XP_Count = XP_Count + 1;
		Slave_02.aivar[AIV_PARTYMEMBER] = FALSE;
	};
	XP_Count = 500 + (XP_Count * 500);
	B_GivePlayerXP(XP_Count);
	AI_Output(other,self,"DIA_Ass_184_Adept_GoShaht_Done_01_00");	//We're here.
	AI_Output (self, other, " DIA_Ass_184_Adept_GoShaht_Done_01_01 " );	// Thank you for seeing us here safely.
	AI_Output (self, other, " DIA_Ass_184_Adept_GoShaht_Done_01_02 " );	// This place is dangerous. Will you stay until the guards arrive?
	OsairWarriorWait = TRUE;
	B_LogEntry (TOPIC_PW_FollowGoldOre, " I brought the slaves to the mine. Now I have to wait for Osair's people, and then report it to him myself. I think I shouldn't abandon the slaves and this novice. If they die before the mine guard arrives, it will be blamed on me.  " );
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(SEK_387_SLAVEOBSSEK,"GoldOre");
	B_StartOtherRoutine(SEK_186_SLAVEOBSSEK,"GoldOre");
	B_StartOtherRoutine(Ass_184_Adept,"GoldOre");
};
