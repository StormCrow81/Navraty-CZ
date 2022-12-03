

instance DIA_Abuyin_EXIT(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 999;
	condition = DIA_Abuyin_EXIT_Condition;
	information = DIA_Abuyin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Abuyin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Abuyin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Abuyin_PICKPOCKET(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 900;
	condition = DIA_Abuyin_PICKPOCKET_Condition;
	information = DIA_Abuyin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Abuyin_PICKPOCKET_Condition()
{
	return  C_Robbery ( 75 , 200 );
};

func void DIA_Abuyin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
	Info_AddChoice(DIA_Abuyin_PICKPOCKET,Dialog_Back,DIA_Abuyin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Abuyin_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Abuyin_PICKPOCKET_DoIt);
};

func void DIA_Abuyin_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
};

func void DIA_Abuyin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Abuyin_PICKPOCKET);
};


instance DIA_Abuyin_Hallo(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Hallo_Condition;
	information = DIA_Abuyin_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Abuyin_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Hallo_Info()
{
	AI_Output(self,other, " DIA_Addon_Abuyin_Hallo_13_00 " );	// How strange... (thoughtfully) It seems to me that we have already met, traveler.
	AI_Output(self,other, " DIA_Addon_Abuyin_Hallo_13_01 " );	// Well, the mysteries of our world are great... Oh, please forgive my rudeness, son of patience, I didn't even greet you.
	AI_Output(self,other, " DIA_Addon_Abuyin_Hallo_13_02 " );	// Welcome, my friend, sit on my humble carpet and smoke your pipe, enjoying the peace.
};


instance DIA_Abuyin_du(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_du_Condition;
	information = DIA_Abuyin_du_Info;
	permanent = FALSE;
	description = " Who are you? " ;
};


func int DIA_Abuyin_du_Condition()
{
	return TRUE;
};

func void DIA_Abuyin_du_Info()
{
	AI_Output(other,self,"DIA_Abuyin_du_15_00");	//Кто ты?
	AI_Output(self,other, " DIA_Abuyin_du_13_01 " );	// My name is Abuin ibn Jadir ibn Omar Khalid bin Haji al Sharidi. I am a prophet and soothsayer, an astrologer and a tobacco dealer.
};


instance DIA_Buy_Kraut (C_Info) .
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Kraut_Condition;
	information = DIA_Abuyin_Kraut_Info;
	permanent = FALSE;
	description = " What kind of tobacco do you offer? " ;
};


func int DIA_Abuyin_Kraut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_du))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Kraut_Info()
{
	AI_Output(other,self, " DIA_Abuyin_Kraut_15_00 " );	// What kind of tobacco do you suggest?
	AI_Output(self,other, " DIA_Abuyin_Kraut_13_01 " );	// My pipes are stuffed with sharp, refreshing apple tobacco.
	AI_Output(self,other, " DIA_Abuyin_Kraut_13_02 " );	// Take your pick, Son of Adventure.
};


instances of DIA_Abuyin_anderen (C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_anderen_Condition;
	information = DIA_Abuyin_anderen_Info;
	permanent = FALSE;
	description = " Do you have any other tobacco? " ;
};


func int DIA_Abuyin_anderen_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_Kraut))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_anderen_Info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Abuyin_anderen_15_00 " );	// Do you have any other tobacco?
	AI_Output(self,other, " DIA_Abuyin_anderen_13_01 " );	// I offer only the best tobacco. This apple blend is a symphony of my homeland - the southern islands.
	AI_Output(self,other, " DIA_Abuyin_anderen_13_02 " );	// But, of course, I'm always willing to try another kind of tobacco - if anyone can make really good tobacco.
	AI_Output(other,self, " DIA_Abuyin_anderen_15_03 " );	// And how is it done?
	AI_Output(self,other, " DIA_Abuyin_anderen_13_04 " );	// Take apple tobacco as a basis. And try adding different ingredients to it.
	AI_Output(self,other, " DIA_Abuyin_anderen_13_05 " );	// This is done on the alchemy table, if you have some skills in alchemy, of course.
	AbuyinTellTabak = TRUE;
	Log_CreateTopic(TOPIC_TalentAlchemy,LOG_NOTE);
	B_LogEntry(TOPIC_TalentAlchemy, " Abuin told me how to get a new kind of tobacco. To do this, I need to take apple tobacco as a basis and mix it with some other component on the alchemy table. " );
};


instance DIA_Abuyin_Where (C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Woher_Condition;
	information = DIA_Abuyin_Where_Info;
	permanent = FALSE;
	description = " Where can I get apple tobacco? " ;
};


func int DIA_Abuyin_Woher_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Abuyin_anderen))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Where_Info()
{
	AI_Output(other,self, " DIA_Abuyin_Woher_15_00 " );	// Where can I get apple tobacco?
	AI_Output(self,other, " DIA_Abuyin_Woher_13_01 " );	// I'll give you two servings. And then do with them what you want.
	AI_Output(self,other, " DIA_Abuyin_Woher_13_02 " );	// If you need more tobacco, point your feet towards Zuris, the Potions Master. He produces this tobacco and sells it.
	B_GiveInvItems(self,other,ItMi_ApfelTabak,2);
};

func void B_TobaccoTry()
{
	AI_Output(self,other, " DIA_Abuyin_Mischung_Nichts_13_00 " );	// Let me taste your tobacco.
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other, " DIA_Abuyin_Mischung_Nichts_13_01 " );	// No, I don't really like this fragrance. But maybe you'll find someone who appreciates his... er... sophistication.
};

var int Test_SumpfTabak;
var int Test_PilzTabak;
var int Test_DoubleTobacco;
var int Test_Honigtobacco;
var int Test_Hasish;

instance DIA_Abuyin_Mix (C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 10;
	condition = DIA_Abuyin_Mix_Condition;
	information = DIA_Abuyin_Mixture_Info;
	permanent = TRUE;
	description = " I brought a new kind of tobacco... " ;
};

func int DIA_Abuyin_Mixture_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Abuyin_anderen) && (Abuyin_DoneSpiltz ==  FALSE ) && ((Npc_HasItems(other,ItMi_SumpfTabak) >=  1 ) || (Npc_HasItems(other,ItMi_PilzTabak) >=  1 ) || (Npc_HasItems(other,ItMi_SumpfTabak)) >=  1 ) || (Npc_HasItems(other,ItMi_DoppelTabak) >=  1 ) || (Npc_HasItems(other,ItMi_Honigtabak) >=  1 )))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Mixture_Info()
{
	AI_Output(other,self, " DIA_Abuyin_Mischung_15_00 " );	// I brought a new kind of tobacco...
	Info_ClearChoices(DIA_Abuyin_Mix);

	Info_AddChoice(DIA_Abuyin_Mix,Dialog_Back,DIA_Abuyin_Mix_BACK);

	if ((Npc_HasItems(other,ItMi_SumpfTabak) >=  1 ) && (Test_SumpfTabak ==  FALSE ))
	{
		Info_AddChoice(DIA_Abuyin_mixture, PRINT_KRAUT ,DIA_Abuyin_mixture_swamp);
	};
	if ((Npc_HasItems(other,ItMi_PilzTabak) >=  1 ) && (Test_PilzTabak ==  FALSE ))
	{
		Info_AddChoice(DIA_Abuyin_mixture, PRINT_MUSHROOM ,DIA_Abuyin_mixture_mushroom);
	};
	if ((Npc_HasItems(other,ItMi_DoppelTabak) >=  1 ) && (Test_DoppelTabak ==  FALSE ))
	{
		Info_AddChoice(DIA_Abuyin_Mix, PRINT_DOUBLE ,DIA_Abuyin_Mix_Double);
	};
	if((Npc_HasItems(other,ItMi_Honigtabak) >= 1) && (Test_Honigtabak == FALSE))
	{
		Info_AddChoice(DIA_Abuyin_Mix, PRINT_HONEY ,DIA_Abuyin_Mix_Super);
	};
	if ((Npc_HasItems(other,ItMi_Hasish) >=  1 ) && (Test_Hasish ==  FALSE ))
	{
		Info_AddChoice(DIA_Abuyin_Mischung, PRINT_GANDJA ,DIA_Abuyin_Mischung_MegaSuper);
	};
};

func void DIA_Abuyin_mixture_BACK()
{
	Info_ClearChoices(DIA_Abuyin_Mix);
};

func void DIA_Abuyin_mixture_swamp()
{
	B_GiveInvItems(other,self,ItMi_SumpfTabak,1);
	Test_SumpfTabak = TRUE;
	B_TobaccoTry();
	Info_ClearChoices(DIA_Abuyin_Mix);
};

func void DIA_Abuyin_mixture_mushroom()
{
	B_GiveInvItems(other,self,ItMi_PilzTabak,1);
	Test_PilzTabak = TRUE;
	B_TobaccoTry();
	Info_ClearChoices(DIA_Abuyin_Mix);
};

func void DIA_Abuyin_mixture_double()
{
	B_GiveInvItems(other,self,ItMi_DoppelTabak, 1 );
	Test_DoppelTabak = TRUE;
	B_TobaccoTry();
	Info_ClearChoices(DIA_Abuyin_Mix);
};

func void DIA_Abuyin_Mixture_Super()
{
	B_GiveInvItems(other,self,ItMi_Honigtabak,1);
	AI_Output(self,other, " DIA_Abuyin_Mischung_Super_13_00 " );	// Let me try your tobacco.
	CreateInvItems(self,ItMi_Joint,1);
	B_UseItem(self,ItMi_Joint);
	AI_Output(self,other, " DIA_Abuyin_Mischung_Super_13_01 " );	// This is incredible! Never tried anything like it in my life!
	AI_Output(self,other, " DIA_Abuyin_Mischung_Super_13_02 " );	// How did you cook it?
	AI_Output(other,self, " DIA_Abuyin_Mischung_Super_15_03 " );	// I mixed regular tobacco with honey.
	AI_Output(self,other, " DIA_Abuyin_Mischung_Super_13_04 " );	// You did a good job, oh Father of the Art of Blending. I will fill my despicable pipes with great pleasure.
	AI_Output(other,self,"DIA_Abuyin_Mischung_Super_15_05");	//Ну, набей.
	AI_Output(self,other, " DIA_Abuyin_Mischung_Super_13_06 " );	// Thank you, O Son of Generosity. No other blend compares to your creation. I'm willing to buy anything you can bring me.
	Abuyin_Honigtabak = TRUE;
	Test_Honigtabak = TRUE;

	if((Abuyin_Hasish == TRUE) && (Abuyin_Honigtabak == TRUE))
	{
		Abuyin_DoneSpiltz = TRUE;
	};

	B_GivePlayerXP(XP_Ambient * 2);
	Info_ClearChoices(DIA_Abuyin_Mix);
};

func void DIA_Abuyin_Mixture_MegaSuper()
{
	AI_Output(self,other, " DIA_Abuyin_Mischung_MegaSuper_13_00 " );	// (in disbelief) What is this?
	AI_Output(other,self, " DIA_Abuyin_Mischung_MegaSuper_13_01 " );	// Try it! You'll like it.
	AI_Output(self,other, " DIA_Abuyin_Mischung_MegaSuper_13_02 " );	// Okay, come on over here.
	B_GiveInvItems(other,self,ItMi_Hasish,1);
	Npc_RemoveInvItems(self,ItMi_Hasish,1);	
	CreateInvItems(self,itmi_specialjoint,1);
	Abuyin_Hasish = TRUE;
	Test_Hasish = TRUE;

	if((Abuyin_Hasish == TRUE) && (Abuyin_Honigtabak == TRUE))
	{
		Abuyin_DoneSpiltz = TRUE;
	};

	AI_StopProcessInfos(self);

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};
	AI_UseItem(self,itmi_specialjoint);
	Npc_SetRefuseTalk(self,5);
	hero.aivar[ AIV_INVINCIBLE ] = FALSE ;
};

instance DIA_Abuyin_Mischung_MegaSuper_Ok (C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Mischung_MegaSuper_Ok_Condition;
	information = DIA_Abuyin_Mischung_MegaSuper_Ok_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Abuyin_Mischung_MegaSuper_Ok_Condition()
{
	if(Abuyin_Hasish == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Mischung_MegaSuper_Ok_Info()
{
	B_GivePlayerXP(XP_Ambient * 5);
	AI_Output(self,other, " DIA_Abuyin_Mischung_MegaSuper_Ok_13_03 " );	// Uh...(recovering) What was that? And how did you prepare it?
	AI_Output(other,self, " DIA_Abuyin_Mischung_MegaSuper_Ok_13_04 " );	// Let this be my little secret.
	AI_Output(self,other, " DIA_Abuyin_Mischung_MegaSuper_Ok_15_05 " );	// Man, I've never experienced such incredible sensations in my life!
	AI_Output(other,self, " DIA_Abuyin_Mischung_MegaSuper_Ok_13_06 " );	// Well, then you can keep it all to yourself.
	AI_Output(self,other, " DIA_Abuyin_Mischung_MegaSuper_Ok_15_07 " );	// I won't fail to do this. Yep, funny stuff!
	AI_Output(self,other, " DIA_Abuyin_Mischung_MegaSuper_Ok_15_08 " );	// Just look, don't offer it to anyone else! And that's not enough...
};

instance DIA_Abuyin_Trade(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Trade_Condition;
	information = DIA_Abuyin_Trade_Info;
	permanent = TRUE;
	description = " I brought you honey tobacco. " ;
};

func int DIA_Abuyin_Trade_Condition()
{
	if((Abuyin_Honigtabak == TRUE) && (Npc_HasItems(other,ItMi_Honigtabak) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Trade_Info()
{
	var int TobaccoExp;

	Abuyin_Score = FALSE;
	Abuyin_Score = Npc_HasItems(other,ItMi_Honigtabak) * VALUE_ItMi_HonigTabak;
	TobaccoExp = FALSE ;
	TobaccoExp = Npc_HasItems(other,ItMi_Honigtabak);

	B_GivePlayerXP(TabakExp *  50 );
	AI_Output(other,self, " DIA_Abuyin_Trade_15_00 " );	// I brought you honey tobacco.
	B_GiveInvItems(other,self,ItMi_Honigtabak,Npc_HasItems(other,ItMi_Honigtabak));
	Npc_RemoveInvItems(self,ItMi_Honigtabak,Npc_HasItems(self,ItMi_Honigtabak));	
	AI_Output(self,other, " DIA_Abuyin_Trade_13_01 " );	// It's a great pleasure for me to do business with you.
	B_GiveInvItems(self,other,ItMi_Gold,Abuyin_Score);
};

instance DIA_Abuyin_Herb(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Herb_Condition;
	information = DIA_Abuyin_Herb_Info;
	permanent = FALSE;
	description = " Are you interested in this bale of grass? " ;
};

func int DIA_Abuyin_Herb_Condition()
{
	if(Npc_HasItems(other,ItMi_HerbPaket) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Herb_Info()
{
	AI_Output(other,self, " DIA_Abuyin_Herb_15_00 " );	// Aren't you interested in this bale of grass?
	AI_Output(self,other, " DIA_Abuyin_Herb_13_01 " );	// A bale of herbs isn't swamp grass, is it? Oh, take her away, oh Son of the Foolish.
	AI_Output(self,other, " DIA_Abuyin_Herb_13_02 " );	// If the city guards see me with it, they'll throw me in jail - and you'll have a bad fate!
	AI_Output(self,other, " DIA_Abuyin_Herb_13_03 " );	// If you really want to sell this herb, take my advice - leave this city.
	AI_Output(self,other, " DIA_Abuyin_Herb_13_04 " );	// Try to get rid of her somewhere outside the city walls. And here you are waiting for her one headache.
};

instance DIA_Abuyin_Prophecy (C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung_Condition;
	information = DIA_Abuyin_Prophecy_Info;
	permanent = FALSE;
	description = " Can you make a prophecy? " ;
};


func int DIA_Abuyin_Weissagung_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_About_Ten ) && ( Capital ==  1 )) .
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung_Info()
{
	AI_Output(other,self, " DIA_Abuyin_Weissagung_15_00 " );	// Can you make a prophecy?
	AI_Output(self,other, " DIA_Abuyin_Weissagung_13_01 " );	// I am at your service for a modest fee, O Father of Generosity.
	AI_Output(other,self, " DIA_Abuyin_Weissagung_15_02 " );	// How much do you want?
	AI_Output(self,other, " DIA_Abuyin_Weissagung_13_03 " );	// For some twenty-five coins, I'll risk looking into the future for you.
	AI_Output(self,other, " DIA_Abuyin_Weissagung_13_04 " );	// But remember - the future is always uncertain. All I can do is capture tiny bits of time.
};


instance DIA_Abuyin_Zukunft (C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft_Condition;
	information = DIA_Abuyin_Zukunft_Info;
	permanent = TRUE;
	description = " Tell me about the future. (Price: 25 coins) " ;
};


var int DIA_Abuyin_Future_permanent;

func int DIA_Abuyin_Zukunft_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Content ) && ( DIA_Content_Permanent ==  FALSE ) && ( Capital ==  1 ))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft_Info()
{
	AI_Output(other,self, " DIA_Abuyin_Zukunft_15_00 " );	// Tell me about the future.

	if(B_GiveInvItems(other,self,ItMi_Gold,25))
	{
		AI_Output(self,other, " DIA_Abuyin_Zukunft_13_01 " );	// All right, oh Hungry for Knowledge. I'm going into a trance now. Are you ready?
		Info_ClearChoices(DIA_Abuyin_Zukunft);
		Info_AddChoice(DIA_Abuyin_Zukunft, " Я готов. " ,DIA_Abuyin_Zukunft_Trance);
	}
	else
	{
		AI_Output(self,other, " DIA_Abuyin_Zukunft_13_02 " );	// Oh Father of Coins, I ask you for twenty-five coins in exchange for a glimpse into a hazy future.
	};
};

func void DIA_Abuyin_Zukunft_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_Zukunft_Trance_13_00 " );	// (in a trance) Orcs...they're guarding the entrance...the old tunnel...the Valley of Mines...
	AI_Output(self,other, " DIA_Abuyin_Zukunft_Trance_13_01 " );	// (in a trance) Men in shining armor...mage...your friend is with them...he's waiting for you...
	AI_Output(self,other, " DIA_Abuyin_Zukunft_Trance_13_02 " );	// (in trance) Fire! Attack...by a mighty being...flame...many...will die...
	AI_Output(self,other, " DIA_Addon_Abuyin_Zukunft_Trance_13_00 " );	// (in a trance)...What is this?..City...Ruins...Quarhodron from Yarkendar...
	AI_Output(self,other, " DIA_Addon_Abuyin_Zukunft_Trance_13_01 " );	// (in a trance)...He was summoned...Quarhodron of Yarkendar!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_Zukunft_Trance_13_03 " );	// ... Sorry - the vision is over. I couldn't see anything else.
	DIA_Abuyin_Zukunft_permanent = TRUE;
	Abuyin_Future = 1 ;
	Info_ClearChoices(DIA_Abuyin_Zukunft);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Nochmal (C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Nochmal_Condition;
	information = DIA_Abuyin_Nochmal_Info;
	permanent = TRUE;
	description = " Can you give me another prophecy? " ;
};


func int DIA_Abuyin_Nochmal_Condition()
{
	if (chapter == Abuyin_Future)
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Nochmal_Info()
{
	AI_Output(other,self, " DIA_Abuyin_Nochmal_15_00 " );	// Can you give me another prophecy?
	AI_Output(self,other, " DIA_Abuyin_Nochmal_13_01 " );	// O Son of the Mysterious Future, I am unable to lift the veil of time now.
	AI_Output(self,other, " DIA_Abuyin_Nochmal_13_02 " );	// Only when time gives me another sign, I can help you again.
	if(Abuyin_Erzaehlt == FALSE)
	{
		AI_Output(other,self, " DIA_Abuyin_Nochmal_15_03 " );	// And when will it be?
		AI_Output(self,other, " DIA_Abuyin_Nochmal_13_04 " );	// When the future becomes present and you continue on your way.
		Abuyin_Erzaehlt = TRUE;
	};
};

func void B_Abuyin_Weissagung()
{
	AI_Output(other,self, " B_Abuyin_Weissagung_15_00 " );	// Can you make a prophecy?
	AI_Output(self,other, " B_Abuyin_Weissagung_13_01 " );	// Yes, time has gone ahead, and I can make another prophecy if you have some coins.
	AI_Output(other,self,"B_Abuyin_Weissagung_15_02");	//Сколько?
};


instance DIA_Abuyin_Weissagung2(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung2_Condition;
	information = DIA_Abuyin_Weissagung2_Info;
	permanent = FALSE;
	description = " Can you make a prophecy? " ;
};


func int DIA_Abuyin_Weissagung2_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_About_Ten ) && ( Capital ==  2 )) .
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung2_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other, " DIA_Abuyin_Weissagung2_13_00 " );	// For a mere hundred coins, I'll venture a glimpse into the future for you.
};


instance DIA_Abuyin_Zukunft2 (C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft2_Condition;
	information = DIA_Abuyin_Zukunft2_Info;
	permanent = TRUE;
	description = " Tell me about the future. (Price: 100 coins) " ;
};


var int DIA_Abuyin_Zukunft2_permanent;

func int DIA_Abuyin_Zukunft2_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Abuyin_Weissagung2 ) && ( DIA_Abuyin_Zukunft2_permanent ==  FALSE ) && ( Capital ==  2 ))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft2_Info()
{
	AI_Output(other,self, " DIA_Abuyin_Zukunft2_15_00 " );	// Tell me about the future.
	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		AI_Output(self,other, " DIA_Abuyin_Zukunft2_13_01 " );	// All right, oh Son of Courage. I'm going into a trance now. Are you ready?
		Info_ClearChoices(DIA_Abuyin_Zukunft2);
		Info_AddChoice(DIA_Abuyin_Zukunft2,"Я готов.",DIA_Abuyin_Zukunft2_Trance);
	}
	else
	{
		AI_Output(self,other, " DIA_Abuyin_Zukunft2_13_02 " );	// Oh, Father of Coins, I ask you for a hundred gold pieces in exchange for a glimpse into a hazy future.
	};
};

func void DIA_Abuyin_Zukunft2_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_Zukunft2_Trance_13_00 " );	// (in a trance) A mercenary... he needs you... a gruesome murder... an eye...
	AI_Output(self,other, " DIA_Abuyin_Zukunft2_Trance_13_01 " );	// (in a trance) Sinister minions... they're coming... looking for you... the guardian will fall...
	AI_Output(self,other, " DIA_Abuyin_Zukunft2_Trance_13_02 " );	// (in a trance) ...but the three must unite... only then will you get what should be yours...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_Zukunft2_Trance_13_03 " );	// That's all. I couldn't see anything else.
	DIA_Abuyin_Zukunft2_permanent = TRUE;
	Abuyin_Future = 2 ;
	Info_ClearChoices(DIA_Abuyin_Zukunft2);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Weissagung3(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung3_Condition;
	information = DIA_Abuyin_Weissagung3_Info;
	permanent = FALSE;
	description = " Can you make a prophecy? " ;
};


func int DIA_Abuyin_Weissagung3_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_About_Ten ) && ( Capital ==  3 )) .
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung3_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other, " DIA_Abuyin_Weissagung3_13_00 " );	// For some two hundred and fifty coins, I'll risk looking into the future for you.
};


instance DIA_Abuyin_Zukunft3 (C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft3_Condition;
	information = DIA_Abuyin_Zukunft3_Info;
	permanent = TRUE;
	description = " Tell me about the future. (Price: 250 coins) " ;
};


var int DIA_Abuyin_Zukunft3_permanent;

func int DIA_Abuyin_Zukunft3_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Abuyin_Weissagung3 ) && ( DIA_Abuyin_Zukunft3_permanent ==  FALSE ) && ( Capital ==  3 ))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft3_Info()
{
	AI_Output(other,self, " DIA_Abuyin_Zukunft3_15_00 " );	// Tell me about the future.
	if(B_GiveInvItems(other,self,ItMi_Gold,250))
	{
		AI_Output(self,other, " DIA_Abuyin_Zukunft3_13_01 " );	// All right, oh Son of Knowledge. I'm going into a trance now. Are you ready?
		Info_ClearChoices(DIA_Abuyin_Zukunft3);
		Info_AddChoice(DIA_Abuyin_Zukunft3, " Я готов. " ,DIA_Abuyin_Zukunft3_Trance);
	}
	else
	{
		AI_Output(self,other, " DIA_Abuyin_Zukunft3_13_02 " );	// Oh, Father of Coins, I ask you for two hundred and fifty gold coins in exchange for a glimpse into the foggy future.
	};
};

func void DIA_Abuyin_Zukunft3_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_Zukunft3_Trance_13_00 " );	// (in a trance) You must break through... it's only for you...
	AI_Output(self,other, " DIA_Abuyin_Zukunft3_Trance_13_01 " );	// (in a trance) ... through fire and snow... through ice and flame...
	AI_Output(self,other, " DIA_Abuyin_Zukunft3_Trance_13_02 " );	// (in a trance) Men in strange armor... a swamp... lizards... they're waiting for you...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_Zukunft3_Trance_13_03 " );	// That's all. I couldn't see anything else.
	DIA_Abuyin_Zukunft3_permanent = TRUE;
	Abuyin_Future = 3 ;
	Info_ClearChoices(DIA_Abuyin_Zukunft3);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Weissagung4(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung4_Condition;
	information = DIA_Abuyin_Weissagung4_Info;
	permanent = FALSE;
	description = " Can you make a prophecy? " ;
};


func int DIA_Abuyin_Weissagung4_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_About_Ten ) && ( Capital ==  4 )) .
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung4_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other, " DIA_Abuyin_Weissagung4_13_00 " );	// For some five hundred coins, I'll risk looking into the future for you.
};


instance DIA_Abuyin_Zukunft4(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft4_Condition;
	information = DIA_Abuyin_Zukunft4_Info;
	permanent = TRUE;
	description = " Tell me about the future. (Price: 500 coins) " ;
};


var int DAY_Abuyin_Zukunft4_permanent;

func int DIA_Abuyin_Zukunft4_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Abuyin_Weissagung4 ) && ( DIA_Abuyin_Zukunft4_permanent ==  FALSE ) && ( Capital ==  4 ))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft4_Info()
{
	AI_Output(other,self, " DIA_Abuyin_Zukunft4_15_00 " );	// Tell me about the future.
	if(B_GiveInvItems(other,self,ItMi_Gold,500))
	{
		AI_Output(self,other, " DIA_Abuyin_Zukunft4_13_01 " );	// All right, oh Son of Knowledge. I'm going into a trance now. Are you ready?
		Info_ClearChoices(DIA_Abuyin_Zukunft4);
		Info_AddChoice(DIA_Abuyin_Zukunft4,"Я готов.",DIA_Abuyin_Zukunft4_Trance);
	}
	else
	{
		AI_Output(self,other, " DIA_Abuyin_Zukunft4_13_02 " );	// Oh, Father of Coins, I ask you for five hundred gold pieces in exchange for a glimpse into the foggy future.
	};
};

func void DIA_Abuyin_Zukunft4_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_Zukunft4_Trance_13_00 " );	// (in a trance) A place of knowledge... another country... a dark place far, far away...
	AI_Output(self,other, " DIA_Abuyin_Zukunft4_Trance_13_01 " );	// (in a trance) Courageous companions... you must make a choice...
	AI_Output(self,other, " DIA_Abuyin_Zukunft4_Trance_13_02 " );	// (in a trance) The temple... stands alone in the realm of Adanos... shrouded in mist...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_Zukunft4_Trance_13_03 " );	// That's all. I couldn't see anything else.
	DIA_Abuyin_Zukunft4_permanent = TRUE;
	Abuyin_Future = 4 ;
	Info_ClearChoices(DIA_Abuyin_Zukunft4);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_Abuyin_Weissagung5(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Weissagung5_Condition;
	information = DIA_Abuyin_Weissagung5_Info;
	permanent = FALSE;
	description = " Can you make a prophecy? " ;
};


func int DIA_Abuyin_Weissagung5_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Recent ) && ( Capital ==  5 ))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Weissagung5_Info()
{
	B_Abuyin_Weissagung();
	AI_Output(self,other, " DIA_Abuyin_Weissagung5_13_00 " );	// For some thousand coins, I'll risk looking into the future for you.
};


instance DIA_Abuyin_Zukunft5(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = DIA_Abuyin_Zukunft5_Condition;
	information = DIA_Abuyin_Zukunft5_Info;
	permanent = TRUE;
	description = " Tell me about the future. (Price: 1000 coins) " ;
};


var int DIA_Abuyin_Zukunft5_permanent;

func int DIA_Abuyin_Zukunft5_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Abuyin_Weissagung5 ) && ( DIA_Abuyin_Zukunft5_permanent ==  FALSE ) && ( Capital ==  5 ))
	{
		return TRUE;
	};
};

func void DIA_Abuyin_Zukunft5_Info()
{
	AI_Output(other,self, " DIA_Abuyin_Zukunft5_15_00 " );	// Tell me about the future.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		AI_Output(self,other, " DIA_Abuyin_Zukunft5_13_01 " );	// All right, oh Son of Knowledge. I'm going into a trance now. Are you ready?
		Info_ClearChoices(DIA_Abuyin_Zukunft5);
		Info_AddChoice(DIA_Abuyin_Zukunft5,"Я готов.",DIA_Abuyin_Zukunft5_Trance);
	}
	else
	{
		AI_Output(self,other, " DIA_Abuyin_Zukunft5_13_02 " );	// But you don't have any money. I only ask for a thousand gold coins!
	};
};

func void DIA_Abuyin_Zukunft5_Trance()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_Zukunft5_Trance_13_00 " );	// (in a trance) Darkness has descended on the earth... evil triumphs...
	AI_Output(self,other, " DIA_Abuyin_Zukunft5_Trance_13_01 " );	// (in trance) The king will lose the war against the orcs...
	AI_Output(self,other, " DIA_Abuyin_Zukunft5_Trance_13_02 " );	// (in a trance) You will return, but you will not find peace ...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_Zukunft5_Trance_13_03 " );	// That's all. I couldn't see anything else.
	DIA_Abuyin_Zukunft5_permanent = TRUE;
	Abuyin_Future = 5 ;
	Info_ClearChoices(DIA_Abuyin_Zukunft5);
	B_GivePlayerXP(XP_Ambient * 4);
};


instance DIA_ABUYIN_TELLGUARDIANS(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = dia_abuyin_tellguardians_condition;
	information = dia_abuyin_tellguardians_info;
	permanent = FALSE;
	description = " Something strange is going on around me. " ;
};


func int dia_abuyin_tellguardians_condition()
{
	if ( Npc_KnowsInfo ( other , TEN_DAYS ) && ( GUARDIAN_WAY  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_abuyin_tellguardians_info()
{
	AI_Output(other,self, " DIA_Abuyin_TellGuardians_01_02 " );	// Something strange is going on around me. And I just can't figure out what it is.
	AI_Output(self,other, " DIA_Abuyin_TellGuardians_01_03 " );	// Hmmm...( peering intently) Interesting! I sense an aura of some great mystery around you.
	AI_Output(other,self, " DIA_Abuyin_TellGuardians_01_05 " );	// Maybe your gift of divination will help me with this?
	AI_Output(self,other, " DIA_Abuyin_TellGuardians_01_06 " );	// Well...(uncertainly) I can certainly try to do that.
	AI_Output(self,other, " DIA_Abuyin_TellGuardians_01_07 " );	// However, as you yourself understand, I still won't be able to fully answer your questions.
	ABUYIN_TELLGUARDIANS = TRUE;
};


instance DIA_ABUYIN_FINDMEGUARDIANS(C_Info)
{
	npc = VLK_456_Abuyin;
	nr = 2;
	condition = dia_abuyin_findmeguardians_condition;
	information = dia_abuyin_findmeguardians_info;
	permanent = TRUE;
	description = " Tell me what you know. " ;
};


func int dia_abuyin_findmeguardians_condition()
{
	if((ABUYIN_TELLGUARDIANS == TRUE) && (TELLABOUTALL == FALSE))
	{
		return TRUE;
	};
};

func void dia_abuyin_findmeguardians_info()
{
	AI_Output(other,self, " DIA_Abuyin_FindMeGuardians_01_00 " );	// Tell me what you know.
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_01_01 " );	// Good. Are you ready?
	Info_ClearChoices(dia_abuyin_findmeguardians);
	if ( MIS_DAGOTEST  ==  FALSE )
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_dagot);
	}
	else  if (( DAGOT_AGREE  ==  TRUE ) && ( MY_MORIUSTEST  ==  FALSE ))
	{
		Info_AddChoice(findmeguardians, " Я готов. " ,find_findmeguardians_morius);
	}
	else  if (( MORIUS_AGREE  ==  TRUE ) && ( MY_WITNESS  ==  FALSE ))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_tegon);
	}
	else  if (( TEGON_AGREE  ==  TRUE ) && ( MY_KELIOSTEST  ==  FALSE ) && (Chapter >=  3 ))
	{
		Info_AddChoice(dia_buyin_findmeguardians, " Я готов. " ,dia_abuyin_findmeguardians_kelios);
	}
	else  if (( KELIOS_AGREE  ==  TRUE ) && ( MY_DEMOST  ==  FALSE ) && (Chapter >=  3 ))
	{
		Info_AddChoice(dia_abuyin_findmeguardians, " Я готов. " ,dia_abuyin_findmeguardians_demos);
	}
	else  if (( DEMOS_AGREE  ==  TRUE ) && ( MY_FARIONTEST  ==  FALSE ) && (Chapter >=  3 ))
	{
		Info_AddChoice(dia_abuyin_findmeguardians, " Я готов. " ,dia_abuyin_findmeguardians_farion);
	}
	else  if (( FARION_AGREE  ==  TRUE ) && ( MY_LASTTEST  ==  FALSE ) && (Chapter >=  4 ))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_gader);
	}
	else  if (( GADER_AGREE  ==  TRUE ) && ( MY_NARUTEST  ==  FALSE ) && (Chapter >=  4 ))
	{
		Info_AddChoice(findmeguardians, " Я готов. " ,findmeguardians_narus);
	}
	else  if (( NARUS_AGREE  ==  TRUE ) && ( MY_CONTEST  ==  FALSE ) && (Chapter >=  4 ))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_wakon);
	}
	else  if (( WAKON_AGREE  ==  TRUE ) && ( MY_STONNOTEST  ==  FALSE ) && (Chapter >=  4 ))
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_stonnos);
	}
	else
	{
		Info_AddChoice(dia_abuyin_findmeguardians,"Я готов.",dia_abuyin_findmeguardians_noone);
	};
};

func void dia_abuyin_findmeguardians_dagot()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Dagot_01_00 " );	// (trying to focus) ...listen to me, wanderer!
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Dagot_01_01 " );	// ...Your path will be long: across the suspension bridge, past the lake to the distant statue of Innos. Only there you will find what you are looking for...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Dagot_01_02 " );	// Nothing else yet. I hope this is enough for you to understand what to do.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_morius()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Morius_01_00 " );	// (trying to focus) ...listen to me, wanderer!
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Morius_01_01 " );	// ...The stone stronghold that appeared from nothingness will reveal to you the key to unraveling...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Morius_01_02 " );	// Nothing else yet. I hope this is enough for you to understand what to do.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_tegon()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Tegon_01_00 " );	// (trying to focus) ...listen to me, wanderer!
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Tegon_01_01 " );	// ...On the road through the dark forest, where he was supposed to go with a friend, off-road to the mountains past a strange camp. Your path lies on a plateau high in the mountains.
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Tegon_01_02 " );	// Nothing else yet. I hope this is enough for you to understand what to do.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_kelios()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Kelios_01_00 " );	// (trying to focus) ...listen to me, wanderer!
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Kelios_01_01 " );	// ...And again your path lies in the mountains, past the lone hunter to the ruins on the rock...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Kelios_01_02 " );	// Nothing else yet. I hope this is enough for you to understand what to do.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_demos()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Demos_01_00 " );	// (trying to focus) ...listen to me, wanderer!
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Demos_01_01 " );	// ...River... Waterfall... Bridge... Gate... Further death and fear...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Demos_01_02 " );	// Nothing else yet. I hope this is enough for you to understand what to do.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_farion()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Farion_01_00 " );	// (trying to focus) ...listen to me, wanderer!
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Farion_01_01 " );	// ...The road... The road to the abode of God's servants...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Farion_01_02 " );	// Nothing else yet. I hope this is enough for you to understand what to do.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_gader()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Gader_01_00 " );	// (trying to focus) ...listen to me, wanderer!
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Gader_01_01 " );	// ...Long way to the magic Circle far in the mountains...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Gader_01_02 " );	// Nothing else yet. I hope this is enough for you to understand what to do.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_narus()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Narus_01_00 " );	// (trying to focus) ...listen to me, wanderer!
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Narus_01_01 " );	// ...A plateau in the mountains... A farm... Water... A lot of water falling down...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Narus_01_02 " );	// Nothing else yet. I hope this is enough for you to understand what to do.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_wakon()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Wakon_01_00 " );	// (trying to focus) ...listen to me, wanderer!
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Wakon_01_01 " );	// ...In the fields, at the crossroads of two roads, you will find what you are looking for...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Wakon_01_02 " );	// Nothing else yet. I hope this is enough for you to understand what to do.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_stonnos()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Stonnos_01_00 " );	// ...(tries to focus)...listen to me, wanderer!
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Stonnos_01_01 " );	// ...The circle of magic stones is calling you, son of search and discovery...
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_Stonnos_01_02 " );	// Nothing else yet. I hope this is enough for you to understand. what to do.
	TELLABOUTALL = TRUE;
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

func void dia_abuyin_findmeguardians_noone()
{
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	Wld_PlayEffect("SPELLFX_TELEPORT",self,self,0,0,0,FALSE);
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_NoOne_01_00 " );	// (tries to focus) ...no
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_NoOne_01_01 " );	// ...fails!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_NoOne_01_02 " );	// Sorry... But my visions are too hazy!
	AI_Output(self,other, " DIA_Abuyin_FindMeGuardians_NoOne_01_03 " );	// I can't tell you anything new yet.
	AI_Output(other,self, " DIA_Abuyin_FindMeGuardians_NoOne_01_04 " );	// Понимаю.
	Info_ClearChoices(dia_abuyin_findmeguardians);
};

