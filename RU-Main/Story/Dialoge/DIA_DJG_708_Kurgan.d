
instance DIA_Kurgan_EXIT(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 999;
	condition = DIA_Kurgan_EXIT_Condition;
	information = DIA_Kurgan_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Kurgan_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Kurgan_EXIT_Info()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(Biff,400);
};


instance DIA_Kurgan_HELLO (C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_HELLO_Condition;
	information = DIA_Kurgan_HELLO_Info;
	important = TRUE;
};


func int DIA_Kurgan_HELLO_Condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Kurgan_HELLO_Info()
{
	AI_Output(self,other, " DIA_Kurgan_HELLO_01_00 " );	// Hey you! Watch where you're going!
	AI_Output(other,self, " DIA_Kurgan_HELLO_15_01 " );	// What do you mean by that?
	AI_Output(self,other, " DIA_Kurgan_HELLO_01_02 " );	// I mean, staying here might not be good for your health. This place is just teeming with orcs and monsters.
	AI_Output(self,other, " DIA_Kurgan_HELLO_01_03 " );	// Not to mention dragons. This is just a friendly warning.
	B_LogEntry(TOPIC_Dragonhunter, " I met a group of dragon hunters at the entrance to the Valley of Mines. These guys are well-armed, but I'm afraid that won't impress the dragons. " );
};


DIA_Kurgan_ELSE (C_Info) instances
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_ELSE_Condition;
	information = DIA_Kurgan_ELSE_Info;
	description = " Can you tell me something I don't already know? " ;
};


func int DIA_Kurgan_ELSE_Condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Kurgan_ELSE_Info()
{
	AI_Output(other,self, " DIA_Kurgan_ELSE_15_00 " );	// Can you tell me something I don't already know?
	AI_Output(self,other, " DIA_Kurgan_ELSE_01_01 " );	// I can give you good advice for free.
	AI_Output(self,other, " DIA_Kurgan_ELSE_01_02 " );	// We don't need cowards here who faint at the slightest whiff of a dragon.
	AI_Output(self,other, " DIA_Kurgan_ELSE_01_03 " );	// Come home, this is a job for real men.
};


instances of DIA_Kurgan_Leader (C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_Leader_Condition;
	information = DIA_Kurgan_Leader_Info;
	description = " Are you in charge here? " ;
};


func int DIA_Kurgan_Leader_Condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void DIA_Kurgan_Leader_Info()
{
	AI_Output(other,self, " DIA_Kurgan_Leader_15_00 " );	// Are you in charge here?
	AI_Output(self,other, " DIA_Kurgan_Leader_01_01 " );	// Do I look like the boss? Of course not. We don't need arrogant cretins issuing orders here.
	AI_Output(self,other, " DIA_Kurgan_Leader_01_02 " );	// When Silvio tried to act like a commander, we showed him and his guys what we think about it.
	AI_Output(self,other, " DIA_Kurgan_Leader_01_03 " );	// There was a little skirmish. And in the end they had to leave.
	AI_Output(self,other, " DIA_Kurgan_Leader_01_04 " );	// I hope Silvio finds his end in some orc's pot.
};


instance DIA_Kurgan_KillDragon (C_Info) .
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_KillDragon_Condition;
	information = DIA_Kurgan_KillDragon_Info;
	description = " So you want to kill dragons? " ;
};


func int DIA_Kurgan_KillDragon_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Kurgan_Leader ) && ( CAPITAL CATC  ==  FALSE ))
	{
		return TRUE;
	};
};


var int Kurgan_KillDragon_Day;

func void DIA_Kurgan_KillDragon_Info()
{
	AI_Output(other,self, " DIA_Kurgan_KillDragon_15_00 " );	// (mocking) So you want to kill dragons?
	AI_Output(self,other, " DIA_Kurgan_KillDragon_01_01 " );	// Wow, what a quick-witted one. Do you even know how to kill a dragon?
	AI_Output(self,other, " DIA_Kurgan_KillDragon_01_02 " );	// Do you think he'll sit still while you chop off his head?
	AI_Output(self,other, " DIA_Kurgan_KillDragon_01_03 " );	// Such cases require careful planning and decisive action.
	AI_Output(other,self, " DIA_Kurgan_KillDragon_15_04 " );	// I understand. And how are you going to deal with the dragons?
	AI_Output(self,other, " DIA_Kurgan_KillDragon_01_05 " );	// First we need to find out where they are hiding.
	AI_Output(self,other, " DIA_Kurgan_KillDragon_01_06 " );	// Only then can we think of a better way to attack them.
	Kurgan_KillDragon_Day = Wld_GetDay();
	Info_AddChoice(DIA_Kurgan_KillDragon, " Sorry, I have to go. " ,DIA_Kurgan_KillDragon_weg);
	Info_AddChoice(DIA_Kurgan_KillDragon, " How are you going to get past the orcs? " ,DIA_Kurgan_KillDragon_orks);
	Info_AddChoice(DIA_Kurgan_KillDragon, " I don't think you can even find a blind sheep. " ,DIA_Kurgan_KillDragon_spott);
};

func void DIA_Kurgan_KillDragon_spit()
{
	AI_Output(other,self, " DIA_Kurgan_KillDragon_spott_15_00 " );	// I don't think you can even find a blind sheep.
	AI_Output(self,other, " DIA_Kurgan_KillDragon_spott_01_01 " );	// What? Do you want to get in on your stupid face?
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_Kurgan_KillDragon_orks()
{
	AI_Output(other,self, " DIA_Kurgan_KillDragon_orks_15_00 " );	// How are you going to get past the orcs?
	AI_Output(self,other, " DIA_Kurgan_KillDragon_orks_01_01 " );	// We'll look at this later.
};

func void DIA_Kurgan_KillDragon_weg()
{
	AI_Output(other,self, " DIA_Kurgan_KillDragon_weg_15_00 " );	// I'd love to see how you do this, but unfortunately I have to go.
	AI_Output(self,other, " DIA_Kurgan_KillDragon_weg_01_01 " );	// Go back through the passage. Otherwise, you risk losing an arm or leg.
	AI_StopProcessInfos(self);
};


instances of DIA_Kurgan_SEENDRAGON (C_Info)
{
	npc = DJG_708_Kurgan;
	condition = DIA_Kurgan_SEENDRAGON_Condition;
	information = DIA_Kurgan_SEENDRAGON_Info;
	permanent = TRUE;
	description = " Have you seen a dragon yet? " ;
};


func int DIA_Kurgan_SEENDRAGON_Condition()
{
	if ((Kurgan_KillDragon_Day <= (Wld_GetDay() -  2 )) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Kurgan_SEENDRAGON_Info()
{
	AI_Output(other,self, " DIA_Kurgan_SEENDRAGON_15_00 " );	// Have you seen the dragon yet?
	AI_Output(self,other, " DIA_Kurgan_SEENDRAGON_01_01 " );	// Not yet. But this creature can't hide forever.
};


instances DIA_Kurgan_AllDragonsDead (C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 5;
	condition = DIA_Kurgan_AllDragonsDead_Condition;
	information = DIA_Kurgan_AllDragonsDead_Info;
	permanent = FALSE;
	description = " The dragons are dead. " ;
};


func int DIA_Kurgan_AllDragonsDead_Condition()
{
	if ((MY_AllDragonsDead ==  TRUE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Kurgan_AllDragonsDead_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Kurgan_AllDragonsDead_15_00 " );	// The dragons are dead.
	AI_Output(self,other, " DIA_Kurgan_AllDragonsDead_01_01 " );	// Ha! And who, I wonder, killed them? Paladins?
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_02");	//Я.
	AI_Output(self,other, " DIA_Kurgan_AllDragonsDead_01_03 " );	// (laughs) Ha. You don't even believe it yourself. Stop talking nonsense.
};


instances DIA_Kurgan_PICKPOCKET (C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 900;
	condition = DIA_Kurgan_PICKPOCKET_Condition;
	information = DIA_Kurgan_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Kurgan_PICKPOCKET_Condition()
{
	return  C_Robbery ( 34 , 120 );
};

func void DIA_Kurgan_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
	Info_AddChoice(DIA_Kurgan_PICKPOCKET,Dialog_Back,DIA_Kurgan_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Kurgan_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Kurgan_PICKPOCKET_DoIt);
};

func void DIA_Kurgan_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
};

func void DIA_Kurgan_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Kurgan_PICKPOCKET);
};


instance DIA_KURGAN_THANKSFORHELP(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_thanksforhelp_condition;
	information = dia_kurgan_thanksforhelp_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_kurgan_thanksforhelp_condition()
{
	if(MIS_ORсGREATWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_kurgan_thanksforhelp_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_Kurgan_ThanksForHelp_01_00 " );	// Thanks for the help. A little more - and we all would have come to an end!
	MEETKURGANAFTER = TRUE;
};


DIA_KURGAN_WHYHERE (C_Info) instances
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_whyhere_condition;
	information = dia_kurgan_whyhere_info;
	permanent = FALSE;
	description = " Why are you still here?! " ;
};


func int dia_kurgan_whyhere_condition()
{
	if(MIS_ORсGREATWAR == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_kurgan_whyhere_info()
{
	AI_Output(other,self, " DIA_Kurgan_WhyHere_01_00 " );	// Why are you still here?
	AI_Output(self,other, " DIA_Kurgan_WhyHere_01_01 " );	// And where do you think we should go? Orcs all around!
	AI_Output(self,other, " DIA_Kurgan_WhyHere_01_02 " );	// You constantly run the risk of running into one of their patrols.
	AI_Output(self,other, " DIA_Kurgan_WhyHere_01_03 " );	// Now we can't even hide in the castle. I heard those nasty creatures got to him too.
};


DIA_KURGAN_HOWAROUND (C_Info) instances
{
	npc = DJG_708_Kurgan;
	nr = 2;
	condition = dia_kurgan_howaround_condition;
	information = dia_kurgan_howaround_info;
	permanent = TRUE;
	description = " How are things? " ;
};


func int dia_kurgan_howaround_condition()
{
	if (( MIS_OR с GREATWAR  == LOG_Running ) && Npc_KnowsInfo ( other , dia_kurgan_whyhere ) && ( DGJJOINPALADIN  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_kurgan_howaround_info()
{
	AI_Output(other,self, " DIA_Kurgan_HowAround_01_00 " );	// How setting?
	AI_Output(self,other, " DIA_Kurgan_HowAround_01_01 " );	// Everything is quiet. Orcs are not visible yet.
};


instance DIA_KURGAN_GOAWAY(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_goaway_condition;
	information = dia_kurgan_goaway_info;
	permanent = FALSE;
	description = " You could join the paladins. " ;
};


func int dia_kurgan_goaway_condition()
{
	if (( MEETNATAN  ==  TRUE ) && ( MIS_KILLDRAGONHUNTER  ==  FALSE ) && Npc_KnowsInfo(other,dia_kurgan_whyhere) && ( DGJJOINPALADIN  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_kurgan_goaway_info()
{
	AI_Output(other,self, " DIA_Kurgan_GoAway_01_00 " );	// You could join the paladins.
	AI_Output(self,other, " DIA_Kurgan_GoAway_01_01 " );	// (surprised) What do you mean?
	AI_Output(other,self, " DIA_Kurgan_GoAway_01_02 " );	// Their squad is now standing at the exit from the Valley of Mines. And with them, it will be much easier for you to get out of here.
	AI_Output(self,other, " DIA_Kurgan_GoAway_01_03 " );	// Yes? Maybe you're right.
	AI_Output(self,other, " DIA_Kurgan_GoAway_01_04 " );	// There we will feel much calmer than here.
	AI_Output(self,other, " DIA_Kurgan_GoAway_01_06 " );	// Thanks for the news.
	DGJMOVEPALADIN = TRUE;
};


instance DIA_KURGAN_DGJJOINPALADIN(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_dgjjoinpaladin_condition;
	information = dia_kurgan_dgjjoinpaladin_info;
	permanent = FALSE;
	description = "The paladins need your help. " ;
};


func int dia_kurgan_dgjjoinpaladin_condition()
{
	if (( MIS_STURMCASTLE  == LOG_Running ) && Npc_KnowsInfo ( other , dia_kurgan_whyhere ))
	{
		return TRUE;
	};
};

func void dia_kurgan_dgjjoinpaladin_info()
{
	AI_Output(other,self, " DIA_Kurgan_DgjJoinPaladin_01_00 " );	// Paladins need your help.
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_01_01 " );	// Yes?! And why did they need her?
	AI_Output(other,self, " DIA_Kurgan_DgjJoinPaladin_01_02 " );	// They want the fortress back, so they need more people.
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_01_03 " );	// (sarcastically) Oh, how is it? Looks like they've finally gone crazy, since they are going to oppose a whole army of orcs!
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_01_07 " );	// We're not stupid enough to risk our lives needlessly.
	AI_Output(other,self, " DIA_Kurgan_DgjJoinPaladin_01_10 " );	// Maybe we can still come to an agreement?
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_01_11 " );	// What's the deal here, mate?
	B_LogEntry( TOPIC_STURMCASTLE , " The dragon hunters don't like this idea. They don't want to help the paladins storm the fortress that the orcs have taken. I'll try to convince them. " );
	Info_ClearChoices(dia_kurgan_dgjjoinpaladin);
	Info_AddChoice(dia_kurgan_dgjjoinpaladin, " I won't call you cowards! " ,dia_kurgan_dgjjoinpaladin_coward);
	Info_AddChoice(dia_kurgan_dgjjoinpaladin, " I could tell the orcs about your camp. " ,dia_kurgan_dgjjoinpaladin_orcs);
	Info_AddChoice(dia_kurgan_dgjjoinpaladin, " How about gold? " ,dia_kurgan_dgjjoinpaladin_gold);
};

func void dia_kurgan_dgjjoinpaladin_coward()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Kurgan_DgjJoinPaladin_Coward_01_00 " );	// I won't call you cowards!
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_Coward_01_01 " );	// Ha! And you naively think that I care about your opinion?
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_Coward_01_02 " );	// I'll tell you what: get the hell out of here!
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_Coward_01_03 " );	// We won't help paladins! Especially for a smart guy like you.
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_Coward_01_04 " );	// That's it, the conversation is over. Get out!
	B_LogEntry( TOPIC_STURMCASTLE , " It didn't work out for me. I should tell the paladins about this. " );
	AI_StopProcessInfos(self);
	self.aivar[ 93 ] = FALSE ;
	DGJREFUSEPALADIN = TRUE;
	INNOSPRAYCOUNT = INNOSPRAYCOUNT + 1;
};

func void dia_kurgan_dgjjoinpaladin_orcs()
{
	AI_Output(other,self, " DIA_Kurgan_DgjJoinPaladin_Orcs_01_00 " );	// I could tell the orcs about your camp.
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_Orcs_01_01 " );	// (frightened) What?! But you won't!
	AI_Output(other,self, " DIA_Kurgan_DgjJoinPaladin_Orcs_01_02 " );	// Let's check it out!
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_Orcs_01_03 " );	// Well, you're a bastard! And after that you still hope for my help?!
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_Orcs_01_05 " );	// Arghhh, damn! Okay, we'll help the paladins.
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_Orcs_01_07 " );	// Someday we'll get even with you, bastard! Mark my word.
	B_LogEntry( TOPIC_STURMCASTLE , " With a little blackmail, I was able to convince these cowards to fight on our side. However, I shouldn't turn my back on them now. " );
	DGJJOINPALADIN = TRUE;
	DGJREVENGEME = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_kurgan_dgjjoinpaladin_gold()
{
	AI_Output(other,self, " DIA_Kurgan_DgjJoinPaladin_Gold_01_00 " );	// How about gold?
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_Gold_01_01 " );	// Gold? This might really interest us.
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_Gold_01_02 " );	// But there should be a lot of this gold, since there are a lot of orcs in the fortress too!
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_Gold_01_06 " );	// I guess fifty thousand gold would be just right for us.
	Info_ClearChoices(dia_kurgan_dgjjoinpaladin);
	Info_AddChoice(dia_kurgan_dgjjoinpaladin, " I don't have enough gold. " ,dia_kurgan_dgjjoinpaladin_nogold);
	if(Npc_HasItems(other,ItMi_Gold) >= 50000)
	{
		Info_AddChoice(dia_kurgan_dgjjoinpaladin, " Here's your money. " ,dia_kurgan_dgjjoinpaladin_ok);
	};
};

func void dia_kurgan_dgjjoinpaladin_nogold()
{
	AI_Output(other,self, " DIA_Kurgan_DgjJoinPaladin_NoGold_01_00 " );	// I don't have enough gold.
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_NoGold_01_01 " );	// (angrily) Then find him.
	B_LogEntry( TOPIC_STURMCASTLE , " The dragon hunters only agreed to join the paladins if I paid them fifty thousand gold pieces! " );
	DJGAWAITSGOLD = TRUE;
	Info_ClearChoices(dia_kurgan_dgjjoinpaladin);
};

func void dia_kurgan_dgjjoinpaladin_ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Kurgan_DgjJoinPaladin_Ok_01_00 " );	// Here's your money.
	B_GiveInvItems(other,self,ItMi_Gold,50000);
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladin_Ok_01_01 " );	// (pretty) Okay, mate. We will help the paladins!
	B_LogEntry( TOPIC_STURMCASTLE , " I offered them gold. They didn't refuse it, and promised to help the paladins storm the fortress. " );
	self.aivar[ 93 ] = FALSE ;
	DGJJOINPALADIN = TRUE;
	AI_StopProcessInfos(self);
};


instance DIA_KURGAN_DGJJOINPALADINGOLD(C_Info)
{
	npc = DJG_708_Kurgan;
	nr = 1;
	condition = dia_kurgan_dgjjoinpaladingold_condition;
	information = dia_kurgan_dgjjoinpaladingold_info;
	permanent = TRUE;
	description = " I brought you gold. " ;
};


func int dia_kurgan_dgjjoinpaladingold_condition()
{
	if (( MIS_STURMCASTLE  == LOG_Running ) && ( DJGAWAITSGOLD  ==  TRUE ) && ( DGJJOINPALADIN  ==  FALSE ) && ( Npc_HasItems ( other , ItMy_Gold ) >=  50000 )) ;
	{
		return TRUE;
	};
};

func void dia_kurgan_dgjjoinpaladingold_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Kurgan_DgjJoinPaladinGold_01_00 " );	// I brought you gold.
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladinGold_01_01 " );	// Justice? Show!
	AI_Output(other,self, " DIA_Kurgan_DgjJoinPaladinGold_01_02 " );	// Here's your money.
	B_GiveInvItems(other,self,ItMi_Gold,50000);
	AI_Output(self,other, " DIA_Kurgan_DgjJoinPaladinGold_01_03 " );	// (pretty) Okay, mate. We will help the paladins!
	B_LogEntry( TOPIC_STURMCASTLE , " I gave the gold to the dragon hunters. Now they will help the paladins. " );
	self.aivar[ 93 ] = FALSE ;
	DGJJOINPALADIN = TRUE;
	AI_StopProcessInfos(self);
};


DIA_KURGAN_FUCKOFF (C_Info) instances
{
	npc = DJG_708_Kurgan;
	nr = 2;
	condition = dia_kurgan_fuckoff_condition;
	information = dia_kurgan_fuckoff_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_kurgan_fuckoff_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (DGJREFUSEPALADIN == TRUE))
	{
		return TRUE;
	};
};

func void dia_kurgan_fuckoff_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};
