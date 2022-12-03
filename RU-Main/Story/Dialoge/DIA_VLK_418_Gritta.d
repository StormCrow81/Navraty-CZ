

instance DIA_Gritta_EXIT(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 999;
	condition = DIA_Gritta_EXIT_Condition;
	information = DIA_Gritta_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gritta_EXIT_Condition()
{
	if(Kapitel <= 2)
	{
		return TRUE;
	};
};

func void DIA_Gritta_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Gritta_PICKPOCKET(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 900;
	condition = DIA_Gritta_PICKPOCKET_Condition;
	information = DIA_Gritta_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Gritta_PICKPOCKET_Condition()
{
	return C_Beklauen(20,20);
};

func void DIA_Gritta_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
	Info_AddChoice(DIA_Gritta_PICKPOCKET,Dialog_Back,DIA_Gritta_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Gritta_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Gritta_PICKPOCKET_DoIt);
};

func void DIA_Gritta_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
};

func void DIA_Gritta_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Gritta_PICKPOCKET);
};


instance DIA_Gritta_Hello(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 10;
	condition = DIA_Gritta_Hello_Condition;
	information = DIA_Gritta_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Gritta_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE) && ((GRITTACANFOUND == FALSE) || (GRITTAISBACK == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Gritta_Hello_Info()
{
	AI_Output(self,other, " DIA_Gritta_Hello_16_00 " );	// What do you want, outlander? If you've come to beg, I have to disappoint you. I am a poor widow.
	AI_Output(self,other, " DIA_Gritta_Hello_16_01 " );	// My name is Gritta. Since my husband's death, I have been watching the house of my uncle, Torben.
};


instance DIA_Gritta_WantsMoney(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 2;
	condition = DIA_Gritta_WantsMoney_Condition;
	information = DIA_Gritta_WantsMoney_Info;
	permanent = FALSE;
	description = " Matteo sent me. He says you owe him. " ;
};

func int DIA_Gritta_WantsMoney_Condition()
{
	if((MIS_Matteo_Gold == LOG_Running) && ((GRITTACANFOUND == FALSE) || (GRITTAISBACK == TRUE)))
	{
		return TRUE;
	};
};


var int Gritta_WantPay;
var int Gritta_Threatened;

func void DIA_Gritta_WantsMoney_Info()
{
	AI_Output(other,self, " DIA_Gritta_WantsMoney_15_00 " );	// Matteo sent me. He says you owe him.
	AI_Output(self,other, " DIA_Gritta_WantsMoney_16_01 " );	// Does he want money? For what? What he sent me is useless. The fabric is disgusting, and the seams are coming apart right before our eyes.
	AI_Output(self,other, " DIA_Gritta_WantsMoney_16_02 " );	// Did you pick out what color they are? This is not the color I ordered. This is a swindle!
	AI_Output(self,other, " DIA_Gritta_WantsMoney_16_03 " );	// Look, if my husband were alive, he wouldn't dare say that. Oh my poor husband...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, " Enough. Where's the gold? " ,DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, " Continue... " ,DIA_Gritta_WantsMoney_Continue01);
};

func void DIA_Gritta_WantsMoney_Continue01()
{
	AI_Output(self,other, " DIA_Gritta_WantsMoney_continue01_16_00 " );	// ...he was such a nice person. Handsome, hardworking, a real gentleman. We had everything. Wealth, happiness...
	AI_Output(self,other, " DIA_Gritta_WantsMoney_Continue01_16_01 " );	// ...sometimes we were even invited to high society. For celebrations where you could show off your outfit and hairstyle ...
	AI_Output(self,other, " DIA_Gritta_WantsMoney_Continue01_16_02 " );	// ...at dinner parties... Back then, things were very different. Then no one would have dared to humiliate the poor widow with such...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, " Enough. Where's the gold? " ,DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, " Continue... " ,DIA_Gritta_WantsMoney_Continue02);
};

func void DIA_Gritta_WantsMoney_Continue02()
{
	AI_Output(self,other, " DIA_Gritta_WantsMoney_continue02_16_00 " );	// ...ridiculous statements. What should I do now? My pension barely allows me to make ends meet, and life is getting harder and harder. Yes, you can see it for yourself...
	AI_Output(self,other, " DIA_Gritta_WantsMoney_Continue02_16_01 " );	// ...people have to save money and tighten their belts. For many weeks no ship had entered the city. My husband was the captain of a merchant ship - in fact, he even owned this ship...
	AI_Output(self,other, " DIA_Gritta_WantsMoney_Continue02_16_02 " );	// ...from his long voyages, he always brought me gifts - exquisite fabrics from the mainland, expensive spices from southern countries...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, " Enough. Where's the gold? " ,DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, " Continue... " ,DIA_Gritta_WantsMoney_Continue03);
};

func void DIA_Gritta_WantsMoney_Continue03()
{
	AI_Output(self,other, " DIA_Gritta_WantsMoney_continue03_16_00 " );	// ...most people haven't even heard of these things. But one day, I received the news that Gritta sank - that was the name of this ship, my husband called it that from ...
	AI_Output(self,other, " DIA_Gritta_WantsMoney_Continue03_16_01 " );	// ...love me. I cried and prayed that my husband would be able to survive this catastrophe. I hoped, I waited for news of him, but all my prayers were in vain...
	AI_Output(self,other, " DIA_Gritta_WantsMoney_Continue04_16_02 " );	// ...let Innos have mercy on his soul. Let him sleep in peace. Since then, I have had to live in these modest conditions. And now that soulless, heartless Matteo...
	AI_Output(self,other, " DIA_Gritta_WantsMoney_Continue04_16_03 " );	// ...wants to rob me of my last savings. Please have pity on the poor woman. If my husband were alive, Matteo would not have dared to do this. Oh my poor husband...
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, " Enough. Where's the gold? " ,DIA_Gritta_WantsMoney_WhereMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, " Continue... " ,DIA_Gritta_WantsMoney_Continue01);
};

func void DIA_Gritta_WantsMoney_WhereMoney()
{
	AI_Output(other,self, " DIA_Gritta_WantsMoney_WhereMoney_15_00 " );	// Enough. Where is the gold?
	AI_Output(self,other, " DIA_Gritta_WantsMoney_WhereMoney_16_01 " );	// But I have no gold, I am a poor widow!
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Info_AddChoice(DIA_Gritta_WantsMoney, " Spread the money or I'll have to teach you a lesson! " ,DIA_Gritta_WantsMoney_BeatUp);
	Info_AddChoice(DIA_Gritta_WantsMoney, " Looks like I'll have to sell your stuff. " ,DIA_Gritta_WantsMoney_EnoughStuff);
	Info_AddChoice(DIA_Gritta_WantsMoney, " I'm going to pay this amount for you. " ,DIA_Gritta_WantsMoney_IWillPay);
};

func void DIA_Gritta_WantsMoney_EnoughStuff()
{
	AI_Output(other,self, " DIA_Gritta_WantsMoney_EnoughStuff_15_00 " );	// Well, then we'll just sell some of your rags. I'm sure you have a whole pile of them in your chest.
	AI_Output(self,other, " DIA_Gritta_WantsMoney_EnoughStuff_16_01 " );	// How dare you, redneck! Okay, here, take the gold.
	B_GiveInvItems(self,other,ItMi_Gold,100);
	AI_Output(other,self, " DIA_Gritta_WantsMoney_EnoughStuff_15_02 " );	// See, it wasn't that hard.
	AI_Output(self,other, " DIA_Gritta_WantsMoney_EnoughStuff_16_03 " );	// Now please leave my house!
	Gritta_GoldGiven = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Gritta_WantsMoney_IWillPay()
{
	AI_Output(other,self, " DIA_Gritta_WantsMoney_IWillPay_15_00 " );	// I'm going to pay this amount for you.
	AI_Output(self,other, " DIA_Gritta_WantsMoney_IWillPay_16_01 " );	// Will you do this for me? Oh, I knew you weren't as greedy as that Matteo!
	AI_Output(other,self, " DIA_Gritta_WantsMoney_IWillPay_15_02 " );	// Yes, yes, no thanks.
	AI_Output(self,other, " DIA_Gritta_WantsMoney_IWillPay_16_03 " );	// Come back when you return the money to Matteo - I want to thank you.
	Info_ClearChoices(DIA_Gritta_WantsMoney);
	Gritta_WantPay = TRUE;
};

func void DIA_Gritta_WantsMoney_BeatUp()
{
	AI_Output(other,self, " DIA_Gritta_WantsMoney_BeatUp_15_00 " );	// (threateningly) Spread the money or I'll have to teach you a lesson!
	AI_Output(self,other, " DIA_Gritta_WantsMoney_BeatUp_16_01 " );	// (defiantly) You're just an ordinary bandit. Come on, draw your weapon and I'll call the guards!
	Gritta_Threatened = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Gritta_WINE(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 2;
	condition = DIA_Gritta_WINE_Condition;
	information = DIA_Gritta_WINE_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Gritta_WINE_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Gritta_WantPay == TRUE) && (MIS_Matteo_Gold == LOG_SUCCESS) && ((GRITTACANFOUND == FALSE) || (GRITTAISBACK == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Gritta_WINE_Info()
{
	AI_Output(self,other, " DIA_Gritta_WINE_16_00 " );	// It was very noble of you to pay for me. I want to thank you.
	AI_Output(self,other, " DIA_Gritta_WINE_16_01 " );	// Here is a bottle of wine that my husband, may Innos rest his soul, brought from the southern islands.
	AI_Output(self,other, " DIA_Gritta_WINE_16_02 " );	// I'll also tell everyone about you! Finally, a man appeared in the city, whose virtue...
	AI_Output(other,self, " DIA_Gritta_WINE_15_03 " );	// Yes, yes, no thanks.
	B_GivePlayerXP(XP_PayForGritta);
	B_GiveInvItems(self,other,ItFo_Wine_Gritta,1);
	AI_StopProcessInfos(self);
};

instance DIA_Gritta_PERM(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 3;
	condition = DIA_Gritta_PERM_Condition;
	information = DIA_Gritta_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Gritta_PERM_Condition()
{
	if ( Npc_IsInState ( self , ZS_Talk ) && Npc_KnowsInfo ( other , DIA_Gritta_WantsMoney ) & & ( MY_Matteo_Gold == LOG_Running ) && ( ( GRITTACANFOUND == FALSE ) || ( GRITTAISBACK == TRUE ))) .    
	{
		return TRUE;
	};
};

func void DIA_Gritta_PERM_Info()
{
	if(Gritta_WantPay == TRUE)
	{
		AI_Output(self,other, " DIA_Gritta_PERM_16_00 " );	// As long as there are people like you in the city, I still have hope that everything will still be fine.
		AI_Output(self,other, " DIA_Gritta_PERM_16_01 " );	// Come back when you've dealt with Matteo.
		AI_StopProcessInfos(self);
	}
	else if(Gritta_Threatened == TRUE)
	{
		AI_Output(self,other, " DIA_Gritta_PERM_16_02 " );	// Why are you staring at me like an idiot? You still don't dare to hit me!
		AI_StopProcessInfos(self);
	}
	else if(Gritta_GoldGiven == TRUE)
	{
		AI_Output(self,other, " DIA_Gritta_PERM_16_03 " );	// What else do you need? You got my gold, get out.
		AI_StopProcessInfos(self);
	};
};


instance DIA_Gritta_Kap3_EXIT(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 999;
	condition = DIA_Gritta_Kap3_EXIT_Condition;
	information = DIA_Gritta_Kap3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Gritta_Kap3_EXIT_Condition()
{
	if (Chapter >=  3 )
	{
		return TRUE;
	};
};

func void DIA_Gritta_Kap3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int GrittaXP_Once;

instance DIA_Gritta_Perm3U4U5(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 31;
	condition = DIA_Gritta_Perm3U4U5_Condition;
	information = DIA_Gritta_Perm3U4U5_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Gritta_Perm3U4U5_Condition()
{
	if((GRITTACANFOUND == FALSE) || (GRITTAISBACK == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Gritta_Perm3U4U5_Info()
{
	AI_Output(other,self, " DIA_Gritta_Perm3U4U5_15_00 " );	// How are you?
	if (chapter ==  3 )
	{
		if(MIS_RescueBennet != LOG_SUCCESS)
		{
			AI_Output(self,other, " DIA_Gritta_Perm3U4U5_16_01 " );	// Everything here is going to hell. Everywhere you look, there are only crimes and violence. Just imagine, even a paladin was recently killed!
			Info_ClearChoices(DIA_Gritta_Perm3U4U5);
			Info_AddChoice(DIA_Gritta_Perm3U4U5,Dialog_Back,DIA_Gritta_Perm3U4U5_BACK);
			Info_AddChoice(DIA_Gritta_Perm3U4U5, " This is a war and things like this happen at this time. " ,DIA_Gritta_Perm3U4U5_War);
			Info_AddChoice(DIA_Gritta_Perm3U4U5, " This will pass. " ,DIA_Gritta_Perm3U4U5_TurnsGood);
			Info_AddChoice(DIA_Gritta_Perm3U4U5, " What did you hear? " ,DIA_Gritta_Perm3U4U5_Rumors);
		}
		else
		{
			AI_Output(self,other, " DIA_Gritta_Perm3U4U5_16_02 " );	// Oh, I'm so excited. Lord Hagen freed this mercenary.
			AI_Output(other,self, " DIA_Gritta_Perm3U4U5_15_03 " );	// What does this have to do with you?
			AI_Output(self,other, " DIA_Gritta_Perm3U4U5_16_04 " );	// Yes, you yourself think. Do you believe that the mercenaries would have sat with their hands folded when their comrade was about to be hanged?
			AI_Output(self,other, " DIA_Gritta_Perm3U4U5_16_05 " );	// They would try to free him, and there would be a lot of bloodshed. But, thank Innos, everything was resolved successfully.
		};
	}
	else  if (chapter ==  5 )
	{
		AI_Output(self,other, " DIA_Gritta_Perm3U4U5_16_06 " );	// The paladins are preparing for something. Looks like they're about to leave town.
	}
	else
	{
		AI_Output(self,other, " DIA_Gritta_Perm3U4U5_16_07 " );	// Everything is as usual, but I don't want to complain.
	};
};

func void DIA_Gritta_Perm3U4U5_BACK()
{
	Info_ClearChoices(DIA_Gritta_Perm3U4U5);
};

func void DIA_Gritta_Perm3U4U5_War()
{
	AI_Output(other,self, " DIA_Gritta_Perm3U4U5_War_15_00 " );	// This war is for you. That happens.
	AI_Output(self,other, " DIA_Gritta_Perm3U4U5_War_16_01 " );	// Yes, this terrible war is to blame. Everyone suffers from it. I don't even know how they manage to make ends meet.
	AI_Output(self,other, " DIA_Gritta_Perm3U4U5_War_16_02 " );	// Sometimes I ask myself what we did to deserve such punishment from Innos.
};

func void DIA_Gritta_Perm3U4U5_TurnsGood()
{
	AI_Output(other,self, " DIA_Gritta_Perm3U4U5_TurnsGood_15_00 " );	// Everything will be fine.
	AI_Output(self,other, " DIA_Gritta_Perm3U4U5_TurnsGood_16_01 " );	// You're trying to cheer me up. This is cute.
	if(GrittaXP_Once == FALSE)
	{
		B_GivePlayerXP(XP_Ambient);
		GrittaXP_Once = TRUE;
	};
};

func void DIA_Gritta_Perm3U4U5_Rumors()
{
	AI_Output(other,self, " DIA_Gritta_Perm3U4U5_Rumors_15_00 " );	// What did you hear?
	AI_Output(self,other, " DIA_Gritta_Perm3U4U5_Rumors_16_01 " );	// Just what they say on the street.
	AI_Output(self,other, " DIA_Gritta_Perm3U4U5_Rumors_16_02 " );	// Supposedly the killer has already been captured, but I can't tell you for sure.
};


instance DIA_GRITTA_MIISSBANDITS(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_miissbandits_condition;
	information = dia_gritta_miissbandits_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_gritta_miissbandits_condition()
{
	if((MIS_MISSGRITTA == LOG_Running) && (GRITTACANFOUND == TRUE) && (GRITTAISBACK == FALSE) && (GRITTACANFOLLOW == FALSE))
	{
		return TRUE;
	};
};

func void dia_gritta_miissbandits_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_Gritta_MiissBandits_01_00 " );	// You?! What do you want? Why did you kill all those merchants?
	AI_Output(self,other, " DIA_Gritta_MiissBandits_01_02 " );	// They were going to sell me fabric at a bargain price!
	AI_Output(other,self, " DIA_Gritta_MiissBandits_01_03 " );	// Don't you understand - they were bandits!
	AI_Output(self,other, " DIA_Gritta_MiissBandits_01_04 " );	// What bandits?! What nonsense are you talking about?
	AI_Output(other,self, " DIA_Gritta_MiissBandits_01_05 " );	// Look around!
	AI_Output(other,self, " DIA_Gritta_MiissBandits_01_06 " );	// What are merchants doing in the forest, and even armed to the teeth?
	AI_Output(self,other, " DIA_Gritta_MiissBandits_01_07 " );	// But... (confused) What do you mean by that?
	AI_Output(other,self, " DIA_Gritta_MiissBandits_01_08 " );	// You just got kidnapped!
	AI_Output(self,other, " DIA_Gritta_MiissBandits_01_10 " );	// Oops...(totally confused) How is it? Oh my God!
	AI_Output(self,other, " DIA_Gritta_MiissBandits_01_12 " );	// Oh my god! What a fool I am!
	AI_Output(self,other, " DIA_Gritta_MiissBandits_01_13 " );	// And I couldn't understand why they didn't carry this cloth for so long?
	AI_Output(self,other, " DIA_Gritta_MiissBandits_01_15 " );	// And what do we do now?
	AI_Output(other,self, " DIA_Gritta_MiissBandits_01_17 " );	// Let's go - I'll take you back to the city to Torben.
	AI_Output(self,other, " DIA_Gritta_MiissBandits_01_19 " );	// (scared) Good.
	B_LogEntry( TOPIC_MISSGRITTA , " I found Gritta. Looks like she didn't even realize she was kidnapped. Now we need to take this lunatic to Torben. " );
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	GRITTACANFOLLOW = TRUE;
	Npc_ExchangeRoutine(self,"FOLLOW");
};


instance DIA_GRITTA_ANGEKOMMEN (C_Info)
{
	npc = VLK_418_Gritta;
	nr = 55;
	condition = dia_gritta_arrived_condition;
	information = dia_gritta_arrived_info;
	important = TRUE;
};


func int dia_gritta_arrived_condition()
{
	if((MIS_MISSGRITTA == LOG_Running) && (GRITTACANFOLLOW == TRUE) && (Npc_GetDistToWP(self,"NW_CITY_MERCHANT_SHOP01_FRONT_01") < 6000))
	{
		return TRUE;
	};
};

func void dia_gritta_arrived_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_Gritta_ANGEKOMMEN_01_00 " );	// Thank you! I think I can do it myself.
	AI_Output(other,self, " DIA_Gritta_ANGEKOMMEN_01_04 " );	// Don't waste time - go to Torben, he's worried about you!
	B_LogEntry( TOPIC_MISSGRITTA , " I took Gritta to Khorinis. " );
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	GRITTAISBACK = TRUE;
	Npc_ExchangeRoutine(self,"Start");
	GRITTASTIMER = Wld_GetDay();
};


instance DIA_GRITTA_FINDLOSTHUSB(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_findlosthusb_condition;
	information = dia_gritta_findlosthusb_info;
	permanent = FALSE;
	description = " Is everything okay? " ;
};


func int dia_gritta_findlosthusb_condition()
{
	where int daynow;
	daynow = Wld_GetDay();
	if((MIS_MISSGRITTA == LOG_SUCCESS) && (GRITTASTIMER < (daynow - 2)))
	{
		return TRUE;
	};
};

func void dia_gritta_findlosthusb_info()
{
	AI_Output(other,self, " DIA_Gritta_FindLostHusb_01_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_01_01 " );	// Yes. Everything is fine, but...
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_01_03 " );	// You see... Last night I had a dream that my husband was alive!
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_01_06 " );	// And now I can't find my place. And suddenly this is so? Is he really alive?
	AI_Output(other,self, " DIA_Gritta_FindLostHusb_01_07 " );	// And what are you going to do?
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_01_08 " );	// (sadly) What can I do? Maybe I should have gone looking for him.
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_01_09 " );	// But after that incident with the bandits, Torben won't let me leave the city anymore.
	AI_Output(other,self, " DIA_Gritta_FindLostHusb_01_11 " );	// Maybe then I can help?
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_01_14 " );	// Well... (embarrassed) You could help me a lot if you looked for my missing husband.
	Info_ClearChoices(dia_gritta_findlosthusb);
	Info_AddChoice(dia_gritta_findlosthusb, " Why not. " ,dia_gritta_findlosthusb_help);
	Info_AddChoice(dia_gritta_findlosthusb, " Sorry, I don't have time for this. " ,dia_gritta_findlosthusb_no);
};

func void dia_gritta_findlosthusb_no()
{
	AI_Output(other,self, " DIA_Gritta_FindLostHusb_No_01_00 " );	// Sorry, but I don't have time for that right now.
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_No_01_01 " );	// I understand...
	Info_ClearChoices(dia_gritta_findlosthusb);
};

func void dia_gritta_findlosthusb_help()
{
	AI_Output(other,self, " DIA_Gritta_FindLostHusb_Help_01_00 " );	// Why not.
	AI_Output(other,self, " DIA_Gritta_FindLostHusb_Help_01_01 " );	// But to start looking for him, I first need to know about his disappearance.
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_Help_01_04 " );	// My husband's name was Brandick. I think I already told you that he was lost at sea.
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_Help_01_07 " );	// You know, he always had only one dream - to become a sea wolf and an adventurer.
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_Help_01_08 " );	// Battles, battles, ocean expanses and a sea of ​​​​glory - that's what he really wanted.
	AI_Output(other,self, " DIA_Gritta_FindLostHusb_Help_01_09 " );	// Wow! Such a life is only fit for a pirate!
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_Help_01_10 " );	// Pirate? Yes, yes... (nostalgically) Brandick often talked about how he would like to become a pirate. Because it's so romantic!
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_Help_01_16 " );	// Hmmm...(thoughtfully) You know, in that dream I had, Brandick was wearing some strange clothes.
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_Help_01_17 " );	// It somewhat resembled the one that pirates usually wear.
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_Help_01_19 " );	// However, I can hardly believe that Brandick became a pirate.
	AI_Output(other,self, " DIA_Gritta_FindLostHusb_Help_01_22 " );	// If he really became a pirate, then I think I know where to look for him.
	AI_Output(self,other, " DIA_Gritta_FindLostHusb_Help_01_25 " );	// Okay, I'll wait for news from you!
	MIS_FINDLOSTHUSB = LOG_Running;
	Log_CreateTopic(TOPIC_FINDLOSTHUSB,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FINDLOSTHUSB,LOG_Running);
	B_LogEntry( TOPIC_FINDLOSTHUSB , " Gritta told me that she recently dreamed that her husband was alive. She asked me to look for him. Apparently, Brandick - that was her husband's name - became a pirate, because he always dreamed about it. I will have to visit to Greg's camp and ask him about this guy. " );
	Info_ClearChoices(dia_gritta_findlosthusb);
};


instance DIA_GRITTA_FINDLOSTHUSBDONE(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_findlosthusbdone_condition;
	information = dia_gritta_findlosthusbdone_info;
	permanent = FALSE;
	description = " Your husband is alive. " ;
};


func int dia_gritta_findlosthusbdone_condition()
{
	if((MIS_FINDLOSTHUSB == LOG_Running) && (BRENDIKNOTBACK == TRUE))
	{
		return TRUE;
	};
};

func void dia_gritta_findlosthusbdone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Gritta_FindLostHusbDone_01_00 " );	// Your husband is alive.
	AI_Output(self,other, " DIA_Gritta_FindLostHusbDone_01_01 " );	// (dazed) Did you find him? Is that really true?
	AI_Output(self,other, " DIA_Gritta_FindLostHusbDone_01_03 " );	// Oh, Innos! And where is he?
	AI_Output(other,self, " DIA_Gritta_FindLostHusbDone_01_04 " );	// Brandick became a pirate. And he seems to enjoy this activity very much.
	AI_Output(self,other, " DIA_Gritta_FindLostHusbDone_01_05 " );	// Incredible! Who would have thought...
	AI_Output(self,other, " DIA_Gritta_FindLostHusbDone_01_06 " );	// So, he finally fulfilled his dream.
	AI_Output(other,self, " DIA_Gritta_FindLostHusbDone_01_07 " );	// Yes, but he said he wouldn't come back to you.
	AI_Output(self,other, " DIA_Gritta_FindLostHusbDone_01_08 " );	// Well, I didn't really count on it... (sadly)
	AI_Output(self,other, " DIA_Gritta_FindLostHusbDone_01_09 " );	// At least I'll sleep peacefully knowing he's okay and truly happy!
	AI_Output(self,other, " DIA_Gritta_FindLostHusbDone_01_10 " );	// So thank you for bringing me good news!
	MIS_FINDLOSTHUSB = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FINDLOSTHUSB,LOG_SUCCESS);
	B_LogEntry( TOPIC_FINDLOSTHUSB , " Gritta was glad to know that her husband was alive - even though she would never see him again. " );
	if((MIS_LuciasLetter == LOG_SUCCESS) && (ELVRIHMARRYGRITTAFLAG == FALSE))
	{
		ELVRIHMARRYGRITTATIMER = Wld_GetDay();
		ELVRIHMARRYGRITTAFLAG = TRUE;
	};
};


instance DIA_GRITTA_ELVRICHGRITTA(C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_elvrichgritta_condition;
	information = dia_gritta_elvrichgritta_info;
	permanent = FALSE;
	description = " Still worried? " ;
};


func int dia_gritta_elvrichgritta_condition()
{
	if(MIS_ELVRIHMARRYGRITTA == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_gritta_elvrichgritta_info()
{
	AI_Output(other,self, " DIA_Gritta_ElvrichGritta_01_00 " );	// Still worried?
	AI_Output(self,other, " DIA_Gritta_ElvrichGritta_01_03 " );	// Yes, and it's a bit difficult for me alone. After all, when I had a husband, everything was different.
	AI_Output(other,self, " DIA_Gritta_ElvrichGritta_01_04 " );	// I understand. Tell me, have you ever thought about getting married again?
	AI_Output(self,other, " DIA_Gritta_ElvrichGritta_01_05 " );	// What? (pauses) To be honest, I never thought about it.
	AI_Output(self,other, " DIA_Gritta_ElvrichGritta_01_06 " );	// And who needs me like this...
	AI_Output(other,self, " DIA_Gritta_ElvrichGritta_01_07 " );	// For example, Elvrihu.
	AI_Output(self,other, " DIA_Gritta_ElvrichGritta_01_12 " );	// Elvrihu? He's a very nice boy and he's so cute too...(embarrassed)
	AI_Output(other,self, " DIA_Gritta_ElvrichGritta_01_13 " );	// Then you'll be interested to know that Elvrich is crazy about you!
	AI_Output(self,other, " DIA_Gritta_ElvrichGritta_01_16 " );	// But... but how can this be? (quite bewildered) Why didn't he ever tell me about it then?
	AI_Output(other,self, " DIA_Gritta_ElvrichGritta_01_17 " );	// He is just very afraid that you will refuse him.
	AI_Output(self,other, " DIA_Gritta_ElvrichGritta_01_24 " );	// I would be glad if he dares to confess his feelings.
	AI_Output(other,self, " DIA_Gritta_ElvrichGritta_01_27 " );	// I think Elvrich will do it soon.
	AI_Output(self,other, " DIA_Gritta_ElvrichGritta_01_28 " );	// Oh god! If that's the case... (in a panic) Oh! And I must look so terrible now ... Nightmare!
	B_LogEntry( TOPIC_ELVRIHMARRYGRITTA , " Gritta will be just happy if Elvrih pays attention to her and confesses his feelings. " );
	GRITTAAGREEMARRY = TRUE;
	if((ELVRIHAGREEMARRY == TRUE) && (GRITTAAGREEMARRY == TRUE))
	{
		Npc_ExchangeRoutine(VLK_418_Gritta,"GoMarry");
		Npc_ExchangeRoutine(VLK_4302_Addon_Elvrich,"GoMarry");
	};
	AI_StopProcessInfos(self);
};


instance DIA_GRITTA_ELVRIHMARRYGRITTADONE (C_Info)
{
	npc = VLK_418_Gritta;
	nr = 1;
	condition = dia_gritta_elvrihmarrygrittadone_condition;
	information = dia_gritta_elvrihmarrygrittadone_info;
	permanent = FALSE;
	description = " Any news? " ;
};


func int dia_gritta_elvrihmarrygrittadone_condition()
{
	if(MIS_ELVRIHMARRYGRITTA == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_gritta_elvrihmarrygrittadone_info()
{
	AI_Output(other,self, " DIA_Gritta_ElvrihMarryGrittaDone_01_00 " );	// Any news?
	AI_Output(self,other, " DIA_Gritta_ElvrihMarryGrittaDone_01_01 " );	// If about Elvrich, then you were right... (embarrassed) I can't even believe it!
	AI_Output(self,other, " DIA_Gritta_ElvrihMarryGrittaDone_01_02 " );	// I'm so happy! Thank you.
};

