
instance DIA_Rethon_EXIT(C_Info)
{
	npc = DJG_709_Rethon;
	nr = 999;
	condition = DIA_Rethon_EXIT_Condition;
	information = DIA_Rethon_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Rethon_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Rethon_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Rethon_HELLO (C_Info)
{
	npc = DJG_709_Rethon;
	nr = 5;
	condition = DIA_Rethon_HALLO_Condition;
	information = DIA_Rethon_HELLO_Info;
	description = " What are you doing here? " ;
};


func int DIA_Rethon_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Rethon_HALLO_Info()
{
	AI_Output(other,self, " DIA_Rethon_HALLO_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Rethon_HALLO_12_01 " );	// Preparing for battle, what else?
};


instance DIA_Rethon_KAMPF (C_Info)
{
	npc = DJG_709_Rethon;
	nr = 6;
	condition = DIA_Rethon_KAMPF_Condition;
	information = DIA_Rethon_KAMPF_Info;
	description = " Who are you going to fight? " ;
};


func int DIA_Rethon_KAMPF_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rethon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rethon_FIGHT_Info()
{
	AI_Output(other,self, " DIA_Rethon_KAMPF_15_00 " );	// Who are you going to fight?
	AI_Output(self,other, " DIA_Rethon_KAMPF_12_01 " );	// I want to challenge the paladins and show these fat lazy people where the crayfish hibernate.
	AI_Output(self,other, " DIA_Rethon_KAMPF_12_02 " );	// Idiot. With dragons, of course. And what did you think?
};


instance DIA_Rethon_PALADINE(C_Info)
{
	npc = DJG_709_Rethon;
	nr = 6;
	condition = DIA_Rethon_PALADINE_Condition;
	information = DIA_Rethon_PALADINE_Info;
	description = " Paladins okay with you here? " ;
};


func int DIA_Rethon_PALADINE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rethon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rethon_PALADINE_Info()
{
	AI_Output(other,self, " DIA_Rethon_PALADINE_15_00 " );	// Paladins don't mind you being here?
	AI_Output(self,other, " DIA_Rethon_PALADINE_12_01 " );	// Nonsense. They have very different problems. Most of them are glad to be alive at all.
	AI_Output(self,other, " DIA_Rethon_PALADINE_12_02 " );	// They don't have morale. This is the beginning of their end.
	AI_Output(self,other, " DIA_Rethon_PALADINE_12_03 " );	// I mean, just look at those old jagged blades of theirs that they keep repairing.
	AI_Output(self,other, " DIA_Rethon_PALADINE_12_04 " );	// Any reasonable warrior would have fled from here long ago.
};


instance DIA_Rethon_WOGRUPPE (C_Info)
{
	npc = DJG_709_Rethon;
	nr = 7;
	condition = DIA_Rethon_WOGRUPPE_Condition;
	information = DIA_Rethon_WOGRUPPE_Info;
	description = " Are you behind your group? " ;
};


func int DIA_Rethon_WOGRUPPE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rethon_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Rethon_WOGRUPPE_Info()
{
	AI_Output(other,self, " DIA_Rethon_WOGRUPPE_15_00 " );	// Have you fallen behind your group?
	AI_Output(self,other, " DIA_Rethon_WOGRUPPE_12_01 " );	// My group? I don't have a group. I am a trophy hunter.
	AI_Output(self,other, " DIA_Rethon_WOGRUPPE_12_02 " );	// If I return home without a trophy, no one will understand why I came here. That's why I don't want to share with anyone.
};


instance DIA_Rethon_SEEN DRAGON (C_Info)
{
	npc = DJG_709_Rethon;
	nr = 8;
	condition = DIA_Rethon_DRACHENGESEHEN_Condition;
	information = DIA_Rethon_SEEN DRAGONS_Info;
	description = " Have you seen the dragon yet? " ;
};


func int DIA_Rethon_DRACHENGESEHEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rethon_KAMPF))
	{
		return TRUE;
	};
};

func void DIA_Rethon_SEEN_DRAGON_Info()
{
	AI_Output(other,self, " DIA_Rethon_DRACHENGESEHEN_15_00 " );	// Have you seen the dragon yet?
	AI_Output(self,other, " DIA_Rethon_DRACHENGESEHEN_12_01 " );	// No. I want to get my weapon in order before I go hunting for it.
};


instance DIA_Rethon_ANGST (C_Info)
{
	npc = DJG_709_Rethon;
	nr = 9;
	condition = DIA_Rethon_ANGST_Condition;
	information = DIA_Rethon_ANGST_Info;
	description = " Aren't you afraid that someone might get ahead of you? " ;
};


func int DIA_Rethon_ANGST_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rethon_WOGRUPPE))
	{
		return TRUE;
	};
};

func void DIA_Rethon_ANGST_Info()
{
	AI_Output(other,self, " DIA_Rethon_ANGST_15_00 " );	// Aren't you afraid that someone might get ahead of you?
	AI_Output(self,other, " DIA_Rethon_ANGST_12_01 " );	// What? Who? Silvio?
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Rethon_ANGST_12_02 " );	// Your boss really thinks he's up to something here, huh?
		AI_Output(other,self, " DIA_Rethon_ANGST_15_03 " );	// I'm not one of Silvio's people. I work for myself.
		AI_Output(self,other, " DIA_Rethon_ANGST_12_04 " );	// Oh. This is good. Forget what I said.
	};
	AI_Output(self,other, " DIA_Rethon_ANGST_12_05 " );	// Did you see those pathetic cowards he brought with him?
	AI_Output(self,other, " DIA_Rethon_ANGST_12_06 " );	// Silvio should be glad if he gets out of here alive.
	if (Npc_IsDead(DJG_Sylvio))
	{
		AI_Output(other,self, " DIA_Rethon_ANGST_15_07 " );	// Fail. He is dead.
		AI_Output(self,other,"DIA_Rethon_ANGST_12_08");	//Я рад.
	}
	else
	{
		Info_AddChoice(DIA_Rethon_ANGST,Dialog_Back,DIA_Rethon_ANGST_weiter);
		Info_AddChoice(DIA_Rethon_ANGST, " You don't seem to like him very much. " ,DIA_Rethon_ANGST_sylviomoegen);
		Info_AddChoice(DIA_Rethon_ANGST, " Where is Silvio now? " ,DIA_Rethon_ANGST_woSylvio);
		Info_AddChoice(DIA_Rethon_ANGST, " Was Silvio here? " ,DIA_Rethon_ANGST_sylviohier);
	};
};

func void DIA_Rethon_ANGST_weiter()
{
	Info_ClearChoices(DIA_Rethon_ANGST);
};

func void DIA_Rethon_ANGST_sylviohier()
{
	AI_Output(other,self, " DIA_Rethon_ANGST_sylviohier_15_00 " );	// Was Silvio here?
	AI_Output(self,other, " DIA_Rethon_ANGST_sylviohier_12_01 " );	// Here in the castle, you mean? Yes, there was. But for a very short time.
	AI_Output(self,other, " DIA_Rethon_ANGST_sylviohier_12_02 " );	// He chatted with a few guys here and then disappeared again.
};

func void DIA_Rethon_ANGST_sylviomoegen()
{
	AI_Output(other,self, " DIA_Rethon_ANGST_sylviomoegen_15_00 " );	// You don't seem to like him very much.
	AI_Output(self,other, " DIA_Rethon_ANGST_sylviomoegen_12_01 " );	// What do you want to say by this - love? It would be better if I didn't know him at all.
	AI_Output(self,other, " DIA_Rethon_ANGST_sylviomoegen_12_02 " );	// Silvio has no friends. He needs people who follow him and don't ask questions.
	AI_Output(self,other, " DIA_Rethon_ANGST_sylviomoegen_12_03 " );	// This is not for me. I work alone.
};

func void DIA_Rethon_ANGST_woSylvio()
{
	AI_Output(other,self, " DIA_Rethon_ANGST_woSylvio_15_00 " );	// And where is Silvio now?
	AI_Output(self,other, " DIA_Rethon_ANGST_woSylvio_12_01 " );	// Paladins said something about an ice dragon in the west. He is rumored to be the most dangerous and powerful of all dragons.
	AI_Output(self,other, " DIA_Rethon_ANGST_woSylvio_12_02 " );	// You should have seen the sparkle in Silvio's eyes when he heard about it. You don't even have to guess where he went.
	B_LogEntry( TOPIC_DRACHENJAGD , " Dragon Hunter Reton was mumbling something about an ice dragon. " );
	B_LogEntry(TOPIC_Dragonhunter, " Silvio was at the castle and then went looking for the ice dragon. " );
};


instance DIA_Rethon_MYWAFFE (C_Info)
{
	npc = DJG_709_Rethon;
	nr = 10;
	condition = DIA_Rethon_MEINEWAFFE_Condition;
	information = DIA_Rethon_MYWAFFE_Info;
	description = " Can you help me upgrade my weapon? " ;
};


func int DIA_Rethon_MEINEWAFFE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rethon_PALADINE))
	{
		return TRUE;
	};
};

func void DIA_Rethon_MYWEAPON_Info()
{
	AI_Output(other,self, " DIA_Rethon_MEINEWAFFE_15_00 " );	// Can you help me improve my weapon?
	AI_Output(self,other, " DIA_Rethon_MEINEWAFFE_12_01 " );	// Improve? Better buy something new and throw away this junk that you carry with you.
	AI_Output(self,other, " DIA_Rethon_MEINEWAFFE_12_02 " );	// Maybe I have something for you. You're interested?
};


instance DIA_Rethon_TRADE(C_Info)
{
	npc = DJG_709_Rethon;
	nr = 11;
	condition = DIA_Rethon_TRADE_Condition;
	information = DIA_Rethon_TRADE_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " What can you sell me? " ;
};


func int DIA_Rethon_TRADE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Rethon_MEINEWAFFE))
	{
		return TRUE;
	};
};

func void DIA_Rethon_TRADE_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Rethon_TRADE_15_00 " );	// What can you sell me?
	B_GiveTradeInv(self);

	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Rethon_TRADE_12_01 " );	// Oh, how low I've sunk! Now I even sell my weapons to a paladin!
	}
	else  if ((hero.guild ==  GIL_KDF ) || (hero.guild ==  GIL_KDW ) || (hero.guild ==  GIL_KDM ) || (hero.guild ==  GIL_GUR ))
	{
		AI_Output(self,other, " DIA_Rethon_TRADE_12_02 " );	// I don't have much for a mage, but you can still take a look.
	}
	else if((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL))
	{
		AI_Output(self,other, " DIA_Rethon_TRADE_12_02A " );	// For you guys from the Brotherhood, in my opinion, the main thing is weed ... (laughs) Well, look, maybe there are a couple of joints lying around.
	}
	else
	{
		AI_Output(self,other, " DIA_Rethon_TRADE_12_03 " );	// I think I have exactly what you need, mate.
	};

	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
};


instance DIA_Rethon_PICKPOCKET(C_Info)
{
	npc = DJG_709_Rethon;
	nr = 900;
	condition = DIA_Rethon_PICKPOCKET_Condition;
	information = DIA_Rethon_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Rethon_PICKPOCKET_Condition()
{
	return  C_Robbery ( 78 , 230 );
};

func void DIA_Rethon_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Rethon_PICKPOCKET);
	Info_AddChoice(DIA_Rethon_PICKPOCKET,Dialog_Back,DIA_Rethon_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Rethon_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Rethon_PICKPOCKET_DoIt);
};

func void DIA_Rethon_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Rethon_PICKPOCKET);
};

func void DIA_Rethon_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Rethon_PICKPOCKET);
};
