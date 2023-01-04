

instance DIA_VLK_6132_GAYVERN_EXIT(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 999;
	condition = dia_vlk_6132_gayvern_exit_condition;
	information = dia_vlk_6132_gayvern_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_vlk_6132_gayvern_exit_condition()
{
	return TRUE;
};

func void dia_vlk_6132_gayvern_exit_info()
{
	AI_StopProcessInfos(self);
};


instances DIA_VLK_6132_GAYVERN_HALLO (C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_hallo_condition;
	information = dia_vlk_6132_gayvern_hello_info;
	permanent = FALSE;
	description = " Hi, who are you? " ;
};


func int dia_vlk_6132_gayvern_hallo_condition()
{
	return TRUE;
};

func void dia_vlk_6132_gayvern_hallo_info()
{
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Hallo_01_00 " );	// Hello, who are you?
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hallo_01_01 " );	// My name is Gavern. And you, as I understand it, are new in this city.
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Hallo_01_02 " );	// Where did you get that info from?
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hallo_01_03 " );	// (laughs) There is not a single person in the waterfront that I don't know.
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hallo_01_04 " );	// But I see you here for the first time!
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Hallo_01_05 " );	// So? Maybe I'm from another part of the city - for example, from the upper quarter?
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hallo_01_06 " );	// WHO? You? ... (laughs) Do you see yourself, guy?
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hallo_01_07 " );	// You look like a ragamuffin! (laughs) 
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hallo_01_08 " );	// No, buddy, they won't let people like you in there.
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hallo_01_09 " );	// So don't try to fool me, funny guy.
};


instance DIA_VLK_6132_GAYVERN_WORK(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_work_condition;
	information = dia_vlk_6132_gayvern_work_info;
	permanent = FALSE;
	description = " What do you do? " ;
};


func int dia_vlk_6132_gayvern_work_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6132_gayvern_hallo))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_work_info()
{
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Work_01_00 " );	// What are you doing?
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Work_01_01 " );	// I used to work at the port.
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Work_01_02 " );	// But since merchant ships stopped entering Khorinis, there has been no work here at all.	
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Work_01_03 " );	// So I've already been sitting, read it, for a month and a half without anything to do. In short, boredom!
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Work_01_04 " );	// So you're unemployed?
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Work_01_07 " );	// Not really. Cardiff, the owner of this tavern, offered me a job as a bouncer for him.
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Work_01_11 " );	// Its not pleasant, but what can you do - you need to live on something.
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Work_01_12 " );	// I wish I could do something else, but who needs me like this... (sadly)

	if (( MIS_TRADEHELPER  != LOG_Running) || ( MIS_TRADEHELPER  !=  LOG_SUCCESS ) || ( MIS_TRADEHELPER  !=  LOG_FAILED ))
	{
		AI_Output(self,other, " DIA_VLK_6132_Gayvern_Work_01_14 " );	// Look, do YOU ​​happen to have a job for me?
		AI_Output(other,self, " DIA_VLK_6132_Gayvern_Work_01_15 " );	// Probably not. But if anything comes up, I'll be sure to let you know.
		AI_Output(self,other, " DIA_VLK_6132_Gayvern_Work_01_16 " );	// Thanks man. Believe me, I will not remain in debt.
	};
};

instance DIA_VLK_6132_GAYVERN_HOW(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_how_condition;
	information = dia_vlk_6132_gayvern_how_info;
	permanent = TRUE;
	description = " Well, how are you? " ;
};

func int dia_vlk_6132_gayvern_how_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6132_gayvern_work) && (GAYVERNRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_how_info()
{
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_How_01_00 " );	// Well, how are you?
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_How_01_01 " );	// Everything is as lousy as before.

	if((GAYVERNRECRUITEDDT == FALSE) && (HURRAYICANHIRE == TRUE))
	{
		AI_Output(self,other, " DIA_VLK_6132_Gayvern_How_01_06 " );	// Do you have any news?
		AI_Output(other,self, " DIA_VLK_6132_Gayvern_How_01_07 " );	// If you're talking about work - then perhaps there is one thought.
		AI_Output(self,other, " DIA_VLK_6132_Gayvern_How_01_08 " );	// Then what are you pulling - lay it out!
	}
	else  if (( MIS_TRADEHELPER  != LOG_Running) || ( MIS_TRADEHELPER  !=  LOG_SUCCESS ) || ( MIS_TRADEHELPER  !=  LOG_FAILED ))
	{
		AI_Output(self,other, " DIA_VLK_6132_Gayvern_How_01_02 " );	// Do you have any news?
		AI_Output(other,self, " DIA_VLK_6132_Gayvern_How_01_03 " );	// If you're talking about work, then no.
		AI_Output(self,other, " DIA_VLK_6132_Gayvern_How_01_04 " );	// Sorry...
		AI_Output(self,other, " DIA_VLK_6132_Gayvern_How_01_05 " );	// Okay, if anything - you know where to find me.
	}
	else  if (( MIS_TRADEHELPER  == LOG_Running) && ( FINDPERSONONE  ==  FALSE ))
	{
		AI_Output(self,other, " DIA_VLK_6132_Gayvern_How_01_06 " );	// Do you have any news?
		AI_Output(other,self, " DIA_VLK_6132_Gayvern_How_01_07 " );	// If you're talking about work - then perhaps there is one thought.
		AI_Output(self,other, " DIA_VLK_6132_Gayvern_How_01_08 " );	// Then what are you waiting for - lay it out!
	};
};


instance DIA_VLK_6132_GAYVERN_HIRE(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_hire_condition;
	information = dia_vlk_6132_gayvern_hire_info;
	permanent = FALSE;
	description = " Do you still need a job? " ;
};


func int dia_vlk_6132_gayvern_hire_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6132_gayvern_work) && (MIS_TRADEHELPER == LOG_Running) && (GAYVERNRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_hire_info()
{
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Hire_01_00 " );	// Do you still need a job?
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hire_01_01 " );	// Do you even need to ask?
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hire_01_02 " );	// What can you suggest?
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Hire_01_03 " );	// A large merchant from the upper quarter of the city is looking for a man to take the place of his assistant.
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Hire_01_04 " );	// And the job is to run his errands and help him run his business.
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Hire_01_06 " );	// So I thought maybe you could take the job.
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Hire_01_07 " );	// Are you interested?
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hire_01_08 " );	// Boy, I'm ready to do any job, as long as I don't sit here doing nothing.
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Hire_01_10 " );	// Good. But let's not rush: first I need to know a little about what you are capable of.
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Hire_01_11 " );	// Tell me, what can you do?
	AI_Output(self,other,"DIA_VLK_6132_Gayvern_Hire_01_12");	//Well...
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hire_01_13 " );	// If you need to unload or load something there, I have no equal in this matter.
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Hire_01_14 " );	// Do you know how to negotiate with people?
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hire_01_15 " );	// Of course. That is what I do every day... (laughs)
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hire_01_16 " );	// I tell people not to do stupid things here. And you know, my methods of persuasion work flawlessly!
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Hire_01_17 " );	// Well, I have no doubt about that.
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hire_01_18 " );	// Trust me, you won't regret recommending me to the merchant.
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_Hire_01_19 " );	// So, if I'm interested in you - just tell me - and I'm in business!
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_Hire_01_20 " );	// Okay, I'll think about it.
	B_LogEntry( TOPIC_TRADEHELPER , " I talked to Gavern. My offer to get a job with Luthero was accepted with enthusiasm. Though maybe I should look for someone else for the job. " );
	GAYVERNAGREE = TRUE;
};


instance DIA_VLK_6132_GAYVERN_HIREOK(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_hireok_condition;
	information = dia_vlk_6132_gayvern_hireok_info;
	permanent = FALSE;
	description = " Let's go to the merchant. " ;
};


func int dia_vlk_6132_gayvern_hireok_condition()
{
	if (( GAYVERNAGREE  ==  TRUE ) && ( MY_TRADEHELPER  == LOG_Running) && ( FINDPERSONONONE  ==  FALSE ) && ( FINDTHREEPERSONS  ==  FALSE ) && ( FINDTHREEPERSONS  ==  FALSE ) && ( GAYVERNRECRUITEDDT  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_hireok_info()
{
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_HireOk_01_00 " );	// Let's go to the merchant.
	AI_Output(other,self, " DIA_VLK_6132_Gayvern_HireOk_01_01 " );	// I think you're the right person for him.
	AI_Output(self,other, " DIA_VLK_6132_Gayvern_HireOk_01_02 " );	// Great! 
	B_LogEntry( TOPIC_TRADEHELPER , " I chose Gavern. I hope Luthero appreciates it. " );
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	FINDPERSONONE = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_VLK_6132_GAYVERN_NEWLIFE (C_Info) .
{
	npc = vlk_6132_gayvern;
	nr = 2;
	condition = dia_vlk_6132_gayvern_newlife_condition;
	information = dia_vlk_6132_gayvern_newlife_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_vlk_6132_gayvern_newlife_condition()
{
	if((GAYVERNNOTHIRED == TRUE) && (HURRAYICANHIRE == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_vlk_6132_gayvern_newlife_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_VLK_6132_GAYVERN_PICKPOCKET(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 900;
	condition = dia_vlk_6132_gayvern_pickpocket_condition;
	information = dia_vlk_6132_gayvern_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int dia_vlk_6132_gayvern_pickpocket_condition()
{
	return  C_Robbery ( 30 , 60 );
};

func void dia_vlk_6132_gayvern_pickpocket_info()
{
	Info_ClearChoices(dia_vlk_6132_gayvern_pickpocket);
	Info_AddChoice(dia_vlk_6132_gayvern_pickpocket,Dialog_Back,dia_vlk_6132_gayvern_pickpocket_back);
	Info_AddChoice(dia_vlk_6132_gayvern_pickpocket,DIALOG_PICKPOCKET,dia_vlk_6132_gayvern_pickpocket_doit);
};

func void dia_vlk_6132_gayvern_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_vlk_6132_gayvern_pickpocket);
};

func void dia_vlk_6132_gayvern_pickpocket_back()
{
	Info_ClearChoices(dia_vlk_6132_gayvern_pickpocket);
};

instance DIA_VLK_6132_GAYVERN_ASKFORDT(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 6;
	condition = DIA_VLK_6132_GAYVERN_askfordt_condition;
	information = DIA_VLK_6132_GAYVERN_askfordt_info;
	permanent = FALSE;
	description = " Would you like to work for me? " ;
};

func int DIA_VLK_6132_GAYVERN_askfordt_condition()
{
	if(Npc_KnowsInfo(other,dia_vlk_6132_gayvern_work) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void DIA_VLK_6132_GAYVERN_askfordt_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_VLK_6132_GAYVERN_AskforDT_15_00 " );	// Would you like to work for me?
	AI_Output(self,other, " DIA_VLK_6132_GAYVERN_AskforDT_17_01 " );	// What should be done?
	AI_Output(other,self, " DIA_VLK_6132_GAYVERN_AskforDT_17_02 " );	// Well, you're a tough guy. And I could use another guard in the camp.
	AI_Output(self,other, " DIA_VLK_6132_GAYVERN_AskforDT_17_03 " );	// Do you even have a camp?
	AI_Output(other,self, " DIA_VLK_6132_GAYVERN_AskforDT_17_04 " );	// Yeah, and I'm just recruiting people there. Well, what can you say?
	AI_Output(self,other, " DIA_VLK_6132_GAYVERN_AskforDT_17_05 " );	// Guard? What happens, again I have to beat people in the face?
	AI_Output(other,self, " DIA_VLK_6132_GAYVERN_AskforDT_17_06 " );	// I'd say it's a much more responsible job. Of course, you also have to follow my orders.
	AI_Output(other,self, " DIA_VLK_6132_GAYVERN_AskforDT_17_07 " );	// But other than that, the camp can be attacked by monsters, bandits, or even orcs. And I need people ready to protect it.
	AI_Output(self,other, " DIA_VLK_6132_GAYVERN_AskforDT_17_08 " );	// Ah, well... That sounds a lot more interesting. Will there be food there?
	AI_Output(other,self, " DIA_VLK_6132_GAYVERN_AskforDT_17_09 " );	// Of course. Three meals a day, shelter and a small but daily fee, depending on your duties.
	AI_Output(self,other, " DIA_VLK_6132_GAYVERN_AskforDT_17_10 " );	// Will they also pay? How much?
	AI_Output(other,self, " DIA_VLK_6132_GAYVERN_AskforDT_17_11 " );	// Hmmm... About thirty gold coins a day. sound good?
	AI_Output(self,other, " DIA_VLK_6132_GAYVERN_AskforDT_17_12 " );	// Thirty gold coins?! I never received that kind of money before! Ok, I agree.
	AI_Output(other,self, " DIA_VLK_6132_GAYVERN_AskforDT_17_13 " );	// Nice. Then pack your things and head straight over there.
	AI_Output(other,self, " DIA_VLK_6132_GAYVERN_AskforDT_17_14 " );	// By the way, the password to enter the camp is 'Dragon Hoard'. Just tell it to the guards at the entrance.
	AI_Output(self,other, " DIA_VLK_6132_GAYVERN_AskforDT_17_15 " );	// Got it. I'll just tell Cardiff first that I'm resigning.
	AI_Output(self,other, " DIA_VLK_6132_GAYVERN_AskforDT_17_16 " );	// Eh... He must be really upset about that. But sitting all day in his tavern bored me even more.
	AI_Output(other,self, " DIA_VLK_6132_GAYVERN_AskforDT_17_17 " );	// Okay, just don't linger.
	AI_Output(self,other, " DIA_VLK_6132_GAYVERN_AskforDT_17_18 " );	// I'll try.
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Gavern has joined my camp. " );
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	GAYVERNRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_VLK_6132_GAYVERN_INTOWER(C_Info)
{
	npc = vlk_6132_gayvern;
	nr = 22;
	condition = DIA_VLK_6132_GAYVERN_intower_condition;
	information = DIA_VLK_6132_GAYVERN_intower_info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};

func int DIA_VLK_6132_GAYVERN_intower_condition()
{
	if((GAYVERNRECRUITEDDT == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_01") < 5000))
	{
		return TRUE;
	};
};

func void DIA_VLK_6132_GAYVERN_intower_info()
{
	AI_Output(other,self, " DIA_VLK_6132_GAYVERN_InTower_OrcKap_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_VLK_6132_GAYVERN_InTower_OrcKap_01_01 " );	// Perfect, thanks.
};
