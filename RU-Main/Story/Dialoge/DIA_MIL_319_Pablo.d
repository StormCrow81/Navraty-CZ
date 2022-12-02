

instance DIA_Pablo_EXIT(C_Info)
{
	npc = MIL_319_Paul;
	nr = 999;
	condition = DIA_Pablo_EXIT_Condition;
	information = DIA_Pablo_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pablo_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pablo_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Pablo_PICKPOCKET(C_Info)
{
	npc = MIL_319_Paul;
	nr = 900;
	condition = DIA_Pablo_PICKPOCKET_Condition;
	information = DIA_Pablo_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his key) " ;
};

func int DIA_Pablo_PICKPOCKET_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) >= 1) && (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (Npc_HasItems(self,ItKe_City_Tower_01) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Pablo_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pablo_PICKPOCKET);
	Info_AddChoice(DIA_Pablo_PICKPOCKET,Dialog_Back,DIA_Pablo_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pablo_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Pablo_PICKPOCKET_DoIt);
};

func void DIA_Pablo_PICKPOCKET_DoIt()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= Hlp_Random(self.attribute[ATR_DEXTERITY]))
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		}
		else
		{
			GlobalThiefCount += 1;

			if(GlobalThiefCount >= 3)
			{
				INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
				GlobalThiefCount = FALSE;
			};
		};
		B_GiveInvItems(self,other,ItKe_City_Tower_01,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP();
		Info_ClearChoices(DIA_Pablo_PICKPOCKET);
	}
	else
	{
		if((other.guild == GIL_PAL) || (other.guild == GIL_KDF))
		{
			INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
		};
		THIEFCATCHER = Hlp_GetNpc(self);
		HERO_CANESCAPEFROMGOTCHA = TRUE;
		B_ResetThiefLevel();
		AI_StopProcessInfos(self);
		self.vars[0] = TRUE;
	};
};

func void DIA_Pablo_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pablo_PICKPOCKET);
};


var int Pablo_belogen;

instance DIA_Pablo_WANTED(C_Info)
{
	npc = MIL_319_Paul;
	nr = 1;
	condition = DIA_Pablo_WANTED_Condition;
	information = DIA_Pablo_WANTED_Info;
	important = TRUE;
};


func int DIA_Pablo_WANTED_Condition()
{
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pablo_WANTED_Info()
{
	AI_Output(self,other, " DIA_Pablo_WANTED_12_00 " );	// Hey, wait - I feel like I know you.
	AI_Output(other,self, " DIA_Pablo_WANTED_15_01 " );	// What do you need?
	AI_Output(self,other, " DIA_Pablo_WANTED_12_02 " );	// I've already seen your face somewhere... (thoughtfully) Oh, right!
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Pablo_WANTED_12_03 " );	// Here - we found this sheet from one of the bandits we stumbled upon a few days ago - the drawing is very similar to you.
	B_GiveInvItems(self,other,ItWr_Poster_MIS,1);
	AI_Output(self,other, " DIA_Pablo_WANTED_12_04 " );	// Apparently, these guys were looking for you.
	Info_ClearChoices(DIA_Pablo_WANTED);
	Info_AddChoice(DIA_Pablo_WANTED, " No, I'm afraid you're wrong. " ,DIA_Pablo_WANTED_NOTHING);
	Info_AddChoice(DIA_Pablo_WANTED, " Hmm, I never would have thought of that myself. " ,DIA_Pablo_WANTED_IRONY);
};

func void DIA_Pablo_WANTED_NOTHING()
{
	AI_Output(other,self, " DIA_Pablo_WANTED_NOTHING_15_00 " );	// No, I'm afraid you're wrong. Everything is fine with me!
	AI_Output(self,other, " DIA_Pablo_WANTED_NOTHING_12_01 " );	// As you say, outlander.
	AI_Output(self,other, " DIA_Pablo_Add_12_00 " );	// But if this is still YOUR face - and if you have problems - try to solve them outside the city. There are already enough difficulties here.
	AI_Output(self,other, " DIA_Pablo_WANTED_NOTHING_12_03 " );	// And outsiders who bring problems to the city don't stay here long - I hope I made myself clear.
	Pablo_lied = TRUE ;
	AI_StopProcessInfos(self);
};

func void DIA_Pablo_WANTED_IRONY()
{
	AI_Output(other,self, " DIA_Pablo_WANTED_IRONY_15_00 " );	// Hmm, I would never have guessed that myself.
	AI_Output(self,other, " DIA_Pablo_WANTED_IRONY_12_01 " );	// Very funny. What did these guys want from you?
	AI_Output(other,self, " DIA_Pablo_Add_15_01 " );	// Ask them yourself. They're behind bars, aren't they?
	AI_Output(self,other, " DIA_Pablo_WANTED_IRONY_12_03 " );	// No - they're dead.
	AI_Output(other,self, " DIA_Pablo_WANTED_IRONY_15_04 " );	// Well, then we'll never know.
	AI_Output(self,other, " DIA_Pablo_Add_12_02 " );	// If you have any problems, go and talk to Lord Andre. Perhaps he can help. You will find him in the barracks.
	AI_StopProcessInfos(self);
};

instance DAY_PABLO_RUPERT (C_Info)
{
	npc = MIL_319_Paul;
	nr = 1;
	condition = DIA_PABLO_RUPERT_condition;
	information = DIA_PABLO_RUPERT_info;
	permanent = FALSE;
	description = " Rupert sent me. " ;
};

func int DIA_PABLO_RUPERT_condition()
{
	if((CanTeachTownMaster == FALSE) && (RupertSendPablo == TRUE))
	{
		return TRUE;
	};
};

func void PABLO_DAY_RUPERT_info()
{
	AI_Output(other,self, " DIA_PABLO_RUPERT_01_01 " );	// Rupert sent me.
	AI_Output(self,other, " DIA_PABLO_RUPERT_01_02 " );	// (unhappy) So what?
	AI_Output(other,self, " DIA_PABLO_RUPERT_01_03 " );	// He said you could help me win over the masters of this quarter.
	AI_Output(self,other, " DIA_PABLO_RUPERT_01_04 " );	// What, none of them want to talk to you, right?
	AI_Output(other,self, " DIA_PABLO_RUPERT_01_05 " );	// They all take me for a beggar.
	AI_Output(self,other, " DIA_PABLO_RUPERT_01_06 " );	// This is not surprising. You look a lot like a suspicious vagabond, and people like you are not particularly welcome here.
	AI_PlayAni(self,"T_SEARCH");

	if((ComeThrowSea == FALSE) && (LotarTrueCome == TRUE))
	{
		AI_Output(self,other, " DIA_PABLO_RUPERT_01_07 " );	// I'll say even more. If I hadn't seen with my own eyes the guards let you in...
		AI_Output(self,other, " DIA_PABLO_RUPERT_01_08 " );	// ...and that the paladin Lothar spoke to you, I would have you captured and taken to the militia barracks for interrogation.
		AI_Output(other,self, " DIA_PABLO_RUPERT_01_09 " );	// Well, you have a chance to do it now.
	};

	AI_Output(self,other, " DIA_PABLO_RUPERT_01_10 " );	// Come on. No offense! I can already see that you are a decent person.
	AI_Output(self,other, " DIA_PABLO_RUPERT_01_11 " );	// I've got an eye for this, trust me.
	AI_Output(self,other, " DIA_PABLO_RUPERT_01_12 " );	// So I'll help you. (seriously) But first, you need to get some proper clothes.
	AI_Output(self,other, " DIA_PABLO_RUPERT_01_13 " );	// For the rags you're wearing right now are no good!
	AI_Output(other,self, " DIA_PABLO_RUPERT_01_14 " );	// Where can I get it?
	AI_Output(self,other, " DIA_PABLO_RUPERT_01_15 " );	// Go to Hannah, the owner of the inn opposite the militia barracks. And tell her that I sent you.
	AI_Output(self,other, " DIA_PABLO_RUPERT_01_16 " );	// Let her sell you normal and clean clothes.
	AI_Output(self,other, " DIA_PABLO_RUPERT_01_17 " );	// Well, then we'll talk about the rest. Everyone, go.
	MIS_PathFromDown = LOG_Running;
	Log_CreateTopic(Topic_PathFromDown,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PathFromDown,LOG_Running);
	; _ _ _ _
};

instance DIA_Pablo_PathFromDown ( C_Info );
{
	npc = MIL_319_Paul;
	nr = 1;
	condition = DIA_Pablo_PathFromDown_condition;
	information = DIA_Pablo_PathFromDown_info;
	permanent = TRUE;
	description = " How do you like my clothes? " ;
};

func int DIA_Pablo_PathFromDown_condition()
{
	if((CanTeachTownMaster == FALSE) && (MIS_PathFromDown == LOG_Running) && (Hanna_LeatherBought == TRUE) && (PabloQuestsUp == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Paul_PathFromDown_info()
{
	AI_Output(other,self, " DIA_Pablo_PathFromDown_01_01 " );	// How do you like my clothes?

	if(VlkL_ArmorUp == TRUE)
	{
		B_GivePlayerXP(200);
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_02 " );	// Yes, this is much better. Now you look like a simple inhabitant of this city.
		AI_Output(other,self, " DIA_Pablo_PathFromDown_01_03 " );	// What's next?
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_04 " );	// Now you need to take care of your reputation. Without her, you won't get anywhere.
		AI_Output(other,self, " DIA_Pablo_PathFromDown_01_05 " );	// And how can I do this?
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_06 " );	// For people like you, there's only one way to win her.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_07 " );	// And he will definitely lead you to the port area of ​​the city.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_08 " );	// Despite the fact that there are mostly riffraff hanging around...
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_09 " );	// ...it also houses many people whose opinion is far from the last in this quarter.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_10 " );	// Try to earn their respect.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_11 " );	// And then I will make sure that the masters begin to treat you with trust.
		AI_Output(other,self, " DIA_Pablo_PathFromDown_01_12 " );	// And who are these people?
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_13 " );	// One of them is Cardiff, the owner of a tavern in the port. Then Karl, the port blacksmith.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_14 " );	// In addition, there are also Ibrahim, Garvell, Edda and Halvor. You'd better talk to them too.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_15 " );	// And, of course, the usurer Lemar! Where do without him.
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_16 " );	// In my opinion, this is generally the most influential person in the city.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_17 " );	// (hesitantly) Well, speaking informally, of course.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_18 " );	// In general, talk to them, impress them, help them in any way you can.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_19 " );	// And there, you see, you already enter the quarter of artisans.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_20 " );	// Well, do you remember everything?
		AI_Output(other,self, " DIA_Pablo_PathFromDown_01_21 " );	// Yes. I only have one question.
		AI_Output(other,self, " DIA_Pablo_PathFromDown_01_22 " );	// Can't this be done faster?
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_23 " );	// Well, why not? Can!
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_24 " );	// If you join one of the major factions on this island, the artisans won't deny you a conversation.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_25 " );	// But for this you will have to sweat a lot. Even in the militia, not everyone is taken!
		AI_Output(other,self,"DIA_Pablo_PathFromDown_01_26");	//Понимаю.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_27 " );	// Well, if you understand, then let's get down to business.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_28 " );	// Yes, and I have no time to stand here with you to chatter.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_29 " );	// And then once again be distracted at the post ... In general, you yourself understand.
		PabloQuestsUp = TRUE ;
		B_LogEntry(TOPIC_PathFromDown, " Now I have to earn the respect of the people in the city's waterfront, like Cardiff, Lemar, Carl, and others. Then Pablo will make sure the craftsmen trust me. " );
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_30 " );	// Somehow I don't see it on you... (maliciously) You still look like a tramp.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_01_31 " );	// Dress decently, then come.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Pablo_PathFromDown_Rumors ( C_Info );
{
	npc = MIL_319_Paul;
	nr = 1;
	condition = DIA_Pablo_PathFromDown_Rumors_condition;
	information = DIA_Pablo_PathFromDown_Rumors_info;
	permanent = TRUE;
	description = " What do they say about me in the city? " ;
};

func int DIA_Pablo_PathFromDown_Rumors_condition()
{
	if ((CanTeachTownMaster ==  FALSE ) && (MY_PathFromDown == LOG_Running) && (PaulQuestsUp ==  TRUE ) && (PaulSpeakUp ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Pablo_PathFromDown_Rumors_info()
{
	var int CountXPS;
	var int CountXPALL;

	CountXPS = 0;

	AI_Output(other,self, " DIA_Pablo_PathFromDown_Rumors_01_01 " );	// What do they say about me in the city?
	AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_02 " );	// Hmmm. Let's see.

	if((MIS_MOEBORED == LOG_SUCCESS) && (MOEBORED == FALSE))
	{
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_03 " );	// Cardiff says you helped him deal with Mo.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_04 " );	// This bastard no longer scares off his visitors.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		MOEBORED = TRUE;
	};
	if((MIS_EddaStatue == LOG_SUCCESS) && (EddaStatue == FALSE))
	{
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_05 " );	// Edda told me that you helped her return the figurine of Innos.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_06 " );	// That's a noble act of you.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		EddaStatue = TRUE;
	};
	if((MIS_CarlCoal == LOG_SUCCESS) && (CarlCoal == FALSE))
	{
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_07 " );	// Blacksmith Carl speaks rather flatteringly of you.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_08 " );	// I don't know why all of a sudden. But the fact remains.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		CarlCoal = TRUE;
	};
	if((MIS_GarvellTools == LOG_SUCCESS) && (GarvellTools == FALSE))
	{
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_09 " );	// You helped Garvell build his boat.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_10 " );	// Sounds like crazy to me! But still, help is help.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		GarvellTools = TRUE;
	};
	if((MIS_BrahimWax == LOG_SUCCESS) && (BrahimWax == FALSE))
	{
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_11 " );	// Ibrahim said that you helped him in one very important matter for him.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_12 " );	// Now he owes you. Not bad.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		BrahimWax = TRUE;
	};
	if((MIS_HalvorShells == LOG_SUCCESS) && (HalvorShells == FALSE))
	{
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_13 " );	// Halvor says you worked for him and did a good job with his assignment.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_14 " );	// This guy, although a fishmonger, is in fact one of the most respected people in the harbor area.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_15 " );	// So his good recommendations are only a big plus for you.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		HalvorShells = TRUE;
	};
	if((MIS_LehmarDebt == LOG_SUCCESS) && (LehmarDebt == FALSE))
	{
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_16 " );	// Lemar. I didn't think you could impress him.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_17 " );	// But he seems to think you're a pretty smart guy.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_18 " );	// This is very important, since almost everyone in this city listens to his voice.
		CountRumors = CountRumors + 1;
		CountXPS = CountXPS + 1;
		LehmarDebt = TRUE;
	};
	if(CountXPS >= 1)
	{
		CountXPALL = CountXPS * 100;
		B_GivePlayerXP(CountXPALL);
		CountXPS = 0;
	};
	if(CountRumors >= 6)
	{
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_19 " );	// Yes. You have won the respect of many people here!
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_20 " );	// I think that now I can convince the masters to trust you.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_21 " );	// Well, or at least listen to you.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_22 " );	// True, this will take me some time. You understand that such issues are not quickly resolved.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_23 " );	// So go ahead. And from tomorrow morning you can try to talk to one of them.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_24 " );	// Got it?
		AI_Output(other,self, " DIA_Pablo_PathFromDown_Rumors_01_25 " );	// Yes, of course.
		PabloSpeakUp = TRUE;
		PabloSpeakUpDay = Wld_GetDay();
		B_LogEntry(TOPIC_PathFromDown, " Pablo thinks I've won the respect of enough people that he can talk to the masters. He said I could try talking to one of them tomorrow morning. " );
		AI_StopProcessInfos(self);
	}
	else if(CountRumors == FALSE)
	{
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_26 " );	// Don't say anything! You haven't really helped anyone yet, and you're already asking about it.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_27 " );	// So it's better to go and do something than to distract me with empty questions.
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_28 " );	// In general - good.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_29 " );	// But not enough to impress the masters.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_30 " );	// Try to chat with other people.
		AI_Output(self,other, " DIA_Pablo_PathFromDown_Rumors_01_31 " );	// I'm sure you can still show your best side.
		AI_Output(other,self, " DIA_Pablo_PathFromDown_Rumors_01_32 " );	// I'll try.
		AI_StopProcessInfos(self);
	};
};

instances of DIA_Pablo_Banditen (C_Info)
{
	npc = MIL_319_Paul;
	nr = 3;
	condition = DIA_Pablo_Banditen_Condition;
	information = DIA_Pablo_Bandits_Info;
	permanent = FALSE;
	description = " What do you know about these bandits? " ;
};

func int DIA_Pablo_Banditen_Condition()
{
	return TRUE;
};

func void DIA_Pablo_Banditen_Info()
{
	AI_Output(other,self, " DIA_Pablo_Add_15_03 " );	// What do you know about these bandits?
	AI_Output(self,other, " DIA_Pablo_Add_12_04 " );	// They all came from this damn colony. But then they split into several groups.
	AI_Output(self,other, " DIA_Pablo_Add_12_05 " );	// Some of them made a lair in the mountains, while others joined Onar.
	AI_Output(self,other, " DIA_Pablo_Add_12_06 " );	// But the bandits around the city cause the most problems.
	AI_Output(self,other, " DIA_Pablo_Add_12_07 " );	// That's why none of the merchants even stick their noses out of the city gates.
};

instances DIA_PABLO_BANDITEN_IGN (C_Info)
{
	npc = MIL_319_Paul;
	nr = 5;
	condition = dia_pablo_banditen_ign_condition;
	information = dia_pablo_banditen_ign_info;
	permanent = FALSE;
	description = " Notice anything suspicious? " ;
};

func int dia_pablo_banditen_ign_condition()
{
	if (( MIS_KILLIGNAZ  == LOG_Running) && ( READORTER  ==  FALSE ) && ( HELPKILLIGNAZ  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_pablo_banditen_ign_info()
{
	AI_Output(other,self, " DIA_Pablo_Add_Ign_15_03 " );	// Spotted anything suspicious?
	AI_Output(self,other, " DIA_Pablo_Add_Ign_12_04 " );	// There are all sorts of people hanging around here, so someone killed Ignaz.
	AI_Output(self,other, " DIA_Pablo_Add_Ign_12_05 " );	// Personally, I didn't see anyone, but the guys were talking about some suspicious person.
	AI_Output(self,other, " DIA_Pablo_Add_Ign_12_06 " );	// Ask the townspeople and the guards at the east gate, the last time he seemed to be seen there.
};

instance DIA_Pablo_HakonBandits(C_Info)
{
	npc = MIL_319_Paul;
	nr = 3;
	condition = DIA_Pablo_HakonBandits_Condition;
	information = DIA_Pablo_HakonBandits_Info;
	permanent = FALSE;
	description = " What do you know about the bandits that robbed the trader Hakon? " ;
};

func int DIA_Pablo_HakonBandits_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Hakon_Miliz ) && Npc_KnowsInfo ( other , DIA_Pablo_Banditen ))
	{
		return TRUE;
	};
};

func void DIA_Pablo_HakonBandits_Info()
{
	AI_Output(other,self, " DIA_Pablo_Add_15_20 " );	// What do you know about the bandits who robbed Hakon the merchant?
	AI_Output(self,other, " DIA_Pablo_Add_12_21 " );	// Oh, THIS is the case! Don't remind me...
	AI_Output(self,other, " DIA_Pablo_Add_12_22 " );	// As far as I know, they are responsible for most attacks on merchants.
	AI_Output(self,other, " DIA_Pablo_Banditen_12_01 " );	// These rats crawled into their hole and don't come out anymore.
	AI_Output(self,other, " DIA_Pablo_Banditen_12_02 " );	// Somehow we even managed to track them down and chase them. But we had to break off the chase in the forest near the city.
	AI_Output(self,other, " DIA_Pablo_Banditen_12_03 " );	// There are too many animals roaming around, and it's too dangerous.
	B_LogEntry(TOPIC_HakonBanditen, " The bandits who robbed Hakon are hiding somewhere in the forest near the city. " );
	if (Pablo_AndreMelden ==  FALSE )
	{
		AI_Output(self,other, " DIA_Pablo_Add_12_23 " );	// But there's one more thing...
		AI_Output(self,other, " DIA_Pablo_Banditen_12_04 " );	// Some of the stolen goods surfaced in Khorinis.
		AI_Output(other,self, " DIA_Pablo_Banditen_15_05 " );	// This means that they have the ability to smuggle goods into the city and sell them.
		AI_Output(self,other, " DIA_Pablo_Banditen_12_06 " );	// Yes, we suspect they have a man in town. But we haven't been able to catch him yet.
		AI_Output(self,other, " DIA_Pablo_Banditen_12_07 " );	// If you can find out anything about this case, remember that Lord Andre has put a bounty on the head of this fence dealer.
		B_LogEntry(TOPIC_HakonBanditen, " These bandits are probably in cahoots with some of the city's businessmen. Lord Andre has put a bounty on this businessman's head. " );
	};
};

instance DIA_Pablo_MyBandits(C_Info)
{
	npc = MIL_319_Paul;
	nr = 4;
	condition = DIA_Pablo_MyBandits_Condition;
	information = DIA_Pablo_MyBandits_Info;
	permanent = FALSE;
	description = " Where did the bandits come from who they found a sheet with my picture on? " ;
};

func int DIA_Pablo_MyBandits_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Pablo_Banditen ) && Npc_KnowsInfo ( other , DIA_Pablo_WANTED ))
	{
		return TRUE;
	};
};

func void DIA_Pablo_MyBandits_Info()
{
	AI_Output(other,self, " DIA_Pablo_Add_15_08 " );	// And where did the bandits come from, from whom they found a sheet with my image?

	if(Pablo_belogen == TRUE)
	{
		AI_Output(self,other, " DIA_Pablo_Add_12_09 " );	// A-HA! So it's still YOUR physiognomy there. Why didn't you admit it right away?
		AI_Output(self,other, " DIA_Pablo_Add_12_10 " );	// (demanding) Why are you wanted?
		AI_Output(other,self, " DIA_Pablo_Add_15_11 " );	// I don't know - honestly!
		AI_Output(self,other, " DIA_Pablo_Add_12_12 " );	// Yes, yes. Of course. I want you to understand something. If I thought that you were an accomplice of these bandits, you would already be resting behind bars.
		AI_Output(self,other, " DIA_Pablo_Add_12_13 " );	// Still, I'd better report this incident to Lord Andre.
		Pablo_AndreMelden = TRUE;
		AI_Output(self,other, " DIA_Pablo_Add_12_14 " );	// But, to answer your question...
	};
	AI_Output(self,other, " DIA_Pablo_Add_12_15 " );	// We found them near Onar's estate.
	AI_Output(self,other, " DIA_Pablo_Add_12_16 " );	// But they didn't look like his people.
	AI_Output(self,other, " DIA_Pablo_Add_12_17 " );	// I think they were part of a gang that settled in the mountains.
	AI_Output(self,other, " DIA_Pablo_Add_12_18 " );	// But if you want to go there, let me warn you. These thugs can make a cutlet out of anyone!
	AI_Output(other,self, " DIA_Pablo_Add_15_19 " );	// I'll remember this.
};


instance DIA_Pablo_Perm(C_Info)
{
	npc = MIL_319_Paul;
	nr = 1;
	condition = DIA_Pablo_Perm_Condition;
	information = DIA_Pablo_Perm_Info;
	permanent = TRUE;
	description = " How are things? " ;
};

func int DIA_Pablo_Perm_Condition()
{
	return TRUE;
};

func void DAY_Paul_Perm_Info()
{
	AI_Output(other,self, " DIA_Pablo_Perm_15_00 " );	// How are things?

	if (chapter ==  3 )
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other, " DIA_Pablo_Perm_12_01 " );	// I've always said these mercenaries can't be trusted.
				AI_Output(self,other, " DIA_Pablo_Perm_12_02 " );	// It's time to teach this rabble a lesson! Bennett couldn't have done all this alone.
			}
			else if((hero.guild == GIL_KDF) || (hero.guild == GIL_KDW))
			{
				AI_Output(self,other, " DIA_Pablo_Perm_12_03 " );	// I am deeply shocked by the murder of the venerable paladin Lothar.
				AI_Output(self,other, " DIA_Pablo_Perm_12_04 " );	// But I know that the church will choose a fair punishment for this villain.
			}
			else if((hero.guild == GIL_SEK) || (hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
			{
				AI_Output(self,other, " DIA_Pablo_Perm_12_04A " );	// What are you doing here, swamp?
			}
			else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
			{
				AI_Output(self,other, " DIA_Pablo_Perm_12_05 " );	// What are you doing here? If you're going to free your mercenary buddy, you better forget about it!
			}
			else
			{
				AI_Output(self,other, " DIA_Pablo_Perm_12_05A " );	// Please don't distract me from my service. I have a lot to do.
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Pablo_Perm_12_06 " );	// This worries me. Now they are trying to pit us against each other.
			AI_Output(self,other, " DIA_Pablo_Perm_12_07 " );	// If you couldn't find the real killer, the orcs wouldn't even have to do anything.
		};
	}
	else  if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_Pablo_Perm_12_08 " );	// I don't know what will happen to us if the paladins leave here.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Pablo_Perm_12_09 " );	// You can count on us, we'll do our best to keep this city from turning into a hangout for bandits.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other, " DIA_Pablo_Perm_12_10 " );	// Try to behave properly. We don't take our eyes off people like you.
	}
	else
	{
		AI_Output(self,other, " DIA_Pablo_Perm_12_11 " );	// So far so good. Only bandits near the city give us little problems.
	};
};
