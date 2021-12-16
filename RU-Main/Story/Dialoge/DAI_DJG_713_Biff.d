
func void B_KommMit()
{
	AI_Output(other,self,"DIA_AkilsSchaf_KommMit_15_00");	//Follow me!
};

func void b_biff_verarschen()
{
	AI_Output(self,other,"DIA_Biff_ARBEITEN_lebenlassen_07_01");	//I don't want to be humiliated by you.
};

func void B_BiffsAnteil_Berechnung()
{
	var int momentanKohle;
	var int UeberschussKohle;
	momentanKohle = Npc_HasItems(hero,ItMi_Gold);
	UeberschussKohle = momentanKohle - DJG_Biff_SCGold;
	BiffsAnteil = UeberschussKohle / 2;
};

func void B_BiffsAnteil_PrintScreen()
{
	var string BiffsAnteilText_Teil;
	var string BiffsAnteilText;
	var string Anteil;
	Anteil = IntToString(BiffsAnteil);
	BiffsAnteilText_Teil = ConcatStrings(PRINT_BiffsAnteil,Anteil);
	BiffsAnteilText = ConcatStrings(BiffsAnteilText_Teil,PRINT_BiffGold);
	AI_Print(BiffsAnteilText);
};

func void B_Biff_SetRefuseTalk()
{
	if(DJG_Biff_HalbeHalbe == TRUE)
	{
		Npc_SetRefuseTalk(Biff,1000);
	}
	else
	{
		Npc_SetRefuseTalk(Biff,600);
	};
};


instance DIA_Biff_EXIT(C_Info)
{
	npc = DJG_713_Biff;
	nr = 999;
	condition = DIA_Biff_EXIT_Condition;
	information = DIA_Biff_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Biff_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Biff_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Biff_HALLO(C_Info)
{
	npc = DJG_713_Biff;
	nr = 5;
	condition = DIA_Biff_HALLO_Condition;
	information = DIA_Biff_HALLO_Info;
	description = "What are you doing here?";
};


func int DIA_Biff_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Biff_HALLO_Info()
{
	AI_Output(other,self,"DIA_Biff_HALLO_15_00");	//What are you doing here?
	AI_Output(self,other,"DIA_Biff_HALLO_07_01");	//What a stupid question. What do you think?
	Info_AddChoice(DIA_Biff_HALLO,"I can't stand the dumb look on your face.",DIA_Biff_HALLO_spott);
	Info_AddChoice(DIA_Biff_HALLO,"I have no idea,.",DIA_Biff_HALLO_keineAhnung);
	Info_AddChoice(DIA_Biff_HALLO,"Ok, forget it.",DIA_Biff_HALLO_doof);
};

func void DIA_Biff_HALLO_doof()
{
	AI_Output(other,self,"DIA_Biff_HALLO_doof_15_00");	//Nevermind.
	Info_ClearChoices(DIA_Biff_HALLO);
};

func void DIA_Biff_HALLO_spott()
{
	AI_Output(other,self,"DIA_Biff_HALLO_spott_15_00");	//I only asked because of that dumb look on your face.
	AI_Output(self,other,"DIA_Biff_HALLO_spott_07_01");	//I think its time to shut that mouth of yours.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	DJG_BiffParty_nomore = DJG_BiffParty_nomore + 1;
};

func void DIA_Biff_HALLO_keineAhnung()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_15_00");	//I have no idea.
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_07_01");	//I'm waiting for something to finally happen.
	Info_AddChoice(DIA_Biff_HALLO,"А что должно произойти?",DIA_Biff_HALLO_keineAhnung_was);
};

func void DIA_Biff_HALLO_keineAhnung_was()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_15_00");	//What might happen?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_07_01");	//If I knew that, I wouldn't be waiting, would I?
	Info_AddChoice(DIA_Biff_HALLO,"What might happen?",DIA_Biff_HALLO_keineAhnung_was_was2);
};

func void DIA_Biff_HALLO_keineAhnung_was_was2()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_15_00");	//What could possibly happen?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_07_01");	//Your'e starting to get on my last nerve. I don't care what happens, as long as something does!
	Info_AddChoice(DIA_Biff_HALLO,"Why aren't you doing anything then?",DIA_Biff_HALLO_keineAhnung_was_was2_was3);
};

func void DIA_Biff_HALLO_keineAhnung_was_was2_was3()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_15_00");	//Why don't you do anything then?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_07_01");	//If you don't quit it with the stupid questions, I'll shut you up myself.
	Info_AddChoice(DIA_Biff_HALLO,"Nothing will happen if you just stand here!",DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4);
};

func void DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_15_00");	//Nothing will happen if you just stand here!
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_07_01");	//I'm sick of you!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	DJG_BiffParty_nomore = DJG_BiffParty_nomore + 1;
};


instance DIA_Biff_WASHIERIMTAL(C_Info)
{
	npc = DJG_713_Biff;
	nr = 7;
	condition = DIA_Biff_WASHIERIMTAL_Condition;
	information = DIA_Biff_WASHIERIMTAL_Info;
	description = "What are you hoping to find here in the Valley of the mines?";
};


func int DIA_Biff_WASHIERIMTAL_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Biff_HALLO) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_WASHIERIMTAL_Info()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_15_00");	//What are you hoping to find here in the Valley of the mines?
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_01");	//Glory and riches, what else? When I'm done with those dragons I'll be swimming in gold.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_02");	//I'll spend the rest of my days touring every tavern and brothel in the country.
	Info_AddChoice(DIA_Biff_WASHIERIMTAL,"Well then good luck to you.",DIA_Biff_WASHIERIMTAL_vielglueck);
	Info_AddChoice(DIA_Biff_WASHIERIMTAL,"Well, sure, either that or you end up as dragon dung!",DIA_Biff_WASHIERIMTAL_ihrtot);
};

func void DIA_Biff_WASHIERIMTAL_ihrtot()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_ihrtot_15_00");	//Well, sure, either that or you end up as dragon dung!
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_ihrtot_07_01");	//So what? That's what adventuring is all about.
	Info_ClearChoices(DIA_Biff_WASHIERIMTAL);
};

func void DIA_Biff_WASHIERIMTAL_vielglueck()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_vielglueck_15_00");	//Well then, I wish you the best.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_vielglueck_07_01");	//I don't need luck while I have my trusty axe.
	Info_ClearChoices(DIA_Biff_WASHIERIMTAL);
};


instance DIA_Biff_ARBEITEN(C_Info)
{
	npc = DJG_713_Biff;
	nr = 8;
	condition = DIA_Biff_ARBEITEN_Condition;
	information = DIA_Biff_ARBEITEN_Info;
	permanent = TRUE;
	description = "Would you like to work for me?";
};


func int DIA_Biff_ARBEITEN_Condition()
{
	if((DJG_BiffParty == FALSE) && Npc_KnowsInfo(other,DIA_Biff_HALLO) && (DJG_Biff_Stay == FALSE) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_ARBEITEN_Info()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_15_00");	//Would you like to work for me?
	B_LogEntry(TOPIC_Dragonhunter,"Dragon Hunter Biff is a born merc. I pay him enough, he'll do what I say.");
	if(DJG_BiffParty_nomore >= 6)
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_01");	//We already tried, and nothing good came of it. I want no part of this.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_02");	//Hmm, why not? How are you paying?
	};
	Info_ClearChoices(DIA_Biff_ARBEITEN);
	Info_AddChoice(DIA_Biff_ARBEITEN,"Consider yourself lucky that I don't kill you.",DIA_Biff_ARBEITEN_lebenlassen);
	Info_AddChoice(DIA_Biff_ARBEITEN,"Half the loot is yours.",DIA_Biff_ARBEITEN_HalbeHalbe);
	Info_AddChoice(DIA_Biff_ARBEITEN,"I will pay you a hundred gold pieces.",DIA_Biff_ARBEITEN_100);
};

func void DIA_Biff_ARBEITEN_100()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_100_15_00");	//I will pay you a hundred gold pieces..
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_100_07_01");	//Works for me. Lead on, I'm right behind you.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Follow");
		B_Biff_SetRefuseTalk();
		self.aivar[AIV_PARTYMEMBER] = TRUE;
		DJG_BiffParty = TRUE;
	}
	else
	{
		b_biff_verarschen();
		AI_StopProcessInfos(self);
		DJG_BiffParty_nomore = DJG_BiffParty_nomore + 1;
	};
};

func void DIA_Biff_ARBEITEN_HalbeHalbe()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_HalbeHalbe_15_00");	//Half the loot is yours.
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_01");	//Sounds tempting. But I warn you. Try do betray me and you'll regret it
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_02");	//Oh, and one more thing: I'm not interested in junk or trinkets, only gold. Clear?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	DJG_BiffParty = TRUE;
	DJG_Biff_HalbeHalbe = TRUE;
	B_Biff_SetRefuseTalk();
	if(DJG_Biff_HalbeHalbe_again == FALSE)
	{
		DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);
		DJG_Biff_HalbeHalbe_again = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_03");	//But you already know all this.
	};
};

func void DIA_Biff_ARBEITEN_lebenlassen()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_lebenlassen_15_00");	//Consider yourself lucky that I don't kill you.
	b_biff_verarschen();
	AI_StopProcessInfos(self);
	DJG_BiffParty_nomore = DJG_BiffParty_nomore + 1;
};


instance DIA_Biff_GELDEINTREIBEN(C_Info)
{
	npc = DJG_713_Biff;
	nr = 9;
	condition = DIA_Biff_GELDEINTREIBEN_Condition;
	information = DIA_Biff_GELDEINTREIBEN_Info;
	important = TRUE;
	permanent = TRUE;
};


var int biff_labert_geldeintreiben;

func int DIA_Biff_GELDEINTREIBEN_Condition()
{
	if((DJG_Biff_SCGold < (Npc_HasItems(other,ItMi_Gold) - 1)) && (Npc_GetBodyState(hero) != BS_INVENTORY) && (Npc_GetBodyState(hero) != BS_MOBINTERACT_INTERRUPT) && ((Npc_GetBodyState(hero) != BS_STAND) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) && ((Npc_GetBodyState(hero) != BS_ITEMINTERACT) || (BIFF_LABERT_GELDEINTREIBEN == TRUE)) && (DJG_Biff_HalbeHalbe == TRUE) && (DJG_BiffParty == TRUE) && (DJG_Biff_Stay == FALSE))
	{
		BIFF_LABERT_GELDEINTREIBEN = TRUE;
		return TRUE;
	};
};

func void DIA_Biff_GELDEINTREIBEN_Info()
{
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_07_00");	//Hold on! Half of this shit is mine! Hand it over!
	B_BiffsAnteil_Berechnung();
	B_BiffsAnteil_PrintScreen();
	Info_ClearChoices(DIA_Biff_GELDEINTREIBEN);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN,"I can't pay you.",DIA_Biff_GELDEINTREIBEN_zuTeuer);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN,"Here's your cut.",DIA_Biff_GELDEINTREIBEN_geben);
};

func void DIA_Biff_GELDEINTREIBEN_geben()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_geben_15_00");	//Here's your cut.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_geben_07_01");	//Good. Let's go.
	AI_StopProcessInfos(self);
	B_GiveInvItems(other,self,ItMi_Gold,BiffsAnteil);
	B_Biff_SetRefuseTalk();
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);
};

func void DIA_Biff_GELDEINTREIBEN_zuTeuer()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_15_00");	//Um, I'm a little light on gold right now.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_07_01");	//I don't care, we agreed on half.
	Info_ClearChoices(DIA_Biff_GELDEINTREIBEN);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN,"This is where we go our separate ways.",DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN,"Here's your cut.",DIA_Biff_GELDEINTREIBEN_geben);
};

func void DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00");	//This is where we go our separate ways.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_07_01");	//Fine. Give me my share.
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_Attack(self,other,AR_NONE,1);
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BiffParty = FALSE;
	DJG_Biff_HalbeHalbe = FALSE;
	DJG_BiffParty_nomore = DJG_BiffParty_nomore + 1;
};


instance DIA_Biff_ICHBLEIBHIER(C_Info)
{
	npc = DJG_713_Biff;
	nr = 6;
	condition = DIA_Biff_ICHBLEIBHIER_Condition;
	information = DIA_Biff_ICHBLEIBHIER_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Biff_ICHBLEIBHIER_Condition()
{
	if((Npc_GetBodyState(hero) != BS_INVENTORY) && (Npc_GetBodyState(hero) != BS_MOBINTERACT_INTERRUPT) && (DJG_BiffParty == TRUE) && (DJG_Biff_Stay == FALSE) && (((((Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01") < 4000) && (Npc_IsDead(SwampDragon) == FALSE) && (SwampDragon.flags != 0)) || ((Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8") < 2000) && (Npc_IsDead(RockDragon) == FALSE) && (RockDragon.flags != 0)) || ((Npc_GetDistToWP(self,"CASTLE_36") < 4000) && (Npc_IsDead(FireDragon) == FALSE) && (FireDragon.flags != 0)) || ((Npc_GetDistToWP(self,"OW_ICEDRAGON_01") < 4000) && (Npc_IsDead(IceDragon) == FALSE) && (IceDragon.flags != 0))) && (Npc_HasItems(hero,ItMi_InnosEye_MIS) >= 1)) || (Npc_GetDistToWP(self,"OC_CENTER_GUARD_02") < 4500)))
	{
		return TRUE;
	};
};

func void DIA_Biff_ICHBLEIBHIER_Info()
{
	AI_Output(self,other,"DIA_Biff_ICHBLEIBHIER_07_00");	//This place is dangerous. You lead and I'll follow.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
	if(Npc_GetDistToWP(self,"OW_SWAMPDRAGON_01") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Swamp");
	};
	if(Npc_GetDistToWP(self,"LOCATION_19_03_PATH_RUIN8") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Rock");
	};
	if(Npc_GetDistToWP(self,"CASTLE_36") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Fire");
	};
	if(Npc_GetDistToWP(self,"OW_ICEDRAGON_01") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_Ice");
	};
	if(Npc_GetDistToWP(self,"OC_CENTER_GUARD_02") < 10000)
	{
		Npc_ExchangeRoutine(self,"Stay_AwayFromOC");
	};
	DJG_Biff_Stay = TRUE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);
};


instance DIA_Biff_Stay_AwayFromOC(C_Info)
{
	npc = DJG_713_Biff;
	condition = DIA_Biff_Stay_AwayFromOC_Condition;
	information = DIA_Biff_Stay_AwayFromOC_Info;
	nr = 3;
	permanent = TRUE;
	description = "(Take Biff with you)";
};


func int DIA_Biff_Stay_AwayFromOC_Condition()
{
	if(((Npc_GetDistToWP(self,"OW_PATH_298") < 500) || (Npc_GetDistToWP(self,"LOCATION_19_01") < 500)) && (DJG_BiffParty == TRUE) && (DJG_Biff_Stay == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Biff_Stay_AwayFromOC_Info()
{
	B_KommMit();
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Follow");
	DJG_Biff_Stay = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);
};


instance DIA_Biff_KOHLEWEGGEBEN(C_Info)
{
	npc = DJG_713_Biff;
	condition = DIA_Biff_KOHLEWEGGEBEN_Condition;
	information = DIA_Biff_KOHLEWEGGEBEN_Info;
	nr = 10;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Biff_KOHLEWEGGEBEN_Condition()
{
	if((DJG_Biff_SCGold > Npc_HasItems(other,ItMi_Gold)) && (DJG_Biff_HalbeHalbe == TRUE) && (DJG_BiffParty == TRUE) && (DJG_Biff_Stay == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Biff_KOHLEWEGGEBEN_Info()
{
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_00");	//Don't drop your gold.
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_01");	//Better let me hang on to it.
	AI_StopProcessInfos(self);
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);
};


instance DIA_Biff_BIFFLOSWERDEN(C_Info)
{
	npc = DJG_713_Biff;
	nr = 11;
	condition = DIA_Biff_BIFFLOSWERDEN_Condition;
	information = DIA_Biff_BIFFLOSWERDEN_Info;
	permanent = TRUE;
	description = "This is where we go our separate ways.";
};


func int DIA_Biff_BIFFLOSWERDEN_Condition()
{
	if(DJG_BiffParty == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Biff_BIFFLOSWERDEN_Info()
{
	AI_Output(other,self,"DIA_Biff_BIFFLOSWERDEN_15_00");	//This is the end of our little partnership.
	AI_Output(self,other,"DIA_Biff_BIFFLOSWERDEN_07_01");	//I'll find myself a better job, don't you worry.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_Biff_HalbeHalbe = FALSE;
	DJG_BiffParty = FALSE;
	DJG_BiffParty_nomore = DJG_BiffParty_nomore + 1;
};


instance DIA_Biff_MEHRGELD(C_Info)
{
	npc = DJG_713_Biff;
	nr = 12;
	condition = DIA_Biff_MEHRGELD_Condition;
	information = DIA_Biff_MEHRGELD_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Biff_MEHRGELD_Condition()
{
	if((DJG_BiffParty == TRUE) && (Npc_RefuseTalk(self) == FALSE) && (DJG_Biff_Stay == FALSE))
	{
		return TRUE;
	};
};


var int DIA_Biff_MEHRGELD_Info_OneTime;

func void DIA_Biff_MEHRGELD_Info()
{
	AI_Output(self,other,"DIA_Biff_MEHRGELD_07_00");	//I think you owe me a little bit more, don't you?
	if(DJG_Biff_HalbeHalbe == TRUE)
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_01");	//One hundred gold should be enough.
		if(DIA_Biff_MEHRGELD_Info_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_02");	//Don't worry, I haven't forgotten our deal.
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_03");	//That's why I didn't bother asking for more money.
			DIA_Biff_MEHRGELD_Info_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_04");	//I want another hundred gold.
	};
	Info_ClearChoices(DIA_Biff_MEHRGELD);
	Info_AddChoice(DIA_Biff_MEHRGELD,"I can't pay you.",DIA_Biff_MEHRGELD_zuTeuer);
	Info_AddChoice(DIA_Biff_MEHRGELD,"Sounds good to me.",DIA_Biff_MEHRGELD_ok);
};

func void DIA_Biff_MEHRGELD_ok()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_ok_15_00");	//Sounds good to me.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_01");	//Yeah, that's for sure. Let's move.
		AI_StopProcessInfos(self);
		if(DJG_Biff_HalbeHalbe == TRUE)
		{
			DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);
		};
		B_Biff_SetRefuseTalk();
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_02");	//You're pathetic. You can't even pay your partner.
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_03");	//I think I should find another partner.
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"Start");
		self.aivar[AIV_PARTYMEMBER] = FALSE;
		DJG_Biff_HalbeHalbe = FALSE;
		DJG_BiffParty = FALSE;
		DJG_BiffParty_nomore = DJG_BiffParty_nomore + 2;
	};
};

func void DIA_Biff_MEHRGELD_zuTeuer()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_zuTeuer_15_00");	//I can't pay you.
	AI_Output(self,other,"DIA_Biff_MEHRGELD_zuTeuer_07_01");	//Then you're on your own.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	DJG_BiffParty = FALSE;
	DJG_BiffParty_nomore = DJG_BiffParty_nomore + 2;
};


instance DIA_Biff_HEILUNG(C_Info)
{
	npc = DJG_713_Biff;
	nr = 4;
	condition = DIA_Biff_HEILUNG_Condition;
	information = DIA_Biff_HEILUNG_Info;
	permanent = TRUE;
	description = "Do you need a healing potion?";
};


func int DIA_Biff_HEILUNG_Condition()
{
	if(DJG_BiffParty == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Biff_HEILUNG_Info()
{
	AI_Output(other,self,"DIA_Biff_HEILUNG_15_00");	//Do you need a healing potion??
	AI_Output(self,other,"DIA_Biff_HEILUNG_07_01");	//Damn right!
	Info_ClearChoices(DIA_Biff_HEILUNG);
	Info_AddChoice(DIA_Biff_HEILUNG,"I'll give you something later.",DIA_Biff_HEILUNG_spaeter);
	Info_AddChoice(DIA_Biff_HEILUNG,"(Smallest Healing Potion)",DIA_Biff_HEILUNG_heiltrankLow);
	Info_AddChoice(DIA_Biff_HEILUNG,"(Best Healing Potion)",DIA_Biff_HEILUNG_heiltrank);
};

func void DIA_Biff_HEILUNG_heiltrank()
{
	if(B_GiveInvItems(other,self,ItPo_Health_03,1))
	{
		B_UseItem(self,ItPo_Health_03);
	}
	else if(B_GiveInvItems(other,self,ItPo_Health_02,1))
	{
		B_UseItem(self,ItPo_Health_02);
	}
	else if(B_GiveInvItems(other,self,ItPo_Health_01,1))
	{
		B_UseItem(self,ItPo_Health_01);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_heiltrank_07_00");	//I'll wait for you to bring me one.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Biff_HEILUNG_heiltrankLow()
{
	if(B_GiveInvItems(other,self,ItPo_Health_01,1))
	{
		B_UseItem(self,ItPo_Health_01);
	}
	else if(B_GiveInvItems(other,self,ItPo_Health_02,1))
	{
		B_UseItem(self,ItPo_Health_02);
	}
	else if(B_GiveInvItems(other,self,ItPo_Health_03,1))
	{
		B_UseItem(self,ItPo_Health_03);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_HEILUNG_heiltrankLow_07_00");	//So you don't have it. We'll discuss it later.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Biff_HEILUNG_spaeter()
{
	AI_Output(other,self,"DIA_Biff_HEILUNG_spaeter_15_00");	//I'll give you something later.
	AI_Output(self,other,"DIA_Biff_HEILUNG_spaeter_07_01");	//Don't forget!
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DRACHENTOT(C_Info)
{
	npc = DJG_713_Biff;
	nr = 5;
	condition = DIA_Biff_DRACHENTOT_Condition;
	information = DIA_Biff_DRACHENTOT_Info;
	description = "That's it. All the dragons are dead.";
};


func int DIA_Biff_DRACHENTOT_Condition()
{
	if(DJG_BiffSurvivedLastDragon == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Biff_DRACHENTOT_Info()
{
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_00");	//The dragons are all dead.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_01");	//And we're both still breathing.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_02");	//Are you sure it was the last one?
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_03");	//I'm sure of it.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_04");	//Too bad. I just got warmed up.
	B_GivePlayerXP(XP_BiffSurvivedLastDragon);
};


instance DIA_Biff_KnowWhereEnemy(C_Info)
{
	npc = DJG_713_Biff;
	nr = 2;
	condition = DIA_Biff_KnowWhereEnemy_Condition;
	information = DIA_Biff_KnowWhereEnemy_Info;
	permanent = TRUE;
	description = "Fancy a trip around the world?";
};


func int DIA_Biff_KnowWhereEnemy_Condition()
{
	if((MIS_SCKnowsWayToIrdorath == TRUE) && (Biff_IsOnBoard == FALSE) && (MIS_ReadyforChapter6 == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Biff_KnowWhereEnemy_Info()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_00");	//Fancy a trip around the world??
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_01");	//What?
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_02");	//Nothing. My ship is overloaded anyway.
		AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_03");	//Then don't bother me for nothing.
	}
	else
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_04");	//I'm leaving Khorinis and heading for another island. There must be more battles to fight out there.
		Info_ClearChoices(DIA_Biff_KnowWhereEnemy);
		Info_AddChoice(DIA_Biff_KnowWhereEnemy,"I thought I already talked about this.",DIA_Biff_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Biff_KnowWhereEnemy,"Would you like to join?",DIA_Biff_KnowWhereEnemy_Yes);
	};
};

func void DIA_Biff_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_00");	//Would you like to join?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_01");	//I don't care about fighting. I need...
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_02");	//Where we're going, there's more gold than you can carry.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_03");	//Then I accept. Where are we going?
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_04");	//First we need to get out of the valley.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_05");	//No problem. I'm in. Meet me at the Passage.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"The prospect of riches beyond counting convinced Biff to join me.");
	B_GivePlayerXP(XP_Crewmember_Success);
	Biff_IsOnBoard = LOG_SUCCESS;
	Crewmember_Count = Crewmember_Count + 1;
	Biff_FollowsThroughPass = LOG_Running;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"RunsToPass");
	Info_ClearChoices(DIA_Biff_KnowWhereEnemy);
};

func void DIA_Biff_KnowWhereEnemy_No()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_No_15_00");	//I thought I already talked about this.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_No_07_01");	//Yeah yeah. Let's have some fun.
	Biff_IsOnBoard = LOG_OBSOLETE;
	Info_ClearChoices(DIA_Biff_KnowWhereEnemy);
};


instance DIA_Biff_Pass(C_Info)
{
	npc = DJG_713_Biff;
	nr = 55;
	condition = DIA_Biff_Pass_Condition;
	information = DIA_Biff_Pass_Info;
	permanent = TRUE;
	description = "Will you go through the pass yourself?";
};


func int DIA_Biff_Pass_Condition()
{
	if((Npc_GetDistToWP(self,"START") < 1000) && (Biff_IsOnBoard == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Biff_Pass_Info()
{
	AI_Output(other,self,"DIA_Biff_Pass_15_00");	//Will you go through the pass yourself?
	AI_Output(self,other,"DIA_Biff_Pass_07_01");	//Less talk, more action. Go!
	AI_StopProcessInfos(self);
};


instance DIA_Biff_PICKPOCKET(C_Info)
{
	npc = DJG_713_Biff;
	nr = 900;
	condition = DIA_Biff_PICKPOCKET_Condition;
	information = DIA_Biff_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Biff_PICKPOCKET_Condition()
{
	return C_Beklauen(92,320);
};

func void DIA_Biff_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Biff_PICKPOCKET);
	Info_AddChoice(DIA_Biff_PICKPOCKET,Dialog_Back,DIA_Biff_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Biff_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Biff_PICKPOCKET_DoIt);
};

func void DIA_Biff_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Biff_PICKPOCKET);
};

func void DIA_Biff_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Biff_PICKPOCKET);
};

