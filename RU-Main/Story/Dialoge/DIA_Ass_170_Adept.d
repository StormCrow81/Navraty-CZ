instance DIA_Ass_170_Adept_EXIT(C_Info)
{
	npc = Ass_170_Adept;
	No. = 999 ;
	condition = DIA_Ass_170_Adept_exit_condition;
	information = DIA_Ass_170_Adept_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_170_Adept_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_170_Adept_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Ass_170_Adept_Muritan(C_Info)
{
	npc = Ass_170_Adept;
	no. = 2 ;
	condition = DIA_Ass_170_Adept_Muritan_Condition;
	information = DIA_Ass_170_Adept_Muritan_Info;
	permanent = FALSE ;
	description = " I heard you had to kill a Muritan. " ;
};

func int DIA_Ass_170_Adept_Muritan_Condition()
{
	if(MIS_TiamantMuritan == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_Muritan_Info()
{
	AI_Output (other, self, " DIA_Ass_170_Adept_Muritan_01_01 " );	// I heard you had to kill a Muritan.
	AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_01_02 " );	// Yes, I had to. What about you, novice?
	AI_Output (other, self, " DIA_Ass_170_Adept_Muritan_01_03 " );	// Prior Tiamant has instructed me to track down and kill one of the beasts.
	AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_01_04 " );	// I've killed one, and even I don't envy you. You have a hell of a fight coming your way.
	AI_Output (other, self, " DIA_Ass_170_Adept_Muritan_01_05 " );	// Can you give me any advice?

	if(HasimGetHisGold == TRUE)
	{
		AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_01_06 " );	// Well, since you helped me ... I'll give you a priceless tip.
		AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_01_07 " );	// But promise me you won't share this with anyone.
		AI_Output (other, self, " DIA_Ass_170_Adept_Muritan_01_08 " );	// (nods silently)
		AI_PlayAni(other,"T_YES");
		AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_01_09 " );	// Then listen. This may sound crazy, but these creatures are addicted... to SULFUR!
		AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_01_10 " );	// The mere smell of it attracts them like flies to shit.
		AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_01_11 " );	// So just bait raw meat with the stuff. You'll find some on any alchemy table.
		AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_01_12 " );	// Then find a more or less open place and place the bait there.
		AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_01_13 " );	// You will see that in less than half an hour the Muritan will find you.
		AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_01_14 " );	// Then, strike first and strike hard. Like a Cobra.
		AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_01_15");	//Will you remember all that?
		AI_Output (other, self, " DIA_Ass_170_Adept_Muritan_01_16 " );	// Yes, thanks for the advice.
		AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_01_17 " );	// Not at all. As they say, you scratch my back and all that.
		B_LogEntry (TOPIC_TiamantMuritan, " Hasim told me how to track down a muritan. It turns out that the smell of sulfur is very attractive to this predator. If I want to catch him, I will need to make bait from raw meat, and then process it with sulfur on the alchemy table. Then find a place, where there is a lot of sulfur and use the bait. " );
		MakeMuritanSweet = TRUE;
		AI_StopProcessInfos(self);
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_23");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_25");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_27");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_29");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_31");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_33");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_35");
		Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_37");
	}
	else
	{
		AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_01_18 " );	// And why exactly, would I do that, novice?
		AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_01_19 " );	// Seems to me this is YOUR problem.
		HasimNeedProof = TRUE;
		AI_StopProcessInfos(self);
	};
};


instance DIA_Ass_170_Adept_AssasinGold(C_Info)
{
	npc = Ass_170_Adept;
	no. = 2 ;
	condition = DIA_Ass_170_Adept_AssasinGold_Condition;
	information = DIA_Ass_170_Adept_AssasinGold_Info;
	permanent = FALSE ;
	description = " (give a bag of gold) " ;
};

func int DIA_Ass_170_Adept_AssasinGold_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1) && (HasimGetHisGold == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_AssasinGold_Info()
{
	B_GivePlayerXP(200);
	B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
	Npc_RemoveInvItems(self,ItMi_AssGoldPocket,1);
	AI_Output(self,other,"DIA_Ass_170_Adept_AssasinGold_01_01");	//What's this?
	AI_Output (other, self, " DIA_Ass_170_Adept_AssasinGold_01_02 " );	// Osair sends you this gold for the last batch of slaves.
	AI_Output (self, other, " DIA_Ass_170_Adept_AssasinGold_01_03 " );	// Great! I was afraid I'd have to go see him myself.
	AI_Output (other, self, " DIA_Ass_170_Adept_AssasinGold_01_04 " );	// Does the thought of that scare you?
	AI_Output (self, other, " DIA_Ass_170_Adept_AssasinGold_01_05 " );	// Scared my ass. It's just that I always feel... discomfited when I find myself in his cave.
	AI_Output (self, other, " DIA_Ass_170_Adept_AssasinGold_01_06 " );	// Always gives me the feeling that I'm going to go see Beliar himself.
	AI_Output (self, other, " DIA_Ass_170_Adept_AssasinGold_01_07 " );	// So you did me a favor by bringing this gold here. Thanks.
	B_LogEntry (TOPIC_AssasinGold, " I gave the gold to Hasim. He was glad he didn't have to go to Osair himself. " );
	HasimGetHisGold = TRUE;
};

instance DIA_Ass_170_Adept_Muritan_Ext(C_Info)
{
	npc = Ass_170_Adept;
	no. = 2 ;
	condition = DIA_Ass_170_Adept_Muritan_Ext_Condition;
	information = DIA_Ass_170_Adept_Muritan_Ext_Info;
	permanent = FALSE ;
	description = " Can you tell me how to kill a muritan now? " ;
};

func int DIA_Ass_170_Adept_Muritan_Ext_Condition()
{
	if((MIS_TiamantMuritan == LOG_Running) && (HasimGetHisGold == TRUE) && (HasimNeedProof == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_Muritan_Ext_Info()
{
	AI_Output (other, self, " DIA_Ass_170_Adept_Muritan_Ext_01_01 " );	// Maybe now you can tell me how to kill a muritan?
	AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_Ext_01_02 " );	// Well, since you helped me ... I'll give you a priceless tip.
	AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_Ext_01_03 " );	// But promise me you won't share this with anyone.
	AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_Ext_01_04");	//(silently nods)
	AI_PlayAni(other,"T_YES");
	AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_Ext_01_05 " );	// Then listen. This may sound crazy, but these creatures are addicted... to SULFUR!
	AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_Ext_01_06 " );	// The mere smell of it attracts them like flies to shit.
	AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_Ext_01_07 " );	// So just bait raw meat with the stuff. You'll find some on any alchemy table.
	AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_Ext_01_08 " );	// Then find a more or less open place and place the bait there.
	AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_Ext_01_09 " );	// You will see that in less than half an hour the Muritan will find you.
	AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_Ext_01_10 " );	// Then, strike first and strike hard. Like a Cobra.
	AI_Output(self,other,"DIA_Ass_170_Adept_Muritan_Ext_01_11");	//Will you remember all that?
	AI_Output(other,self,"DIA_Ass_170_Adept_Muritan_Ext_01_12");	//Yes, thanks for the advice.
	AI_Output (self, other, " DIA_Ass_170_Adept_Muritan_Ext_01_13 " );	// Not at all. As they say, you scratch my back and all that.
	B_LogEntry (TOPIC_TiamantMuritan, " Hasim told me how to track down a muritan. It turns out that the smell of sulfur is very attractive to this predator. If I want to catch him, I will need to make bait from raw meat, and then process it with sulfur on an alchemical table. " );
	MakeMuritanSweet = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_23");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_25");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_27");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_29");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_31");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_33");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_35");
	Wld_InsertNpc(Scavenger,"FP_ROAM_PW_MONSTER_37");
};

instance DIA_Ass_170_Adept_Narug(C_Info)
{
	npc = Ass_170_Adept;
	no. = 2 ;
	condition = DIA_Ass_170_Adept_Narug_Condition;
	information = DIA_Ass_170_Adept_Narug_Info;
	permanent = FALSE ;
	description = " Do you know where I can find Naruga? " ;
};

func int DIA_Ass_170_Adept_Narug_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (HasimGetHisGold == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_Narug_Info()
{
	AI_Output (other, self, " DIA_Ass_170_Adept_Narug_01_01 " );	// Do you know where I can find Naruga?
	AI_Output (self, other, " DIA_Ass_170_Adept_Narug_01_02 " );	// No. But it seems he was going to visit Osair to collect his gold.
	AI_Output (self, other, " DIA_Ass_170_Adept_Narug_01_03 " );	// But since you're looking for him he must not have made it there.
	AI_Output(other,self,"DIA_Ass_170_Adept_Narug_01_04");	//Ok, I'll sort this out..
	B_LogEntry (TOPIC_AssasinGold, " Hasim said that Naruga himself had been planning to go to Osair for a long time. Strange, but it looks like he never made it to his cave. " );
	Wld_InsertNpc(Ass_171_Adept,"PW_NARUG");
};


instance DIA_Ass_170_Adept_NarugGold(C_Info)
{
	npc = Ass_170_Adept;
	no. = 2 ;
	condition = DIA_Ass_170_Adept_NarugGold_Condition;
	information = DIA_Ass_170_Adept_NarugGold_Info;
	permanent = FALSE ;
	description = " You know, I can't find Naruga in any way. " ;
};

func int DIA_Ass_170_Adept_NarugGold_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (MakeHasimKiller == TRUE) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_NarugGold_Info()
{
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugGold_01_01 " );	// I can't find Naruga.
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_01_02 " );	// What do you want from me?
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugGold_01_03 " );	// Could you pick up his coin pouch, so that you can hand it over to him when you see him?
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_01_04 " );	// (surprised) Me? No. Sorry, I can't do that.
	Info_ClearChoices(DIA_Ass_170_Adept_NarugGold);
	Info_AddChoice (DIA_Ass_170_Adept_NarugGold, " What do you want for your help? " , DIA_Ass_170_Adept_NarugGold_Help);
	Info_AddChoice (DIA_Ass_170_Adept_NarugGold, " What about a couple of gold coins for your help? " , DIA_Ass_170_Adept_NarugGold_Gold);
	Info_AddChoice (DIA_Ass_170_Adept_NarugGold, " Then I'll have to report this to Osair. " , DIA_Ass_170_Adept_NarugGold_Osair);
	Info_AddChoice (DIA_Ass_170_Adept_NarugGold, " Can we come to an agreement somehow? " , DIA_Ass_170_Adept_NarugGold_Deal);
};

func void DIA_Ass_170_Adept_NarugGold_Gold()
{
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugGold_Gold_01_01 " );	// What about a couple of golds for your help?
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Gold_01_02 " );	// Gold won't help you here, novice.
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Gold_01_03 " );	// There are much more serious things here!
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Gold_01_04");	//Such as?
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Gold_01_05 " );	// I can't tell you that yet. You're not even a Shadow.
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Gold_01_06 " );	// So don't waste my time.
	HasimPissOffGold = TRUE ;
	AI_StopProcessInfos(self);
};

func void DIA_Ass_170_Adept_NarugGold_Osair()
{
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugGold_Osair_01_01 " );	// Then I'll have to tell Osair about it.
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugGold_Osair_01_02 " );	// And he is unlikely to like the news that Narug has disappeared.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugGold_Osair_01_03");	//So? What do I care?
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugGold_Osair_01_04 " );	// He will probably want to personally discuss the matter with you.
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Osair_01_05 " );	// (displeased) If Osair wants to see me ... well, then we will have to walk to his cave.
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Osair_01_06 " );	// But it still doesn't change anything. I won't take Naruga's wallet! Don't ask me again.
	HasimPissOffGold = TRUE ;
	AI_StopProcessInfos(self);
};

func void DIA_Ass_170_Adept_NarugGold_Deal()
{
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugGold_Deal_01_01 " );	// Maybe we can agree somehow?
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Deal_01_02 " );	// No chance, novice.
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Deal_01_03 " );	// There's nothing to talk about.
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Deal_01_04 " );	// So get out of my hair before I lose my temper.
	HasimPissOffGold = TRUE ;
	AI_StopProcessInfos(self);
};

func void DIA_Ass_170_Adept_NarugGold_Help()
{
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugGold_Help_01_01 " );	// What do you want for your help?

	if(RhetorikSkillValue[1] >= 50)
	{
		AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Help_01_02 " );	// (thoughtfully) Everyone wants something, right?.
		AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Help_01_03 " );	// There are of course a couple of things I would like to get my hands on.
		AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Help_01_04 " );	// But getting it is a massive risk, and it may cost you your head.
		AI_Output (other, self, " DIA_Ass_170_Adept_NarugGold_Help_01_05 " );	// So you'd be amenable to my request if I get this thing for you?
		AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Help_01_06 " );	// Yeah, sure, OK. But not a word to anyone about this. Understood?
		AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Help_01_07");	//Understood.
		AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Help_01_08 " );	// So, I heard that there is one bottle of very rare and expensive wine in the warehouse.
		AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Help_01_09 " );	// If you get it for me, then fine - I'll take Narug's wallet from you.
		AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Help_01_10 " );	// But don't fuck anything up, otherwise you can forget about our agreement.
		B_LogEntry (TOPIC_AssasinGold, " Hasim still agreed to take Narug's wallet, but only in exchange for a rare bottle of wine stored in the Brotherhood's pantry. " );
		HasimNeedRareWine = TRUE;
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Help_01_11 " );	// Hmmm ... (thoughtfully) Nothing, I guess.
		AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Help_01_12 " );	// Then why the hell are you bothering me?
		HasimPissOffGold = TRUE ;
		AI_StopProcessInfos(self);
	};
};

instance DIA_Ass_170_Adept_NarugGold_Again(C_Info)
{
	npc = Ass_170_Adept;
	no. = 2 ;
	condition = DIA_Ass_170_Adept_NarugGold_Again_Condition;
	information = DIA_Ass_170_Adept_NarugGold_Again_Info;
	permanent = FALSE ;
	description = " Would you like to drink some good wine? " ;
};

func int DIA_Ass_170_Adept_NarugGold_Again_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (HasimPissOffGold == TRUE) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1) && (Npc_HasItems(other,ItPo_AssasinsRareWine) >= 1) && (RhetorikSkillValue[1] > 0))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_NarugGold_Again_Info()
{
	B_GivePlayerXP(500);
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugGold_Again_01_01 " );	// Would you like to drink some good wine?
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Again_01_02 " );	// It depends on what. Everyone knows it's hard to get really good swill here.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Again_01_03");	//How do you like this "swill"?
	B_GiveInvItems(other,self,ItPo_AssasinsRareWine,1);
	Npc_RemoveInvItems(self,ItPo_AssasinsRareWine,1);
	CreateInvItems(self,ItPo_AssasinsRareWine_Use,2);
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Again_01_04 " );	// Hmmm ... interesting. Well, lemme try it.
	AI_UseItem(self,ItPo_AssasinsRareWine_Use);
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Again_01_05 " );	// Wow, this is great! I haven't had wine this good in years!
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Again_01_06 " );	// What do you want for this bottle?
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugGold_Again_01_07 " );	// It's yours, but I'll need a little favour.
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Again_01_08 " );	// Beliars Eyes, this again! Fine!
	AI_PlayAni(self,"T_SEARCH");
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Again_01_09 " );	// Give his wallet here. Just be quiet about it!
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Again_01_10");	//Thank you.
	B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Again_01_11 " );	// But look - not a word to anyone about this. Otherwise we will both be screwed.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Again_01_12");	//My lips are sealed.
	B_LogEntry (TOPIC_AssasinGold, " I gave Hasim a purse of Naruga's gold. I think now I should tell Osair that the gold for the batch of slaves was handed out. " );
	HasimNeedRareWineDone = TRUE;
};

instance DIA_Ass_170_Adept_NarugGold_Wine(C_Info)
{
	npc = Ass_170_Adept;
	no. = 2 ;
	condition = DIA_Ass_170_Adept_NarugGold_Wine_Condition;
	information = DIA_Ass_170_Adept_NarugGold_Wine_Info;
	permanent = FALSE ;
	description = " Here is your rare wine. " ;
};

func int DIA_Ass_170_Adept_NarugGold_Wine_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (HasimNeedRareWine == TRUE) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1) && (Npc_HasItems(other,ItPo_AssasinsRareWine) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_NarugGold_Wine_Info()
{
	B_GivePlayerXP(1000);
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugGold_Wine_01_01 " );	// Here's your rare wine.
	B_GiveInvItems(other,self,ItPo_AssasinsRareWine,1);
	Npc_RemoveInvItems(self,ItPo_AssasinsRareWine,1);
	CreateInvItems(self,ItPo_AssasinsRareWine_Use,2);
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Wine_01_02 " );	// Hmmm ... Okay! Let's see what you brought.
	AI_UseItem(self,ItPo_AssasinsRareWine_Use);
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Wine_01_03 " );	// Wow, this is great! I haven't had wine this good in years!
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugGold_Wine_01_04 " );	// What about Naruga's gold?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Wine_01_05 " );	// Give his wallet here. Just be quiet about it!
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Wine_01_06");	//Here it is.
	B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
	Npc_RemoveInvItems(self,ItMi_AssGoldPocket,1);
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugGold_Wine_01_07 " );	// But look, not a word to anyone about this! Otherwise we will both be in screwed.
	AI_Output(other,self,"DIA_Ass_170_Adept_NarugGold_Wine_01_08");	//My lips are sealed.
	B_LogEntry (TOPIC_AssasinGold, " I gave Hasim a purse of Naruga's gold. I think now I should tell Osair that the gold for the batch of slaves was handed out. " );
	HasimNeedRareWineDone = TRUE;
};

instance DIA_Ass_170_Adept_PICKPOCKET(C_Info)
{
	npc = Ass_170_Adept;
	NO = 900 ;
	condition = DIA_Ass_170_Adept_PICKPOCKET_Condition;
	information = DIA_Ass_170_Adept_PICKPOCKET_Info;
	permanent = TRUE;
	description = " (Try to steal his rosary) " ;
};

func int DIA_Ass_170_Adept_PICKPOCKET_Condition()
{
	if((self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE) && (MakeHasimKiller == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ass_170_Adept_PICKPOCKET);
	Info_AddChoice(DIA_Ass_170_Adept_PICKPOCKET,Dialog_Back,DIA_Ass_170_Adept_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ass_170_Adept_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ass_170_Adept_PICKPOCKET_DoIt);
};

func void DIA_Ass_170_Adept_PICKPOCKET_DoIt ()
{
	AI_PlayAni(other,"T_STEAL");
	AI_Wait(other,1);

	if((other.attribute[ATR_DEXTERITY] + PickPocketBonusCount) >= 50)
	{
		B_GivePlayerXP(300);
		B_GiveInvItems(self,other,ItMi_HasimAmuls,1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		Info_ClearChoices(DIA_Ass_170_Adept_PICKPOCKET);
	}
	else
	{
		PlayerIsPrioratFake = TRUE;
		AI_StopProcessInfos(self);
		B_Attack(self,other,AR_Theft,1);
	};
};

func void DIA_Ass_170_Adept_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ass_170_Adept_PICKPOCKET);
};

var int ExpLoseCount;

instance DIA_Ass_170_Adept_HasimKill(C_Info)
{
	npc = Ass_170_Adept;
	no. = 2 ;
	condition = DIA_Ass_170_Adept_HasimKill_Condition;
	information = DIA_Ass_170_Adept_HasimKill_Info;
	permanent = FALSE ;
	description = " I have one thing to do with you. " ;
};

func int DIA_Ass_170_Adept_HasimKill_Condition()
{
	if(MIS_HasimKill == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_HasimKill_Info()
{
	ExpLoseCount = TRUE;
	AI_Output (other, self, " DIA_Ass_170_Adept_HasimKill_01_01 " );	// I have business with you.
	AI_Output(self,other,"DIA_Ass_170_Adept_HasimKill_01_02");	//Yeah? What?
	Info_ClearChoices(DIA_Ass_170_Adept_HasimKill);
	Info_AddChoice (DIA_Ass_170_Adept_HasimKill, " Prior Osair wants to see you. " , DIA_Ass_170_Adept_Osair);
	Info_AddChoice (DIA_Ass_170_Adept_HasimKill, " Would you like to go hunting? " , DIA_Ass_170_Adept_Hunt);
	Info_AddChoice (DIA_Ass_170_Adept_HasimKill, " I found your friend Naruga. " , DIA_Ass_170_Adept_NarugFind);

	if(PW_GOLDSHAHT == TRUE)
	{
		Info_AddChoice (DIA_Ass_170_Adept_HasimKill, " Do you want to make a little profit? " , DIA_Ass_170_Adept_Gold);
	};
};

func void DIA_Ass_170_Adept_Osair()
{
	var int bonusexp;

	bonusexp = 1000 / ExpLoseCount;

	B_GivePlayerXP(bonusexp);
	AI_Output (other, self, " DIA_Ass_170_Adept_Osair_01_01 " );	// Prior Osair wants to see you.
	AI_Output (other, self, " DIA_Ass_170_Adept_Osair_01_02 " );	// He asked me to escort you to his cave as soon as possible.
	AI_Output (self, other, " DIA_Ass_170_Adept_Osair_01_03 " );	// (surprised) Osair? Hmmm. Previously, he never used novices to summon me.
	AI_Output (other, self, " DIA_Ass_170_Adept_Osair_01_04 " );	// I'm sure he did it for a reason.
	AI_Output (other, self, " DIA_Ass_170_Adept_Osair_01_05 " );	// I suppose you should hurry, then.
	AI_Output (self, other, " DIA_Ass_170_Adept_Osair_01_06 " );	// Lead on, novice.
	self.aivar [ AIV_PARTYMEMBER ] = TRUE ;
	HasimGoForKilled = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowHero");
};

func void DIA_Ass_170_Adept_Hunt()
{
	AI_Output (other, self, " DIA_Ass_170_Adept_Hunt_01_01 " );		// Would you like to go hunting?
	AI_Output (self, other, " DIA_Ass_170_Adept_Hunt_01_02 " );		// No. I'd rather stay here and enjoy the wonderful taste of this hookah.
	AI_Output (self, other, " DIA_Ass_170_Adept_Hunt_01_03 " );		// Some other time perhaps.
	AI_Output(other,self,"DIA_Ass_170_Adept_Hunt_01_04");		//I understand.
	ExpLoseCount = ExpLoseCount + 1;
};


func void DIA_Ass_170_Adept_NarugFind()
{
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugFind_01_01 " );	// I found your friend Naruga.
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugFind_01_02 " );	// Hmmm ... (indifferently) And where is the bum?
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugFind_01_03 " );	// Not far, in the forest. 
	AI_Output (other, self, " DIA_Ass_170_Adept_NarugFind_01_04 " );	// He seems to be up to something.
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugFind_01_05 " );	// Really? And what could that fool be up to?
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugFind_01_06 " );	// No, I think I'd rather stay here.
	AI_Output (self, other, " DIA_Ass_170_Adept_NarugFind_01_07 " );	// And if he needs something from me, let him drag his ass here.
	AI_Output(self,other,"DIA_Ass_170_Adept_NarugFind_01_08");	//Go tell him that.
	ExpLoseCount = ExpLoseCount + 1;
};

func void DIA_Ass_170_Adept_Gold()
{
	AI_Output (other, self, " DIA_Ass_170_Adept_Gold_01_01 " );		// Do you want to profit a little?
	AI_Output (self, other, " DIA_Ass_170_Adept_Gold_01_02 " );		// Hmmm ... And what are we talking about?
	AI_Output (other, self, " DIA_Ass_170_Adept_Gold_01_03 " );		// In one of the caves, I stumbled upon a large deposit of gold ore.
	AI_Output (other, self, " DIA_Ass_170_Adept_Gold_01_04 " );		// But I can't manage it alone.
	AI_Output (other, self, " DIA_Ass_170_Adept_Gold_01_05 " );		// So I thought: maybe you will be interested in a little mining partnership?
	AI_Output (self, other, " DIA_Ass_170_Adept_Gold_01_06 " );		// Hmmm ... Gold Ore? To tell the truth, I don’t think I’ll be interested in it.
	AI_Output (self, other, " DIA_Ass_170_Adept_Gold_01_07 " );		// I already have enough gold, and breaking my back in some mine does not appeal to me.
	AI_Output (self, other, " DIA_Ass_170_Adept_Gold_01_08 " );		// Of course, it would be possible to smuggle some slaves there.
	AI_Output (self, other, " DIA_Ass_170_Adept_Gold_01_09 " );		// But if the priors find out, we're dead men.
	AI_Output (self, other, " DIA_Ass_170_Adept_Gold_01_10 " );		// So I better stay here.
	AI_Output(other,self,"DIA_Ass_170_Adept_Gold_01_11");		//Too bad.
	ExpLoseCount = ExpLoseCount + 1;
};

instance DIA_Ass_170_Adept_ ARRIVED (C_Info)
{
	npc = Ass_170_Adept;
	NO = 55 ;
	condition = DIA_Ass_170_Adept_RECOME_Condition;
	information = DIA_Ass_170_Adept_ANGEKOMMEN_Info;
	important = TRUE;
};

func int DIA_Ass_170_Adept_ANGEKMMEN_Condition ()
{
	if((MIS_HasimKill == LOG_Running) && (HasimGoForKilled == TRUE) && (Npc_GetDistToWP(self,"PW_HASIM_DEAD") < 6000))
	{
		return TRUE;
	};
};

func void DIA_Ass_170_Adept_ANGEKOMMEN_Info ()
{
	AI_Output (self, other, " DIA_Ass_170_Adept_ANGEKOMMEN_01_00 " );	// Why did we stop?
	AI_Output (other, self, " DIA_Ass_170_Adept_ANGEKOMMEN_01_01 " );	// We've arrived at your final resting place.
	AI_Output (self, other, " DIA_Ass_170_Adept_ANGEKOMMEN_01_02 " );	// (surprised) What is the meaning of this?
	AI_Output (other, self, " DIA_Ass_170_Adept_ANGEKOMMEN_01_03 " );	// Unfortunately Prior Tiamant wants you dead. Nothing personal.
	AI_Output (self, other, " DIA_Ass_170_Adept_ANGEKOMMEN_01_04 " );	// What ?! So you just lured us here to kill us?
	AI_Output(other,self,"DIA_Ass_170_Adept_ANGEKOMMEN_01_05");	//Is it that obvious?
	AI_ReadyMeleeWeapon(self);
	AI_Output (self, other, " DIA_Ass_170_Adept_ANGEKOMMEN_01_06 " );	// (ominously) Well you can try it, dog!
	self.aivar [ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
	B_Attack(self,other,AR_KILL,1);
};
