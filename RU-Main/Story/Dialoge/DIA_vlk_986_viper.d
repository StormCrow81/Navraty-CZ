

instance DIA_VIPER_EXIT(C_Info)
{
	npc = vlk_986_viper;
	nr = 999;
	condition = dia_viper_exit_condition;
	information = dia_viper_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_viper_exit_condition()
{
	return TRUE;
};

func void dia_viper_exit_info()
{
	AI_StopProcessInfos(self);
};


DIA_VIPER_HALLO (C_Info) instances
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_hallo_condition;
	information = dia_viper_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_viper_hallo_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_viper_hallo_info()
{
	AI_Output(self,other, " DIA_Viper_HALLO_01_00 " );	// Hey man! Wait a minute... I know you!
	AI_Output(self,other, " DIA_Viper_HALLO_01_01 " );	// You're the crazy one who ran through all the caves in our mine, and then somehow killed the creeper queen.
	AI_Output(self,other, " DIA_Viper_HALLO_01_02 " );	// Sure, it's you!
	AI_Output(other,self, " DIA_Viper_HALLO_01_03 " );	// Are you a former miner? I don't remember you...
	AI_Output(self,other, " DIA_Viper_HALLO_01_04 " );	// You have a short memory, I see. I'm Viper, a former ore smelter at the Old Mine.
	AI_Output(other,self, " DIA_Viper_HALLO_01_05 " );	// Exactly! But wait... everyone died there. How did you manage to survive?
	AI_Output(self,other, " DIA_Viper_HALLO_01_06 " );	// Well... sit down, have a drink and talk.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other, " DIA_Viper_HALLO_01_07 " );	// You're right, everyone in the mine really died. Well, almost all...
	AI_Output(self,other, " DIA_Viper_HALLO_01_08 " );	// Snipes and Aleph are just as lucky as me! You must remember those guys.
	AI_Output(self,other, " DIA_Viper_HALLO_01_09 " );	// The first one constantly tried to harm the guards, and the second one tried to work as little as possible... (laughs)
	AI_Output(self,other, " DIA_Viper_HALLO_01_10 " );	// So, on that day, Jan, the head of the mine, was impatient to bring the ore to the surface in order to transport it to the old camp.
	AI_Output(self,other, " DIA_Viper_HALLO_01_11 " );	// I'd been promoted to head...
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other, " DIA_Viper_HALLO_01_13 " );	// ... and I took these two clowns to help. A couple of idiot guards.
	AI_Output(self,other, " DIA_Viper_HALLO_01_14 " );	// We climbed up with the ore and were almost at the exit of the mine.
	AI_Output(self,other, " DIA_Viper_HALLO_01_15 " );	// That is where it all started... No one even understood what was happening.
	AI_Output(self,other, " DIA_Viper_HALLO_01_16 " );	// There was a loud crack, and a roar of water. The collapse of the lower levels had begun!
	AI_Output(self,other, " DIA_Viper_HALLO_01_17 " );	// The guys and I rushed to the exit with all our strength. The guards did not keep up with us - they were ten steps away from us when a stone slab collapsed on them.
	AI_Output(self,other, " DIA_Viper_HALLO_01_18 " );	// Basically, it was all over in a matter of seconds. And we were left with the ore on the surface.
	AI_Output(self,other, " DIA_Viper_HALLO_01_21 " );	// Well... at first we hid in the forest - it was a bit scary for us to return to the Old Camp, so the guys and I decided to go to the people of Lares.
	AI_Output(self,other, " DIA_Viper_HALLO_01_22 " );	// But, having decided that it would be rather dangerous to appear there with such a pile of ore, we decided to simply hide it for a while.
	AI_Output(self,other, " DIA_Viper_HALLO_01_25 " );	// I stayed on watch to make sure no one was following us.
	AI_Output(self,other, " DIA_Viper_HALLO_01_26 " );	// Snipes and Aleph went to bury the ore. And shortly after that the barrier collapsed!
	AI_Output(self,other, " DIA_Viper_HALLO_01_27 " );	// After that - everything is foggy. When I woke up, there were orcs all around. Lots of orcs!
	AI_Output(self,other, " DIA_Viper_HALLO_01_28 " );	// I hid in a nearby cave. And then, having waited for a convenient moment, began to get my ass out of the valley.
	AI_Output(self,other, " DIA_Viper_HALLO_01_29 " );	// And here I am.
	AI_Output(other,self, " DIA_Viper_HALLO_01_30 " );	// What happened to Snipes and Aleph?
	AI_Output(self,other, " DIA_Viper_HALLO_01_31 " );	// I'd like to find out myself. More importantly - what happened to our ore.
	CreateInvItems(self,ItFo_Booze,1);
	B_UseItem(self,ItFo_Booze);
	AI_Output(self,other, " DIA_Viper_HALLO_01_34 " );	// It would be possible, of course, to look around, but you can’t even go into the valley - there are too many orcs!
	AI_Output(other,self, " DIA_Viper_HALLO_01_35 " );	// Where is this place?
	AI_Output(self,other, " DIA_Viper_HALLO_01_36 " );	// Ha! You greedy fool.
};


instance DIA_VIPER_HELP(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_help_condition;
	information = dia_viper_help_info;
	permanent = FALSE;
	description = " I can help you find the ore. " ;
};


func int dia_viper_help_condition()
{
	if(Npc_KnowsInfo(other,dia_viper_hallo))
	{
		return TRUE;
	};
};

func void dia_viper_help_info()
{
	AI_Output(other, self, " DIA_Viper_Help_01_00 " );	// I can help you find the ore. If, of course, you will share with me.
	AI_Output(self,other, " DIA_Viper_Help_01_01 " );	// You?! You are definitely nuts! (laughs) The orcs aren't even the worst of what that place has to offer!
	AI_Output(other,self, " DIA_Viper_Help_01_02 " );	// I'll deal with the orcs.
	AI_Output(self,other, " DIA_Viper_Help_01_03 " );	// Well, let's say I trust you.
	AI_Output(self,other, " DIA_Viper_Help_01_07 " );	// Okay, if you really want to help me with this, then...
	AI_Output(self,other, " DIA_Viper_Help_01_08 " );	// ...let's say you can count on...
	AI_Output(self,other, " DIA_Viper_Help_01_09 " );	// ...one hundred pieces of ore! Agree - it's a decent piece of the pot! What do you say?
	Info_AddChoice(dia_viper_help,"Да, по рукам!",dia_viper_help_ok);
	Info_AddChoice(dia_viper_help, " No. It's too small! " ,dia_viper_help_no);
};

func void dia_viper_help_ok()
{
	AI_Output(other,self, " DIA_Viper_Help_Ok_00 " );	// Deal!
	AI_Output(self,other, " DIA_Viper_Help_Ok_01 " );	// Well then, it is agreed! Eh... I hope I don't regret trusting you.
	AI_Output(other, self, " DIA_Viper_Help_Ok_03 " );	// Then tell me, where did you last see those guys?
	AI_Output(self,other, " DIA_Viper_Help_Ok_04 " );	// We parted near the bridge leading to the New Camp on the way from the Old Mine.
	AI_Output(self,other, " DIA_Viper_Help_Ok_07 " );	// Oh, one more thing... Maybe this will help you somehow.
	AI_Output(self,other, " DIA_Viper_Help_Ok_09 " );	// I heard that Lobart's farm has a new worker. His name seems to be the same as the name of one of my erstwhile buddies - Snipes.
	AI_Output(self,other, " DIA_Viper_Help_Ok_10 " );	// I don't really think that it could be him, but... anything is possible nowadays. Better check it out.
	Info_ClearChoices(dia_viper_help);
	Wld_InsertNpc(bau_987_snipes,"NW_FARM1_FIELD_05");
	MIS_VIPERNUGGETS = LOG_Running;
	Log_CreateTopic(TOPIC_VIPERNUGGETS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_VIPERNUGGETS,LOG_Running);
	B_LogEntry( TOPIC_VIPERNUGGETS , " In a Cardiff tavern, I met an old friend - Viper, a smelter from the Old Mine. He told me about what happened there and told me about his miraculous rescue with his comrades - Aleph and Snipes. They managed to take with them a lot of magic ore, though they never got a chance to spend it. What happened to the other two men, Viper does not know. " );
	B_LogEntry( TOPIC_VIPERNUGGETS , " I offered to help Viper find his ore if he shared with me. He agreed. The last time he saw the guys was near the bridge leading to the New Camp. He also said that recently a worker appeared on Lobart's farm, whose name is Snipes. If this is Viper's friend, then perhaps he will tell me exactly where to look for the ore. " );
};

func void dia_viper_help_no()
{
	AI_Output(other,self, " DIA_Viper_Help_No_00 " );	// No. It's too little!
	AI_Output(self,other, " DIA_Viper_Help_No_01 " );	// Greedy bastard.
	AI_Output(self,other, " DIA_Viper_Help_No_02 " );	// Sorry, but I can't offer you more than a hundred.
};


instance DIA_VIPER_HOW(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_how_condition;
	information = dia_viper_how_info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int dia_viper_how_condition()
{
	if (Npc_KnowsInfo(other,dia_viper_help) && ( MY_VIPERNUGGETS  ==  FALSE ) && ( VIPERRECRUITED  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_viper_how_info()
{
	AI_Output(other,self, " DIA_Viper_How_01_00 " );	// How are you, Viper? Are you dreaming about your lost treasure?
	AI_Output(self,other, " DIA_Viper_How_01_01 " );	// Are you still hanging around? Go away.
};


instance DIA_VIPER_GETTREASURE(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_gettreasure_condition;
	information = dia_viper_gettreasure_info;
	permanent = FALSE;
	description = " Hey Viper! Are you all sitting around doing nothing? " ;
};

func int dia_viper_gettreasure_condition()
{
	if((MIS_VIPERNUGGETS == LOG_Running) && (VIPERGETNUGGETS == FALSE) && (TALKTOALEF == TRUE))
	{
		if ((Npc_HasItems(other,ItMy_Nugget) >=  250 ) && ( MEETSNIPS  ==  FALSE ))
		{
			return TRUE;
		};
		if ((Npc_HasItems(other,ItMy_Nugget) >=  200 ) && ( MEETSNIPS  ==  TRUE )) ;
		{
			return TRUE;
		};
	};
};

func void dia_viper_gettreasure_info()
{
	AI_Output(other,self, " DIA_Viper_GetTreasure_01_00 " );	// Viper! Are you all sitting idle?
	AI_Output(self,other, " DIA_Viper_GetTreasure_01_01 " );	// We have to... What else is there to do?
	AI_Output(self,other, " DIA_Viper_GetTreasure_01_02 " );	// Well, what do you say? Did you find the ore?
	AI_Output(other,self, " DIA_Viper_GetTreasure_01_03 " );	// Don't worry so much!

	if(MEETSNIPS == TRUE)
	{
		AI_Output(other,self, " DIA_Viper_GetTreasure_01_04 " );	// Here, take this. Here's your two hundred grand. Now you can enjoy the rest of your life!
		B_GiveInvItems(other,self,ItMi_Nugget,200);
		Npc_RemoveInvItems(self,ItMi_Nugget,Npc_HasItems(self,ItMi_Nugget));
		AI_Output(self,other, " DIA_Viper_GetTreasure_01_05 " );	// I can't believe my eyes! I can finally live like a king. Thank you my friend!
		AI_Output(self,other, " DIA_Viper_GetTreasure_01_07 " );	// What about the rest?
		AI_Output(other,self, " DIA_Viper_GetTreasure_01_08 " );	// Aleph is much less fortunate than you and Snipes.
		AI_Output(other,self, " DIA_Viper_GetTreasure_01_09 " );	// He never got out of the valley - the orcs finished him off.
		AI_Output(self,other, " DIA_Viper_GetTreasure_01_10 " );	// Poor, poor Aleph... Who would have thought.
		AI_Output(other,self, " DIA_Viper_GetTreasure_01_11 " );	// I took his share for myself.
		AI_Output(self,other, " DIA_Viper_GetTreasure_01_12 " );	// Well, since Aleph is dead, then, I don't mind. After all, you honestly deserve it!

		if(SNIPSGETNUGGETS == TRUE)
		{
			B_GivePlayerXP(200);
			AI_Output(self,other, " DIA_Viper_GetTreasure_01_13 " );	// What about Snipes?
			AI_Output(other,self, " DIA_Viper_GetTreasure_01_14 " );	// Snipes also got his cut. And he wouldn't have to spend all day breaking his back on Lobart's farm.
			MIS_VIPERNUGGETS = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_VIPERNUGGETS,LOG_SUCCESS);
			B_LogEntry( TOPIC_VIPERNUGGETS , " I gave Viper his share. He was so happy he couldn't put it into words! " );
		}
		else
		{
			B_GivePlayerXP(100);
			AI_Output(self,other, " DIA_Viper_GetTreasure_01_15 " );	// Tell me, what about Snipes?
			AI_Output(other,self, " DIA_Viper_GetTreasure_01_16 " );	// I just wanted to give him his share. And he wouldn't have to spend all day breaking his back on Lobart's farm.
			B_LogEntry( TOPIC_VIPERNUGGETS , " I gave Viper his share. He was so happy that he couldn't put it into words! " );
		};
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(other,self, " DIA_Viper_GetTreasure_01_17 " );	// Here, take this. Here's your two hundred and fifty grand. Now you can enjoy life!
		B_GiveInvItems(other,self,ItMi_Nugget,250);
		Npc_RemoveInvItems(self,ItMi_Nugget,Npc_HasItems(self,ItMi_Nugget));
		AI_Output(self,other, " DIA_Viper_GetTreasure_01_18 " );	// I can't believe my eyes! I can finally live like a king. Thank you my friend!
		AI_Output(self,other, " DIA_Viper_GetTreasure_01_19 " );	// But wait! Why two hundred and fifty grand?
		AI_Output(other,self, " DIA_Viper_GetTreasure_01_20 " );	// I never found Snipes, and Aleph won't need the ore anymore.
		AI_Output(self,other, " DIA_Viper_GetTreasure_01_21 " );	// What do you mean by that?
		AI_Output(other,self, " DIA_Viper_GetTreasure_01_22 " );	// Aleph is much less fortunate than you.
		AI_Output(other,self, " DIA_Viper_GetTreasure_01_23 " );	// He never made it out of the valley. The orcs finished him off first.
		AI_Output(self,other, " DIA_Viper_GetTreasure_01_24 " );	// Poor, poor Aleph... (sadly) Who would have thought.
		AI_Output(other,self, " DIA_Viper_GetTreasure_01_25 " );	// I took his share for myself, and divided Snipes' share equally between us.
		MIS_VIPERNUGGETS = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_VIPERNUGGETS,LOG_SUCCESS);
		B_LogEntry( TOPIC_VIPERNUGGETS , " I gave Viper his share. He was so happy he couldn't put it into words! " );
	};
	AI_Output(self,other, " DIA_Viper_GetTreasure_01_27 " );	// Yes, you're right! I didn't doubt you! Thank you.
	VIPERGETNUGGETS = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_VIPER_HELLO(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_hello_condition;
	information = dia_viper_hello_info;
	permanent = TRUE;
	description = " Hey Viper! How are you? " ;
};


func int dia_viper_hello_condition()
{
	if((MIS_VIPERNUGGETS == LOG_Running) && (VIPERGETNUGGETS == FALSE))
	{
		return TRUE;
	};
};

func void dia_viper_hello_info()
{
	AI_Output(other,self, " DIA_Viper_Hello_01_00 " );	// Hey Viper! How are you?
	AI_Output(self,other, " DIA_Viper_Hello_01_01 " );	// Do something useful.
	AI_Output(self,other, " DIA_Viper_Hello_01_02 " );	// For example, looking for our ore!
};


instance DIA_VIPER_HELLOAFTER(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_helloafter_condition;
	information = dia_viper_helloafter_info;
	permanent = TRUE;
	description = " Hey Viper! How are you? " ;
};


func int dia_viper_helloafter_condition()
{
	if((MIS_VIPERNUGGETS == LOG_SUCCESS) && (VIPERRECRUITEDDT == FALSE))
	{
		return TRUE;
	};
};

func void dia_viper_helloafter_info()
{
	AI_Output(other,self, " DIA_Viper_HelloAfter_01_00 " );	// Hey Viper! How are you?
	AI_Output(self,other, " DIA_Viper_HelloAfter_01_01 " );	// Everything is great! Couldn't be better!
};


instance DIA_VIPER_MEETSNIPS(C_Info)
{
	npc = vlk_986_viper;
	nr = 1;
	condition = dia_viper_meetsnips_condition;
	information = dia_viper_meetsnips_info;
	permanent = FALSE;
	description = " I have news. " ;
};


func int dia_viper_meetsnips_condition()
{
	if(Npc_KnowsInfo(other,dia_snipes_hallo))
	{
		return TRUE;
	};
};

func void dia_viper_meetsnips_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Viper_MeetSnips_01_00 " );	// I have news.
	if(MEETSNIPS == TRUE)
	{
		AI_Output(other,self, " DIA_Viper_MeetSnips_01_04 " );	// That guy who recently got a job at Lobart's farm is your ex-buddy Snipes.
		AI_Output(other,self, " DIA_Viper_MeetSnips_01_06 " );	// But just like you, he doesn't know where the ore is.
		AI_Output(self,other,"DIA_Viper_MeetSnips_01_07");	//WHAT?
		AI_Output(other,self, " DIA_Viper_MeetSnips_01_08 " );	// He and Aleph found a cave where they decided to bury the ore. Snipes stayed outside while Aleph went inside.
		AI_Output(other,self, " DIA_Viper_MeetSnips_01_09 " );	// When the Barrier collapsed, rocks filled the entrance to the cave, and Snipes was hit on the head by a rock and passed out for a while.
		AI_Output(other,self, " DIA_Viper_MeetSnips_01_10 " );	// He then snuck out of the valley. And what happened to Aleph and the ore, he does not know.
		AI_Output(self,other, " DIA_Viper_MeetSnips_01_11 " );	// Shit... What to do now?
		AI_Output(other,self, " DIA_Viper_MeetSnips_01_12 " );	// Snipes gave me the approximate location of the cave where they wanted to bury the ore.
		AI_Output(self,other, " DIA_Viper_MeetSnips_01_14 " );	// Okay, please go there and look for Aleph.
		AI_Output(self,other, " DIA_Viper_MeetSnips_01_15 " );	// Keep me updated.
		B_LogEntry( TOPIC_VIPERNUGGETS , " Viper was glad to hear that Snipes was alive, but was very upset that he did not know where the ore was. Apparently, only Aleph can tell us exactly where the ore is buried. The search should start from the place where Snipes last saw Aleph. " );
	}
	else
	{
		AI_Output(other,self, " DIA_Viper_MeetSnips_01_18 " );	// The guy who recently got a job at Lobart's farm is not the Snipes we're looking for.
		AI_Output(self,other, " DIA_Viper_MeetSnips_01_20 " );	// And what do we do now?
		AI_Output(other,self, " DIA_Viper_MeetSnips_01_23 " );	// I think I'll have to visit the Valley of Mines.
		AI_Output(self,other, " DIA_Viper_MeetSnips_01_24 " );	// Okay, please go there and look for Aleph.
		AI_Output(self,other, " DIA_Viper_MeetSnips_01_25 " );	// Keep me updated.
		B_LogEntry( TOPIC_VIPERNUGGETS , " I told Viper that we were probably wrong in assuming that the guy at the Lobart farm is the same Snipes involved in the ore heist. Looks like only Aleph will be able to tell exactly where the ore is buried. Only where to look for him ?.. " );
	};
};

instance DIA_VIPER_PICKPOCKET(C_Info)
{
	npc = vlk_986_viper;
	nr = 900;
	condition = dia_viper_pickpocket_condition;
	information = dia_viper_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int dia_viper_pickpocket_condition()
{
	return  C_Robbery ( 15 , 25 );
};

func void dia_viper_pickpocket_info()
{
	Info_ClearChoices(dia_viper_pickpocket);
	Info_AddChoice(dia_viper_pickpocket,Dialog_Back,dia_viper_pickpocket_back);
	Info_AddChoice(dia_viper_pickpocket,DIALOG_PICKPOCKET,dia_viper_pickpocket_doit);
};

func void dia_viper_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(dia_viper_pickpocket);
};

func void dia_viper_pickpocket_back()
{
	Info_ClearChoices(dia_viper_pickpocket);
};

instance DIA_VIPER_HOWORELIQ(C_Info)
{
	npc = vlk_986_viper;
	nr = 4;
	condition = dia_viper_howoreliq_condition;
	information = dia_viper_howoreliq_info;
	permanent = FALSE;
	description = " Do you know who can teach you how to mine ore? " ;
};

func int dia_viper_howoreliq_condition()
{
	if(Npc_KnowsInfo(other,dia_viper_help) && (ABOUTSWBL == TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_howoreliq_info()
{
	AI_Output(other,self, " DIA_Viper_HOWORELIQ_01_00 " );	// Do you know who can teach how to mine ore?
	AI_Output(self,other, " DIA_Viper_HOWORELIQ_01_01 " );	// Snipes was pretty good at that...

	if(Npc_KnowsInfo(other,dia_snipes_hallo))
	{
		AI_Output(self,other, " DIA_Viper_HOWORELIQ_01_02 " );	// Yes, you already know...
	};

	AI_Output(other,self, " DIA_Viper_HOWORELIQ_01_03 " );	// And who knows how to smelt ore?
	AI_Output(self,other, " DIA_Viper_HOWORELIQ_01_04 " );	// Hmmm...(smugly) I was considered the best ore smelter in the Valley of Mines!
	AI_Output(self,other, " DIA_Viper_HOWORELIQ_01_05 " );	// And I could teach you. Not for free, of course!
	B_LogEntry( TOPIC_STEELDRAW , " Viper can teach me how to smelt ore, and Snipes can teach me how to mine it. " );
};

instance DIA_VIPER_HOWORELIQ2(C_Info)
{
	npc = vlk_986_viper;
	nr = 5;
	condition = dia_viper_howoreliq2_condition;
	information = dia_viper_howoreliq2_info;
	permanent = TRUE;
	description = " Teach me how to smelt iron ore. (Learning points: 3, Cost: 800 coins) " ;
};

func int dia_viper_howoreliq2_condition()
{
	if(Npc_KnowsInfo(other,dia_viper_howoreliq) && (KNOWHOWTOOREFUS != TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_howoreliq2_info()
{
	var int cost;
	var int money;
	AI_Output(other,self, " DIA_Viper_HOWORELIQ2_01_00 " );	// Teach me how to smelt iron ore.
	cost = 3 ;
	money = 800;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	}
	else if(Npc_HasItems(other,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_Viper_HOWORELIQ2_03_90 " );	// You don't have enough gold to train! Come back later.
		AI_StopProcessInfos(self);
	};

	if((hero.lp >= kosten) && (Npc_HasItems(other,ItMi_Gold) >= money))
	{
		AI_Output(self,other, " DIA_Viper_HOWORELIQ2_01_01 " );	// Things are simpler in a smelter, but a simple forge will do.
		AI_Output(self,other, " DIA_Viper_HOWORELIQ2_01_04 " );	// You need at least fifty pieces of ore. You heat them in the oven, and then pour them into a mold.
		AI_Output(self,other, " DIA_Viper_HOWORELIQ2_01_05 " );	// That's basics of smelting.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(other,ItMi_Gold,money);
		AI_Print( " Studied : ore smelting " );
		KNOWHOWTOOREFUS = TRUE;
		Snd_Play("LevelUP");
		B_LogEntry( TOPIC_STEELDRAW , " Now I can smelt iron ore into ingots. This requires a forge and fifty pieces of ore. " );
	};
};

instance DIA_VIPER_MAGICOREMAKE(C_Info)
{
	npc = vlk_986_viper;
	nr = 5;
	condition = dia_viper_MAGICOREMAKE_condition;
	information = dia_viper_MAGICOREMAKE_info;
	permanent = TRUE;
	description = " What about smelting magic ore? " ;
};

func int dia_viper_MAGICOREMAKE_condition()
{
	if(Npc_KnowsInfo(other,dia_viper_howoreliq) && (KNOWHOWTOOREFUS == TRUE) && (ViperTeachMagicOre == FALSE))
	{
		return TRUE;
	};
};

func void dia_viper_MAGICOREMAKE_info()
{
	AI_Output(other,self, " DIA_Viper_MAGICOREMAKE_01_01 " );	// What about smelting magic ore?

 	if((MIS_VIPERNUGGETS == LOG_SUCCESS) || (VIPERGETNUGGETS == TRUE))
	{
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_01_02 " );	// Hmmm... (thoughtfully) Now that is much more serious.
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_01_03 " );	// As far as I know, only the blacksmiths of Nordmar know the secret of making ingots from magic ore!
		AI_Output(other,self, " DIA_Viper_MAGICOREMAKE_01_04 " );	// Nordmar? Fuck.
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_01_05 " );	// But you're in luck. During the long years spent in the colony, I, too, was able to learn something useful.
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_01_06 " );	// No wonder everyone considered me the best smelter in the Valley of Mines!
		AI_Output(other,self, " DIA_Viper_MAGICOREMAKE_01_07 " );	// Can you teach me this?
		AI_Output(self,other,"DIA_Viper_MAGICOREMAKE_01_08");	//Of course.
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_01_09 " );	// I won't take gold from you for this. Let's call it a favour between friends.
		B_LogEntry( TOPIC_STEELDRAW , " Viper can teach me how to smelt magic ore. " );
		ViperTeachMagicOre = TRUE;
	}
	else if((MIS_VIPERNUGGETS == LOG_RUNNING) && (VIPERGETNUGGETS == FALSE))
	{
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_01_10 " );	// Deal with our ore first!
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_01_11 " );	// And then we will discuss this.
	}
	else
	{
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_01_12 " );	// I'm afraid I can't help you here yet.
	};
};

instance DIA_VIPER_MAGICOREMAKE_TEACH(C_Info)
{
	npc = vlk_986_viper;
	nr = 5;
	condition = dia_viper_MAGICOREMAKE_TEACH_condition;
	information = dia_viper_MAGICOREMAKE_TEACH_info;
	permanent = TRUE;
	description = " Teach me how to smelt magic ore. (Learning points: 10) " ;
};

func int dia_viper_MAGICOREMAKE_TEACH_condition()
{
	if((ViperTeachMagicOre == TRUE) && (PlayerRudoplav == FALSE))
	{
		return TRUE;
	};
};

func void dia_viper_MAGICOREMAKE_TEACH_info()
{
	var int cost;

	cost = 10 ;

	AI_Output(other,self, " DIA_Viper_MAGICOREMAKE_TEACH_01_00 " );	// Teach me how to smelt magic ore.

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		B_Say(self,other,"$NOLEARNNOPOINTS");
		AI_StopProcessInfos(self);
	};
	if(hero.lp >= kosten)
	{
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_TEACH_01_01 " );	// The process of smelting magic ore is quite complicated...
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_TEACH_01_02 " );	// A simple forge can only craft a normal ore ingot.
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_TEACH_01_03 " );	// I guess you'll need at least fifty pieces for this purpose.
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_TEACH_01_04 " );	// As for the manufacturing process itself, everything is done in stages.
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_TEACH_01_05 " );	// Slowly smelt the magic ore first. But not too slow!
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_TEACH_01_06 " );	// Then slowly evaporate various impurities from it. The longer the better, concentrate, focus on it...
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_TEACH_01_07 " );	// Then you pour the resulting alloy into the mold and slowly cool it.
		AI_Output(self,other, " DIA_Viper_MAGICOREMAKE_TEACH_01_08 " );	// That's all!
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		AI_Print( " Learned : Magic Ore Smelting " );
		PlayerRudoplav = TRUE;
		Snd_Play("LevelUP");

		if(ORE_TOPIC_EXIST != TRUE)
		{
			Log_CreateTopic(TOPIC_MAGICORE,LOG_NOTE);
			ORE_TOPIC_EXIST = TRUE;
		};

		B_LogEntry( TOPIC_MAGICORE , " Now I can smelt magic ore into ingots. It takes a forge and about fifty pieces of magic ore to make one ingot. " );
	};
};

instance DIA_VIPER_CLEARMAGICOREMAKE(C_Info)
{
	npc = vlk_986_viper;
	nr = 5;
	condition = dia_viper_CLEARMAGICOREMAKE_condition;
	information = dia_viper_CLEARMAGICOREMAKE_info;
	permanent = FALSE;
	description = " How do I get a CLEAR magic ore blank? " ;
};

func int dia_viper_CLEARMAGICOREMAKE_condition()
{
	if((KNOW_NIMROD_MAKE == TRUE) && (PlayerRudoplav == TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_CLEARMAGICOREMAKE_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self, " DIA_Viper_CLEARMAGICOREMAKE_01_01 " );	// And how do I get a CLEAR blank from magic ore?
	AI_Output(self,other, " DIA_Viper_CLEARMAGICOREMAKE_01_02 " );	// Making such a blank requires a much more complex approach.
	AI_Output(self,other, " DIA_Viper_CLEARMAGICOREMAKE_01_03 " );	// You'll need a special furnace where you don't have to constantly monitor the heat level of the ore.
	AI_Output(self,other, " DIA_Viper_CLEARMAGICOREMAKE_01_04 " );	// The most important thing in this process is to maintain a very high temperature and always at a certain level!
	AI_Output(self,other, " DIA_Viper_CLEARMAGICOREMAKE_01_05 " );	// I don't know if such smelters still exist on this island.
	AI_Output(self,other, " DIA_Viper_CLEARMAGICOREMAKE_01_06 " );	// But, I think that you will deal with this issue somehow yourself.
	AI_Output(self,other, " DIA_Viper_CLEARMAGICOREMAKE_01_07 " );	// In addition, to make such a blank, you need to have much more ore.
	AI_Output(other,self,"DIA_Viper_CLEARMAGICOREMAKE_01_08");	// How much?
	AI_Output(self,other, " DIA_Viper_CLEARMAGICOREMAKE_01_09 " );	// Approximately one hundred pieces of ore - no less...
	AI_Output(self,other, " DIA_Viper_CLEARMAGICOREMAKE_01_10 " );	// And it's best to work with a tool made from the same material as the blank itself.
	AI_Output(self,other, " DIA_Viper_CLEARMAGICOREMAKE_01_11 " );	// Otherwise, its magical properties may weaken, or even disappear.
	AI_Output(self,other, " DIA_Viper_CLEARMAGICOREMAKE_01_12 " );	// Otherwise, the manufacturing process is similar. The main thing is attentiveness and accuracy!
	AI_Output(other,self,"DIA_Viper_CLEARMAGICOREMAKE_01_13");	//I understand.
	ClearPlayerRudoplav = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap, " To make a PURE ore ingot, you need about a hundred pieces of ore, a special magic furnace and the same tool. " );
};

instance DIA_VIPER_ASKMINEDATA(C_Info)
{
	npc = vlk_986_viper;
	nr = 7;
	condition = dia_viper_askminedata_condition;
	information = dia_viper_askminedata_info;
	permanent = FALSE;
	description = " There is still some ore in the mine near Onar's farm. " ;
};

func int dia_viper_askminedata_condition()
{
	if((MIS_DTOLDNEWMINE == LOG_Running) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_askminedata_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_VIPER_AskMineData_01_01 " );	// I discovered that there is still magic ore in an abandoned mine near Onar's farm.
	AI_Output(other,self, " DIA_VIPER_AskMineData_01_02 " );	// Could you go there and see if you can mine something there?
	AI_Output(self,other, " DIA_VIPER_AskMineData_01_03 " );	// Ore? Here in Khorinis?
	AI_Output(other,self, " DIA_VIPER_AskMineData_01_04 " );	// That's it. I need to know if it's worth it for me to mine the ore, or if it's better to leave this venture.
	AI_Output(self,other, " DIA_VIPER_AskMineData_01_05 " );	// Okay, I don't have anything to do right now anyway. Let's go to your mine.
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMe");
};

instance DIA_VIPER_GETMINEDATA(C_Info)
{
	npc = vlk_986_viper;
	nr = 7;
	condition = dia_viper_getminedata_condition;
	information = dia_viper_getminedata_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_viper_getminedata_condition()
{
	if((MIS_DTOLDNEWMINE == LOG_Running) && (Npc_KnowsInfo(other,dia_viper_askminedata) == TRUE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_13") < 500) && (HURRAYICANHIRE == TRUE))
	{
		return TRUE;
	};
};

func void dia_viper_getminedata_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_VIPER_GetMineData_01_01 " );	// We're there.
	AI_Output(self,other, " DIA_VIPER_GetMineData_01_02 " );	// Is this the same mine? 
	AI_Output(other,self, " DIA_VIPER_GetMineData_01_03 " );	// What did you expect?
	AI_Output(self,other, " DIA_VIPER_GetMineData_01_05 " );	// Well, not like the Old Mine, of course, but still...
	AI_Output(other,self, " DIA_VIPER_GetMineData_01_06 " );	// Ahem.
	AI_Output(self,other, " DIA_VIPER_GetMineData_01_07 " );	// Oh, yes... Well, you can definitely get at least ten boxes from there.
	AI_Output(self,other, " DIA_VIPER_GetMineData_01_08 " );	// And if the veins go deeper - and, judging by their appearance, that is quite likely - then perhaps even more.
	AI_Output(self,other, " DIA_VIPER_GetMineData_01_09 " );	// In terms of quality, the ore here is no worse than in the Valley of Mines itself.
	AI_Output(self,other, " DIA_VIPER_GetMineData_01_10 " );	// All in all, I think you should give it a try.
	AI_Output(self,other, " DIA_VIPER_GetMineData_01_11 " );	// Only I'm wondering where you can find people who want to work in the mine now.
	AI_Output(other,self, " DIA_VIPER_GetMineData_01_02 " );	// What about you? Mining, of course, is not your specialty, but would you like to swing a pickaxe a bit?
	AI_Output(other,self, " DIA_VIPER_GetMineData_01_03 " );	// There are no crawlers there, the guards do not bother you, no one will force you to work all day long.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	SearchOreMine = TRUE;
	B_LogEntry( TOPIC_DTOLDNEWMINE , " Viper thinks that it is quite possible to pump out a lot of ore from this place. Which means that now I need experienced miners ... " );

	if(MIS_VIPERNUGGETS == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_VIPER_GetMineData_01_14 " );	// Why do I need all this? Now that you have returned the ore to me, I won't have to work again for a long time.
		Info_ClearChoices(DIA_VIPER_GetMineData);

		if(RhetorikSkillValue[1] >= 45)
		{
			Info_AddChoice(DIA_VIPER_GetMineData, " (try to convince) " ,DIA_VIPER_GetMineData_Yes);
		};

		Info_AddChoice(DIA_VIPER_GetMineData, " Ok, I'll try to find someone else. " ,DIA_VIPER_GetMineData_No);
	}
	else
	{
		B_GivePlayerXP(400);
		AI_Output(self,other, " DIA_VIPER_GetMineData_01_15 " );	// How much will you pay? And what about food and housing?
		AI_Output(other,self, " DIA_VIPER_GetMineData_15_16 " );	// You can take a third of the ore you mine as payment.
		AI_Output(other,self, " DIA_VIPER_GetMineData_15_17 " );	// You will live and eat here, in my tower. So what do you say?
		AI_Output(self,other, " DIA_VIPER_GetMineData_01_18 " );	// Sounds good. Ok, I agree.
		self.npcType = NPCTYPE_FRIEND;
		self.aivar[AIV_ToughGuy] = TRUE;
		self.aivar[AIV_IGNORE_Theft] = TRUE;
		self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
		self.aivar[AIV_IgnoresArmor] = TRUE ;
		VIPERRECRUITEDDT = TRUE;
	
		if(DT_OREGATHER_START == FALSE)
		{
			DT_OREGATHER_START = TRUE;
			EVERYDAYDTORE = Wld_GetDay();
		};
		
		B_LogEntry( TOPIC_PPL_FOR_TOWER , " I got Viper to work in my mine. " );
		B_LogEntry( TOPIC_DTOLDNEWMINE , " Viper agreed to work in the mine, but he won't get much ore on his own. More people need to be found. " );
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(self,"InTower");
	};
};

func void DIA_VIPER_GetMineData_yes()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_VIPER_GetMineData_yes_15_00 " );	// But sooner or later you still have to get back to work.
	AI_Output(other,self, " DIA_VIPER_GetMineData_yes_15_01 " );	// And where will you work then? Bouncer at Cardiff? Squirming on a farm?
	AI_Output(other,self, " DIA_VIPER_GetMineData_yes_15_02 " );	// Or will you return to the Valley of Mines?
	AI_Output(other,self, " DIA_VIPER_GetMineData_yes_15_03 " );	// You will always have time to spend your ore, but I offer you quite a tolerable job, free housing and food.
	AI_Output(other,self, " DIA_VIPER_GetMineData_yes_15_04 " );	// In addition, you can keep a third of the ore you mine.
	AI_Output(other,self, " DIA_VIPER_GetMineData_yes_15_05 " );	// Are you sure you want to refuse? There will be no second chance.
	AI_Output(self,other, " DIA_VIPER_GetMineData_yes_01_06 " );	// Wait, let me think...
	AI_Output(self,other, " DIA_VIPER_GetMineData_yes_01_10 " );	// Ahh, okay. As you wish. But a third of the ore is mine!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	VIPERRECRUITEDDT = TRUE;

	if(DT_OREGATHER_START == FALSE)
	{
		DT_OREGATHER_START = TRUE;
		EVERYDAYDTORE = Wld_GetDay();
	};

	B_LogEntry( TOPIC_PPL_FOR_TOWER , " I got Viper to work in my mine " );
	B_LogEntry( TOPIC_DTOLDNEWMINE , " Viper agreed to work in the mine, but he won't get much ore on his own. More people need to be found. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTower");
};

func void DIA_VIPER_GetMineData_no()
{
	AI_Output(other,self, " DIA_VIPER_GetMineData_no_15_00 " );	// Okay, I'll try to find someone else.
	AI_Output(self,other, " DIA_VIPER_GetMineData_no_01_01 " );	// Yeah, go on. Good luck searching.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_VIPER_INTOWER(C_Info)
{
	npc = vlk_986_viper;
	nr = 22;
	condition = dia_viper_intower_condition;
	information = dia_viper_intower_info;
	permanent = TRUE;
	description = " Hey Viper! How are you? " ;
};

func int dia_viper_intower_condition()
{
	if((VIPERRECRUITEDDT == TRUE) && (MIS_VIPERNUGGETS != LOG_Running))
	{
		return TRUE;
	};
};

func void dia_viper_intower_info()
{
	AI_Output(other,self, " DIA_Viper_HelloAfter_01_00 " );	// Hey Viper! How are you?
	AI_Output(self,other, " DIA_Viper_HelloAfter_01_01 " );	// Everything is great! You can't imagine better!
};
