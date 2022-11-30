
var int Scatty_Start;

instance DIA_Addon_Scatty_EXIT(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 999;
	condition = DIA_Addon_Scatty_EXIT_Condition;
	information = DIA_Addon_Scatty_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Scatty_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos(self);
	if(Scatty_Start == FALSE)
	{
		Npc_ExchangeRoutine(self,"START");
		Scatty_Start = TRUE;
	};
};


instance DIA_Addon_Scatty_PICKPOCKET(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 900;
	condition = DIA_Addon_Scatty_PICKPOCKET_Condition;
	information = DIA_Addon_Scatty_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Addon_Scatty_PICKPOCKET_Condition()
{
	return  C_Robbery ( 60 , 90 );
};

func void DIA_Addon_Scatty_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
	Info_AddChoice(DIA_Addon_Scatty_PICKPOCKET,Dialog_Back,DIA_Addon_Scatty_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Addon_Scatty_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Addon_Scatty_PICKPOCKET_DoIt);
};

func void DIA_Addon_Scatty_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
};

func void DIA_Addon_Scatty_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Addon_Scatty_PICKPOCKET);
};


instance DIA_Addon_Scatty_Hi(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Hi_Condition;
	information = DIA_Addon_Scatty_Hi_Info;
	permanent = FALSE;
	description = " How is trading? " ;
};


func int DIA_Addon_Scatty_Hi_Condition()
{
	if(SCATTY_TP == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Hi_Info()
{
	AI_Output(other,self, " DIA_Addon_Scatty_Hi_15_00 " );	// How are things going?
	AI_Output(self,other, " DIA_Addon_Scatty_Hi_01_01 " );	// There haven't been many buyers since the tomb was opened.
	AI_Output(self,other, " DIA_Addon_Scatty_Hi_01_02 " );	// Raven doesn't need slaves anymore, so they're mining for gold now. By order of Bloodwin.
	AI_Output(self,other, " DIA_Addon_Scatty_Hi_01_03 " );	// Miners don't work too hard. (mumbles) And miners who don't work hard don't need much.
	Log_CreateTopic(Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry(Topic_Addon_BDT_Trader, " Scutty sells various items. " );
};


instance DIA_Addon_Scatty_last(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_last_Condition;
	information = DIA_Addon_Scatty_last_Info;
	permanent = FALSE;
	description = " Bloodwin? Is he in command now? " ;
};


func int DIA_Addon_Scatty_last_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Scatty_Hi ) &&  ! Npc_IsDead ( Bloodwyn ) && ( SCATTY_TP  ==  FALSE )) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Scatty_last_Info()
{
	AI_Output(other,self, " DIA_Addon_Scatty_last_15_00 " );	// Bloodwin? Is he in charge now?
	AI_Output(self,other, " DIA_Addon_Scatty_last_01_01 " );	// He's the head of the mine. But he almost never goes down. He spends most of his time in the temple with Raven.
	AI_Output(other,self, " DIA_Addon_Scatty_last_15_02 " );	// 'Almost never' is how often, to be precise?
	AI_Output(self,other, " DIA_Addon_Scatty_last_01_03 " );	// The last time I saw him was when he was leaving the tomb...
	AI_Output(self,other, " DIA_Addon_Scatty_last_01_04 " );	// Although no, wait! The last time was when he sent slaves to mine gold.
	AI_Output(self,other, " DIA_Addon_Scatty_last_01_05 " );	// Unlike Raven, he is VERY interested in gold.
};


instance DIA_Addon_Scatty_Crypt (C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Gruft_Condition;
	information = DIA_Addon_Scatty_Crypt_Info;
	permanent = FALSE;
	description = " What kind of tomb is this? " ;
};


func int DIA_Addon_Scatty_Gruft_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Scatty_Crypt_Info()
{
	AI_Output(other,self, " DIA_Addon_Scatty_Gruft_15_00 " );	// What kind of tomb is this?
	AI_Output(self,other, " DIA_Addon_Scatty_Gruft_01_01 " );	// Cursed, doomed tomb! Its keepers killed a lot of people!
	AI_Output(other,self, " DIA_Addon_Scatty_Gruft_15_02 " );	// Keepers? Do you mean such stone creatures? Flat and with a round head?
	AI_Output(self,other, " DIA_Addon_Scatty_Gruft_01_03 " );	// Exactly! They emerge from the depths of the stone in dozens.
	AI_Output(self,other, " DIA_Addon_Scatty_Gruft_01_04 " );	// I knew from the start that digging up the tomb was a bad idea.
	AI_Output(self,other, " DIA_Addon_Scatty_Gruft_01_05 " );	// But Raven was just obsessed with digging here. And when the tomb was finally dug up, he went there with his guards.
};


instance DIA_Addon_Scatty_GruftAgain(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_GruftAgain_Condition;
	information = DIA_Addon_Scatty_GruftAgain_Info;
	permanent = FALSE;
	description = " What does Raven need in the tomb? " ;
};


func int DIA_Addon_Scatty_GruftAgain_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Gruft) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Scatty_GruftAgain_Info()
{
	AI_Output(other,self, " DIA_Addon_Scatty_GruftAgain_15_00 " );	// What does Raven need in the tomb?
	AI_Output(self,other, " DIA_Addon_Scatty_GruftAgain_01_01 " );	// (stops abruptly) Hmm... you're very curious. You remind me of a guy that I once knew.
	AI_Output(self,other, " DIA_Addon_Scatty_GruftAgain_01_02 " );	// He was just as curious. And at some point it became the cause of his death.
	AI_Output(other,self, " DIA_Addon_Scatty_GruftAgain_15_03 " );	// Let's get down to business. What happened in the tomb?
	AI_Output(self,other, " DIA_Addon_Scatty_GruftAgain_01_04 " );	// Well... Uh... Something in my throat is dry...
	AI_Output(other,self, " DIA_Addon_Scatty_GruftAgain_15_05 " );	// Hey Scutty, NOT NOW. It's important, so what does Raven need there?
	AI_Output(self,other, " DIA_Addon_Scatty_GruftAgain_01_06 " );	// Okay. (deep breath) He... he was calling... calling for someone. He spoke words in a foreign language.
	AI_Output(self,other, " DIA_Addon_Scatty_GruftAgain_01_07 " );	// A bright light burst from the tomb, and I heard a scream that cut me to the bone - a demonic scream.
	AI_Output(other,self,"DIA_Addon_Scatty_GruftAgain_15_08");	//А потом?
	AI_Output(self,other, " DIA_Addon_Scatty_GruftAgain_01_09 " );	// That's all I know. After that, Bloodwin came out of the tomb and told me to get out. Which is what I did.
	AI_Output(self,other, " DIA_Addon_Scatty_GruftAgain_01_10 " );	// After a short time, Raven returned to the temple with his men. And no one has seen Raven since.
};


instance DIA_Addon_Scatty_Trinken (C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_Trinken_Condition;
	information = DIA_Addon_Scatty_Trinken_Info;
	permanent = FALSE;
	description = " Do you want a drink? " ;
};


func int DIA_Addon_Scatty_Trinken_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_GruftAgain) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Scatty_Trinken_Info()
{
	AI_Output(other,self, " DIA_Addon_Scatty_Trinken_15_00 " );	// Would you like a drink?
	AI_Output(self,other, " DIA_Addon_Scatty_Trinken_01_01 " );	// It would be nice...beer! But there is hardly any beer in the camp.
	AI_Output(self,other, " DIA_Addon_Scatty_Trinken_01_02 " );	// But maybe Lucia has a bottle...
};


instance DIA_Addon_Scatty_Bier(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_Bier_Condition;
	information = DIA_Addon_Scatty_Bier_Info;
	permanent = FALSE;
	description = " Here's your beer! " ;
};

func int DIA_Addon_Scatty_Bier_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Scatty_Drinken ) & & Npc_HasItems ( other , ItFo_Beer ) & & ( SCATTY_TP == FALSE )) ;  
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Scatty_Bier_Info()
{
	AI_Output(other,self, " DIA_Addon_Scatty_Bier_15_00 " );	// Here, your beer!
	if(B_GiveInvItems(other,self,ItFo_Beer,1))
	{
		AI_UseItem(self,ItFo_Beer);
	};
	AI_Output(self,other, " DIA_Addon_Scatty_Bier_01_01 " );	// Oh, thanks. It is delicious. Thank you! You are my hero!
	AI_Output(self,other, " DIA_Addon_Scatty_Bier_01_02 " );	// For that, I'll even sell you better armor.
	SCATTY_CANTRADESHC = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Scatty_Gold(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_Gold_Condition;
	information = DIA_Addon_Scatty_Gold_Info;
	permanent = FALSE;
	description = " What do I need to know about gold mining? " ;
};


func int DIA_Addon_Scatty_Gold_Condition()
{
	if(SCATTY_TP == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_Gold_Info()
{
	B_Say(other,self,"$ADDON_GOLD_DESCRIPTION");
	AI_Output(self,other, " DIA_Addon_Scatty_Gold_01_00 " );	// Pick up a pickaxe and hit the gold mine - anyone can do it.
	AI_Output(self,other, " DIA_Addon_Scatty_Gold_01_01 " );	// But if you do that, a lot of nuggets will scatter. Therefore, people who understand this matter should dig.
	AI_Output(self,other, " DIA_Addon_Scatty_Gold_01_02 " );	// I can tell you more when you have more experience.
};

instance DIA_Addon_Scatty_teach(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_teach_Condition;
	information = DIA_Addon_Scatty_teach_Info;
	permanent = TRUE;
	description = " Teach me how to mine gold. " ;
};

func int DIA_Addon_Scatty_teach_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Gold) && (Hero_HackChance < 100))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_teach_Info()
{
	if(KNOWHOWPICKGOLD == TRUE)
	{
		AI_Output(other,self, " DIA_Addon_Scatty_teach_15_00 " );	// Tell me more about gold mining.
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Scatty_teach_01_05 " );	// Teach me how to mine gold.
	};

	Info_ClearChoices(DIA_Addon_Scatty_teach);
	Info_AddChoice(DIA_Addon_Scatty_teach,Dialog_Back,DIA_Addon_Scatty_teach_Back);
	Info_AddChoice(DIA_Addon_Scatty_teach,b_buildlearnstringforgoldhunt("Добыча золота",B_GetLearnCostTalent(other,NPC_TALENT_GOLDWORK,1)),DIA_Addon_Scatty_teach_GOLDWORK);
};

func void DIA_Addon_Scatty_teach_Back()
{
	Info_ClearChoices(DIA_Addon_Scatty_teach);
};

func void DIA_Addon_Scatty_teach_GOLDWORK()
{
	if(b_teachplayertalentgoldhunt(self,other,NPC_TALENT_GOLDWORK))
	{
		if(SCATTYTEACHMOREGOLD == FALSE)
		{
			AI_Output(self,other, " DIA_Addon_Scatty_teach_01_01 " );	// First of all, you should know that gold is not an ore. It's soft like butter. If you hit too hard, everything will fall apart!
			AI_Output(self,other, " DIA_Addon_Scatty_teach_01_02 " );	// Every miner has his own techniques to separate the nuggets from the rock.
			AI_Output(self,other, " DIA_Addon_Scatty_teach_01_03 " );	// Ultimately, these tricks separate a mere miner from a good miner.
			AI_Output(self,other, " DIA_Addon_Scatty_teach_01_04 " );	// Other than that, repetition is the mother of learning. Only by working will you become a good miner.
			SCATTYTEACHMOREGOLD = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Scatty_teach_01_06 " );	// Good! I will tell. (tells)
		};
	};

	Info_ClearChoices(DIA_Addon_Scatty_teach);
};

instance DIA_Addon_Scatty_tot(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 2;
	condition = DIA_Addon_Scatty_tot_Condition;
	information = DIA_Addon_Scatty_tot_Info;
	permanent = FALSE;
	description = " Bloodwin is dead. " ;
};


func int DIA_Addon_Scatty_tot_Condition()
{
	if(Npc_IsDead(Bloodwyn) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Scatty_tot_Info()
{
	AI_Output(other,self, " DIA_Addon_Scatty_tot_15_00 " );	// Bloodwin is dead.
	AI_Output(self,other, " DIA_Addon_Scatty_tot_01_01 " );	// Hmm, there aren't many people I wish I could die... but a dead Bloodwin is better than a living one.
};


instance DIA_Addon_Scatty_trade(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = DIA_Addon_Scatty_trade_Condition;
	information = DIA_Addon_Scatty_trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Let's get down to business! " ;
};


func int DIA_Addon_Scatty_trade_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Scatty_Hi) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Scatty_trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};


instance DIA_ADDON_SCATTY_ORCINVASION(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = dia_addon_scatty_orcinvasion_condition;
	information = dia_addon_scatty_orcinvasion_info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int dia_addon_scatty_orcinvasion_condition()
{
	if (( RavenAway ==  TRUE ) && ( SCATTY_TP  ==  TRUE ) &&  !
	{
		return TRUE;
	};
};

func void dia_addon_scatty_orcinvasion_info()
{
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_00");	//Как дела?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_01 " );	// How, how - you can't imagine better! And where did these orcs come from, I have no idea!
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_02 " );	// To be honest, kid, my knees are still shaking.
	AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_03 " );	// Well, you're alive, what else do you need?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_04 " );	// Yes, it is. But in the camp I still had a good bunch of different junk, which I would not really want to part with.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_05 " );	// And now you can't stick your nose in there, otherwise you instantly risk losing your own head!
	if(ORCSHAMAN4ISDEAD == TRUE)
	{
		B_GivePlayerXP(150);
		AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_OrcInvasion_01_06 " );	// No, boy! It's not that I don't believe you, but I won't even take a step there.
	};
};


instance DIA_ADDON_SCATTY_CHEST(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = dia_addon_scatty_chest_condition;
	information = dia_addon_scatty_chest_info;
	permanent = FALSE;
	description = " What is this stuff? " ;
};


func int dia_addon_scatty_chest_condition()
{
	if ( Npc_KnowsInfo ( other , dia_addon_scatty_orcinvation ) && ( SCATTYCHEST  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_addon_scatty_chest_info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_Chest_01_00 " );	// What is this junk?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_Chest_01_01 " );	// Well, nothing special... (he hesitated)
	AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_Chest_01_02 " );	// If it's nothing special, why are you so worried?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_Chest_01_03 " );	// Oh boy. Yes, don't put your finger in your mouth...
	AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_Chest_01_04 " );	// Come on, Scutty, have a shot. What's there?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_Chest_01_05 " );	// Okay. In general, my chest remained there, which I entrust filled with gold bars.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_Chest_01_06 " );	// You yourself understand that when we were fleeing the camp, somehow it was not convenient for me to drag him with me.
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_Chest_01_07");	//Золото?!
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_Chest_01_08 " );	// Yes! My gold, mind you! But you still can’t open it if you intend to appropriate it for yourself.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_Chest_01_09 " );	// There is a very tricky lock, and you will never break it.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_Chest_01_10 " );	// And I have the key!
	AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_Chest_01_11 " );	// Okay, okay. What are you angry about? I'm not going to take your gold.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_Chest_01_12 " );	// Why are you interested then?
	AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_Chest_01_13 " );	// Maybe I can help you? I'll go to the camp and bring you all your gold.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_Chest_01_14 " );	// Are you really going to do this?
	AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_Chest_01_15 " );	// Well, if we divide the contents of the chest in half, then, perhaps, easily.
	AI_Output(self,other,"DIA_Addon_BDT_10014_Scatty_Chest_01_16");	//(гневно) ЧТО?!
	AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_Chest_01_17 " );	// My job is to propose.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_Chest_01_18 " );	// Eh... I see I don't have much of a choice. At least half is also something.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_Chest_01_19 " );	// Okay, consider, agreed. But look, if you fool me... I'll find you and cut you to pieces!
	AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_Chest_01_20 " );	// Don't worry like that! I won't deceive you.
	B_GiveInvItems(self,other,itke_scattychest,1);
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_Chest_01_21 " );	// Here, take the key. And hurry up!
	AI_StopProcessInfos(self);
	SCATTYCHEST = TRUE;
	Log_CreateTopic(TOPIC_SCATTYCHEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCATTYCHEST,LOG_Running);
	B_LogEntry( TOPIC_SCATTYCHEST , " Scutty told me that he had a chest full of gold nuggets in the camp. If I bring them to him, I can keep half of them. " );
};


instance DIA_ADDON_SCATTY_DOCHESTIT(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = dia_addon_scatty_dochestit_condition;
	information = dia_addon_scatty_dochestit_info;
	permanent = FALSE;
	description = " About gold... " ;
};


func int dia_addon_scatty_dochestit_condition()
{
	if (( SCATTYCHEST  ==  TRUE ) && ( Npc_HasItems ( other , ItMy_Addon_GoldNugget ) >=  500 ) && ( SCATTYCHESTDONE  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_addon_scatty_dochestit_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_DoChestIt_01_00 " );	// Here are your ingots.
	B_GiveInvItems(other,self,ItMi_Addon_GoldNugget,500);
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_DoChestIt_01_01 " );	// Well, let me see... (counts) Hmmm...
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_DoChestIt_01_02 " );	// Yes, everything seems to be correct, as it should be.
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_DoChestIt_01_03 " );	// And I see you're an honest guy. You can be trusted, unlike these bandit muzzles!
	AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_DoChestIt_01_04 " );	// Have you ever doubted this?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_DoChestIt_01_05 " );	// Well, you understand - not small. Friendship is friendship, but gold is apart.
	AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_DoChestIt_01_06 " );	// What about our contract?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_DoChestIt_01_07 " );	// The contract is more valuable than money... (laughs) Here, take your share.
	B_GiveInvItems(self,other,ItMi_Addon_GoldNugget,250);
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_DoChestIt_01_08");	//Отлично.
	B_LogEntry( TOPIC_SCATTYCHEST , " I brought Scutty the gold. As we agreed, half is mine. " );
	Log_SetTopicStatus(TOPIC_SCATTYCHEST,LOG_SUCCESS);
	SCATTYCHESTDONE = TRUE;
};


instance DIA_ADDON_SCATTY_CANTRADEARMOR(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 99;
	condition = dia_addon_scatty_cantradearmor_condition;
	information = dia_addon_scatty_cantradearmor_info;
	permanent = FALSE;
	description = " Do you sell armor? " ;
};

func int dia_addon_scatty_cantradearmor_condition()
{
	if((SCATTY_CANTRADESHC == TRUE) && (SCATTY_CANTRADEARMOR == FALSE) && (SCATTY_TP == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_cantradearmor_info()
{
	AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_00 " );	// Do you sell armor?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_05 " );	// Hmm... Of course, I could sell you the guard's armor as well, but Bloodwyn will blow my head off if he finds out!
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_06 " );	// I can only do this by his personal order. So I'm sorry, boy - I can't help you with this matter.
	AI_Output(other,self, " DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_07 " );	// And if Bloodwin suddenly dies, for example? Then can you sell me this armor?
	AI_Output(self,other, " DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_08 " );	// Well, if, of course, this happens then ... I think I can. Although, something I doubt it ... (laughs)
	AI_Output(other,self,"DIA_Addon_BDT_10014_Scatty_CanTradeArmor_01_09");	//Понятно.
	SCATTY_CANTRADEARMOR = TRUE;
};


instance DIA_ADDON_SCATTY_ARMOR(C_Info)
{
	npc = BDT_1086_Addon_Scatty;
	nr = 3;
	condition = dia_addon_scatty_armor_condition;
	information = dia_addon_scatty_armor_info;
	permanent = TRUE;
	description = " Show me your armor. " ;
};


func int dia_addon_scatty_armor_condition()
{
	if((SCATTY_CANTRADEARMOR == TRUE) && (BLOODWYNISDEAD == TRUE) && (SCATTY_TP == FALSE) && ((SCATTY_ARMORPERM_THREE == FALSE) || (SCATTY_ARMORPERM_FOUR == FALSE)))
	{
		return TRUE;
	};
};

func void dia_addon_scatty_armor_info()
{
	AI_Output(other,self, " DIA_Addon_Scatty_Armor_15_01 " );	// Bloodwin is dead! Now will you sell me the guard's armor?
	AI_Output(self,other, " DIA_Addon_Scatty_Armor_15_02 " );	// Well, as promised.

	if(SCATTY_CANTRADESHC == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Scatty_Armor_15_03 " );	// And even more. I can offer you the best that I have!
	};

	Info_AddChoice(dia_addon_scatty_armor,Dialog_Back,dia_addon_scatty_armor_back);

	if(SCATTY_ARMORPERM_THREE == FALSE)
	{
		Info_AddChoice(dia_addon_scatty_armor, " Light Guardian Armor (Price: 1800 coins) " ,dia_addon_scatty_armor_buy3);
	};
	if((SCATTY_CANTRADESHC == TRUE) && (SCATTY_ARMORPERM_FOUR == FALSE))
	{
		Info_AddChoice(dia_addon_scatty_armor, " Guardian Armor (Price: 2100 coins) " ,dia_addon_scatty_armor_buy4);
	};
};

func void dia_addon_scatty_armor_back()
{
	Info_ClearChoices(dia_addon_scatty_armor);
};

func void dia_addon_scatty_armor_buy3()
{
	AI_Output(other,self, " DIA_Addon_Scatty_Armor_Buy3_15_00 " );	// Okay, I'll take this armor.
	if(B_GiveInvItems(other,self,ItMi_Gold,1800))
	{
		AI_Output(self,other,"DIA_Addon_Scatty_Armor_Buy3_06_01");	//Отлично.
		B_GiveInvItems(self,other,itar_grd_l,1);
		SCATTY_ARMORPERM_THREE = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Scatty_Armor_Buy3_06_02 " );	// No money - no armor.
	};
	Info_ClearChoices(dia_addon_scatty_armor);
};

func void dia_addon_scatty_armor_buy4()
{
	AI_Output(other,self, " DIA_Addon_Scatty_Armor_Buy4_15_00 " );	// Okay, I'll take this armor.
	if(B_GiveInvItems(other,self,ItMi_Gold,VALUE_ITAR_Bloodwyn_Addon))
	{
		AI_Output(self,other,"DIA_Addon_Scatty_Armor_Buy4_06_01");	//Отлично.
		B_GiveInvItems(self,other,ITAR_Bloodwyn_Addon,1);
		SCATTY_ARMORPERM_FOUR = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Scatty_Armor_Buy4_06_02 " );	// No money - no armor.
	};
	Info_ClearChoices(dia_addon_scatty_armor);
};
