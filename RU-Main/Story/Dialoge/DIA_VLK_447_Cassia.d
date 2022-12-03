

was int CassiaTellsAttila;
var int CassiaRecievePay;

instance DIA_Cassia_EXIT(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 999;
	condition = DIA_Cassia_EXIT_Condition;
	information = DIA_Cassia_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Cassia_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Cassia_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Cassia_PICKME(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 900;
	condition = DIA_Cassia_PICKME_Condition;
	information = DIA_Cassia_PICKME_Info;
	permanent = TRUE;
	description = Pickpocket_100_Female;
};

func int DIA_Cassia_PICKME_Condition()
{
	return  C_Robbery ( 100 , 400 );
};

func void DIA_Cassia_PICKME_Info()
{
	Info_ClearChoices(DIA_Cassia_PICKME);
	Info_AddChoice(DIA_Cassia_PICKME,Dialog_Back,DIA_Cassia_PICKME_BACK);
	Info_AddChoice(DIA_Cassia_PICKME,DIALOG_PICKPOCKET,DIA_Cassia_PICKME_DoIt);
};

func void DIA_Cassia_PICKME_DoIt()
{
	if(other.attribute[ATR_DEXTERITY] >= 100)
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		}
		else
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		B_GiveInvItems(self,other,ItMi_Gold,80);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		BELIARPRAYCOUNT = BELIARPRAYCOUNT + 1;
		B_GiveThiefXP();
		Info_ClearChoices(dia_lord_hagen_pickpocket);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSPRAYCOUNT = INNOSPRAYCOUNT - 1;
		};
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Cassia_PICKME_BACK()
{
	Info_ClearChoices(DIA_Cassia_PICKME);
};


instance DIA_Cassia_Gilde(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_Gilde_Condition;
	information = DIA_Cassia_Gilde_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_Gilde_Condition()
{
	if((Cassia_Gildencheck == TRUE) && (Join_Thiefs == TRUE) && ((other.guild == GIL_MIL) || (other.guild == GIL_PAL) || (other.guild == GIL_KDF)))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Gilde_Info()
{
	if((other.guild == GIL_MIL) || (other.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Cassia_Gilde_16_00 " );	// I see you have become a servant of law and order.
		AI_Output(self,other, " DIA_Cassia_Gilde_16_01 " );	// But the fact that you now serve Innos does not matter to us. You are one of us. And I hope you understand that too.
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Cassia_Gilde_16_02 " );	// So you are now a minister of the church of Innos? Excellent. But you're also one of us - I hope you never forget that.
	};
	AI_StopProcessInfos(self);
};


instance DIA_Cassia_Expired (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Expired_Condition;
	information = DIA_Cassia_Expired_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_Expired_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Cassia_Frist == TRUE) && (Cassia_Day < (B_GetDayPlus() - 2)) && (Join_Thiefs != TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Expired_Info()
{
	AI_Output(self,other, " DIA_Cassia_Abgelaufen_16_00 " );	// Your term has expired! You shouldn't have come back.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,0);
};


instance DIA_Cassia_News(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_News_Condition;
	information = DIA_Cassia_News_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Cassia_News_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_News_Info()
{
	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other, " DIA_Cassia_News_16_00 " );	// I see you got our present! I am Cassia.
		AI_Output(other,self, " DIA_Cassia_News_15_01 " );	// Okay, Cassia. Now tell me why am I here?
		AI_Output(self,other, " DIA_Cassia_News_16_02 " );	// You got our attention by winning the trust of one of our friends.
		AI_Output(self,other, " DIA_Cassia_News_16_03 " );	// And we want to give you a chance. You can join us.
	}
	else
	{
		AI_Output(self,other, " DIA_Cassia_News_16_04 " );	// Just look who found their way here! Attila underestimated you...but I won't make that mistake.
		AI_Output(other,self, " DIA_Cassia_News_15_05 " );	// What are these games?
		AI_Output(self,other, " DIA_Cassia_News_16_06 " );	// We wanted you to die for ratting out one of our friends. That's why we sent Attila.
		AI_Output(self,other, " DIA_Cassia_News_16_07 " );	// Your presence here, however, opens up new possibilities...
		AI_Output(other,self, " DIA_Cassia_News_15_08 " );	// ... what do you want to offer me?
		AI_Output(self,other, " DIA_Cassia_News_16_09 " );	// You can join us.
	};
	if((other.guild == GIL_NONE) || (other.guild == GIL_NOV))
	{
		Cassia_Gildencheck = TRUE;
	};
	DG_found = TRUE ;
};


instance DIA_Cassia_mehr(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_mehr_Condition;
	information = DIA_Cassia_mehr_Info;
	permanent = FALSE;
	description = " Tell me about your organization. " ;
};

func int DIA_Cassia_mehr_Condition()
{
	return TRUE;
};

func void DIA_Cassia_mehr_Info()
{
	AI_Output(other,self, " DIA_Cassia_mehr_15_00 " );	// Tell me about your organization.
	AI_Output(self,other, " DIA_Cassia_mehr_16_01 " );	// The townspeople don't like us. But no one knows where our hideout is.
	AI_Output(self,other, " DIA_Cassia_mehr_16_02 " );	// The few who even know that the sewers exist believe that they are closed and impossible to get into.
	AI_Output(self,other, " DIA_Cassia_mehr_16_03 " );	// And until they find us, we can work quietly.
};


instance DIA_Cassia_MissingPeople(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_MissingPeople_Condition;
	information = DIA_Cassia_MissingPeople_Info;
	permanent = FALSE;
	description = " What do you know about missing people? " ;
};

func int DIA_Cassia_MissingPeople_Condition()
{
	if((SC_HearedAboutMissingPeople == TRUE) && (MissingPeopleReturnedHome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Cassia_Add_15_00 " );	// What do you know about missing people?
	AI_Output(self,other, " DIA_Addon_Cassia_Add_16_01 " );	// Why are you so interested in this?
	AI_Output(other,self, " DIA_Addon_Cassia_Add_15_02 " );	// I want to find out what happened to them.
	AI_Output(self,other, " DIA_Addon_Cassia_Add_16_03 " );	// When you exit the sewers, swim along the coast to the right.
	AI_Output(self,other, " DIA_Addon_Cassia_Add_16_04 " );	// There you will find answers to your questions...
};

instance DIA_Cassia_Vorteil (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_Vorteil_Condition;
	information = DIA_Cassia_Vorteil_Info;
	permanent = FALSE;
	description = " What's in it for me to join you? " ;
};

func int DIA_Cassia_Vorteil_Condition()
{
	return TRUE;
};

func void DIA_Cassia_Advantage_Info()
{
	AI_Output(other,self, " DIA_Cassia_Vorteil_15_00 " );	// What do I benefit from joining you?
	AI_Output(self,other, " DIA_Cassia_Vorteil_16_01 " );	// You can learn special skills from us - skills that will allow you to live in luxury.
	AI_Output(other,self, " DIA_Cassia_Vorteil_15_02 " );	// But for this I have to hide here, right?
	AI_Output(self,other, " DIA_Cassia_Vorteil_16_03 " );	// No... (laughs softly) You just have to stick to our rules. That's all!
};

instance DIA_Cassia_Lernen (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 4;
	condition = DIA_Cassia_Lernen_Condition;
	information = DIA_Cassia_Lernen_Info;
	permanent = FALSE;
	description = " What can I learn from you? " ;
};

func int DIA_Cassia_Lernen_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Cassia_Vorteil))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Learn_Info()
{
	AI_Output(other,self, " DIA_Cassia_Lernen_15_00 " );	// What can I learn from you?
	AI_Output(self,other, " DIA_Cassia_Lernen_16_01 " );	// Jesper can teach you how to move silently.
	AI_Output(self,other, " DIA_Cassia_Lernen_16_98 " );	// In addition, you can get hold of decent armor from him.
	AI_Output(self,other, " DIA_Cassia_Lernen_16_02 " );	// Ramirez is an extremely gifted bugbear! No lock can resist his picks.
	AI_Output(self,other, " DIA_Cassia_Lernen_77_11 " );	// But most importantly, he can teach you how to make thieves' weapons.
	AI_Output(self,other, " DIA_Cassia_Lernen_16_03 " );	// And I can teach you pickpocketing.
	AI_Output(self,other, " DIA_Cassia_Lernen_16_04 " );	// I can also help you become more dexterous! Dexterity is the key to thieving abilities.
	AI_Output(self,other, " DIA_Cassia_Lernen_16_99 " );	// In addition, I can show you how to properly control your body in motion.
	AI_Output(self,other, " DIA_Cassia_Lernen_16_97 " );	// A very important skill. Especially in a situation where you are taken by surprise, and you need to quickly respond to the danger.
	Log_CreateTopic(TOPIC_ThiefTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_ThiefTeacher, " Cassia can teach me pickpocketing, acrobatics, or just help me become more dexterous. " );
	B_LogEntry_Quiet(TOPIC_ThiefTeacher, " Ramirez is ready to teach me how to use lockpicks. He can also show me how to make thieving weapons. " );
	B_LogEntry_Quiet(TOPIC_ThiefTeacher, " Jesper will show me how to sneak properly. Also, I can buy good armor from him. " );
};

instance DIA_Cassia_Regeln (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_Regeln_Condition;
	information = DIA_Cassia_Rules_Info;
	permanent = FALSE;
	description = " What are your rules? " ;
};

func int DIA_Cassia_Regeln_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Cassia_Vorteil))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Regeln_Info()
{
	AI_Output(other,self,"DIA_Cassia_Regeln_15_00");	//Что у вас за правила?
	AI_Output(self,other,"DIA_Cassia_Regeln_16_02");	//Первое правило - никому ни слова о нас! Никогда.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_03");	//Второе: не попадайся.
	AI_Output(self,other,"DIA_Cassia_Regeln_16_04");	//Третье: если ты обнажишь оружие здесь, чтобы напасть на кого-нибудь, мы убьем тебя!
	AI_Output(self,other, " DIA_Cassia_Regeln_16_05 " );	// And the fourth, last rule. Anyone who wants to join us must prove the seriousness of their intentions.
};

instance DIA_Cassia_Catch (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Get_Condition;
	information = DIA_Cassia_Get_Info;
	permanent = FALSE;
	description = " What happens if I get caught? " ;
};

func int DIA_Cassia_Get_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Cassia_Regeln))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Get_Info()
{
	AI_Output(other,self, " DIA_Cassia_Erwischen_15_00 " );	// What happens if I get caught?
	AI_Output(self,other, " DIA_Cassia_Erwischen_16_01 " );	// Just don't get caught, okay?
};

instance DIA_Cassia_behaben (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_beweisen_Condition;
	information = DIA_Cassia_behaben_Info;
	permanent = TRUE;
	description = " How can I prove my intentions are serious? " ;
};

var int DIA_Cassia_beisen_permanent;

func int DIA_Cassia_beweisen_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Cassia_Rules) && (DIA_Cassia_beweisen_permanent ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Cassia_beweisen_Info()
{
	AI_Output(other,self, " DIA_Cassia_beweisen_15_00 " );	// How can I prove my seriousness?

	if(Join_Thiefs == FALSE)
	{
		AI_Output(self,other, " DIA_Cassia_beweisen_16_01 " );	// So will you join us or not?
	}
	else
	{
		AI_Output(self,other, " DIA_Cassia_beweisen_16_02 " );	// That stubborn alchemist, Constantino, has a beautiful ring!
		AI_Output(self,other, " DIA_Cassia_beweisen_16_03 " );	// But he doesn't need it at all. I want it to decorate my hand.
		MIS_CassiaRing = LOG_Running;
		DIA_Cassia_beweisen_permanent = TRUE ;
		Log_CreateTopic(Topic_CassiaRing,LOG_MISSION);
		Log_SetTopicStatus(Topic_CassiaRing,LOG_Running);
		B_LogEntry(Topic_CassiaRing, " Cassia wants me to bring her Constantino's ring. " );
	};
};

instance DIA_Cassia_Join (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Join_Condition;
	information = DIA_Cassia_Join_Info;
	permanent = FALSE;
	description = " Okay, I'm in. " ;
};

func int DIA_Cassia_Join_Condition()
{
	if ((Join_Thiefs ==  FALSE ) && Npc_KnowsInfo(other, DIA_Cassia_Rules))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Join_Info()
{
	AI_Output(other,self, " DIA_Cassia_Beitreten_15_00 " );	// Okay, I'm in.
	AI_Output(self,other, " DIA_Cassia_Beitreten_16_01 " );	// Great! Now you will be given the opportunity to prove yourself.
	Join_Thiefs = TRUE;
};

instance DIA_Cassia_Reject (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 9;
	condition = DIA_Cassia_Ablehnen_Condition;
	information = DIA_Cassia_Reject_Info;
	permanent = FALSE;
	description = " What if I don't want to join you?.. " ;
};

func int DIA_Cassia_Reject_Condition()
{
	if ((Join_Thiefs ==  FALSE ) && Npc_KnowsInfo(other, DIA_Cassia_Rules))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Reject_Info()
{
	AI_Output(other,self, " DIA_Cassia_Ablehnen_15_00 " );	// What if I don't want to join you?

	if(MIS_ThiefGuild_sucked == FALSE)
	{
		AI_Output(self,other, " DIA_Cassia_Ablehnen_16_01 " );	// You're losing your once-in-a-lifetime chance, but you can go.
		AI_Output(self,other, " DIA_Cassia_Ablehnen_16_02 " );	// And don't even think about betraying us. You will bitterly regret this.
		Info_ClearChoices(DIA_Cassia_Ablehnen);
		Info_AddChoice(DIA_Cassia_Ablehnen, " Okay, I'm in. " ,DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice(DIA_Cassia_Ablehnen, " I need time to think. " ,DIA_Cassia_Ablehnen_Frist);
	}
	else
	{
		AI_Output(self,other, " DIA_Cassia_Ablehnen_16_03 " );	// In that case, I'll kill you!
		Info_ClearChoices(DIA_Cassia_Ablehnen);
		Info_AddChoice(DIA_Cassia_Ablehnen, " Okay, I'm in. " ,DIA_Cassia_Ablehnen_Okay);
		Info_AddChoice(DIA_Cassia_Ablehnen, " Well, then try to kill me. " ,DIA_Cassia_Ablehnen_Kill);
	};
};

func void DIA_Cassia_Reject_Okay()
{
	AI_Output(other,self, " DIA_Cassia_Ablehnen_Okay_15_00 " );	// Okay, I'm in.
	AI_Output(self,other, " DIA_Cassia_Ablehnen_Okay_16_01 " );	// You made a wise decision... (smiles) If you can prove your seriousness, you can join our ranks.
	Join_Thiefs = TRUE;
	Info_ClearChoices(DIA_Cassia_Ablehnen);
};

func void DIA_Cassia_Ablehnen_Kill()
{
	AI_Output(other,self, " DIA_Cassia_Ablehnen_Kill_15_00 " );	// Well, then try to kill me.
	AI_Output(self,other, " DIA_Cassia_Ablehnen_Kill_16_01 " );	// Too bad... (calmly) I thought you were smarter.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_Reject_Deadline()
{
	AI_Output(other,self, " DIA_Cassia_Ablehnen_Frist_15_00 " );	// I need time to think.
	AI_Output(self,other, " DIA_Cassia_Ablehnen_Frist_16_01 " );	// Please! I will give you two days to make this decision. After that, you'd better not show up here.
	Cassia_Day = B_GetDayPlus();
	Cassia_Frist = TRUE;
	Info_ClearChoices(DIA_Cassia_Ablehnen);
};

instance DIA_Cassia_BevorLernen (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 5;
	condition = DIA_Cassia_BevorLernen_Condition;
	information = DIA_Cassia_BevorLernen_Info;
	permanent = FALSE;
	description = " Can you teach me? " ;
};

func int DIA_Cassia_BevorLernen_Condition()
{
	if(IS_LOVCACH == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Cassia_BevorLernen_Info()
{
	AI_Output(other,self, " DIA_Cassia_BevorLernen_15_00 " );		// Can you teach me?
	AI_Output(self,other, " DIA_Cassia_BevorLernen_900_02 " );	// Of course! After all, you are now one of us.
	Cassia_TeachPickpocket = TRUE;
	Cassia_TeachDEX = TRUE ;
	Cassia_TeachAcrobat = TRUE;
};

instance DIA_Cassia_TEACH(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 12;
	condition = DIA_Cassia_TEACH_Condition;
	information = DIA_Cassia_TEACH_Info;
	permanent = TRUE;
	description = " I want to become more dexterous. " ;
};

func int DIA_Cassia_TEACH_Condition()
{
	if (Cassia_TeachDEX ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Cassia_TEACH_Info()
{
	AI_Output(other,self, " DIA_Cassia_TEACH_15_00 " );	// I want to become more dexterous.

	if((AttilaIsDead == TRUE) && (CassiaRecievePay == FALSE))
	{
		if(CassiaTellsAttila == FALSE)
		{
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_05 " );	// Not so fast, my friend. Before we begin our training, there is something you must do.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_06");	//Что именно?
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_07 " );	// Pay me some compensation for Attila's death.
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_08 " );	// He's been doing some pretty important jobs for me, and now some of them might get in trouble.
			AI_Output(other,self, " DIA_Cassia_Pickpocket_16_09 " );	// And how much do you want?
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_10 " );	// I think a thousand gold coins will be enough to forget about this misunderstanding.
			CassiaTellsAttila = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_11 " );	// So how about a little compensation?
		};

		Info_ClearChoices(DIA_Cassia_TEACH);

		if(Npc_HasItems(other,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(DIA_Cassia_TEACH, " Okay, here's your money. " ,DIA_Cassia_TEACH_Ok);
		};

		Info_AddChoice(DIA_Cassia_TEACH, " I don't have that kind of money. " ,DIA_Cassia_TEACH_No);
		Info_AddChoice(DIA_Cassia_TEACH, " Why don't you go somewhere else? " ,DIA_Cassia_TEACH_Damn);

		if(RhetorikSkillValue[1] >= 10)
		{
			Info_AddChoice(DIA_Cassia_TEACH, " I have a different opinion on this. " ,DIA_Cassia_TEACH_Agreed);
		};
	}
	else
	{
		Info_ClearChoices(DIA_Cassia_TEACH);
		Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
		Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
		Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
	};
};

func void DIA_Cassia_TEACH_BACK()
{
	Info_ClearChoices(DIA_Cassia_TEACH);
};

func void DIA_Cassia_TEACH_1()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,1,T_MAX);
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};

func void DIA_Cassia_TEACH_5()
{
	B_TeachAttributePoints(self,other,ATR_DEXTERITY,5,T_MAX);
	Info_ClearChoices(DIA_Cassia_TEACH);
	Info_AddChoice(DIA_Cassia_TEACH,Dialog_Back,DIA_Cassia_TEACH_BACK);
	Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX1,B_GetLearnCostAttribute(other,ATR_DEXTERITY)),DIA_Cassia_TEACH_1);
	Info_AddChoice(DIA_Cassia_TEACH,b_buildlearnstringforskills(PRINT_LearnDEX5,B_GetLearnCostAttribute(other,ATR_DEXTERITY) * 5),DIA_Cassia_TEACH_5);
};

instance DIA_Cassia_Pickpocket(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Pickpocket_Condition;
	information = DIA_Cassia_Pickpocket_Info;
	permanent = TRUE;
	description = " Teach me pickpocketing. (Training points: 10) " ;
};

func int DIA_Cassia_Pickpocket_Condition()
{
	if((Cassia_TeachPickpocket == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == FALSE) && (MIS_CassiaRing == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Pickpocket_Info()
{
	AI_Output(other,self, " DIA_Cassia_Pickpocket_15_00 " );	// Teach me pickpocketing.

	if((AttilaIsDead == TRUE) && (CassiaRecievePay == FALSE))
	{
		if(CassiaTellsAttila == FALSE)
		{
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_05 " );	// Not so fast, my friend. Before we begin our training, there is something you must do.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_06");	//Что именно?
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_07 " );	// Pay me some compensation for Attila's death.
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_08 " );	// He's been doing some pretty important jobs for me, and now some of them might get in trouble.
			AI_Output(other,self, " DIA_Cassia_Pickpocket_16_09 " );	// And how much do you want?
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_10 " );	// I think a thousand gold coins will be enough to forget about this misunderstanding.
			CassiaTellsAttila = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_11 " );	// So how about a little compensation?
		};

		Info_ClearChoices(DIA_Cassia_Pickpocket);

		if(Npc_HasItems(other,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(DIA_Cassia_Pickpocket, " Okay, here's your money. " ,DIA_Cassia_Pickpocket_Ok);
		};

		Info_AddChoice(DIA_Cassia_Pickpocket, " I don't have that kind of money. " ,DIA_Cassia_Pickpocket_No);
		Info_AddChoice(DIA_Cassia_Pickpocket, " Why don't you go somewhere else? " ,DIA_Cassia_Pickpocket_Damn);

		if(RhetorikSkillValue[1] >= 10)
		{
			Info_AddChoice(DIA_Cassia_Pickpocket, " I have a different opinion on this. " ,DIA_Cassia_Pickpocket_Agreed);
		};
	}
	else
	{
		if(b_teachthieftalentfree(self,other,NPC_TALENT_PICKPOCKET))
		{
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_01 " );	// If you want to pick someone's pockets, distract him. Just start talking to him, chat.
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_02 " );	// And when you talk, rate him. Pay attention to protruding pockets, jewelry or a leather lace around the neck. And, most importantly, try to appreciate how careful he is.
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_03 " );	// Stealing from a drunken day laborer is not the same as stealing from a vigilant merchant. Remember this.
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_04 " );	// If you're clumsy, he'll surely feel unkind. And, above all: always keep your cool!
		};
	};
};

var int CassiaAcrobatPerm;

instance DIA_Cassia_Acrobat(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 10;
	condition = DIA_Cassia_Acrobat_Condition;
	information = DIA_Cassia_Acrobat_Info;
	permanent = TRUE;
	description = " Show me how to control my body properly. (Learning points: 10) " ;
};

func int DIA_Cassia_Acrobat_Condition()
{
	if((Cassia_TeachAcrobat == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT) == FALSE) && (MIS_CassiaRing == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Acrobat_Info()
{
	AI_Output(other,self, " DIA_Cassia_Acrobat_15_00 " );	// Show me how to properly control your body.

	if((AttilaIsDead == TRUE) && (CassiaRecievePay == FALSE))
	{
		if(CassiaTellsAttila == FALSE)
		{
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_05 " );	// Not so fast, my friend. Before we begin our training, there is something you must do.
			AI_Output(other,self,"DIA_Cassia_Pickpocket_16_06");	//Что именно?
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_07 " );	// Pay me some compensation for Attila's death.
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_08 " );	// He's been doing some pretty important jobs for me, and now some of them might get in trouble.
			AI_Output(other,self, " DIA_Cassia_Pickpocket_16_09 " );	// And how much do you want?
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_10 " );	// I think a thousand gold coins will be enough to forget about this misunderstanding.
			CassiaTellsAttila = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Cassia_Pickpocket_16_11 " );	// So how about a little compensation?
		};

		Info_ClearChoices(DIA_Cassia_Acrobat);

		if(Npc_HasItems(other,ItMi_Gold) >= 1000)
		{
			Info_AddChoice(DIA_Cassia_Acrobat, " Okay, here's your money. " ,DIA_Cassia_Acrobat_Ok);
		};

		Info_AddChoice(DIA_Cassia_Acrobat, " I don't have that kind of money. " ,DIA_Cassia_Acrobat_No);
		Info_AddChoice(DIA_Cassia_Acrobat, " Why don't you go somewhere else? " ,DIA_Cassia_Acrobat_Damn);

		if(RhetorikSkillValue[1] >= 10)
		{
			Info_AddChoice(DIA_Cassia_Acrobat, " I have a different opinion on this. " ,DIA_Cassia_Acrobat_Agreed);
		};
	}
	else
	{
		if(hero.attribute[ATR_DEXTERITY] >= 120)
		{
			if(B_TeachThiefTalentFree(self,other,NPC_TALENT_ACROBAT))
			{
				AI_Output(self,other, " DIA_Cassia_Acrobat_16_01 " );	// When you control your body, you can jump much further.
				AI_Output(self,other, " DIA_Cassia_Acrobat_16_02 " );	// I'll teach you how to roll to the side, show you how to land after a fall.
				AI_Output(self,other, " DIA_Cassia_Acrobat_16_03 " );	// But don't forget that you're still not immortal!
				AI_Output(self,other, " DIA_Cassia_Acrobat_16_04 " );	// Other than that, acrobatics are also very useful in combat.
				AI_Output(self,other, " DIA_Cassia_Acrobat_16_05 " );	// You can quickly change the distance between yourself and the enemy.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Cassia_Acrobat_16_98 " );	// You don't have the dexterity for that yet.
			AI_Output(self,other, " DIA_Cassia_Acrobat_16_99 " );	// We'll talk about this later.

			if(CassiaAcrobatPerm == FALSE)
			{
				B_LogEntry_Quiet(TOPIC_ThiefTeacher, " To learn acrobatics, I need to be more agile. (Agility: 120 or more) " );
				CassiaAcrobatPerm = TRUE;
			};
		};
	};
};

func void DIA_Cassia_Pickpocket_Ok()
{
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Ok_16_01 " );	// Okay, here's your money.
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Ok_16_02 " );	// Great! Now you can practice.
	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_Pickpocket);
};

func void DIA_Cassia_Pickpocket_No()
{
	AI_Output(other,self, " DIA_Cassia_Pickpocket_No_16_01 " );	// I don't have that kind of money.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_No_16_02 " );	// So find them! Otherwise, you can forget about your training.
	Info_ClearChoices(DIA_Cassia_Pickpocket);
};

func void DIA_Cassia_Pickpocket_Damn()
{
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Damn_16_01 " );	// Why don't you go somewhere else
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Damn_16_02 " );	// I think that was pretty cheeky of you.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Damn_16_03 " );	// I'll have to teach you a lesson in good manners.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_Pickpocket_Agreed()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_01 " );	// I have a different opinion on this.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Agreed_16_02 " );	// Hmmm... I wonder which one?
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_03 " );	// Attila wanted to kill me! Moreover, he wanted to kill on your own orders.
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_04 " );	// The fact that he did not cope only says that more experienced people need to be selected for this kind of work.
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_05 " );	// And even more so, if he was so important to you, you shouldn't have sent him alone.
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_06 " );	// So, only you yourself are to blame for his death and no one else.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Agreed_16_07 " );	// All right! You son of a bitch... Consider that you convinced me of the correctness of your choice.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Agreed_16_08 " );	// Now let's just forget about this misunderstanding and get back to our business.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Agreed_16_09 " );	// So, what did you want to know there?

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_Pickpocket);
};

func void DIA_Cassia_Acrobat_Ok()
{
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Ok_16_01 " );	// Okay, here's your money.
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Ok_16_02 " );	// Great! Now you can practice.
	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_Acrobat);
};

func void DIA_Cassia_Acrobat_No()
{
	AI_Output(other,self, " DIA_Cassia_Pickpocket_No_16_01 " );	// I don't have that kind of money.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_No_16_02 " );	// So find them! Otherwise, you can forget about your training.
	Info_ClearChoices(DIA_Cassia_Acrobat);
};

func void DIA_Cassia_Acrobat_Damn()
{
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Damn_16_01 " );	// Why don't you go somewhere else
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Damn_16_02 " );	// I think that was pretty cheeky of you.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Damn_16_03 " );	// I'll have to teach you a lesson in good manners.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_Acrobat_Agreed()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_01 " );	// I have a different opinion on this.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Agreed_16_02 " );	// Hmmm... I wonder which one?
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_03 " );	// Attila wanted to kill me! Moreover, he wanted to kill on your own orders.
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_04 " );	// The fact that he did not cope only says that more experienced people need to be selected for this kind of work.
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_05 " );	// And even more so, if he was so important to you, you shouldn't have sent him alone.
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_06 " );	// So, only you yourself are to blame for his death and no one else.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Agreed_16_07 " );	// All right! You son of a bitch... Consider that you convinced me of the correctness of your choice.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Agreed_16_08 " );	// Now let's just forget about this misunderstanding and get back to our business.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Agreed_16_09 " );	// So, what did you want to know there?

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_Acrobat);
};

func void DIA_Cassia_TEACH_Ok()
{
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Ok_16_01 " );	// Okay, here's your money.
	B_GiveInvItems(other,self,ItMi_Gold,1000);
	Npc_RemoveInvItems(self,ItMi_Gold,1000);
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Ok_16_02 " );	// Great! Now you can practice.
	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_TEACH);
};

func void DIA_Cassia_TEACH_No()
{
	AI_Output(other,self, " DIA_Cassia_Pickpocket_No_16_01 " );	// I don't have that kind of money.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_No_16_02 " );	// So find them! Otherwise, you can forget about your training.
	Info_ClearChoices(DIA_Cassia_TEACH);
};

func void DIA_Cassia_TEACH_Damn()
{
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Damn_16_01 " );	// Why don't you go somewhere else
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Damn_16_02 " );	// I think that was pretty cheeky of you.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Damn_16_03 " );	// I'll have to teach you a lesson in good manners.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Cassia_TEACH_Agreed()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_01 " );	// I have a different opinion on this.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Agreed_16_02 " );	// Hmmm... I wonder which one?
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_03 " );	// Attila wanted to kill me! Moreover, he wanted to kill on your own orders.
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_04 " );	// The fact that he did not cope only says that more experienced people need to be selected for this kind of work.
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_05 " );	// And even more so, if he was so important to you, you shouldn't have sent him alone.
	AI_Output(other,self, " DIA_Cassia_Pickpocket_Agreed_16_06 " );	// So, only you yourself are to blame for his death and no one else.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Agreed_16_07 " );	// All right! You son of a bitch... Consider that you convinced me of the correctness of your choice.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Agreed_16_08 " );	// Now let's just forget about this misunderstanding and get back to our business.
	AI_Output(self,other, " DIA_Cassia_Pickpocket_Agreed_16_09 " );	// So, what did you want to know there?

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	CassiaRecievePay = TRUE;
	Info_ClearChoices(DIA_Cassia_TEACH);
};

instance DIA_Cassia_recording (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Recording_Condition;
	information = DIA_Cassia_Recording_Info;
	permanent = FALSE;
	description = " I brought Constantino's ring. " ;
};

func int DIA_Cassia_Recording_Condition()
{
	if((MIS_CassiaRing == LOG_Running) && (Npc_HasItems(other,ItRi_Prot_Point_01_MIS) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Recording_Info()
{
	B_GivePlayerXP(XP_CassiaRing);
	AI_Output(other,self, " DIA_Cassia_Aufnahme_15_00 " );	// I brought Constantino's ring.
	B_GiveInvItems(other,self,ItRi_Prot_Point_01_MIS,1);
	Npc_RemoveInvItems(self,ItRi_Prot_Point_01_MIS,1);
	AI_Output(self,other, " DIA_Cassia_Aufnahme_16_01 " );	// Congratulations! You passed the entrance test. Consider that now you are one of us!
	MIS_CassiaRing = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_CassiaRing,LOG_SUCCESS);
	B_LogEntry(Topic_CassiaRing, " Cassia was satisfied with my work and asked me to join the Khorinis Thieves Guild. According to her, this will give me some undeniable advantages. " );
};


instance DIA_Cassia_In_Guild_Invite(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_In_Guild_Invite_condition;
	information = DIA_Cassia_In_Guild_Invite_info;
	permanent = FALSE;
	description = " I'm ready to join the Thieves Guild! " ;
};

func int DIA_Cassia_In_Guild_Invite_condition()
{
	if(MIS_CassiaRing == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Cassia_In_Guild_Invite_info()
{
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDM) || (hero.guild == GIL_GUR) || (hero.guild == GIL_KDW) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NDW))
	{
		AI_Output(other,self, " DIA_Cassia_In_Guild_Invite_01_01 " );	// I'm ready to join the Thieves Guild!
		AI_Output(self,other, " DIA_Cassia_In_Guild_Invite_01_00 " );	// Sorry, but we do not accept into our guild those who have already connected their path with one of the deities.
		AI_StopProcessInfos(self);
	}
	else
	{
		Snd_Play("LEVELUP");
		IS_LOVCACH = TRUE;
		Knows_SecretSign = TRUE;

		if(AttilaIsDead == FALSE)
		{
			THIEF_REPUTATION = THIEF_REPUTATION + 3;
		};

		AI_Output(other,self, " DIA_Cassia_In_Guild_Invite_01_01 " );	// I'm ready to join the Thieves Guild!
		AI_Output(self,other, " DIA_Cassia_In_Guild_Invite_01_02 " );	// Congratulations, you are now a full member of the Thieves Guild!
		AI_Output(self,other, " DIA_Cassia_In_Guild_Invite_01_03 " );	// From now on, your path is the path of a thief and master of the sword.
		AI_Output(self,other, " DIA_Cassia_In_Guild_Invite_01_04 " );	// Over time, more and more opportunities will open up for you, my friend.
		AI_Output(self,other, " DIA_Cassia_In_Guild_Invite_01_05 " );	// Develop your dexterity, learn to control your body, fencing with a sword and shoot accurately from a bow.
		AI_Output(self,other, " DIA_Cassia_In_Guild_Invite_01_06 " );	// And I'm sure that soon you will stand on a par with other great thieves of Khorinis.
		AI_Output(self,other, " DIA_Cassia_In_Guild_Invite_01_07 " );	// Like my mentor, Master Fingers, for example!
		AI_Output(other,self,"DIA_Cassia_In_Guild_Invite_01_08");	//Спасибо.
		AI_Output(self,other, " DIA_Cassia_Aufnahme_16_02 " );	// Take this key. He opens the door to the hotel... (smiles) Now you don't have to swim here every time.
		B_GiveInvItems(self,other,ItKe_XhiefGuildKey_Hotel_MIS,1);
		AI_Output(self,other, " DIA_Cassia_Aufnahme_16_03 " );	// Also, you should know that we have a secret sign - a 'special' nod!
		AI_PlayAni(self,"T_YES");
		AI_Output(self,other, " DIA_Cassia_Aufnahme_16_04 " );	// Here it is! When you talk to the right people and make this sign, they will know that you are one of us.
		AI_Output(self,other, " DIA_Cassia_In_Guild_Invite_01_09 " );	// By the way, don't forget to visit Ramirez. I think he wanted to teach you something.
		AI_Output(self,other, " DIA_Cassia_In_Guild_Invite_01_10 " );	// I guess he'll do it for free the first time.
		B_LogEntry(Topic_Diebesgilde, " I am now a full member of the Khorinis Thieves Guild. Cassia advised me to visit Ramirez. " );
	};
};

instance DIA_Cassia_Fingers(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Fingers_Condition;
	information = DIA_Cassia_Fingers_Info;
	permanent = FALSE;
	description = " Fingers was your mentor? " ;
};

func int DIA_Cassia_Fingers_Condition()
{
	if((IS_LOVCACH == TRUE) && (FingersIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Fingers_Info()
{
	AI_Output(other,self, " DIA_Cassia_Fingers_01_00 " );	// Fingers was your mentor?
	AI_Output(self,other, " DIA_Cassia_Fingers_01_01 " );	// Yes. He taught me everything I know.
	AI_Output(other,self, " DIA_Cassia_Fingers_01_02 " );	// Where is he now?
	AI_Output(self,other, " DIA_Cassia_Fingers_01_03 " );	// I haven't heard from him since he was sent to the colony.
	AI_Output(self,other, " DIA_Cassia_Fingers_01_04 " );	// So if you suddenly find out something about his fate, then please let me know.
	AI_Output(other,self,"DIA_Cassia_Fingers_01_05");	//Хорошо.
	MIS_WhereFingers = LOG_Running;
	Log_CreateTopic(Topic_WhereFingers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_WhereFingers,LOG_Running);
	B_LogEntry(TOPIC_WhereFingers, " Cassia would love to know what happened to her mentor, Master Fingers. " );
};

instance DIA_Cassia_Fingers_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Fingers_Done_Condition;
	information = DIA_Cassia_Fingers_Done_Info;
	permanent = FALSE;
	description = " I found your mentor. " ;
};

func int DIA_Cassia_Fingers_Done_Condition()
{
	if((MIS_WhereFingers == LOG_Running) && (FingersMeet == TRUE) && (FingersIsDead == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Fingers_Done_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_Cassia_Fingers_Done_01_00 " );	// I found your mentor.
	AI_Output(self,other, " DIA_Cassia_Fingers_Done_01_01 " );	// (excitedly) Really? What about him?
	AI_Output(other,self, " DIA_Cassia_Fingers_Done_01_02 " );	// He's fine. He is alive and well.
	AI_Output(self,other, " DIA_Cassia_Fingers_Done_01_03 " );	// That's good news! I hope that someday he still comes back to us.
	AI_Output(self,other, " DIA_Cassia_Fingers_Done_01_04 " );	// And everything will be the same as before. Thank you.
	MIS_WhereFingers = LOG_Success;
	Log_SetTopicStatus(TOPIC_WhereFingers,LOG_Success);
	B_LogEntry(TOPIC_WhereFingers, " Cassia is pleased to learn that Master Fingers is alive. " );
};


instance DIA_Cassia_Fingers_Dead(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Fingers_Dead_Condition;
	information = DIA_Cassia_Fingers_Dead_Info;
	permanent = FALSE;
	description = " I found your mentor. " ;
};

func int DIA_Cassia_Fingers_Dead_Condition()
{
	if((MIS_WhereFingers == LOG_Running) && (FingersIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Fingers_Dead_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Cassia_Fingers_Dead_01_00 " );	// I found your mentor.
	AI_Output(self,other, " DIA_Cassia_Fingers_Dead_01_01 " );	// (excitedly) Really? What about him?
	AI_Output(other,self,"DIA_Cassia_Fingers_Dead_01_02");	//Он мертв.
	AI_Output(self,other, " DIA_Cassia_Fingers_Dead_01_03 " );	// This is bad news. But we all have to come to terms with it.
	AI_Output(self,other, " DIA_Cassia_Fingers_Dead_01_04 " );	// Thanks anyway.
	MIS_WhereFingers = LOG_Success;
	Log_SetTopicStatus(TOPIC_WhereFingers,LOG_Success);
	B_LogEntry(TOPIC_WhereFingers, " Cassia is very saddened to hear that Fingers is dead. " );
};

instances of DIA_Cassia_Versteck (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Versteck_Condition;
	information = DIA_Cassia_Versteck_Info;
	permanent = FALSE;
	description = " Where do you hide the loot? " ;
};

func int DIA_Cassia_Hidden_Condition()
{
	if((IS_LOVCACH == TRUE) && Npc_KnowsInfo(other,DIA_Ramirez_Beute))
	{
		return TRUE;
	};
};

func void DIA_Cassia_hiding_info()
{
	AI_Output(other,self, " DIA_Cassia_Versteck_15_00 " );	// Where do you hide the loot?
	AI_Output(self,other, " DIA_Cassia_Versteck_16_01 " );	// Do you think I'll just lay everything out for you like that?
	AI_Output(self,other, " DIA_Cassia_Versteck_16_02 " );	// You will have plenty of opportunity to make your own fortune. Remember - the greedy usually end up with nothing!
};

instance DIA_Cassia_Blutkelche (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Blutkelche_Condition;
	information = DIA_Cassia_Blutkelche_Info;
	permanent = TRUE;
	description = " Do you have a job for me? " ;
};

func int DIA_Cassia_Blutkelche_Condition()
{
	if((IS_LOVCACH == TRUE) && (MIS_CassiaKelche == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Blutkelche_Info()
{
	AI_Output(other,self, " DIA_Cassia_Blutkelche_15_00 " );	// Do you have a job for me?

	if(hero.attribute[ATR_DEXTERITY] >= 50)
	{
		AI_Output(self,other, " DIA_Cassia_Blutkelche_16_03 " );	// Yes, I'm interested in the cup collection. There are six in total!
		AI_Output(self,other, " DIA_Cassia_Blutkelche_16_04 " );	// King Rhobar captured them somehow during one of his campaigns - but for this he had to put a lot of his people. That is why they are called Blood Cups.
		AI_Output(self,other, " DIA_Cassia_Blutkelche_16_05 " );	// Each of the cups is not particularly valuable on its own - but all six put together are worth a fortune.
		AI_Output(other,self, " DIA_Cassia_Blutkelche_15_06 " );	// Where are these cups?
		AI_Output(self,other, " DIA_Cassia_Blutkelche_16_07 " );	// They are here in the city - they are owned by rich merchants from the upper quarter.
		AI_Output(self,other, " DIA_Cassia_Blutkelche_16_08 " );	// Bring them to me. In the meantime, I'll find a buyer for them.
		AI_Output(other,self, " DIA_Cassia_Blutkelche_15_09 " );	// What will happen to me?
		AI_Output(self,other, " DIA_Cassia_Blutkelche_16_10 " );	// Either half of the income, or you can choose something from my treasury.
		MIS_CassiaKelche = LOG_Running;
		Log_CreateTopic(Topic_CassiaKelche,LOG_MISSION);
		Log_SetTopicStatus(Topic_CassiaKelche,LOG_Running);
		B_LogEntry(Topic_CassiaKelche, " Cassia wants me to bring her six blood goblets. Apparently they're in town. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Cassia_Blutkelche_16_20 " );	// Hmmm...(assessing) I'm sorry, but now with your dexterity all you have to do is steal empty bottles from drunkards.
		AI_Output(self,other, " DIA_Cassia_Blutkelche_16_21 " );	// Therefore, you should increase your thief skills a bit first.
		AI_Output(self,other, " DIA_Cassia_Blutkelche_16_22 " );	// Then maybe there will be a job.
	};
};

instance DIA_Cassia_giving (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_deliver_Condition;
	information = DIA_Cassia_giving_Info;
	permanent = TRUE;
	description = " About the Blood Cups... " ;
};

func int DIA_Cassia_giving_Condition()
{
	if(MIS_CassiaKelche == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Cassia_giving_Info()
{
	AI_Output(other,self, " DIA_Cassia_abgeben_15_00 " );	// About the Blood Cups...

	if(B_GiveInvItems(other,self,ItMi_ZloodCup_MIS,6))
	{
		B_GivePlayerXP(XP_CassiaBlutkelche);
		AI_Output(other,self, " DIA_Cassia_abgeben_15_01 " );	// I have all six cups.
		AI_Output(self,other, " DIA_Cassia_abgeben_16_02 " );	// Great job, and in the meantime I found a buyer.
		AI_Output(self,other, " DIA_Cassia_abgeben_16_03 " );	// You can get your reward. Thank you for doing this for me.
		Npc_RemoveInvItems(self,ItMi_ZloodCup_MIS,6);
		THIEF_REPUTATION = THIEF_REPUTATION + 3;
		MIS_CassiaKelche = LOG_SUCCESS;
		Log_SetTopicStatus(Topic_CassiaKelche,LOG_SUCCESS);
		B_LogEntry(Topic_CassiaKelche, " I brought all six cups to Cassia. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Cassia_abgeben_16_05 " );	// I can only sell these cups all together. Bring me all six.
	};
};


instance DIA_Cassia_Belohnung (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_Belohnung_Condition;
	information = DIA_Cassia_Reward_Info;
	permanent = FALSE;
	description = " I've come for my reward. " ;
};

func int DIA_Cassia_Reward_Condition()
{
	if(MIS_CassiaKelche == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_Cassia_Reward_Info()
{
	AI_Output(other,self, " DIA_Cassia_Belohnung_15_00 " );	// I've come for my reward.
	AI_Output(self,other, " DIA_Cassia_Belohnung_16_01 " );	// What do you choose?
	Info_ClearChoices(DIA_Cassia_Belohnung);
	Info_AddChoice(DIA_Cassia_Belohnung, " Fifteen thousand gold coins. " ,DIA_Cassia_Belohnung_Gold);
	Info_AddChoice(DIA_Cassia_Belohnung, " Ten potions of healing. " ,DIA_Cassia_Belohnung_Trank);
	Info_AddChoice(DIA_Cassia_Belohnung, " Rogue's Ring. " ,DIA_Cassia_Belohnung_Ring);
};

func void DIA_Cassia_Reward_Gold()
{
	AI_Output(other,self, " DIA_Cassia_Belohnung_15_02 " );	// Give me the gold.
	B_GiveInvItems(self,other,ItMi_Gold,1500);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

func void DIA_Cassia_reward_potion()
{
	AI_Output(other,self, " DIA_Cassia_Belohnung_15_03 " );	// Give me drinks.
	B_GiveInvItems(self,other,ItPo_Health_03,10);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

func void DIA_Cassia_Reward_Ring()
{
	AI_Output(other,self, " DIA_Cassia_Belohnung_15_04 " );	// Give me the ring.
	B_GiveInvItems(self,other,itri_dex_03,1);
	Info_ClearChoices(DIA_Cassia_Belohnung);
};

instance DIA_Cassia_In_Guild(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_In_Guild_condition;
	information = DIA_Cassia_In_Guild_info;
	permanent = FALSE;
	description = " Are there more errands for me? " ;
};

func int DIA_Cassia_In_Guild_condition()
{
	if((IS_LOVCACH == TRUE) && (MIS_CassiaKelche == LOG_SUCCESS) && (hero.attribute[ATR_DEXTERITY] >= 75))
	{
		return TRUE;
	};
};

func void DIA_Cassia_In_Guild_info()
{
	AI_Output(other,self, " DIA_Cassia_In_Guild_01_01 " );	// Will there be more errands for me?
	AI_Output(self,other, " DIA_Cassia_In_Guild_01_02 " );	// Of course. There is always a job for people like you.
	AI_Output(self,other, " DIA_Cassia_In_Guild_01_03 " );	// One of our... (hesitatingly) ...a regular customer, let's say, ordered us a consecrated figurine of Innos.
	AI_Output(self,other, " DIA_Cassia_In_Guild_01_04 " );	// And he is ready to pay a tidy sum for it. Interesting?
	AI_Output(other,self,"DIA_Cassia_In_Guild_01_05");	//Само собой.
	AI_Output(self,other, " DIA_Cassia_In_Guild_01_06 " );	// Great! Then get on with it...
	AI_Output(self,other, " DIA_Cassia_In_Guild_01_07 " );	// But be careful - I don't want to give our customer a fake.
	AI_Output(self,other, " DIA_Cassia_In_Guild_01_08 " );	// A real figurine will probably be very, very difficult to get, keep that in mind.
	AI_Output(self,other, " DIA_Cassia_In_Guild_01_09 " );	// Once you have it, we'll talk about your reward, my dear.
	MISS_KASSIA_IN_GUILD = LOG_Running;
	Log_CreateTopic(TOPIC_CASSIA_STATUETTE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CASSIA_STATUETTE,LOG_Running);
	B_LogEntry( TOPIC_CASSIA_STATUETTE , " Cassia wants me to bring back the consecrated statuette of Innos. However, Cassia warned me that fake statuettes might exist. " );
};

instance DIA_Cassia_In_Guild_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = DIA_Cassia_In_Guild_Done_condition;
	information = DIA_Cassia_In_Guild_Done_info;
	permanent = FALSE;
	description = " I have the figurine. " ;
};

func int DIA_Cassia_In_Guild_Done_condition()
{
	if((Npc_HasItems(hero,ItMi_LostInnosStatue_Daron) || Npc_HasItems(hero,ItMi_GoblinnosStatue_Daron_New)) && (MISS_KASSIA_IN_GUILD == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cassia_In_Guild_Done_info()
{
	AI_Output(other,self, " DIA_Cassia_In_Guild_Done_01_01 " );	// I have the figurine.

	if(Npc_HasItems(hero,ItMi_LostInnosStatue_Daron) && Npc_HasItems(hero,ItMi_GoblinnosStatue_Daron_New))
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(hero,self,ItMi_LostInnosStatue_Daron,1);
		Npc_RemoveInvItems(self,ItMi_LostInnosStatue_Daron,1);
		Npc_RemoveInvItems(hero,ItMi_GoblinnosStatue_Daron_New,1);
		AI_Output(self,other, " DIA_Cassia_In_Guild_Done_01_02 " );	// Yes, I see. And you even brought another one - only a fake.
		AI_Output(self,other, " DIA_Cassia_In_Guild_Done_01_03 " );	// Okay, I'll try to sell it too.
		AI_Output(self,other, " DIA_Cassia_In_Guild_Done_01_04 " );	// As for you personally, you did a great job! Even better than I expected.
		AI_Output(self,other, " DIA_Cassia_In_Guild_Done_01_05 " );	// Here, take this elixir. I think this is a good reward for your work.
		B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
		THIEF_REPUTATION = THIEF_REPUTATION + 3;
		MISS_KASSIA_IN_GUILD = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_CASSIA_STATUETTE,LOG_SUCCESS);
		B_LogEntry( TOPIC_CASSIA_STATUETTE , " Cassia was delighted with the work I did. " );
	}
	else if(Npc_HasItems(hero,ItMi_GoblinnosStatue_Daron_New))
	{
		B_GivePlayerXP(100);
		B_GiveInvItems(hero,self,ItMi_GoblinnosStatue_Daron_New,1);
		Npc_RemoveInvItems(self,ItMi_GoblinnosStatue_Daron_New,1);
		AI_Output(self,other, " DIA_Cassia_In_Guild_Done_01_06 " );	// Yes, I see. But to my great regret, it's just a fake!
		AI_Output(self,other, " DIA_Cassia_In_Guild_Done_01_07 " );	// Okay, I'll try to sell it too.
		AI_Output(self,other, " DIA_Cassia_In_Guild_Done_01_08 " );	// As for you, you failed me in this case.
		AI_Output(self,other, " DIA_Cassia_In_Guild_Done_01_09 " );	// However, I don't hold a grudge against you. So come visit us if you want.
		THIEF_REPUTATION = THIEF_REPUTATION + 1;
		MISS_KASSIA_IN_GUILD = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_CASSIA_STATUETTE,LOG_SUCCESS);
		B_LogEntry( TOPIC_CASSIA_STATUETTE , " Cassia was annoyed that I couldn't find the real statuette. " );
	}
	else  if ( Npc_HasItems ( hero , It'sMy_LostInnosStatue_Daron ) )
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(hero,self,ItMi_LostInnosStatue_Daron,1);
		Npc_RemoveInvItems(self,ItMi_LostInnosStatue_Daron,1);
		AI_Output(self,other, " DIA_Cassia_In_Guild_Done_01_10 " );	// Yes, I see... (pretty) She's the best!
		AI_Output(self,other, " DIA_Cassia_In_Guild_Done_01_11 " );	// Our customer will be satisfied, and we will get a decent jackpot from this case.
		AI_Output(self,other, " DIA_Cassia_In_Guild_Done_01_12 " );	// As for you personally, you did a great job!
		AI_Output(self,other, " DIA_Cassia_In_Guild_Done_01_13 " );	// Here's your share.
		B_GiveInvItems(self,other,ItMi_Gold,350);
		THIEF_REPUTATION = THIEF_REPUTATION + 2;
		MISS_KASSIA_IN_GUILD = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_CASSIA_STATUETTE,LOG_SUCCESS);
		B_LogEntry( TOPIC_CASSIA_STATUETTE , " Cassia was pleased with the work I did. " );
	};
};

instance DIA_CASSIA_ANOTHERJOB(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = dia_cassia_anotherjob_condition;
	information = dia_cassia_anotherjob_info;
	permanent = FALSE;
	description = " Is there any work for me outside the city? " ;
};

func int dia_cassia_anotherjob_condition()
{
	if((IS_LOVCACH == TRUE) && (MISS_KASSIA_IN_GUILD == LOG_SUCCESS) && (hero.attribute[ATR_DEXTERITY] >= 100))
	{
		return TRUE;
	};
};

func void dia_cassia_anotherjob_info()
{
	AI_Output(other,self, " DIA_Cassia_AnotherJob_15_00 " );	// Is there any work for me outside the city?
	AI_Output(self,other, " DIA_Cassia_AnotherJob_16_03 " );	// There is one, but very difficult. But you can take it on if you want.
	AI_Output(other,self, " DIA_Cassia_AnotherJob_16_99 " );	// What is it?
	AI_Output(self,other, " DIA_Cassia_AnotherJob_16_04 " );	// A lunatic asked me to get the Ore Baron's cup! She says she will bring him good luck.
	AI_Output(self,other, " DIA_Cassia_AnotherJob_16_05 " );	// However, this is his business - he gives a generous reward.
	AI_Output(other,self, " DIA_Cassia_AnotherJob_15_06 " );	// And as I understand it, this bowl is kept in the castle of the Valley of Mines?
	AI_Output(self,other, " DIA_Cassia_AnotherJob_16_07 " );	// Yes. And no one knows exactly where.
	AI_Output(other,self, " DIA_Cassia_AnotherJob_15_09 " );	// What do I get for this?
	AI_Output(self,other, " DIA_Cassia_AnotherJob_16_10 " );	// As always - half of the profits or a valuable item from my treasury.
	AI_Output(other,self, " DIA_Cassia_AnotherJob_16_98 " );	// Okay, agreed.
	MIS_CASSIAGOLDCUP = LOG_Running;
	Log_CreateTopic(TOPIC_CASSIAGOLDCUP,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CASSIAGOLDCUP,LOG_Running);
	B_LogEntry( TOPIC_CASSIAGOLDCUP , " Cassia wants me to bring the Ore Baron's cup. It's somewhere in the Mine Valley castle. " );
};

instance DIA_CASSIA_ANOTHERJOB2(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = dia_cassia_anotherjob2_condition;
	information = dia_cassia_anotherjob2_info;
	permanent = TRUE;
	description = " I found Ore Baron's chalice. " ;
};

func int dia_cassia_anotherjob2_condition()
{
	if (( MIS_CASSIAGOLDCUP  == LOG_Running) && (Npc_HasItems(hero, ITMI_GOMEZGOLDCUP ) >=  1 ))
	{
		return TRUE;
	};
};

func void dia_cassia_anotherjob2_info()
{
	AI_Output(other,self, " DIA_Cassia_AnotherJob2_15_00 " );	// I've found the Ore Baron's chalice.

	if(B_GiveInvItems(other,self,ITMI_GOMEZGOLDCUP,1))
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_Cassia_AnotherJob2_15_01 " );	// But this took a lot of work.
		AI_Output(self,other, " DIA_Cassia_AnotherJob2_16_02 " );	// I confess - I'm delighted!
		AI_Output(self,other, " DIA_Cassia_AnotherJob2_16_03 " );	// Thank you. Now you can get your reward.
		Npc_RemoveInvItems(self,ITMI_GOMEZGOLDCUP,1);
		THIEF_REPUTATION = THIEF_REPUTATION + 4;
		MIS_CASSIAGOLDCUP = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_CASSIAGOLDCUP,LOG_SUCCESS);
		B_LogEntry( TOPIC_CASSIAGOLDCUP , " I got Cassia the cup of the Ore Baron. " );
	}
	else
	{
		AI_Output(self,other,"DIA_Cassia_AnotherJob2_16_99");	//И где же она?!
	};
};

instances DIA_CASSIA_BELOHNUNG2 (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 2;
	condition = dia_cassia_belohnung2_condition;
	information = dia_cassia_reward2_info;
	permanent = FALSE;
	description = " I want to claim my reward for the Ore Baron's chalice. " ;
};

func int dia_cassia_belohnung2_condition()
{
	if(MIS_CASSIAGOLDCUP == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_cassia_belohnung2_info()
{
	AI_Output(other,self, " DIA_Cassia_Belohnung2_15_00 " );	// I want to claim my reward for the Ore Baron's chalice.
	AI_Output(self,other, " DIA_Cassia_Belohnung2_15_97 " );	// Okay. Here, take these ancient tablets.
	B_GiveInvItems(self,other,ItWr_HitPointStonePlate1_Addon,2);
	AI_Output(self,other, " DIA_Cassia_Belohnung2_15_98 " );	// The text on them is embossed in some ancient language, and I could not make out anything. But for a person like you, they will certainly come in handy.
};

instance DIA_CASSIA_GUILDKILL(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = dia_cassia_guildkill_condition;
	information = dia_cassia_guildkill_info;
	permanent = FALSE;
	description = " Do you know anything about the Assassin's Guild? " ;
};

func int dia_cassia_guildkill_condition()
{
	if (( MY_GUILDKILL  == LOG_Running ) && ( IS_LOVCACH  ==  TRUE ) && ( CANCOMPLETEGUILDKILL  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_cassia_guildkill_info()
{
	AI_Output(other,self, " DIA_Cassia_GuildKill_01_00 " );	// Do you know anything about the Assassin's Guild?
	AI_Output(self,other, " DIA_Cassia_GuildKill_01_01 " );	// (frightened) The Assassin's Guild? Why do you want it?
	AI_Output(other,self, " DIA_Cassia_GuildKill_01_02 " );	// Well, let's just say - I have one business for them.
	AI_Output(self,other, " DIA_Cassia_GuildKill_01_03 " );	// I would advise you to stay away from these people. But if you really need it...
	AI_Output(self,other, " DIA_Cassia_GuildKill_01_04 " );	// ...talk to Ramirez. He will tell you more about them.
	B_LogEntry( TOPIC_GUILDKILL , " Cassia doesn't know anything about the Assassin's Guild. She advised me to talk to Ramirez. " );
};


instance DIA_Cassia_Quest_Music(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 999;
	condition = DIA_Cassia_Quest_Music_condition;
	information = DIA_Cassia_Quest_Music_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Cassia_Quest_Music_condition()
{
	if((IS_LOVCACH == TRUE) && (MIS_CASSIAGOLDCUP == LOG_SUCCESS) && (Npc_KnowsInfo(hero,dia_jesper_quest) == TRUE) && (Kapitel >= 2) && (hero.attribute[ATR_DEXTERITY] >= 125) && (MIS_FindKillPlace == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Quest_Music_info()
{
	AI_Output(self,other, " DIA_Cassia_Quest_Music_01_01 " );	// Wait. There is a job for you here.
	AI_Output(other,self,"DIA_Cassia_Quest_Music_01_02");	//И какая же?
	AI_Output(self,other, " DIA_Cassia_Quest_Music_01_03 " );	// We recently received a very lucrative order, and I'm ready to do anything to fulfill it.
	AI_Output(self,other, " DIA_Cassia_Quest_Music_01_04 " );	// I need musical instruments - a lute, a bagpipe, a harp and a chitarrone.
	AI_Output(self,other, " DIA_Cassia_Quest_Music_01_05 " );	// I don't care where you get them. The main thing is that I have them in the near future.
	AI_Output(other,self, " DIA_Cassia_Quest_Music_01_06 " );	// I got it. I'll try to get these tools for you.
	MIS_KASSIAMUSIC = LOG_Running;
	Log_CreateTopic(TOPIC_KASSIAMUSIC,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KASSIAMUSIC,LOG_Running);
	B_LogEntry( TOPIC_KASSIAMUSIC , " Kassia asked me to bring four musical instruments: a bagpipe, a harp, a lute, and a chitarrone. Oh, my heart feels that they can't be found anywhere just like that. " );
};

instance DIA_Cassia_Quest_Music_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_Quest_Music_Done_condition;
	information = DIA_Cassia_Quest_Music_Done_info;
	permanent = FALSE;
	description = " I brought you all the tools. " ;
};

func int DIA_Cassia_Quest_Music_Done_condition()
{
	if ((Npc_HasItems(hero,ItMi_IEHarfe) >=  1 ) && (Npc_HasItems(hero,ItMi_IEDrumScheit) >=  1 ) && (Npc_HasItems(hero,ItMi_IEDudelBlau) >=  1 ) && (Npc_HasItems(hero,ItMi_IEDudelBlau) >=  1 ) && ( MIS_KASSIAMUSIC  == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cassia_Quest_Music_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Cassia_Quest_Music_Done_01_01 " );	// I brought you all the tools.
	AI_Output(self,other, " DIA_Cassia_Quest_Music_Done_01_02 " );	// Great! Give them here.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(hero,ItMi_IEHarfe,1);
	Npc_RemoveInvItems(hero,ItMi_IEDudelBlau,1);
	Npc_RemoveInvItems(hero,ItMi_IELaute,1);
	Npc_RemoveInvItems(hero,ItMi_IEDrumScheit,1);
	AI_Output(self,other, " DIA_Cassia_Quest_Music_Done_01_03 " );	// (pretty) You did a great job! And I'll get a huge pile of gold for these things.
	AI_Output(other,self, " DIA_Cassia_Quest_Music_Done_01_04 " );	// Will I get anything?
	AI_Output(self,other, " DIA_Cassia_Quest_Music_Done_01_05 " );	// I'm sure you'll appreciate my gratitude...
	B_GiveInvItems(self,other,ItMi_Gold,500);
	THIEF_REPUTATION = THIEF_REPUTATION + 4;
	MIS_KASSIAMUSIC = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KASSIAMUSIC,LOG_SUCCESS);
	B_LogEntry( TOPIC_KASSIAMUSIC , " I brought Cassia the tools. She was very pleased and gave me a hefty amount of gold. " );
};

instance DIA_Cassia_MagicBook(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_MagicBook_condition;
	information = DIA_Cassia_MagicBook_info;
	permanent = FALSE;
	description = " Do you know who robbed Vatras' house? " ;
};

func int DIA_Cassia_MagicBook_condition()
{
	if((IS_LOVCACH == TRUE) && (MIS_VatrasMagicBook == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Cassia_MagicBook_info()
{
	AI_Output(other,self, " DIA_Cassia_MagicBook_01_01 " );	// Do you happen to know who robbed Vatras' house?
	AI_Output(self,other, " DIA_Cassia_MagicBook_01_02 " );	// Of course I do. (smiling) Such events simply cannot happen without my knowledge.
	AI_Output(other,self, " DIA_Cassia_MagicBook_01_03 " );	// Then maybe you could tell me who I should talk to about this case?
	AI_Output(self,other, " DIA_Cassia_MagicBook_01_04 " );	// (suspiciously) Why are you doing this?
	Info_ClearChoices(DIA_Cassia_MagicBook);
	Info_AddChoice(DIA_Cassia_MagicBook, " Just got curious. " ,DIA_Cassia_MagicBook_JustInt);
	Info_AddChoice(DIA_Cassia_MagicBook, " That bastard should be in jail! " ,DIA_Cassia_MagicBook_Kill);
	Info_AddChoice(DIA_Cassia_MagicBook, " I'm looking for one thing that was stolen there. " ,DIA_Cassia_MagicBook_Stolen);

	if(RhetorikSkillValue[1] >= 15)
	{
		Info_AddChoice(DIA_Cassia_MagicBook, " Just a rumor, you know. " ,DIA_Cassia_MagicBook_Rumors);
	};
};

func void DIA_Cassia_MagicBook_JustInt()
{
	AI_Output(other,self, " DIA_Cassia_MagicBook_JustInt_01_01 " );	// Just got curious.
	AI_Output(self,other, " DIA_Cassia_MagicBook_JustInt_01_02 " );	// If I were you, I would stay away from such topics.
	AI_Output(self,other, " DIA_Cassia_MagicBook_JustInt_01_03 " );	// Asking too many questions here can get you in big trouble.
	MagicBookCantFind = TRUE;
	B_LogEntry(TOPIC_VatrasMagicBook, " I don't think I'll be able to find out who stole Vatras' diary. I'll have to tell him this sad news. " );	
	Info_ClearChoices(DIA_Cassia_MagicBook);
};

func void DIA_Cassia_MagicBook_Kill()
{
	AI_Output(other,self, " DIA_Cassia_MagicBook_Kill_01_01 " );	// This bastard should be in jail!
	AI_Output(self,other, " DIA_Cassia_MagicBook_Kill_01_02 " );	// You're not too smart to be telling me things like that right now.
	AI_Output(self,other, " DIA_Cassia_MagicBook_Kill_01_03 " );	// For the first time, I forgive you... (terribly) But from now on, think carefully before you open your mouth.
	MagicBookCantFind = TRUE;
	B_LogEntry(TOPIC_VatrasMagicBook, " I don't think I'll be able to find out who stole Vatras' diary. I'll have to tell him this sad news. " );	
	Info_ClearChoices(DIA_Cassia_MagicBook);
};

func void DIA_Cassia_MagicBook_Stolen()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Cassia_MagicBook_Stolen_01_01 " );	// I'm looking for one thing that was stolen there.
	AI_Output(self,other,"DIA_Cassia_MagicBook_Stolen_01_02");	//Какую?
	AI_Output(other,self, " DIA_Cassia_MagicBook_Stolen_01_03 " );	// Diary of Vatras. Do you know where he might be?
	AI_Output(self,other, " DIA_Cassia_MagicBook_Stolen_01_04 " );	// No, of course not. But you won't find it here for sure.
	AI_Output(self,other, " DIA_Cassia_MagicBook_Stolen_01_05 " );	// You'd better ask the merchants in the market square. Perhaps your book will show up there.
	B_LogEntry(TOPIC_VatrasMagicBook, " Cassia advised me to talk to the merchants in the marketplace. Perhaps the diary is already looking for a new buyer. " );	
	MagicBookFindTrade = TRUE;
	Info_ClearChoices(DIA_Cassia_MagicBook);
};

func void DIA_Cassia_MagicBook_Rumors()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Cassia_MagicBook_Rumors_01_01 " );	// It's just a rumor, you know.
	AI_Output(other,self, " DIA_Cassia_MagicBook_Rumors_01_02 " );	// So I wanted to look at the craftsman who turned this business so brilliantly.
	AI_Output(self,other, " DIA_Cassia_MagicBook_Rumors_01_03 " );	// Well, it's not a secret... (smiling) Of course, Ramirez! Only he can do that.
	AI_Output(self,other, " DIA_Cassia_MagicBook_Rumors_01_04 " );	// So you can go and express your admiration to him.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	MagicBookFindTradeExt = TRUE;
	B_LogEntry(TOPIC_VatrasMagicBook, " Cassia told me that Vatras' house was robbed by Ramirez. He must know exactly where the diary is now. " );
	Info_ClearChoices(DIA_Cassia_MagicBook);
};

instance DIA_Cassia_RichStones(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_RichStones_Condition;
	information = DIA_Cassia_RichStones_Info;
	permanent = FALSE;
	description = " Anything new? " ;
};

func int DIA_Cassia_RichStones_Condition()
{
	if((IS_LOVCACH == TRUE) && (Kapitel >= 3) && (hero.attribute[ATR_DEXTERITY] >= 150))
	{
		return TRUE;
	};
};

func void DIA_Cassia_RichStones_Info()
{
	AI_Output(other,self, " DIA_Cassia_RichStones_01_00 " );	// Anything new?
	AI_Output(self,other, " DIA_Cassia_RichStones_01_01 " );	// Yes. It's good that you came.
	AI_Output(self,other, " DIA_Cassia_RichStones_01_02 " );	// Recently, we heard rumors that the paladins brought many gems with them to the island.
	AI_Output(self,other, " DIA_Cassia_RichStones_01_03 " );	// But we were only interested in one of them - a huge ruby, almost the size of a fist!
	AI_Output(other,self, " DIA_Cassia_RichStones_01_04 " );	// How did you find out about him?
	AI_Output(self,other, " DIA_Cassia_RichStones_01_05 " );	// It doesn't matter... (smiling) We have enough sources of information in this city.
	AI_Output(self,other, " DIA_Cassia_RichStones_01_06 " );	// So, I want this stone to decorate my treasury.
	AI_Output(other,self, " DIA_Cassia_RichStones_01_07 " );	// Are you implying that I could steal it for you?
	AI_Output(self,other, " DIA_Cassia_RichStones_01_08 " );	// You got it right.
	AI_Output(self,other, " DIA_Cassia_RichStones_01_09 " );	// As far as I know, the paladins moved the chest with these jewels from the ship to the city hall.
	AI_Output(self,other, " DIA_Cassia_RichStones_01_10 " );	// And there, of course, he is securely guarded.
	AI_Output(self,other, " DIA_Cassia_RichStones_01_11 " );	// There is another problem - most likely, this chest has a very complex lock.
	AI_Output(self,other, " DIA_Cassia_RichStones_01_12 " );	// Even Ramirez will find it extremely difficult to open it quickly and accurately.
	AI_Output(other,self, " DIA_Cassia_RichStones_01_13 " );	// Do you think I can do better?
	AI_Output(self,other, " DIA_Cassia_RichStones_01_14 " );	// You have access to the town hall, which means it will be easier for you to approach him.
	AI_Output(other,self, " DIA_Cassia_RichStones_01_15 " );	// Well, okay. And what will I get from this?
	AI_Output(self,other, " DIA_Cassia_RichStones_01_16 " );	// Everything you find in the chest except the ruby ​​is yours. Deal?
	AI_Output(other,self, " DIA_Cassia_RichStones_01_17 " );	// Okay, I'll try.
	MIS_RichStones = LOG_Running;
	Log_CreateTopic(Topic_RichStones,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RichStones,LOG_Running);
	B_LogEntry(TOPIC_RichStones, " Cassia wants me to steal for her one huge ruby, almost the size of a fist! It's kept in the city hall along with other jewels. But there's a problem: the lock on that chest is incredibly complex. " );
};

instance DIA_Cassia_RichStones_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_RichStones_Done_Condition;
	information = DIA_Cassia_RichStones_Done_Info;
	permanent = FALSE;
	description = " I have a ruby! " ;
};

func int DIA_Cassia_RichStones_Done_Condition()
{
	if((MIS_RichStones == LOG_Running) && (Npc_HasItems(hero,ItMi_BigRuby) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Cassia_RichStones_Done_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Cassia_RichStones_Done_01_00 " );	// I have a ruby!
	AI_Output(self,other, " DIA_Cassia_RichStones_Done_01_01 " );	// Great! (greedily) Then what are you waiting for - give it to me.
	AI_Output(other,self, " DIA_Cassia_RichStones_Done_01_02 " );	// Of course, here it is.
	B_GiveInvItems(other,self,ItMi_BigRuby,1);
	Npc_RemoveInvItems(self,ItMi_BigRuby,1);
	AI_Output(other,self, " DIA_Cassia_RichStones_Done_01_03 " );	// I just wanted to admire it a little more.
	AI_Output(self,other, " DIA_Cassia_RichStones_Done_01_04 " );	// I understand you. It is not often that such a treasure falls into the hands.
	AI_Output(self,other, " DIA_Cassia_RichStones_Done_01_05 " );	// And you did a good job. Outdid even Ramirez.
	AI_Output(self,other, " DIA_Cassia_RichStones_Done_01_06 " );	// Just don't tell him about it. He doesn't much like braggarts.
	AI_Output(self,other, " DIA_Cassia_RichStones_Done_01_07 " );	// (maliciously) And I almost forgot - here's your reward.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	THIEF_REPUTATION = THIEF_REPUTATION + 5;
	MIS_RichStones = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RichStones,LOG_SUCCESS);
	B_LogEntry(TOPIC_RichStones, " Cassia was very pleased that I managed to steal the ruby. " );
};

instance DIA_Cassia_DragonTreasure(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_DragonTreasure_Condition;
	information = DIA_Cassia_DragonTreasure_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Cassia_DragonTreasure_Condition()
{
	if (Npc_IsInState(self,ZS_Talk) && ( IS_LOVCACH  ==  TRUE ) && (Chapter >=  4 ) && (MY_AllDragonsDead ==  FALSE ) && (hero.attribute[ ATR_DEXTERITY ] >=  200 )) ;
	{
		return TRUE;
	};
};

func void DIA_Cassia_DragonTreasure_Info()
{
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_01_00 " );	// Decided to visit us again?
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_01_01 " );	// Just wanted to know how you're doing here.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_01_02 " );	// Everything is fine... (smiling) And you, I heard, are going to the Valley of Mines again?
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_01_03 " );	// Well... Someone asked me to finish off a couple of dragons there.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_01_04 " );	// Dragons? In that case, I have a tempting offer for you.
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_01_05 " );	// Listen carefully to you.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_01_06 " );	// According to legend, dragons are very dangerous creatures. But also very rich.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_01_07 " );	// Each of them usually has his own treasury, where, in addition to gold, they also store quite valuable things.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_01_08 " );	// It would be nice to get at least one of these things. Not to mention something more!
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_01_09 " );	// I, in turn, will generously reward you for your efforts. What do you say?
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_01_10 " );	// Yes, your suggestion is quite interesting. Okay, I'm in. What exactly do you need from dragons?
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_01_11 " );	// If I knew... (smirking) Bring me all the unusual things that you come across in the dragon hoards. And then we'll figure out what's what.
	MIS_DragonTreasure = LOG_Running;
	Log_CreateTopic(Topic_DragonTreasure,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_Running);
	B_LogEntry(TOPIC_DragonTreasure, " Cassia wants me to rummage through the dragon treasury and bring her some very valuable items. She will reward me well for that. Now it's just a matter of going out and killing the dragons. " );
};

var int OreBaronCrownUp;
var int GoldHuntHornUp;
var int DiamondChokerUp;
var int GoldKnifeUp;

instance DIA_Cassia_DragonTreasure_Done(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 3;
	condition = DIA_Cassia_DragonTreasure_Done_Condition;
	information = DIA_Cassia_DragonTreasure_Done_Info;
	permanent = TRUE;
	description = " I have something here for you. " ;
};

func int DIA_Cassia_DragonTreasure_Done_Condition()
{
	if ((MIS_DragonTreasure == LOG_Running) && ((Npc_HasItems(hero,ItMi_DiamondChoker) >=  1 ) || (Npc_HasItems(hero,ItMi_HuntHornGold) >=  1 ) || ( Npc_HasItems(hero,ItMi_KnifeGold) >=  1 ) || Npc_HasItems(hero,ItMi_OreBaronCrown) >=  1 )))
	{
		return TRUE;
	};
};

func void DIA_Cassia_DragonTreasure_Done_Info()
{
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_Done_01_00 " );	// I have something here for you.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_01_01 " );	// Well, let's see.
	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
	Info_AddChoice(DIA_Cassia_DragonTreasure_Done, " Nothing else yet. " ,DIA_Cassia_DragonTreasure_Done_Back);

	if((Npc_HasItems(hero,ItMi_DiamondChoker) >= 1) && (DiamondChokerUp == FALSE))
	{
		Info_AddChoice(DIA_Cassia_DragonTreasure_Done, " Give Diamond Choker. " ,DIA_Cassia_DragonTreasure_Done_DiamondChoker);
	};
	if ((Npc_HasItems(hero,ItMy_HuntHornGold) >=  1 ) && (GoldHuntHornUp ==  FALSE ))
	{
		Info_AddChoice(DIA_Cassia_DragonTreasure_Done, " Give Gold HuntHorn. " ,DIA_Cassia_DragonTreasure_Done_GoldHuntHorn);
	};
	if ((Npc_HasItems(hero,ItMy_KnifeGold) >=  1 ) && (GoldKnifeUp ==  FALSE )) ;
	{
		Info_AddChoice(DIA_Cassia_DragonTreasure_Done, " Give Gold Dagger. " ,DIA_Cassia_DragonTreasure_Done_GoldKnife);
	};
	if ((Npc_HasItems(hero,ItMi_OreBaronCrown) >=  1 ) && (OreBaronCrownUp ==  FALSE ))
	{
		Info_AddChoice(DIA_Cassia_DragonTreasure_Done, " Give Crown. " ,DIA_Cassia_DragonTreasure_Done_OreBaronCrown);
	};
};

func void DIA_Cassia_DragonTreasure_Done_Back()
{
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_Done_Back_01_00 " );	// Nothing else yet.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_Back_01_01 " );	// Good. But I hope that soon you will please me with something else.
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_Done_Back_01_02 " );	// You can be sure of that.
	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
};

func void DIA_Cassia_DragonTreasure_Done_DiamondChoker()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_00 " );	// Here, take this diamond necklace.
	B_GiveInvItems(other,self,ItMi_DiamondChoker,1);
	Npc_RemoveInvItems(self,ItMi_DiamondChoker,1);
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_01 " );	// What a beauty... Such a thing must be very expensive!
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_02 " );	// I think I'll keep it for myself. The rest of such expensive things are completely useless.
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_03 " );	// It's up to you. What about my reward?
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_04 " );	// Of course, as I promised. Here, take your gold.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_05 " );	// How many are there?
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_DiamondChoker_01_06 " );	// Exactly one thousand gold pieces. Twice as much as what you would get from merchants for it.
	DiamondChokerUp = TRUE;

	if((DiamondChokerUp == TRUE) && (GoldKnifeUp == TRUE) && (GoldHuntHornUp == TRUE) && (OreBaronCrownUp == TRUE))
	{
		THIEF_REPUTATION = THIEF_REPUTATION + 5;
		MIS_DragonTreasure = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_SUCCESS);
		B_LogEntry(TOPIC_DragonTreasure, " I think there's enough presents for Cassia! I'm sure she's happy anyway. " );
	};

};

func void DIA_Cassia_DragonTreasure_Done_GoldHuntHorn()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_00 " );	// Golden hunting horn.
	B_GiveInvItems(other,self,ItMi_HuntHornGold,1);
	Npc_RemoveInvItems(self,ItMi_HuntHornGold,1);
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_01 " );	// Dear little thing... (appreciatively) Usually only people of very noble birth used these.
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_02 " );	// Apparently, it once belonged to one of the ore barons.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_03 " );	// Possibly. But now it doesn't matter anymore.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_GoldHuntHorn_01_04 " );	// Here, take the promised reward.
	B_GiveInvItems(self,other,ItMi_Gold,500);
	GoldHuntHornUp = TRUE;

	if((DiamondChokerUp == TRUE) && (GoldKnifeUp == TRUE) && (GoldHuntHornUp == TRUE) && (OreBaronCrownUp == TRUE))
	{
		THIEF_REPUTATION = THIEF_REPUTATION + 5;
		MIS_DragonTreasure = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_SUCCESS);
		B_LogEntry(TOPIC_DragonTreasure, " I think there's enough presents for Cassia! I'm sure she's happy anyway. " );
	};
};

func void DIA_Cassia_DragonTreasure_Done_GoldKnife()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_Done_GoldKnife_01_00 " );	// Here, look at this dagger.
	B_GiveInvItems(other,self,ItMi_KnifeGold,1);
	Npc_RemoveInvItems(self,ItMi_KnifeGold,1);
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_GoldKnife_01_01 " );	// Hmmm. Quite skillful work. Most likely, it was made on the mainland.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_GoldKnife_01_02 " );	// Local collectors are sure to be interested in this item.
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_Done_GoldKnife_01_03 " );	// And I'm more interested in my reward.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_GoldKnife_01_04 " );	// Don't worry, I haven't forgotten. (smiling) Here, take this magical elixir.
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_GoldKnife_01_05 " );	// It will make you even more dexterous.
	GoldKnifeUp = TRUE;

	if((DiamondChokerUp == TRUE) && (GoldKnifeUp == TRUE) && (GoldHuntHornUp == TRUE) && (OreBaronCrownUp == TRUE))
	{
		THIEF_REPUTATION = THIEF_REPUTATION + 5;
		MIS_DragonTreasure = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_SUCCESS);
		B_LogEntry(TOPIC_DragonTreasure, " I think there's enough presents for Cassia! I'm sure she's happy anyway. " );
	};
};

func void DIA_Cassia_DragonTreasure_Done_OreBaronCrown()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_00 " );	// In the treasury of one of the dragons, I found this crown.
	B_GiveInvItems(other,self,ItMy_OreBaronCrown, 1 );
	Npc_RemoveInvItems(self,ItMi_OreBaronCrown,1);
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_01 " );	// Incredible! What luck... (delighted) It's the crown of the ore barons!
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_02");	//Правда?!
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_03 " );	// Yes, she is the best. A gift from King Myrtana himself!
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_04 " );	// Once worn by the most powerful baron of this island.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_05 " );	// I never imagined that I would ever hold it in my hands.
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_06 " );	// For her, probably, any merchant will roll off a bunch of gold.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_07 " );	// It's practically priceless! But I like the way you think.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_08 " );	// Now I don't know what to do with it. You have to think carefully.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_09 " );	// And as for you, you have worked hard and deserved the highest reward.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_OreBaronCrown_01_10 " );	// I'll teach you how to properly use your powers when running and jumping. I agree?
	OreBaronCrownUp = TRUE;

	if((DiamondChokerUp == TRUE) && (GoldKnifeUp == TRUE) && (GoldHuntHornUp == TRUE) && (OreBaronCrownUp == TRUE))
	{
		THIEF_REPUTATION = THIEF_REPUTATION + 5;
		MIS_DragonTreasure = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_DragonTreasure,LOG_SUCCESS);
		B_LogEntry(TOPIC_DragonTreasure, " I think there's enough presents for Cassia! I'm sure she's happy anyway. " );
	};

	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
	Info_AddChoice(DIA_Cassia_DragonTreasure_Done, " Give me better gold. " ,DIA_Cassia_DragonTreasure_Done_Gold);
	Info_AddChoice(DIA_Cassia_DragonTreasure_Done,"Конечно!",DIA_Cassia_DragonTreasure_Done_Run);
};

func void DIA_Cassia_DragonTreasure_Done_Run()
{
	AI_Output(other,self,"DIA_Cassia_DragonTreasure_Done_Run_01_01");	//Конечно!
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_Run_01_02 " );	// Then listen. The main thing is to learn how to properly distribute the load of your body.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_Run_01_03 " );	// This will help you get less tired. And make sure you breathe evenly.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_Run_01_04 " );	// Use your new knowledge on your next adventures.
	CassiaTeachRegen = TRUE;
	AI_Print( " Learned : tireless runner " );
	Snd_Play("LevelUP");
	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
};

func void DIA_Cassia_DragonTreasure_Done_Gold()
{
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_Done_Gold_01_01 " );	// Better give me the gold.
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_Gold_01_02 " );	// Well, whatever you say. (sarcastically) Here, keep your gold.
	B_GiveInvItems(self,other,ItMi_Gold,2000);
	AI_Output(self,other, " DIA_Cassia_DragonTreasure_Done_Gold_01_03 " );	// This is enough to more than cover all your expenses.
	AI_Output(other,self, " DIA_Cassia_DragonTreasure_Done_Gold_01_04 " );	// Thank you.
	Info_ClearChoices(DIA_Cassia_DragonTreasure_Done);
};

instance DIA_Cassia_OrcHide (C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_OrcHide_condition;
	information = DIA_Cassia_OrcHide_info;
	permanent = FALSE;
	description = " I thought everyone was dead here. " ;
};

func int DIA_Cassia_OrcHide_condition()
{
	if ( KAPITELORCATC  ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Cassia_OrcHide_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Cassia_OrcHide_01_01 " );	// I thought everyone was dead here.
	AI_Output(self,other, " DIA_Cassia_OrcHide_01_02 " );	// (nervously) As you can see, we managed to survive.
	AI_Output(self,other, " DIA_Cassia_OrcHide_01_03 " );	// Now this is the only safe place in all of Khorinis.
	AI_Output(other,self, " DIA_Cassia_OrcHide_01_04 " );	// And if they do find you?
	AI_Output(self,other, " DIA_Cassia_OrcHide_01_05 " );	// How? (chuckling) Few people knew about this part of the sewer before.
	AI_Output(self,other, " DIA_Cassia_OrcHide_01_06 " );	// Orcs don't even know about it.
};

instance DIA_Cassia_OrcHideWhat(C_Info)
{
	npc = VLK_447_Cassia;
	nr = 1;
	condition = DIA_Cassia_OrcHideWhat_condition;
	information = DIA_Cassia_OrcHideWhat_info;
	permanent = FALSE;
	description = " And what will you do next? " ;
};

func int DIA_Cassia_OrcHideWhat_condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Cassia_OrcHide ) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Cassia_OrcHideWhat_info()
{
	AI_Output(other,self, " DIA_Cassia_OrcHideWhat_01_01 " );	// And what will you do next?
	AI_Output(self,other, " DIA_Cassia_OrcHideWhat_01_02 " );	// Nothing. Let's sit quietly here and lean out less.
	AI_Output(other,self, " DIA_Cassia_OrcHideWhat_01_03 " );	// But you can't sit here for the rest of your life!
	AI_Output(self,other, " DIA_Cassia_OrcHideWhat_01_04 " );	// I hope this doesn't happen.
	AI_Output(self,other, " DIA_Cassia_OrcHideWhat_01_05 " );	// The paladins will soon return here and liberate the city. Or our king only feeds them in vain!
	AI_Output(other,self, " DIA_Cassia_OrcHideWhat_01_06 " );	// Well, yes, you are right about something.
};
