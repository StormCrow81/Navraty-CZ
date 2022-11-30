
instance DIA_Maleth_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_EXIT_Condition;
	information = DIA_Maleth_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Maleth_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Maleth_Hello (C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_Hallo_Condition;
	information = DIA_Maleth_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Maleth_Hallo_Condition()
{
	if((Kapitel < 3) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Maleth_Hallo_Info()
{
	AI_Output(self,other, " DIA_Maleth_Hallo_08_00 " );	// Hello, outlander!

	if(hero.guild == GIL_NONE)
	{
		if(Npc_GetDistToWP(self,"NW_FARM1_PATH_CITY_SHEEP_09") < 500)
		{
			AI_Output(self,other, " DIA_Maleth_Hallo_08_01 " );	// I saw you come down from the mountains.
		};
		AI_Output(self,other, " DIA_Maleth_Hallo_08_02 " );	// You're lucky you didn't show up three weeks ago.
		AI_Output(self,other, " DIA_Maleth_Hallo_08_03 " );	// We'd take you for a runaway convict. And we have a short conversation with them!
		if(Npc_HasEquippedArmor(other) == FALSE)
		{
			AI_Output(self,other, " DIA_Maleth_Hallo_08_04 " );	// You look absolutely exhausted.
		}
		else
		{
			AI_Output(self,other, " DIA_Maleth_Hallo_08_05 " );	// You looked absolutely exhausted when you first showed up here.
			AI_Output(self,other, " DIA_Maleth_Hallo_08_06 " );	// Well, now you look like a man!
		};
	};
	AI_Output(self,other, " DIA_Maleth_Hallo_08_07 " );	// What do you need here?
};


instance DIA_Maleth_BANDITS(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_BANDITS_Condition;
	information = DIA_Maleth_BANDITS_Info;
	permanent = FALSE;
	description = " I was attacked by bandits in the mountains. " ;
};

func int DIA_Maleth_BANDITS_Condition()
{
	if ((Chapter <  3 ) && (hero.guild ==  GIL_NONE ))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BANDITS_Info()
{
	AI_Output(other,self, " DIA_Maleth_BANDITS_15_00 " );	// I was attacked by bandits in the mountains.
	AI_Output(self,other, " DIA_Maleth_BANDITS_08_01 " );	// That vile brat! It's probably the same bastards that stole our sheep last night!
	AI_Output(self,other, " DIA_Maleth_BANDITS_08_02 " );	// You're still very lucky. Few people manage to get away from them alive.
};


instance DIA_Maleth_BanditsDEAD(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_BanditsDEAD_Condition;
	information = DIA_Maleth_BanditsDEAD_Info;
	permanent = FALSE;
	description = " These bandits won't bother you anymore... " ;
};


func int DIA_Maleth_BanditsDEAD_Condition()
{
	if((Npc_IsDead(Ambusher_1013) || (Bdt_1013_Away == TRUE)) && Npc_IsDead(Ambusher_1014) && Npc_IsDead(Ambusher_1015) && Npc_KnowsInfo(other,DIA_Maleth_BANDITS))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsDEAD_Info()
{
	AI_Output(other,self, " DIA_Maleth_BanditsDEAD_15_00 " );	// These bandits won't bother you anymore...
	AI_Output(self,other, " DIA_Maleth_BanditsDEAD_08_01 " );	// Why? Are they dead?
	AI_Output(other,self, " DIA_Maleth_BanditsDEAD_15_02 " );	// They didn't attack that...
	AI_Output(self,other, " DIA_Maleth_BanditsDEAD_08_03 " );	// Glory to Innos! It's a little here, but I want you to take it!
	B_GiveInvItems(self,other,ItFo_Wine,3);
	MIS_Maleth_Bandits = LOG_SUCCESS;
	B_GivePlayerXP(XP_MalethKillBandits);
	AI_Output(self,other, " DIA_Maleth_BanditsDEAD_08_04 " );	// I'll tell the others about it!
};


instance DIA_Maleth_BanditsALIVE(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 1;
	condition = DIA_Maleth_BanditsALIVE_Condition;
	information = DIA_Maleth_BanditsALIVE_Info;
	permanent = FALSE;
	description = " I know where those bandits are hiding... " ;
};

func int DIA_Maleth_BanditsALIVE_Condition()
{
	var C_Npc b13;
	var C_Npc b14;
	var C_Npc b15;

	b13 = Hlp_GetNpc(Bdt_1013_Bandit_L);
	b14 = Hlp_GetNpc(Bdt_1014_Bandit_L);
	b15 = Hlp_GetNpc(Bdt_1015_Bandit_L);

	if ( ! (Npc_IsDead(b13) ||  ! Npc_IsDead(b14) ||  ! Npc_IsDead(b15)) && Npc_KnowsInfo(other,DIA_Maleth_BANDITS) && (MIS_Maleth_Bandits !=  LOG_SUCCESS ))
	{
		return TRUE;
	};
};

func void DIA_Maleth_BanditsALIVE_Info()
{
	AI_Output(other,self, " DIA_Maleth_BanditsALIVE_15_00 " );	// I know where these bandits are hiding...
	AI_Output(self,other, " DIA_Maleth_BanditsALIVE_08_01 " );	// Do you want to attack them? I don't play these games! It's too dangerous!
	AI_Output(self,other, " DIA_Maleth_BanditsALIVE_08_02 " );	// Besides, I have to look after the sheep!
	AI_Output(self,other, " DIA_Maleth_BanditsALIVE_08_03 " );	// But if you think you can rid us of these scum, everyone on this farm will be very grateful to you.
	MIS_Maleth_Bandits = LOG_Running;
	Log_CreateTopic(TOPIC_Maleth,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Maleth,LOG_Running);
	B_LogEntry(TOPIC_Maleth, " If I destroy the bandits that settled halfway from Xardas' tower to Lobart's farm, all the inhabitants of the farm will be very grateful to me. " );
};


instance DIA_Maleth_ToTheCity(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 2;
	condition = DIA_Maleth_ToTheCity_Condition;
	information = DIA_Maleth_ToTheCity_Info;
	permanent = FALSE;
	description = " I'm going to town. " ;
};

func int DIA_Maleth_ToTheCity_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Maleth_Hallo ) && ( Chapter <  3 ) && ( hero . guild ==  GIL_NONE )) .
	{
		return TRUE;
	};
};

func void DIA_Maleth_ToTheCity_Info()
{
	AI_Output(other,self, " DIA_Maleth_ToTheCity_15_00 " );	// I'm going to the city.
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other, " DIA_Maleth_ToTheCity_08_01 " );	// Given the way you look, you'll have to bribe the guards to get into the city.
		AI_Output(self,other, " DIA_Maleth_ToTheCity_08_02 " );	// And you should know what they want to hear.
	}
	else
	{
		AI_Output(self,other, " DIA_Maleth_ToTheCity_08_03 " );	// They can let you in - if you tell them what they want to hear...
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_04");	//И что это?
	AI_Output(self,other, " DIA_Maleth_ToTheCity_08_05 " );	// Well, for example, that you are from Lobart's farm and go to the city blacksmith.
	Log_CreateTopic(TOPIC_City,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_City,LOG_Running);
	B_LogEntry(TOPIC_City, " To get into the city, I can tell the guards at the gate that I'm coming from Lobart's farm and want to see the blacksmith. " );
	if(Npc_HasEquippedArmor(other) == FALSE)
	{
		AI_Output(self,other, " DIA_Maleth_ToTheCity_08_06 " );	// But that won't help you. You don't look like a farmer.
		B_LogEntry(TOPIC_City, " Of course I must look like a farmer. " );
	};
	AI_Output(other,self,"DIA_Maleth_ToTheCity_15_07");	//Понятно.
};


instance DIA_Maleth_Equipment(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 3;
	condition = DIA_Maleth_Equipment_Condition;
	information = DIA_Maleth_Equipment_Info;
	permanent = FALSE;
	description = " I need gear! " ;
};


func int DIA_Maleth_Equipment_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Maleth_Hallo ) && ( Chapter <  3 ) && ( hero . guild ==  GIL_NONE )) .
	{
		return TRUE;
	};
};

func void DIA_Maleth_Equipment_Info()
{
	AI_Output(other,self, " DIA_Maleth_Equipment_15_00 " );	// I need gear!
	AI_Output(self,other, " DIA_Maleth_Equipment_08_01 " );	// I can imagine. But I'll be honest with you: we don't have anything to share!
	if ( ! Npc_IsDead(Lobart))
	{
		AI_Output(self,other, " DIA_Maleth_Equipment_08_02 " );	// Although, if you can pay, Lobart will sell you something.
		AI_Output(self,other, " DIA_Maleth_Equipment_08_03 " );	// Well, or you can go to him and ask if he has any work.
	};
};


instance DIA_Maleth_LOBART(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 3;
	condition = DIA_Maleth_LOBART_Condition;
	information = DIA_Maleth_LOBART_Info;
	permanent = FALSE;
	description = " Where can I find Lobart? " ;
};


func int DIA_Maleth_LOBART_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Maleth_Equipment ) &&  ! Npc_IsDead ( Lobart ) & & ( hero . guild == GIL_NONE  ) )
	{
		return TRUE;
	};
};

func void DIA_Maleth_LOBART_Info()
{
	AI_Output(other,self, " DIA_Maleth_LOBART_15_00 " );	// Where can I find Lobart?
	AI_Output(self,other, " DIA_Maleth_LOBART_08_01 " );	// On the farm, of course! It's his farm!
	AI_Output(self,other, " DIA_Maleth_LOBART_08_02 " );	// And don't try to trick him! He has already beaten and thrown out of the farm many loafers.
};


instance DIA_Maleth_KAP3_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_KAP3_EXIT_Condition;
	information = DIA_Maleth_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Maleth_PROBLEME(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 30;
	condition = DIA_Maleth_PROBLEME_Condition;
	information = DIA_Maleth_PROBLEME_Info;
	description = " Nothing new lately? " ;
};


func int DIA_Maleth_PROBLEME_Condition()
{
	if (Chapter >=  3 )
	{
		return TRUE;
	};
};

func void DIA_Maleth_PROBLEME_Info()
{
	AI_Output(other,self, " DIA_Maleth_PROBLEME_15_00 " );	// Nothing new lately?
	AI_Output(self,other, " DIA_Maleth_PROBLEME_08_01 " );	// Just follow the road to town.
	AI_Output(self,other, " DIA_Maleth_PROBLEME_08_02 " );	// If you see a man in a black cassock, you will understand what's new.
	Info_ClearChoices(DIA_Maleth_PROBLEME);
	Info_AddChoice(DIA_Maleth_PROBLEME,Dialog_Back,DIA_Maleth_PROBLEME_Back);
	Info_AddChoice(DIA_Maleth_PROBLEME, " How are your sheep? " ,DIA_Maleth_PROBLEME_schafe);
	Info_AddChoice(DIA_Maleth_PROBLEME, " Have the people in black cassocks visited you yet? " ,DIA_Maleth_PROBLEME_beidir);
};

func void DIA_Maleth_PROBLEME_beidir()
{
	AI_Output(other,self, " DIA_Maleth_PROBLEME_beidir_15_00 " );	// People in black cassocks haven't visited you yet?
	AI_Output(self,other, " DIA_Maleth_PROBLEME_beidir_08_01 " );	// Yes. They were here a few days ago. They look like they've risen from hell.
};

func void DIA_Maleth_PROBLEMS_sheep()
{
	AI_Output(other,self, " DIA_Maleth_PROBLEME_schafe_15_00 " );	// How are your sheep?
	AI_Output(self,other, " DIA_Maleth_PROBLEME_schafe_08_01 " );	// (angrily) As if you're interested. You have your own problems.
	Info_AddChoice(DIA_Maleth_PROBLEME, " My problems? What do you know about this? " ,DIA_Maleth_PROBLEME_schafe_probleme);
};

func void DIA_Maleth_PROBLEMS_sheep_problems()
{
	AI_Output(other,self, " DIA_Maleth_PROBLEME_schafe_probleme_15_00 " );	// My problems? What do you know about it?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other, " DIA_Maleth_PROBLEME_schafe_probleme_08_01 " );	// (sharply) Are you in the city guard or not? Then do something about those black-robed bastards.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Maleth_PROBLEME_schafe_probleme_08_02 " );	// (angrily) You dirty mercenaries only think about one thing: how to put other people's money in your pockets.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Maleth_PROBLEME_schafe_probleme_08_03 " );	// You powerful mages from the monastery should do something about these guys in black cassocks.
	};
	if(hero.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_Maleth_PROBLEME_schafe_probleme_08_04 " );	// Your noble Waterbenders should do something against these guys in black cassocks.
	};
	if(hero.guild == GIL_KDM)
	{
		AI_Output(self,other, " DIA_Maleth_PROBLEME_schafe_probleme_08_05 " );	// Since when did dark magicians become compassionate?
	};
	if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
	{
		AI_Output(self,other, " DIA_Maleth_PROBLEME_schafe_probleme_08_06 " );	// All you cultists know how to do is smoke your weed all day long. Better to do something useful...
	};
	Info_ClearChoices(DIA_Maleth_PROBLEME);
	Info_AddChoice(DIA_Maleth_PROBLEME,Dialog_Back,DIA_Maleth_PROBLEME_Back);
	Info_AddChoice(DIA_Maleth_PROBLEME, " Hey, take it easy on the turns, mate. " ,DIA_Maleth_PROBLEME_schafe_probleme_drohen);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(DIA_Maleth_PROBLEME, " What's your problem? " ,DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag);
	};
};

func void DIA_Maleth_PROBLEME_sheep_problems_money_here_order()
{
	AI_Output(other,self, " DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_00 " );	// What are your problems?
	AI_Output(self,other, " DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_01 " );	// It's all because of this homemade brew that Vino foisted on me a few weeks ago.
	AI_Output(self,other, " DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_02 " );	// I don't remember anything. I only know that my staff has since disappeared.
	AI_Output(other,self, " DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_15_03 " );	// Is that why you're making such a fuss?
	AI_Output(self,other, " DIA_Maleth_PROBLEME_schafe_probleme_geldher_auftrag_08_04 " );	// Easy for you to say, it's not your staff that's gone.
	Log_CreateTopic(TOPIC_MalethsGehstock,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MalethsGehstock,LOG_Running);
	B_LogEntry(TOPIC_MalethsGehstock, " Maleth got drunk and lost his staff. As far as I know him, he never strayed far from Lobart's farm. Maybe I'll find her somewhere nearby. " );
	Info_ClearChoices(DIA_Maleth_PROBLEME);
};

func void DIA_Maleth_PROBLEMS_sheep_problems_threatening()
{
	AI_Output(other,self, " DIA_Maleth_PROBLEME_schafe_probleme_drohen_15_00 " );	// Hey, take it easy on the turns, mate.
	AI_Output(self,other, " DIA_Maleth_PROBLEME_schafe_probleme_drohen_08_01 " );	// All you can do is talk. It's best for you to leave.
};

func void DIA_Maleth_PROBLEME_Back()
{
	Info_ClearChoices(DIA_Maleth_PROBLEME);
};


instance DIA_Maleth_WALKING STOCK (C_Info)
{
	npc = BAU_954_Maleth;
	nr = 33;
	condition = DIA_Maleth_WALK STOCK_Condition;
	information = DIA_Maleth_WALKING STOCK_Info;
	description = " I think this is your staff. " ;
};


func int DIA_Maleth_WALKING STOCK_Condition()
{
	if(Npc_HasItems(other,ItMw_MalethsGehstock_MIS) && Npc_KnowsInfo(other,DIA_Maleth_PROBLEME))
	{
		return TRUE;
	};
};

func void DIA_Maleth_WALKING STOCK_Info()
{
	AI_Output(other,self, " DIA_Maleth_GEHSTOCK_15_00 " );	// I think it's your staff.
	AI_Output(self,other, " DIA_Maleth_GEHSTOCK_08_01 " );	// This is incredible! I...
	AI_Output(other,self, " DIA_Maleth_GEHSTOCK_15_02 " );	// Wait a minute. Pay for it first.
	AI_Output(self,other, " DIA_Maleth_GEHSTOCK_08_03 " );	// But... I have almost nothing.
	AI_Output(other,self, " DIA_Maleth_GEHSTOCK_15_04 " );	// Then come up with something else.
	AI_Output(self,other, " DIA_Maleth_GEHSTOCK_08_05 " );	// Good. How about this? Yesterday I saw bandits run past with several sacks of gold.
	AI_Output(self,other, " DIA_Maleth_GEHSTOCK_08_06 " );	// If I tell you where they hide their treasures, will I get my staff back?
	TOPIC_END_MalethsGehstock = TRUE;
	B_GivePlayerXP(XP_FoundMalethsGehstock);
	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
	Info_AddChoice(DIA_Maleth_GEHSTOCK, " Sorry, I'm not interested. I want gold from you. " ,DIA_Maleth_GEHSTOCK_gold);
	Info_AddChoice(DIA_Maleth_WALKING STOCK, " Хорошо. " ,DIA_Maleth_WALKING STOCK_ok);
};

func void DIA_Maleth_WALKING STOCK_ok()
{
	AI_Output(other,self,"DIA_Maleth_GEHSTOCK_ok_15_00");	//Хорошо.
	B_GiveInvItems(other,self,ItMw_MalethsGehstock_MIS,1);
	AI_Output(self,other, " DIA_Maleth_GEHSTOCK_ok_08_01 " );	// Okay. Just go west to that forest over there. There you will see a gorge.
	AI_Output(self,other, " DIA_Maleth_GEHSTOCK_ok_08_02 " );	// You'll probably find something in the cave below.
	B_LogEntry(TOPIC_MalethsGehstock, " Maleth told me that there is a large bandit camp in the woods west of Lobart's farm. " );
	CreateInvItems(BDT_1024_MalethsBandit,ItMi_MalethsBanditGold,1);
	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
	AI_StopProcessInfos(self);
};

func void DIA_Maleth_WALKING STOCK_gold()
{
	AI_Output(other,self, " DIA_Maleth_GEHSTOCK_gold_15_00 " );	// Sorry, I'm not interested. I want to get gold from you.
	AI_Output(self,other, " DIA_Maleth_GEHSTOCK_gold_08_01 " );	// That's all I have. This should be enough.
	CreateInvItems(self,ItMi_Gold,35);
	B_GiveInvItems(self,other,ItMi_Gold,35);
	B_GiveInvItems(other,self,ItMw_MalethsGehstock_MIS,1);
	Info_ClearChoices(DIA_Maleth_GEHSTOCK);
};


instance DIA_Maleth_PERM3(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 33;
	condition = DIA_Maleth_PERM3_Condition;
	information = DIA_Maleth_PERM3_Info;
	permanent = TRUE;
	description = " Look, don't overwork yourself. " ;
};


func int DIA_Maleth_PERM3_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Maleth_ PROBLEM ) && ( Capital >=  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Maleth_PERM3_Info()
{
	AI_Output(other,self, " DIA_Maleth_PERM3_15_00 " );	// Look, don't overwork yourself.
	AI_Output(self,other, " DIA_Maleth_PERM3_08_01 " );	// (angrily) Get out.
	AI_StopProcessInfos(self);
};


instance DIA_Maleth_KAP4_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_KAP4_EXIT_Condition;
	information = DIA_Maleth_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Maleth_KAP5_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_KAP5_EXIT_Condition;
	information = DIA_Maleth_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Maleth_KAP6_EXIT(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 999;
	condition = DIA_Maleth_KAP6_EXIT_Condition;
	information = DIA_Maleth_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Maleth_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Maleth_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Maleth_PICKPOCKET(C_Info)
{
	npc = BAU_954_Maleth;
	nr = 900;
	condition = DIA_Maleth_PICKPOCKET_Condition;
	information = DIA_Maleth_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Maleth_PICKPOCKET_Condition()
{
	return  C_Robbery ( 10 , 10 );
};

func void DIA_Maleth_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Maleth_PICKPOCKET);
	Info_AddChoice(DIA_Maleth_PICKPOCKET,Dialog_Back,DIA_Maleth_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Maleth_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Maleth_PICKPOCKET_DoIt);
};

func void DIA_Maleth_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Maleth_PICKPOCKET);
};

func void DIA_Maleth_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Maleth_PICKPOCKET);
};
