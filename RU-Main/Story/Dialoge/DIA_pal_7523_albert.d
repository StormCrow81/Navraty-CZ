

instance DIA_PAL_7523_EXIT(C_Info)
{
	npc = pal_7523_albert;
	nr = 999;
	condition = dia_pal_7523_exit_condition;
	information = dia_pal_7523_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_pal_7523_exit_condition()
{
	return TRUE;
};

func void dia_pal_7523_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PAL_7523_GREET(C_Info)
{
	npc = pal_7523_albert;
	nr = 2;
	condition = dia_pal_7523_greet_condition;
	information = dia_pal_7523_greet_info;
	important = TRUE;
};


func int dia_pal_7523_greet_condition()
{
	if ( CAPITALORCATC  ==  FALSE )
	{
		return TRUE;
	};
};

func void dia_pal_7523_greet_info()
{
	AI_Output(self,other, " DIA_PAL_7523_Greet_01_00 " );	// Who are you?! And how did you get here?
	AI_Output(other,self, " DIA_PAL_7523_Greet_01_01 " );	// I'm from the castle, scouting the area.
	AI_Output(self,other, " DIA_PAL_7523_Greet_01_02 " );	// Have you been to the castle?! And how is it?

	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(other,self, " DIA_PAL_7523_Greet_01_03 " );	// Orcs have stormed the castle!
		AI_Output(self,other, " DIA_PAL_7523_Greet_01_04 " );	// Oh, Innos! Why are we being attacked like this?
		AI_Output(self,other, " DIA_PAL_7523_Greet_01_05 " );	// Although this is terrible news, I thank you for it.
		AI_Output(self,other, " DIA_PAL_7523_Greet_01_06 " );	// Now it makes no sense to send for help to Garond - we must break through ourselves.
	}
	else
	{
		AI_Output(other,self, " DIA_PAL_7523_Greet_01_07 " );	// No good. Orcs still keep him in a tight ring.
		AI_Output(other,self, " DIA_PAL_7523_Greet_01_08 " );	// And every week new reinforcements come to them.
		AI_Output(self,other, " DIA_PAL_7523_Greet_01_09 " );	// This is bad! We will not be able to break into the castle to fight there along with everyone.
		AI_Output(self,other, " DIA_PAL_7523_Greet_01_11 " );	// Okay. But in that case, can you give us a little help?
		AI_Output(self,other, " DIA_PAL_7523_Greet_01_13 " );	// It is necessary to take a message to the castle about where we are and how many of us.
		AI_Output(other,self, " DIA_PAL_7523_Greet_Ok_01_01 " );	// Okay, I'll let Garond know about you.
		AI_Output(self,other, " DIA_PAL_7523_Greet_Ok_01_02 " );	// Thank you. Bless you Innos!
	};

	AlbertGroup = TRUE;

	if(MIS_LostPaladins == LOG_Running)
	{
		B_LogEntry(TOPIC_LostPaladins, " In the cave behind the orc fence, I found a group of paladins. " );
	};
};

instance DIA_PAL_7523_GREET2(C_Info)
{
	npc = pal_7523_albert;
	nr = 2;
	condition = dia_pal_7523_greet2_condition;
	information = dia_pal_7523_greet2_info;
	permanent = FALSE;
	description = " Isn't paladin Tandor from your squad by any chance? " ;
};

func int dia_pal_7523_greet2_condition()
{
	if ((AlbertGroup ==  TRUE ) && Npc_KnowsInfo(other,DIA_Tandor_Trupp) && ( CAPITALORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_pal_7523_greet2_info()
{
	AI_Output(other,self, " DIA_PAL_7523_Greet2_01_00 " );	// And paladin Tandor, by any chance, is not from your squad?
	AI_Output(self,other, " DIA_PAL_7523_Greet2_01_01 " );	// Yes, he was with us until we ran into the orc vanguard.
	AI_Output(self,other, " DIA_PAL_7523_Greet2_01_02 " );	// But unfortunately, after that battle, he went missing. Do you know anything about him?

	if (Npc_IsDead(tandor))
	{
		AI_Output(other,self, " DIA_PAL_7523_Greet2_01_03 " );	// I have bad news - he managed to get to the castle, but during one of the skirmishes with the orcs, he died.
		AI_Output(self,other, " DIA_PAL_7523_Greet2_01_04 " );	// Sad. Even though we thought he was already dead.
		AI_Output(self,other, " DIA_PAL_7523_Greet2_01_05 " );	// May Innos give peace to his soul!
	}
	else
	{
		AI_Output(other,self, " DIA_PAL_7523_Greet2_01_06 " );	// I have good news - he managed to get to the castle.
		AI_Output(self,other, " DIA_PAL_7523_Greet2_01_07 " );	// Oh, Innos! Truly, at least one good news for all this time.
		AI_Output(self,other, " DIA_PAL_7523_Greet2_01_08 " );	// Then tell him that his brothers in arms are all right too.
		SAYTOTANDORABOUTGROUP = TRUE;
	};
};

instance DIA_PAL_7523_GREET3(C_Info)
{
	npc = pal_7523_albert;
	nr = 2;
	condition = dia_pal_7523_greet3_condition;
	information = dia_pal_7523_greet3_info;
	permanent = FALSE;
	description = " I sent a message to Garond. " ;
};

func int dia_pal_7523_greet3_condition()
{
	if((MIS_FINDEDOCGROUP == LOG_Running) && (KAPITELORCATC == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_greet3_info()
{
	var C_Npc ritter1;
	var C_Npc ritter2;
	AI_Output(other,self, " DIA_PAL_7523_Greet3_01_00 " );	// I sent a message to Garond.
	AI_Output(self,other, " DIA_PAL_7523_Greet3_01_01 " );	// And what did he say?
	AI_Output(other,self, " DIA_PAL_7523_Greet3_01_02 " );	// He told you to keep your head down until Lord Hagen arrived in the valley with reinforcements.
	AI_Output(other,self, " DIA_PAL_7523_Greet3_01_03 " );	// And only then strike at the rear of the orcs.
	AI_Output(self,other, " DIA_PAL_7523_Greet3_01_04 " );	// All clear! In that case, we'll be ready.
	MIS_FINDEDOCGROUP = LOG_Success;
	Log_SetTopicStatus(TOPIC_FINDEDOCGROUP,LOG_Success);
	B_LogEntry_Quiet( TOPIC_FINDEDOCGROUP , " I reported Garonde's order to Albert. " );
	B_GivePlayerXP(XP_Ambient);
	Npc_ExchangeRoutine(self,"Prepare");
	ritter1 = Hlp_GetNpc(pal_7520_ritter);
	ritter2 = Hlp_GetNpc(pal_7521_ritter);

	if(Hlp_IsValidNpc(ritter1) && !Npc_IsDead(ritter1))
	{
		B_StartOtherRoutine(ritter1,"Prepare");
	};
	if(Hlp_IsValidNpc(ritter2) && !Npc_IsDead(ritter2))
	{
		B_StartOtherRoutine(ritter2,"Prepare");
	};
};


instance DIA_PAL_7523_FORESTBASE(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_forestbase_condition;
	information = dia_pal_7523_forestbase_info;
	permanent = FALSE;
	description = " What is your relationship with the camp above? " ;
};

func int dia_pal_7523_forestbase_condition()
{
	if (( HEROKNOWFORESTBASE  ==  TRUE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_pal_7523_forestbase_info()
{
	AI_Output(other,self, " DIA_PAL_7523_Forestbase_01_00 " );	// What is your relationship with the camp above?
	AI_Output(self,other, " DIA_PAL_7523_Forestbase_01_01 " );	// (arrogantly) Although they are all there and prisoners from this colony...
	AI_Output(self,other, " DIA_PAL_7523_Forestbase_01_02 " );	// ...but we still maintain constant contact with them - we trade and exchange fresh information.
	AI_Output(self,other, " DIA_PAL_7523_Forestbase_01_03 " );	// In any case - if the orcs attack, then we will surely have to fight shoulder to shoulder.
};


instance DIA_PAL_7523_PERM(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_perm_condition;
	information = dia_pal_7523_perm_info;
	permanent = TRUE;
	description = " How are things going? " ;
};


func int dia_pal_7523_perm_condition()
{
	if(Npc_KnowsInfo(hero,dia_pal_7523_greet))
	{
		return TRUE;
	};
};

func void dia_pal_7523_perm_info()
{
	AI_Output(other,self, " DIA_PAL_7523_Perm_01_00 " );	// How are things?
	if ( KAPITELORCATC  ==  TRUE )
	{
		AI_Output(self,other, " DIA_PAL_7523_Perm_01_01 " );	// I think you can see it very well...
		AI_StopProcessInfos(self);
	};
	if(Npc_KnowsInfo(hero,dia_pal_7523_greet3))
	{
		AI_Output(self,other, " DIA_PAL_7523_Perm_01_02 " );	// Not to say it's bad...
		AI_Output(self,other, " DIA_PAL_7523_Perm_01_03 " );	// We just have to wait until Lord Hagen arrives here with reinforcements.
		AI_Output(self,other, " DIA_PAL_7523_Perm_01_04 " );	// And then we'll hit the rear of the orcs! And I hope that we will succeed.
	}
	else
	{
		AI_Output(self,other, " DIA_PAL_7523_Perm_01_05 " );	// Now everything is calm here. Although this is just an appearance!
	};
};


instance DIA_PAL_7523_DRAKAR (C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_drakar_condition;
	info = dia_pal_7523_drakar_info;
	permanent = FALSE;
	description = " Is there anything else I can help you with? " ;
};


func int dia_pal_7523_drakar_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_pal_7523_greet3 ) && ( CAPITAL CATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_pal_7523_drakar_info()
{
	AI_Output(other,self, " DIA_PAL_7523_Drakar_01_00 " );	// Is there anything else I can help you with?
	AI_Output(self,other, " DIA_PAL_7523_Drakar_01_05 " );	// Eh... With each new day, more and more of these green-skinned creatures appear here.
	AI_Output(self,other, " DIA_PAL_7523_Drakar_01_06 " );	// Have you been by the sea? Have you seen the orc war drakar? Well, even if you haven't seen it, it's still there.
	AI_Output(self,other, " DIA_PAL_7523_Drakar_01_07 " );	// It is this vessel that brings their new and new powers here.
	AI_Output(self,other, " DIA_PAL_7523_Drakar_01_08 " );	// If things go on like this, they'll soon have full control of the situation here in the valley.
	AI_Output(self,other, " DIA_PAL_7523_Drakar_01_09 " );	// And Lord Hagen with reinforcements is unlikely to be able to help us - the numerical superiority of the orcs will have their say.
	AI_Output(other,self, " DIA_PAL_7523_Drakar_01_10 " );	// And what do you suggest?
	AI_Output(self,other, " DIA_PAL_7523_Drakar_01_11 " );	// If we somehow manage to get this tub stuck here, it will be a serious blow to the positions of the orcs.
	AI_Output(self,other, " DIA_PAL_7523_Drakar_01_12 " );	// At least for a while they'll be here without any support, and that's quite a lot!
	AI_Output(other,self, " DIA_PAL_7523_Drakar_01_13 " );	// And how do I do it? Do you want me to dig a hole in the board?
	AI_Output(self,other, " DIA_PAL_7523_Drakar_01_15 " );	// No! But the breakdown of some small gear in the steering mechanism turns it into a trough.
	AI_Output(self,other, " DIA_PAL_7523_Drakar_01_16 " );	// I'm sure you can find a weak spot in it.
	AI_Output(other,self, " DIA_PAL_7523_Drakar_01_18 " );	// I'll see what I can do.
	MIS_DRAKARBROKE = LOG_Running;
	Log_CreateTopic(TOPIC_DRAKARBROKE,LOG_MISSION);
	Log_SetTopicStatus( TOPIC_DRAKARBROKE ,LOG_Running);
	B_LogEntry( TOPIC_DRAKARBROKE , " Albert wants me to try to disable an orc war drakar that has anchored near the paladin camp. This will make it impossible for the orcs to transfer new units to the island. Albert himself does not know exactly how this can be done, but he certainly I'm sure it's possible. " );
};


instance DIA_PAL_7523_DRAKARDONE (C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_drakardone_condition;
	info = dia_pal_7523_drakardone_info;
	permanent = FALSE;
	description = " About the orc drakar... " ;
};


func int dia_pal_7523_drakardone_condition()
{
	if (( MIS_DRAKARBROKE  == LOG_Running) && ( DRAKARISBROKEN  ==  TRUE ) && ( KAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_pal_7523_drakardone_info()
{
	B_GivePlayerXP(400);
	AI_Output(other,self, " DIA_PAL_7523_DrakarDone_01_00 " );	// As for the orc drakar...
	AI_Output(other,self, " DIA_PAL_7523_DrakarDone_01_02 " );	// I'm sure that now this ship is unlikely to sail anywhere.
	AI_Output(self,other, " DIA_PAL_7523_DrakarDone_01_04 " );	// Are you serious? Well then, this is very good news!
	AI_Output(self,other, " DIA_PAL_7523_DrakarDone_01_05 " );	// This means that the flow of incoming orcs will decrease, and this will certainly weaken their position.
	AI_Output(self,other, " DIA_PAL_7523_DrakarDone_01_06 " );	// We just have to wait for Lord Hagen with reinforcements. And then we'll kick these creatures out of here!
	MIS_DRAKARBROKE = LOG_SUCCESS ;
	Log_SetTopicStatus( TOPIC_DRAKARBROKE , LOG_SUCCESS );
	B_LogEntry( TOPIC_DRAKARBROKE , " Albert was delighted to hear that the orc drakar was badly damaged. " );
};


instance DIA_PAL_7523_ORCORDER(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_orcorder_condition;
	information = dia_pal_7523_orcorder_info;
	permanent = FALSE;
	description = " I have something for you. " ;
};

func int dia_pal_7523_orcorder_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_pal_7523_drakar ) && ( KNOWSTARANBUILD  ==  FALSE ) && ( FLAG_ORCS_DRAKAR  ==  TRUE ) && ( Npc_IsDead ( NONE_110_Urshak ) ==  FALSE ) && ( Npc_HasItems ( hero , itwr_orcsorder ) >= K APEL  = FALSE 1 ) && SE  )) 
	{
		return TRUE;
	};
};

func void dia_pal_7523_orcorder_info()
{
	AI_Output(other,self, " DIA_PAL_7523_OrcOrder_01_00 " );	// I have something for you.
	AI_Output(other,self, " DIA_PAL_7523_OrcOrder_01_01 " );	// Here is the letter with notes - I found it in the possession of an elite orc aboard a drakar.
	AI_Output(self,other, " DIA_PAL_7523_OrcOrder_01_02 " );	// Hmmm...(with interest) Let me take a look!
	B_GiveInvItems(other,self,itwr_orcsorder,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_PAL_7523_OrcOrder_01_04 " );	// Well, well... Apparently, these records are made in the language of the orcs. I've seen things like this before.
	AI_Output(other,self, " DIA_PAL_7523_OrcOrder_01_05 " );	// (sarcastically) I thought the handwriting was illegible.
	AI_Output(self,other, " DIA_PAL_7523_OrcOrder_01_06 " );	// (not reacting) By the way, pay attention - these letters bear their military stamp.
	AI_Output(self,other, " DIA_PAL_7523_OrcOrder_01_08 " );	// So this is a military document! And it certainly contains information about the plans of the orcs.
	AI_Output(other,self, " DIA_PAL_7523_OrcOrder_01_10 " );	// Okay, give me a letter, I'll think of something.
	AI_Output(self,other, " DIA_PAL_7523_OrcOrder_01_11 " );	// Going to catch an orc and extort him? (laughs)
	B_GiveInvItems(self,other,itwr_orcsorder,1);
	MIS_ORCORDER = LOG_Running;
	Log_CreateTopic(TOPIC_ORCORDER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ORCORDER,LOG_Running);
	B_LogEntry( TOPIC_ORCORDER , " I showed Albert a letter that I found on an elite orc aboard a drakar. Judging by his words, these entries are of great importance to the orcs, since the letter bears their military brand. Now we need to find out what exactly it is about in this letter. I need to find someone who will help me translate this letter. " );
};


instance DIA_PAL_7523_ORCORDERPROGRESS(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_orcorderprogress_condition;
	information = dia_pal_7523_orcorderprogress_info;
	permanent = FALSE;
	description = " I found out what the orc letter says. " ;
};


func int dia_pal_7523_orcorderprogress_condition()
{
	if (( MY_ORDER  == LOG_Running ) && ( KNOWSTARANBUILD  ==  TRUE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_pal_7523_orcorderprogress_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_PAL_7523_OrcOrderProgress_01_00 " );	// I found out what the orcs' letter said.
	AI_Output(other,self, " DIA_PAL_7523_OrcOrderProgress_01_01 " );	// Orcs won't leave the valley until they've captured the fortress.
	AI_Output(self,other, " DIA_PAL_7523_OrcOrderProgress_01_02 " );	// Also news to me, even a goblin understands this.
	AI_Output(other,self, " DIA_PAL_7523_OrcOrderProgress_01_03 " );	// And most importantly, for this they sent a detachment of slaves here, who will have to make a new battering ram for them.
	AI_Output(other,self, " DIA_PAL_7523_OrcOrderProgress_01_04 " );	// When it's finished, the orcs will storm the castle again!
	AI_Output(self,other, " DIA_PAL_7523_OrcOrderProgress_01_05 " );	// Damn! If so, then Garond and his men would have no chance of holding back their onslaught.
	AI_Output(self,other, " DIA_PAL_7523_OrcOrderProgress_01_06 " );	// This can't be allowed! Where is this group now?
	AI_Output(other,self, " DIA_PAL_7523_OrcOrderProgress_01_07 " );	// Looks like it's heading towards the orc positions.
	AI_Output(self,other, " DIA_PAL_7523_OrcOrderProgress_01_08 " );	// Then you must stop him at all costs! These slaves must not reach the fortress!
	AI_Output(self,other, " DIA_PAL_7523_OrcOrderProgress_01_10 " );	// I'll give you some of my best people. Now go!
	B_LogEntry( TOPIC_ORCORDER , " I told Albert about the contents of the orc letter. He ordered me to go look for this unit, giving me some of his people. " );
	Wld_InsertNpc(orcslave_01,"FP_ROAM_ORCSLAVETEAM_01");
	Wld_InsertNpc(orcslave_02,"FP_ROAM_ORCSLAVETEAM_02");
	Wld_InsertNpc(orcslave_03,"FP_ROAM_ORCSLAVETEAM_03");
	Wld_InsertNpc(orcslave_04,"FP_ROAM_ORCSLAVETEAM_04");
	Wld_InsertNpc(orcslave_05,"FP_ROAM_ORCSLAVETEAM_05");
	Wld_InsertNpc(orcslave_06,"FP_ROAM_ORCSLAVETEAM_06");
	Wld_InsertNpc(orcslave_07,"FP_ROAM_ORCSLAVETEAM_07");
	Wld_InsertNpc(orcslave_08,"FP_ROAM_ORCSLAVETEAM_08");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORCSLAVEGUARD_01");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORCSLAVEGUARD_02");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORCSLAVEGUARD_04");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORCSLAVEGUARD_05");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ORCSLAVEGUARD_03");
	GOTOKILLORCSLAVES = TRUE;
};

instance DIA_PAL_7523_ORCORDERDONE(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_orcorderdone_condition;
	information = dia_pal_7523_orcorderdone_info;
	permanent = FALSE;
	description = " Orc squad is finished! " ;
};

func int dia_pal_7523_orcorderdone_condition()
{
	if (( MY_ORDER  == LOG_Running ) && ( GOTOKILLORCSLAVESDONE  ==  TRUE ) && ( CAPITELORCATC  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_pal_7523_orcorderdone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_PAL_7523_OrcOrderDone_01_00 " );	// Orc squad is done!
	AI_Output(self,other, " DIA_PAL_7523_OrcOrderDone_01_01 " );	// Great! This is the best news you could bring.
	AI_Output(self,other, " DIA_PAL_7523_OrcOrderDone_01_02 " );	// Now our brothers in the fortress have nothing to fear from the assault.
	AI_Output(self,other, " DIA_PAL_7523_OrcOrderDone_01_03 " );	// And let the orcs gnaw at the stones of the castle with their teeth, trying to make a breach in them.
	AI_Output(self,other, " DIA_PAL_7523_OrcOrderDone_01_05 " );	// As for you, in my opinion, you deserve a generous reward for your labors.
	AI_Output(self,other, " DIA_PAL_7523_OrcOrderDone_01_06 " );	// Unfortunately... I don't have enough gold to make this look like a worthy reward for you.
	AI_Output(self,other, " DIA_PAL_7523_OrcOrderDone_01_07 " );	// But I think I can thank you in a different way.
	AI_Output(self,other, " DIA_PAL_7523_OrcOrderDone_01_09 " );	// Here... (proudly) Take this precious ring.
	CreateInvItems(self,itri_innosjudge,1);
	B_GiveInvItems(self,other,itri_innosjudge,1);
	AI_Output(self,other, " DIA_PAL_7523_OrcOrderDone_01_10 " );	// I got it from the hands of King Rhobar himself!
	AI_Output(self,other, " DIA_PAL_7523_OrcOrderDone_01_11 " );	// Usually, only the most courageous warriors of Innos are rewarded with such things!
	if(other.guild != GIL_PAL)
	{
		AI_Output(self,other, " DIA_PAL_7523_OrcOrderDone_01_12 " );	// Although you are not a paladin, you rightfully deserve this honor! Wear it with pride.
	}
	else
	{
		AI_Output(self,other, " DIA_PAL_7523_OrcOrderDone_01_13 " );	// You rightfully deserve this honor! Wear it with pride.
	};
	AI_Output(other,self,"DIA_PAL_7523_OrcOrderDone_01_14");	//Спасибо.
	MIS_ORCORDER = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ORCORDER,LOG_SUCCESS);
	B_LogEntry( TOPIC_ORCORDER , " I informed Albert that the orc troop had been destroyed. He gave me Innos' Valor ring, an item reserved only for the bravest paladins. " );
	if ( ! Npc_IsDead(pal_7518_ritter))
	{
		Npc_ExchangeRoutine(pal_7518_ritter,"Start");
		AI_Teleport(pal_7518_ritter,"WP_COAST_CAMP_01_ORCTEAM");
	};
	if ( ! Npc_IsDead(pal_7519_ritter))
	{
		Npc_ExchangeRoutine(pal_7519_ritter,"Start");
		AI_Teleport(pal_7519_ritter,"WP_COAST_CAMP_02_ORCTEAM");
	};
};


instance DIA_PAL_7523_LEADER(C_Info)
{
	npc = pal_7523_albert;
	nr = 3;
	condition = dia_pal_7523_leader_condition;
	information = dia_pal_7523_leader_info;
	permanent = FALSE;
	description = " Who is in charge now? " ;
};


func int dia_pal_7523_leader_condition()
{
	if (( CAPITELORCATC  ==  TRUE ) && ( PALADINCASTELFREE  ==  FALSE ) && ( COMMANDPALOW  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_pal_7523_leader_info()
{
	AI_Output(other,self, " DIA_PAL_7523_Leader_01_00 " );	// Who is in charge now?
	AI_Output(self,other, " DIA_PAL_7523_Leader_01_01 " );	// Our squad is now led by the paladin Nathan, since he is the most senior of us in rank.
	AI_Output(other,self,"DIA_PAL_7523_Leader_01_03");	//Ясно.
	COMMANDPALOW = TRUE;
};


instance DIA_PAL_7523_HOWHERE(C_Info)
{
	npc = pal_7523_albert;
	nr = 1;
	condition = dia_pal_7523_howhere_condition;
	information = dia_pal_7523_howhere_info;
	permanent = FALSE;
	description = " How did you get here? " ;
};


func int dia_pal_7523_howhere_condition()
{
	if((KAPITELORCATC == TRUE) && (PALADINCASTELFREE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pal_7523_howhere_info()
{
	AI_Output(other,self, " DIA_PAL_7523_HowHere_01_00 " );	// How did you get here?
	AI_Output(self,other, " DIA_PAL_7523_HowHere_01_01 " );	// It was Garond's order! He sent a messenger with the message that the orcs were planning another assault.
	AI_Output(self,other, " DIA_PAL_7523_HowHere_01_02 " );	// We were ordered to advance towards the castle as soon as possible in order to deliver a sudden blow to the orcs in the rear.
	AI_Output(other,self, " DIA_PAL_7523_HowHere_01_03 " );	// And how did it go?
	AI_Output(self,other, " DIA_PAL_7523_HowHere_01_04 " );	// Trust me - the plan was good... (with annoyance) But, unfortunately, our help arrived too late!
	AI_Output(self,other, " DIA_PAL_7523_HowHere_01_06 " );	// On the way to the besieged fortress, our squad was ambushed by orcs.
	AI_Output(self,other, " DIA_PAL_7523_HowHere_01_07 " );	// There were not many of them, but precious time was lost!
	AI_Output(self,other, " DIA_PAL_7523_HowHere_01_08 " );	// When we approached the fortress, the orc battle banner was already unfolding on it.
	AI_Output(self,other, " DIA_PAL_7523_HowHere_01_09 " );	// Realizing the hopelessness of the situation, I ordered my people to retreat, and having reached this place, I took up defense here.
	AI_Output(other,self, " DIA_PAL_7523_HowHere_01_10 " );	// And why exactly in this place?
	AI_Output(self,other, " DIA_PAL_7523_HowHere_01_11 " );	// Because the road narrows here, and it would be easier for us to defend ourselves if the orcs swooped in here.
	AI_Output(self,other, " DIA_PAL_7523_HowHere_01_12 " );	// But so far this hasn't happened.
	AI_Output(other,self,"DIA_PAL_7523_HowHere_01_13");	//Понятно.
};

