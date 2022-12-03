

instance DIA_Zuris_EXIT(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 999;
	condition = DIA_Zuris_EXIT_Condition;
	information = DIA_Zuris_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Zuris_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Zuris_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Zuris_Sperre(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Sperre_Condition;
	information = DIA_Zuris_Lock_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Zuris_Sperre_Condition()
{
	if((Canthar_Sperre == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Sperre_Info()
{
	AI_Output(self,other, " DIA_Zuris_Sperre_14_00 " );	// You're a prisoner who escaped from a mining colony. Get out!
	AI_StopProcessInfos(self);
};


instance DIA_Zuris_GREET(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_GREET_Condition;
	information = DIA_Zuris_GREET_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Zuris_GREET_Condition()
{
	if ( Npc_IsInState ( self , ZS_Talk ) && ( Canthar_Sperre ==  FALSE ) && ( self . aivar [ AIV_TalkedToPlayer ] ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Zuris_GREET_Info()
{
	AI_Output(self,other, " DIA_Zuris_GREET_14_00 " );	// I'm Zuris, Potions Specialist.
	AI_Output(self,other, " DIA_Zuris_GREET_14_01 " );	// Do you need healing essence or magic elixir? Then you came to the address.
	Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
	B_LogEntry(TOPIC_CityTrader, " Zuris is trading potions in the marketplace. " );
};

var int Zuris_once;
var int VatrasBookIns;
var int TrollPlantUp;
var int GrokBringPotionUp;
var int ZurisAddPermMana;

DIA_Zuris_WAREZ (C_Info) instances
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_WAREZ_Condition;
	information = DIA_Zuris_WAREZ_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your products. " ;
};

func int DIA_Zuris_WAREZ_Condition()
{
	if (Wld_IsTime( 5 , 30 , 20 , 0 ))
	{
		return TRUE;
	};
};

func void DIA_Zuris_WAREZ_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Zuris_WAREZ_15_00 " );	// Show me your products.

	if (( Use_once ==  FALSE ) &&  ! Npc_KnowsInfo ( other , DIA_Use_Potions ) ) .
	{
		AI_Output(self,other, " DIA_Zuris_GREET_14_02 " );	// I just got some new potions! My guest, Master Daron, Mage of Fire, brought them to me from the monastery.
		Zuris_once = TRUE ;
	};
	if ((Chapter >=  1 ) && (BacklogBookIns ==  FALSE ) && (MagicBookFindTrade ==  TRUE ) && (MY_BacklogMagicBook == LOG_Running))
	{
		CreateInvItems(self,ItWr_VatrasDiary,1);
		VatrasBookIns = TRUE;
	};
	if ((SeekCactus ==  TRUE ) && (SearchAddPermHome ==  FALSE ))
	{
		CreateInvItems(self,ItPo_Perm_Mana,1);
		CreateInvItems(self,ItPl_Perm_Herb,1);	
		ZurisAddPermMana = TRUE ;
	};
	if((XardasDoMagicRoot == TRUE) && (TrollPlantUp == FALSE))
	{
		CreateInvItems(self,ITPL_SUPER_HERB,1);
		TrollPlantUp = TRUE;
	};
	if((MIS_GrokBringPotion != FALSE) && (GrokBringPotionUp == FALSE))
	{
		CreateInvItems(self,ItPo_Perm_STR,1);
		GrokBringPotionUp = TRUE;
	};

	B_GiveTradeInv(self);
};

instance DIA_Zuris_Potions(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_POTIONS_Condition;
	information = DIA_Zuris_POTIONS_Info;
	permanent = FALSE;
	description = " Do you make your own potions? " ;
};


func int DIA_Zuris_POTIONS_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_Zuris_GREET))
	{
		return TRUE;
	};
};

func void DIA_Zuris_POTIONS_Info()
{
	AI_Output(other, self, " DIA_Zuris_POTIONS_15_00 " );	// Do you make your own potions?
	AI_Output(self,other, " DIA_Zuris_POTIONS_14_01 " );	// No, I get them from the monastery or buy them from Constantino, the alchemist.

	if(hero.guild == GIL_NONE)
	{
		AI_Output(self,other, " DIA_Zuris_POTIONS_14_02 " );	// If you're interested in potion recipes, you should talk to him. He just needs an assistant.
		AI_Output(self,other, " DIA_Zuris_POTIONS_14_03 " );	// But he's too dumb to hire anyone himself. And besides, stubborn as a mule.
	};

	AI_Output(self,other, " DIA_Zuris_Add_14_00 " );	// He always walks past me when he comes out through the east gate to collect plants for his potions.
};

instances of DIA_Zuris_Kraut (C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kraut_Condition;
	information = DIA_Zuris_Kraut_Info;
	permanent = FALSE;
	description = " Where exactly does Constantino collect herbs? " ;
};

func int DIA_Zuris_Kraut_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Zuris_Potions))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Kraut_Info()
{
	AI_Output(other,self, " DIA_Zuris_Add_15_01 " );	// Where exactly does Constantino collect herbs?
	AI_Output(self,other, " DIA_Zuris_Add_14_02 " );	// He always exits through the east gate of the city, and then disappears into the forest to the left.
	AI_Output(self,other, " DIA_Zuris_Add_14_03 " );	// He once told me that almost everything he needs grows there, with the exception of royal sorrel.
	MikaHaveKey = TRUE;
	Wld_InsertItem(ItPl_Mana_Herb_01,"FP_ITEM_HERB_01");
	Wld_InsertItem(ItPl_Mana_Herb_02,"FP_ITEM_HERB_02");
	Wld_InsertItem(ItPl_Mana_Herb_03,"FP_ITEM_HERB_03");
	Wld_InsertItem(ItPl_Health_Herb_01,"FP_ITEM_HERB_04");
	Wld_InsertItem(ItPl_Health_Herb_02,"FP_ITEM_HERB_05");
	Wld_InsertItem(ItPl_Health_Herb_03,"FP_ITEM_HERB_06");
	Wld_InsertItem(ItPl_Speed_Herb_01,"FP_ITEM_HERB_07");
	Wld_InsertItem(ItPl_Health_Herb_01,"FP_ITEM_HERB_08");
	Wld_InsertItem(ItPl_Strength_Herb_01,"FP_ROAM_CITY_TO_FOREST_10");
	Wld_InsertItem(ItPl_Mushroom_02,"FP_ITEM_HERB_10");
	Wld_InsertItem(ItPl_Mushroom_01,"FP_ITEM_HERB_09");
};


instance DIA_Zuris_Kronstoeckel (C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kronstoeckel_Condition;
	information = DIA_Zuris_Kronstoeckel_Info;
	permanent = FALSE;
	description = " Did Constantino tell you where to find king sorrel? " ;
};


func int DIA_Zuris_Kronstoeckel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Zuris_Kraut))
	{
		return TRUE;
	};
};

func void DIA_Zuris_Kronstoeckel_Info()
{
	AI_Output(other,self, " DIA_Zuris_Add_15_04 " );	// Did Constantino tell you where you can find king sorrel?
	AI_Output(self,other, " DIA_Zuris_Add_14_05 " );	// He once mentioned that it grows near stone circles.
	AI_Output(self,other, " DIA_Zuris_Add_14_06 " );	// Near the Lobart farm, this farm is not far from the other gate, there is one of these stone circles.
	AI_Output(self,other, " DIA_Zuris_Add_14_07 " );	// As far as I remember, he stands on a hill. There used to be a grave there, or something like that.
	Wld_InsertItem(ItPl_Perm_Herb,"FP_ITEM_HERB_11");
};


instance DIA_Zuris_WHERE(C_Info)
{
	npc = VLK_409_Zuris;
	condition = DIA_Zuris_WHERE_Condition;
	information = DIA_Zuris_WHERE_Info;
	permanent = FALSE;
	description = " Where can I find Constantino? " ;
};


func int DIA_Zuris_WHERE_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Zuris_Potions ) && ( Constantino . aivar [ AIV_TalkedToPlayer ] ==  FALSE )) .
	{
		return TRUE;
	};
};

func void DIA_Zuris_WHERE_Info()
{
	AI_Output(other,self, " DIA_Zuris_WHERE_15_00 " );	// Where can I find Constantino?
	AI_Output(self,other, " DIA_Zuris_WHERE_14_01 " );	// His home is in a tunnel near Harad's forge. It won't be hard to find!
};


instance DIA_Zuris_Kloster(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_Kloster_Condition;
	information = DIA_Zuris_Kloster_Info;
	description = " Tell me about the monastery. " ;
};


func int DIA_Zuris_Kloster_Condition()
{
	if (Zuris_once ==  TRUE )
	{
		return  FALSE ;
	};
	return TRUE;
};

func void DIA_Zuris_Kloster_Info()
{
	AI_Output(other,self, " DIA_Zuris_Kloster_14_00 " );	// Tell me about the monastery.
	AI_Output(self,other, " DIA_Zuris_Kloster_14_01 " );	// You'd better talk to Master Daron himself about this. He knows more than me.
};


instance DIA_Zuris_Minenanteil (C_Info)
{
	npc = VLK_409_Zuris;
	nr = 3;
	condition = DIA_Zuris_Minenanteil_Condition;
	information = DIA_Zuris_MinenTeil_Info;
	description = " Do you sell mining shares? " ;
};


func int DIA_Zuris_Minenanteil_Condition()
{
	if ((hero.guild ==  GIL_KDF ) && (MY_Serpent_MineBefore_KDF == LOG_Running))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Zuris_Minenanteil_Info()
{
	AI_Output(other,self, " DIA_Zuris_Minenanteil_15_00 " );	// Do you sell mining shares?
	AI_Output(self,other, " DIA_Zuris_Minenanteil_14_01 " );	// Yes. It's not the most profitable business. I will never do business with this again!
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_ZURIS_TRADEPLACE(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 3;
	condition = dia_zuris_tradeplace_condition;
	information = dia_zuris_tradeplace_info;
	description = " They say you're having trouble with the trader Jora. " ;
};


func int dia_zuris_tradeplace_condition()
{
	if(MIS_JORAHELP == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_zuris_tradeplace_info()
{
	AI_Output(other,self, " DIA_Zuris_TradePlace_01_00 " );	// They say you're having trouble with merchant Jora.
	AI_Output(self,other, " DIA_Zuris_TradePlace_01_04 " );	// Indeed, I had some friction with Jorah on one issue.
	AI_Output(self,other, " DIA_Zuris_TradePlace_01_06 " );	// (annoyed) I don't think it's your business, but since you already know, then...
	AI_Output(self,other, " DIA_Zuris_TradePlace_01_07 " );	// ...I refused Jora's lease on the square where he now trades.
	AI_Output(self,other, " DIA_Zuris_TradePlace_01_08 " );	// Of course, he didn't like it at all, and neither did his colleagues in the Commerce Guild.
	AI_Output(self,other, " DIA_Zuris_TradePlace_01_09 " );	// You've heard of her, haven't you?
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace, " I don't think so. " ,dia_zuris_tradeplace_hearguildno);
	Info_AddChoice(dia_zuris_tradeplace, " Yes, I've heard of her. " ,dia_zuris_tradeplace_hearguildyes);
};

func void dia_zuris_tradeplace_hearguildno()
{
	AI_Output(other,self, " DIA_Zuris_TradePlace_HearGuildNo_01_00 " );	// Never heard of this one.
	AI_Output(self,other, " DIA_Zuris_TradePlace_HearGuildNo_01_01 " );	// Yes? Interesting. Nevermind.
	AI_Output(other,self, " DIA_Zuris_TradePlace_HearGuildNo_01_02 " );	// So why did you say no to Jora?
	AI_Output(self,other, " DIA_Zuris_TradePlace_HearGuildNo_01_05 " );	// I recently received a lucrative offer to buy his seat.
	AI_Output(self,other, " DIA_Zuris_TradePlace_HearGuildNo_01_06 " );	// An offer I couldn't refuse...
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace, " So it's all about money? " ,dia_zuris_tradeplace_ask);
};

func void dia_zuris_tradeplace_hearguildyes()
{
	AI_Output(other,self, " DIA_Zuris_TradePlace_HearGuildYes_01_00 " );	// I heard something about her.
	AI_Output(self,other, " DIA_Zuris_TradePlace_HearGuildYes_01_01 " );	// Yes?! I wonder where?
	AI_Output(self,other, " DIA_Zuris_TradePlace_HearGuildYes_01_04 " );	// (snickeringly) Only members of the Merchants' Guild know of its existence.
	AI_Output(self,other, " DIA_Zuris_TradePlace_HearGuildYes_01_05 " );	// Well, and some powerful merchants like me, which you are not one of.
	AI_Output(other,self, " DIA_Zuris_TradePlace_HearGuildYes_01_06 " );	// What are you getting at?
	AI_Output(self,other, " DIA_Zuris_TradePlace_HearGuildYes_01_07 " );	// Looks like you're working for that Luthero fool!
	AI_Output(self,other, " DIA_Zuris_TradePlace_HearGuildYes_01_08 " );	// He was the one who could tell you about my dealings with Jorah.
	AI_Output(self,other, " DIA_Zuris_TradePlace_HearGuildYes_01_10 " );	// Thought you could trick me? Do you take me for an idiot?!
	AI_Output(other,self, " DIA_Zuris_TradePlace_HearGuildYes_01_11 " );	// Listen...
	AI_Output(self,other, " DIA_Zuris_TradePlace_HearGuildYes_01_12 " );	// ...(interrupting) I won't listen to you!
	AI_Output(self,other, " DIA_Zuris_TradePlace_HearGuildYes_01_13 " );	// And I won't change my mind about Jora! So you can pass on Luthero!
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace, " Luthero is very concerned about this fact. " ,dia_zuris_tradeplace_lutero);
	Info_AddChoice(dia_zuris_tradeplace, " Your revenge on Luthero won't solve your problems with him. " ,dia_zuris_tradeplace_problem);
	Info_AddChoice(dia_zuris_tradeplace, " We can agree. " ,dia_zuris_tradeplace_deal);
	Info_AddChoice(dia_zuris_tradeplace, " If you don't change your mind, I'll kill you! " ,dia_zuris_tradeplace_dead);
};

func void dia_zuris_tradeplace_ask()
{
	AI_Output(other,self, " DIA_Zuris_TradePlace_Ask_01_00 " );	// So money is the problem?
	AI_Output(self,other, " DIA_Zuris_TradePlace_Ask_01_01 " );	// (sarcastically) Well, not really.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Ask_01_02 " );	// I've been having a tense relationship with the Merchants' Guild lately.
	AI_Output(other,self, " DIA_Zuris_TradePlace_Ask_01_04 " );	// What's the matter?
	AI_Output(self,other, " DIA_Zuris_TradePlace_Ask_01_05 " );	// I see you are very interested in this topic.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Ask_01_06 " );	// Tell me, why do you care so much?
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace, " I'm worried about Jora. " ,dia_zuris_tradeplace_jora);
	Info_AddChoice(dia_zuris_tradeplace, " I'm interested in Jora's place. " ,dia_zuris_tradeplace_place);
	Info_AddChoice(dia_zuris_tradeplace, " Just wondering. " ,dia_zuris_tradeplace_interes);
	Info_AddChoice(dia_zuris_tradeplace, " Luthero sent me to discuss this issue with you. " ,dia_zuris_tradeplace_luterozuris);
};

func void dia_zuris_tradeplace_interes()
{
	AI_Output(other,self, " DIA_Zuris_TradePlace_Interes_01_00 " );	// Well, I'm just curious.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Interes_01_01 " );	// I'll give you advice - don't stick your nose everywhere!
	AI_Output(self,other, " DIA_Zuris_TradePlace_Interes_01_04 " );	// Besides, I don't have time for you.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Interes_01_05 " );	// So leave me alone!
	B_LogEntry( TOPIC_JORAHELP , " I couldn't explain to Zuris why I'm interested in his problems with Jora and the merchants guild. I don't think Zuris will discuss this with me again. Looks like I failed this errand. I should report this to Luthero. " );
	ZURISPISSOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_tradeplace_luterosuris()
{
	AI_Output(other,self, " DIA_Zuris_TradePlace_LuteroZuris_01_00 " );	// Luthero sent me to discuss this issue with you.
	AI_Output(self,other, " DIA_Zuris_TradePlace_LuteroZuris_01_01 " );	// What?! (angrily) So Luthero sent you to me?!
	AI_Output(self,other, " DIA_Zuris_TradePlace_LuteroZuris_01_04 " );	// Looks like Luthero thought you could influence my decision about Jora? (laughs)
	AI_Output(self,other, " DIA_Zuris_TradePlace_LuteroZuris_01_06 " );	// If he wants to discuss this problem, then let him come!
	AI_Output(self,other, " DIA_Zuris_TradePlace_LuteroZuris_01_10 " );	// I won't change my decision about Jora! So you can pass on Luthero.
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace, " Luthero is very concerned about this fact. " ,dia_zuris_tradeplace_lutero);
	Info_AddChoice(dia_zuris_tradeplace, " We can deal! " ,dia_zuris_tradeplace_deal);
};

func void dia_zuris_tradeplace_lutero()
{
	AI_Output(other,self, " DIA_Zuris_TradePlace_Lutero_01_00 " );	// Luthero is very concerned about this.
	AI_Output(other,self, " DIA_Zuris_TradePlace_Lutero_01_01 " );	// Your disagreements may affect the guild's income. Besides...
	AI_Output(self,other, " DIA_Zuris_TradePlace_Lutero_01_02 " );	// ...(interrupting) What he's worried about is his personal problems!
	AI_Output(self,other, " DIA_Zuris_TradePlace_Lutero_01_03 " );	// Maybe this will teach him something. And I told you everything.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Lutero_01_04 " );	// And I'm not going to discuss this anymore. Leave me alone!
	; _ _ _ _ _ _
	ZURISFUCKOFF = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_tradeplace_deal()
{
	AI_Output(other,self, " DIA_Zuris_TradePlace_Deal_01_00 " );	// We can agree.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Deal_01_01 " );	// Yes? (maliciously) And how are you going to negotiate with me?
	AI_Output(other,self, " DIA_Zuris_TradePlace_Deal_01_02 " );	// What if I buy this trading place?
	AI_Output(self,other, " DIA_Zuris_TradePlace_Deal_01_03 " );	// What? And you think I'll sell it to you?!
	AI_Output(other,self, " DIA_Zuris_TradePlace_Deal_01_04 " );	// Why not? In the end, everything has its price. Even your relationship with Luthero.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Deal_01_08 " );	// Well, well, I'm just afraid that the price will be too tough for you!
	AI_Output(other,self, " DIA_Zuris_TradePlace_Deal_01_09 " );	// How much did that merchant offer you?
	AI_Output(self,other, " DIA_Zuris_TradePlace_Deal_01_10 " );	// It's none of your business. For you, the price will be completely different!
	AI_Output(self,other, " DIA_Zuris_TradePlace_Deal_01_13 " );	// (thinking) If everything is taken into account and calculated, then I think...
	AI_Output(self,other, " DIA_Zuris_TradePlace_Deal_01_14 " );	// ...ten thousand gold coins could make me refuse the previous offer.
	AI_Output(other,self, " DIA_Zuris_TradePlace_Deal_01_15 " );	// Ten thousand?! Yes, you're crazy!
	AI_Output(self,other, " DIA_Zuris_TradePlace_Deal_01_16 " );	// These are my conditions! Whether you accept them or not is your own business.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Deal_01_20 " );	// Of course, a ragamuffin like you is unlikely to ever have such an amount.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Deal_01_21 " );	// But the guild you belong to, as I understand it, is quite capable of paying... (laughs)
	B_LogEntry( TOPIC_JORAHELP , " I accidentally blabbed to Zuris that Luthero sent me. Zuris was about to end the conversation with me, but I was able to convince him that it was still possible to reach a mutual agreement on this issue. I suggested that Zuris buy Jora's place , and after a little thought, he agreed with my proposal, although he asked for a huge amount of money - ten thousand gold coins! I don't think Luthero will be delighted with this idea. " );
	ZURISTRADEPLACEYES = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_tradeplace_jora()
{
	AI_Output(other,self, " DIA_Zuris_TradePlace_Jora_01_00 " );	// I'm worried about Jora.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Jora_01_01 " );	// Yes?! (surprised) And what caused your concern for his person?
	AI_Output(other,self, " DIA_Zuris_TradePlace_Jora_01_02 " );	// I know Jora and I think he is a good man and an honest trader.
	AI_Output(other,self, " DIA_Zuris_TradePlace_Jora_01_03 " );	// By taking away his place, you deprive him of the main thing - his favorite job.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Jora_01_11 " );	// I have nothing against Jora! He is a decent man with some personal qualities that other merchants don't have.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Jora_01_12 " );	// But he's also in the guild, which means he listens to that pompous Luthero fool.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Jora_01_13 " );	// Therefore, his headache is always a joy to me!
	AI_Output(other,self, " DIA_Zuris_TradePlace_Jora_01_15 " );	// So this is all because of your relationship with Luthero?
	AI_Output(self,other, " DIA_Zuris_TradePlace_Jora_01_16 " );	// So what? In any case, I will teach this insolent man a lesson, and it does not matter that other people suffer because of this.
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace, " Your revenge on Luthero won't solve your problems with him. " ,dia_zuris_tradeplace_problem);
	Info_AddChoice(dia_zuris_tradeplace, " If you don't change your mind, I'll kill you! " ,dia_zuris_tradeplace_dead);
};

func void dia_zuris_tradeplace_dead()
{
	AI_Output(other,self, " DIA_Zuris_TradePlace_Dead_01_00 " );	// If you don't change your mind, I'll kill you!
	AI_Output(self,other, " DIA_Zuris_TradePlace_Dead_01_01 " );	// WHAT?! How dare you threaten me?!
	AI_Output(self,other, " DIA_Zuris_TradePlace_Dead_01_07 " );	// GUARD!!! GUARD!!!
	CreateInvItems(self,itwr_zurisdocs,1);
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_GuardStopsIntruder,0);
};

func void dia_zuris_tradeplace_place()
{
	AI_Output(other,self, " DIA_Zuris_TradePlace_Place_01_00 " );	// I'm interested in Jora's merchant position.
	AI_Output(other,self, " DIA_Zuris_TradePlace_Place_01_02 " );	// Could you sell it to me?
	AI_Output(self,other, " DIA_Zuris_TradePlace_Place_01_03 " );	// (surprised) But I already have an arrangement with another merchant.
	AI_Output(other,self, " DIA_Zuris_TradePlace_Place_01_05 " );	// I could offer you a better price.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Place_01_10 " );	// Yes? OK then. Hmmm ... If you take everything into account and calculate, then I think ...
	AI_Output(self,other, " DIA_Zuris_TradePlace_Place_01_11 " );	// ...five thousand gold coins will be enough. And I'll forget about the old sentence.
	AI_Output(other,self, " DIA_Zuris_TradePlace_Place_01_12 " );	// Five thousand?! Yes, it's a robbery!
	AI_Output(self,other, " DIA_Zuris_TradePlace_Place_01_13 " );	// How would you like it? Good money for a decent place.
	AI_Output(other,self, " DIA_Zuris_TradePlace_Place_01_14 " );	// Okay. But I need some time to collect this amount.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Place_01_15 " );	// You have plenty of time. Jora's lease expires in three weeks, so it's up to you.
	; _ _ _ _ _ _
	ZURISTRADEPLACEYESCHIP = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_tradeplace_problem()
{
	AI_Output(other,self, " DIA_Zuris_TradePlace_Problem_01_00 " );	// I don't think your revenge on Luthero will solve your problems with him.
	AI_Output(other,self, " DIA_Zuris_TradePlace_Problem_01_02 " );	// Revenge is not the best way out of this situation.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_05 " );	// I didn't start this...
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_09 " );	// (thoughtfully) In general, I once had one agreement with Luthero.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_11 " );	// Once he promised to get me one very rare potion - Eligor's Flame.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_12 " );	// Whoever drinks it becomes simply immune to fire.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_13 " );	// But since Khorinis does not have the required ingredient, getting it is a big problem.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_23 " );	// But Luthero had connections on the mainland with other major merchants of Myrtana, and through them he could get this elixir.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_24 " );	// Of course, I would have to shell out just a huge pile of gold, but believe me - this thing was worth it.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_28 " );	// So. When this elixir was in Luthero's hands, he broke a fabulous price for it!
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_29 " );	// Almost three times more than we originally agreed!
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_30 " );	// (angrily) Of course I didn't have that kind of money - that's a fortune!
	AI_Output(other,self, " DIA_Zuris_TradePlace_Problem_01_31 " );	// So he violated the terms of the contract?
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_32 " );	// Exactly! This fool was so blinded by the lust for gold that he forgot about the trader's code.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_33 " );	// True, he did not have time to dispose of this treasure properly.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_34 " );	// A couple of days later, someone broke into his house and cleaned it to the skin, taking along with the elixir.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_38 " );	// Do you understand me now? I want to repay Luthero in kind.
	AI_Output(other,self, " DIA_Zuris_TradePlace_Problem_01_39 " );	// I understand, but besides him, other people who are not involved in your quarrel will also suffer.
	AI_Output(other,self, " DIA_Zuris_TradePlace_Problem_01_40 " );	// Perhaps Luthero regrets what he did then.
	AI_Output(other,self, " DIA_Zuris_TradePlace_Problem_01_43 " );	// Maybe I can help you get this elixir?
	AI_Output(self,other, " DIA_Zuris_TradePlace_Problem_01_48 " );	// Hmmm... Well, let's say. But why are you doing this?
	B_LogEntry(TOPIC_JORAHELP,"I discussed the issue regarding Jora with Zuris and found out the real reason why Zuris decided to refuse to renew Jora's lease on the market place in the square. It turned out that this refusal was nothing more than Zuris's revenge on Luthero. fulfilled the terms of the agreement concluded between him and Zuris, for the latter to acquire a very rare elixir called 'Flame of Eligor' Now Zuris wants to repay Luthero in the same coin. come to a mutual agreement of the parties, and offered to help him in this matter.");
	Info_ClearChoices(dia_zuris_tradeplace);
	Info_AddChoice(dia_zuris_tradeplace, " Just want to help. " ,dia_zuris_tradeplace_help);
};

func void dia_zuris_tradeplace_help()
{
	AI_Output(other,self, " DIA_Zuris_TradePlace_Help_01_00 " );	// Just want to help.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Help_01_07 " );	// Good. If you can get it for me, I'll reverse my decision on Jora.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Help_01_08 " );	// And, of course, I will compensate you for some of the costs of finding him. Within reasonable limits.
	AI_Output(other,self, " DIA_Zuris_TradePlace_Help_01_15 " );	// Where do you think the thief put this elixir?
	AI_Output(self,other, " DIA_Zuris_TradePlace_Help_01_16 " );	// It is unlikely that he would drink an unknown potion. Most likely, he sold it to someone for a small price.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Help_01_19 " );	// I have absolutely no idea where to start looking.
	AI_Output(self,other, " DIA_Zuris_TradePlace_Help_01_20 " );	// But I can give advice - talk about it with Luthero... (snidely)
	AI_Output(self,other, " DIA_Zuris_TradePlace_Help_01_21 " );	// Maybe he'll tell you where to start looking.
	B_LogEntry( TOPIC_JORAHELP , " Zuris agreed, but only on the condition that I get him Eligor's Flame elixir. I think it will not be an easy task at all. The only copy in Khorinis was stolen from Luthero. It is not known where he might be now. Zuris advised I should learn the details of this case from Luthero. " );
	ZURISGIVEMETASK = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_ZURIS_FUCKOFF(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 10;
	condition = dia_zuris_fuckoff_condition;
	information = dia_zuris_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_zuris_fuckoff_condition()
{
	if((ZURISFUCKOFF == TRUE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_zuris_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,300);
};


instance DIA_ZURIS_GIVEMETASKOK(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 10;
	condition = dia_zuris_givemetaskok_condition;
	information = dia_zuris_givemetaskok_info;
	permanent = FALSE;
	description = " I found the lost elixir. " ;
};


func int dia_zuris_givemetaskok_condition()
{
	if((ZURISGIVEMETASK == TRUE) && (Npc_HasItems(other,itpo_eligorfire) >= 1))
	{
		return TRUE;
	};
};

func void dia_zuris_givemetaskok_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Zuris_GiveMeTaskOk_01_00 " );	// I found Eligor's flame.
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_01_03 " );	// Incredible! I can not believe it!
	B_GiveInvItems(other,self,itpo_eligorfire,1);
	Npc_RemoveInvItems(self,itpo_eligorfire,1);
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_01_07 " );	// O Innos! Finally, this treasure is in my hands!
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_01_08 " );	// You made me a truly happy person!
	AI_Output(other,self, " DIA_Zuris_GiveMeTaskOk_01_09 " );	// So Jora will be able to continue trading in the marketplace?
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_01_10 " );	// Don't worry, now I'll keep my end of our deal.

	if(LUTEROAGREEMEETZURIS == TRUE)
	{
		AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_01_13 " );	// In your absence, I did some thinking and came to the conclusion that your help had a slightly different motive.
		AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_01_14 " );	// ...than the ones you mentioned earlier.
		AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_01_15 " );	// In addition, Luthero recently paid me a visit, and this meeting finally convinced me of the correctness of my arguments.
		AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_01_21 " );	// We talked with him for a long time. In the end, we came to a consensus that our differences are not beneficial to both of us.
		AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_01_22 " );	// Well, you know what I mean?
		Info_ClearChoices(dia_zuris_givemetaskok);
		Info_AddChoice(dia_zuris_givemetaskok, " Yes, I know...(I confess) " ,dia_zuris_givemetaskok_iknow);
		Info_AddChoice(dia_zuris_givemetaskok, " I don't know what you mean! " ,dia_zuris_givemetaskok_tellme);
	}
	else
	{
		AI_Output(other,self, " DIA_Zuris_GiveMeTaskOk_01_25 " );	// So Jora will be able to continue trading in the marketplace?
		AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_01_26 " );	// You understood me correctly - I will extend his lease and even drop the price of it a little.
		AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_01_27 " );	// Of course, your work will also pay off. Here, take this gold from me as a reward.
		AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_01_28 " );	// You deserve it.
		B_GiveInvItems(self,other,ItMi_Gold,200);
		AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_01_30 " );	// And now...(thoughtfully)...sorry, but I have things to do.
		ZURISGIVEMETASKOK = TRUE;
		NoEligorBuy = TRUE;
		AI_StopProcessInfos(self);
	};
};

func void dia_zuris_givemetaskok_iknow()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Zuris_GiveMeTaskOk_Iknow_01_00 " );	// Yes, I'm aware.
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Iknow_01_01 " );	// I thought so! Besides, Luthero told me everything, including your commission about Jora.
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Iknow_01_14 " );	// Now I want to thank you for your efforts in this matter.
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Iknow_01_15 " );	// In exchange for the Flame of Eligor that you brought me, I will give you another one. Of course, it's not that valuable, but...
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Iknow_01_16 " );	// ...it doesn't make its properties any less valuable.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Iknow_01_17 " );	// Try to use it wisely.
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Iknow_01_19 " );	// Now excuse me, I have things to do.
	ZURISGIVEMETASKOK = TRUE;
	ZURISGIVEMETASKOKBONUS = TRUE;
	NoEligorBuy = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_zuris_givemetaskok_tellme()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Zuris_GiveMeTaskOk_Tellme_01_00 " );	// I don't know what you mean!
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Tellme_01_01 " );	// True? (thoughtfully) I was expecting a slightly different answer from you.
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Tellme_01_05 " );	// Luthero told me everything, including your assignment about Jora.
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Tellme_01_21 " );	// And I want to thank you for your efforts in this matter.
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Tellme_01_22 " );	// In exchange for the Flame of Eligor that you brought me, I will give you another one. Of course, it's not that valuable, but...
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Tellme_01_23 " );	// ...it doesn't make its properties any less valuable.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Tellme_01_25 " );	// And that's not all.
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Tellme_01_26 " );	// After a little thought, I decided that once in my hands, the elixir you found is no longer of such value to me as before.
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Tellme_01_29 " );	// Now it's as valuable to me as the other elixirs I sell. The only difference is the price.
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Tellme_01_30 " );	// Therefore, now I would like to sell this little thing as profitably as possible.
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Tellme_01_31 " );	// And I think you should be interested in this offer.
	AI_Output(other,self, " DIA_Zuris_GiveMeTaskOk_Tellme_01_32 " );	// Are you offering me to buy the elixir I got from you?
	AI_Output(self,other, " DIA_Zuris_GiveMeTaskOk_Tellme_01_35 " );	// Yes. For only seven thousand gold!
	AI_Output(other,self, " DIA_Zuris_GiveMeTaskOk_Tellme_01_36 " );	// Yes, you really are a swindler, Zuris! I will think.
	ZURISGIVEMETASKOK = TRUE;
	ZURISGIVEMETASKOKBONUS = TRUE;
	TRADEELIGORFIRE = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_ZURIS_TRADEELIGORFIRE(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 10;
	condition = dia_zuris_tradeeligorfire_condition;
	information = dia_zuris_tradeeligorfire_info;
	permanent = TRUE;
	description = " Sell me Eligor's Flame. " ;
};

func int dia_zuris_tradeeligorfire_condition()
{
	if((TRADEELIGORFIRE == TRUE) && (TRADEELIGORFIREOK == FALSE))
	{
		return TRUE;
	};
};

func void dia_zuris_tradeeligorfire_info()
{
	AI_Output(other,self, " DIA_Zuris_TradeEligorFire_01_00 " );	// Sell me the Flame of Eligor.

	if(Npc_HasItems(other,ItMi_Gold) >= 7000)
	{
		AI_Output(self,other, " DIA_Zuris_TradeEligorFire_01_02 " );	// Well, as agreed - the elixir is yours!
		Npc_RemoveInvItems(other,ItMi_Gold,7000);
		B_GiveInvItems(self,other,itpo_eligorfire,1);
		AI_Output(other,self,"DIA_Zuris_TradeEligorFire_01_03");	//Спасибо!
		TRADEELIGORFIREOK = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Zuris_TradeEligorFire_01_05 " );	// But wait - you don't have enough gold!
		AI_Output(self,other, " DIA_Zuris_TradeEligorFire_01_08 " );	// Come back when you have money.
	};
};


instance DIA_ZURIS_ZURISTRADEPLACEME(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 10;
	condition = dia_zuris_zuristradeplaceme_condition;
	information = dia_zuris_zuristradeplaceme_info;
	permanent = TRUE;
	description = " Sell me Jora's marketplace. " ;
};


func int dia_zuris_zuristradeplaceme_condition()
{
	if((ZURISTRADEPLACEMEOK == FALSE) && ((ZURISTRADEPLACEYES == TRUE) || (ZURISTRADEPLACEYESCHIP == TRUE)))
	{
		return TRUE;
	};
};

func void dia_zuris_zuristradeplaceme_info()
{
	AI_Output(other,self, " DIA_Zuris_ZurisTradePlaceMe_01_00 " );	// Sell me Jora's trading post.

	if((ZURISTRADEPLACEYES == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 10000))
	{
		B_GiveInvItems(other,self,ItMi_Gold,10000);
		AI_Output(self,other, " DIA_Zuris_ZurisTradePlaceMe_01_06 " );	// This looks like the most successful trade I've ever made!
		AI_Output(self,other, " DIA_Zuris_ZurisTradePlaceMe_01_08 " );	// Here, take this document.
		B_GiveInvItems(self,other,itwr_zurisdocs,1);
		AI_Output(other,self, " DIA_Zuris_ZurisTradePlaceMe_01_09 " );	// What is the document?
		AI_Output(self,other, " DIA_Zuris_ZurisTradePlaceMe_01_10 " );	// This is the ownership agreement for the trading place where Jora currently works.
		AI_Output(self,other, " DIA_Zuris_ZurisTradePlaceMe_01_11 " );	// Just write your name or the name of another person in it - and the document will acquire official status.
		B_LogEntry( TOPIC_JORAHELP , " I gave Zuris the gold he asked me for Jora's trading space. He gave me an owner's agreement in which you just need to enter the name of the future owner and after that the document will become official. Now I need to take these papers to Luthero. " );
		ZURISTRADEPLACEMEOK = TRUE;
		AI_StopProcessInfos(self);
	}
	else if((ZURISTRADEPLACEYESCHIP == TRUE) && (Npc_HasItems(other,ItMi_Gold) >= 5000))
	{
		B_GiveInvItems(other,self,ItMi_Gold,5000);
		AI_Output(self,other, " DIA_Zuris_ZurisTradePlaceMe_01_24 " );	// This looks like one of the most successful trades I've ever made!
		AI_Output(self,other, " DIA_Zuris_ZurisTradePlaceMe_01_26 " );	// Here, take this document.
		B_GiveInvItems(self,other,itwr_zurisdocs,1);
		AI_Output(other,self, " DIA_Zuris_ZurisTradePlaceMe_01_27 " );	// What is the document?
		AI_Output(self,other, " DIA_Zuris_ZurisTradePlaceMe_01_28 " );	// This is the ownership agreement for the trading place where Jora currently works.
		AI_Output(self,other, " DIA_Zuris_ZurisTradePlaceMe_01_29 " );	// Just write your name or the name of another person in it - and the document will acquire official status.
		B_LogEntry( TOPIC_JORAHELP , " I gave Zuris the gold he asked me for Jora's trading space. He gave me an owner's agreement in which you just need to enter the name of the future owner and after that the document will become official. Now I need to take these papers to Luthero. " );
		ZURISTRADEPLACEMEOK = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(other,self, " DIA_Zuris_ZurisTradePlaceMe_01_38 " );	// But I don't seem to have enough money for our deal.
		AI_Output(self,other, " DIA_Zuris_ZurisTradePlaceMe_01_39 " );	// Then why are you distracting me? (annoyed) I told you...
		if(ZURISTRADEPLACEYES == TRUE)
		{
			AI_Output(self,other, " DIA_Zuris_ZurisTradePlaceMe_01_42 " );	// ...ten thousand gold coins and not a coin less!
		}
		else if(ZURISTRADEPLACEYESCHIP == TRUE)
		{
			AI_Output(self,other, " DIA_Zuris_ZurisTradePlaceMe_01_43 " );	// ...five thousand gold coins and not a coin less!
		};
		AI_Output(self,other, " DIA_Zuris_ZurisTradePlaceMe_01_44 " );	// And now we have nothing to talk about with you.
		AI_StopProcessInfos(self);
	};
};

instance DIA_ZURIS_ABOUTKILLIGNAZ(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = dia_zuris_aboutkillignaz_condition;
	information = dia_zuris_aboutkillignaz_info;
	permanent = FALSE;
	description = " About killing the alchemist Ignaz. " ;
};

func int dia_zuris_aboutkillignaz_condition()
{
	if((ASKKILLFIRST == TRUE) && (ASKKILLSECOND == TRUE) && (ASKKILLTHIRD == TRUE))
	{
		return TRUE;
	};
};

func void dia_zuris_aboutkillignaz_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Zuris_AboutKillIgnaz_01_01 " );	// About killing the alchemist Ignaz...
	AI_Output(self,other, " DIA_Zuris_AboutKillIgnaz_01_06 " );	// Wait... I'm just a simple merchant, and I don't poke my nose into such things.
	AI_Output(other,self, " DIA_Zuris_AboutKillIgnaz_01_07 " );	// But here, in the market square, there are always rumors.
	AI_Output(other,self, " DIA_Zuris_AboutKillIgnaz_01_08 " );	// Maybe you've heard something unusual lately?
	AI_Output(self,other, " DIA_Zuris_AboutKillIgnaz_01_09 " );	// No, nothing like that. And if he had learned anything, he would have already reported this to the city guard long ago.
	AI_Output(self,other, " DIA_Zuris_AboutKillIgnaz_01_10 " );	// Although, to tell the truth, these guys are absolutely useless.
	AI_Output(self,other, " DIA_Zuris_AboutKillIgnaz_01_12 " );	// Those militia morons are too lazy to do that sort of thing.
	AI_Output(self,other, " DIA_Zuris_AboutKillIgnaz_01_13 " );	// Imagine, they didn't even bother to inspect the hut where Ignaz lived.
	AI_Output(self,other, " DIA_Zuris_AboutKillIgnaz_01_14 " );	// But there might be something left there that would help them find the killer.
	B_LogEntry( TOPIC_KILLIGNAZ , " Looks like potion dealer Zuris doesn't know anything about killing Ignaz either. " );
	Wld_InsertItem(itmi_poisonbottle,"FP_ITEM_POISONIGNAZ");
};


instance DIA_Zuris_LOKIPOTION(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_LOKIPOTION_Condition;
	information = DIA_Zuris_LOKIPOTION_Info;
	permanent = FALSE;
	description = " You sell herbs, right? " ;
};


func int DIA_Zuris_LOKIPOTION_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (SeekCactus == TRUE) && (TradeCactus == TRUE) && (FindCactus == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_LOKIPOTION_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Zuris_LOKIPOTION_01_00 " );	// You sell herbs, right?
	AI_Output(self,other, " DIA_Zuris_LOKIPOTION_01_01 " );	// Of course. What specifically interests you?
	AI_Output(other,self, " DIA_Zuris_LOKIPOTION_01_02 " );	// I'm looking for an extremely rare ingredient here - a cactus flower. Do you happen to have it?
	AI_Output(self,other, " DIA_Zuris_LOKIPOTION_01_03 " );	// Yes, I had one of these.
	AI_Output(self,other, " DIA_Zuris_LOKIPOTION_01_04 " );	// But a mage from the monastery bought it a couple of days ago.
	AI_Output(other,self, " DIA_Zuris_LOKIPOTION_01_05 " );	// Damn, this is not the right time. And he did not say why he suddenly needed it?
	AI_Output(self,other, " DIA_Zuris_LOKIPOTION_01_06 " );	// He said he wanted to use this ingredient for his alchemical experiments.
	AI_Output(self,other, " DIA_Zuris_LOKIPOTION_01_07 " );	// And paid a decent amount of gold for this flower.
	AI_Output(self,other, " DIA_Zuris_LOKIPOTION_01_08 " );	// So sorry. Now there is nothing I can do to help.
	FindCactus = TRUE;
	B_LogEntry(TOPIC_PrioratStart, " Merchant Zuris had this plant, but a couple of days ago he sold it to some fire mage from the monastery. I need to somehow try to get this rare specimen from the servants of Innos. " );
};


instance DIA_Zuris_FromWhomCactus(C_Info)
{
	npc = VLK_409_Zuris;
	nr = 2;
	condition = DIA_Zuris_FromWhomCactus_Condition;
	information = DIA_Zuris_FromWhomCactus_Info;
	permanent = FALSE;
	description = " Where did you get this plant from? " ;
};


func int DIA_Zuris_FromWhomCactus_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (FindCactus == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Zuris_FromWhomCactus_Info()
{
	AI_Output(other,self, " DIA_Zuris_FromWhomCactus_01_00 " );	// Where did you get this plant from?
	AI_Output(self,other, " DIA_Zuris_FromWhomCactus_01_01 " );	// It was brought to me by a familiar merchant from Varant. True, it was a long time ago.
	AI_Output(other,self, " DIA_Zuris_FromWhomCactus_01_02 " );	// So it's impossible to get another copy of this plant?
	AI_Output(self,other, " DIA_Zuris_FromWhomCactus_01_03 " );	// Previously, this would not have been such a problem. And now you yourself know what times have come.
	AI_Output(self,other, " DIA_Zuris_FromWhomCactus_01_04 " );	// And the only ship that came to our port in half a year turned out to be a paladin warship.
	AI_Output(self,other, " DIA_Zuris_FromWhomCactus_01_05 " );	// (laughs) And they are unlikely to be engaged in the transportation of some plants.
};
