

var int Lothar_ImOV;

instance DIA_Lothar_EXIT(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 999;
	condition = DIA_Lothar_EXIT_Condition;
	information = DIA_Lothar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lothar_EXIT_Condition()
{
	if(Lothar_ImOV == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Lothar_FirstEXIT(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 999;
	condition = DIA_Lothar_FirstEXIT_Condition;
	information = DIA_Lothar_FirstEXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Lothar_FirstEXIT_Condition()
{
	if(Lothar_ImOV == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_FirstEXIT_Info()
{
	AI_Output(other,self, " DIA_Lothar_FirstEXIT_15_00 " );	// I have to go!

	if (Lothar_Rules ==  FALSE )
	{
		AI_Output(self,other, " DIA_Lothar_FirstEXIT_01_01 " );	// Wait! You don't even know the new city laws!
		AI_Output(other,self,"DIA_Lothar_FirstEXIT_15_02");	//Позже.
		AI_StopProcessInfos(self);
	}
	else
	{
		if ((Player_TalkedAboutDragons ==  TRUE ) && ((hero.guild !=  GIL_PAL ) && (hero.guild !=  GIL_KDF ) && (hero.guild !=  GIL_KDW )))
		{
			AI_Output(self,other, " DIA_Lothar_FirstEXIT_01_03 " );	// If I ever hear you tell people about dragons one more time, you'll be in big trouble, do you understand?
		}
		else
		{
			AI_Output(self,other, " DIA_Lothar_FirstEXIT_01_04 " );	// As long as you're in Khorinis, you can feel safe.

			if(hero.guild != GIL_PAL)
			{
				AI_Output(self,other, " DIA_Lothar_FirstEXIT_01_05 " );	// The city is now guarded by the king's paladins!
			};
		};

		Lothar_ImOV = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"START");
	};
	if(Canthar_InStadt == FALSE)
	{
		Npc_ExchangeRoutine(Canthar,"START");
		Canthar_InStadt = TRUE;
	};
	if((LesterGoXar == FALSE) && (LesterCanGoXar == TRUE))
	{
		Npc_ExchangeRoutine(PC_Psionic,"XARDAS");
		LesterGoXar = TRUE;
	};
};

instance DIA_Lothar_Hallo(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_Hallo_Condition;
	information = DIA_Lothar_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Lothar_Hallo_Condition()
{
	if (self.aivar[AIV_TalkedToPlayer] ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hallo_Info()
{
	AI_Output(self,other, " DIA_Lothar_Hallo_01_00 " );	// Stop, stranger!

	if ((Mil_310_schonmalregister ==  FALSE ) && (Mil_333_schonmalregister ==  FALSE ) && ((hero.guild !=  GIL_PAL ) && (hero.guild !=  GIL_KDF ) && (hero.guild !=  GIL_KDW )))
	{
		AI_Output(self,other, " DIA_Lothar_Hallo_01_01 " );	// I didn't see you coming through that gate.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_02");	//И?
		AI_Output(self,other, " DIA_Lothar_Hallo_01_03 " );	// And the guards at the other gates received orders not to let unknown persons into the city.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_04");	//Нуууу...
		AI_Output(self,other, " DIA_Lothar_Hallo_01_05 " );	// We'll have to have a serious talk with both of them!
		AI_Output(self,other, " DIA_Lothar_Hallo_01_06 " );	// Now for us.
		CITYGATEACCESSGRANTED = TRUE;
		Mil_333_schonmalreinlett = TRUE ;
		Mil_310_schonmalreinlett = TRUE ;
		MIS_Addon_Lester_PickForConstantino = LOG_SUCCESS;
	}
	else
	{
		LotarTrueCome = TRUE;
	};

	AI_Output(self,other, " DIA_Lothar_Hallo_01_07 " );	// I'm Lothar! Paladin of the king and devoted servant of Innos.
	AI_Output(self,other, " DIA_Lothar_Hallo_01_08 " );	// Our commander, Lord Hagen, entrusted me with the task of explaining to all newcomers the new laws that all citizens of this city must obey.
	AI_Output(self,other, " DIA_Addon_Lothar_Hallo_01_00 " );	// Recently, people have started to disappear in the city, so the townspeople need to be careful not to share this fate.
};


instance DIA_Lothar_MESSAGE(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_MESSAGE_Condition;
	information = DIA_Lothar_MESSAGE_Info;
	permanent = FALSE;
	description = " I have an important message for the paladin leader! " ;
};


func int DIA_Lothar_MESSAGE_Condition()
{
	if ((Mil_305_schonmalreinlett ==  FALSE ) && (hero.guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

func void DIA_Lothar_MESSAGE_Info()
{
	AI_Output(other,self, " DIA_Lothar_MESSAGE_15_00 " );	// I have an important message for the paladin leader!
	AI_Output(self,other, " DIA_Lothar_MESSAGE_01_01 " );	// Honorable Lord Hagen does not receive anyone.
	AI_Output(self,other, " DIA_Lothar_MESSAGE_01_02 " );	// Lord Andre, commander of the city guard, is responsible for all matters concerning the common people.
};


instance DIA_Lothar_EyeInnos(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_EyeInnos_Condition;
	information = DIA_Lothar_EyeInnos_Info;
	permanent = FALSE;
	description = " I've come to get the Eye of Innos! " ;
};


func int DIA_Lothar_EyeInnos_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lothar_MESSAGE ) && ( LordHagen . aivar [ AIV_TalkedToPlayer ] ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lothar_EyeInnos_Info()
{
	AI_Output(other,self, " DIA_Lothar_EyeInnos_15_00 " );	// I've come to get the Eye of Innos!

	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDM))
	{
		AI_Output(self,other, " DIA_Lothar_EyeInnos_01_01 " );	// The question of the Eye must be decided by Lord Hagen. Talk to him about it.
	}
	else
	{
		AI_Output(self,other, " DIA_Lothar_EyeInnos_01_02 " );	// Sacred Eye of Innos? How do you know about him?! You do not belong to our order!
		AI_Output(other,self, " DIA_Lothar_EyeInnos_15_03 " );	// The mage told me about him.
		AI_Output(self,other, " DIA_Lothar_EyeInnos_01_04 " );	// I don't know what his motives were when he entrusted one of our order's secrets to you...
		AI_Output(self,other, " DIA_Lothar_EyeInnos_01_05 " );	// But he probably didn't mean that YOU can touch him with your hands.
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_06");	//Но...
		AI_Output(self,other, " DIA_Lothar_EyeInnos_01_07 " );	// I don't even want to hear about it!
		if(Player_TalkedAboutDragons == TRUE)
		{
			AI_Output(self,other, " DIA_Lothar_EyeInnos_01_08 " );	// First you were talking nonsense about dragons and now this. Incredible!
		};
	};
};


instance DIA_Lothar_Dragons(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_Dragons_Condition;
	information = DIA_Lothar_Dragons_Info;
	permanent = FALSE;
	description = " Listen! This city is threatened by dragons! " ;
};


func int DIA_Lothar_Dragons_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lothar_MESSAGE ) && ( LordHagen . aivar [ AIV_TalkedToPlayer ] ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lothar_Dragons_Info()
{
	AI_Output(other,self, " DIA_Lothar_Dragons_15_00 " );	// Listen! This city is threatened by dragons!

	if ((hero.guild !=  GIL_PAL ) && (hero.guild !=  GIL_KDF ) && (hero.guild !=  GIL_KDW ) && (hero.guild !=  GIL_KDM ))
	{
		AI_Output(self,other, " DIA_Lothar_Dragons_01_01 " );	// This can't be true!
		AI_Output(self,other, " DIA_Lothar_Dragons_01_02 " );	// Another crazy one!
		AI_Output(self,other, " DIA_Lothar_Dragons_01_03 " );	// The city is full of problems without it. The only thing missing is an idiot who scares people with fables about dragons!
		AI_Output(self,other, " DIA_Lothar_Dragons_01_04 " );	// I immediately imprisoned the last one who told dragon tales here, and sent him by prison transport to the Valley of Mines. So hold your tongue!
		AI_Output(self,other, " DIA_Lothar_Dragons_01_05 " );	// We can't have anyone here spreading panic among the people!
	}
	else
	{
		AI_Output(self,other, " DIA_Lothar_Dragons_01_06 " );	// I hear about this a lot. But it's hard to believe.
		AI_Output(self,other, " DIA_Lothar_Dragons_01_07 " );	// It's best if you keep those thoughts to yourself. We must by all means avoid panic among the people.
	};
	Player_TalkedAboutDragons = TRUE;
};


instance DIA_Addon_Lothar_Ornament(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 5;
	condition = DIA_Addon_Lothar_Ornament_Condition;
	information = DIA_Addon_Lothar_Ornament_Info;
	description = " Do you know anything about the stone creature in the circle of stones at Lobart's farm? " ;
};


func int DIA_Addon_Lothar_Ornament_Condition()
{
	if(MIS_Addon_Cavalorn_GetOrnamentFromPAL == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Lothar_Ornament_Info()
{
	AI_Output(other,self, " DIA_Addon_Lothar_Ornament_15_00 " );	// Do you know anything about the stone creature from the circle of stones at Lobart's farm?
	AI_Output(self,other, " DIA_Addon_Lothar_Ornament_01_01 " );	// Of course. We destroyed it. It threatened nearby farms.
	AI_Output(self,other, " DIA_Addon_Lothar_Ornament_01_02 " );	// Why are you interested in this?
	Info_ClearChoices(DIA_Addon_Lothar_Ornament);
	Info_AddChoice(DIA_Addon_Lothar_Ornament, " I'm looking for a piece of metal ornament. " ,DIA_Addon_Lothar_Ornament_suche);
	Info_AddChoice(DIA_Addon_Lothar_Ornament, " Do you think this is normal? " ,DIA_Addon_Lothar_Ornament_normal);
};

func void DIA_Addon_Lothar_Ornament_normal()
{
	AI_Output(other,self, " DIA_Addon_Lothar_Ornament_normal_15_00 " );	// Do you think this is normal?
	AI_Output(self,other, " DIA_Addon_Lothar_Ornament_normal_01_01 " );	// What, the appearance of a stone monster?
	AI_Output(self,other, " DIA_Addon_Lothar_Ornament_normal_01_02 " );	// As far as I know, waterbenders deal with this issue.
	AI_Output(self,other, " DIA_Addon_Lothar_Ornament_normal_01_03 " );	// I'm not up to it at all. We have enough to do in the city and the Valley of Mines.
	AI_Output(other,self,"DIA_Addon_Lothar_Ornament_normal_15_04");	//Понимаю.
};

func void DIA_Addon_Lothar_Ornament_suche()
{
	AI_Output(other,self, " DIA_Addon_Lord_Hagen_GiveOrnament_15_00 " );	// I'm looking for a metal ornament. He was supposed to be in the stone circle near Lobart's farm..
	AI_Output(self,other, " DIA_Addon_Lord_Hagen_GiveOrnament_04_01 " );	// Do you mean this thing? We thought it was a magical rune, but it turned out to be completely useless.
	AI_Output(self,other, " DIA_Addon_Lord_Hagen_GiveOrnament_04_02 " );	// You can take her. I don't need her!
	CreateInvItems(self,ItMi_Ornament_Addon,1);
	B_GiveInvItems(self,other,ItMi_Ornament_Addon,1);
	Lord_Hagen_GotOrnament = TRUE;
	B_GivePlayerXP(XP_Ambient);
	Info_ClearChoices(DIA_Addon_Lothar_Ornament);
};


instance DIA_Lothar_WhoDragons(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_WhoDragons_Condition;
	information = DIA_Lothar_WhoDragons_Info;
	permanent = FALSE;
	description = " Has anyone reported on dragons yet? " ;
};


func int DIA_Lothar_WhoDragons_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lothar_Dragons ) && ( LordHagen . aivar [ AIV_TalkedToPlayer ] ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lothar_WhoDragons_Info()
{
	AI_Output(other,self, " DIA_Lothar_WhoDragons_15_00 " );	// Has anyone reported on dragons yet?
	AI_Output(self,other, " DIA_Lothar_WhoDragons_01_01 " );	// Yes! A guy named Diego. If I'm not mistaken...


	if ((hero.guild !=  GIL_PAL ) && (hero.guild !=  GIL_KDF ) && (hero.guild !=  GIL_KDW ) && (hero.guild !=  GIL_KDM ))
	{
		AI_Output(self,other, " DIA_Lothar_WhoDragons_01_02 " );	// (threateningly) I warned him - just like you! But this madman never ceased to get on my nerves!
	};
};


instance DIA_Lothar_Rules (C_Info)
{
	npc = PAL_203_Lothar;
	nr = 3;
	condition = DIA_Lothar_Regeln_Condition;
	information = DIA_Lothar_Rules_Info;
	permanent = FALSE;
	description = " Okay - explain the laws of this city to me! " ;
};


func int DIA_Lothar_Regeln_Condition()
{
	return TRUE;
};

func void DIA_Lothar_Rules_Info()
{
	AI_Output(other,self, " DIA_Lothar_Regeln_15_00 " );	// Okay - explain the laws of this city to me!
	AI_Output(self,other, " DIA_Lothar_Regeln_01_01 " );	// First, the venerable paladin Lord Hagen is stationed in the upper quarter, along with his troops.
	AI_Output(self,other, " DIA_Lothar_Regeln_01_02 " );	// This is why access to the upper part of the city is allowed only to respected citizens.
	AI_Output(self,other, " DIA_Lothar_Add_01_04 " );	// Secondly, the city hall in the upper quarter is currently the paladin's command post. Only the paladins themselves and members of the militia have access there.
	AI_Output(self,other, " DIA_Lothar_Add_01_05 " );	// And thirdly, whoever is accused of a crime must be brought before the commander of the militia.
	AI_Output(self,other, " DIA_Lothar_Regeln_01_05 " );	// Any questions?
	Lothar_Rules = TRUE ;
};


instance DIA_Addon_Lothar_MissingPeople(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Addon_Lothar_MissingPeople_Condition;
	information = DIA_Addon_Lothar_MissingPeople_Info;
	description = " Are people disappearing in the city? " ;
};


func int DIA_Addon_Lothar_MissingPeople_Condition()
{
	if (( SC_HeardAboutMissingPeople ==  FALSE ) && Npc_KnowsInfo(other,DIA_Lothar_Hello))
	{
		return TRUE;
	};
};

func void DIA_Addon_Lothar_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Lothar_MissingPeople_15_00 " );	// Are residents disappearing in the city?
	AI_Output(self,other, " DIA_Addon_Lothar_MissingPeople_01_01 " );	// Yes, and more every day.
	AI_Output(self,other, " DIA_Addon_Lothar_MissingPeople_01_02 " );	// Worst of all, the militia still hasn't figured out who's behind these events.
	AI_Output(self,other, " DIA_Addon_Lothar_MissingPeople_01_03 " );	// No wonder the townspeople have begun to distrust strangers.
	AI_Output(self,other, " DIA_Addon_Lothar_MissingPeople_01_04 " );	// So don't provoke them. Do you understand?
	if(SC_HearedAboutMissingPeople == FALSE)
	{
		Log_CreateTopic(TOPIC_Addon_WhoStolePeople,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople,LOG_Running);
		B_LogEntry(TOPIC_Addon_WhoStolePeople,LogText_Addon_SCKnowsMisspeapl);
	};
	SC_HearedAboutMissingPeople = TRUE;
};


instance DIA_Lothar_HowCitizen(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 4;
	condition = DIA_Lothar_HowCitizen_Condition;
	information = DIA_Lothar_HowCitizen_Info;
	permanent = FALSE;
	description = " How can I become a citizen of this city? " ;
};


func int DIA_Lothar_HowCitizen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_Regeln) && (Player_IsApprentice == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_HowCitizen_Info()
{
	AI_Output(other,self, " DIA_Lothar_Add_15_06 " );	// How can I become a citizen of this city?
	AI_Output(self,other, " DIA_Lothar_Add_01_07 " );	// Only those who have a permanent job can be considered a citizen of the city!
	AI_Output(self,other, " DIA_Lothar_Add_01_09 " );	// But don't think you can face Lord Hagen just because you're a citizen!
	AI_Output(self,other, " DIA_Lothar_Add_01_10 " );	// As a citizen, you will have access to the upper part of the city - and no more!
	AI_Output(self,other, " DIA_Lothar_Add_01_11 " );	// Only as a member of the militia will you be able to access the town hall!
};


instance DIA_Lothar_WoArbeit (C_Info)
{
	npc = PAL_203_Lothar;
	nr = 5;
	condition = DIA_Lothar_WoArbeit_Condition;
	information = DIA_Lothar_WoWork_Info;
	permanent = FALSE;
	description = " Where can I find a job? " ;
};


func int DIA_Lothar_WoArbeit_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Lothar_HowCitizen) && (Player_IsApprentice == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void DIA_Lothar_WoArbeit_Info()
{
	AI_Output(other,self, " DIA_Lothar_Add_15_14 " );	// Where can I find a job?
	AI_Output(self,other, " DIA_Lothar_Add_01_15 " );	// You will have to become an apprentice to one of the masters in the lower part of the city.
	AI_Output(self,other, " DIA_Lothar_Add_01_16 " );	// As soon as the master recruits you, you will become a citizen of this city.
	AI_Output(self,other, " DIA_Lothar_Add_01_17 " );	// However, other masters must agree with this, such are the customs of Khorinis.
	AI_Output(self,other, " DIA_Lothar_Add_01_18 " );	// If you were thinking of getting a job in the waterfront, forget about it!
	AI_Output(self,other, " DIA_Lothar_Add_01_19 " );	// The dregs of society live there. Don't even stick your nose in there, you'll regret it!
};


instance DIA_Lothar_ToOV (C_Info)
{
	npc = PAL_203_Lothar;
	nr = 6;
	condition = DIA_Lothar_ToOV_Condition;
	information = DIA_Lothar_ToOV_Info;
	permanent = FALSE;
	description = " How do I get to the upper quarter? " ;
};


func int DIA_Lothar_ToOV_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Lothar_Rule) && (Mil_305_schonmalreaction ==  FALSE ) && (Player_IsApprentice ==  APP_NONE ) && (other.guild ==  GIL_NONE )) ;
	{
		return TRUE;
	};
};

func void DIA_Lothar_ToOV_Info()
{
	AI_Output(other,self, " DIA_Lothar_ToOV_15_00 " );	// How do I get to the top quarter?
	AI_Output(self,other, " DIA_Lothar_ToOV_01_01 " );	// Tell me, are you even listening to me?!
	AI_Output(self,other, " DIA_Lothar_ToOV_01_02 " );	// You are not a citizen of this city. You don't even have to try - the guards won't let you in anyway.
	AI_Output(self,other, " DIA_Lothar_ToOV_01_03 " );	// Everything beyond the inner gate is a no-go area for you!
};


instance DIA_Lothar_ToMiliz(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 7;
	condition = DIA_Lothar_ToMiliz_Condition;
	information = DIA_Lothar_ToMiliz_Info;
	permanent = FALSE;
	description = " How can I join the militia? " ;
};


func int DIA_Lothar_ToMiliz_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Lothar_Rule ) & & ( other . guild == GIL_NONE  ) )
	{
		return TRUE;
	};
};

func void DIA_Lothar_ToMiliz_Info()
{
	AI_Output(other,self, " DIA_Lothar_Add_15_26 " );	// How can I join the militia?
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other, " DIA_Lothar_Add_01_27 " );	// By direct order of Lord Hagen, only citizens of the city are allowed to serve in the militia.
		AI_Output(other,self,"DIA_Lothar_Add_15_28");	//Понимаю.
	};
	AI_Output(self,other, " DIA_Lothar_Add_01_29 " );	// If you want to know more, talk to Lord Andre at the barracks.
};


instance DIA_Lothar_ToPaladins(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 7;
	condition = DIA_Lothar_ToPaladins_Condition;
	information = DIA_Lothar_ToPaladins_Info;
	permanent = FALSE;
	description = " What do I need to do to get armor like yours? " ;
};


func int DIA_Lothar_ToPaladins_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Lothar_ToMiliz) && (other.guild !=  GIL_PAL ) && (other.guild !=  GIL_KDF ) && (hero.guild !=  GIL_KDW ) && (hero.guild != GIL_KDM ) && ( hero.guild != GIL_KDM ) && (hero.guild != GIL_KDM ) && (hero.guild != GIL_KDW ) && (hero.guild != GIL_KDW ) && (hero.guild ! =  GIL_KDW ) = GIL_SEC ) && ( hero . guild != GIL_TPL ) && ( hero . guild != GIL_GUR ))   
	{
		return TRUE;
	};
};

func void DIA_Lothar_ToPaladins_Info()
{
	AI_Output(other,self, " DIA_Lothar_Add_15_30 " );	// What do I need to do to get armor like yours?
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other, " DIA_Lothar_Add_01_31 " );	// What? You're not even a member of the militia!
	};
	if(Player_IsApprentice == APP_NONE)
	{
		AI_Output(self,other, " DIA_Lothar_Add_01_32 " );	// You're not even a CITIZEN!
	};

	AI_Output(self,other, " DIA_Lothar_Add_01_33 " );	// How dare you even think about wearing PALADIN armor?
	AI_Output(self,other, " DIA_Lothar_Add_01_34 " );	// Only a handful of militia soldiers who successfully completed missions of extraordinary importance were bestowed with such an honor.
	AI_Output(self,other, " DIA_Lothar_Add_01_35 " );	// If you want to become a paladin, you have a very long and thorny path ahead of you, my boy!
};


instance DIA_Lothar_WoAndre(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 8;
	condition = DIA_Lothar_WoAndre_Condition;
	information = DIA_Lothar_WoAndre_Info;
	permanent = FALSE;
	description = " Where can I find the city guard commander? " ;
};


func int DIA_Lothar_WoAndre_Condition()
{
	if ((Npc_KnowsInfo(other,DIA_Lothar_Rule) || Npc_KnowsInfo(other,DIA_Lothar_MESSAGE)) && (Other.aivar[AIV_TalkedToPlayer] ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Lothar_WoAndre_Info()
{
	AI_Output(other,self, " DIA_Lothar_WoAndre_15_00 " );	// Where can I find the commander of the city guard?
	AI_Output(self,other, " DIA_Lothar_WoAndre_01_01 " );	// Lord Andre can be found in the barracks at the opposite end of town.
};


instance DIA_Lothar_Schlafen (C_Info)
{
	npc = PAL_203_Lothar;
	nr = 9;
	condition = DIA_Lothar_Schlafen_Condition;
	information = DIA_Lothar_Schlafen_Info;
	permanent = FALSE;
	description = " Where can I spend the night? " ;
};


func int DIA_Lothar_Schlafen_Condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void DIA_Lothar_Schlafen_Info()
{
	AI_Output(other,self, " DIA_Lothar_Add_15_22 " );	// Where can I spend the night?
	AI_Output(self,other, " DIA_Lothar_Add_01_23 " );	// If you're looking for a place to sleep, go to the hotel in front of the barracks.
	AI_Output(self,other, " DIA_Lothar_Add_01_24 " );	// Paladins pay for the lodging of all travelers who enter this city.
	AI_Output(self,other, " DIA_Lothar_Add_01_25 " );	// Traveling merchants from the market place also spend the night there.
};


instance DIA_Lothar_PermB4OV(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 3;
	condition = DIA_Lothar_PermB4OV_Condition;
	information = DIA_Lothar_PermB4OV_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Lothar_PermB4OV_Condition()
{
	if (Npc_IsInState(self,ZS_Talk) && (Mil_305_schonmalreinLET ==  FALSE ) && (Lothar_Rules ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Lothar_PermB4OV_Info()
{
	AI_Output(self,other, " DIA_Lothar_PermB4OV_01_00 " );	// For everything else, you can talk to Lord Andre!
	AI_StopProcessInfos(self);
};

func void B_Lothar_Blubb()
{
	AI_Output(other,self, " DIA_Lothar_Add_15_00 " );	// But I MUST see Lord Hagen!
	AI_Output(self,other, " DIA_Lothar_Add_01_45 " );	// As I understand it, he accepted you into the ranks of the militia.
	AI_Output(self,other, " DIA_Lothar_Add_01_46 " );	// Hmm... I hope he knows what he's doing.
	AI_Output(other,self, " DIA_Lothar_Add_15_20 " );	// How many craftsmen work in the city?
	AI_Output(self,other, " DIA_Lothar_Add_01_21 " );	// As far as I know, there are five in total.
	AI_Output(self,other, " DIA_Lothar_Add_01_62 " );	// Tell me, didn't I speak clearly enough? Enough talk about dragons!
	AI_Output(other,self, " DIA_Lothar_Add_15_63 " );	// How do you know?..
	AI_Output(self,other, " DIA_Lothar_Add_01_64 " );	// It's NOT YOUR business!
	AI_Output(self,other, " DIA_Lothar_Add_01_65 " );	// That was the last time, okay?!
	AI_Output(other,self, " DIA_Lothar_Add_15_66 " );	// Where can I find the militia commander?
	AI_Output(other,self, " DIA_Lothar_Add_15_08 " );	// Now I'm a student of one of the masters!
	AI_Output(self,other,"DIA_Lothar_Add_01_47");	//Опять ты.
	AI_Output(self,other, " DIA_Lothar_Add_01_43 " );	// I heard you spoke to Lord Andre?
	AI_Output(self,other, " DIA_Lothar_Add_01_44 " );	// I told you that you can only join the militia if you become a citizen of the city.
	AI_Output(self,other, " DIA_Lothar_Add_01_48 " );	// I reported to Lord Hagen that you wish to speak to him...
	AI_Output(other,self, " DIA_Lothar_Add_15_49 " );	// And? What did he say?
	AI_Output(self,other, " DIA_Lothar_Add_01_50 " );	// He's never heard of you.
	AI_Output(other,self, " DIA_Lothar_Add_15_51 " );	// Of course not. Did you tell him about dragons?
	AI_Output(self,other, " DIA_Lothar_Add_01_52 " );	// Didn't I tell you to stop spouting this nonsense?!
	AI_Output(self,other, " DIA_Lothar_Add_01_12 " );	// I heard you already got the approval of some masters.
	AI_Output(self,other, " DIA_Lothar_Add_01_13 " );	// Sounds like you're determined to get your way, huh?
	AI_Output(self,other, " DIA_Lothar_Add_01_01 " );	// You must obey the laws like everyone else!
	AI_Output(self,other, " DIA_Lothar_Add_01_02 " );	// Lord Hagen doesn't accept.
	AI_Output(self,other, " DIA_Lothar_Add_01_03 " );	// If you really have something IMPORTANT, go to Lord Andre. He will help you!
};


instance DIA_Lothar_HelloAgain(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 1;
	condition = DIA_Lothar_HelloAgain_Condition;
	information = DIA_Lothar_HelloAgain_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Lothar_HelloAgain_Condition()
{
	if (Mil_305_schonmalreinlett ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Lothar_HelloAgain_Info()
{
	AI_Output(self,other, " DIA_Lothar_HelloAgain_01_00 " );	// Ah! You again!
	AI_Output(self,other, " DIA_Lothar_HelloAgain_01_01 " );	// So you still managed to gain access to the upper quarter!
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Lothar_Add_01_36 " );	// Where did you get this robe?
		AI_Output(other,self, " DIA_Lothar_Add_15_37 " );	// I passed the test of fire.
		AI_Output(self,other, " DIA_Lothar_Add_01_38 " );	// Incredible! Then what is happening here may be the will of Innos...
	};
	if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Lothar_Add_01_3A " );	// Where did you get this robe?
		AI_Output(other,self, " DIA_Lothar_Add_15_3B " );	// Now I'm a Waterbender, as you already noticed.
		AI_Output(self,other, " DIA_Lothar_Add_01_3C " );	// Unfathomable! But this is perhaps the will of Adanos...
	};
	if(other.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Lothar_Add_01_3D " );	// Where did you get this robe?
		AI_Output(other,self, " DIA_Lothar_Add_15_3E " );	// I'm a necromancer now, as you've already noticed.
		AI_Output(self,other,"DIA_Lothar_Add_01_3F");	//Непостижимо!
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Lothar_Add_01_3J " );	// Where did you get this robe?
		AI_Output(other,self, " DIA_Lothar_Add_15_3H " );	// I joined the Brotherhood of Cultists.
		AI_Output(self,other, " DIA_Lothar_Add_01_3I " );	// And, to these crazy swamps? Well, what can we expect from you, though?
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other, " DIA_Lothar_Add_01_39 " );	// You didn't join Onar's mercenaries, did you?
		AI_Output(self,other, " DIA_Lothar_Add_01_40 " );	// How did you get here?
		AI_Output(other,self, " DIA_Lothar_Add_15_41 " );	// I brought Lee's offer of peace...
		AI_Output(self,other, " DIA_Lothar_Add_01_42 " );	// Ha! Lord Hagen will never agree to this.
	};
	AI_Output(self,other, " DIA_Lothar_HelloAgain_01_02 " );	// There are things you should always keep in mind. Otherwise, you will be thrown out of here as quickly as you got here.
	AI_Output(self,other, " DIA_Lothar_HelloAgain_01_03 " );	// You can only enter merchants' houses. You recognize them by the signs above the doors - it's hard to make a mistake here.
	AI_Output(self,other, " DIA_Lothar_HelloAgain_01_04 " );	// Other buildings here belong to noble citizens - there is absolutely nothing for you to do there!
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other, " DIA_Lothar_HelloAgain_01_05 " );	// Even if you belong to the Order of Innos.
	};
	if((other.guild == GIL_KDW) || (other.guild == GIL_KDM))
	{
		AI_Output(self,other, " DIA_Lothar_HelloAgain_01_0A " );	// Even if you're a mage!
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_Lothar_HelloAgain_01_06 " );	// As a member of the militia, you also get access to the paladins' quarters.
		AI_Output(self,other, " DIA_Lothar_HelloAgain_01_07 " );	// But your place is still in the barracks.
	};
	AI_Output(self,other, " DIA_Lothar_HelloAgain_01_08 " );	// Noble citizens live in this quarter. So treat them with respect.
	AI_Output(self,other, " DIA_Lothar_HelloAgain_01_09 " );	// Did we understand each other?
	AI_Output(other,self,"DIA_Lothar_HelloAgain_15_10");	//Конечно.
};


instance DIA_Lothar_Hagen (C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_Hagen_Condition;
	information = DIA_Lothar_Hagen_Info;
	permanent = TRUE;
	description = " Where can I find Lord Hagen? " ;
};


func int DIA_Lothar_Hagen_Condition()
{
	if ((Mil_305_schonmalreinlett ==  TRUE ) && (LordHagen.aivar[AIV_TalkedToPlayer] ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lothar_Hagen_Info()
{
	AI_Output(other, self, " DIA_Lothar_Hagen_15_00 " );	// Where can I find Lord Hagen?
	AI_Output(self,other, " DIA_Lothar_Hagen_01_01 " );	// He's at the town hall, at the end of the upper block.
	AI_Output(self,other, " DIA_Lothar_Hagen_01_02 " );	// But you won't be accepted there without a good reason.
};


instance DIA_Lothar_OWRunning ( C_Info ) ;
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_OWRunning_Condition;
	information = DIA_Lothar_OWRunning_Info;
	permanent = FALSE;
	description = " I came to see Lord Hagen... " ;
};


func int DIA_Lothar_OWRunning_Condition()
{
	if((MIS_OLDWORLD == LOG_Running) && (Npc_HasItems(hero,ItWr_PaladinLetter_MIS) == 0))
	{
		return TRUE;
	};
};

func void DIA_Lothar_OWRunning_Info()
{
	AI_Output(other,self, " DIA_Lothar_Add_15_53 " );	// I came to see Lord Hagen...
	AI_Output(self,other, " DIA_Lothar_Add_01_54 " );	// And? You didn't pester him with your dragon stories, did you?
	AI_Output(other,self, " DIA_Lothar_Add_15_55 " );	// Yes, I told him...
	AI_Output(self,other, " DIA_Lothar_Add_01_56 " );	// Tell me it's not true...
	AI_Output(other,self, " DIA_Lothar_Add_15_57 " );	// He sent me to get proof...
	AI_Output(self,other, " DIA_Lothar_Add_01_58 " );	// Well then, good luck. (under his breath) What a madman...
	AI_StopProcessInfos(self);
};


instance DIA_Lothar_OWRunningBrief(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 2;
	condition = DIA_Lothar_OWRunningBrief_Condition;
	information = DIA_Lothar_OWRunningBrief_Info;
	permanent = FALSE;
	description = " I have proof! Here's a letter from Commander Garond! " ;
};


func int DIA_Lothar_OWRunningBrief_Condition()
{
	if((MIS_OLDWORLD == LOG_Running) && (Npc_HasItems(hero,ItWr_PaladinLetter_MIS) > 0))
	{
		return TRUE;
	};
};

func void DIA_Lothar_OWRunningBrief_Info()
{
	AI_Output(other,self, " DIA_Lothar_Add_15_59 " );	// I have proof! Here's a letter from Commander Garond!
	AI_Output(self,other, " DIA_Lothar_Add_01_60 " );	// So dragons really exist?
	AI_Output(self,other, " DIA_Lothar_Add_01_61 " );	// I've been unfair to you. I will beg Innos for forgiveness for my behavior.
	AI_StopProcessInfos(self);
};


instance DIA_Lothar_PERM(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 3;
	condition = DIA_Lothar_PERM_Condition;
	information = DIA_Lothar_PERM_Info;
	permanent = TRUE;
	description = " Has anything interesting happened lately? " ;
};


func int DIA_Lothar_PERM_Condition()
{
	if ((Mil_305_schonmalreinlett ==  TRUE ) && (LordHagen.aivar[AIV_TalkedToPlayer] ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Lothar_PERM_Info()
{
	AI_Output(other,self, " DIA_Lothar_PERM_15_00 " );	// Has anything interesting happened lately?
	if((other.guild == GIL_NONE) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other, " DIA_Lothar_PERM_01_01 " );	// Yes, ragamuffins like you have been allowed in here. This hasn't happened in centuries!
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_Lothar_PERM_01_02 " );	// You should kill yourself on the nose. As a member of the city guard, it is your duty to maintain law and order in the city!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_03");	//Нет.
	};
};


instance DIA_Lothar_PICKPOCKET(C_Info)
{
	npc = PAL_203_Lothar;
	nr = 900;
	condition = DIA_Lothar_PICKPOCKET_Condition;
	information = DIA_Lothar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Lothar_PICKPOCKET_Condition()
{
	return  C_Robbery ( 56 , 95 );
};

func void DIA_Lothar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Lothar_PICKPOCKET);
	Info_AddChoice(DIA_Lothar_PICKPOCKET,Dialog_Back,DIA_Lothar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Lothar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Lothar_PICKPOCKET_DoIt);
};

func void DIA_Lothar_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Lothar_PICKPOCKET);
};

func void DIA_Lothar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Lothar_PICKPOCKET);
};

