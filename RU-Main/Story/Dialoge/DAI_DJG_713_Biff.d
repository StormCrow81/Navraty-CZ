
func void B_KommMit()
{
	AI_Output(other,self,"DIA_AkilsSchaf_KommMit_15_00");	//Иди за мной!
};

func void b_biff_verarschen()
{
	AI_Output(self,other,"DIA_Biff_ARBEITEN_lebenlassen_07_01");	//Я не хочу, чтобы ты делал из меня дурака.
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
	description = "Что ты делаешь здесь?";
};


func int DIA_Biff_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Biff_HALLO_Info()
{
	AI_Output(other,self,"DIA_Biff_HALLO_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Biff_HALLO_07_01");	//Давно уже не слышал такого тупого вопроса. А что, по-твоему?
	Info_AddChoice(DIA_Biff_HALLO,"Your face bothers me.",DIA_Biff_HALLO_spott);
	Info_AddChoice(DIA_Biff_HALLO,"I have no idea.",DIA_Biff_HALLO_keineAhnung);
	Info_AddChoice(DIA_Biff_HALLO,"Ладно, забудь.",DIA_Biff_HALLO_doof);
};

func void DIA_Biff_HALLO_doof()
{
	AI_Output(other,self,"DIA_Biff_HALLO_doof_15_00");	//Ладно, забудь.
	Info_ClearChoices(DIA_Biff_HALLO);
};

func void DIA_Biff_HALLO_spott()
{
	AI_Output(other,self,"DIA_Biff_HALLO_spott_15_00");	//I only asked because you look so clueless.
	AI_Output(self,other,"DIA_Biff_HALLO_spott_07_01");	//That tongue of yours is going to get you into trouble.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
	DJG_BiffParty_nomore = DJG_BiffParty_nomore + 1;
};

func void DIA_Biff_HALLO_keineAhnung()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_15_00");	//Совершенно не представляю.
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_07_01");	//Я жду, когда что-нибудь, наконец, произойдет.
	Info_AddChoice(DIA_Biff_HALLO,"А что должно произойти?",DIA_Biff_HALLO_keineAhnung_was);
};

func void DIA_Biff_HALLO_keineAhnung_was()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_15_00");	//А что должно произойти?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_07_01");	//Are you that stupid? If I knew, I wouldn't be waiting.
	Info_AddChoice(DIA_Biff_HALLO,"А что может произойти?",DIA_Biff_HALLO_keineAhnung_was_was2);
};

func void DIA_Biff_HALLO_keineAhnung_was_was2()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_15_00");	//А что может произойти?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_07_01");	//Ты начинаешь действовать мне на нервы. Послушай, меня не волнует, что произойдет. Мне нужно, чтобы что-нибудь произошло.
	Info_AddChoice(DIA_Biff_HALLO,"А почему ты тогда ничего не делаешь?",DIA_Biff_HALLO_keineAhnung_was_was2_was3);
};

func void DIA_Biff_HALLO_keineAhnung_was_was2_was3()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_15_00");	//А почему ты тогда ничего не делаешь?
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_07_01");	//Stop with the stupid questions before I rip out your tongue!
	Info_AddChoice(DIA_Biff_HALLO,"Если ты будешь просто ждать здесь, ничего и не произойдет!",DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4);
};

func void DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4()
{
	AI_Output(other,self,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_15_00");	//Если ты будешь просто ждать здесь, ничего и не произойдет!
	AI_Output(self,other,"DIA_Biff_HALLO_keineAhnung_was_was2_was3_was4_07_01");	//Ты достал меня!
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
	description = "Что ты надеешься найти здесь, в Долине Рудников?";
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
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_15_00");	//Что ты надеешься найти здесь, в Долине Рудников?
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_01");	//Золото и славу. Что же еще? Когда я покончу с драконами, я буду купаться в золоте.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_07_02");	//У меня будет достаточно, чтобы провести остаток своей жизни, пытаясь посетить все таверны и бордели в стране.
	Info_AddChoice(DIA_Biff_WASHIERIMTAL,"Что ж, тогда я желаю тебе удачи.",DIA_Biff_WASHIERIMTAL_vielglueck);
	Info_AddChoice(DIA_Biff_WASHIERIMTAL,"Well, yeah, either that or you'll end up as dragon dung!",DIA_Biff_WASHIERIMTAL_ihrtot);
};

func void DIA_Biff_WASHIERIMTAL_ihrtot()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_ihrtot_15_00");	//Well, yeah, either that or you'll end up as dragon dung!
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_ihrtot_07_01");	//So what? You want to get rich, you need to take risks.
	Info_ClearChoices(DIA_Biff_WASHIERIMTAL);
};

func void DIA_Biff_WASHIERIMTAL_vielglueck()
{
	AI_Output(other,self,"DIA_Biff_WASHIERIMTAL_vielglueck_15_00");	//Good luck with that.
	AI_Output(self,other,"DIA_Biff_WASHIERIMTAL_vielglueck_07_01");	//I don't need luck. My axe is more than enough.
	Info_ClearChoices(DIA_Biff_WASHIERIMTAL);
};


instance DIA_Biff_ARBEITEN(C_Info)
{
	npc = DJG_713_Biff;
	nr = 8;
	condition = DIA_Biff_ARBEITEN_Condition;
	information = DIA_Biff_ARBEITEN_Info;
	permanent = TRUE;
	description = "Ты бы не хотел поработать на меня?";
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
	AI_Output(other,self,"DIA_Biff_ARBEITEN_15_00");	//Ты бы не хотел поработать на меня?
	B_LogEntry(TOPIC_Dragonhunter,"Охотник на драконов Бифф - типичный наемник. Если я заплачу ему, он будет сражаться вместе со мной.");
	if(DJG_BiffParty_nomore >= 6)
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_01");	//We already tried. Nothing good came of it. So thanks, but no thanks.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_07_02");	//Ммм. Почему бы и нет? Как будешь платить?
	};
	Info_ClearChoices(DIA_Biff_ARBEITEN);
	Info_AddChoice(DIA_Biff_ARBEITEN,"Считай, что тебе повезло, если я оставлю тебя в живых.",DIA_Biff_ARBEITEN_lebenlassen);
	Info_AddChoice(DIA_Biff_ARBEITEN,"Ты получишь половину добычи.",DIA_Biff_ARBEITEN_HalbeHalbe);
	Info_AddChoice(DIA_Biff_ARBEITEN,"Я заплачу тебе сто золотых.",DIA_Biff_ARBEITEN_100);
};

func void DIA_Biff_ARBEITEN_100()
{
	AI_Output(other,self,"DIA_Biff_ARBEITEN_100_15_00");	//Я заплачу тебе сто золотых.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Biff_ARBEITEN_100_07_01");	//Sounds good. Lead and I'll follow.
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
	AI_Output(other,self,"DIA_Biff_ARBEITEN_HalbeHalbe_15_00");	//Ты получишь половину добычи.
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_01");	//Звучит заманчиво. Но предупреждаю тебя: не пытайся обмануть меня. Ты пожалеешь об этом.
	AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_02");	//И еще одно: мне не нужно оружие и другое барахло, что ты соберешь там. Меня интересует только золото. Понятно?
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
		AI_Output(self,other,"DIA_Biff_ARBEITEN_HalbeHalbe_07_03");	//Но что я говорю. Ты уже знаешь все это.
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
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_07_00");	//Wait a minute! You promised me half! Hand it over!
	B_BiffsAnteil_Berechnung();
	B_BiffsAnteil_PrintScreen();
	Info_ClearChoices(DIA_Biff_GELDEINTREIBEN);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN,"Я не могу платить тебе.",DIA_Biff_GELDEINTREIBEN_zuTeuer);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN,"Вот твоя доля.",DIA_Biff_GELDEINTREIBEN_geben);
};

func void DIA_Biff_GELDEINTREIBEN_geben()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_geben_15_00");	//Вот твоя доля.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_geben_07_01");	//Хорошо. Тогда в путь.
	AI_StopProcessInfos(self);
	B_GiveInvItems(other,self,ItMi_Gold,BiffsAnteil);
	B_Biff_SetRefuseTalk();
	BIFF_LABERT_GELDEINTREIBEN = FALSE;
	DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);
};

func void DIA_Biff_GELDEINTREIBEN_zuTeuer()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_15_00");	//I can't afford that.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_07_01");	//Stop whining. We agreed to half.
	Info_ClearChoices(DIA_Biff_GELDEINTREIBEN);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN,"Боюсь, дальше наши пути расходятся.",DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen);
	Info_AddChoice(DIA_Biff_GELDEINTREIBEN,"Вот твоя доля.",DIA_Biff_GELDEINTREIBEN_geben);
};

func void DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen()
{
	AI_Output(other,self,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_15_00");	//This is where we go our separate ways.
	AI_Output(self,other,"DIA_Biff_GELDEINTREIBEN_zuTeuer_trennen_07_01");	//Fine, hand over my share then.
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
	AI_Output(self,other,"DIA_Biff_ICHBLEIBHIER_07_00");	//This place is dangerous. You go on ahead, I've got your back.
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
	description = "(Опять взять с собой Биффа)";
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
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_00");	//Не разбрасывай свое золото.
	AI_Output(self,other,"DIA_Biff_KOHLEWEGGEBEN_07_01");	//Лучше дай мне его сюда.
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
	description = "I think this is the end of our little partnership.";
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
	AI_Output(other,self,"DIA_Biff_BIFFLOSWERDEN_15_00");	//I think this is the end of our little partnership.
	AI_Output(self,other,"DIA_Biff_BIFFLOSWERDEN_07_01");	//I'll find myself a better arrangement. No problem.
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
	AI_Output(self,other,"DIA_Biff_MEHRGELD_07_00");	//It seems to me that I should get more money for this.
	if(DJG_Biff_HalbeHalbe == TRUE)
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_01");	//Сто золотых будет достаточно.
		if(DIA_Biff_MEHRGELD_Info_OneTime == FALSE)
		{
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_02");	//Don't worry. I haven't forgotten our arrangement.
			AI_Output(self,other,"DIA_Biff_MEHRGELD_07_03");	//That's why I didn't bother asking for more.
			DIA_Biff_MEHRGELD_Info_OneTime = TRUE;
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_07_04");	//Я хочу еще сто золотых.
	};
	Info_ClearChoices(DIA_Biff_MEHRGELD);
	Info_AddChoice(DIA_Biff_MEHRGELD,"Я не могу платить тебе.",DIA_Biff_MEHRGELD_zuTeuer);
	Info_AddChoice(DIA_Biff_MEHRGELD,"Хорошо. Ты этого стоишь.",DIA_Biff_MEHRGELD_ok);
};

func void DIA_Biff_MEHRGELD_ok()
{
	AI_Output(other,self,"DIA_Biff_MEHRGELD_ok_15_00");	//Хорошо. Ты этого стоишь.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_01");	//Да уж, это точно. Теперь, пошли дальше.
		AI_StopProcessInfos(self);
		if(DJG_Biff_HalbeHalbe == TRUE)
		{
			DJG_Biff_SCGold = Npc_HasItems(hero,ItMi_Gold);
		};
		B_Biff_SetRefuseTalk();
	}
	else
	{
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_02");	//You're pathetic. You can't even pay your partner!
		AI_Output(self,other,"DIA_Biff_MEHRGELD_ok_07_03");	//Я думаю, мне стоит поискать другого партнера.
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
	AI_Output(other,self,"DIA_Biff_MEHRGELD_zuTeuer_15_00");	//Я не могу платить тебе.
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
	description = "Тебе нужно лечебное зелье?";
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
	AI_Output(other,self,"DIA_Biff_HEILUNG_15_00");	//Do you need a healing potion?
	AI_Output(self,other,"DIA_Biff_HEILUNG_07_01");	//Definitely. Thank you.
	Info_ClearChoices(DIA_Biff_HEILUNG);
	Info_AddChoice(DIA_Biff_HEILUNG,"Я дам тебе что-нибудь позже.",DIA_Biff_HEILUNG_spaeter);
	Info_AddChoice(DIA_Biff_HEILUNG,"(самое маленькое лечебное зелье)",DIA_Biff_HEILUNG_heiltrankLow);
	Info_AddChoice(DIA_Biff_HEILUNG,"(лучшее лечебное зелье)",DIA_Biff_HEILUNG_heiltrank);
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
		AI_Output(self,other,"DIA_Biff_HEILUNG_heiltrank_07_00");	//I'll just wait for you to get it for me.
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
		AI_Output(self,other,"DIA_Biff_HEILUNG_heiltrankLow_07_00");	//It seems you don't have it. We'll talk about this later.
	};
	AI_StopProcessInfos(self);
};

func void DIA_Biff_HEILUNG_spaeter()
{
	AI_Output(other,self,"DIA_Biff_HEILUNG_spaeter_15_00");	//Я дам тебе что-нибудь позже.
	AI_Output(self,other,"DIA_Biff_HEILUNG_spaeter_07_01");	//Don't forget.
	AI_StopProcessInfos(self);
};


instance DIA_Biff_DRACHENTOT(C_Info)
{
	npc = DJG_713_Biff;
	nr = 5;
	condition = DIA_Biff_DRACHENTOT_Condition;
	information = DIA_Biff_DRACHENTOT_Info;
	description = "That was the last of the Dragons.";
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
	AI_Output(other,self,"DIA_Biff_DRACHENTOT_15_00");	//That's it. They're all dead.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_01");	//Да. И я все еще жив.
	AI_Output(self,other,"DIA_Biff_DRACHENTOT_07_02");	//Ты уверен, что это был последний?
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
	description = "Ты не хотел бы совершить небольшое путешествие по миру?";
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
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_00");	//Ты не хотел бы совершить небольшое путешествие по миру?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_01");	//Что?
	if(Crewmember_Count >= Max_Crew)
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_02");	//Forget it. My ship is full anyway.
		AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_07_03");	//Then don't bother me for nothing.
	}
	else
	{
		AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_15_04");	//Я собираюсь покинуть Хоринис и отправиться на другой остров. Там должны быть еще враги.
		Info_ClearChoices(DIA_Biff_KnowWhereEnemy);
		Info_AddChoice(DIA_Biff_KnowWhereEnemy,"Мне казалось, я уже говорил об этом.",DIA_Biff_KnowWhereEnemy_No);
		Info_AddChoice(DIA_Biff_KnowWhereEnemy,"Ты не хочешь присоединиться?",DIA_Biff_KnowWhereEnemy_Yes);
	};
};

func void DIA_Biff_KnowWhereEnemy_Yes()
{
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_00");	//Ты не хочешь присоединиться?
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_01");	//Меня не волнуют враги. Мне нужно...
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_02");	//Там куда мы направляемся, больше золота, чем ты сможешь унести.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_03");	//В таком случае я в деле. Куда мы направляемся?
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_Yes_15_04");	//Сначала нам нужно выбраться из Долины Рудников.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_Yes_07_05");	//No problem, I'll meet you at the Passage.
	Log_CreateTopic(Topic_Crew,LOG_MISSION);
	Log_SetTopicStatus(Topic_Crew,LOG_Running);
	B_LogEntry(Topic_Crew,"Перспектива разбогатеть убедила Биффа присоединиться ко мне. Пока он получает достаточно золота, я могу рассчитывать на него.");
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
	AI_Output(other,self,"DIA_Biff_KnowWhereEnemy_No_15_00");	//Мне казалось, я уже говорил об этом.
	AI_Output(self,other,"DIA_Biff_KnowWhereEnemy_No_07_01");	//Yeah yeah. Let's go have some fun.
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
	description = "Ты пройдешь сам через Проход?";
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
	AI_Output(other,self,"DIA_Biff_Pass_15_00");	//Ты пройдешь сам через Проход?
	AI_Output(self,other,"DIA_Biff_Pass_07_01");	//Enough chit chat. I need to get off my ass and do something!
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

