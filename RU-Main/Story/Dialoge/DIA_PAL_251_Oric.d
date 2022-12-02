

instance DIA_Oric_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_EXIT_Condition;
	information = DIA_Oric_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

void func DIA_Oric_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_HALLO (C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Any_HALLO_Condition;
	information = DIA_Oric_HALLO_Info;
	permanent = FALSE;
	description = " What are your responsibilities? " ;
};


func int DIA_Any_HALLO_Condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Oric_HALLO_Info()
{
	AI_Output(other,self, " DIA_Oric_HALLO_15_00 " );	// What are your responsibilities?
	AI_Output(self,other, " DIA_Oric_HALLO_11_01 " );	// I am the king's strategic officer, and currently report to the honorable commander Garond.
	AI_Output(self,other, " DIA_Oric_HALLO_11_02 " );	// We are the last paladins left here in the castle. All the rest left or fell on the battlefield.
	AI_Output(self,other, " DIA_Oric_HALLO_11_03 " );	// It is our duty to make this expedition a success. And we will achieve this. I swear by Innos - we will achieve this.
};


instance DIA_Oric_Bruder(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_Bruder_Condition;
	information = DIA_Oric_Bruder_Info;
	permanent = FALSE;
	description = " I have a message for you. " ;
};


func int DIA_Any_Bruder_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Jergan_Burg ) && Npc_KnowsInfo ( other , DIA_Oric_HALLO ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Oric_Bruder_Info()
{
	AI_Output(other,self, " DIA_Oric_Bruder_15_00 " );	// I have news for you.
	AI_Output(self,other, " DIA_Oric_Bruder_11_01 " );	// What's the news?
	AI_Output(other,self, " DIA_Oric_Bruder_15_02 " );	// Your brother is dead. He died at the Passage.
	AI_Output(self,other, " DIA_Oric_Bruder_11_03 " );	// (mumbles)... my brother...
	AI_Output(self,other, " DIA_Oric_Bruder_11_04 " );	// Innos puts me to the test. But he died as his servant...
	AI_Output(self,other, " DIA_Oric_Bruder_11_05 " );	// This news is an arrow that pierced my heart. I will seek new strength in prayers.
	OricBruder = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

instance DIA_Oric_Statue(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_Statue_Condition;
	information = DIA_Oric_Statue_Info;
	permanent = FALSE;
	description = " You look a little depressed. " ;
};

func int DIA_Oric_Statue_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Oric_HELLO ) && ( CAPITALCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Oric_Statue_Info()
{
	AI_Output(other,self, " DIA_Oric_Statue_01_00 " );	// You look a little depressed.
	AI_Output(self,other, " DIA_Oric_Statue_01_01 " );	// (grimly) Is it really that noticeable?
	AI_Output(other,self, " DIA_Oric_Statue_01_02 " );	// More than. Is something bothering you?
	AI_Output(self,other, " DIA_Oric_Statue_01_03 " );	// Yes, how to say? Everything would be fine, but unfortunately in this castle there was not a single statue of Innos.
	AI_Output(other,self, " DIA_Oric_Statue_01_04 " );	// So what? After all, this is the castle of the ore barons, and it is unlikely that they cared about their souls.
	AI_Output(self,other, " DIA_Oric_Statue_01_05 " );	// Like what? I'm a paladin! And every day I should praise him in my prayers.
	AI_Output(self,other, " DIA_Oric_Statue_01_06 " );	// All this fills my soul with stamina and my body with strength.
	AI_Output(self,other, " DIA_Oric_Statue_01_07 " );	// And in this cursed castle there wasn't even a small statuette of our lord!
	MIS_OricStatue = LOG_Running;
	Log_CreateTopic(TOPIC_OricStatue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_OricStatue,LOG_Running);
	B_LogEntry(TOPIC_OricStatue, " Paladin Oric is depressed that there are no statues of Innos in the castle, and because of this he cannot pray. " );
};

instance DIA_Oric_Statue_Done(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_Statue_Done_Condition;
	information = DIA_Oric_Statue_Done_Info;
	permanent = FALSE;
	description = " Here's a statue of Innos. " ;
};

func int DIA_Oric_Statue_Done_Condition()
{
	if ((MY_OricStatue == LOG_Running) && (Npc_HasItems(other,ItMy_InnosStatue) >=  1 ) && ( CAPITALORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Oric_Statue_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Oric_Statue_Done_01_00 " );	// Here's a statuette of Innos.
	B_GiveInvItems(other,self,ItMi_InnosStatue,1);
	AI_Output(self,other, " DIA_Oric_Statue_Done_01_01 " );	// Oh! It really is her! Prayers must be continued immediately, otherwise Innos will turn his back on me.
	AI_Output(self,other, " DIA_Oric_Statue_Done_01_03 " );	// Ah, sorry! Thank you. You just don't realize how important this is to me.
	AI_Output(other,self, " DIA_Oric_Statue_Done_01_04 " );	// You can already see it.
	MIS_OricStatue = LOG_Success;
	Log_SetTopicStatus(TOPIC_OricStatue,LOG_Success);
	B_LogEntry(TOPIC_OricStatue, " I got the statuette of Innos for the paladin Oric. He was just happy. " );
};

instance DIA_Oric_ScoutMine(C_Info)
{
	npc = PAL_251_Oric;
	nr = 1;
	condition = DIA_Oric_ScoutMine_Condition;
	information = DIA_Oric_ScoutMine_Info;
	permanent = FALSE;
	description = " I'm going to the mines. " ;
};

func int DIA_Oric_ScoutMine_Condition()
{
	if ((MY_ScoutMine == LOG_Running) && (Chapter <  3 ) && Npc_KnowsInfo(other,DIA_Oric_HALLO) && (Fajeth_Ore ==  FALSE ) && (Marcos_Ore ==  FALSE ) && (Silvestro_Ore ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Oric_ScoutMine_Info()
{
	AI_Output(other,self, " DIA_Oric_ScoutMine_15_00 " );	// I'm going to the mines.
	AI_Output(self,other, " DIA_Oric_ScoutMine_11_01 " );	// Be careful. This is not an easy task. First of all, find the paladins. They lead these three groups.
	AI_Output(self,other, " DIA_Oric_ScoutMine_11_02 " );	// If you need more information, talk to Parzival.
};


instance DIA_Oric_Perm(C_Info)
{
	npc = PAL_251_Oric;
	nr = 99;
	condition = DIA_Any_Perm_Condition;
	information = DIA_Oric_Perm_Info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int DIA_Any_Perm_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Oric_HELLO ) && ( Capital <=  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Oric_Perm_Info()
{
	AI_Output(other,self, " DIA_Oric_Perm_15_00 " );	// How are things?
	if(MIS_ScoutMine == LOG_Running)
	{
		AI_Output(self,other, " DIA_Oric_Perm_11_01 " );	// You must find the miners and find out how much ore they have. And there it will be seen how and when we can leave this valley.
	}
	else if(MIS_ScoutMine == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Oric_Perm_11_02 " );	// The situation has heated up to the limit. But we won't back down. Innos is always with us. He will lead us out of this valley.
	}
	else
	{
		AI_Output(self,other, " DIA_Oric_Perm_11_03 " );	// Your presence here gives us hope.
		AI_Output(self,other, " DIA_Oric_Perm_11_04 " );	// We need you. Go talk to Garond - he will explain everything to you.
	};
};


instance DIA_Oric_KAP3_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP3_EXIT_Condition;
	information = DIA_Oric_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_KAP4_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP4_EXIT_Condition;
	information = DIA_Oric_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_IAmBack(C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Oric_IAmBack_Condition;
	information = DIA_Oric_IAmBack_Info;
	description = " I'm already back. " ;
};


func int DIA_Oric_IAmBack_Condition()
{
	if ((Capital >=  4 ) && Npc_KnowsInfo(other,DIA_Oric_HELLO) && ( CAPITALORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Oric_IAmBack_Info()
{
	AI_Output(other,self, " DIA_Oric_IAmBack_15_00 " );	// I'm already back.
	AI_Output(self,other, " DIA_Oric_IAmBack_11_01 " );	// I didn't hope we'd ever see you again after what happened when you were here a few days ago.
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Oric_IAmBack_11_02 " );	// I greet you on behalf of our order.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Oric_IAmBack_11_03 " );	// I see you've become a mage. My regards.
	};
	AI_Output(self,other, " DIA_Oric_IAmBack_11_04 " );	// Perhaps your appearance is a good sign.
};


instance DIA_Oric_CanHelp (C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = DIA_Any_CanHelp_Condition;
	information = DIA_Oric_CanHelp_Info;
	description = " Is there anything I can help you with? " ;
};


func int DIA_Any_CanHelp_Condition()
{
	if ((Capitol >=  4 ) && Npc_KnowsInfo(other,DIA_Oric_IAmBack) && (MIS_KillHoshPak ==  FALSE ) && ( CAPITELORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Any_CanHelp_Info()
{
	AI_Output(other,self, " DIA_Oric_CanHelp_15_00 " );	// Is there anything I can do to help?
	AI_Output(self,other, " DIA_Oric_CanHelp_11_01 " );	// At the moment, it looks like we've done everything we can.
	AI_Output(self,other, " DIA_Oric_CanHelp_11_02 " );	// However, there is something. Something very important that you could do for us outside of these walls.
	AI_Output(self,other, " DIA_Oric_CanHelp_11_03 " );	// We plan to cut off the snake's head.
	Info_ClearChoices(DIA_Oric_CanHelp);
	Info_AddChoice(DIA_Oric_CanHelp, " I think you better look for someone else. " ,DIA_Oric_CanHelp_NotYourMan);
	Info_AddChoice(DIA_Oric_CanHelp, " What do you mean by that? " ,DIA_Oric_CanHelp_WhatYouMean);
};

func void DIA_Any_CanHelp_NotYourMan()
{
	AI_Output(other,self, " DIA_Oric_CanHelp_NotYourMan_15_00 " );	// I think you better look for someone else.
	AI_Output(self,other, " DIA_Oric_CanHelp_NotYourMan_11_01 " );	// I can't single out a single person - you're our only hope.
};

func void DIA_Any_CanHelp_WhatYouMean()
{
	AI_Output(other,self, " DIA_Oric_CanHelp_WhatYouMean_15_00 " );	// What do you mean by this?
	AI_Output(self,other, " DIA_Oric_CanHelp_WhatYouMean_11_01 " );	// We know one of their leaders. His name is Hosh-Pak.
	AI_Output(self,other, " DIA_Oric_CanHelp_WhatYouMean_11_02 " );	// He is one of the most powerful orc shamans.
	AI_Output(other,self, " DIA_Oric_CanHelp_WhatYouMean_15_03 " );	// What is my role in this?
	AI_Output(self,other,"DIA_Oric_CanHelp_WhatYouMean_11_04");	//Убей его.
	AI_Output(other,self,"DIA_Oric_CanHelp_WhatYouMean_15_05");	//Ты шутишь!?
	if(hero.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_Oric_CanHelp_WhatYouMean_11_06 " );	// You're the only one we can single out for this case. All other knights are needed here.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Oric_CanHelp_WhatYouMean_11_07 " );	// It's not easy for me to ask you this, master. But you are perfect for this job.
	}
	else
	{
		AI_Output(self,other, " DIA_Oric_CanHelp_WhatYouMean_11_08 " );	// You want to help us, don't you? Well then...
	};
	AI_Output(self,other, " DIA_Oric_CanHelp_WhatYouMean_11_09 " );	// Hosh-Pak's tent is behind the siege ring, on a bluff south of here.
	AI_Output(self,other, " DIA_Oric_CanHelp_WhatYouMean_11_10 " );	// You can even see it from these windows.
	Info_ClearChoices(DIA_Oric_CanHelp);
	OrikToldMissionChapter4 = TRUE;
};


instance DIA_Oric_NeedStuff(C_Info)
{
	npc = PAL_251_Oric;
	nr = 6;
	condition = DIA_Oric_NeedStuff_Condition;
	information = DIA_Oric_NeedStuff_Info;
	description = " I need equipment. " ;
};


func int DIA_Oric_NeedStuff_Condition()
{
	if ((OrikToldMissionChapter4 ==  TRUE ) && (MY_KillConsciousnessPack ==  FALSE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Oric_NeedStuff_Info()
{
	AI_Output(other,self, " DIA_Oric_NeedStuff_15_00 " );	// I need gear.
	AI_Output(self,other, " DIA_Oric_NeedStuff_11_01 " );	// We don't have much left to share with you.
	AI_Output(self,other, " DIA_Oric_NeedStuff_11_02 " );	// Well, I can offer you this.
	Info_ClearChoices(DIA_Oric_NeedStuff);
	Info_AddChoice(DIA_Oric_NeedStuff, " or 1 Elixir of Agility " ,DIA_Oric_NeedStuff_Dexterity);
	Info_AddChoice(DIA_Oric_NeedStuff, " or 1 elixir of strength " ,DIA_Oric_NeedStuff_Strength);
	Info_AddChoice(DIA_Oric_NeedStuff, " or 3 mana elixirs " ,DIA_Oric_NeedStuff_Mana);
	Info_AddChoice(DIA_Oric_NeedStuff, " 3 Heal Potions " ,DIA_Oric_NeedStuff_Health);
};

func void DIA_Oric_NeedStuff_Health()
{
	AI_Output(other,self, " DIA_Oric_NeedStuff_Health_15_00 " );	// I'll take these healing potions.
	AI_Output(self,other, " DIA_Oric_NeedStuff_Health_11_01 " );	// Good choice. Hope they help you.
	CreateInvItems(self,ItPo_Health_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Mana()
{
	AI_Output(other,self, " DIA_Oric_NeedStuff_Mana_15_00 " );	// I'll take these mana potions.
	AI_Output(self,other, " DIA_Oric_NeedStuff_Mana_11_01 " );	// I hope they help you. May Innos keep you.
	CreateInvItems(self,ItPo_Mana_03,3);
	B_GiveInvItems(self,other,ItPo_Health_03,3);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Strength()
{
	AI_Output(other,self, " DIA_Oric_NeedStuff_Strength_15_00 " );	// I'll take the elixir of strength.
	AI_Output(self,other, " DIA_Oric_NeedStuff_Strength_11_01 " );	// Here, it will surely come in handy for you. Good luck.
	CreateInvItems(self,ItPo_Perm_STR,1);
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};

func void DIA_Oric_NeedStuff_Dexterity()
{
	AI_Output(other,self, " DIA_Oric_NeedStuff_Dexterity_15_00 " );	// I'll take the elixir of dexterity.
	AI_Output(self,other, " DIA_Oric_NeedStuff_Dexterity_11_01 " );	// May your arrows always fly right on target. Here you are.
	CreateInvItems(self,ItPo_Perm_DEX,1);
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	Info_ClearChoices(DIA_Oric_NeedStuff);
};


instance DIA_Oric_NoMurder (C_Info)
{
	npc = PAL_251_Oric;
	nr = 7;
	condition = DIA_Oric_NoMurder_Condition;
	information = DIA_Oric_NoMurder_Info;
	description = " I won't kill Hosh Pak in such a mean way. " ;
};


func int DIA_Oric_NoMurder_Condition()
{
	if ((OrikToldMissionChapter4 ==  TRUE ) && (MY_KillConsciousnessPack ==  FALSE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Oric_NoMurder_Info()
{
	AI_Output(other,self, " DIA_Oric_NoMurder_15_00 " );	// I won't kill Hosh Pak in such a mean way.
	AI_Output(self,other, " DIA_Oric_NoMurder_11_01 " );	// Do you have any idea how difficult our situation is?
	AI_Output(self,other, " DIA_Oric_NoMurder_11_02 " );	// We're under siege by overwhelming orc forces. Our stocks are running low.
	AI_Output(self,other, " DIA_Oric_NoMurder_11_03 " );	// If we can't get this ore to the ship, the orcs will turn our entire kingdom into ruins.
	AI_Output(self,other, " DIA_Oric_NoMurder_11_04 " );	// Everything we live for will go to waste.
};


instance DIA_Oric_WillHelp(C_Info)
{
	npc = PAL_251_Oric;
	nr = 5;
	condition = DIA_Oric_WillHelp_Condition;
	information = DIA_Oric_WillHelp_Info;
	permanent = FALSE;
	description = " Okay. I'll kill Hosh Pak. " ;
};


func int DIA_Any_WillHelp_Condition()
{
	if ((OrikToldMissionChapter4 ==  TRUE ) && (MY_KillConsciousnessPack ==  FALSE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Oric_WillHelp_Info()
{
	AI_Output(other,self, " DIA_Oric_WillHelp_15_00 " );	// Good! I will kill Hosh-Pak.
	AI_Output(self,other, " DIA_Oric_WillHelp_11_01 " );	// I'm glad to hear that.
	AI_Output(self,other, " DIA_Oric_WillHelp_11_02 " );	// Hosh-Pak's tent is on a small cliff. You must have seen him before.
	AI_Output(self,other, " DIA_Oric_WillHelp_11_03 " );	// This cliff is not far from the road leading to our mine. In the shadow of a huge mountain.
	Log_CreateTopic(TOPIC_KillHoshPak,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KillHoshPak,LOG_Running);
	B_LogEntry(TOPIC_KillHoshPak, " Orik wants me to kill the Orc shaman Hosh Pak. His tent is on a small cliff near the back of the castle. " );
	MIS_KillHoshPak = LOG_Running;
};


instance DIA_ORIC_CANHELPAGAIN (C_Info)
{
	npc = PAL_251_Oric;
	nr = 4;
	condition = dia_oric_canhelpagain_condition;
	information = dia_oric_canhelpagain_info;
	permanent = FALSE;
	description = " Do you have any other ideas? " ;
};


func int dia_oric_canhelpagain_condition()
{
	if (( CAPITALORCATC  ==  FALSE ) && ( MY_KillConsciousnessPack ==  LOG_SUCCESS ))
	{
		return TRUE;
	};
};

func void dia_oric_canhelpagain_info()
{
	AI_Output(other,self, " DIA_Oric_CanHelpAgain_01_00 " );	// Do you have any errands for me?
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_01_01 " );	// Yes. However, I believe that only a complete madman is capable of this.
	AI_Output(other,self, " DIA_Oric_CanHelpAgain_01_02 " );	// Great! What is it?
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_01_04 " );	// (chuckle) As far as I know, there are several orc warlords stationed near the castle.
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_01_05 " );	// As long as Hosh-Pak was alive, they obeyed him. Now the reins of government of this shaggy mob that besieges the castle are in their hands.
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_01_09 " );	// It would be nice if they met the same fate as their leader.
	Info_ClearChoices(dia_oric_canhelpagain);
	Info_AddChoice(dia_oric_canhelpagain, " It's too risky! " ,dia_oric_canhelp_nosorry);
	Info_AddChoice(dia_oric_canhelpagain, " The idea is really good, but crazy. " ,dia_oric_canhelpagain_stuff);
};

func void dia_oric_canhelp_nosorry()
{
	AI_Output(other,self, " DIA_Oric_CanHelp_NoSorry_01_01 " );	// It's too risky! I disagree.
	AI_Output(self,other, " DIA_Oric_CanHelp_NoSorry_01_02 " );	// Hmmm. Well, it's your decision.
	AI_Output(self,other, " DIA_Oric_CanHelp_NoSorry_01_05 " );	// (with a sad smile) We'll have to look for a bigger madman. Although it is unlikely that someone more zealous than you will show up here, but let's leave it.
	Info_ClearChoices(dia_oric_canhelpagain);
};

func void dia_oric_canhelpagain_stuff()
{
	AI_Output(other,self, " DIA_Oric_CanHelpAgain_Stuff_01_01 " );	// The idea is really good, if crazy.
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_Stuff_01_02 " );	// So you agree?
	AI_Output(other,self, " DIA_Oric_CanHelpAgain_Stuff_01_03 " );	// Of course. However, as you yourself understand, it will be extremely difficult to do this.
	if(other.guild == GIL_DJG)
	{
		AI_Output(other,self, " DIA_Oric_CanHelpAgain_Stuff_01_04 " );	// I think I'll need equipment, not to mention gold.
		AI_Output(self,other, " DIA_Oric_CanHelpAgain_Stuff_01_05 " );	// Don't worry about gold. You will get it.
	}
	else
	{
		AI_Output(other,self, " DIA_Oric_CanHelpAgain_Stuff_01_06 " );	// I think I'll need gear.
		AI_Output(self,other, " DIA_Oric_CanHelpAgain_Stuff_01_07 " );	// Great, friend! I knew that I could rely on you.
	};
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_Stuff_01_08 " );	// As for equipment, here... (sadly) These are our last supplies.
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_Stuff_01_09 " );	// Take what you need most.
	MIS_KILLOCELITE = LOG_Running;
	Log_CreateTopic(TOPIC_KILLOCELITE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KILLOCELITE,LOG_Running);
	B_LogEntry( TOPIC_KILLOCELITE , " Paladin Orik wants me to kill four orc warlords stationed near the castle. " );
	Info_ClearChoices(dia_oric_canhelpagain);
	Info_AddChoice(dia_oric_canhelpagain, " Get Elixir of Agility. " ,dia_oric_canhelpagain_dexterity);
	Info_AddChoice(dia_oric_canhelpagain, " Get potion of strength. " ,dia_oric_canhelpagain_strength);
	Info_AddChoice(dia_oric_canhelpagain, " Take Spirit Elixir. " ,dia_oric_canhelpagain_mana);
	Info_AddChoice(dia_oric_canhelpagain, " Take the elixir of life. " ,dia_oric_canhelpagain_health);
};

func void dia_oric_canhelpagain_health()
{
	AI_Output(other,self, " DIA_Oric_CanHelpAgain_Health_15_00 " );	// I take the elixir of life.
	CreateInvItems(self,ItPo_Perm_Health,1);
	B_GiveInvItems(self,other,ItPo_Perm_Health,1);
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_Health_11_01 " );	// Good choice! First of all, you must survive this difficult mission.
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_Health_11_02 " );	// Now go and let Innos protect you!
	AI_StopProcessInfos(self);
};

func void dia_oric_canhelpagain_mana()
{
	AI_Output(other,self, " DIA_Oric_CanHelpAgain_Mana_15_00 " );	// I take the spirit elixir.
	CreateInvItems(self,ItPo_Perm_Mana,1);
	B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_Mana_11_01 " );	// Good! Courage and heroism hold on to the fortress of the spirit, without which there is nowhere in battle ... although to whom do I tell?
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_Mana_11_02 " );	// May Innos not leave you without his support!
	AI_StopProcessInfos(self);
};

func void dia_oric_canhelpagain_dexterity()
{
	AI_Output(other,self, " DIA_Oric_CanHelpAgain_Dexterity_15_00 " );	// I take the elixir of dexterity.
	CreateInvItems(self,ItPo_Perm_DEX,1);
	B_GiveInvItems(self,other,ItPo_Perm_DEX,1);
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_Dexterity_11_01 " );	// Great! I feel that you have decided to strike the enemy leaders at a distance.
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_Dexterity_11_02 " );	// May Innos direct your arrows right on target!
	AI_StopProcessInfos(self);
};

func void dia_oric_canhelpagain_strength()
{
	AI_Output(other,self, " DIA_Oric_CanHelpAgain_Strength_15_00 " );	// I take the elixir of strength.
	CreateInvItems(self,ItPo_Perm_STR,1);
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_Strength_11_01 " );	// And rightly so! Orcs are strong, but the bearer of death to all of them must be stronger.
	AI_Output(self,other, " DIA_Oric_CanHelpAgain_Strength_11_02 " );	// May Innos protect you!
	AI_StopProcessInfos(self);
};


instance DIA_ORIC_WHEREFARROK(C_Info)
{
	npc = PAL_251_Oric;
	nr = 5;
	condition = dia_oric_wherefarrok_condition;
	information = dia_oric_wherefarrok_info;
	permanent = FALSE;
	description = " Where exactly are these warlords located? " ;
};


func int dia_oric_wherefarrok_condition()
{
	if (( MIS_KILLOCELITE  == LOG_Running ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_oric_wherefarrok_info()
{
	AI_Output(other,self, " DIA_Oric_WhereFarrok_11_00 " );	// Where are these orc warlords?
	AI_Output(self,other, " DIA_Oric_WhereFarrok_11_01 " );	// Sorry... (regretfully) But I'm not properly informed myself.
	AI_Output(self,other, " DIA_Oric_WhereFarrok_11_02 " );	// All I know is that there are only four of them. I don't know anything about their whereabouts.
	AI_Output(other,self, " DIA_Oric_WhereFarrok_11_03 " );	// Okay, I'll see what I can do.
};


instance DIA_ORIC_FARROKDEAD (C_Info)
{
	npc = PAL_251_Oric;
	nr = 8;
	condition = dia_oric_farrokdead_condition;
	information = dia_oric_farrokdead_info;
	permanent = FALSE;
	description = " The Orc Warlords are finished! " ;
};


func int dia_oric_farrokdead_condition()
{
	if (( MIS_KILLOCELITE  == LOG_Running ) && ( CAPITELORCATC  ==  FALSE ) && ( ELITEGENERALORICISDEAD_01  ==  TRUE ) && ( ELITEGENERALORICISDEAD_02  ==  TRUE ) && ( ELITEGENERALORICISDEAD_03  ==  TRUE ) && ( ELITEGENERALORICISDEAD_01  ==  TRUE )
	{
		return TRUE;
	};
};

func void dia_oric_farrokdead_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Oric_FarrokDead_01_00 " );	// The orc warlords are finished! They are all dead.
	AI_Output(self,other, " DIA_Oric_FarrokDead_01_01 " );	// Great! I knew you could make it.
	AI_Output(self,other, " DIA_Oric_FarrokDead_01_03 " );	// So, confusion and panic in the ranks of the orcs intensified.
	AI_Output(self,other, " DIA_Oric_FarrokDead_01_05 " );	// So, our chances of winning have also increased!
	MIS_KILLOCELITE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLOCELITE,LOG_SUCCESS);
	B_LogEntry( TOPIC_KILLOCELITE , " I have informed Orik that I have killed all the Ork warlords commanding the castle siege. " );
};


instance DIA_ORIC_ELITEPAY(C_Info)
{
	npc = PAL_251_Oric;
	nr = 8;
	condition = dia_oric_elitepay_condition;
	information = dia_oric_elitepay_info;
	permanent = FALSE;
	description = " What about my reward?! " ;
};


func int dia_oric_elitepay_condition()
{
	if (( MIS_KILLOCELITE  ==  LOG_SUCCESS ) && ( hero.guild ==  GIL_DJG ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_oric_elitepay_info()
{
	AI_Output(other,self, " DIA_Oric_ElitePay_15_00 " );	// What about my reward?
	AI_Output(self,other, " DIA_Oric_ElitePay_11_01 " );	// I can only give you a thousand gold pieces. I just don't have any more.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
};


instance DIA_Oric_HoshDead (C_Info)
{
	npc = PAL_251_Oric;
	nr = 8;
	condition = DIA_Oric_HoshDead_Condition;
	information = DIA_Oric_HoshDead_Info;
	permanent = FALSE;
	description = " Hosh Pak is dead! " ;
};


func int DIA_Any_HoshDead_Condition()
{
	if (Npc_IsDead(Conscious_Pack) && (MY_KillConsciousPack == LOG_Running) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Oric_HoshDead_Info()
{
	AI_Output(other,self, " DIA_Oric_HoshDead_15_00 " );	// Hosh-Pak is dead!
	AI_Output(self,other, " DIA_Oric_HoshDead_11_01 " );	// Great, this is sure to wreak havoc on the orcs. Maybe we still have some chance.
	AI_Output(self,other, " DIA_Oric_HoshDead_11_02 " );	// I think this will give us a break for at least a week.
	MIS_KillHoshPak = LOG_SUCCESS;
	B_GivePlayerXP(XP_KillHosh_Pak);
};


instance DIA_Any_AnyNews (C_Info)
{
	npc = PAL_251_Oric;
	nr = 9;
	condition = DIA_Any_AnyNews_Condition;
	information = DIA_Oric_AnyNews_Info;
	permanent = TRUE;
	description = " Any news? " ;
};


func int DIA_Any_AnyNews_Condition()
{
	if ((Capital >=  4 ) && Npc_KnowsInfo(other,DIA_Oric_IAmBack) && ( CAPITALORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Any_AnyNews_Info()
{
	AI_Output(other,self, " DIA_Oric_AnyNews_15_00 " );	// Any news?
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other, " DIA_Oric_AnyNews_11_01 " );	// You mean, besides the fact that the orcs invaded the castle?
	}
	else if(MIS_AllDragonsDead == TRUE)
	{
		AI_Output(self,other, " DIA_Oric_AnyNews_11_02 " );	// Yes. You are our hero. Destroying all the dragons at once is truly a heroic feat. I'm shocked!
	}
	else if(MIS_KillHoshPak == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Oric_AnyNews_11_03 " );	// Orcs seem to be unsettled by Hosh-Pak's death.
	}
	else
	{
		AI_Output(self,other, " DIA_Oric_AnyNews_11_04 " );	// Orcs are getting bigger and bigger. I do not like it.
	};
};


instance DIA_Oric_DragonPlettBericht(C_Info)
{
	npc = PAL_251_Oric;
	nr = 3;
	condition = DIA_Oric_DragonPlettBericht_Condition;
	information = DIA_Oric_DragonPlettBericht_Info;
	permanent = TRUE;
	description = " I need information about dragons. " ;
};


func int DIA_Oric_DragonPlettBericht_Condition()
{
	if ((Capitol >=  4 ) && Npc_KnowsInfo(other,DIA_Oric_IAmBack) && (MY_AllDragonsDead ==  FALSE ) && ( CAPITELORCATC  ==  FALSE )) ;
	{
		return TRUE;
	};
};


var int Oric_SwampdragonInfo_OneTime;
var int Any_RockdragonInfo_OneTime;
var int Oric_FiredragonInfo_OneTime;
var int Oric_IcedragonInfo_OneTime;
var int Any_DragonCounter;
var int Any_FirstQuestion;

func void DIA_Oric_DragonPlettBericht_Info()
{
	AI_Output(other,self, " DIA_Oric_DragonPlettBericht_15_00 " );	// I need information about dragons.
	if(MIS_KilledDragons == 1)
	{
		AI_Output(other,self, " DIA_Oric_DragonPlettBericht_15_01 " );	// I already killed one of them. Can you tell me where to look for others?
	}
	else if(MIS_KilledDragons != 0)
	{
		AI_Output(other,self, " DIA_Oric_DragonPlettBericht_15_02 " );	// I have a feeling I haven't found all the dragons yet. Maybe I missed something?
	};
	if(((Oric_DragonCounter < MIS_KilledDragons) || (Oric_FirstQuestion == FALSE)) && ((Oric_SwampdragonInfo_OneTime == FALSE) || (Oric_RockdragonInfo_OneTime == FALSE) || (Oric_FiredragonInfo_OneTime == FALSE) || (Oric_IcedragonInfo_OneTime == FALSE)))
	{
		if (( Npc_IsDead ( SwampDragon ) ==  FALSE ) && ( Oric_SwampDragonInfo_OneTime ==  FALSE ))
		{
			AI_Output(self,other, " DIA_Oric_DragonPlettBericht_11_03 " );	// A few days ago, a large swamp appeared to the west of our castle. That's pretty suspicious, don't you think?
			; _ _ _ _ _ _
			Oric_SwampdragonInfo_OneTime = TRUE;
		}
		else if((Npc_IsDead(RockDragon) == FALSE) && (Oric_RockdragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other, " DIA_Oric_DragonPlettBericht_11_04 " );	// To the south is a fortress in the rocks, far beyond the volcano.
			AI_Output(self,other, " DIA_Oric_DragonPlettBericht_11_05 " );	// Our scouts report that this fortress is heavily guarded. Maybe one of them is hiding there.
			B_LogEntry( TOPIC_DRACHENJAGD , " Paladin scouts have informed Orik that the fortress in the rocks behind the volcano to the south is heavily guarded. Orik suspects the dragon is there. " );
			Oric_RockdragonInfo_OneTime = TRUE;
		}
		else if((Npc_IsDead(FireDragon) == FALSE) && (Oric_FiredragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other, " DIA_Oric_DragonPlettBericht_11_06 " );	// After the last dragon attack, one of them is rumored to have flown in the direction of the volcano to the south. You should look for it there.
			B_LogEntry( TOPIC_DRACHENJAGD , " Apparently the last dragon to attack the castle in the Vale of Mines was seen near the volcano. " );
			Oric_FiredragonInfo_OneTime = TRUE;
		}
		else if((Npc_IsDead(IceDragon) == FALSE) && (Oric_IcedragonInfo_OneTime == FALSE))
		{
			AI_Output(self,other, " DIA_Oric_DragonPlettBericht_11_07 " );	// To the west is a vast icy valley. I wouldn't be surprised if one of the dragons is hiding there.
			B_LogEntry( TOPIC_DRACHENJAGD , " According to information from Orik, the snowy area to the west could be a dragon's lair. " );
			Oric_IcedragonInfo_OneTime = TRUE;
		};
		Oric_DragonCounter = MIS_KilledDragons;
		Oric_FirstQuestion = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Oric_DragonPlettBericht_11_08 " );	// I have nothing to say to you at the moment.
	};
};


instance DIA_Oric_KAP5_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP5_EXIT_Condition;
	information = DIA_Oric_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Oric_KAP6_EXIT(C_Info)
{
	npc = PAL_251_Oric;
	nr = 999;
	condition = DIA_Oric_KAP6_EXIT_Condition;
	information = DIA_Oric_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Oric_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Oric_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_ORIC_CAPTURED(C_Info)
{
	npc = PAL_251_Oric;
	nr = 2;
	condition = dia_oric_captured_condition;
	information = dia_oric_captured_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_oric_captured_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == TRUE) && (PALADINCASTELFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_oric_captured_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};



