

instance DIA_Grimes_EXIT(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 999;
	condition = DIA_Grimes_EXIT_Condition;
	information = DIA_Grimes_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


var int Grimes_First;

func int DIA_Grimes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Grimes_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Grimes_Hallo(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Hallo_Condition;
	information = DIA_Grimes_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Grimes_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Hallo_Info()
{
	AI_Output(self,other, " DIA_Grimes_Hallo_05_00 " );	// You? Who would have thought that we would meet again!
	AI_Output(self,other, " DIA_Grimes_Hallo_05_01 " );	// Looks like we both know how to survive, but as you can see, I'm stuck in this shaft.
	if(Grimes_First == FALSE)
	{
		Wld_InsertNpc(DragonSnapper,"OW_PATH_148_A");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_146");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_147");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_148");
		Wld_InsertNpc(DragonSnapper,"OW_PATH_264");
		Grimes_First = TRUE;
	};
};


instance DIA_Grimes_Erz(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_Erz_Condition;
	information = DIA_Grimes_Erz_Info;
	permanent = FALSE;
	description = " How much ore did you mine? " ;
};


func int DIA_Grimes_Erz_Condition()
{
	if((Kapitel == 2) && (MIS_ScoutMine == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Ore_Info()
{
	AI_Output(other,self, " DIA_Grimes_Erz_15_00 " );	// How much ore did you mine?
	AI_Output(self,other, " DIA_Grimes_Erz_05_01 " );	// Multiple boxes. But they are no longer here.
	AI_Output(self,other, " DIA_Grimes_Erz_05_02 " );	// Paladin Markos decided to send the ore to the castle, since we were constantly attacked by orcs.
};


instance DIA_Grimes_Weg(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 3;
	condition = DIA_Grimes_Weg_Condition;
	information = DIA_Grimes_Weg_Info;
	permanent = FALSE;
	description = " Do you know which direction Marcos went in? " ;
};


func int DIA_Grimes_Weg_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Grimes_Erz ) && ( Npc_KnowsInfo ( other , DIA_Marcos_Garond ) ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Grimes_Weg_Info()
{
	AI_Output(other,self, " DIA_Grimes_Weg_15_00 " );	// Do you know which direction Marcos went?
	AI_Output(self,other, " DIA_Grimes_Weg_05_01 " );	// He didn't go straight. Instead, he wanted to cross the river where it froze over.
	AI_Output(self,other, " DIA_Grimes_Weg_05_02 " );	// He wanted to go around and approach the castle from the west.
};

instance DIA_Grimes_PERM(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = DIA_Grimes_PERM_Condition;
	information = DIA_Grimes_PERM_Info;
	permanent = TRUE;
	description = " How is your job? " ;
};


func int DIA_Grimes_PERM_Condition()
{
	if (Chapter >=  2 )
	{
		return TRUE;
	};
};

func void DIA_Grimes_PERM_Info()
{
	AI_Output(other,self, " DIA_Grimes_PERM_15_00 " );	// How is your job?
	AI_Output(self,other, " DIA_Grimes_PERM_05_01 " );	// This rock is terribly hard - it doesn't seem to want to give us the ore.
};


instance DIA_Grimes_PICKPOCKET(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 900;
	condition = DIA_Grimes_PICKPOCKET_Condition;
	information = DIA_Grimes_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Grimes_PICKPOCKET_Condition()
{
	return  C_Robbery ( 43 , 21 );
};

func void DIA_Grimes_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
	Info_AddChoice(DIA_Grimes_PICKPOCKET,Dialog_Back,DIA_Grimes_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Grimes_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Grimes_PICKPOCKET_DoIt);
};

func void DIA_Grimes_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
};

func void DIA_Grimes_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Grimes_PICKPOCKET);
};


instance DIA_GRIMES_KNOWABOUTERZHUNT(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = dia_grimes_knowabouterzhunt_condition;
	information = dia_grimes_knowabouterzhunt_info;
	permanent = FALSE;
	description = " Do you know anything about mining? " ;
};


func int dia_grimes_knowabouterzhunt_condition()
{
	return TRUE;
};

func void dia_grimes_knowabouterzhunt_info()
{
	AI_Output(other,self, " DIA_Grimes_KnowAboutErzHunt_01_00 " );	// Do you know anything about mining?
	AI_Output(self,other, " DIA_Grimes_KnowAboutErzHunt_01_01 " );	// For half of my life I've been doing nothing but extracting it.
	AI_Output(other,self, " DIA_Grimes_KnowAboutErzHunt_01_03 " );	// I want to learn how to mine ore. Can you help me?
	AI_Output(self,other, " DIA_Grimes_KnowAboutErzHunt_01_04 " );	// No problem. I will teach you everything I know myself.
	if(ORE_TOPIC_EXIST == TRUE)
	{
		B_LogEntry( TOPIC_MAGICORE , " Grimes can teach me how to extract magic ore from rock. " );
	}
	else
	{
		Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
		B_LogEntry( TOPIC_MAGICORE , " Grimes can teach me how to extract magic ore from rock. " );
		ORE_TOPIC_EXIST = TRUE;
	};
};

instance DIA_GRIMES_LEARNABOUTERZHUNT(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = dia_grimes_learnabouterzhunt_condition;
	information = dia_grimes_learnabouterzhunt_info;
	permanent = TRUE;
	description = " Teach me how to mine. " ;
};

func int dia_grimes_learnabouterzhunt_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_knowabouterzhunt) && (HERO_HACKCHANCEORE < 100))
	{
		return TRUE;
	};
};

func void dia_grimes_learnabouterzhunt_info()
{
	if(KNOWHOWPICKORE == TRUE)
	{
		AI_Output(other,self, " DIA_Grimes_LearnAboutErzHunt_01_0A " );	// Tell me more about mining.
	}
	else
	{
		AI_Output(other,self, " DIA_Grimes_LearnAboutErzHunt_01_00 " );	// Teach me how to mine.
	};

	Info_ClearChoices(dia_grimes_learnabouterzhunt);
	Info_AddChoice(dia_grimes_learnabouterzhunt,Dialog_Back,dia_grimes_learnabouterzhunt_Back);
	Info_AddChoice(dia_grimes_learnabouterzhunt,b_buildlearnstringforerzhunt("Добыча руды",B_GetLearnCostTalent(other,NPC_TALENT_ERZWORK,1)),dia_grimes_learnabouterzhunt_ERZWORK);
};

func void dia_grimes_learnabouterzhunt_Back()
{
	Info_ClearChoices(dia_grimes_learnabouterzhunt);
};

func void dia_grimes_learnabouterzhunt_ERZWORK()
{
	if(HERO_HACKCHANCEORE < 100)
	{
		if(b_teachplayertalenterzhunt(self,other,NPC_TALENT_ERZWORK))
		{
			if(GRIMESTEACHMOREORE == FALSE)
			{
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_01 " );	// Good! Listen carefully...
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_02 " );	// First you need to get a good pickaxe - that's half the battle.
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_03 " );	// Then start processing the ore vein you found.
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_04 " );	// It is necessary to hit not along the edge of the rock, but exactly in the center. Strike one powerful blow, and then several weaker blows.
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_05 " );	// By doing so, you will slightly break the structure of the nugget, and with the next strong blow, some piece of it will definitely break off.
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_06 " );	// And then do it all over again...
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_07 " );	// This is the main thing you need to know about mining.
				GRIMESTEACHMOREORE = TRUE;
			}
			else
			{
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_09 " );	// Okay! Listen carefully ... (tells)
			};
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_10 " );	// I taught you everything I know. Then you gain experience yourself, waving a pickaxe.
	};

	Info_ClearChoices(dia_grimes_learnabouterzhunt);
};

var int grimes_once;
var int grimes_gratulation;

instance DIA_GRIMES_ELIGORPOTION(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = dia_grimes_eligorpotion_condition;
	information = dia_grimes_eligorpotion_info;
	permanent = FALSE;
	description = " What do you know about the robbery of the Luthero merchant? " ;
};

func int dia_grimes_eligorpotion_condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Grimes_Hello ) && ( MY_HELP  == LOG_Running ) && ( ZURISGIVEMETASKINFO  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_grimes_eligorpotion_info()
{
	AI_Output(other,self, " DIA_Grimes_EligorPotion_01_00 " );	// What do you know about the Luthero robbery?
	AI_Output(self,other, " DIA_Grimes_EligorPotion_01_01 " );	// (surprised) Who? What are you talking about?
	AI_Output(other,self, " DIA_Grimes_EligorPotion_01_03 " );	// This happened many years ago.
	AI_Output(other,self, " DIA_Grimes_EligorPotion_01_04 " );	// It was a high-profile case, and you should probably remember something about it.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_01_05 " );	// Hmmm...(thoughtfully) well, I...(remembers)
	AI_Output(self,other, " DIA_Grimes_EligorPotion_01_07 " );	// ...well, yes - I seem to remember something like that. (squinting) But why are you doing this?
	AI_Output(other,self, " DIA_Grimes_EligorPotion_01_08 " );	// There were rumors that you were involved in this heist.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_01_09 " );	// (surprised) Me?
	AI_Output(self,other, " DIA_Grimes_EligorPotion_01_13 " );	// I have no idea who robbed that merchant!
	AI_Output(other,self, " DIA_Grimes_EligorPotion_01_14 " );	// So you don't know anything about this?
	AI_Output(self,other, " DIA_Grimes_EligorPotion_01_15 " );	// (sarcastically) Nothing at all.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_01_16 " );	// And even if I knew something - why on earth should I tell you about it?
	Info_ClearChoices(dia_grimes_eligorpotion);
	Info_AddChoice(dia_grimes_eligorpotion, " If you don't tell me, I'll kill you! " ,dia_grimes_eligorpotion_kill);

	if(RhetorikSkillValue[1] >= 30)
	{
		Info_AddChoice(dia_grimes_eligorpotion, " Do it for an old friend. " ,dia_grimes_eligorpotion_memory);
	};

	Info_AddChoice(dia_grimes_eligorpotion, " I can pay you for this information. " ,dia_grimes_eligorpotion_money);
};

func void dia_grimes_eligorpotion_kill()
{
	CreateInvItems(self,itke_grimkey,1);
	AI_Output(other,self, " DIA_Grimes_EligorPotion_Kill_01_00 " );	// If you don't tell me, I'll kill you!
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Kill_01_01 " );	// Threats won't help here, my boy.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Kill_01_02 " );	// I'm already old, and it's hard to scare me with death.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Kill_01_03 " );	// And if you carefully look around, then it will become clear that we are unlikely to get out of here alive.
	B_LogEntry( TOPIC_JORAHELP , " I asked Grimes about the Luthero robbery case. I thought he knew something about it. Unfortunately, Grimes didn't fill me in on the details, even though I threatened him with violence. Now I need to think what to do next. " );
	AI_StopProcessInfos(self);
};

func void dia_grimes_eligorpotion_money()
{
	CreateInvItems(self,itke_grimkey,1);
	AI_Output(other,self, " DIA_Grimes_EligorPotion_Money_01_00 " );	// I can pay you for this information.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Money_01_01 " );	// E-he-he! And what can I spend your money on here?
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Money_01_02 " );	// To a new pickaxe?
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Money_01_04 " );	// No, man. Money here is absolutely stupid thing.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Money_01_05 " );	// Yes, and why do I need them? (sadly) I am already old, and I know that here, in this damned valley, my life will end.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Money_01_06 " );	// There's no getting out of here - only hordes of orcs and terrible creatures are around, ready to devour us all!
	B_LogEntry( TOPIC_JORAHELP , " I asked Grimes about the case involving the Luthero robbery. I thought he knew something about it. But, unfortunately, Grimes did not fill me in on the details, even though I offered him gold for this information. Now I need to think about what to do next. " );
	AI_StopProcessInfos(self);
};

func void dia_grimes_eligorpotion_memory()
{
	B_GivePlayerXP(500);
	CreateInvItems(self,itke_grimkey,1);
	AI_Output(other,self, " DIA_Grimes_EligorPotion_Memory_01_00 " );	// Do it as an old friend.
	AI_Output(other,self, " DIA_Grimes_EligorPotion_Memory_01_01 " );	// We've been in the same boat with you for a long time, Grimes! Do you remember the Old Mine?
	AI_Output(other,self, " DIA_Grimes_EligorPotion_Memory_01_02 " );   // And what about life in the Old Camp?
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_04 " );	// Eh... Well, what do you want?
	AI_Output(other,self, " DIA_Grimes_EligorPotion_Memory_01_08 " );	// Tell me, how do you know about this robbery?
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_14 " );	// Hmm... That was a few years ago. One evening I was sitting in a pub near Cardiff and overheard a conversation between two guys.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_18 " );	// They said that some big merchant in the upper quarter had something to profit from.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_27 " );	// And the next morning I found out that in the upper quarter of the city, a rich man's house was robbed!
	AI_Output(other,self, " DIA_Grimes_EligorPotion_Memory_01_2F " );	// Hmmm... So you never managed to find out the names of those people who committed this robbery?
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_43 " );	// Well, why not. A year later I met one of them in the colony. His name was Rufus.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_44 " );	// He said that it was they who robbed the house of a rich merchant and took out everything that could be taken out of there.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_47 " );	// What's more, Rufus said that one of the little things they grabbed was worth a fortune!
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_51 " );	// Looks like it was some kind of elixir.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_57 " );	// And then one incident happened...
	AI_Output(other,self, " DIA_Grimes_EligorPotion_Memory_01_59 " );	// What's the case?
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_60 " );	// Somehow, in an abandoned mine, a collapse began in one of the tunnels of the mine. The guards hurriedly began to lead us out of there. But then Rufus fell behind.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_67 " );	// We saw him running through a hail of falling rocks!
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_69 " );	// He had almost reached the end of the tunnel when one of the falling rocks hit him squarely in the head. He dropped dead.
	AI_Output(other,self, " DIA_Grimes_EligorPotion_Memory_01_76 " );	// What happened to Rufus' elixir?
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_77 " );	// The mine guards took it and hid it in their chest, away from prying eyes.
	AI_Output(other,self, " DIA_Grimes_EligorPotion_Memory_01_81 " );	// But as far as I know, no one has been working in the abandoned mine for a long time.
	AI_Output(other,self, " DIA_Grimes_EligorPotion_Memory_01_82 " );	// The guards must have taken him before they left.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_83 " );	// I don't think they had time to dig through their junk back then.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_84 " );	// (surprised) Don't you know what happened there?
	AI_Output(other,self, " DIA_Grimes_EligorPotion_Memory_01_85 " );	// What do you mean?
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_89 " );	// Once the miners stumbled upon an unusual cave hidden in the rock.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_92 " );	// Several miners, along with three guards, went to inspect that cave.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_93 " );	// From there came strange sounds, similar to terrifying moans.
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_99 " );	// That cave was full of undead!
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_106 " );	// There was a real carnage! A lot of people died...
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_108 " );	// I was nearby then and managed to grab the key, which was lying next to the mutilated body of one of the guards.
	AI_Output(other,self, " DIA_Grimes_EligorPotion_Memory_01_113 " );	// Can you give me this key?
	AI_Output(self,other, " DIA_Grimes_EligorPotion_Memory_01_123 " );	// Why? It's okay though, it's up to you. But better stay away from that place.
	B_GiveInvItems(self,other,itke_grimkey,1);
	B_LogEntry(TOPIC_JORAHELP,"I asked Grimes about the Luthero robbery case. I thought he knew something about it, and I was right! Grimes told me the story of a man named Rufus. He was one of those The boys who robbed Luthero's house.Then Rufus was exiled to the Valley to the mines.According to Grimes, when they were both miners and worked in an abandoned mine, Rufus always had one strange elixir with him, which, as he himself said, was a simple medicine cough. However, Rufus treasured his elixir so much that he gave his own life for it! It seems that this vial of medicine is the same elixir known as Eligor's Flame.");
	Log_AddEntry( TOPIC_JORAHELP , " Grimes also told the events that took place many years ago in an abandoned mine. The miners then stumbled upon a cave hidden in the rock, which was simply teeming with undead. She killed almost all the inhabitants of the mine. Grimes managed to get out of this nightmare alive, yes and not empty-handed either. While fleeing, he grabbed a key that belonged to one of the guards. Perhaps this key will help me find the elixir, traces of which are found in the depths of the mine. However, I should be careful if I want to visit there . " );
	GrimesCanEscape = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_GRIMES_POSSECCELIGORPOTION(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 2;
	condition = dia_grimes_possecceligorpotion_condition;
	information = dia_grimes_possecceligorpotion_info;
	permanent = FALSE;
	description = " I was in an abandoned mine. " ;
};

func int dia_grimes_possecceligorpotion_condition()
{
	if (( MIS_JORAHELP  == LOG_Running ) && ( Npc_HasItems ( other , itpo_eligorfire ) >=  1 )) .
	{
		return TRUE;
	};
};

func void dia_grimes_possecceligorpotion_info()
{
	AI_Output(other,self, " DIA_Grimes_PosseccEligorPotion_01_00 " );	// I was in an abandoned mine.
	AI_Output(self,other, " DIA_Grimes_PosseccEligorPotion_01_01 " );	// (incredulously) Huh? Can't be...
	AI_Output(other,self, " DIA_Grimes_PosseccEligorPotion_01_02 " );	// There I found this elixir. Do you recognize?
	AI_Output(self,other, " DIA_Grimes_PosseccEligorPotion_01_03 " );	// Incredible. It's the same Rufus potion!
	AI_Output(self,other, " DIA_Grimes_PosseccEligorPotion_01_05 " );	// Yes, lad... You must have the courage.

	if (Npc_IsDead(demonlord_am))
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_Grimes_PosseccEligorPotion_01_07 " );	// What did you see there?
		AI_Output(other,self, " DIA_Grimes_PosseccEligorPotion_01_08 " );	// There was a demon, but I killed him.
		AI_Output(other,self, " DIA_Grimes_PosseccEligorPotion_01_09 " );	// In general, like all the undead that were in the mine.
		AI_Output(self,other, " DIA_Grimes_PosseccEligorPotion_01_15 " );	// Yes, you are an amazing person!
	}
	else
	{
		B_GivePlayerXP(50);
	};
};

instance DIA_GRIMES_LETSGETOUTSUGG(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 7;
	condition = dia_grimes_letsgetoutsugg_condition;
	information = dia_grimes_letsgetoutsugg_info;
	permanent = FALSE;
	description = " Would you like to get out of the Mining Valley? " ;
};

func int dia_grimes_letsgetoutsugg_condition()
{
	if((GrimesCanEscape == TRUE) && Npc_KnowsInfo(other,dia_viper_getminedata) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_grimes_letsgetoutsugg_info()
{
	AI_Output(other,self, " DIA_GRIMES_LetsGetOutSugg_15_00 " );	// Have you thought about getting out of this mine and out of the Valley of Mines?
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutSugg_01_01 " );	// I didn't think so. Yes, but what's the point of this?
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutSugg_01_02 " );	// Paladins won't let me go anywhere. And even if I somehow manage to slip past them, around the crowd of orcs.
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutSugg_01_03 " );	// I won't live twenty minutes outside. So no, I'd rather stay here.
	AI_Output(other,self, " DIA_GRIMES_LetsGetOutSugg_15_04 " );	// Clear. What if someone you know helped you get out of here?
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutSugg_01_05 " );	// You? But how will you manage to get through the hordes of orcs, even if you forget about the paladins?
	AI_Output(other,self, " DIA_GRIMES_LetsGetOutSugg_15_06 " );	// Same as the previous few times.
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutSugg_01_07 " );	// Hmm... okay, but why do you need me? You don't just want to help me, do you?
	AI_Output(other,self, " DIA_GRIMES_LetsGetOutSugg_15_08 " );	// I need people who are good with pickaxes. In Khorinis, as it turns out, there is some magical ore.
	AI_Output(other,self, " DIA_GRIMES_LetsGetOutSugg_15_09 " );	// Now I'm trying to develop this deposit, but I can't do it alone.
	AI_Output(other,self, " DIA_GRIMES_LetsGetOutSugg_15_10 " );	// In short, I want you to work for me.
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutSugg_01_11 " );	// (Disappointed) Mine again? But why is your mine better than this one?
	AI_Output(other,self, " DIA_GRIMES_LetsGetOutSugg_15_12 " );	// Let me think...
	AI_Output(other,self, " DIA_GRIMES_LetsGetOutSugg_15_13 " );	// Hordes of orcs don't roam around it, you won't have to work for days, you'll have housing and three meals a day.
	AI_Output(other,self, " DIA_GRIMES_LetsGetOutSugg_15_14 " );	// There are no more crawlers there either.
	AI_Output(other,self, " DIA_GRIMES_LetsGetOutSugg_15_15 " );	// Oh, yes, the ore mined there will definitely go to work, and not lie next to the mine, waiting for the orcs to take it for themselves.
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutSugg_01_16 " );	// Well, if all this is true, then the working conditions you propose will be better than here.

	if(HuntyIsDead == FALSE)
	{
		AI_Output(self,other, " DIA_GRIMES_LetsGetOutSugg_01_17 " );	// Okay, I agree. But I won't go alone, you must take my friend too.
		AI_Output(other,self, " DIA_GRIMES_LetsGetOutSugg_15_18 " );	// No problem. Four hands are better than two.
	};

	AI_Output(self,other, " DIA_GRIMES_LetsGetOutSugg_01_19 " );	// Great. Then we need to get out of the mine first.	
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutSugg_01_20 " );	// Unfortunately, these paladins are always on guard, you can't just slip past them...
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutSugg_01_21 " );	// But wait. I have an idea! I've heard of a spell that can put a person to sleep.
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutSugg_01_22 " );	// If you could get a couple of scrolls...
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutSugg_01_23 " );	// Also, I need to get ready. Give me a day and then come back with the scrolls.
	GRIMESDAYDT = Wld_GetDay();
	AI_StopProcessInfos(self);
};

instance DIA_GRIMES_LETSGETOUTOFHERE(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 7;
	condition = dia_grimes_letsgetoutofhere_condition;
	information = dia_grimes_letsgetoutofhere_info;
	permanent = FALSE;
	description = " I got the scrolls. Get ready. " ;
};

func int dia_grimes_letsgetoutofhere_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_letsgetoutsugg) && (GRIMESDAYDT < Wld_GetDay()) && (HURRAYICANHIRE == TRUE) && (Npc_HasItems(other,ItSc_Sleep) >= 2))
	{
		return TRUE;
	};
};

func void dia_grimes_letsgetoutofhere_info()
{
	AI_Output(other,self, " DIA_GRIMES_LetsGetOutOfHere_15_00 " );	// I got the scrolls. Get ready.
	AI_Output(other,self, " DIA_GRIMES_LetsGetOutOfHere_15_01 " );	// Once we get out of this camp, I'll guide you safely to the Passage.
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutOfHere_01_02 " );	// Forget scrolls! I was recently on the street and heard that the paladins soon intended to pray to Innos.
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutOfHere_01_03 " );	// You can't see the entrance to the mine from that place!
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutOfHere_01_04 " );	// Stop. I think I hear armor tinkling.
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutOfHere_01_05 " );	// And now silence...
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutOfHere_01_06 " );	// I think they're gone.
	AI_Output(self,other, " DIA_GRIMES_LetsGetOutOfHere_01_07 " );	// Go! Now or never.
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;

	if(HuntyIsDead == FALSE)
	{
		STRF_1117_Straefling.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMe");

	if(HuntyIsDead == FALSE)
	{
		B_StartOtherRoutine(STRF_1117_Straefling,"FollowMe");
	};

	b_changeguild(Pal_219_Ritter,GIL_BDT);
	B_StartOtherRoutine(Pal_219_Ritter,"GrimesEsc");
	AI_Teleport(Pal_219_Ritter,"OW_PAL_WESTMINE_03");
	b_changeguild(Pal_218_Ritter,GIL_BDT);
	B_StartOtherRoutine(Pal_218_Ritter,"GrimesEsc");
	AI_Teleport(Pal_218_Ritter,"OW_PAL_WESTMINE_02");
	B_StartOtherRoutine(vlk_7527_waffenknecht,"GrimesEsc");
	AI_Teleport(vlk_7527_waffenknecht,"OW_PAL_WESTMINE_06");
};

instance DIA_GRIMES_WEGOTOUTOFHERE(C_Info)
{
	npc = VLK_4111_Grimes;
	nr = 7;
	condition = dia_grimes_wegotoutofhere_condition;
	information = dia_grimes_wegotoutofhere_info;
	permanent = FALSE;
	description = " We're here. " ;
};

func int dia_grimes_wegotoutofhere_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_letsgetoutofhere) && (Npc_GetDistToWP(self,"START") < 2000) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_grimes_wegotoutofhere_info()
{
	AI_Output(other,self, " DIA_GRIMES_WeGotOutOfHere_15_00 " );	// We're here! Through this mine you can get to Khorinis. Just follow me.
	AI_Output(self,other, " DIA_GRIMES_WeGotOutOfHere_01_01 " );	// As you say.
	HUNTYGRIMESESCAPEOW = TRUE;
	Pal_219_Ritter.flags = 0;
	Pal_218_Ritter.flags = 0;
	vlk_7527_waffenknecht.flags = 0 ;
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;

	if(HuntyIsDead == FALSE)
	{
		STRF_1117_Straefling.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"NearPassOW");

	if(HuntyIsDead == FALSE)
	{
		B_StartOtherRoutine(STRF_1117_Straefling,"NearPassOW");
	};

	B_KillNpc(Pal_218_Ritter);
	B_KillNpc(Pal_219_Ritter);
	B_KillNpc(vlk_7527_waffenknecht);

	Wld_InsertNpc(orkelite_addon2,"OW_PAL_WESTMINE_02");
	Wld_InsertNpc(orkelite_addon2,"OW_PAL_WESTMINE_01");
	Wld_InsertNpc(orkelite_addon3,"OW_PATH_266");
	Wld_InsertNpc(orkelite_addon2,"OW_PATH_2_04");
	Wld_InsertNpc(orkelite_addon3,"OW_PAL_WESTMINE_SIT");
};

// ----------------------- new------------------------ ------------------------------------

instance DIA_GRIMESNW_EXIT(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 999;
	condition = dia_grimesnw_exit_condition;
	information = dia_grimesnw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_grimesnw_exit_condition()
{
	return TRUE;
};

func void dia_grimesnw_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GRIMESNW_FREEDOM(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 1;
	condition = dia_grimesnw_freedom_condition;
	information = dia_grimesnw_freedom_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_grimesnw_freedom_condition()
{
	if((HURRAYICANHIRE == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_grimesnw_freedom_info()
{
	AI_Output(self,other, " DIA_GRIMESNW_Freedom_01_00 " );	// (takes a deep breath) Freedom...
	AI_Output(self,other, " DIA_GRIMESNW_Freedom_01_01 " );	// For the last few years, I've been convinced that I was destined to die in this damned valley.
	AI_Output(self,other, " DIA_GRIMESNW_Freedom_01_02 " );	// I can't believe I finally left her...
	AI_Output(other,self, " DIA_GRIMESNW_Freedom_15_03 " );	// Wait a minute to rejoice. We haven't reached my camp yet.
	AI_Output(self,other, " DIA_GRIMESNW_Freedom_01_04 " );	// You're right! Let's not delay.
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	vlk_41111_huntynw.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMe");
	B_StartOtherRoutine(vlk_41111_huntynw,"FollowMe");
};

instance DIA_GRIMESNW_FINALLYINTOWER(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 1;
	condition = dia_grimesnw_finallyintower_condition;
	information = dia_grimesnw_finallyintower_info;
	permanent = FALSE;
	description = " We're here. Here's my camp. " ;
};

func int dia_grimesnw_finallyintower_condition()
{
	if((HURRAYICANHIRE == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 3000))
	{
		return TRUE;
	};
};

func void dia_grimesnw_finallyintower_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_GRIMESNW_FinallyInTower_15_00 " );	// We're there. Here is my camp. Over there is the entrance to the mine.
	AI_Output(self,other, " DIA_GRIMESNW_FinallyInTower_01_01 " );	// Great place! Thank you for leading me out of the valley.
	AI_Output(other,self, " DIA_GRIMESNW_FinallyInTower_15_02 " );	// Nothing. At first you can relax, and when you gain strength, get to work.
	AI_Output(other,self, " DIA_GRIMESNW_FinallyInTower_15_03 " );	// I hope you remember our agreement?
	AI_Output(self,other, " DIA_GRIMESNW_FinallyInTower_01_04 " );	// Of course! I do not forget the words I have given.
	AI_Output(other,self, " DIA_GRIMESNW_FinallyInTower_15_05 " );	// Then settle down! Oh yes, for your work I will pay you thirty-five gold a day. I agree?
	AI_Output(self,other, " DIA_GRIMESNW_FinallyInTower_01_06 " );	// Money? I already forgot what it is.
	AI_Output(self,other, " DIA_GRIMESNW_FinallyInTower_01_07 " );	// Thank you again.
	B_LogEntry_Quiet( TOPIC_PPL_FOR_TOWER , " I managed to get miners Grimes and Hunty out of Mining Valley. Now they will work for me. " );
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	HUNTYGRIMESRECRUITEDDT = TRUE;

	if(DT_OREGATHER_START == FALSE)
	{
		DT_OREGATHER_START = TRUE;
		EVERYDAYDTORE = Wld_GetDay();
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_GRIMESNW_INTOWER(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 22;
	condition = dia_grimesnw_intower_condition;
	information = dia_grimesnw_intower_info;
	permanent = TRUE;
	description = " How do you like your new job? " ;
};

func int dia_grimesnw_intower_condition()
{
	if(HUNTYGRIMESRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void dia_grimesnw_intower_info()
{
	AI_Output(other,self, " DIA_GrimesNW_InTower_15_00 " );	// How do you like your new job?
	AI_Output(self,other, " DIA_GrimesNW_InTower_01_01 " );	// Excellent! I swear I won't leave an ounce of unmined ore in your mine.
};

instance DIA_GRIMES_NW_KNOWABOUTERZHUNT(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 2;
	condition = dia_grimes_NW_knowabouterzhunt_condition;
	information = dia_grimes_NW_knowabouterzhunt_info;
	permanent = FALSE;
	description = " Do you know anything about mining? " ;
};

func int dia_grimes_NW_knowabouterzhunt_condition()
{
	return TRUE;
};

func void dia_grimes_NW_knowabouterzhunt_info()
{
	AI_Output(other,self, " DIA_Grimes_KnowAboutErzHunt_01_00 " );	// Do you know anything about mining?
	AI_Output(self,other, " DIA_Grimes_KnowAboutErzHunt_01_01 " );	// For half of my life I've been doing nothing but extracting it.
	AI_Output(other,self, " DIA_Grimes_KnowAboutErzHunt_01_03 " );	// I want to learn how to mine ore. Can you help me?
	AI_Output(self,other, " DIA_Grimes_KnowAboutErzHunt_01_04 " );	// No problem. I will teach you everything I know myself.

	if(ORE_TOPIC_EXIST == TRUE)
	{
		B_LogEntry( TOPIC_MAGICORE , " Grimes can teach me how to extract magic ore from rock. " );
	}
	else
	{
		Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
		B_LogEntry( TOPIC_MAGICORE , " Grimes can teach me how to extract magic ore from rock. " );
		ORE_TOPIC_EXIST = TRUE;
	};
};

instance DIA_GRIMES_NW_LEARNABOUTERZHUNT(C_Info)
{
	npc = vlk_41110_grimesnw;
	nr = 2;
	condition = dia_grimes_NW_learnabouterzhunt_condition;
	information = dia_grimes_NW_learnabouterzhunt_info;
	permanent = TRUE;
	description = " Teach me how to mine. " ;
};

func int dia_grimes_NW_learnabouterzhunt_condition()
{
	if(Npc_KnowsInfo(other,dia_grimes_knowabouterzhunt) && (HERO_HACKCHANCEORE < 100))
	{
		return TRUE;
	};
};

func void dia_grimes_NW_learnabouterzhunt_info()
{
	if(KNOWHOWPICKORE == TRUE)
	{
		AI_Output(other,self, " DIA_Grimes_LearnAboutErzHunt_01_0A " );	// Tell me more about mining.
	}
	else
	{
		AI_Output(other,self, " DIA_Grimes_LearnAboutErzHunt_01_00 " );	// Teach me how to mine.
	};

	Info_ClearChoices(dia_grimes_NW_learnabouterzhunt);
	Info_AddChoice(dia_grimes_NW_learnabouterzhunt,Dialog_Back,dia_grimes_NW_learnabouterzhunt_Back);
	Info_AddChoice(dia_grimes_NW_learnabouterzhunt,b_buildlearnstringforerzhunt("Добыча руды",B_GetLearnCostTalent(other,NPC_TALENT_ERZWORK,1)),dia_grimes_NW_learnabouterzhunt_ERZWORK);
};

func void dia_grimes_NW_learnabouterzhunt_Back()
{
	Info_ClearChoices(dia_grimes_NW_learnabouterzhunt);
};

func void dia_grimes_NW_learnabouterzhunt_ERZWORK()
{
	if(HERO_HACKCHANCEORE < 100)
	{
		if(b_teachplayertalenterzhunt(self,other,NPC_TALENT_ERZWORK))
		{
			if(GRIMESTEACHMOREORE == FALSE)
			{
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_01 " );	// Good! Listen carefully...
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_02 " );	// First you need to get a good pickaxe - that's half the battle.
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_03 " );	// Then start processing the ore vein you found.
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_04 " );	// It is necessary to hit not along the edge of the rock, but exactly in the center. Strike one powerful blow, and then several weaker blows.
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_05 " );	// By doing so, you will slightly break the structure of the nugget, and with the next strong blow, some piece of it will definitely break off.
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_06 " );	// And then do it all over again...
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_07 " );	// This is the main thing you need to know about mining.
				GRIMESTEACHMOREORE = TRUE;
			}
			else
			{
				AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_09 " );	// Okay! Listen carefully ... (tells)
			};
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Grimes_LearnAboutErzHunt_01_10 " );	// I taught you everything I know. Then you gain experience yourself, waving a pickaxe.
	};

	Info_ClearChoices(dia_grimes_NW_learnabouterzhunt);
};

// ------------------------------Hanti----------------- -------------------------

instance DIA_HUNTYNW_EXIT(C_Info)
{
	npc = vlk_41111_huntynw;
	nr = 999;
	condition = dia_huntynw_exit_condition;
	information = dia_huntynw_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int dia_huntynw_exit_condition()
{
	return TRUE;
};

func void dia_huntynw_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_HUNTYNW_INTOWER_IRON(C_Info)
{
	npc = vlk_41111_huntynw;
	nr = 22;
	condition = dia_huntynw_intower_IRON_condition;
	information = dia_huntynw_intower_IRON_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_huntynw_intower_IRON_condition()
{
	if(HUNTYGRIMESRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void dia_huntynw_intower_IRON_info()
{
	AI_Output(self,other, " DIA_HuntyNW_InTower_01_01 " );	// Thanks for helping me get out of the valley!
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;

	if(DT_IRONGATHER_START == FALSE)
	{
		DT_IRONGATHER_START = TRUE;
		EVERYDAYDTIRON = Wld_GetDay();
	};

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

instance DIA_HUNTYNW_INTOWER(C_Info)
{
	npc = vlk_41111_huntynw;
	nr = 22;
	condition = dia_huntynw_intower_condition;
	information = dia_huntynw_intower_info;
	permanent = TRUE;
	description = " How are you? " ;
};

func int dia_huntynw_intower_condition()
{
	if(HUNTYGRIMESRECRUITEDDT == TRUE)
	{
		return TRUE;
	};
};

func void dia_huntynw_intower_info()
{
	AI_Output(other,self, " DIA_HuntyNW_InTower_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_HuntyNW_InTower_01_01 " );	// Everything is fine.
};
