

instance DIA_PAL_2000_HAGEN_EXIT(C_Info)
{
	npc = pal_2000_hagen;
	nr = 999;
	condition = dia_pal_2000_hagen_exit_condition;
	information = dia_pal_2000_hagen_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_2000_hagen_exit_condition()
{
	return TRUE;
};

func void dia_pal_2000_hagen_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_2000_HAGEN_TEACH(C_Info)
{
	npc = pal_2000_hagen;
	nr = 100;
	condition = dia_pal_2000_hagen_teach_condition;
	information = dia_pal_2000_hagen_teach_info;
	permanent = TRUE;
	description = " Let's start training. " ;
};


func int dia_pal_2000_hagen_teach_condition()
{
	if((LordHagen_Teach2H == TRUE) && (DIA_Hagen_Teach_permanent == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_teach_info()
{
	AI_Output(other,self, " DIA_Hagen_Teach_15_00 " );	// Let's start learning.
	Info_ClearChoices(dia_pal_2000_hagen_teach);
	Info_AddChoice(dia_pal_2000_hagen_teach,Dialog_Back,dia_pal_2000_hagen_teach_back);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_pal_2000_hagen_teach_2h_1);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_pal_2000_hagen_teach_2h_5);
};

func void dia_pal_2000_hagen_teach_back()
{
	if(other.HitChance[NPC_TALENT_2H] >= 100)
	{
		AI_Output(self,other, " DIA_Hagen_Teach_04_00 " );	// You are now a worthy swordmaster. I can't teach you anymore.
		AI_Output(self,other, " DIA_Hagen_Teach_04_01 " );	// May the wisdom of the master swordsman guide your hand in future accomplishments.
		DIA_Hagen_Teach_permanent = TRUE;
	};
	Info_ClearChoices(dia_pal_2000_hagen_teach);
};

func void dia_pal_2000_hagen_teach_2h_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,1,100);
	Info_ClearChoices(dia_pal_2000_hagen_teach);
	Info_AddChoice(dia_pal_2000_hagen_teach,Dialog_Back,dia_pal_2000_hagen_teach_back);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_pal_2000_hagen_teach_2h_1);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_pal_2000_hagen_teach_2h_5);
};

func void dia_pal_2000_hagen_teach_2h_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_2H,5,100);
	Info_ClearChoices(dia_pal_2000_hagen_teach);
	Info_AddChoice(dia_pal_2000_hagen_teach,Dialog_Back,dia_pal_2000_hagen_teach_back);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h1,B_GetLearnCostTalent(other,NPC_TALENT_2H,1)),dia_pal_2000_hagen_teach_2h_1);
	Info_AddChoice(dia_pal_2000_hagen_teach,b_buildlearnstringforfight(PRINT_Learn2h5,B_GetLearnCostTalent(other,NPC_TALENT_2H,5)),dia_pal_2000_hagen_teach_2h_5);
};


instance DIA_PAL_2000_HAGEN_WARSTART(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_warstart_condition;
	information = dia_pal_2000_hagen_warstart_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pal_2000_hagen_warstart_condition()
{
	if((MIS_ORсGREATWAR == LOG_Running) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_warstart_info()
{
	AI_Output(self,other, " DIA_PAL_2000_Hagen_WarStart_01_00 " );	// (surprised) You? And to be honest, I didn't expect to see you again!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_WarStart_01_01 " );	// Especially after you stole our only ship from under our noses! (angrily) Or did you think I didn't know anything about it?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_WarStart_01_02 " );	// Now is not the best time to sort things out.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_WarStart_01_03 " );	// Yes?! (angrily) Do you think so? Why?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_WarStart_01_04 " );	// Because the orcs have invaded Khorinis!
	AI_Output(other,self, " DIA_PAL_2000_Hagen_WarStart_01_05 " );	// And it seems to me that right now this is the thing that should worry you the most.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_WarStart_01_06 " );	// Oh yeah... More of those damn orcs! These damned creatures have practically filled the entire valley.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_WarStart_01_07 " );	// That's it. And something needs to be done about it.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_WarStart_01_08 " );	// Hmmm... (thoughtfully) Well, good! We will talk about our affairs with you later. Just don't expect me to forget about it!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_WarStart_01_09 " );	// Now answer: what brings you to me?
};


instance DIA_PAL_2000_HAGEN_HIDDENORE(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_hiddenore_condition;
	information = dia_pal_2000_hagen_hiddenore_info;
	permanent = FALSE;
	description = " I have a very important message for you. " ;
};


func int dia_pal_2000_hagen_hiddenore_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_pal_2000_hagen_warstart ) && ( Npc_HasItems ( hero , itmi_seamaplasticland ) >=  1 )) .
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_hiddenore_info()
{
	AI_Output(other,self, " DIA_PAL_2000_Hagen_HiddenOre_01_00 " );	// I have a very important message for you.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_01_01 " );	// (arrogantly) And what is it?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_HiddenOre_01_03 " );	// When we were at sea, we accidentally stumbled upon an uninhabited island, filled to the brim with deposits of magical ore!
	AI_Output(other,self, " DIA_PAL_2000_Hagen_HiddenOre_01_04 " );	// So I figured it might be interesting for paladins to know about this.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_01_05 " );	// What?! Are you serious? (very surprised) But that just can't be!
	AI_Output(other,self, " DIA_PAL_2000_Hagen_HiddenOre_01_06 " );	// Trust me, it is. The magic ore we found was one of the reasons why we returned back.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_01_07 " );	// Incredible! I couldn't even imagine that this was possible.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_01_08 " );	// If everything you say is true, then this is the best news I could ever hear!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_01_09 " );	// And lately they have become too rare.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_01_12 " );	// How far is this island from here?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_HiddenOre_01_13 " );	// Just a few days' sail from Khorinis. Here, take a look for yourself.
	B_GiveInvItems(other,self,itmi_seamaplostisland,1);
	AI_Output(self,other,"DIA_PAL_2000_Hagen_HiddenOre_01_14");	//Что это?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_HiddenOre_01_15 " );	// This is a sea chart. My captain made a couple of marks on it and plotted an accurate course.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_HiddenOre_01_16 " );	// So finding this island won't be too hard for you now.
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_01_17 " );	// (looking closely) Yes, very interesting.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_01_18 " );	// Judging by this map, the piece of land you found is located in a part of the ocean that we have not yet explored. How did you get there?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_HiddenOre_01_19 " );	// On the way we got into a very strong storm. He led us to this island.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_01_20 " );	// Yeah. And indeed they say that the ways of Innos are inscrutable!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_01_21 " );	// I'm sure that it certainly could not have happened without his will.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_01_23 " );	// Well then. (seriously) Then on behalf of our entire order, please accept my sincere thanks!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_01_24 " );	// Let's hope that the ore you found can still help the king in the war against the orcs.
	HAGENTAKESMAPSORE = TRUE;

	if(LIGOFORGOLD == TRUE)
	{
		Info_ClearChoices(dia_pal_2000_hagen_hiddenore);
		Info_AddChoice(dia_pal_2000_hagen_hiddenore, " Not so fast, paladin! " ,dia_pal_2000_hagen_hiddenore_gold);
	}
	else if(LIGOFORUNKNOWN == TRUE)
	{
		Info_ClearChoices(dia_pal_2000_hagen_hiddenore);
		Info_AddChoice(dia_pal_2000_hagen_hiddenore, " Not so fast, paladin! " ,dia_pal_2000_hagen_hiddenore_gold);
		Info_AddChoice(dia_pal_2000_hagen_hiddenore,"Само собой.",dia_pal_2000_hagen_hiddenore_nothing);
	}
	else if(LIGOFORFREE == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_01_25");	//Само собой.
	};
};

func void dia_pal_2000_hagen_hiddenore_gold()
{
	AI_Output(other,self, " DIA_PAL_2000_Hagen_HiddenOre_Gold_01_01 " );	// Not so fast, paladin! I'm afraid your gratitude alone won't be enough.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_Gold_01_02 " );	// That is? (surprised) What do you mean by that?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_HiddenOre_Gold_01_03 " );	// Each information is always worth something. Especially so valuable.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_Gold_01_06 " );	// (arrogantly) Oh, yes. Naturally! It would be strange if you didn't talk to me about it.
	if(other.guild == GIL_PAL)
	{
		AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_Gold_01_07 " );	// Although, to tell the truth, I did not expect such words from a paladin!
	}
	else if(other.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_Gold_01_08 " );	// Although, to be honest, I didn't expect such words from a venerable Fire Mage!
	}
	else if(other.guild == GIL_KDW)
	{
		AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_Gold_01_09 " );	// Although, to tell the truth, I never expected such words from the venerable Waterbender!
	};
	AI_Output(other,self, " DIA_PAL_2000_Hagen_HiddenOre_Gold_01_10 " );	// Let's leave the details. Better tell me - how much will you pay me?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_Gold_01_11 " );	// Hmmm... Well, let's say ten thousand gold coins. Will that suit you?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_HiddenOre_Gold_01_12 " );	// Quite. Hope I didn't go cheap.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_Gold_01_13 " );	// You decide! Here, take your money.
	B_GiveInvItems(self,other,ItMi_Gold,10000);
	AI_Output(other,self, " DIA_PAL_2000_Hagen_HiddenOre_Gold_01_14 " );	// It's a pleasure doing business with you.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_HiddenOre_Gold_01_15 " );	// (angrily) Hmmm...
	Info_ClearChoices(dia_pal_2000_hagen_hiddenore);
};

func void dia_pal_2000_hagen_hiddenore_nothing()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_HiddenOre_Nothing_01_01");	//Само собой.
	Info_ClearChoices(dia_pal_2000_hagen_hiddenore);
};


instance DIA_PAL_2000_HAGEN_TELLFROMPYROKAR(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_tellfrompyrokar_condition;
	information = dia_pal_2000_hagen_tellfrompyrokar_info;
	permanent = FALSE;
	description = " Pyrocar sent me. " ;
};


func int dia_pal_2000_hagen_tellfrompyrokar_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_warstart) && (MIS_ORсGREATWAR == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_tellfrompyrokar_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_00 " );	// Pirokar sent me.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_01 " );	// And what does he want?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_02 " );	// For starters, at least figure out how things are going for you. How big are your losses?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_03 " );	// (grouchily) And he himself does not know how they are!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_04 " );	// In defending the city, I lost almost a third of my people. I don't think this is a good turn of events.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_05 " );	// What about the rest?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_06 " );	// Everyone who survived this mess is here now.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_07 " );	// And to be more specific, I now have about fifty fighters at my disposal. Maybe a little more.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_08 " );	// And what is their mood?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_09 " );	// (terribly) If you think that after everything that happened they lost heart, then you are mistaken!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_10 " );	// Their morale is as high as ever! And soon you will see for yourself.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_11 " );	// Then why are you still here?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_12 " );	// The orcs are already running the valley, plundering and destroying everything in their path.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_13 " );	// Or are you just afraid to give them an open fight?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_17 " );	// There are too few of us for an open battle with the orcs. We just don't have the strength to resist them all!
	AI_Output(other,self, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_18 " );	// And what are you going to do next?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_19 " );	// Guess we'll stay here for now. I need to regroup my troops and thoroughly prepare for further hostilities.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_20 " );	// In addition, Azgan is almost impregnable, so you can feel completely safe here.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_TellFromPyrokar_01_21 " );	// And if these creatures try to attack us, then be sure - they will decently break their teeth on the walls of this fortress.
	B_LogEntry( TOPIC_OR with GREATWAR , " Having lost almost a third of the paladins in the defense of Khorinis, Lord Hagen is not going to do anything against the orc invasion anytime soon. The paladins will remain in the fort, which is more advantageous in the current situation. Fort Azgan is an almost impregnable fortress, and the orcs are unlikely to be able to take it by storm. " );
	TELLTOHAGENFORT = TRUE;
};


instance DIA_PAL_2000_HAGEN_MAYJOINOTHERS(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_mayjoinothers_condition;
	information = dia_pal_2000_hagen_mayjoinothers_info;
	permanent = FALSE;
	description = " But we can't just sit back! " ;
};


func int dia_pal_2000_hagen_mayjoinothers_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_tellfrompyrokar) && (MIS_ORсGREATWAR == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_mayjoinothers_info()
{
	AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthers_01_00 " );	// But we can't just sit back!
	AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthers_01_01 " );	// Sooner or later, the orcs will kill all the remaining people in the valley and after that they will surely come here.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthers_01_03 " );	// I know all this very well without you!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthers_01_04 " );	// But, as I said before, I have too few people to openly oppose so many orcs.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthers_01_05 " );	// Then you need to find yourself more warriors!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthers_01_06 " );	// Yes?! (maliciously) And where do you suggest that I look for them? Maybe you can advise?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthers_01_07 " );	// Where else can I get at least a hundred brave daredevils, ready to give their lives for the illusory hope of success?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthers_01_08 " );	// No, my friend - we are alone in this battle. We can't wait for any help.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthers_01_09 " );	// But what about mercenaries or people from the Swamp Brotherhood? Maybe ask them for help?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthers_01_10 " );	// What?! Fight side by side with criminals and runaway convicts?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthers_01_11 " );	// Are you in your right mind to suggest this to me? I will never agree to deal with this kind of person, even if the matter concerns a matter of life and death.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthers_01_12 " );	// All of this dishonors the good name of the paladin! Not to mention that many of them cannot be trusted at all.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthers_01_13 " );	// I know that for a paladin, honor is everything. But not in this situation!
	AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthers_01_15 " );	// While you're standing here and talking about the concepts of honor - more and more innocent people die from orc axes in the valley!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthers_01_16 " );	// (bewildered) What do you mean by that?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthers_01_17 " );	// As a paladin of the king, it is your duty to do whatever is necessary to save them somehow!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthers_01_21 " );	// Hmmm. Well, well... (reluctantly) Yes, you're right.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthers_01_22 " );	// I really shouldn't be so arrogant and presumptuous. The life of the subjects of the king is above all!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthers_01_23 " );	// After all, their protection is our sacred duty. And besides us, they have no one else to rely on.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthers_01_25 " );	// I'm sure you should ask for help from all those who can now hold a weapon in their hands.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthers_01_26 " );	// And I think there are quite a few of them.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthers_01_27 " );	// In addition, if these very criminals, as you call them, agree to join you against the orcs, this will already be worthy of at least some respect.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthers_01_28 " );	// In the end, many of them will pay with their lives, and it's worth something.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthers_01_29 " );	// Okay! Consider that you almost persuaded me. However, I still need some time to think it all over.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthers_01_30 " );	// Think faster, we don't have time anyway.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthers_01_31 " );	// I'll try!
	B_LogEntry( TOPIC_OR with GREATWAR , " After much arguing with Lord Hagen, I managed to convince him that the only way to defeat the orcs is to gather under the banner of the paladins all who are capable of wielding weapons. Mercenaries, cultists or anyone else. However, the head of the paladins still took time to think about my proposal. But I have no doubt that he will make the right decision. " );
};


instance DIA_PAL_2000_HAGEN_MAYJOINOTHERSAGREED(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_mayjoinothersagreed_condition;
	information = dia_pal_2000_hagen_mayjoinothersagreed_info;
	permanent = TRUE;
	description = " So what did you decide? " ;
};


func int dia_pal_2000_hagen_mayjoinothersagreed_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_pal_2000_hagen_mayjoinothers ) && ( HAGENOTHERSAGREED  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_mayjoinothersagreed_info()
{
	AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_00 " );	// So what did you decide?
	if((MIS_RESCUEGAROND == LOG_SUCCESS) || (GARONDISBACK == TRUE))
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_01 " );	// Hmmm... (thoughtfully) Well, good! I agree to accept the help of mercenaries or anyone else.
		AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_02 " );	// But only because we really just have no other choice.
		AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_03 " );	// I'm sure you did the right thing.
		AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_04 " );	// I hope. (seriously) I really don't want to regret my decision later. It worked so hard for me!
		AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_05 " );	// And now what?
		AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_06 " );	// Are you asking me? I already told you everything I thought about it.
		AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_07 " );	// Now everything else is up to you.
		AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_09 " );	// Or do you think that I myself will run around and beg everyone to join the army of paladins?
		AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_10 " );	// Enough of the fact that I, apparently, will soon have to rub shoulders with all sorts of criminals and other dark personalities.
		AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_11 " );	// In addition, you yourself proposed this idea - now think about how to proceed.
		AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_12 " );	// Okay, I'll think of something.
		AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_13 " );	// Just don't delay it! I don't think the orcs will give us much time to think.
		ALLFRACTIONS = 6;
		HAGENOTHERSAGREED = TRUE;
		HAGENCOUNTSTIME = Wld_GetDay();
		B_LogEntry( TOPIC_OR with GREATWAR , " Lord Hagen agreed with my proposal and instructed me to take care of, so to speak, the recruitment of militia in the paladin army. Let's see what happens. " );
	}
	else
	{
		AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_15 " );	// (nervously) Nothing yet. So don't get on my nerves!
		if(MIS_RESCUEGAROND == LOG_Running)
		{
			AI_Output(self,other, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_16 " );	// You'd better take care of my errand about Garond's squad! This is much more important now.
		};
		AI_Output(other,self, " DIA_PAL_2000_Hagen_MayJoinOthersAgreed_01_17 " );	// Okay, whatever you say.
	};
};


instance DIA_PAL_2000_HAGEN_ALREADYJOINOTHERSAGREED(C_Info)
{
	npc = pal_2000_hagen;
	nr = 1;
	condition = dia_pal_2000_hagen_alreadyjoinothersagreed_condition;
	information = dia_pal_2000_hagen_alreadyjoinothersagreed_info;
	permanent = TRUE;
	description = " As for the people who are ready to support you... " ;
};


func int dia_pal_2000_hagen_alreadyjoinothersagreed_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (PREGATHERALLONBIGFARM == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_info()
{
	AI_Output(other,self, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_01_00 " );	// As for people willing to support you...
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_01_01 " );	// Yes? (with interest) Do you have any news?
	Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_sldanswer) && (SLD_JOINHAGEN == TRUE) && (FRACTIONSLDJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed, " Mercenaries will fight for you. " ,dia_pal_2000_hagen_alreadyjoinothersagreed_sld);
	};
	if((PIR_JOINHAGEN == TRUE) && (FRACTIONPIRJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed, " Pirates have agreed to join your army. " ,dia_pal_2000_hagen_alreadyjoinothersagreed_pir);
	};
	if((TPL_JOINHAGEN == TRUE) && (FRACTIONTPLJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed, " The Brotherhood are ready to help you with the orcs. " ,dia_pal_2000_hagen_alreadyjoinothersagreed_tpl);
	};
	if((HUN_JOINHAGEN == TRUE) && (FRACTIONHUNJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed, " Hunters will also fight with you. " ,dia_pal_2000_hagen_alreadyjoinothersagreed_hun);
	};
	if((KDW_JOINHAGEN == TRUE) && (FRACTIONKDWJOIN == FALSE))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed, " The Waterbenders gladly accepted your offer. " ,dia_pal_2000_hagen_alreadyjoinothersagreed_kdw);
	};
	if (( KDF_JOINHAGEN  ==  TRUE ) && ( FRACTIONKDFJOIN  ==  FALSE ))
	{
		Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed, " You can count on help from the Fire Mages. " ,dia_pal_2000_hagen_alreadyjoinothersagreed_kdf);
	};
	Info_AddChoice(dia_pal_2000_hagen_alreadyjoinothersagreed, " Nothing new yet. " ,dia_pal_2000_hagen_alreadyjoinothersagreed_no);
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_sld()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_00 " );	// Mercenaries will fight by your side.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_01 " );	// I already know that! (annoyed) What's the point of telling me this one more time?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_02 " );	// Just thought I'd remind you.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_03 " );	// Don't take me for an idiot! I always remember very well what people say to me.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_SLD_01_04 " );	// Well, whatever you say.
	FRACTIONSLDJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_pir()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_00 " );	// The pirates have agreed to join your army.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_01 " );	// Not to say that I'm very happy about this fact... (grouchily) But it's better than nothing!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_02 " );	// Although, to tell the truth, I thought that they would still prefer the gallows than to be under my command.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_03 " );	// I was able to dissuade them from this idea. Moreover, you promised them a ship!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_PIR_01_04 " );	// Yes, I remember my promise! You can be sure of that.
	FRACTIONPIRJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_tpl()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_TPL_01_00 " );	// The people of the Brotherhood are ready to help you with the orcs.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_TPL_01_01 " );	// Hmmm. (surprised) Seriously? To tell the truth, I did not count on their help at all!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_TPL_01_02 " );	// Because I always thought they didn't care at all about everything going on around them.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_TPL_01_03 " );	// But this time, I must have made a mistake! Although maybe that's for the best.
	FRACTIONTPLJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_hun()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_HUN_01_00 " );	// Hunters will also fight alongside you.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_HUN_01_01 " );	// Hunters? But they are farmers, not warriors! Maybe then you will call ordinary peasants under my banner?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_HUN_01_02 " );	// I'm sure that extra people won't bother you anyway.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_HUN_01_03 " );	// Hmmm... (grouchily) Okay! I hope that they will be of some use.
	FRACTIONHUNJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_kdw()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDW_01_00 " );	// The Waterbenders gladly accepted your offer.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDW_01_01 " );	// Well, that's very good news. I know Saturas well, and I am sure that he simply could not have made a different decision.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDW_01_02 " );	// It will be a great honor for me to fight alongside a noble man like him.
	FRACTIONKDWJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_kdf()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDF_01_00 " );	// You can count on help from the Firebenders.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDF_01_01 " );	// I didn't doubt it a bit... (respectfully) Since fighting evil is their sacred duty to Innos!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDF_01_02 " );	// I'm sure that their knowledge and wisdom will help us in the fight against the orcs.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_KDF_01_03");	//Само собой.
	FRACTIONKDFJOIN = TRUE;
	AVAILABLEFRACTIONS = AVAILABLEFRACTIONS + 1;
	if(AVAILABLEFRACTIONS >= ALLFRACTIONS)
	{
		PREGATHERALLONBIGFARM = TRUE;
		Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
	};
};

func void dia_pal_2000_hagen_alreadyjoinothersagreed_no()
{
	AI_Output(other,self, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_No_01_00 " );	// I don't have news yet.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_AlreadyJoinOthersAgreed_No_01_01 " );	// Then why are you just wasting my time? (annoyed) Better go and do something useful!
	Info_ClearChoices(dia_pal_2000_hagen_alreadyjoinothersagreed);
};


instance DIA_PAL_2000_HAGEN_DONEJOINOTHERSAGREED(C_Info)
{
	npc = pal_2000_hagen;
	nr = 1;
	condition = dia_pal_2000_hagen_donejoinothersagreed_condition;
	information = dia_pal_2000_hagen_donejoinothersagreed_info;
	permanent = FALSE;
	description = " I think that's all who can join your army. " ;
};


func int dia_pal_2000_hagen_donejoinothersagreed_condition()
{
	if(PREGATHERALLONBIGFARM == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_donejoinothersagreed_info()
{
	AI_Output(other,self, " DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_00 " );	// I think that's all who can join your army.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_01 " );	// Well, not bad at all. Now we really have enough people to openly oppose the orcs. And there is no point in delaying it!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_02 " );	// Moreover, according to my information, the orcs have already begun to gather their forces near Onar's farm, and they will certainly want to strike there.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_03 " );	// Then let the others know you're speaking.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_04 " );	// Don't worry, I'll take care of it myself. Except, of course, the Fire Mages. With this, serious problems can arise.
	AI_Output(other,self,"DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_05");	//Почему?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_06 " );	// As far as I know, the monastery is still under siege, and I don't think the orcs will welcome my messenger there with open arms.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_07 " );	// I guess I can handle this. I've been able to sneak in there more than once without being seen.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_DoneJoinOthersAgreed_01_08 " );	// Okay, let it be your way. Then inform Pyrokar that we will camp near the farm, and have him ready to join us soon.
	B_LogEntry( TOPIC_OR with GREATWAR , " Lord Hagen is now ready to march with his men from the fort to attack the orcs. I must immediately go to the monastery and inform the Firebenders. " );
	HAGENNOMORETIMEWAIT = TRUE;
	OTH_JOINHAGEN = TRUE;
};


instance DIA_PAL_2000_HAGEN_RESCUEGAROND (C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_rescuegarond_condition;
	information = day_pal_2000_hagen_rescuegarond_info;
	permanent = FALSE;
	description = " Is there anything else I can help you with? " ;
};


func int dia_pal_2000_hagen_rescuegarond_condition()
{
	if ( Npc_KnowsInfo ( hero , his_pal_2000_may_joinothers ) && ( GARONDISBACK  ==  FALSE ))
	{
		return TRUE;
	};
};

func void day_pal_2000_hagen_rescuegarond_info()
{
	AI_Output(other,self, " DIA_PAL_2000_Hagen_RescueGarond_01_01 " );	// Is there anything else I can help with?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_RescueGarond_01_02 " );	// (thoughtfully) Perhaps I really have one very important task for you.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_RescueGarond_01_03 " );	// Although, frankly, it is associated with extremely high risk and danger.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_RescueGarond_01_04 " );	// Sounds tempting already! And what should be done?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_RescueGarond_01_06 " );	// The fact is that I still don't know what happened to my expedition in the Valley of Mines.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_RescueGarond_01_07 " );	// Haven't heard from Garond for a long time! To be honest, I really don't know what to think.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_RescueGarond_01_08 " );	// It's possible they're all dead already, but maybe they aren't... (seriously) And all this uncertainty makes me extremely sick!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_RescueGarond_01_09 " );	// Therefore, I want you to immediately go to the valley and inquire about the whole situation related to the castle there.
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(other,self, " DIA_PAL_2000_Hagen_RescueGarond_01_10 " );	// As far as I know, until recently, their situation was extremely difficult!
		AI_Output(other,self, " DIA_PAL_2000_Hagen_RescueGarond_01_11 " );	// Orcs have already tried to storm the castle, but then the paladins managed to repel their attack.
		AI_Output(other,self, " DIA_PAL_2000_Hagen_RescueGarond_01_12 " );	// However, I don't think this will last forever!
	};
	AI_Output(self,other, " DIA_PAL_2000_Hagen_RescueGarond_01_13 " );	// In any case, I need to know what became of my people. Even if they are already dead!
	AI_Output(other,self, " DIA_PAL_2000_Hagen_RescueGarond_01_14 " );	// Okay, I'll try to figure it out.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_RescueGarond_01_15 " );	// Then go. And may Innos be with you!
	MIS_RESCUEGAROND = LOG_Running;
	Log_CreateTopic(TOPIC_RESCUEGAROND,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEGAROND,LOG_Running);
	B_LogEntry( TOPIC_RESCUEGAROND , " Lord Hagen has asked me to find out everything about the fate of the expedition he sent to the Valley of Mines. There hasn't been any news from Garond lately, which greatly worries the paladin leader. Lord Hagen wants to know what became of his people. " );
};


instance DIA_PAL_2000_HAGEN_HOWTHINGS(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_howthings_condition;
	information = dia_pal_2000_hagen_howthings_info;
	permanent = TRUE;
	description = " How is the situation in the fort? " ;
};


func int dia_pal_2000_hagen_howthings_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_mayjoinothers))
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_howthings_info()
{
	AI_Output(other,self, " DIA_PAL_2000_Hagen_HowThings_01_01 " );	// How is the situation in the fort?
	if (( PERMGARONDNEWS  ==  FALSE ) && ( GARONDISBACK  ==  TRUE ))
	{
		B_GivePlayerXP(50);
		AI_Output(self,other, " DIA_PAL_2000_Hagen_HowThings_01_02 " );	// Better than before! The return of Garond was good news for many and a good sign for the future.
		AI_Output(other,self, " DIA_PAL_2000_Hagen_HowThings_01_03 " );	// Are you serious?
		AI_Output(self,other, " DIA_PAL_2000_Hagen_HowThings_01_04 " );	// Of course! Indeed, in the current situation, it was not possible for anyone to get out of the Valley alive before.
		AI_Output(self,other, " DIA_PAL_2000_Hagen_HowThings_01_06 " );	// But despite everything, he still managed to do it, albeit with your help.
		AI_Output(self,other, " DIA_PAL_2000_Hagen_HowThings_01_07 " );	// In addition, do not forget that all this time his small detachment held back the onslaught of an entire army of orcs, preventing them from advancing further inland.
		AI_Output(self,other, " DIA_PAL_2000_Hagen_HowThings_01_08 " );	// And all this is also extremely important. Especially given the current state of all our affairs.
		AI_Output(other,self, " DIA_PAL_2000_Hagen_HowThings_01_09 " );	// Of course.
		PERMGARONDNEWS = TRUE;
	}
	else if(Npc_KnowsInfo(hero,dia_pal_2000_hagen_donejoinothersagreed))
	{
		AI_Output(self,other, " DIA_PAL_2000_Hagen_HowThings_01_16 " );	// As if you don't even know what's going on! We are preparing to move into position in Khorinis and take up defenses there near the farm.
		AI_Output(self,other, " DIA_PAL_2000_Hagen_HowThings_01_17 " );	// I hope this comes as a surprise to the orcs! At least, I really hope so.
	}
	else
	{
		AI_Output(self,other, " DIA_PAL_2000_Hagen_HowThings_01_14 " );	// So far, nothing has changed.
	};
};


instance DIA_PAL_2000_HAGEN_RESCUEGARONDOTHERS(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_rescuegarondothers_condition;
	information = dia_pal_2000_hagen_rescuegarondothers_info;
	permanent = FALSE;
	description = " Have you sent someone to the valley to investigate the situation yet? " ;
};


func int dia_pal_2000_hagen_rescuegarondothers_condition()
{
	if(MIS_RESCUEGAROND == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_rescuegarondothers_info()
{
	AI_Output(other,self, " DIA_PAL_2000_Hagen_RescueGarondOthers_01_01 " );	// Have you sent someone to the valley to investigate the situation?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_RescueGarondOthers_01_02 " );	// Yes, I already sent one person there, but there is no news from him yet either.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_RescueGarondOthers_01_03 " );	// Eh...(sadly) I'm afraid the orcs didn't let him get far. Although he may still be alive!
	AI_Output(other,self, " DIA_PAL_2000_Hagen_RescueGarondOthers_01_04 " );	// And what was that guy's name?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_RescueGarondOthers_01_05 " );	// His name was Nathan. Nice fellow, I want to tell you!
	AI_Output(other,self, " DIA_PAL_2000_Hagen_RescueGarondOthers_01_06 " );	// And he was also a paladin?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_RescueGarondOthers_01_07 " );	// Of course! Others simply wouldn't take on something as dangerous as this.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_RescueGarondOthers_01_08 " );	// Nathan was one of Lord Varus' men who volunteered to sail with my expedition to this island.
	B_LogEntry( TOPIC_RESCUEGAROND , " Lord Hagen already sent a man to scout the valley, but he also went missing. His name was Nathan. " );
};


instance DIA_PAL_2000_HAGEN_GARONDISBACK(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_garondisback_condition;
	information = dia_pal_2000_hagen_garondisback_info;
	permanent = FALSE;
	description = " Garond and his men have arrived at the fort! " ;
};


func int dia_pal_2000_hagen_garondisback_condition()
{
	if(GARONDISBACK == TRUE)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_garondisback_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_PAL_2000_Hagen_GarondIsBack_01_01 " );	// Garond and his men have arrived at the fort!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_GarondIsBack_01_02 " );	// This is really great news. And it will certainly further strengthen the morale of my soldiers and our common faith in victory!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_GarondIsBack_01_03 " );	// Therefore, accept my gratitude from me and this gold as a reward for your labors. You deserved it!
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(other,self,"DIA_PAL_2000_Hagen_GarondIsBack_01_04");	//Спасибо.
	if(MIS_RESCUEGAROND == LOG_Running)
	{
		MIS_RESCUEGAROND = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_RESCUEGAROND,LOG_SUCCESS);
		B_LogEntry( TOPIC_RESCUEGAROND , " Garond and his men have arrived at the paladin fort. I think Lord Hagen should now agree to my proposal. " );
	};
};


instance DIA_PAL_2000_HAGEN_PIRATENEEDSHIP(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_pirateneedship_condition;
	information = dia_pal_2000_hagen_pirateneedship_info;
	permanent = FALSE;
	description = " Pirates want your ship. " ;
};


func int dia_pal_2000_hagen_pirateneedship_condition()
{
	if(MIS_PIRATENEEDSHIP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_pirateneedship_info()
{
	AI_Output(other,self, " DIA_PAL_2000_Hagen_PirateNeedShip_01_01 " );	// Pirates need your ship.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_PirateNeedShip_01_02 " );	// Only under these conditions are they ready to join your army.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_PirateNeedShip_01_03 " );	// Give them our ship? (angrily) What the hell do they think they are?!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_PirateNeedShip_01_04 " );	// Yes, I would rather surrender to the orcs than accept such conditions!
	AI_Output(other,self, " DIA_PAL_2000_Hagen_PirateNeedShip_01_05 " );	// But we really need their help!
	AI_Output(other,self, " DIA_PAL_2000_Hagen_PirateNeedShip_01_06 " );	// After all, you won't need it anymore if we fail.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_PirateNeedShip_01_07 " );	// You're right! But I can't just follow everyone's lead like that. Especially with these dirty scammers!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_PirateNeedShip_01_08 " );	// And what will happen if they ask tomorrow to accept them all into the order of paladins - will you order me to do this too?!
	AI_Output(other,self, " DIA_PAL_2000_Hagen_PirateNeedShip_01_09 " );	// Pretty good idea of ​​you.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_PirateNeedShip_01_10 " );	// What?! (angrily) What's the thought? Are you out of your mind, boy?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_PirateNeedShip_01_11 " );	// Of course! After all, by doing this and giving them your ship, you will not lose anything.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_PirateNeedShip_01_12 " );	// But the Order of Paladins is sacred! Only those worthy of this honor can be accepted into our ranks.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_PirateNeedShip_01_13 " );	// Only in the near future it may turn out that there will no longer be worthy.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_PirateNeedShip_01_14 " );	// Since everyone will simply be killed by the orcs.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_PirateNeedShip_01_15 " );	// (lost) Oh, Innos! And why are you sending me such tests?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_PirateNeedShip_01_16 " );	// As far as I can see, you almost agree with this proposal. Is not it?
	AI_Output(self,other, " DIA_PAL_2000_Hagen_PirateNeedShip_01_17 " );	// Eh... (doomed) Well, okay. Consider that you were able to convince me of the expediency of these actions.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_PirateNeedShip_01_18 " );	// Tell them that if they are ready to serve the cause of Innos and join our ranks, then I will give them my ship.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_PirateNeedShip_01_19 " );	// And may he forgive me for such decisions.
	HAGENINVITEPIRATES = TRUE;
	B_LogEntry( TOPIC_PIRATENEEDSHIP , " Lord Hagen was extremely indignant at the demands of the pirates, but in the end I managed to convince him of the need for such a deal. On the condition that the pirates themselves join his order. " );
};


instance DIA_PAL_2000_HAGEN_SLDANSWER(C_Info)
{
	npc = pal_2000_hagen;
	nr = 2;
	condition = dia_pal_2000_hagen_sldanswer_condition;
	information = dia_pal_2000_hagen_sldanswer_info;
	permanent = FALSE;
	description = " I brought back a response from the mercenaries. " ;
};


func int dia_pal_2000_hagen_sldanswer_condition()
{
	if(MIS_OREWEAPONSLD == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_pal_2000_hagen_sldanswer_info()
{
	AI_Output(other,self, " DIA_PAL_2000_Hagen_SldAnswer_01_01 " );	// I brought a response from the mercenaries.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_SldAnswer_01_02 " );	// (sullenly) And what did they say?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_SldAnswer_01_03 " );	// Lee agrees to support you and march with his people against the orcs.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_SldAnswer_01_04 " );	// However, he wants you to equip his men with ore blades.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_SldAnswer_01_05 " );	// What?! Doesn't he want too much?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_SldAnswer_01_06 " );	// In his opinion, this will make his people more combat-ready. And the rest is up to you.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_SldAnswer_01_07 " );	// That's what I knew...(grouchily) Once you make concessions to these bastards, they will immediately begin to demand God knows what from you!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_SldAnswer_01_08 " );	// I hope you know that ore blades are only worn by the king's paladins. Why should I break this rule?
	AI_Output(other,self, " DIA_PAL_2000_Hagen_SldAnswer_01_09 " );	// Because the situation calls for it!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_SldAnswer_01_10 " );	// Well, let's say. However, even if I agreed to this, I still do not have enough of these weapons to arm all of his thugs.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_SldAnswer_01_11 " );	// Then they just need to be forged.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_SldAnswer_01_12 " );	// And how do you tell me to do this? After all, this requires magic ore!
	AI_Output(self,other, " DIA_PAL_2000_Hagen_SldAnswer_01_13 " );	// And the only place where it can still be mined is the Valley of Mines, which is currently ruled by orcs.
	AI_Output(other,self, " DIA_PAL_2000_Hagen_SldAnswer_01_14 " );	// If it's all about the ore, then I'll get it.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_SldAnswer_01_15 " );	// What a stubborn person you are, that's something! Never met people like you.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_SldAnswer_01_16 " );	// Oh, okay! If you're really so sure about it, let it be your way.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_SldAnswer_01_17 " );	// Find magic ore and forge as many ore blades from it as you see fit.
	AI_Output(self,other, " DIA_PAL_2000_Hagen_SldAnswer_01_18 " );	// Here, take this scroll. There you will find all the instructions regarding this.
	B_GiveInvItems(self,other,itwr_letteroresword,1);
	B_LogEntry( TOPIC_OREWEAPONSLD , " After much discussion, I managed to convince Lord Hagen to equip Li's people with ore blades. He gave me a scroll describing the forging process of this sacred weapon. It remains to get the magic ore and find out how many blades Li and his people need. " );
};

