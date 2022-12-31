
instance DIA_Pepe_EXIT(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 999;
	condition = DIA_Pepe_EXIT_Condition;
	information = DIA_Pepe_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pepe_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pepe_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pepe_Hello (C_Info)
{
	npc = Bau_912_Pepe;
	nr = 1;
	condition = DIA_Pepe_Hallo_Condition;
	information = DIA_Pepe_Hello_Info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};


func int DIA_Pepe_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Pepe_Hallo_Info()
{
	AI_Output(other,self, " DIA_Pepe_Hallo_15_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Pepe_Hallo_03_01 " );	// Keeping sheep! (sigh) I try to stay out of trouble whenever possible.
	if((hero.guild != GIL_SLD) && (hero.guild != GIL_DJG))
	{
		AI_Output(other,self, " DIA_Pepe_Hallo_15_02 " );	// It's not always possible, right?
		AI_Output(self,other, " DIA_Pepe_Hallo_03_03 " );	// Yeah, especially when it comes to mercenaries. I am very glad that I work here in the pasture, away from them. It's not entirely safe here, though.
	};
};


instances of DIA_Pepe_Danger (C_Info)
{
	npc = Bau_912_Pepe;
	nr = 2;
	condition = DIA_Pepe_Danger_Condition;
	information = DIA_Pepe_Danger_Info;
	permanent = FALSE;
	description = " What's dangerous in the pasture? " ;
};


func int DIA_Pepe_Danger_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Pepe_Hello ))
	{
		return TRUE;
	};
};

func void DIA_Pepe_Danger_Info()
{
	AI_Output(other,self, " DIA_Pepe_Danger_15_00 " );	// And what is dangerous in the pasture?
	AI_Output(self,other, " DIA_Pepe_Danger_03_01 " );	// A small pack of wolves roam nearby. Those damned creatures steal one of my sheep almost every day.
	AI_Output(self,other, " DIA_Pepe_Danger_03_02 " );	// A few days ago I had twice as many sheep. I don't even want to think what Onar will do to me when he finds out about this.
};


instance DIA_Pepe_WhyNotSLD(C_Info)
{
	npc = Bau_912_Pepe;
	nr = 3;
	condition = DIA_Pepe_WhyNotSLD_Condition;
	information = DIA_Pepe_WhyNotSLD_Info;
	permanent = FALSE;
	description = " Why don't you tell the mercenaries about the wolves? I thought it was their job. " ;
};


func int DIA_Pepe_WhyNotSLD_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Pepe_Danger ) && ( ( hero . guild !=  GIL_SLD ) && ( hero . guild !=  GIL_DJG )))
	{
		return TRUE;
	};
};

func void DIA_Pepe_WhyNotSLD_Info()
{
	AI_Output(other,self, " DIA_Pepe_WhyNotSLD_15_00 " );	// Why don't you tell the mercenaries about the wolves? I thought it was their job.
	AI_Output(self,other, " DIA_Pepe_WhyNotSLD_03_01 " );	// I did, when it started, but he didn't listen damn it!
	AI_Output(self,other, " DIA_Pepe_WhyNotSLD_03_02 " );	// And now so many sheep are gone, I'm afraid to alert anyone to it.
	AI_Output(other,self, " DIA_Pepe_WhyNotSLD_15_03 " );	// But you just told ME...
	AI_Output(self,other, " DIA_Pepe_WhyNotSLD_03_04 " );	// (angrily) I already regret it.
};


instance DIA_Pepe_KillWolves (C_Info) .
{
	npc = Bau_912_Pepe;
	nr = 4;
	condition = DIA_Pepe_KillWolves_Condition;
	information = DIA_White_KillWolves_Info;
	permanent = FALSE;
	description = " What if I kill these wolves? " ;
};


func int DIA_Pepe_KillWolves_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Pepe_Danger ))
	{
		return TRUE;
	};
};

func void DIA_Pepe_KillWolves_Info()
{
	AI_Output(other,self, " DIA_Pepe_KillWolves_15_00 " );	// What if I kill these wolves?
	AI_Output(self,other, " DIA_Pepe_KillWolves_03_01 " );	// You, alone? Ha ha. I don't see that happening anytime soon.
	AI_Output(other,self, " DIA_Pepe_KillWolves_15_02 " );	// Forget it. I'll go to the boys and see what THEY have to say about this...
	AI_Output(self,other, " DIA_Pepe_KillWolves_03_03 " );	// Wait a minute. Good good! Uh... you're the greatest warrior, and you can take down a hundred wolves with one arm. No problem!
	AI_Output(self,other, " DIA_Pepe_KillWolves_03_04 " );	// Usually they dart around in the woods near the pasture. I think there are only four of them ...
	AI_StopProcessInfos(self);
	Wld_InsertNpc(PEPES_YWolf1,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_01");
	Wld_InsertNpc(PEPES_YWolf2,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_02");
	Wld_InsertNpc(PEPES_YWolf3,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_03");
	Wld_InsertNpc(PEPES_YWolf4,"FP_ROAM_NW_BIGFARM_PEPES_WOLFS_04");
	MIS_Pepe_KillWolves = LOG_Running;
	Log_CreateTopic(TOPIC_PepeWolves,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PepeWolves,LOG_Running);
	B_LogEntry(TOPIC_PepeWolves, " Pepe's sheep have been attacked by wolves. I must end them. " );
};


instance DIA_Pepe_KilledWolves (C_Info)
{
	npc = Bau_912_Pepe;
	nr = 5;
	condition = DIA_Pepe_KilledWolves_Condition;
	information = DIA_White_KilledWolves_Info;
	permanent = TRUE;
	description = " I've dealt with the wolves. " ;
};


func int DIA_Pepe_KilledWolves_Condition()
{
	if(MIS_Pepe_KillWolves == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Pepe_KilledWolves_Info()
{
	AI_Output(other,self, " DIA_Pepe_KilledWolves_15_00 " );	// I dealt with the wolves.
	if (Npc_IsDead(PEPES_YWolf1) && Npc_IsDead(PEPES_YWolf2) && Npc_IsDead(PEPES_YWolf3) && Npc_IsDead(PEPES_YWolf4))
	{
		AI_Output(self,other, " DIA_Pepe_KilledWolves_03_01 " );	// You did it! Glory to Innos!
		AI_Output(self,other, " DIA_Pepe_KilledWolves_03_02 " );	// But I still don't know how to tell Onar that his sheep are gone.
		AI_Output(self,other, " DIA_Pepe_KilledWolves_03_03 " );	// (under his breath) It's all that damn Bulko's fault!
		MIS_Pepe_KillWolves = LOG_SUCCESS;
		B_GivePlayerXP(XP_PepeWolves);
	}
	else
	{
		AI_Output(self,other, " DIA_Pepe_KilledWolves_03_04 " );	// Do you think I'm an idiot? The beasts are not all dead yet.
	};
};


instance DIA_Pepe_Bullco (C_Info)
{
	npc = Bau_912_Pepe;
	nr = 5;
	condition = DIA_Pepe_Bullco_Condition;
	information = DIA_Pepe_Bullco_Info;
	permanent = FALSE;
	description = " What did you say about Bulko? " ;
};


func int DIA_Pepe_Bullco_Condition()
{
	if ((MY_Pepe_KillWolves ==  LOG_SUCCESS ) &&  ! Npc_IsDead(Bullco) && (Chapter <=  3 )) ;
	{
		return TRUE;
	};
};

func void DIA_Pepe_Bullco_Info()
{
	AI_Output(other,self, " DIA_Pepe_Bullco_15_00 " );	// What did you say about Bulko?
	AI_Output(self,other, " DIA_Pepe_Bullco_03_01 " );	// One of the mercenaries. It's his job to guard the pasture.
	AI_Output(self,other, " DIA_Pepe_Bullco_03_02 " );	// But instead, he and his friend Silvio hang out in Tecla's kitchen all day long.
	AI_Output(self,other, " DIA_Pepe_Bullco_03_03 " );	// It's the bastard's fault if I don't get paid for many weeks of work because of the loss of sheep.
	AI_Output(self,other, " DIA_Pepe_Bullco_03_04 " );	// How I'd like to punch him in the face. But no one can do it. The guy is a killer.
	MIS_Pepe_KickBullco = LOG_Running;
	Log_CreateTopic(TOPIC_KickBullco,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_KickBullco,LOG_Running);
	B_LogEntry(TOPIC_KickBullco, " Bulco doesn't guard Pepe's sheep well. Pepe wants someone to teach him a lesson. " );
};


instance DIA_Pepe_BullcoDefeated (C_Info)
{
	npc = Bau_912_Pepe;
	nr = 5;
	condition = DIA_Pepe_BullcoDefeated_Condition;
	information = DIA_Black_BullcoDefeated_Info;
	permanent = FALSE;
	description = " Bulko got what he deserved. " ;
};


func int DIA_Pepe_BullcoDefeated_Condition()
{
	if(MIS_Pepe_KickBullco == LOG_Running)
	{
		if((Bullco.aivar[AIV_DefeatedByPlayer] == TRUE) || (DJG_Bullco.aivar[AIV_DefeatedByPlayer] == TRUE))
		{
			return TRUE;
		};
	};
};

func void DIA_Pepe_BullcoDefeated_Info()
{
	AI_Output(other,self, " DIA_Pepe_BullcoDefeated_15_00 " );	// Bulko got what he deserved. I taught him a lesson.
	AI_Output(self,other, " DIA_Pepe_BullcoDefeated_03_01 " );	// The pig deserved it.
	MIS_Pepe_KickBullco = LOG_SUCCESS;
	B_GivePlayerXP(XP_KickBullco);
};


DIA_Pepe_PERM (C_Info) instances
{
	npc = Bau_912_Pepe;
	nr = 6;
	condition = DIA_Pepe_PERM_Condition;
	information = DIA_Pepe_PERM_Info;
	permanent = TRUE;
	description = " How are you, how are your sheep? " ;
};


func int DIA_Pepe_PERM_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Pepe_Hello ))
	{
		return TRUE;
	};
};

func void DIA_Pepe_PERM_Info()
{
	AI_Output(other,self, " DIA_Pepe_PERM_15_00 " );	// How are you, how are your sheep?
	if (chapter <=  1 )
	{
		AI_Output(self,other, " DIA_Pepe_PERM_03_01 " );	// Great. And the sheep are fine. Well, the ones I still have are fine.
	};
	if (chapter ==  2 )
	{
		AI_Output(self,other, " DIA_Pepe_PERM_03_02 " );	// Good. But other wolves may come. And possibly even worse beasts!
	};
	if (chapter ==  3 )
	{
		AI_Output(self,other, " DIA_Pepe_PERM_03_03 " );	// I've heard strange things. They say that scary people have appeared on Sekob's farm. They took over his house.
	};
	if (Chapter >=  4 )
	{
		AI_Output(self,other, " DIA_Pepe_PERM_03_04 " );	// I heard that some bandits have taken up residence at Lobart's farm. Someone should help him.
	};
};


instances DIA_Pepe_Liesel (C_Info)
{
	npc = Bau_912_Pepe;
	nr = 7;
	condition = DIA_Pepe_Liesel_Condition;
	information = DIA_Pepe_Liesel_Info;
	permanent = FALSE;
	description = " Can I buy a sheep? " ;
};


func int DIA_Pepe_Liesel_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Pepe_Hello ))
	{
		return TRUE;
	};
};

func void DIA_Pepe_Liesel_Info()
{
	AI_Output(other,self, " DIA_Pepe_Liesel_15_00 " );	// Can I buy a sheep?
	AI_Output(self,other, " DIA_Pepe_Liesel_03_01 " );	// Whenever you want, if you have money. A sheep is worth a hundred gold coins.
	AI_Output(self,other, " DIA_Pepe_Liesel_03_02 " );	// If you pay, you can choose your own sheep. But you have to promise to treat her well.
};


var int Pepe_SchafBought;

instance DIA_Pepe_BuyLiesel (C_Info)
{
	npc = Bau_912_Pepe;
	nr = 8;
	condition = DIA_Pepe_BuyLiesel_Condition;
	information = DIA_Pepe_BuyLiesel_Info;
	permanent = TRUE;
	description = " Here's one hundred gold coins! Give me a sheep. " ;
};

func int DIA_Pepe_BuyLiesel_Condition()
{
	if (( Npc_KnowsInfo ( other , DIA_Pepe_Liesel ) ==  TRUE ) && ( Pepe_SchafGekauft <  2 ))
	{
		return TRUE;
	};
};

func void DIA_Pepe_BuyLiesel_Info()
{
	AI_Output(other,self, " DIA_Pepe_BuyLiesel_15_00 " );	// Here's a hundred gold coins! Give me a sheep.

	if(B_GiveInvItems(other,self,ItMi_Gold,100))
	{
		if (Pepe_SchafBought ==  0 )
		{
			AI_Output(self,other, " DIA_Pepe_BuyLiesel_03_01 " );	// Good. Take Betsy - you will find her in the pasture.
			AI_Output(self,other, " DIA_Pepe_BuyLiesel_03_02 " );	// Just tell her to follow you. She is very smart for a sheep. Don't hurt her!
		}
		else
		{
			AI_Output(self,other, " DIA_Pepe_BuyLiesel_03_03 " );	// Again? Good. Take Betsy.
			AI_Output(other,self, " DIA_Pepe_BuyLiesel_15_04 " );	// Betsy? But the last sheep I took from you was also named Betsy...
			AI_Output(self,other, " DIA_Pepe_BuyLiesel_03_05 " );	// All my sheep are named Betsy.
			AI_Output(self,other, " DIA_Pepe_BuyLiesel_03_06 " );	// Except for the rams, of course.
			AI_Output(other,self, " DIA_Pepe_BuyLiesel_15_07 " );	// What are their names then?
			AI_Output(self,other,"DIA_Pepe_BuyLiesel_03_08");	//Bruce.
		};

		Pepe_SchafBought = Pepe_SchafBought +  1 ;
		AI_StopProcessInfos(self);
		Wld_InsertNpc(Follow_Sheep,"NW_BIGFARM_SHEEP2_02");
	}
	else
	{
		AI_Output(self,other, " DIA_Pepe_BuyLiesel_03_09 " );	// You don't have enough gold. And I can't sell a sheep cheaper.
	};
};

instances DIA_Pepe_PICKPOCKET (C_Info)
{
	npc = Bau_912_Pepe;
	nr = 900;
	condition = DIA_Pepe_PICKPOCKET_Condition;
	information = DIA_Pepe_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_Pepe_PICKPOCKET_Condition()
{
	return  C_Robbery ( 15 , 25 );
};

func void DIA_Pepe_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
	Info_AddChoice(DIA_Pepe_PICKPOCKET,Dialog_Back,DIA_Pepe_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Pepe_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Pepe_PICKPOCKET_DoIt);
};

func void DIA_Pepe_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
};

func void DIA_Pepe_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Pepe_PICKPOCKET);
};

instances DIA_PEPE_OGRIOB (C_Info)
{
	npc = Bau_912_Pepe;
	nr = 10;
	condition = dia_pepe_ogriob_condition;
	information = dia_pepe_ogriob_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pepe_ogriob_condition()
{
	if ((MY_Pepe_KillWolves ==  LOG_SUCCESS ) && (MY_Pepe_KickBullco ==  LOG_SUCCESS ) && (Chapter >=  2 ))
	{
		return TRUE;
	};
};

func void dia_pepe_ogriob_info()
{
	AI_Output(self,other, " DIA_Bau_912_Pepe_OGRIOB_01_01 " );	// Hey buddy... Hold on a minute.
	AI_Output(other,self, " DIA_Bau_912_Pepe_OGRIOB_01_02 " );	// What do you want?
	AI_Output(self,other, " DIA_Bau_912_Pepe_OGRIOB_01_03 " );	// Look, I've got an unpleasant situation here. Onar will take my head if he finds out.
	AI_Output(other,self, " DIA_Bau_912_Pepe_OGRIOB_01_04 " );	// Did the wolves steal your sheep again?
	AI_Output(self,other, " DIA_Bau_912_Pepe_OGRIOB_01_05 " );	// Well, SOMEONE did.
	AI_Output(other,self, " DIA_Bau_912_Pepe_OGRIOB_01_06 " );	// How did it happen?
	AI_Output(self,other, " DIA_Bau_912_Pepe_OGRIOB_01_07 " );	// I decided to go into the woods out of need. I just approached the bushes, when something rustled there.
	AI_Output(self,other, " DIA_Bau_912_Pepe_OGRIOB_01_08 " );	// And then I just feel... bam! It was as if Bennett's anvil had fallen on my foot.
	AI_Output(self,other, " DIA_Bau_912_Pepe_OGRIOB_01_09 " );	// Something hit me in the leg.
	AI_Output(self,other, " DIA_Bau_912_Pepe_OGRIOB_01_10 " );	// In short, I immediately passed out from the terrible pain, and when I woke up, I was missing a sheep.
	AI_Output(other,self, " DIA_Bau_912_Pepe_OGRIOB_01_11 " );	// Any suspects?
	AI_Output(self,other, " DIA_Bau_912_Pepe_OGRIOB_01_12 " );	// Unfortunately, I didn't really see anything.
	AI_Output(other,self, " DIA_Bau_912_Pepe_OGRIOB_01_13 " );	// What do you want from me?
	AI_Output(self,other, " DIA_Bau_912_Pepe_OGRIOB_01_14 " );	// Please help me get that sheep back! Or just find the thing that stole her from me.
	AI_Output(other,self, " DIA_Bau_912_Pepe_OGRIOB_01_15 " );	// Okay, I'll try.
	AI_Output(self,other, " DIA_Bau_912_Pepe_OGRIOB_01_16 " );	// Just be careful, the beast seems to be very strong!
	MIS_GRIMGASH = LOG_Running;
	Log_CreateTopic(TOPIC_GRIMGASH,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GRIMGASH,LOG_Running);
	B_LogEntry( TOPIC_GRIMGASH , " Someone kicked Pepe's leg and dragged one of his sheep away. He didn't see who it was, but it looks like something very strong. I should deal with this and, if possible, return the sheep to Pepe . " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"brokenleg");
	Wld_InsertNpc(gobbo_grandwarrior_uniq,"FP_ROAM_NW_BIGFARMFORESTCAVE_02");
};

instances DIA_BAU_912_PEPE_GRIMGASH (C_Info)
{
	npc = Bau_912_Pepe;
	nr = 1;
	condition = dia_bau_912_pepe_grimgash_condition;
	information = dia_bau_912_pepe_grimgash_info;
	permanent = FALSE;
	description = " I found your sheep. " ;
};

func int dia_bau_912_pepe_grimgash_condition()
{
	if (( MIS_GRIMGASH  == LOG_Running ) && Npc_IsDead ( gobbo_grandwarrior_unique ) && ( Npc_HasItems ( other , itat_sheepgrimgash ) >=  1 )) .
	{
		return TRUE;
	};
};

func void dia_bau_912_pepe_grimgash_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Bau_912_Pepe_GRIMGASH_01_01 " );	// I found your sheep. More precisely, what was left of her.
	B_GiveInvItems(other,self,itat_sheepgrimgash,1);
	Npc_RemoveInvItems(self,itat_sheepgrimgash,1);
	AI_Output(self,other, " DIA_Bau_912_Pepe_GRIMGASH_01_02 " );	// Damn! It turns out that Onar has one less sheep. Did you find the thief?
	AI_Output(other,self, " DIA_Bau_912_Pepe_GRIMGASH_01_03 " );	// It turned out to be a huge black goblin. Looks like he kicked you in the leg.
	AI_Output(self,other, " DIA_Bau_912_Pepe_GRIMGASH_01_04 " );	// O Innos! It doesn't get any easier does it. And you killed it?
	AI_Output(other,self, " DIA_Bau_912_Pepe_GRIMGASH_01_05 " );	// Of course! Otherwise, how do you think I got this sheepskin?
	AI_Output(self,other, " DIA_Bau_912_Pepe_GRIMGASH_01_06 " );	// Okay. At least it won't bother me and my sheep anymore.
	AI_Output(self,other, " DIA_Bau_912_Pepe_GRIMGASH_01_07 " );	// Here, take some sheep's cheese and goat's milk.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(hero,ItFo_Cheese,3);
	CreateInvItems(hero,ItFo_Milk,3);
	AI_Output(self,other, " DIA_Bau_912_Pepe_GRIMGASH_01_08 " );	// Sorry, but that's all I have.
	MIS_GRIMGASH = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GRIMGASH,LOG_SUCCESS);
	B_LogEntry( TOPIC_GRIMGASH , " I told Pepe about the goblin who stole his sheep. Pepe gave me some cheese and a few bottles of milk as a token of his gratitude. " );
};

DIA_PEPE_LECHENIE (C_Info) instances
{
	npc = Bau_912_Pepe;
	nr = 1;
	condition = dia_pepe_lechenie_condition;
	information = dia_pepe_lechenie_info;
	permanent = FALSE;
	important = TRUE;
};

func int dia_pepe_lechenie_condition()
{
	if ((Capital >=  2 ) && ( MIS_GRIMGASH  ==  LOG_SUCCESS ))
	{
		return TRUE;
	};
};

func void dia_pepe_lechenie_info()
{
	AI_Output(self,other, " DIA_Pepe_Lechenie_01_01 " );	// Hey, wait...
	AI_Output(other,self, " DIA_Pepe_Lechenie_01_02 " );	// What?
	AI_Output(self,other, " DIA_Pepe_Lechenie_01_03 " );	// Look, that filthy goblin hit my leg so hard that I can hardly move anymore!
	AI_Output(self,other, " DIA_Pepe_Lechenie_01_04 " );	// It's turned blue. Every day I get worse and worse.
	AI_Output(self,other, " DIA_Pepe_Lechenie_01_05 " );	// If things go on like this, I'll be bedridden.
	AI_Output(self,other, " DIA_Pepe_Lechenie_01_06 " );	// Which means no more job on the farm.
	AI_Output(other,self, " DIA_Pepe_Lechenie_01_07 " );	// You just need good medicine.
	AI_Output(self,other, " DIA_Pepe_Lechenie_01_08 " );	// Unfortunately, normal potions don't work. Something special is needed here.
	AI_Output(self,other, " DIA_Pepe_Lechenie_01_09 " );	// Please help me. I have no one else to ask for help.
	Info_ClearChoices(dia_pepe_lechenie);
	Info_AddChoice(dia_pepe_lechenie, " I'll find a cure for you. " ,dia_pepe_lechenie_yes);
	Info_AddChoice(dia_pepe_lechenie, " Take care of your own leg. " ,dia_pepe_lechenie_no);
};

func void day_pepe_milk_yes()
{
	AI_Output(other,self, " DIA_Pepe_Lechenie_yes_01_00 " );	// Okay, I'll find the right medicine for you.
	AI_Output(self,other, " DIA_Pepe_Lechenie_yes_01_01 " );	// Thank you very much. I will wait for you here.
	MIS_LECHENIEPEPE = LOG_Running;
	Log_CreateTopic(TOPIC_LECHENIEPEPE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LECHENIEPEPE,LOG_Running);
	B_LogEntry( TOPIC_LECHENIEPEPE , " Pepe is still tinkering with his leg. He wants to find something to heal his wound. " );
	AI_StopProcessInfos(self);

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(Warg, " FP_ROAM_NW_SAGITTA_MOREMONSTER_01 " );
		Wld_InsertNpc(Warg, " FP_ROAM_NW_SAGITTA_MOREMONSTER_03 " );
		Wld_InsertNpc(Warg,"FP_ROAM_NW_WOOD_MONSTER_05_01");
		Wld_InsertNpc(Warg,"FP_ROAM_NW_WOOD_MONSTER_05_03");
		Wld_InsertNpc(Shadowbeast,"FP_STAND_DEMENTOR_KDF_05");
	};
};

func void dia_pepe_lechenie_no()
{
	AI_Output(other,self, " DIA_Pepe_Lechenie_no_01_00 " );	// Take care of your leg yourself. I'm not a healer.
	AI_Output(self,other, " DIA_Pepe_Lechenie_no_01_01 " );	// Okay, sorry to bother you.
	AI_StopProcessInfos(self);
};

instances DIA_PEPE_PLACEBO (C_Info)
{
	npc = Bau_912_Pepe;
	nr = 1;
	condition = dia_pepe_placebo_condition;
	information = dia_pepe_placebo_info;
	permanent = FALSE;
	description = " I brought you some medicine. " ;
};

func int dia_pepe_placebo_condition()
{
	if (( MIS_LECHENIEPEPE  == LOG_Running ) && ( Npc_KnowsInfo ( hero , dia_sagitta_placebo )) && ( Npc_HasItems ( hero , ItPo_Health_01 ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void dia_pepe_placebo_info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Pepe_Placebo_01_01 " );	// I brought you medicine.
	AI_Output(self,other, " DIA_Pepe_Placebo_01_02 " );	// Umm... where does it come from?
	AI_Output(other,self, " DIA_Pepe_Placebo_01_03 " );	// This elixir was brewed by Healer Sagitta especially for you.
	AI_Output(other,self, " DIA_Pepe_Placebo_01_04 " );	// The strongest potion that can revive even an old sick troll. And your leg will be cured instantly!
	AI_Output(self,other, " DIA_Pepe_Placebo_01_06 " );	// The forest hag? If you say so...
	AI_Output(self,other, " DIA_Pepe_Placebo_01_07 " );	// I'll drink demon piss if it means this pain goes away.
	AI_Output(other,self, " DIA_Pepe_Placebo_01_08 " );	// Here, take this.
	B_GiveInvItems(other,self,ItPo_Health_01,1);
	B_UseItem(self,ItPo_Health_01);
	AI_Output(self,other, " DIA_Pepe_Placebo_01_09 " );	// Mmmm... Great! I can already feel the pain lessening.
	AI_Output(self,other, " DIA_Pepe_Placebo_01_10 " );	// Thanks for helping me again.
	AI_Output(other,self, " DIA_Pepe_Placebo_01_11 " );	// I couldn't just leave you to suffer could I?
	AI_Output(self,other, " DIA_Pepe_Placebo_01_12 " );	// But be that as it may, here, take some gold.
	B_GiveInvItems(self,other,ItMi_Gold,50);
	AI_Output(self,other, " DIA_Pepe_Placebo_01_13 " );	// That's all I have.
	MIS_LECHENIEPEPE = LOG_SUCCESS ;
	Log_SetTopicStatus(TOPIC_LECHENIEPEPE,LOG_SUCCESS);
	B_LogEntry( TOPIC_LECHENIEPEPE , " Sagitta's potion worked. Pepe was cured. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};
