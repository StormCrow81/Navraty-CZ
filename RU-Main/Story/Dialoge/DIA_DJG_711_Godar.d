
instance DIA_Godar_EXIT(C_Info)
{
	npc = DJG_711_Godar;
	nr = 999;
	condition = DIA_Godar_EXIT_Condition;
	information = DIA_Godar_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Godar_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Godar_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Godar_Hello(C_Info)
{
	npc = DJG_711_Godar;
	nr = 4;
	condition = DIA_Godar_Hello_Condition;
	information = DIA_Godar_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Godar_Hello_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Godar_Hello_Info()
{
	AI_Output(self,other,"DIA_Godar_Hello_13_00");	//Э-э? Что?
};


instance DIA_Godar_ComeFrom(C_Info)
{
	npc = DJG_711_Godar;
	nr = 4;
	condition = DIA_Godar_ComeFrom_Condition;
	information = DIA_Godar_ComeFrom_Info;
	permanent = FALSE;
	description = " Where are you from? " ;
};


func int DIA_Godar_ComeFrom_Condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Godar_ComeFrom_Info()
{
	AI_Output(other,self, " DIA_Godar_ComeFrom_15_00 " );	// Where are you from?
	AI_Output(self,other, " DIA_Godar_ComeFrom_13_01 " );	// We came from... er, from the city.
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom,"Вы - бандиты!",DIA_Godar_ComeFrom_Bandits);
	Info_AddChoice(DIA_Godar_ComeFrom, " Why have I never seen you in town? " ,DIA_Godar_ComeFrom_NotCity);
	Info_AddChoice(DIA_Godar_ComeFrom, " So-so. So from the city. " ,DIA_Godar_ComeFrom_Understand);
};

func void DIA_Godar_ComeFrom_Bandits()
{
	AI_Output(other,self, " DIA_Godar_ComeFrom_Bandits_15_00 " );	// You bandits!
	AI_Output(self,other, " DIA_Godar_ComeFrom_Bandits_13_01 " );	// Be careful! Your tongue won't do you any good!
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom, " Relax. I won't turn you in. " ,DIA_Godar_ComeFrom_Bandits_KeepCalm);
	Info_AddChoice(DIA_Godar_ComeFrom, " You don't scare me. " ,DIA_Godar_ComeFrom_Bandits_NoFear);
};

func void DIA_Godar_ComeFrom_Bandits_KeepCalm()
{
	AI_Output(other,self, " DIA_Godar_ComeFrom_Bandits_KeepCalm_15_00 " );	// Relax. I won't give you up.
	AI_Output(self,other, " DIA_Godar_ComeFrom_Bandits_KeepCalm_13_01 " );	// I hope. This is for your own good. And don't blow your head off!
	Info_ClearChoices(DIA_Godar_ComeFrom);
};

func void DIA_Godar_ComeFrom_Bandits_NoFear()
{
	AI_Output(other,self, " DIA_Godar_ComeFrom_Bandits_NoFear_15_00 " );	// You don't scare me.
	AI_Output(self,other, " DIA_Godar_ComeFrom_Bandits_NoFear_13_01 " );	// Well, we'll see about that later.
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Godar_ComeFrom_NotCity()
{
	AI_Output(other,self, " DIA_Godar_ComeFrom_NotCity_15_00 " );	// I didn't see you in the city.
	AI_Output(self,other, " DIA_Godar_ComeFrom_NotCity_13_01 " );	// I can't stand people who poke their noses into other people's business. Understood?
	Info_ClearChoices(DIA_Godar_ComeFrom);
	Info_AddChoice(DIA_Godar_ComeFrom,"Неа.",DIA_Godar_ComeFrom_NotCity_CutThroat);
	Info_AddChoice(DIA_Godar_ComeFrom, " I see, you're from the city. " ,DIA_Godar_ComeFrom_NotCity_Forget);
};

func void DIA_Godar_ComeFrom_NotCity_Forget()
{
	AI_Output(other,self, " DIA_Godar_ComeFrom_NotCity_Forget_15_00 " );	// Got it. You have come from the city.
	AI_Output(self,other,"DIA_Godar_ComeFrom_NotCity_Forget_13_01");	//Именно.
	Info_ClearChoices(DIA_Godar_ComeFrom);
};

func void DIA_Godar_ComeFrom_NotCity_CutThroat()
{
	AI_Output(other,self,"DIA_Godar_ComeFrom_NotCity_CutThroat_15_00");	//Нет.
	AI_Output(self,other, " DIA_Godar_ComeFrom_NotCity_CutThroat_13_01 " );	// Then I'll have to explain it in detail...
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Godar_ComeFrom_Understand()
{
	AI_Output(other,self, " DIA_Godar_ComeFrom_Understand_15_00 " );	// Got it. You are from the city.
	AI_Output(self,other, " DIA_Godar_ComeFrom_Understand_13_01 " );	// See! You understand everything!
	AI_Output(self,other, " DIA_Godar_ComeFrom_Understand_13_02 " );	// Here, take a sip!
	CreateInvItems(self,ItFo_Beer,1);
	B_GiveInvItems(self,other,ItFo_Beer,1);
	B_UseItem(other,ItFo_Beer);
	Info_ClearChoices(DIA_Godar_ComeFrom);
};


instance DIA_Godar_Plan(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Plan_Condition;
	information = DIA_Godar_Plan_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Godar_Plan_Condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Godar_Plan_Info()
{
	AI_Output(other,self, " DIA_Godar_Plan_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Godar_Plan_13_01 " );	// We've heard about dragon hunting. Well... We packed our belongings and came here.
	AI_Output(self,other, " DIA_Godar_Plan_13_02 " );	// But frankly, I don't care about dragons. I need gold.
	AI_Output(self,other, " DIA_Godar_Plan_13_03 " );	// Dragons have gold, don't they?
	AI_Output(other,self,"DIA_Godar_Plan_15_04");	//Конечно.
};


instance DIA_Godar_DragonLore(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_DragonLore_Condition;
	information = DIA_Godar_DragonLore_Info;
	permanent = FALSE;
	description = " What do you know about dragons? " ;
};


func int DIA_Godar_DragonLore_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Godar_Plan ) && ( CAPITALORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Godar_DragonLore_Info()
{
	AI_Output(other,self, " DIA_Godar_DragonLore_15_00 " );	// What do you know about dragons?
	AI_Output(self,other, " DIA_Godar_DragonLore_13_01 " );	// I only know about them from children's fairy tales.
	AI_Output(self,other, " DIA_Godar_DragonLore_13_02 " );	// You know, virgins, gold, fiery breath and all that.
};


instance DIA_Godar_Destination(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Destination_Condition;
	information = DIA_Godar_Destination_Info;
	permanent = FALSE;
	description = " Where are you going to go from here? " ;
};


func int DIA_Godar_Destination_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Godar_Plan ) && ( CAPITALORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Godar_Destination_Info()
{
	AI_Output(other,self, " DIA_Godar_Destination_15_00 " );	// Where are you going to go from here?
	AI_Output(self,other, " DIA_Godar_Destination_13_01 " );	// I have no idea. We are still thinking about it.
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL))
	{
		AI_Output(other,self, " DIA_Godar_Destination_15_02 " );	// You could go to the castle.
		AI_Output(self,other, " DIA_Godar_Destination_13_03 " );	// You can't drag me there by force. No. Just not for paladins.
		AI_Output(self,other, " DIA_Godar_Destination_13_04 " );	// I don't want to go back to jail. I've been there before and that's enough for me.
	};
};


instance DIA_Godar_Orks(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Orks_Condition;
	information = DIA_Godar_Orks_Info;
	permanent = FALSE;
	description = " What about orcs? " ;
};


func int DIA_Godar_Orks_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Godar_Destination ) && ( CAPITALORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Godar_Orks_Info()
{
	AI_Output(other,self, " DIA_Godar_Orks_15_00 " );	// What about orcs?
	AI_Output(self,other, " DIA_Godar_Orks_13_01 " );	// The whole castle is surrounded by them.
	AI_Output(self,other, " DIA_Godar_Orks_13_02 " );	// Trying to get in there is pure madness. If you want to fight the orcs, then you can immediately consider yourself a corpse.
	AI_Output(self,other, " DIA_Godar_Orks_13_03 " );	// No one can get in there.
	AI_Output(other,self, " DIA_Godar_Orks_15_04 " );	// Ah, indeed.
};


instance DIA_Godar_Prison(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Prison_Condition;
	information = DIA_Godar_Prison_Info;
	permanent = FALSE;
	description = " What were you sitting for? " ;
};


func int DIA_Godar_Prison_Condition()
{
	if (( CAPITELORCATC  ==  FALSE ) && Npc_KnowsInfo(other,DIA_Godar_Destination) && ((hero.guild !=  GIL_MIL ) && (hero.guild !=  GIL_PAL )))
	{
		return TRUE;
	};
};

func void DIA_Godar_Prison_Info()
{
	AI_Output(other,self, " DIA_Godar_Prison_15_00 " );	// What were you sitting for?
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other, " DIA_Godar_Prison_13_01 " );	// That's what I told you! Ha!
		AI_Output(self,other, " DIA_Godar_Prison_13_02 " );	// You mages are in league with the paladins. No, buddy. Forget it.
	}
	else
	{
		AI_Output(self,other, " DIA_Godar_Prison_13_03 " );	// These pigs caught me poaching. For two miserable hares!
		AI_Output(self,other, " DIA_Godar_Prison_13_04 " );	// I got 10 years for this!
		AI_Output(other,self, " DIA_Godar_Prison_15_05 " );	// Is that all?
		AI_Output(self,other, " DIA_Godar_Prison_13_06 " );	// Well... Of course I was defending myself...
		AI_Output(other,self,"DIA_Godar_Prison_15_07");	//И?
		AI_Output(self,other, " DIA_Godar_Prison_13_08 " );	// I have nothing to do with it. This guy slipped and broke his neck. Honestly!
		Info_ClearChoices(DIA_Godar_Prison);
		Info_AddChoice(DIA_Godar_Prison, " Знакомые слова. " ,DIA_Godar_Prison_Court);
		Info_AddChoice(DIA_Godar_Prison, " You shouldn't have gotten caught. " ,DIA_Godar_Prison_Pissoff);
	};
};

func void DIA_Godar_Prison_Court()
{
	AI_Output(other,self, " DIA_Godar_Prison_Court_15_00 " );	// Familiar story.
	AI_Output(self,other, " DIA_Godar_Prison_Court_13_01 " );	// Do you understand me? These arrogant rich people have no idea how hard it is for us.
	AI_Output(self,other, " DIA_Godar_Prison_Court_13_02 " );	// Well, at least they don't care.
	Info_ClearChoices(DIA_Godar_Prison);
	GodarLikesYou = TRUE;
};

func void DIA_Godar_Prison_Pissoff()
{
	AI_Output(other,self, " DIA_Godar_Prison_Pissoff_15_00 " );	// You shouldn't have gotten caught.
	AI_Output(self,other, " DIA_Godar_Prison_Pissoff_13_01 " );	// (angrily) I bet you've never been to jail, have you?
	AI_Output(self,other, " DIA_Godar_Prison_Pissoff_13_02 " );	// Now I'll show you what can happen to a man in prison!
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};


instance DIA_Godar_Hunting(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Hunting_Condition;
	information = DIA_Godar_Hunting_Info;
	permanent = FALSE;
	description = " Can you teach me how to hunt? " ;
};


func int DIA_Godar_Hunting_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Godar_Prison ) && ( ( hero . guild !=  GIL_MIL ) && ( hero . guild !=  GIL_PAL ) && ( hero . guild != GIL_KDF ) && ( hero . guild != GIL_KDW ) && ( hero . guild !=  GIL_KDW ) && ( hero . guild != GIL_KDW != GIL_KDM ) && (hero.guild != GIL_SEK ) && (hero.guild != GIL_TPL ) && (hero.guild != GIL_GUR )))     
	{
		return TRUE;
	};
};

func void DIA_Godar_Hunting_Info()
{
	AI_Output(other,self, " DIA_Godar_Hunting_15_00 " );	// Can you teach me how to hunt?
	if(GodarLikesYou == FALSE)
	{
		AI_Output(self,other, " DIA_Godar_Hunting_13_01 " );	// Are you kidding? Never!
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Godar_Hunting_13_03 " );	// Animals are not only meat. You can also sell their skins or claws. This is good money.
		AI_Output(self,other, " DIA_Godar_Hunting_13_04 " );	// Can't wait until we get to that dragon!
		Godar_TeachAnimalTrophy = TRUE;
	};
};


instance DIA_Godar_Dragonstuff(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Dragonstuff_Condition;
	information = DIA_Godar_Dragonstuff_Info;
	permanent = TRUE;
	description = " Tell me how to gut a dragon. " ;
};


var int Godar_TeachDragonStuff;

func int DIA_Godar_Dragonstuff_Condition()
{
	if ((Godar_TeachAnimalTrophy ==  TRUE ) && ((hero.guild !=  GIL_MIL ) && (hero.guild !=  GIL_PAL ) && (hero.guild !=  GIL_KDF ) && (hero.guild != GIL_KDW ) && (hero.guild != GIL_KDW ) && (hero.guild != GIL_KDW ) && (hero.guild !=  GIL_KDW != GIL_KDM ) && (hero.guild != GIL_SEK ) && (hero.guild != GIL_TPL ) && (hero.guild != GIL_GUR )) &&     ((PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)) && (Godar_TeachDragonStuff == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Godar_Dragonstuff_Info()
{
	AI_Output(other,self, " DIA_Godar_Dragonstuff_15_00 " );	// Tell me how to gut a dragon.
	AI_Output(self,other, " DIA_Godar_Dragonstuff_13_01 " );	// So you can keep all the gold for yourself, huh?
	AI_Output(self,other, " DIA_Godar_Dragonstuff_13_02 " );	// Okay, fine, but that will cost you a thousand gold pieces!
	Info_ClearChoices(DIA_Godar_Dragonstuff);
	Info_AddChoice(DIA_Godar_Dragonstuff, " I'm not very interested. " ,DIA_Godar_Dragonstuff_nein);
	Info_AddChoice(DIA_Godar_Dragonstuff, " That's fair. " ,DIA_Godar_Dragonstuff_fair);
};

func void DIA_Godar_Dragonstuff_fair()
{
	AI_Output(other,self, " DIA_Godar_Dragonstuff_fair_15_00 " );	// That's fair.
	if(B_GiveInvItems(other,self,ItMi_Gold,1000))
	{
		Godar_TeachDragonStuff = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Godar_Dragonstuff_fair_13_01 " );	// Without money, not much. Get the gold first.
	};
	Info_ClearChoices(DIA_Godar_Dragonstuff);
};

func void DIA_Godar_Dragonstuff_nein()
{
	AI_Output(other,self, " DIA_Godar_Dragonstuff_nein_15_00 " );	// I'm not very interested in this.
	AI_Output(self,other, " DIA_Godar_Dragonstuff_nein_13_01 " );	// As you know.
	Info_ClearChoices(DIA_Godar_Dragonstuff);
};


instance DIA_Godar_Teach(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_Teach_Condition;
	information = DIA_Godar_Teach_Info;
	permanent = TRUE;
	description = " Teach me how to hunt. " ;
};


func int DIA_Godar_Teach_Condition()
{
	if ((Godar_TeachAnimalTrophy ==  TRUE ) && ((hero.guild !=  GIL_MIL ) && (hero.guild !=  GIL_PAL ) && (hero.guild !=  GIL_KDF ) && (hero.guild != GIL_KDW ) && (hero.guild != GIL_KDW ) && (hero.guild != GIL_KDW ) && (hero.guild !=  GIL_KDW != GIL_KDM ) && (hero.guild != GIL_SEK ) && (hero.guild != GIL_TPL ) && (hero.guild != GIL_GUR )))    
	{
		return TRUE;
	};
};

func void DIA_Godar_Teach_Info()
{
	AI_Output(other,self, " DIA_Godar_Teach_15_00 " );	// Teach me how to hunt.
	if((Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE) || (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE))
	{
		Info_AddChoice(DIA_Godar_Teach,Dialog_Back,DIA_Godar_Teach_Back);
		if(Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,b_buildlearnstringforthief("Подкрадываться",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1)),DIA_Godar_Teach_Thief_Sneak);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Teeth] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,b_buildlearnstringforsmithhunt("Вырывать клыки",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Teeth)),DIA_Godar_Teach_TROPHYS_Teeth);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFSting] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,b_buildlearnstringforsmithhunt( " Cut Blood Hornet Stinger " ,B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY ,TROPHY_BFSting)),DIA_Godar_Teach_TROPHYS_BFSting);
		};
		if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_BFWing] == FALSE)
		{
			Info_AddChoice(DIA_Godar_Teach,b_buildlearnstringforsmithhunt( " Cut Bloodhornet Wings " ,B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY ,TROPHY_BFWing)),DIA_Godar_Teach_TROPHYS_BFWing);
		};
		if (Godar_TeachDragonStuff ==  TRUE )
		{
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonScale] == FALSE)
			{
				Info_AddChoice(DIA_Godar_Teach,b_buildlearnstringforsmithhunt("Снять чешую дракона",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_DragonScale)),DIA_Godar_Teach_TROPHYS_DragonScale);
			};
			if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_DragonBlood] == FALSE)
			{
				Info_AddChoice(DIA_Godar_Teach,b_buildlearnstringforsmithhunt( " Слить кровь дракона " ,B_GetLearnCostTalent(other, NPC_TALENT_TAKEANIMALTROPHY ,TROPHY_DragonBlood)),DIA_Godar_Teach_TROPHYS_DragonBlood);
			};
		};
	}
	else
	{
		B_Say(self,other,"$NOLEARNYOUREBETTER");
	};
};

func void DIA_Godar_Teach_Back()
{
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_Teeth()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Teeth))
	{
		AI_Output(self,other, " DIA_Godar_TEACHHUNTING_Teeth_13_00 " );	// Teeth are best removed with a good knife.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_BFSting()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFSting))
	{
		AI_Output(self,other, " DIA_Godar_TEACHHUNTING_BFSting_13_00 " );	// The hornet's sting is most quickly removed if you squeeze it out before cutting it off.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_BFWing()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_BFWing))
	{
		AI_Output(self,other, " DIA_Godar_TEACHHUNTING_BFWing_13_00 " );	// Hornet wings are very sensitive. That is, be careful when you cut them off.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_Thief_Sneak()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other, " DIA_Godar_TEACHHUNTING_Sneak_13_00 " );	// When you sneak up, wear soft shoes. A rigid sole can be very loud.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_DragonScale()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonScale))
	{
		AI_Output(self,other, " DIA_Godar_TEACHHUNTING_DragonScale_13_00 " );	// You need a lot of power to get the dragon scales. But you'll be fine with that.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};

func void DIA_Godar_Teach_TROPHYS_DragonBlood()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_DragonBlood))
	{
		AI_Output(self,other, " DIA_Godar_TEACHHUNTING_DragonBlood_13_00 " );	// Look for the soft spot on the dragon's belly. It's the easiest way to get to his blood.
	};
	Info_ClearChoices(DIA_Godar_Teach);
};


instance DIA_Godar_AllDragonsDead(C_Info)
{
	npc = DJG_711_Godar;
	nr = 5;
	condition = DIA_Godar_AllDragonsDead_Condition;
	info = DIA_Godar_AllDragonsDead_Info;
	permanent = FALSE;
	description = " I've killed all the dragons. " ;
};


func int DIA_Godar_AllDragonsDead_Condition()
{
	if ((MY_AllDragonsDead ==  TRUE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Godar_AllDragonsDead_Info()
{
	AI_Output(other,self, " DIA_Godar_AllDragonsDead_15_00 " );	// I killed all the dragons.
	AI_Output(self,other, " DIA_Godar_AllDragonsDead_13_01 " );	// Well, okay. Here, in the valley, we will still find something to profit from.
};


instance DIA_Godar_PICKPOCKET(C_Info)
{
	npc = DJG_711_Godar;
	nr = 900;
	condition = DIA_Godar_PICKPOCKET_Condition;
	information = DIA_Godar_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Godar_PICKPOCKET_Condition()
{
	return  C_Robbery ( 16 , 160 );
};

func void DIA_Godar_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
	Info_AddChoice(DIA_Godar_PICKPOCKET,Dialog_Back,DIA_Godar_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Godar_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Godar_PICKPOCKET_DoIt);
};

func void DIA_Godar_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
};

func void DIA_Godar_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Godar_PICKPOCKET);
};


instance DIA_GODAR_FUCKOFF(C_Info)
{
	npc = DJG_711_Godar;
	nr = 2;
	condition = dia_godar_fuckoff_condition;
	information = dia_godar_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_godar_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREFUSEPALADIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_godar_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};
