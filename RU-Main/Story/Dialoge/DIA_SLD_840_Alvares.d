

instance DIA_Alvares_EXIT(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 999;
	condition = DIA_Alvares_EXIT_Condition;
	information = DIA_Alvares_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Alvares_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Alvares_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Alvares_HAUAB(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 4;
	condition = DIA_Alvares_HAUAB_Condition;
	information = DIA_Alvares_HAUAB_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alvares_HAUAB_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Alvares_HAUAB_Info()
{
	Akils_SLDStillthere = TRUE;
	AI_Output(self,other, " DIA_Alvares_HAUAB_11_00 " );	// Whatever brings you here, you better forget about it and get out of here.
	Log_CreateTopic(TOPIC_AkilsSLDStillthere,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere,LOG_Running);
	B_LogEntry(TOPIC_AkilsSLDStillthere, " Farmer Akils is threatened by mercenaries. " );
	AI_StopProcessInfos(self);
};


instance DIA_Alvares_ATTACK(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 6;
	condition = DIA_Alvares_ATTACK_Condition;
	information = DIA_Alvares_ATTACK_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alvares_ATTACK_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Alvares_HAUAB) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Alvares_ATTACK_Info()
{
	AI_Output(self,other, " DIA_Alvares_ATTACK_11_00 " );	// Hey, you're still here. I'll give you a choice, stranger - get lost or die!
	Info_ClearChoices(DIA_Alvares_ATTACK);
	Info_AddChoice(DIA_Alvares_ATTACK, " Who are you guys a pair of clowns? " ,DIA_Alvares_ATTACK_Kerle);
	Info_AddChoice(DIA_Alvares_ATTACK, " I want to join you mercenaries. " ,DIA_Alvares_ATTACK_Soeldner);
	Info_AddChoice(DIA_Alvares_ATTACK, " You guys are out of here now! " ,DIA_Alvares_ATTACK_Witz);
	Info_AddChoice(DIA_Alvares_ATTACK, " I don't want trouble. " ,DIA_Alvares_ATTACK_Aerger);

	if(MIS_Baltram_ScoutAkil == LOG_Running)
	{
		Info_AddChoice(DIA_Alvares_ATTACK, " I just came here for some goods. " ,DIA_Alvares_ATTACK_Lieferung);
	};
};

func void DIA_Alvares_ATTACK_Witz()
{
	AI_Output(other,self, " DIA_Alvares_ATTACK_Witz_15_00 " );	// You guys are going to disappear from here. All clear?
	AI_Output(self,other, " DIA_Alvares_ATTACK_Witz_11_01 " );	// Look, a new hero has shown up - and a very stupid hero.
	AI_Output(self,other, " DIA_Alvares_ATTACK_Witz_11_02 " );	// Do you know what I'm thinking?
	AI_Output(other,self, " DIA_Alvares_ATTACK_Witz_15_03 " );	// Who cares what you think?
	AI_Output(self,other, " DIA_Alvares_ATTACK_Witz_11_04 " );	// I think a good hero is a dead hero. So do me a favor - die quickly!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void DIA_Alvares_ATTACK_Kerle()
{
	AI_Output(other,self, " DIA_Alvares_ATTACK_Kerle_15_00 " );	// Who are you guys - a pair of clowns?
	AI_Output(self,other, " DIA_Alvares_ATTACK_Kerle_11_01 " );	// You got it right. And I will keep laughing as your corpse lies in the road dust.
	AI_Output(self,other, " DIA_Alvares_ATTACK_Kerle_11_02 " );	// (calling) Engardo, let's get started! You take on the farmer - and I'll deal with this clown!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};

func void DIA_Alvares_ATTACK_Aerger()
{
	AI_Output(other,self, " DIA_Alvares_ATTACK_Aerger_15_00 " );	// I don't want problems.
	AI_Output(self,other, " DIA_Alvares_ATTACK_Aerger_11_01 " );	// And we're just looking for problems. We have come a long way to find them.
	AI_Output(self,other, " DIA_Alvares_ATTACK_Aerger_11_02 " );	// Yes, we're going to create a whole bunch of problems. And I'll start with you, if you don't get out of here right now.
	AI_StopProcessInfos(self);
};

func void DIA_Alvares_ATTACK_Delivery()
{
	AI_Output(other,self, " DIA_Alvares_ATTACK_Lieferung_15_00 " );	// I just came here for the goods.
	AI_Output(self,other, " DIA_Alvares_ATTACK_Lieferung_11_01 " );	// So do we. But we were here first. So get out before I hurt you.
	AI_StopProcessInfos(self);
};

func void DIA_Alvares_ATTACK_Soeldner()
{
	AI_Output(other,self, " DIA_Alvares_ATTACK_Soeldner_15_00 " );	// I want to join you mercenaries.
	AI_Output(self,other, " DIA_Alvares_ATTACK_Soeldner_11_01 " );	// Oh, really? Get out then, or you'll never be able to join anyone again.
	AI_StopProcessInfos(self);
};


instance DIA_Alvares_Schloss (C_Info)
{
	npc = SLD_840_Alvares;
	nr = 4;
	condition = DIA_Alvares_Schluss_Condition;
	information = DIA_Alvares_Schluss_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Alvares_Final_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && Npc_KnowsInfo(other,DIA_Alvares_ATTACK))
	{
		return TRUE;
	};
};

func void DIA_Alvares_Schluss_Info()
{
	AI_Output(self,other, " DIA_Alvares_Schluss_11_00 " );	// I gave you a chance. But you don't seem to be listening to common sense.
	AI_Output(self,other, " DIA_Alvares_Schluss_11_01 " );	// Okay, so I'll have to kill you. (calling) Engardo, let's finish them off!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
};


instance DIA_Alvares_PICKPOCKET(C_Info)
{
	npc = SLD_840_Alvares;
	nr = 900;
	condition = DIA_Alvares_PICKPOCKET_Condition;
	information = DIA_Alvares_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Alvares_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 15 );
};

func void DIA_Alvares_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
	Info_AddChoice(DIA_Alvares_PICKPOCKET,Dialog_Back,DIA_Alvares_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Alvares_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Alvares_PICKPOCKET_DoIt);
};

func void DIA_Alvares_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
};

func void DIA_Alvares_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Alvares_PICKPOCKET);
};

// --------------------------------Harim-------------- ----------------------------

instance DIA_Kharim_EXIT(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 999;
	condition = DIA_Kharim_EXIT_Condition;
	information = DIA_Kharim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Kharim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kharim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Kharim_PICKPOCKET (C_Info)
{
	npc = SLD_850_Kharim;
	nr = 900;
	condition = DIA_Kharim_PICKPOCKET_Condition;
	information = DIA_Kharim_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Kharim_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 15 );
};

func void DIA_Kharim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kharim_PICKPOCKET);
	Info_AddChoice(DIA_Kharim_PICKPOCKET, Dialog_Back, DIA_Kharim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kharim_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Kharim_PICKPOCKET_DoIt);
};

func void DIA_Kharim_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Kharim_PICKPOCKET);
};

func void DIA_Kharim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kharim_PICKPOCKET);
};

instance DIA_Kharim_Hello (C_Info)
{
	npc = SLD_850_Kharim;
	nr = 1;
	condition = DIA_Kharim_Hello_Condition;
	information = DIA_Kharim_Hello_Info;
	permanent = FALSE;
	description = " Good to see you, Harim! " ;
};

func int DIA_Kharim_Hello_Condition()
{
	return TRUE;
};

func void DIA_Kharim_Hello_Info()
{
	AI_Output(other,self, " DIA_Kharim_Hello_01_00 " );	// Good to see you, Harim!
	AI_Output(self,other, " DIA_Kharim_Hello_01_01 " );	// What? Who are you?
	AI_Output(other,self, " DIA_Kharim_Hello_01_02 " );	// Remember Scutty's arena! I spent a couple of fights there, including with you.
	AI_Output(self,other, " DIA_Kharim_Hello_01_03 " );	// (incredulously) A lot of people fought in the arena. Do you remember everyone?
	AI_Output(self,other, " DIA_Kharim_Hello_01_04 " );	// Better remind me - how could you challenge me to a fight then?
	Info_ClearChoices(DIA_Kharim_Hello);
	Info_AddChoice(DIA_Kharim_Hello, " I said you kissed Gomez's ass. " ,DIA_Kharim_Hello_Ok);
	Info_AddChoice(DIA_Kharim_Hello, " I called you a coward! " ,DIA_Kharim_Hello_NoTwo);
	Info_AddChoice(DIA_Kharim_Hello, " I just challenged you to a fight. " ,DIA_Kharim_Hello_NoOne);
	Info_AddChoice(DIA_Kharim_Hello, " I said your face was terrible! " ,DIA_Kharim_Hello_NoThree);
	Info_AddChoice(DIA_Kharim_Hello, " I said something about your hands. " ,DIA_Kharim_Hello_NoFour);
};

func void DIA_Kharim_Hello_NoTwo()
{
	AI_Output(other,self, " DIA_Kharim_Hello_NoTwo_01_00 " );	// I called you a coward!
	AI_Output(self,other, " DIA_Kharim_Hello_NoTwo_01_01 " );	// I don't remember something like that...
	AI_Output(self,other, " DIA_Kharim_Hello_NoTwo_01_02 " );	// You must be wrong, mate.
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kharim_Hello_NoOne()
{
	AI_Output(other,self, " DIA_Kharim_Hello_NoOne_01_00 " );	// I just challenged you to a fight.
	AI_Output(self,other, " DIA_Kharim_Hello_NoOne_01_01 " );	// Hmmm... I don't think it was.
	AI_Output(self,other, " DIA_Kharim_Hello_NoOne_01_02 " );	// Most likely, you were a simple miner who saw my fights.
	AI_Output(self,other, " DIA_Kharim_Hello_NoOne_01_03 " );	// So we hardly know each other. Sorry!
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kharim_Hello_NoThree()
{
	AI_Output(other,self, " DIA_Kharim_Hello_NoThree_01_00 " );	// I said your face is terrible!
	AI_Output(self,other, " DIA_Kharim_Hello_NoThree_01_01 " );	// (thoughtfully) I remember something, but not quite.
	AI_Output(self,other, " DIA_Kharim_Hello_NoThree_01_02 " );	// Looks like you got it wrong, mate.
	AI_Output(self,other, " DIA_Kharim_Hello_NoThree_01_03 " );	// We hardly know each other. Sorry!
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kharim_Hello_NoFour()
{
	AI_Output(other,self, " DIA_Kharim_Hello_NoFour_01_00 " );	// I said something about your hands.
	AI_Output(self,other, " DIA_Kharim_Hello_NoFour_01_01 " );	// (thoughtfully) I don't remember anything like that.
	AI_Output(self,other, " DIA_Kharim_Hello_NoFour_01_02 " );	// Looks like you got it wrong, mate.
	AI_Output(self,other, " DIA_Kharim_Hello_NoFour_01_03 " );	// We hardly know each other. Sorry!
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Kharim_Hello_Ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Kharim_Hello_Ok_01_00 " );	// I said you were kissing Gomez's ass.
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other, " DIA_Kharim_Hello_Ok_01_01 " );	// What?! Well, repeat!
	AI_Output(other,self, " DIA_Kharim_Hello_Ok_01_02 " );	// Judging by your reaction, you no longer have doubts about our acquaintance.
	AI_Output(self,other, " DIA_Kharim_Hello_Ok_01_03 " );	// Oh yes... (smirking) Now I remember you too!
	AI_RemoveWeapon(self);
	AI_Output(other,self, " DIA_Kharim_Hello_Ok_01_04 " );	// And that fight judged us.
	AI_Output(self,other, " DIA_Kharim_Hello_Ok_01_05 " );	// Of course. And as it always happens, the one who gnaws the earth was wrong.
	AI_Output(self,other, " DIA_Kharim_Hello_Ok_01_06 " );	// Okay! Whoever remembers the old is out of sight ...
	AI_Output(self,other, " DIA_Kharim_Hello_Ok_01_07 " );	// (smiling) And by the way - nice to see you too, mate!
	Info_ClearChoices(DIA_Kharim_Hello);
};

instance DIA_Kharim_HAUAB (C_Info)
{
	npc = SLD_850_Kharim;
	nr = 4;
	condition = DIA_Kharim_HAUAB_Condition;
	information = DIA_Kharim_HAUAB_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_Kharim_HAUAB_Condition()
{
	if((Npc_IsInState(self,ZS_Talk)) && (KharimPissOff == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Kharim_HAUAB_Info()
{
	AI_Output(self,other, " DIA_Kharim_HAUAB_01_00 " );	// (angrily) Hey, back off...
	KharimPissOff = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_Kharim_Escape (C_Info)
{
	npc = SLD_850_Kharim;
	nr = 1;
	condition = DIA_Kharim_Escape_Condition;
	information = DIA_Kharim_Escape_Info;
	permanent = FALSE;
	description = " How did you get out of the Old Camp? " ;
};

func int DIA_Kharim_Escape_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Kharim_Hello ) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Kharim_Escape_Info()
{
	AI_Output(other,self, " DIA_Kharim_Escape_01_00 " );	// How did you manage to get out of the Old Camp?
	AI_Output(self,other, " DIA_Kharim_Escape_01_01 " );	// Scutty somehow found out what Gomez was up to and managed to warn Gor Hanis and me of the danger.
	AI_Output(self,other, " DIA_Kharim_Escape_01_02 " );	// I miraculously escaped the castle gates! One of the guards even managed to shoot me in the back with a crossbow.
	AI_Output(self,other, " DIA_Kharim_Escape_01_03 " );	// But apparently, a strong hangover did not give him the opportunity to aim more accurately.
};

DIA_Kharim_Cup instance (C_Info)
{
	npc = SLD_850_Kharim;
	nr = 1;
	condition = DIA_Kharim_Cup_Condition;
	information = DIA_Kharim_Cup_Info;
	permanent = FALSE;
	description = " You remember this with some annoyance. " ;
};

func int DIA_Kharim_Cup_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Kharim_Escape ) ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Kharim_Cup_Info()
{
	AI_Output(other,self, " DIA_Kharim_Cup_01_00 " );	// You remember this with some annoyance.
	AI_Output(self,other, " DIA_Kharim_Cup_01_01 " );	// Eh... It's all about my golden goblet.
	AI_Output(self,other, " DIA_Kharim_Cup_01_02 " );	// I was running away from the Old Camp so fast that I forgot about it.
	AI_Output(other,self, " DIA_Kharim_Cup_01_03 " );	// What is this cup?
	AI_Output(self,other, " DIA_Kharim_Cup_01_04 " );	// This is an award as the strongest fighter in the arena!
	AI_Output(self,other, " DIA_Kharim_Cup_01_05 " );	// Even though it came from the hands of Gomez himself, I kept it as the most precious thing for me.
	AI_Output(self,other, " DIA_Kharim_Cup_01_06 " );	// He reminded me of my past victories.
	AI_Output(self,other, " DIA_Kharim_Cup_01_07 " );	// In addition, this goblet is made of solid gold, and would be worth a lot of money here.
	AI_Output(other,self, " DIA_Kharim_Cup_01_08 " );	// Why don't you go there yourself and pick him up?
	AI_Output(self,other, " DIA_Kharim_Cup_01_09 " );	// I'm not sure if it's still there. Still, the little thing is expensive, and anyone would covet it.
	AI_Output(self,other, " DIA_Kharim_Cup_01_10 " );	// In addition, the passage to the Valley of Mines is guarded by paladins, and Lee ordered us to guard this farm.
	AI_Output(self,other, " DIA_Kharim_Cup_01_11 " );	// So I can't get out of here.
	AI_Output(self,other, " DIA_Kharim_Cup_01_12 " );	// Now, if someone helped me with this, I would thank him with all my heart!
	MIS_KharimCup = LOG_Running;
	Log_CreateTopic(TOPIC_KharimCup,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KharimCup,LOG_Running);
	B_LogEntry(TOPIC_KharimCup, " Kharim forgot his golden cup in the Old Camp. It was the symbol of the arena champion given to him personally by Gomez. Kharim would not mind returning it. " );
};

instance DIA_Kharim_Cup_Done(C_Info)
{
	npc = SLD_850_Kharim;
	nr = 1;
	condition = DIA_Kharim_Cup_Done_Condition;
	information = DIA_Kharim_Cup_Done_Info;
	permanent = FALSE;
	description = " I think I found your goblet. " ;
};

func int DIA_Kharim_Cup_Done_Condition()
{
	if ((MIS_KharimCup == LOG_Running) && (Npc_HasItems(other,ItMi_HarimCup) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_Kharim_Cup_Done_Info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_Kharim_Cup_Done_01_00 " );	// I think I found your goblet.
	AI_Output(self,other, " DIA_Kharim_Cup_Done_01_01 " );	// Come on, let me take a look at it...
	B_GiveInvItems(other,self,ItMi_HarimCup,1);
	Npc_RemoveInvItems(self,ItMi_HarimCup,1);
	AI_Output(self,other, " DIA_Kharim_Cup_Done_01_02 " );	// Hell yeah, it's him! I will never forget that fight when I got it.
	AI_Output(other,self, " DIA_Kharim_Cup_Done_01_03 " );	// Are you happy now?
	AI_Output(self,other, " DIA_Kharim_Cup_Done_01_04 " );	// Not the right word, mate. That's all I needed to be happy!
	AI_Output(other,self, " DIA_Kharim_Cup_Done_01_05 " );	// What about the promised reward?
	AI_Output(self,other, " DIA_Kharim_Cup_Done_01_06 " );	// Of course! Here, take this ore ingot.
	B_GiveInvItems(self,other,ItMi_OreStuck,1);
	AI_Output(self,other, " DIA_Kharim_Cup_Done_01_07 " );	// Bennet made it for me from the leftover magical ore I brought back from the colony.
	AI_Output(self,other, " DIA_Kharim_Cup_Done_01_08 " );	// And who knows, maybe it will be more valuable to you than gold.
	MIS_KharimCup = LOG_Success;
	Log_SetTopicStatus(TOPIC_KharimCup,LOG_Success);
	B_LogEntry(TOPIC_KharimCup, " Kharim was happy to have his cup back. " );
};

// --------------------------------Rosco--------------- ----------------------------

instance DIA_Roscoe_EXIT(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 999;
	condition = DIA_Roscoe_EXIT_Condition;
	information = DIA_Roscoe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Roscoe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Roscoe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Roscoe_PICKPOCKET(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 900;
	condition = DIA_Roscoe_PICKPOCKET_Condition;
	information = DIA_Roscoe_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Roscoe_PICKPOCKET_Condition()
{
	return  C_Robbery ( 20 , 15 );
};

func void DIA_Roscoe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Roscoe_PICKPOCKET);
	Info_AddChoice(DIA_Roscoe_PICKPOCKET,Dialog_Back,DIA_Roscoe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Roscoe_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Roscoe_PICKPOCKET_DoIt);
};

func void DIA_Roscoe_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Roscoe_PICKPOCKET);
};

func void DIA_Roscoe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Roscoe_PICKPOCKET);
};

instance DIA_Roscoe_HAUAB(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 4;
	condition = DIA_Roscoe_HAUAB_Condition;
	information = DIA_Roscoe_HAUAB_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Roscoe_HAUAB_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Roscoe_HAUAB_Info()
{
	AI_Output(self,other, " DIA_Roscoe_HAUAB_01_00 " );	// (angrily) What?
};

instance DIA_Roscoe_Hello(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_Hello_Condition;
	information = DIA_Roscoe_Hello_Info;
	permanent = FALSE;
	description = " Hey! How are you Roscoe? " ;
};

func int DIA_Roscoe_Hello_Condition()
{
	return TRUE;
};

func void DIA_Roscoe_Hello_Info()
{
	AI_Output(other,self, " DIA_Roscoe_Hello_01_00 " );	// Hey! How are you, Roscoe?
	AI_Output(self,other, " DIA_Roscoe_Hello_01_01 " );	// (incredulously) Are we really familiar?
	AI_Output(other,self, " DIA_Roscoe_Hello_01_02 " );	// You have a short memory, I see.
	AI_Output(self,other, " DIA_Roscoe_Hello_01_03 " );	// Oh, yes... (looking) Now I seem to remember you.
	AI_Output(self,other, " DIA_Roscoe_Hello_01_04 " );	// You're the guy who insisted on Lares's audience at the New Camp.
	AI_Output(other,self, " DIA_Roscoe_Hello_01_05 " );	// Still working for him?
	AI_Output(self,other, " DIA_Roscoe_Hello_01_06 " );	// Of course! I was his bodyguard in the colony, and we always got along well.
	AI_Output(self,other, " DIA_Roscoe_Hello_01_07 " );	// And besides, it's very profitable to deal with Lares. He always knows more than he says.
};

instance DIA_Roscoe_WhatDo(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_WhatDo_Condition;
	information = DIA_Roscoe_WhatDo_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};

func int DIA_Roscoe_WhatDo_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Roscoe_Hello) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Roscoe_WhatDo_Info()
{
	AI_Output(other,self, " DIA_Roscoe_WhatDo_01_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Roscoe_WhatDo_01_01 " );	// Yes, so... (hesitantly) Watching everything that happens around.
	AI_Output(other,self,"DIA_Roscoe_WhatDo_01_02");	//Зачем?
	AI_Output(self,other, " DIA_Roscoe_WhatDo_01_03 " );	// (grinning) Buddy, all the roads leading to the Valley of Mines and into the very depths of the island pass right there.
	AI_Output(self,other, " DIA_Roscoe_WhatDo_01_04 " );	// From here you can easily track the paladins and the city militia if they suddenly appear here.
	AI_Output(self,other, " DIA_Roscoe_WhatDo_01_05 " );	// In addition, Lares sometimes gives me useful information for Lee through a local bartender.
	AI_Output(other,self,"DIA_Roscoe_WhatDo_01_06");	//Понимаю.
};

instance DIA_Roscoe_News(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_News_Condition;
	information = DIA_Roscoe_News_Info;
	permanent = TRUE;
	description = " How are things? " ;
};

func int DIA_Roscoe_News_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Roscoe_WhatDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Roscoe_News_Info()
{
	AI_Output(other,self, " DIA_Roscoe_News_01_00 " );	// How are things?

 	if (chapter <  3 )
	{
		AI_Output(self,other, " DIA_Roscoe_News_01_01 " );	// Everything's under control, mate.
	}
	else if(MIS_RoscoeMage == FALSE)
	{
		AI_Output(self,other, " DIA_Roscoe_News_01_02 " );	// Not really. These strange creatures in black robes are constantly scurrying around.
		AI_Output(self,other, " DIA_Roscoe_News_01_03 " );	// They're obviously looking for someone. I just can't figure out who!
		AI_Output(other,self, " DIA_Roscoe_News_01_04 " );	// And many of them passed here?
		AI_Output(self,other, " DIA_Roscoe_News_01_05 " );	// I've only seen one. (nervously) It seems he was walking towards the old cemetery, which is not far away, in the forest.
		AI_Output(self,other, " DIA_Roscoe_News_01_06 " );	// Now I try to stay away from that place.
		AI_Output(self,other, " DIA_Roscoe_News_01_07 " );	// I get goosebumps from these people! If it is, of course, people.
		MIS_RoscoeMage = LOG_Running;
		Log_CreateTopic(TOPIC_RoscoeMage,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_RoscoeMage,LOG_Running);
		B_LogEntry(TOPIC_RoscoeMage, " Roscoe is frightened by the appearance of people in black robes. According to him, one of them went towards the old cemetery in the forest. " );
		AI_StopProcessInfos(self);
		Wld_InsertNpc(DMT_1812_Dementor,"NW_FARM2_TO_TAVERN_09_MONSTER4");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_04");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_03");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_02");
		Wld_InsertNpc(SKELETON_DARK,"FP_ROAM_NW_FARM2_TO_TAVERN_09_MONSTER4_01");
	}
	else
	{
		AI_Output(self,other, " DIA_Roscoe_News_01_09 " );	// I've been better, mate.
	};
};

instance DIA_Roscoe_RoscoeMage(C_Info)
{
	npc = SLD_851_Roscoe;
	nr = 1;
	condition = DIA_Roscoe_RoscoeMage_Condition;
	information = DIA_Roscoe_RoscoeMage_Info;
	permanent = FALSE;
	description = " I killed that mage. " ;
};

func int DIA_Roscoe_RoscoeMage_Condition()
{
	if((MIS_RoscoeMage == LOG_Running) && (RoscoeDMTIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Roscoe_RoscoeMage_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Roscoe_RoscoeMage_01_01 " );	// I killed that mage.
	AI_Output(self,other, " DIA_Roscoe_RoscoeMage_01_02 " );	// Good. There he is dear!
	AI_Output(self,other, " DIA_Roscoe_RoscoeMage_01_03 " );	// And I will be much calmer from this thought.
	AI_Output(self,other, " DIA_Roscoe_RoscoeMage_01_04 " );	// Here, take this for your work.
	B_GiveInvItems(self,other,ItMi_Gold,350);
	AI_Output(other,self,"DIA_Roscoe_RoscoeMage_01_05");	//Спасибо.
	MIS_RoscoeMage = LOG_Success;
	Log_SetTopicStatus(TOPIC_RoscoeMage,LOG_Success);
	B_LogEntry(TOPIC_RoscoeMage, " Roscoe breathed a sigh of relief that the dark mage is dead. " );
};
