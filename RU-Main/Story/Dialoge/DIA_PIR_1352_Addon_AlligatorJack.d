

instance DIA_Addon_AlligatorJack_Exit(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 999;
	condition = DIA_Addon_AlligatorJack_Exit_Condition;
	information = DIA_Addon_AlligatorJack_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_AlligatorJack_Exit_Condition()
{
	return TRUE;
};


var int DIA_Addon_AlligatorJack_Exit_Info_OneTime;

func void DIA_Addon_AlligatorJack_Exit_Info()
{
	if((MIS_KrokoJagd == LOG_SUCCESS) && (DIA_Addon_AlligatorJack_Exit_Info_OneTime == FALSE))
	{
		AI_Output(self,other, " DIA_Addon_AlligatorJack_Exit_12_00 " );	// If you need me, you can find me at my camp near the stockade.
		if (PIR_1354_Addon_Henry.aivar[AIV_TalkedToPlayer] ==  FALSE )
		{
			AI_Output(other,self,"DIA_Addon_AlligatorJack_Exit_15_01");	//Частоколом?
			AI_Output(self,other, " DIA_Addon_AlligatorJack_Exit_12_02 " );	// Keep going west and you'll see what I'm talking about.
		};
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
		self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
		DIA_Addon_AlligatorJack_Exit_Info_OneTime = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_Addon_AlligatorJack_PICKPOCKET(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 900;
	condition = DIA_Addon_AlligatorJack_PICKPOCKET_Condition;
	information = DIA_Addon_AlligatorJack_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_AlligatorJack_PICKPOCKET_Condition()
{
	return  C_Robbery ( 100 , 333 );
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
	Info_AddChoice(DIA_Addon_AlligatorJack_PICKPOCKET,Dialog_Back,DIA_Addon_AlligatorJack_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_AlligatorJack_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_AlligatorJack_PICKPOCKET_DoIt);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
};

func void DIA_Addon_AlligatorJack_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_PICKPOCKET);
};


instance DIA_Addon_AlligatorJack_Hello(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Hello_Condition;
	information = DIA_Addon_AlligatorJack_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_Hello_Condition()
{
	if(GregIsBack == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Hello_Info()
{
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Hello_12_00 " );	// Who the hell are you? You are not like the others.
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Hello_15_01 " );	// What else?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Hello_12_02 " );	// Well, mages who settled here.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Hello_12_03 " );	// You're from their company, right?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Hello_12_04 " );	// Pretty brave of you walking around here alone.
};


instance DIA_Addon_AlligatorJack_WerBistDu(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_WerBistDu_Condition;
	information = DIA_Addon_AlligatorJack_WerBistDu_Info;
	description = " Who are you? " ;
};


func int DIA_Addon_AlligatorJack_WerBistDu_Condition()
{
	return TRUE;
};

func void DIA_Addon_AlligatorJack_WerBistDu_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_WerBistDu_15_00 " );	// Who are you?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_WerBistDu_12_01 " );	// I'm sure you've heard of me.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_WerBistDu_12_02 " );	// (proudly) I'm Alligator Jack.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_WerBistDu_12_03 " );	// The sailors of the whole country are afraid of me. I am one of the most dangerous pirates in these waters.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_WerBistDu_12_04 " );	// Captain Greg and I have robbed more merchant ships than I can count.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_WerBistDu_12_05 " );	// So now you're talking to a living legend.
};


instance DIA_Addon_AlligatorJack_Proposal (C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Proposal_Condition;
	information = DIA_Addon_AlligatorJack_Proposal_Info;
	description = " Do you know a man named Raven? " ;
};


func int DIA_Addon_AlligatorJack_Proposal_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Proposal_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Vorschlag_15_00 " );	// Do you know a man named Raven?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Vorschlag_12_01 " );	// Of course. He commands the bandits living in the east.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Vorschlag_12_02 " );	// What do you want from him?
	B_LogEntry(TOPIC_Addon_RavenKDW, " Raven and his bandits can be found in the eastern part of the valley. " );
	Info_ClearChoices(DIA_Addon_AlligatorJack_Proposal);
	Info_AddChoice(DIA_Addon_AlligatorJack_Vorschlag, " I want to join Raven. " ,DIA_Addon_AlligatorJack_Vorschlag_join);
	Info_AddChoice(DIA_Addon_AlligatorJack_Vorschlag, " I have to kill Raven. " ,DIA_Addon_AlligatorJack_Vorschlag_tot);
};

func void B_AlligatorJack_Besser()
{
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Besser_12_00 " );	// Okay, I have a better offer for you.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Besser_12_01 " );	// Join us.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Besser_12_02 " );	// You will have time to think things over.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Besser_12_03 " );	// And when you try our rum, your views on life will change.
	Info_ClearChoices(DIA_Addon_AlligatorJack_Proposal);
};

func void DIA_Addon_AlligatorJack_Proposal_tot()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Vorschlag_tot_15_00 " );	// I have to kill Raven.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Vorschlag_tot_12_01 " );	// (laughs) What? You? And how are you going to do it?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Vorschlag_tot_12_02 " );	// Can he do it for you?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Vorschlag_tot_12_03 " );	// You won't even get close to him. His bandits will skin you alive.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Vorschlag_tot_12_04 " );	// You won't even get past their first post.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Vorschlag_tot_12_05 " );	// You look so that their hands will itch at the sight of you.
	B_AlligatorJack_Besser();
};

func void DIA_Addon_AlligatorJack_Proposal_join()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Vorschlag_join_15_00 " );	// I want to join Raven.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Vorschlag_join_12_01 " );	// Really?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Vorschlag_join_12_02 " );	// And you don't look like a man ready to join this rabble.
	B_AlligatorJack_Besser();
};


instance DIA_Addon_AlligatorJack_BDTRuestung(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_BDTRuestung_Condition;
	information = DIA_Addon_AlligatorJack_BDTRuestung_Info;
	description = " I need bandit armor. " ;
};


func int DIA_Addon_AlligatorJack_BDTRuestung_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Vorschlag) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_BDTRuestung_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_BDTRuestung_15_00 " );	// I need bandit armor.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_BDTRuestung_12_01 " );	// Why do you need them?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_BDTRuestung_12_02 " );	// If you're seen wearing them, you might get in trouble.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_BDTRuestung_12_03 " );	// They will take you for a bandit and try to kill you.
	Info_ClearChoices(DIA_Addon_AlligatorJack_BDTRuestung);
	Info_AddChoice(DIA_Addon_AlligatorJack_BDTRuestung, " Do you know where I can find this armor? " ,DIA_Addon_AlligatorJack_BDTRuestung_wo);
	Info_AddChoice(DIA_Addon_AlligatorJack_BDTRuestung, " Sounds good... " ,DIA_Addon_AlligatorJack_BDTRuestung_gut);
};

func void DIA_Addon_AlligatorJack_BDTRuestung_gut()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_BDTRuestung_gut_15_00 " );	// Sounds good...
	AI_Output(self,other, " DIA_Addon_AlligatorJack_BDTRuestung_gut_12_01 " );	// Yes, for someone who is contemplating suicide.
};

func void DIA_Addon_AlligatorJack_BDTRuestung_wo()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_BDTRuestung_wo_15_00 " );	// Do you know where I can find such armor?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_BDTRuestung_wo_12_01 " );	// We had one set at the pirate camp.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_BDTRuestung_wo_12_03 " );	// I don't know if he's still there.
	B_LogEntry(TOPIC_Addon_BDTRuestung, " Pirates should have bandit armor. But Alligator Jack can't tell me if it does. " );
	Info_ClearChoices(DIA_Addon_AlligatorJack_BDTRuestung);
};


instance DIA_Addon_AlligatorJack_Greg(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Greg_Condition;
	information = DIA_Addon_AlligatorJack_Greg_Info;
	description = " Is your captain's name Greg? " ;
};


func int DIA_Addon_AlligatorJack_Greg_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Greg_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Greg_15_00 " );	// Is your captain's name Greg?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Greg_12_01 " );	// Yes. And this is the greatest pirate ever to sail the sea.
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Greg_15_02 " );	// I think I know your captain. I met him in Khorinis.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Greg_12_03 " );	// (laughs) Greg? In Khorinis? Nonsense!
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Greg_12_04 " );	// Greg and part of the team went to sea for prey.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Greg_12_05 " );	// He can get to Khorinis only on the royal prison galley.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Greg_12_06 " );	// This is one of the most notorious criminals in the country.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Greg_12_07 " );	// He will never enter the city of his own free will. The first guard will detain him and throw him in prison.
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Greg_15_08 " );	// Well, if you say so...
};


instance DIA_Addon_AlligatorJack_PIRLager(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_PIRLager_Condition;
	information = DIA_Addon_AlligatorJack_PIRLager_Info;
	description = " Where is your camp? " ;
};


func int DIA_Addon_AlligatorJack_PIRLager_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_WerBistDu) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_PIRLager_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_PIRLager_15_00 " );	// Where is your camp?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_PIRLager_12_01 " );	// See this passage? Go through it and head west. Sooner or later you will reach our shore.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_PIRLager_12_02 " );	// That's where our houses are.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_PIRLager_12_03 " );	// I could see you off, but you have to do me one favor.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_PIRLager_15_04");	//Какую же?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_PIRLager_12_05 " );	// Before returning to the camp, I must get the guys food.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_PIRLager_12_06 " );	// You look like a strong person.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_PIRLager_12_07 " );	// You could help me hunt. I agree?
	Log_CreateTopic(TOPIC_Addon_RatHunt,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RatHunt,LOG_Running);
	B_LogEntry(TOPIC_Addon_RatHunt, " Alligator Jack needs help hunting. " );
};


instance DIA_Addon_AlligatorJack_WasJagen(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_WasJagen_Condition;
	information = DIA_Addon_AlligatorJack_WasJagen_Info;
	description = " Who are you hunting? " ;
};


func int DIA_Addon_AlligatorJack_WasJagen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_WasJagen_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_WasJagen_15_00 " );	// Who are you hunting?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_WasJagen_12_01 " );	// Most often on alligators. But their meat is inedible.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_WasJagen_12_02 " );	// Besides, they are no longer here.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_WasJagen_12_03 " );	// That's why I have to catch swamp rats.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_WasJagen_15_04");	//Что?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_WasJagen_12_05 " );	// The meat of most local animals either tastes like old socks or is tough like soles.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_WasJagen_12_06 " );	// Only the meat of these fat swamp rats is more or less edible.
	B_LogEntry(TOPIC_Addon_RatHunt, " The only animal you can eat here is the swamp rat. " );
};


instance DIA_Addon_AlligatorJack_Pirates(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Pirates_Condition;
	information = DIA_Addon_AlligatorJack_Pirates_Info;
	permanent = FALSE;
	description = " Tell me more about pirates. " ;
};


func int DIA_Addon_AlligatorJack_Pirates_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_PIRLager))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Pirates_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Pirates_15_00 " );	// Tell me more about the pirates.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Pirates_12_01 " );	// We have been living here for many years. Before the start of the war, we were known everywhere, from Khorinis to the continent.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Pirates_12_02 " );	// The mere sight of our flag struck terror into the hearts of sailors on merchant ships.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Pirates_12_03 " );	// But those days are gone. We haven't seen any ships carrying loot for weeks now.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Pirates_12_04 " );	// Captain Greg, with a handful of men, set off in search of ships.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Pirates_12_05 " );	// And the rest just sit in the camp and wait for him to return.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Pirates_12_06 " );	// I hope he brings a solid jackpot.
};


instance DIA_Addon_AlligatorJack_LetsGoHunting(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_LetsGoHunting_Condition;
	information = DIA_Addon_AlligatorJack_LetsGoHunting_Info;
	permanent = TRUE;
	description = " Let's go hunting. " ;
};


func int DIA_Addon_AlligatorJack_LetsGoHunting_Condition()
{
	if ((MIS_Crocodile Hunted ==  FALSE ) && Npc_KnowsInfo(other, DIA_Addon_AlligatorJack_WasHunting) && (GregIsBack ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_LetsGoHunting_Info()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_15_00");	//Пойдем на охоту.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_LetsGoHunting_12_01 " );	// Great. The two of us can handle this with ease.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_LetsGoHunting_12_02");	//Ты готов?
	Info_ClearChoices(DIA_Addon_AlligatorJack_LetsGoHunting);
	Info_AddChoice(DIA_Addon_AlligatorJack_LetsGoHunting,"Еще нет.",DIA_Addon_AlligatorJack_LetsGoHunting_No);
	Info_AddChoice(DIA_Addon_AlligatorJack_LetsGoHunting,"Да.",DIA_Addon_AlligatorJack_LetsGoHunting_Yes);
};


const int AlligatorJack_Inter1 = 1;
const int AlligatorJack_Kessel = 2;
const int AlligatorJack_Inter2 = 3;
const int AlligatorJack_Canyon = 4;

func void DIA_Addon_AlligatorJack_LetsGoHunting_Yes()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_Yes_15_00");	//Да.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_LetsGoHunting_Yes_12_01 " );	// Great. Stay close to me
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Npc_ExchangeRoutine(self,"HUNT1");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_06");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(Swamprat,"ADW_PIRATECAMP_WATERHOLE_07");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	Wld_InsertNpc(Swamprat,"ADW_CANYON_TELEPORT_PATH_06");
	AlligatorJack_JagdStart = AlligatorJack_Inter1;
	MIS_KrokoHunt = LOG_Running;
};

func void DIA_Addon_AlligatorJack_LetsGoHunting_No()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_LetsGoHunting_No_15_00");	//Еще нет.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_LetsGoHunting_No_12_01 " );	// Let's go faster.
	Info_ClearChoices(DIA_Addon_AlligatorJack_LetsGoHunting);
};


instance DIA_Addon_AlligatorJack_AlligatorJackInter1(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition;
	information = DIA_Addon_AlligatorJack_AlligatorJackInter1_Info;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_AlligatorJackInter1_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Inter1) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter1_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter1_12_00");	//Низины.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_AlligatorJackInter1_12_01 " );	// These rats are found here.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_AlligatorJackInter1_12_02 " );	// Follow me.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT2");
	AlligatorJack_JagdStart = AlligatorJack_Kessel;
};


instance DIA_Addon_AlligatorJack_TheHunt(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_TheHunt_Condition;
	information = DIA_Addon_AlligatorJack_TheHunt_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_TheHunt_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Kessel) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WATERHOLE_07") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TheHunt_Info()
{
	AI_Output(self,other, " DIA_Addon_AlligatorJack_TheHunt_12_00 " );	// That's what I was afraid of.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_15_01");	//Чего?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_TheHunt_12_02 " );	// This is only half of the amount of game we need.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_TheHunt_12_03 " );	// Now we have to go to the canyon.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_TheHunt_12_04 " );	// Be careful. Going deeper into the canyon is extremely dangerous.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_TheHunt_12_05 " );	// If you value your life, don't leave me.
	Wld_InsertNpc(Waran,"ADW_ENTRANCE_2_VALLEY_10");
	Wld_InsertNpc(Waran,"ADW_ENTRANCE_2_VALLEY_10");
	Info_ClearChoices(DIA_Addon_AlligatorJack_TheHunt);
	Info_AddChoice(DIA_Addon_AlligatorJack_TheHunt, " What's in the canyon? " ,DIA_Addon_AlligatorJack_TheHunt_Enough);
	Info_AddChoice(DIA_Addon_AlligatorJack_TheHunt,"Хорошо, пойдем.",DIA_Addon_AlligatorJack_TheHunt_Running);
};

func void DIA_Addon_AlligatorJack_TheHunt_Enough()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_TheHunt_Enough_15_00 " );	// What's in the canyon?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_TheHunt_Enough_12_01 " );	// We try to avoid this place.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_TheHunt_Enough_12_02 " );	// Razor teeth live there. Vile creatures. If you want to live, stay away from them.
};

func void DIA_Addon_AlligatorJack_TheHunt_Running()
{
	AI_Output(other,self,"DIA_Addon_AlligatorJack_TheHunt_Running_15_00");	//Хорошо, пойдем.
	AI_Output(self,other,"DIA_Addon_AlligatorJack_TheHunt_Running_12_01");	//Замечательно.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT3");
	AlligatorJack_JagdStart = AlligatorJack_Inter2;
};


instance DIA_Addon_AlligatorJack_AlligatorJackInter2(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition;
	information = DIA_Addon_AlligatorJack_AlligatorJackInter2_Info;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_AlligatorJackInter2_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Inter2) && (Npc_GetDistToWP(self,"ADW_PIRATECAMP_WAY_16") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_AlligatorJackInter2_Info()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_AlligatorJackInter2_12_00");	//Вперед.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"HUNT4");
	AlligatorJack_JagdStart = AlligatorJack_Canyon;
};


instance DIA_Addon_AlligatorJack_HuntEnd(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_HuntEnd_Condition;
	information = DIA_Addon_AlligatorJack_HuntEnd_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_HuntEnd_Condition()
{
	if((AlligatorJack_JagdStart == AlligatorJack_Canyon) && (Npc_GetDistToWP(self,"ADW_CANYON_TELEPORT_PATH_06") <= 500) && (GregIsBack == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_HuntEnd_Info()
{
	if(AlligatorJack_KrokosKilled == 0)
	{
		AI_Output(self,other, " DIA_Addon_AlligatorJack_HuntEnd_12_00 " );	// Can you remind me why I took you?
		AI_Output(self,other, " DIA_Addon_AlligatorJack_HuntEnd_12_01 " );	// You didn't kill a single swamp rat!
		AI_Output(self,other, " DIA_Addon_AlligatorJack_HuntEnd_12_02 " );	// Okay. Maybe something will come out of you.
	}
	else  if (AlligatorJack_KrokosKilled ==  1 )
	{
		AI_Output(self,other, " DIA_Addon_AlligatorJack_HuntEnd_12_03 " );	// Not bad. A person like you can be of use to us.
		AI_Output(self,other, " DIA_Addon_AlligatorJack_HuntEnd_12_04 " );	// On your first hunt, you got one animal. Very well.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_AlligatorJack_HuntEnd_12_05 " );	// And you are a good hunter.
		AI_Output(self,other, " DIA_Addon_AlligatorJack_HuntEnd_12_06 " );	// Gods! If you continue to hunt like this, next time I can stay at the camp.
	};
	AI_Output(self,other, " DIA_Addon_AlligatorJack_PassHenry_12_07 " );	// Take this swamp rat meat to lazy old Morgan.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_PassHenry_12_08 " );	// You will find him in our camp.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_PassHenry_12_09 " );	// He must be basking in the sun. Give him the meat, he is waiting.
	if ( PIR_1354_Addon_Henry . aivar [ AIV_PASSGATE ] ==  FALSE ) .
	{
		AI_Output(self,other, " DIA_Addon_AlligatorJack_PassHenry_12_10 " );	// The entrance to the camp is usually guarded by Henry. His task is not to let the bandits through.
		AI_Output(self,other, " DIA_Addon_AlligatorJack_PassHenry_12_11 " );	// If he refuses to let you in, say I sent you.
		AI_Output(self,other, " DIA_Addon_AlligatorJack_PassHenry_12_12 " );	// Maybe this will make him more accommodating.
		AI_Output(self,other, " DIA_Addon_AlligatorJack_PassHenry_12_13 " );	// Henry sometimes gets carried away with being the boss...
	};
	MIS_AlligatorJack_BringMeat = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_BringMeat,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BringMeat,LOG_Running);
	B_LogEntry(TOPIC_Addon_BringMeat, " Gator Jack gave me ten pieces of meat. I have to give them to Morgan. " );
	B_LogEntry_Quiet(TOPIC_Addon_RatHunt, " The hunt was successful. We killed some swamp rats. " );
	B_GiveInvItems(self,other,ItFoMuttonRaw,10);
	MIS_KrokoHunt = LOG_SUCCESS ;
	B_GivePlayerXP(XP_Addon_KrokoJagd);
};


instance DIA_Addon_AlligatorJack_Angus(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Angus_Condition;
	information = DIA_Addon_AlligatorJack_Angus_Info;
	permanent = FALSE;
	description = " Do you know Angus and Hank? " ;
};


func int DIA_Addon_AlligatorJack_Angus_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Bill_AngusnHank) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Angus_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Angus_15_00 " );	// Do you know Angus and Hank?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Angus_12_03 " );	// I haven't seen them in quite some time.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Angus_12_04 " );	// And I won't cry if these tramps don't come back at all.
	AI_Output(other,self,"DIA_Addon_AlligatorJack_Angus_15_05");	//Почему?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Angus_12_06 " );	// This couple is constantly staggering by the lake and scaring the game.
};

instance DIA_Addon_AlligatorJack_Lake(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Lake_Condition;
	information = DIA_Addon_AlligatorJack_Lake_Info;
	permanent = FALSE;
	description = " What is this lake? " ;
};

func int DIA_Addon_AlligatorJack_Lake_Condition()
{
	if((Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Angus) == TRUE) && (MIS_Addon_Morgan_SeekTraitor != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Lake_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Lake_15_00 " );	// What is this lake?

	if(MIS_KrokoJagd == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Addon_AlligatorJack_Lake_12_01 " );	// Remember our hunt?
		AI_Output(other,self,"DIA_Addon_AlligatorJack_Lake_15_02");	//Да.
		AI_Output(self,other, " DIA_Addon_AlligatorJack_Lake_12_03 " );	// Lake in the lowland! I met them there all the time.
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_AlligatorJack_Lake_12_04 " );	// A lake in a large lowland.
		AI_Output(self,other, " DIA_Addon_AlligatorJack_Lake_12_05 " );	// Go east from the camp. It is impossible not to notice the low.
		AI_Output(self,other, " DIA_Addon_AlligatorJack_Lake_12_06 " );	// There are many more small waterfalls.
		AI_Output(self,other, " DIA_Addon_AlligatorJack_Lake_12_07 " );	// Be careful - if you have nothing but sand under your feet, then you missed the turn and ended up in the canyon.
	};
	B_LogEntry(TOPIC_Addon_SkipsGrog, " The cave should be in the low ground east of the camp, next to the lake. Where we hunted rats. " );
};


instance DIA_Addon_AlligatorJack_CanLearn(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_CanLearn_Condition;
	information = DIA_Addon_AlligatorJack_CanLearn_Info;
	permanent = TRUE;
	description = " Can you teach me something? " ;
};


func int DIA_Addon_AlligatorJack_CanLearn_Condition()
{
	if(AlligatorJack_Addon_TeachPlayer == FALSE)
	{
		if((Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_HuntEnd) == TRUE) || (GregIsBack == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Addon_AlligatorJack_CanLearn_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_CanLearn_15_00 " );	// Can you teach me something?

	if(MIS_KrokoJagd > LOG_Running)
	{
		AI_Output(self,other, " DIA_Addon_AlligatorJack_CanLearn_12_01 " );	// Of course! I am a good hunter and I can teach you how to skin animals and pull out teeth.
		AI_Output(self,other, " DIA_Addon_AlligatorJack_CanLearn_12_02 " );	// If you want, I can teach you.
		Log_CreateTopic(Topic_Addon_PIR_Teacher,LOG_NOTE);
		B_LogEntry(Topic_Addon_PIR_Teacher, " Alligator Jack can teach me how to skin animals and pull out teeth. He can also teach me how to shoot a bow better. " );
		AlligatorJack_Addon_TeachPlayer = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_AlligatorJack_CanLearn_12_03 " );	// But first you have to show me that you're ready for the hunter's life.
		AI_Output(self,other, " DIA_Addon_AlligatorJack_CanLearn_12_04 " );	// I'll only teach you after we go hunting together.
	};
};

func void B_AJ_Teach()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_Teach);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,Dialog_Back,DIA_Addon_AlligatorJack_Teach_Back);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1) * 5),DIA_Addon_AlligatorJack_Teach_Bow_5);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Addon_AlligatorJack_Teach_Bow_1);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP1,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX)),dia_addon_alligatorjack_teach_hp_1);
	Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforhitpoints(PRINT_LEARNHP5,B_GetLearnCostAttribute(other,ATR_HITPOINTS_MAX) * 5),dia_addon_alligatorjack_teach_hp_5);

	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	{
		Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforsmithhunt("Сдирать кожу рептилий.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_ReptileSkin)),DIA_Addon_AlligatorJack_Teach_FUR);
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{
		Info_AddChoice(DIA_Addon_AlligatorJack_Teach,b_buildlearnstringforsmithhunt("Выдирать клыки.",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Addon_AlligatorJack_Teach_Teeth);
	};
};


instance DIA_Addon_AlligatorJack_Teach(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Teach_Condition;
	information = DIA_Addon_AlligatorJack_Teach_Info;
	permanent = TRUE;
	description = " Teach me! " ;
};

func int DIA_Addon_AlligatorJack_Teach_Condition()
{
	if(AlligatorJack_Addon_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Teach_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Teach_15_00 " );	// I'm ready to learn!
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Teach_12_01 " );	// What can I teach you?
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_Back()
{
	Info_ClearChoices(DIA_Addon_AlligatorJack_Teach);
};

func void DIA_Addon_AlligatorJack_Teach_Bow_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,75);
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_Bow_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,75);
	B_AJ_Teach();
};

func void dia_addon_alligatorjack_teach_hp_1()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,1,T_MAX_HP);
	B_AJ_Teach();
};

func void dia_addon_alligatorjack_teach_hp_5()
{
	b_teachattributepointshitpoints(self,other,ATR_HITPOINTS_MAX,5,T_MAX_HP);
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_FUR()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_ReptileSkin] == FALSE)
	{
		if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_ReptileSkin))
		{
			AI_Output(self,other, " DIA_Addon_AlligatorJack_Teach_Fur_12_00 " );	// Always make an incision in the belly, otherwise you will ruin the hide.
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};

func void DIA_Addon_AlligatorJack_Teach_Teeth()
{
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
	{
		B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth);
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
	B_AJ_Teach();
};

func void B_AlliJack_AlliKlar()
{
	AI_Output(self,other,"DIA_Addon_AlligatorJack_Anheuern_12_01");	//Хорошо...
};

instance DIA_Addon_AlligatorJack_Hire (C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 11;
	condition = DIA_Addon_AlligatorJack_Hire_Condition;
	information = DIA_Addon_AlligatorJack_Hire_Info;
	permanent = FALSE;
	description = " Let's go hunting. " ;
};

func int DIA_Addon_AlligatorJack_Hire_Condition()
{
	if(MIS_Addon_Greg_ClearCanyon == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Hire_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Anheuern_15_00 " );	// Let's go hunting.
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos(self);
	B_Addon_PiratesFollowAgain();
	Npc_ExchangeRoutine(self,"FOLLOW");
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
};


instance DIA_Addon_AlligatorJack_ComeOn(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 12;
	condition = DIA_Addon_AlligatorJack_ComeOn_Condition;
	information = DIA_Addon_AlligatorJack_ComeOn_Info;
	permanent = TRUE;
	description = " Come with me. " ;
};


func int DIA_Addon_AlligatorJack_ComeOn_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBER ] ==  FALSE ) && (MY_Addon_Greg_ClearCanyon == LOG_Running) && Npc_KnowsInfo(other,DIA_Addon_AlligatorJack_Anheuern));
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_ComeOn_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_KommMit_15_00 " );	// Join me.
	if(C_GregsPiratesTooFar() == TRUE)
	{
		B_Say(self,other,"$NOTNOW");
		AI_StopProcessInfos(self);
	}
	else
	{
		B_AlliJack_AlliKlar();
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"FOLLOW");
		self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	};
};


instance DIA_Addon_AlligatorJack_GoHome(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 13;
	condition = DIA_Addon_AlligatorJack_GoHome_Condition;
	information = DIA_Addon_AlligatorJack_GoHome_Info;
	permanent = TRUE;
	description = " I don't need you anymore. " ;
};


func int DIA_Addon_AlligatorJack_GoHome_Condition()
{
	if((self.aivar[AIV_PARTYMEMBER] == TRUE) && (MIS_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_GoHome_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_DontNeedYou_15_00 " );	// I don't need you anymore.
	B_AlliJack_AlliKlar();
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_Addon_AlligatorJack_TooFar(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 14;
	condition = DIA_Addon_AlligatorJack_TooFar_Condition;
	information = DIA_Addon_AlligatorJack_TooFar_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_AlligatorJack_TooFar_Condition()
{
	if ((self.aivar[ AIV_PARTYMEMBER ] ==  TRUE ) && (C_GregPiratesTooFar() ==  TRUE ) && (MY_Addon_Greg_ClearCanyon == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_TooFar_Info()
{
	B_Say(self,other,"$RUNAWAY");
	B_Addon_PiratesGoHome();
	AI_StopProcessInfos(self);
};

instance DIA_Addon_AlligatorJack_Croc(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Croc_Condition;
	information = DIA_Addon_AlligatorJack_Croc_Info;
	permanent = FALSE;
	description = " Why are you called the Alligator? " ;
};

func int DIA_Addon_AlligatorJack_Croc_Condition()
{
	if(MIS_KrokoJagd == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Croc_Info()
{
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Croc_01_00 " );	// Why are you called the Alligator?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_01_01 " );	// It all happened because of the case when I was almost eaten by a huge alligator.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_01_02 " );	// This thing bit me so hard I almost died!
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_01_03 " );	// But, fortunately for me, Samuel managed to cure me.
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Croc_01_04 " );	// Couldn't you handle an ordinary crocodile?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_01_05 " );	// Eh, boy. It wasn't just a crocodile!
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_01_06 " );	// Such as this creature, I have never had to see in my life.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_01_07 " );	// This alligator's scales were so strong that I could only scratch him a little with my saber.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_01_08 " );	// We called him Puffer. And we try not to get too close to the lake unnecessarily.
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Croc_01_09 " );	// Maybe then we can hunt him together?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_01_10 " );	// Did you hit your head? Better forget it.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_01_11 " );	// Ordinary arrows and blades won't be able to harm him.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_01_12 " );	// And one bite of it will be enough to send you to the next world.
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Croc_01_13 " );	// Well, if I still want to hunt him, where can I find this monster?
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_01_14 " );	// Sometimes he is seen on the shallows next to the lake.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_01_15 " );	// But you're definitely crazy if you're thinking of doing this!
	MIS_Alligator = LOG_Running;
	Log_CreateTopic(TOPIC_Alligator,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Alligator,LOG_Running);
	B_LogEntry(TOPIC_Alligator, " Alligator Jack told me a story about how he was almost eaten by a huge alligator. It looks like this creature is very strong. It lives nearby somewhere near the lake in a ditch. " );
};

instance DIA_Addon_AlligatorJack_Croc_Done(C_Info)
{
	npc = PIR_1352_Addon_AlligatorJack;
	nr = 5;
	condition = DIA_Addon_AlligatorJack_Croc_Done_Condition;
	information = DIA_Addon_AlligatorJack_Croc_Done_Info;
	permanent = FALSE;
	description = " That alligator of yours is dead. " ;
};

func int DIA_Addon_AlligatorJack_Croc_Done_Condition()
{
	if((MIS_Alligator == LOG_Running) && (Npc_IsDead(ALLIGATOR_UNIQ) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_AlligatorJack_Croc_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Croc_Done_01_00 " );	// That alligator of yours is dead.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_Done_01_01 " );	// (incredulously) Are you kidding, buddy?
	AI_Output(other,self, " DIA_Addon_AlligatorJack_Croc_Done_01_02 " );	// If you don't believe me, you can go and see for yourself. His carcass probably still lies on the shore of the lake.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_Done_01_04 " );	// Hmmm. And you are brave! I respect those.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_Done_01_05 " );	// Well, then I should thank you for your help.
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_Done_01_06 " );	// I don't have any gold with me right now. But from the last hunt, there was one pretty good hide of mrakoris left here!
	AI_Output(self,other, " DIA_Addon_AlligatorJack_Croc_Done_01_07 " );	// Here, you can take it.
	B_GiveInvItems(self,other,ItAt_ShadowFur,1);
	MIS_Alligator = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Alligator,LOG_SUCCESS);
	B_LogEntry(TOPIC_Alligator, " I told Jack that I managed to kill his alligator. After that, he seemed to respect me and gave me the skin of the mrakoris. " );
};
