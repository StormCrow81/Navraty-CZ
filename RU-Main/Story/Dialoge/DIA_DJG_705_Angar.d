
instance DIA_AngarDJG_EXIT(C_Info)
{
	npc = DJG_705_Angar;
	nr = 999;
	condition = DIA_AngarDJG_EXIT_Condition;
	information = DIA_AngarDJG_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_AngarDJG_EXIT_Condition()
{
	return TRUE;
};

func void DIA_AngarDJG_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_AngarDJG_HALLO (C_Info)
{
	npc = DJG_705_Angar;
	nr = 5;
	condition = DIA_AngarDJG_HALLO_Condition;
	information = DIA_AngarDJG_HALLO_Info;
	description = " Do I know you? " ;
};


func int DIA_AngarDJG_HALLO_Condition()
{
	return TRUE;
};

func void DIA_AngarDJG_HALLO_Info()
{
	AI_Output(other,self, " DIA_AngarDJG_HALLO_15_00 " );	// Do I know you? You are Kor Angar. You were a templar in a swamp camp.
	AI_Output(self,other, " DIA_AngarDJG_HALLO_04_01 " );	// (humbly) Just call me Angar. I have lost my title. The Brotherhood of the Sleeper is no more.
	AI_Output(self,other, " DIA_AngarDJG_HALLO_04_02 " );	// Funny, but I feel like I know you too. But I don't remember exactly where.
	AI_Output(other,self, " DIA_AngarDJG_HALLO_15_03 " );	// What's wrong with you?
	AI_Output(self,other, " DIA_AngarDJG_HALLO_04_04 " );	// Oh. I haven't been able to sleep well for a long time. Those constant nightmares...

	if(MIS_Dragonhunter == LOG_Running)
	{
		B_LogEntry(TOPIC_Dragonhunter, " I found the Hangar in the Mine Valley. " );
	};
};

func void B_SCTellsAngarAboutMadPsi()
{
	if ( Angar_KnowsMadPsi ==  FALSE )
	{
		AI_Output(other,self, " DIA_Angar_B_SCTellsAngarAboutMadPsi_15_00 " );	// The Brotherhood of the Sleeper has been enslaved by evil.
		AI_Output(other,self, " DIA_Angar_B_SCTellsAngarAboutMadPsi_15_01 " );	// Your former friends from the swamp camp have flooded the land dressed in black robes and are attacking anything that moves.
		AI_Output(self,other, " DIA_Angar_B_SCTellsAngarAboutMadPsi_04_02 " );	// What are you talking about?
	};
};

func void B_SCTellsAngarAboutMadPsi2()
{
	if ( Angar_KnowsMadPsi ==  FALSE )
	{
		AI_Output(other,self, " DIA_Angar_B_SCTellsAngarAboutMadPsi2_15_00 " );	// Now they serve the enemy and have become soulless warriors of evil.
		AI_Output(self,other, " DIA_Angar_B_SCTellsAngarAboutMadPsi2_04_01 " );	// Gods Almighty! And why was I so blind? This will never happen to me again, I swear.
		B_GivePlayerXP(XP_Angar_KnowsMadPsi);
		Angar_KnowsMadPsi = TRUE;
	};
};

func void b_sctellsangaraboutmadpsi3()
{
	AI_Output(other,self, " DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_00 " );	// Well, it's not all bad, of course!
	AI_Output(other,self, " DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_01 " );	// Those who did not succumb to the influence of dark forces remained.

	if(HEROKNOWFORESTBASE == TRUE)
	{
		AI_Output(other,self, " DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_02 " );	// Here in the Valley, I found a camp run by Netback. Do you remember him?
		AI_Output(other,self, " DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_03 " );	// There are also many of your former brothers. For example, Gor Na Bar, your student.
		AI_Output(self,other, " DIA_Angar_B_SCTellsAngarAboutMadPsi3_04_03 " );	// Go To Bar? I... I thought he died when the Old Mine collapsed!
		AI_Output(self,other, " DIA_Angar_B_SCTellsAngarAboutMadPsi3_04_04 " );	// I'm glad he survived. It's a good news!
		B_GivePlayerXP(50);
	};
	if(MIS_KORANGAR == LOG_Running)
	{
		AI_Output(other,self, " DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_04 " );	// In Khorinis, not far from the passage, there is a new camp of the Brotherhood!
		AI_Output(other,self, " DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_05 " );	// They are led by Idol Oran. There are many of those who used to live in the swamps.
		AI_Output(self,other, " DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_06 " );	// Does the Brotherhood of the Sleeper still exist?
		AI_Output(other,self, " DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_07 " );	// Yes, KOR ANGAR! And they all need a spiritual leader like you.
		AI_Output(other,self, " DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_08 " );	// True, now they no longer pray to the Sleeper. But their new faith is also strong.
		AI_Output(other,self, " DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_09 " );	// Idol Oran asked me to tell you about this if I meet. They really need you, Angar!
		AI_Output(self,other, " DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_10 " );	// I... I don't know if I can lead the Brotherhood again after everything that's happened... I need to think.
		AI_Output(other,self, " DIA_Angar_B_SCTellsAngarAboutMadPsi3_15_11 " );	// Think. And remember that your brothers are waiting for you and very much looking forward to your return.
		MIS_KORANGAR = LOG_SUCCESS ;
		Log_SetTopicStatus(TOPIC_KORANGARMEET,LOG_SUCCESS);
		B_LogEntry( TOPIC_KORANGARMEET , " I told Kor Angar about the Brotherhood camp in Khorinis and gave him a message from the Idol of Oran asking him to return to their camp. Kor Angar said he would think about it. " );
		B_GivePlayerXP(200);
	};
};


instance DIA_Angar_HOW ARE YOUHERE (C_Info)
{
	npc = DJG_705_Angar;
	nr = 6;
	condition = DIA_Angar_WIEKOMMSTDUHIERHER_Condition;
	information = DIA_Angar_HOW ARE YOUHERE_Info;
	description = " How did you get here? " ;
};


func int DIA_Angar_HOWARE YOUHERE_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Angar DJG_ HELLO ))
	{
		return TRUE;
	};
};

func void DIA_Angar_HOWARE YOUHERE_Info()
{
	AI_Output(other,self, " DIA_Angar_WIEKOMMSTDUHIERHER_15_00 " );	// How did you get here?
	if (chapter <  4 )
	{
		AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_04_01A " );	// After the fall of the magic barrier, I hid in the mountains. Then, when this forest appeared here, I came here.
		AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_04_01B " );	// And, in order to distract from nightmares and headaches, he started building this hut.
		AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_04_01C " );	// However, this did not bring me peace. I guess I'll go on - I can't sit here anymore.
	}
	else
	{
		AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_04_01D " );	// After the fall of the magical barrier, I hid in the mountains. Then he built himself a hut behind the fence of the orcs.
		AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_04_01E " );	// But I got tired of sitting there, and I went to the fortress, where at least something happens.
	};
	AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_04_03 " );	// And to make matters worse, I also lost the amulet that had been with me for years. I'll go crazy if I don't find it.
	Log_CreateTopic(TOPIC_AngarsAmulett,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AngarsAmulett,LOG_Running);
	B_LogEntry(TOPIC_AngarsAmulett, " Angar lost his amulet and hopes to find it again. " );
	Info_AddChoice(DIA_Angar_HOW ARE YOU HERE, Dialog_Back, DIA_Angar_HOW ARE YOU HERE_go);
	Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER, " And where exactly did you lose the amulet? " ,DIA_Angar_WIEKOMMSTDUHIERHER_amulett);
	if(SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER, " The Brotherhood of the Sleeper fell victim to evil. " ,DIA_Angar_WIEKOMMSTDUHIERHER_andere);
	}
	else
	{
		Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER, " What happened to the others at Swamp Camp? " ,DIA_Angar_WIEKOMMSTDUHIERHER_andere);
	};
	if (DJG_Angar_SentToStones ==  FALSE )
	{
		Info_AddChoice(DIA_Angar_WIEKOMMSTDUHIERHER, " What are you thinking of doing now? " ,DIA_Angar_WIEKOMMSTDUHIERHER_nun);
	};
};

func void DIA_Angar_HOWARE YOUHERE_amulet()
{
	AI_Output(other,self, " DIA_Angar_WIEKOMMSTDUHIERHER_amulett_15_00 " );	// Where exactly did you lose your amulet?

	if (DJG_Angar_SentToStones ==  FALSE )
	{
		AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_01 " );	// Somewhere in the south, shortly after I woke up in the castle.
		B_LogEntry(TOPIC_AngarsAmulett, " Angara's amulet must be somewhere to the south. Angara goes there to look for it. " );
	}
	else
	{
		AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_02 " );	// It must be in there somewhere.
		B_LogEntry(TOPIC_AngarsAmulett, " Angara's amulet is located somewhere near the old crypt in the rock in the south of the mine valley. " );
	};

	AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_amulett_04_03 " );	// I suspect it was stolen. I really need to get it back.
};

func void DIA_Angar_HOWARE YOUHERE_others()
{
	if(SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi();
	}
	else
	{
		AI_Output(other,self, " DIA_Angar_WIEKOMMSTDUHIERHER_andere_15_00 " );	// And what happened to the others from the swamp camp?
	};
	AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_01 " );	// The last thing I remember is the collapse of the Barrier, accompanied by a heart-rending scream.
	AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_02 " );	// We were seized with panic fear. We fell to the ground, writhing in pain. That voice... It got louder.
	AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_03 " );	// And then suddenly it was over, everyone ran like crazy and disappeared into the night, screaming in heart-rending voices.
	AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_andere_04_04 " );	// And I never saw them again.
	if(SC_KnowsMadPsi == TRUE)
	{
		B_SCTellsAngarAboutMadPsi2();
	};
	if((MIS_KORANGAR == LOG_Running) || (HEROKNOWFORESTBASE == TRUE))
	{
		b_sctellsangaraboutmadpsi3();
	};
};

func void DIA_Angar_HOWARE YOUHERE_nun()
{
	AI_Output(other,self, " DIA_Angar_WIEKOMMSTDUHIERHER_nun_15_00 " );	// What are you thinking of doing now?
	AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_01 " );	// I'll rest a bit first, and then continue my search for my amulet.
	if (Chapter >=  4 )
	{
		if(MIS_KORANGAR == LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_05 " );	// Then... maybe I really should go to my brothers?
			AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_06 " );	// The Brotherhood has been my home for many years, and it remains so to this day...
			AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_07 " );	// True, I haven't decided yet.
		}
		else
		{
			AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_02 " );	// I heard something about dragons.
			AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_03 " );	// It is also said that many warriors have come to the Valley of Mines, hunting them.
			AI_Output(self,other, " DIA_Angar_WIEKOMMSTDUHIERHER_nun_04_04 " );	// I'm thinking of joining them.
		};
	};
	Angar_willDJGwerden = TRUE ;
};

func void DIA_Angar_HOWARE YOUHERE_go_here()
{
	Info_ClearChoices(DIA_Angar_WIEKOMMSTDUHIERHER);
};


instance DIA_Angar_SCTellsAngarAboutMadPsi2(C_Info)
{
	npc = DJG_705_Angar;
	nr = 7;
	condition = DIA_Angar_SCTellsAngarAboutMadPsi2_Condition;
	information = DIA_Angar_SCTellsAngarAboutMadPsi2_Info;
	description = " The Brotherhood of the Sleeper has been enslaved by evil. " ;
};


func int DIA_Angar_SCTellsAngarAboutMadPsi2_Condition()
{
	if ((SC_KnowsMadPsi ==  TRUE ) && (Angar_KnowsMadPsi ==  FALSE ) && Npc_KnowsInfo(other,DIA_Angar_COMMITTED_INFO))
	{
		return TRUE;
	};
};

func void DIA_Angar_SCTellsAngarAboutMadPsi2_Info()
{
	B_SCTellsAngarAboutMadPsi();
	B_SCTellsAngarAboutMadPsi2();
};


instance DIA_Angar_FOUNDAMULETT(C_Info)
{
	npc = DJG_705_Angar;
	nr = 7;
	condition = DIA_Angar_FOUNDAMULETT_Condition;
	information = DIA_Angar_FOUNDAMULETT_Info;
	description = " I found your amulet. " ;
};


func int DIA_Angar_FOUNDAMULETT_Condition()
{
	if (Npc_HasItems(other,ItAm_Mana_Angar_MIS) && Npc_KnowsInfo(other,DIA_Angar_WIEKOMMSTDUHIER))
	{
		return TRUE;
	};
};

func void B_AngarsAmuletSend()
{
	AI_Output(other,self, " DIA_Angar_FOUNDAMULETT_15_00 " );	// I found your amulet.
	AI_Output(self,other, " DIA_Angar_FOUNDAMULETT_04_01 " );	// Thank you. I thought I would never see him again.
	B_GiveInvItems(other,self,ItAm_Mana_Angar_MIS,1);
	DJG_AngarGotAmulett = TRUE;
	B_GivePlayerXP(XP_AngarDJGUndeadMage);
};

func void DIA_Angar_FOUNDAMULETT_Info()
{
	B_AngarsAmuletSend();
	Info_AddChoice(DIA_Angar_FOUNDAMULETT, " Why is he so important to you? " ,DIA_Angar_FOUNDAMULETT_besonders);
	Info_AddChoice(DIA_Angar_FOUNDAMULETT, " What are you planning now? " ,DIA_Angar_FOUNDAMULETT_nun);
};

func void DIA_Angar_FOUNDAMULETT_besonders()
{
	AI_Output(other,self, " DIA_Angar_FOUNDAMULETT_besonders_15_00 " );	// Why is he so special?
	AI_Output(self,other, " DIA_Angar_FOUNDAMULETT_besonders_04_01 " );	// This is a gift.
	AI_Output(other,self,"DIA_Angar_FOUNDAMULETT_besonders_15_02");	//Понимаю.
};

func void DIA_Angar_FOUNDAMULETT_nun()
{
	AI_Output(other,self, " DIA_Angar_FOUNDAMULETT_nun_15_00 " );	// What are you planning now?
	if(MIS_KORANGAR == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_Angar_FOUNDAMULETT_nun_04_03 " );	// I decided to return to my brothers. I will not leave them in difficult times.
		AI_Output(self,other, " DIA_Angar_FOUNDAMULETT_nun_04_04 " );	// Maybe we'll meet again. Goodbye.
		ANGARISBACK = TRUE;
		AI_StopProcessInfos(self);
		if((Npc_GetDistToWP(self,"OC_TO_MAGE") < 1000) == FALSE)
		{
			Npc_ExchangeRoutine(self,"LeavingOW");
		};
	}
	else
	{
		ANGARISNOBACK = TRUE;
		AI_Output(self,other, " DIA_Angar_FOUNDAMULETT_nun_04_01 " );	// Get out of this cursed valley.
		AI_Output(self,other, " DIA_Angar_FOUNDAMULETT_nun_04_02 " );	// Maybe we'll meet again. Goodbye.
		AI_StopProcessInfos(self);
		if((Npc_GetDistToWP(self,"OC_TO_MAGE") < 1000) == FALSE)
		{
			Npc_ExchangeRoutine(self,"LeavingOW");
		};
	};
};


instance DIA_Angar_DJG_ANWERBEN (C_Info)
{
	npc = DJG_705_Angar;
	nr = 8;
	condition = DIA_Angar_DJG_ANWERBEN_Condition;
	information = DIA_Angar_DJG_ANWERBEN_Info;
	description = " Maybe I can help you find the amulet. " ;
};


func int DIA_Angar_DJG_ANWERBEN_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Angar_WIEKACCOMPLETIONSHERE) && (DJG_AngarGotAmulett ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Angar_DJG_ANWERBEN_Info()
{
	AI_Output(other,self, " DIA_Angar_DJG_ANWERBEN_15_00 " );	// Maybe I can help you find the amulet.
	AI_Output(self,other, " DIA_Angar_DJG_ANWERBEN_04_01 " );	// Why not. Help never hurts.
	if (DJG_Angar_SentToStones ==  FALSE )
	{
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN, " I have to go. " ,DIA_Angar_DJG_ANWERBEN_gehen);
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN, " Where will you look? " ,DIA_Angar_DJG_ANWERBEN_wo);
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN, " When are you going to go? " ,DIA_Angar_DJG_ANWERBEN_wann);
	};
	if((Angar_willDJGwerden == TRUE) && (Kapitel >= 4))
	{
		Info_AddChoice(DIA_Angar_DJG_ANWERBEN, " What's up with the dragon hunters? " ,DIA_Angar_DJG_ANWERBEN_DJG);
	};
};

func void DIA_Angar_DJG_ANWERBEN_DJG()
{
	AI_Output(other,self, " DIA_Angar_DJG_ANWERBEN_DJG_15_00 " );	// What about dragon hunters?
	AI_Output(self,other, " DIA_Angar_DJG_ANWERBEN_DJG_04_01 " );	// I'll talk to them later. Maybe they need a good warrior.
};

func void DIA_Angar_DJG_ANWERBEN_when()
{
	AI_Output(other,self, " DIA_Angar_DJG_ANWERBEN_wann_15_00 " );	// When are you leaving?
	AI_Output(self,other, " DIA_Angar_DJG_ANWERBEN_wann_04_01 " );	// The faster the better.
};

func void DIA_Angar_DJG_ANWERBEN_wo()
{
	AI_Output(other,self, " DIA_Angar_DJG_ANWERBEN_wo_15_00 " );	// Where are you going to look?
	AI_Output(self,other, " DIA_Angar_DJG_ANWERBEN_wo_04_01 " );	// I'll go south to where I lost it.
	AI_Output(self,other, " DIA_Angar_DJG_ANWERBEN_wo_04_02 " );	// There's a crypt in a cave surrounded by a bunch of boulders.
};

func void DIA_Angar_DJG_ANWERBEN_gehen()
{
	AI_Output(other,self, " DIA_Angar_DJG_ANWERBEN_gehen_15_00 " );	// I need to go.
	AI_Output(self,other, " DIA_Angar_DJG_ANWERBEN_gehen_04_01 " );	// Be careful.
	AI_StopProcessInfos(self);
};


instance DIA_AngarDJG_WASMACHSTDU (C_Info)
{
	npc = DJG_705_Angar;
	nr = 9;
	condition = DIA_AngarDJG_WASMACHSTDU_Condition;
	information = DIA_AngarDJG_WASMACHSTDU_Info;
	description = " Something wrong? " ;
};


func int DIA_AngarDJG_WASMACHSTDU_Condition()
{
	if((Npc_GetDistToWP(self,"OW_DJG_WATCH_STONEHENGE_01") < 8000) && Npc_KnowsInfo(other,DIA_Angar_DJG_ANWERBEN) && (DJG_AngarGotAmulett == FALSE))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_WASMACHSTDU_Info()
{
	AI_Output(other,self, " DIA_AngarDJG_WASMACHSTDU_15_00 " );	// Is something wrong?
	AI_Output(self,other, " DIA_AngarDJG_WASMACHSTDU_04_01 " );	// Do you hear that? I have never heard such a terrible noise in my life!
	AI_Output(other,self, " DIA_AngarDJG_WASMACHSTDU_15_02 " );	// What do you mean? I hear nothing!
	AI_Output(self,other, " DIA_AngarDJG_WASMACHSTDU_04_03 " );	// Everything here is saturated with death and destruction! Dirty creatures guard the entrance to the crypt in front of us.
	AI_Output(self,other, " DIA_AngarDJG_WASMACHSTDU_04_04 " );	// Some abomination lurks there. She sends her henchmen to the surface of this world.
	AI_Output(self,other, " DIA_AngarDJG_WASMACHSTDU_04_05 " );	// I'm pretty sure my amulet was lost around here somewhere.
	if((Angar_willDJGwerden == TRUE) && (MIS_KORANGAR != LOG_SUCCESS))
	{
		Info_AddChoice(DIA_AngarDJG_WASMACHSTDU, " Have you spoken to the dragon hunters? " ,DIA_AngarDJG_WASMACHSTDU_DJG);
	};
};

func void DIA_AngarDJG_WASMACHSTDU_DJG()
{
	AI_Output(other,self, " DIA_AngarDJG_WASMACHSTDU_DJG_15_00 " );	// Have you spoken to the dragon hunters?
	AI_Output(self,other, " DIA_AngarDJG_WASMACHSTDU_DJG_04_01 " );	// Yes. But I expected it to be a brotherhood like the one we had in the swamp camp.
	AI_Output(self,other, " DIA_AngarDJG_WASMACHSTDU_DJG_04_02 " );	// And these guys are just a wild motley crowd of idiots. I have nothing to do with them.
};


instance DIA_AngarDJG_WHATSINTHERE(C_Info)
{
	npc = DJG_705_Angar;
	nr = 10;
	condition = DIA_AngarDJG_WHATSINTHERE_Condition;
	information = DIA_AngarDJG_WHATSINTHERE_Info;
	description = " What is in the rock crypt? " ;
};


func int DIA_AngarDJG_WHATSINTHERE_Condition()
{
	if ( Npc_KnowsInfo ( other , DJG_WASMACHSTDU ) && ( DJ_Angar_GotAmulett ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_WHATSINTHERE_Info()
{
	AI_Output(other,self, " DIA_AngarDJG_WHATSINTHERE_15_00 " );	// What is hidden in this cave in the rocks?
	AI_Output(self,other, " DIA_AngarDJG_WHATSINTHERE_04_01 " );	// Something that won't let me get close to the entrance!
	AI_Output(self,other, " DIA_AngarDJG_WHATSINTHERE_04_02 " );	// It's guarded by a magical creature. I saw him at night, he was scouring here. A disgusting creature.
	AI_Output(self,other, " DIA_AngarDJG_WHATSINTHERE_04_03 " );	// He darted between the trees, and I had the impression that he was sucking all the life around and absorbing it like a sponge.
	B_LogEntry(TOPIC_Dragonhunter, " I found the Hangar in the Mine Valley. " );
};


instance DIA_AngarDJG_WANTTOGOINTHERE(C_Info)
{
	npc = DJG_705_Angar;
	nr = 11;
	condition = DIA_AngarDJG_WANTTOGOINTHERE_Condition;
	information = DIA_AngarDJG_WANTTOGOINTHERE_Info;
	description = " Let's go together. " ;
};


func int DIA_AngarDJG_WANTTOGOINTHERE_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_AngarDJG_WHATSINTHERE ) && ( DJG_AngarGotAmulett ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_WANTTOGOINTHERE_Info()
{
	AI_Output(other,self, " DIA_AngarDJG_WANTTOGOINTHERE_15_00 " );	// Let's go together.
	AI_Output(self,other, " DIA_AngarDJG_WANTTOGOINTHERE_04_01 " );	// I'll try. But you have to be careful.
	AI_StopProcessInfos(self);
	if (Npc_IsDead(SkeletonMage_Angar))
	{
		Npc_ExchangeRoutine(self,"Zwischenstop");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Angriff");
		DJG_AngarAngriff = TRUE;
	};
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
};


instance DIA_AngarDJG_UndeadMageDead(C_Info)
{
	npc = DJG_705_Angar;
	nr = 13;
	condition = DIA_AngarDJG_UndeadMageDead_Condition;
	information = DIA_AngarDJG_UndeadMageDead_Info;
	important = TRUE;
};


func int DIA_AngarDJG_UndeadMageDead_Condition()
{
	if((Npc_GetDistToWP(self,"OW_UNDEAD_DUNGEON_02") < 1000) && (DJG_AngarAngriff == TRUE) && (DJG_AngarGotAmulett == FALSE) && Npc_IsDead(SkeletonMage_Angar))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_UndeadMageDead_Info()
{
	AI_Output(self,other, " DIA_AngarDJG_UndeadMageDead_04_00 " );	// (breathing heavily) There's only death and destruction here. I have to get out of here.
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"RunToEntrance");
};


instance DIA_AngarDJG_UNDEADMAGECOMES(C_Info)
{
	npc = DJG_705_Angar;
	nr = 13;
	condition = DIA_AngarDJG_UNDEADMAGECOMES_Condition;
	information = DIA_AngarDJG_UNDEADMAGECOMES_Info;
	important = TRUE;
};


func int DIA_AngarDJG_UNDEADMAGECOMES_Condition()
{
	if ((Npc_GetDistToWP(self, " OW_PATH_3_13 " ) <  500 ) && Npc_KnowsInfo(other,DIA_AngarDJG_WANTTOGOINTHERE) && (Npc_KnowsInfo(other,DIA_AngarDJG_UndeadMageDead) ==  FALSE ) && (DJG_AngarGotAmulett ==  FALSE ) && Npc_IsDead(SkeletonMage_Angar))
	{
		return TRUE;
	};
};

func void DIA_AngarDJG_UNDEADMAGECOMES_Info()
{
	AI_Output(self,other, " DIA_AngarDJG_UNDEADMAGECOMES_04_00 " );	// (whispers) Here we go again! Do you hear it?
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GotoStonehendgeEntrance");
};


instance DIA_Angar_WASISTLOS (C_Info)
{
	npc = DJG_705_Angar;
	nr = 14;
	condition = DIA_Angar_WASISTLOS_Condition;
	information = DIA_Angar_WASISTLOS_Info;
	description = " What's wrong? " ;
};


func int DIA_Angar_WASISTLOS_Condition()
{
	if((Npc_GetDistToWP(self,"OW_PATH_3_STONES") < 1000) && (DJG_AngarGotAmulett == FALSE) && Npc_IsDead(SkeletonMage_Angar))
	{
		return TRUE;
	};
};

func void DIA_Angar_WASISTLOS_Info()
{
	AI_Output(other,self, " DIA_Angar_WASISTLOS_15_00 " );	// What's wrong?
	AI_Output(self,other, " DIA_Angar_WASISTLOS_04_01 " );	// I can't go any further with you.
	AI_Output(self,other, " DIA_Angar_WASISTLOS_04_02 " );	// Something tells me I won't make it out of here alive.
	AI_Output(self,other, " DIA_Angar_WASISTLOS_04_03 " );	// I can't explain it, but...
	if(SC_KnowsMadPsi == TRUE)
	{
		AI_Output(self,other, " DIA_Angar_WASISTLOS_04_04 " );	// I must leave this accursed land as quickly as possible, otherwise I will face the same fate as my brothers.
	}
	else
	{
		AI_Output(self,other, " DIA_Angar_WASISTLOS_04_05 " );	// Every time I see one of these... hellspawn, I get the feeling that I'm fighting against my own.
	};
	AI_StopProcessInfos(self);
	B_LogEntry(TOPIC_Dragonhunter, " Angar just left. At the sight of this undead, he gets the feeling that he is fighting against his own people. " );
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	Npc_ExchangeRoutine(self,"LeavingOW");
};


instance DIA_Angar_WHYAREYOUHERE(C_Info)
{
	npc = DJG_705_Angar;
	nr = 15;
	condition = DIA_Angar_WHYAREYOUHERE_Condition;
	information = DIA_Angar_WHYAREYOUHERE_Info;
	description = " Hangar? What are you doing here? " ;
};


func int DIA_Angar_WHYAREYOUHERE_Condition()
{
	if(Npc_GetDistToWP(self,"OW_CAVALORN_01") < 1000)
	{
		return TRUE;
	};
};

func void DIA_Angar_WHYAREYOUHERE_Info()
{
	AI_Output(other,self, " DIA_Angar_WHYAREYOUHERE_15_00 " );	// Hangar? What are you doing here?
	AI_Output(self,other, " DIA_Angar_WHYAREYOUHERE_04_01 " );	// I was walking towards the Pass when I suddenly ran into orcs. I couldn't tear myself away from them.
	AI_Output(self,other, " DIA_Angar_WHYAREYOUHERE_04_02 " );	// I'll wait a bit and then go through the Passage. See you on the other side!
	B_LogEntry(TOPIC_Dragonhunter, " I met Angar again, he's stuck in the Mine Valley. " );
	B_GivePlayerXP(XP_AngarDJGAgain);
	AI_StopProcessInfos(self);
};


instances of DIA_Angar_PERMKAP4 (C_Info)
{
	npc = DJG_705_Angar;
	condition = DIA_Angar_PERMKAP4_Condition;
	information = DIA_Angar_PERMKAP4_Info;
	permanent = TRUE;
	description = " Can you really do it alone? " ;
};


func int DIA_Angar_PERMKAP4_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Angar_WHYAREYOUHERE))
	{
		return TRUE;
	};
};

func void DIA_Angar_PERMKAP4_Info()
{
	AI_Output(other,self, " DIA_Angar_PERMKAP4_15_00 " );	// Can you really do it alone?
	AI_Output(self,other, " DIA_Angar_PERMKAP4_04_01 " );	// Of course. You can go. See you.
	AI_StopProcessInfos(self);
};


instance DIA_Angar_PICKPOCKET(C_Info)
{
	npc = DJG_705_Angar;
	nr = 900;
	condition = DIA_Angar_PICKPOCKET_Condition;
	information = DIA_Angar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Angar_PICKPOCKET_Condition()
{
	return  C_Robbery ( 47 , 55 );
};

func void DIA_Angar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Angar_PICKPOCKET);
	Info_AddChoice(DIA_Angar_PICKPOCKET,Dialog_Back,DIA_Angar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Angar_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Angar_PICKPOCKET_DoIt);
};

func void DIA_Angar_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Angar_PICKPOCKET);
};

func void DIA_Angar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Angar_PICKPOCKET);
};

