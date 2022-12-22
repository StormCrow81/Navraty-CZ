

instance XBS_7513_DARRION_EXIT(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 999;
	condition = xbs_7513_darrion_exit_condition;
	information = xbs_7513_darrion_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int xbs_7513_darrion_exit_condition()
{
	return TRUE;
};

func void xbs_7513_darrion_exit_info()
{
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
	AI_StopProcessInfos(self);
};


instance XBS_7513_DARRION_NO_TALK(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_no_talk_condition;
	information = xbs_7513_darrion_no_talk_info;
	permanent = TRUE;
	important = TRUE;
};


func int xbs_7513_darrion_no_talk_condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_no_talk_info()
{
	B_Say(self,other,"$SPAREME");
	B_Say(self,other,"$NEVERENTERROOMAGAIN");
	AI_StopProcessInfos(self);
};


instance XBS_7513_DARRION_PICKPOCKET(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 900;
	condition = xbs_7513_darrion_pickpocket_condition;
	information = xbs_7513_darrion_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int xbs_7513_darrion_pickpocket_condition()
{
	return  C_Robbery ( 85 , 102 );
};

func void xbs_7513_darrion_pickpocket_info()
{
	Info_ClearChoices(xbs_7513_darrion_pickpocket);
	Info_AddChoice(xbs_7513_darrion_pickpocket,Dialog_Back,xbs_7513_darrion_pickpocket_back);
	Info_AddChoice(xbs_7513_darrion_pickpocket,DIALOG_PICKPOCKET,xbs_7513_darrion_pickpocket_doit);
};

func void xbs_7513_darrion_pickpocket_doit()
{
	B_Robbery();
	Info_ClearChoices(xbs_7513_darrion_pickpocket);
};

func void xbs_7513_darrion_pickpocket_back()
{
	Info_ClearChoices(xbs_7513_darrion_pickpocket);
};


instance XBS_7513_DARRION_HI(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_hi_condition;
	information = xbs_7513_darrion_hi_info;
	permanent = FALSE;
	description = " How are you, Master? " ;
};

func int xbs_7513_darrion_hi_condition()
{
	return TRUE;
};

func void xbs_7513_darrion_hi_info()
{
	AI_Output(other,self, " XBS_7513_Darrion_Hi_15_00 " );	// How are you, master?
	AI_Output(self,other, " XBS_7513_Darrion_Hi_06_01 " );	// Everything is as it should be.
	AI_Output(other,self, " XBS_7513_Darrion_Hi_15_02 " );	// You don't remember me?
	AI_Output(self,other, " XBS_7513_Darrion_Hi_06_03 " );	// You seem familiar... My mind is not what it used to be I suppose.
	AI_Output(other,self, " XBS_7513_Darrion_Hi_15_04 " );	// Can I buy weapons or blacksmithing accessories from you?
	AI_Output(self,other, " XBS_7513_Darrion_Hi_06_06 " );	// Of course. But only when I'm in the forge.
	AI_Output(self,other, " XBS_7513_Darrion_Hi_06_07 " );	// In the evening I rest - we don't work too hard here.
	Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
	B_LogEntry( TOPIC_XBS , " Darrion trades forge materials and lockpicks. But only when he's in the forge. " );
};


instance XBS_7513_DARRION_BLITZ(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 2;
	condition = xbs_7513_darrion_blitz_condition;
	information = xbs_7513_darrion_blitz_info;
	permanent = FALSE;
	description = " How did you get into these mountains? " ;
};


func int xbs_7513_darrion_blitz_condition()
{
	if ( Npc_KnowsInfo ( other , xbs_7513_darrion_hi ) )
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_blitz_info()
{
	AI_Output(other,self, " XBS_7513_Darrion_Blitz_15_00 " );	// Tell me, how did you get into these mountains?
	AI_Output(self,other, " XBS_7513_Darrion_Blitz_06_01 " );	// The day the Barrier fell, the camp fell into chaos.
	AI_Output(self,other, " XBS_7513_Darrion_Blitz_06_02 " );	// Few have retained remnants of their minds. Those who managed to do that are now here for the most part.
	AI_Output(other,self, " XBS_7513_Darrion_Blitz_15_03 " );	// What did you do?
	AI_Output(self,other, " XBS_7513_Darrion_Blitz_06_04 " );	// For a while, like everyone else, I was running around, losing my mind. Until I came across Netback.
	AI_Output(self,other, " XBS_7513_Darrion_Blitz_06_05 " );	// He was probably the only calm person in the valley. And I followed him.
	AI_Output(self,other, " XBS_7513_Darrion_Blitz_06_06 " );	// Now I am a blacksmith and far from his trees. That's why I'm here.
};


instance XBS_7513_DARRION_TRADE(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 888;
	condition = xbs_7513_darrion_trade_condition;
	information = xbs_7513_darrion_trade_info;
	permanent = TRUE;
	trade = TRUE;
	description = DIALOG_TRADE;
};

func int xbs_7513_darrion_trade_condition()
{
	if(Npc_KnowsInfo(other,xbs_7513_darrion_hi) && (Npc_GetDistToWP(self,"WP_COAST_FOREST_118") < 1000))
	{
		return TRUE;
	};
};

var int darionday;

func void xbs_7513_darrion_trade_info()
{
	where int daynow;

	daynow = Wld_GetDay();

	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	B_Say(other,self,"$TRADE_3");
	B_GiveTradeInv(self);
	Npc_RemoveInvItems(self,itmiswordrawhot_1,Npc_HasItems(self,itmiswordrawhot_1));
	Npc_RemoveInvItems(self,itmiswordblade_1,Npc_HasItems(self,itmiswordblade_1));
	Npc_RemoveInvItems(self,ItMiSwordbladehot,Npc_HasItems(self,ItMiSwordbladehot));
	Npc_RemoveInvItems(self,ItMw_1H_AssBlade_View,Npc_HasItems(self,ItMw_1H_AssBlade_View));
};


instance DIA_DARRION_ARMORCANTEACH(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 5;
	condition = dia_darrion_armorcanteach_condition;
	information = dia_darrion_armorcanteach_info;
	permanent = TRUE;
	description = " I heard that you're the only one who can forge Guardian armor. " ;
};


func int dia_darrion_armorcanteach_condition()
{
	if((DARRION_TEACHARMOR == FALSE) && (hero.guild == GIL_TPL))
	{
		return TRUE;
	};
};

func void dia_darrion_armorcanteach_info()
{
	AI_Output(other,self, " DIA_Darrion_ArmorCanTeach_01_00 " );	// I heard you're the only one who can forge Guardian armor.
	AI_Output(self,other, " DIA_Darrion_ArmorCanTeach_01_01 " );	// That's true, since I was the only blacksmith in the swamps. I had to forge armor for all the brothers, and even for Kor-Angar himself.
	AI_Output(other,self, " DIA_Darrion_ArmorCanTeach_01_02 " );	// Can you teach me this trade?
	AI_Output(self,other, " DIA_Darrion_ArmorCanTeach_01_03 " );	// Well, why not. I could show you some ways to upgrade your armor.
	AI_Output(self,other, " DIA_Darrion_ArmorCanTeach_01_04 " );	// But for this, you must have a good understanding of forging.

	if(Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0)
	{
		AI_Output(other,self, " DIA_Darrion_ArmorCanTeach_01_05 " );	// I'm pretty good at forging.
		AI_Output(self,other, " DIA_Darrion_ArmorCanTeach_01_06 " );	// Well, then we can start at least now.
		AI_Output(self,other, " DIA_Darrion_ArmorCanTeach_01_07 " );	// But I'll tell you right away: nothing is free.
	}
	else
	{
		AI_Output(self,other, " DIA_Darrion_ArmorCanTeach_01_09 " );	// As I see it, you are a real natural at this!
		AI_Output(self,other, " DIA_Darrion_ArmorCanTeach_01_10 " );	// Here's the thing, man. First, learn the basics of blacksmithing. And then we'll talk about your training.
		AI_Output(self,other, " DIA_Darrion_ArmorCanTeach_01_11 " );	// And I’ll say right away: I won’t do this for free.
	};
	DARRION_TEACHARMOR = TRUE;
	Log_CreateTopic(TOPIC_ARMORTEACHER,LOG_NOTE);
	B_LogEntry( TOPIC_ARMORTEACHER , " Darrion can teach me how to upgrade Swamp Brotherhood armor. " );
};

func void b_darrion_teacharmor_4()
{
	AI_Output(self,other, " DIA_Darrion_TeachArmor_4_01_01 " );	// Well, let's get started. Make sure you have all the necessary materials at hand. You take a heated steel billet ...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"WP_COAST_FOREST_117");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Darrion_TeachArmor_4_01_02 " );	// ...on an anvil you give it the shape of a plate and forge a piece of magic ore into it...
		AI_Output(self,other, " DIA_Darrion_TeachArmor_4_01_03 " );	// ...then you make fasteners and connect the plate to them, carefully forging the places of convergence...
		AI_Output(self,other, " DIA_Darrion_TeachArmor_4_01_04 " );	// ...after that, you carefully fasten the resulting element to the body of the armor - like this... look...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other,"DIA_Darrion_TeachArmor_4_01_05");	//...готово!
		AI_Output(self,other, " DIA_Darrion_TeachArmor_4_01_06 " );	// That's all you need to know to upgrade this armor.
	};
};

func void b_darrion_teacharmor_5()
{
	AI_Output(self,other, " DIA_Darrion_TeachArmor_5_01_01 " );	// It will take a lot of time and effort to create this armor, but it's worth it...
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"WP_COAST_FOREST_117");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Darrion_TeachArmor_5_01_02 " );	// ...take a hot steel billet and divide it into two equal parts...
		AI_Output(self,other, " DIA_Darrion_TeachArmor_5_01_03 " );	// ...process each of them with magical ore chips, then fasten both parts together and forge the vanishing points...
		AI_Output(self,other, " DIA_Darrion_TeachArmor_5_01_04 " );	// ...the resulting element is fastened to the armor on the sides using a metal plate... see how I do it...
		AI_Output(self,other, " DIA_Darrion_TeachArmor_5_01_05 " );	// ...you see how clearly he sat down, practically flowing around the surface of the armor. Strengthen the fastening with metal bolts and ...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other, " DIA_Darrion_TeachArmor_5_01_06 " );	// ...everything, the armor is ready.
	};
};

func void b_darrion_teacharmor_6()
{
	AI_Output(self,other, " DIA_Darrion_TeachArmor_6_01_01 " );	// With this knowledge, you will be able to make an incredibly durable and reliable armor.
	if(!C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT) && Wld_IsMobAvailable(self,"BSANVIL"))
	{
		AI_SetWalkMode(self,NPC_WALK);
		AI_GotoWP(self,"WP_COAST_FOREST_117");
		AI_AlignToWP(self);
		AI_UseMob(self,"BSANVIL",5);
		AI_Output(self,other, " DIA_Darrion_TeachArmor_6_01_02 " );	// Watch carefully and remember. You take a hot steel billet and on the anvil you give it the shape of a plate ...
		AI_Output(self,other, " DIA_Darrion_TeachArmor_6_01_03 " );	// ...cover the resulting element with magical ore chips and apply a layer of resin solution on top...
		AI_Output(self,other, " DIA_Darrion_TeachArmor_6_01_04 " );	// ...you fasten two of these plates with steel bolts and attach them to the armor frame... this is how I do it...
		AI_Output(self,other, " DIA_Darrion_TeachArmor_6_01_05 " );	// ...this will add strength to the attachment points of all armor elements. We knock out the contour of the armor a little more and ...
		AI_UseMob(self,"BSANVIL",-1);
		B_TurnToNpc(self,other);
		AI_Output(self,other, " DIA_Darrion_TeachArmor_6_01_06 " );	// ...that's it, the armor is ready!
		AI_Output(self,other, " DIA_Darrion_TeachArmor_6_01_07 " );	// Now you know everything I could teach you. Try to apply the acquired knowledge in practice.
	};
};

func void b_darrionarmorchoices()
{
	Info_ClearChoices(dia_darrion_armorteach);
	Info_AddChoice(dia_darrion_armorteach,Dialog_Back,dia_darrion_armorteach_back);

	if((PLAYER_TALENT_SMITH[29] == FALSE) && (BuyTemplerLight == TRUE))
	{
		Info_AddChoice(dia_darrion_armorteach,B_BuildLearnStringEx( " Guardian Light Armor (Training Cost: 3000 Coins " ,B_GetLearnCostTalent(other, NPC_TALENT_SMITH , WEAPON_ITAR_TPL_L_V1 )),dia_darrion_armorteach_itar_tpl_l_v1);
	};
	if((PLAYER_TALENT_SMITH[30] == FALSE) && (BuyTemplerMed == TRUE))
	{
		Info_AddChoice(dia_darrion_armorteach,B_BuildLearnStringEx( " Guard Armor ( Training cost: 5000 coins " ,B_GetLearnCostTalent(other, NPC_TALENT_SMITH , WEAPON_ITAR_TPL_M_V1 )),dia_darrion_armorteach_itar_tpl_m_v1);
	};
	if((PLAYER_TALENT_SMITH[31] == FALSE) && (BuyTemplerHeavy == TRUE))
	{
		Info_AddChoice(dia_darrion_armorteach,B_BuildLearnStringEx( " Guardian heavy armor (Training cost: 7000 coins " ,B_GetLearnCostTalent(other, NPC_TALENT_SMITH , WEAPON_ITAR_TPL_S_V1 )),dia_darrion_armorteach_itar_tpl_s_v1);
	};
};


instance DIA_DARRION_ARMORTEACH(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 5;
	condition = dia_darrion_armorteach_condition;
	information = dia_darrion_armorteach_info;
	permanent = TRUE;
	description = " Teach me how to upgrade my armor. " ;
};


func int dia_darrion_armorteach_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_SMITH) > 0) && (DARRION_TEACHARMOR == TRUE) && (other.guild == GIL_TPL))
	{
		if((PLAYER_TALENT_SMITH[29] == FALSE) || (PLAYER_TALENT_SMITH[30] == FALSE) || (PLAYER_TALENT_SMITH[31] == FALSE))
		{
			return TRUE;
		};
	};
};

func void dia_darrion_armorteach_info()
{
	AI_Output(other,self, " DIA_Darrion_ArmorTeach_01_00 " );	// Teach me how to upgrade armor.
	if (Wld_IsTime( 8 , 0 , 20 , 0 ))
	{
		AI_Output(self,other, " DIA_Darrion_ArmorTeach_01_01 " );	// What do you want to know?
		b_darrionarmorchoices();
	}
	else
	{
		AI_Output(self,other, " DIA_Darrion_ArmorTeach_01_02 " );	// I've already finished working at the forge for today...
		AI_Output(self,other, " DIA_Darrion_ArmorTeach_01_03 " );	// Come back tomorrow morning, then we'll talk about it.
	};
};

func void dia_darrion_armorteach_back()
{
	Info_ClearChoices(dia_darrion_armorteach);
};

func void dia_darrion_armorteach_itar_tpl_l_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 3000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_TPL_L_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,3000);
			b_darrion_teacharmor_4();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Darrion_TeachArmor_04_00 " );	// And you don't have enough gold. So for now, forget about it.
	};
	b_darrionarmorchoices();
};

func void dia_darrion_armorteach_itar_tpl_m_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 5000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_TPL_M_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,5000);
			b_darrion_teacharmor_5();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Darrion_TeachArmor_05_00 " );	// Where's the gold, mate?
	};
	b_darrionarmorchoices();
};

func void dia_darrion_armorteach_itar_tpl_s_v1()
{
	if(Npc_HasItems(hero,ItMi_Gold) >= 7000)
	{
		ARMORTEACHFLAG = TRUE;
		if(B_TeachPlayerTalentSmith(self,other,WEAPON_ITAR_TPL_S_V1))
		{
			Npc_RemoveInvItems(hero,ItMi_Gold,7000);
			b_darrion_teacharmor_6();
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Darrion_TeachArmor_06_00 " );	// You don't have enough gold. And I'm not going to share such a secret with you for a smaller amount.
	};
	b_darrionarmorchoices();
};


instance XBS_7513_DARRION_ORESMITH(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_oresmith_condition;
	information = xbs_7513_darrion_oresmith_info;
	permanent = FALSE;
	description = " Netback said you could teach me how to forge an ore weapon. " ;
};


func int xbs_7513_darrion_oresmith_condition()
{
	if (( HOWCANMAKEBLACKSWORD  ==  TRUE ) && ( NETBEKLEADME_STEP2DONE  ==  FALSE ) && ( KNOWNORESWORD  ==  FALSE ) && Npc_KnowsInfo(hero,dia_netbek_makeblacksword));
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_oresmith_info()
{
	AI_Output(other,self, " XBS_7513_Darrion_OreSmith_01_00 " );	// Netback said you could teach me how to forge ore weapons.
	AI_Output(self,other, " XBS_7513_Darrion_OreSmith_01_01 " );	// Well, if he said so, then I can.
	AI_Output(self,other, " XBS_7513_Darrion_OreSmith_01_02 " );	// But you'll need some experience to master the art of forging magic ore.
};


instance XBS_7513_DARRION_ORESMITHTEACH(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_oresmithteach_condition;
	information = xbs_7513_darrion_oresmithteach_info;
	permanent = TRUE;
	description = " Teach me how to forge an ore weapon. (Training Points: 20) " ;
};


func int xbs_7513_darrion_oresmithteach_condition()
{
	if (( HOWCANMAKEBLACKSWORD  ==  TRUE ) && ( KNOWNORESWORD  ==  FALSE ) && Npc_KnowsInfo(hero,xbs_7513_darrion_oresmith))
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_oresmithteach_info()
{
	AI_Output(other,self, " XBS_7513_Darrion_OreSmithTeach_01_00 " );	// Teach me how to forge ore weapons.

	if(other.lp >= 20)
	{
		AI_Output(self,other, " XBS_7513_Darrion_OreSmithTeach_01_01 " );	// Okay, listen carefully. The process of creating an ore blade is quite simple.
		AI_Output(self,other, " XBS_7513_Darrion_OreSmithTeach_01_02 " );	// Take the required amount of magic ore and heat it up to the right temperature.
		AI_Output(self,other, " XBS_7513_Darrion_OreSmithTeach_01_03 " );	// Then you need to combine the pieces into a single alloy, giving it the shape of a blade, and then cool it sharply.
		AI_Output(self,other, " XBS_7513_Darrion_OreSmithTeach_01_04 " );	// As a result, you will receive a weapon whose durability will know no equal.
		AI_Output(other,self, " XBS_7513_Darrion_OreSmithTeach_01_05 " );	// Thanks, I got it.
		other.lp = other.lp - 20;
		RankPoints = RankPoints + 20;
		KNOWNORESWORD = TRUE;
		AI_Print( " Learned forging recipe - 'Ore Sword' " );
		Npc_SetTalentSkill(other,NPC_TALENT_SMITH,1);
		Snd_Play("LevelUP");
	}
	else
	{
		AI_Output(self,other, " XBS_7513_Darrion_OreSmithTeach_01_06 " );	// You don't have enough experience for this.
		AI_Output(self,other, " XBS_7513_Darrion_OreSmithTeach_01_07 " );	// Come back when you've got it, and I'll teach you everything I know myself.
		AI_Output(other,self, " XBS_7513_Darrion_OreSmithTeach_01_08 " );	// Okay, whatever you say.
	};
};


instance XBS_7513_DARRION_BLACKORE(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = xbs_7513_darrion_blackore_condition;
	information = xbs_7513_darrion_blackore_info;
	permanent = FALSE;
	description = " Do you know where I can find black ore? " ;
};


func int xbs_7513_darrion_blackore_condition()
{
	if((HOWCANMAKEBLACKSWORD == TRUE) && (NETBEKLEADME_STEP2DONE == FALSE) && (FINDOREALREADY == FALSE) && (KNOWNORESWORD == TRUE) && Npc_KnowsInfo(hero,dia_netbek_makeblacksword))
	{
		return TRUE;
	};
};

func void xbs_7513_darrion_blackore_info()
{
	AI_Output(other,self, " XBS_7513_Darrion_BlackOre_01_00 " );	// Do you know where I can find black ore?
	AI_Output(self,other, " XBS_7513_Darrion_BlackOre_01_01 " );	// Black ore? I am afraid no. In all my life, I only once held this treasure in my hands.
	AI_Output(self,other, " XBS_7513_Darrion_BlackOre_01_02 " );	// However, I've heard rumors that the orcs knew where to look for it. Although, whether this is true or not, I can’t say for sure.
	AI_Output(other,self,"XBS_7513_Darrion_BlackOre_01_03");	//I see.
	B_LogEntry( TOPIC_GUARDIANS , " The blacksmith Darrion heard that orcs might know where to find black ore. " );
};

instance XBS_7513_DARRION_PrioratBlade(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = XBS_7513_DARRION_PrioratBlade_condition;
	information = XBS_7513_DARRION_PrioratBlade_info;
	permanent = FALSE;
	description = " I need your advice. " ;
};

func int XBS_7513_DARRION_PrioratBlade_condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratSeek == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void XBS_7513_DARRION_PrioratBlade_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " XBS_7513_DARRION_PrioratBlade_01_01 " );	// I need your advice.
	AI_Output(self,other, " XBS_7513_DARRION_PrioratBlade_01_02 " );	// Yes?
	AI_Output(other,self, " XBS_7513_DARRION_PrioratBlade_01_03 " );	// A rare blade fell into my hands. And I'm looking for a blacksmith who could tell me about it.
	AI_Output(self,other, " XBS_7513_DARRION_PrioratBlade_01_06 " );	// Well, then show me what you have there.
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_07");	//Вот.
	CreateInvItems(self,ItMw_1H_AssBlade_View,1);
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_UnequipWeapons(self);
	AI_Output(self,other, " XBS_7513_DARRION_PrioratBlade_01_08 " );	// This is indeed a very rare blade for this area.
	AI_Output(self,other, " XBS_7513_DARRION_PrioratBlade_01_11 " );	// But if you'd ever been to Varant... (snidely)
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_12");	//What?
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_13");	//In Varant, these blades are a copper a dozen!
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_14");	//Varant? That sounds familiar...
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_15");	//Varant is a huge desert located in the south of Myrtana. Its locals - assassins, very often use these kinds of blades.
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_16");	//Although this weapon is different in small, almost impercebtible ways.
	AI_Output(other,self,"XBS_7513_DARRION_PrioratBlade_01_17");	//In what sense?
	AI_Output(self,other,"XBS_7513_DARRION_PrioratBlade_01_18");	//The engravings at the base of the blade. I've never seen their like.
	AI_Output(self,other, " XBS_7513_DARRION_PrioratBlade_01_19 " );	// If I knew their meaning I could say for sure who the real owner of this weapon is.
	AI_Output(other,self, " XBS_7513_DARRION_PrioratBlade_01_20 " );	// Who might be able to read it?
	AI_Output(self,other, " XBS_7513_DARRION_PrioratBlade_01_21 " );	// I have no idea. Perhaps the Assassins themselves would recognize it.
	AI_Output(self,other, " XBS_7513_DARRION_PrioratBlade_01_22 " );	// But where can you find at least one of them?
	AI_Output(self,other, " XBS_7513_DARRION_PrioratBlade_01_23 " );	// They like the hot sun of Varant, this climate is too damp for their tastes.
	AI_Output(other,self, " XBS_7513_DARRION_PrioratBlade_01_24 " );	// Okay, I understand. Thanks for the help!
	B_LogEntry(TOPIC_PrioratStart, " Darrion told me that the blade I found is commonly used by Assassins living in the Varant Desert, which is located in the south of Myrtana. However, he was most interested in the engraving embossed at the base of the blade. The symbols depicted on it could give a more accurate answer to my question. But to my great regret, Darrion could not decipher them. According to him, the assassins themselves could do it. " );
	BladePrioratKnowsAssasins = TRUE;
};

instance DIA_Darrion_DoCrossBow(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = DIA_Darrion_DoCrossBow_condition;
	information = DIA_Darrion_DoCrossBow_info;
	permanent = FALSE;
	description = " Can you make crossbows? " ;
};

func int DIA_Darrion_DoCrossBow_condition()
{
	if((MIS_TagNorGrHunWeap == LOG_Running) && (FindSmithTeacherCrBow == TRUE) && (CrossBowNeedPlotnik == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Darrion_DoCrossBow_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Darrion_DoCrossBow_01_01 " );	// Can you make crossbows?
	AI_Output(self,other, " DIA_Darrion_DoCrossBow_01_02 " );	// Crossbows? You're barking up the wrong tree my friend.
	AI_Output(self,other, " DIA_Darrion_DoCrossBow_01_03 " );	// You need a good carpenter or joiner.
	AI_Output(self,other, " DIA_Darrion_DoCrossBow_01_04 " );	// Only they can help you in that regard.
	AI_Output(other,self,"DIA_Darrion_DoCrossBow_01_05");	//Understood.
	CrossBowNeedPlotnik = TRUE;
	B_LogEntry(TOPIC_TagNorGrHunWeap, " Only a carpenter or joiner can teach me how to make crossbows. " );
};

instance XBS_7513_DARRION_CanSellArmor(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = XBS_7513_DARRION_CanSellArmor_condition;
	information = XBS_7513_DARRION_CanSellArmor_info;
	permanent = FALSE;
	description = " Are you interested in well-worn armor, by any chance? " ;
};

func int XBS_7513_DARRION_CanSellArmor_condition()
{
	if(Npc_KnowsInfo(hero,xbs_7513_darrion_hi) == TRUE)
	{
		return TRUE;
	};
};

func void XBS_7513_DARRION_CanSellArmor_info()
{
	AI_Output(other,self, " XBS_7513_DARRION_CanSellArmor_01_00 " );	// You don't care about well-worn armor, do you?
	AI_Output(self,other, " XBS_7513_DARRION_CanSellArmor_01_01 " );	// Possibly. Why are you asking?
	AI_Output(other,self, " XBS_7513_DARRION_CanSellArmor_01_02 " );	// I have a couple of unnecessary kits lying around here, and I have no idea what to do with them.
	AI_Output(self,other, " XBS_7513_DARRION_CanSellArmor_01_03 " );	// Well, if so, you can bring them to me.
	AI_Output(self,other, " XBS_7513_DARRION_CanSellArmor_01_04 " );	// Some of them can be retrofitted to one of the guys in the camp.
	AI_Output(self,other, " XBS_7513_DARRION_CanSellArmor_01_05 " );	// The rest will go as improvised material for creating new ones. Steel, leather, fabric, magic ore - everything will fit!
	AI_Output(other,self, " XBS_7513_DARRION_CanSellArmor_01_06 " );	// What do I get out of this?
	AI_Output(self,other, " XBS_7513_DARRION_CanSellArmor_01_07 " );	// I don't have much gold. But to exchange them for ore is easy.
	AI_Output(other,self, " XBS_7513_DARRION_CanSellArmor_01_09 " );	// Okay, I'll think about your suggestion.
	Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
	B_LogEntry( TOPIC_XBS , " Darrion accepts used armor in exchange for magic ore. " );
	DarrionCanSellArmor = TRUE;
};

instance XBS_7513_DARRION_CanSellArmor_Do(C_Info)
{
	npc = xbs_7513_darrion;
	nr = 1;
	condition = XBS_7513_DARRION_CanSellArmor_Do_condition;
	information = XBS_7513_DARRION_CanSellArmor_Do_info;
	permanent = TRUE;
	description = " I brought you armor. " ;
};

func int XBS_7513_DARRION_CanSellArmor_Do_condition()
{
	if(DarrionCanSellArmor == TRUE)
	{
		return TRUE;
	};
};

func void XBS_7513_DARRION_CanSellArmor_Do_info()
{
	var C_Item EquipWeap;
	EquipWeap = Npc_GetEquippedArmor(other);

	AI_Output(other,self, " XBS_7513_DARRION_CanSellArmor_Do_01_00 " );	// I brought you armor.
	AI_Output(self,other, " XBS_7513_DARRION_CanSellArmor_Do_01_01 " );	// Good. Let's look at them.
	Info_ClearChoices(XBS_7513_DARRION_CanSellArmor_Do);
	Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,Dialog_Back,XBS_7513_DARRION_CanSellArmor_Do_back);

	if ((Hlp_IsItem(EquipWeap, ITAR_PRISONEL ) ==  FALSE ) && (Npc_HasItems(other, ITAR_PRISONEL ) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Prisoner's license plate' - 5 years ago " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PRISONER);
	};
	if ((Hlp_IsItem(EquipWeap,ITAR_Prisoner) ==  FALSE ) && (Npc_HasItems(other,ITAR_Prisoner) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Prisoners' - 5 years ago " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_Prisoner);
	};
	if ((Hlp_IsItem(EquipWeap,ITAR_Bau_L) ==  FALSE ) && (Npc_HasItems(other,ITAR_Bau_L) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Peasant's Light Clothes' - 5 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bau_L);
	};
	if ((Hlp_IsItem(EquipWeap,ITAR_Vlk_L) ==  FALSE ) && (Npc_HasItems(other,ITAR_Vlk_L) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Citizen Light Clothes' - 5 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Bau_M) == FALSE) && (Npc_HasItems(other,ITAR_Bau_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Peasant's Clothes' - 5 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bau_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Vlk_M) == FALSE) && (Npc_HasItems(other,ITAR_Vlk_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Specifying selection' - 5 years ago " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Vlk_H) == FALSE) && (Npc_HasItems(other,ITAR_Vlk_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Deluxe Citizen Clothes' - 10 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SEKBED) == FALSE) && (Npc_HasItems(other,ITAR_SEKBED) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Brotherhood Loincloth' - 10 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SEKBED);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SEKBED_V1) == FALSE) && (Npc_HasItems(other,ITAR_SEKBED_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Daily Assembly Armor' - 10 minutes ago " ,XBS_7513_DARRION_Can_ITARV1Armor_K);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Apprentice Blacksmith Clothes' - 10 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_01) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_01) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Apprentice Blacksmith Clothes' - 10 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_01);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_02) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_02) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Apprentice Blacksmith Clothes' - 10 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_02);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_03) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_03) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Apprentice Blacksmith Clothes' - 10 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_03);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_04) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_04) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Apprentice Blacksmith Clothes' - 10 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_04);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SMITH_NOV_05) == FALSE) && (Npc_HasItems(other,ITAR_SMITH_NOV_05) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Apprentice Blacksmith Clothes' - 10 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_05);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Leather_L) == FALSE) && (Npc_HasItems(other,ITAR_Leather_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Leather Armor' - 15 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_Leather_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Leather_M) == FALSE) && (Npc_HasItems(other,ITAR_Leather_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Leather Armor' - 15 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_Leather_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ALCHEMY_NOV) == FALSE) && (Npc_HasItems(other,ITAR_ALCHEMY_NOV) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Apprentice Alchemist Clothes' - 10 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_ALCHEMY_NOV);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KIL_SL) == FALSE) && (Npc_HasItems(other,ITAR_KIL_SL) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Assassin Armor' - 15 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_KIL_SL);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KIL_SLS) == FALSE) && (Npc_HasItems(other,ITAR_KIL_SLS) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Master Assassin Armor' - 20 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_KIL_SLS);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TOWNGUARD) == FALSE) && (Npc_HasItems(other,ITAR_TOWNGUARD) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Militia Light Armor' - 15 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TOWNGUARD);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Mil_L) == FALSE) && (Npc_HasItems(other,ITAR_Mil_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Militia Armor' - 20 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_Mil_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_L_V1) == FALSE) && (Npc_HasItems(other,ITAR_MIL_L_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Militia Armor' - 25 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_L_V12) == FALSE) && (Npc_HasItems(other,ITAR_MIL_L_V12) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Militia Armor' - 25 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V12);
	};
	if ((Hlp_IsItem(EquipWeap, ITAR_MIL_L_V13 ) ==  FALSE ) && (Npc_HasItems(other, ITAR_MIL_L_V13 ) >=  1 )) ;
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Militia Armor' - 25 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V13);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_L_V14) == FALSE) && (Npc_HasItems(other,ITAR_MIL_L_V14) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Militia Armor' - 25 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V14);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_L_V15) == FALSE) && (Npc_HasItems(other,ITAR_MIL_L_V15) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Militia Armor' - 30 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V15);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_Sld_L) == FALSE) && (Npc_HasItems(other,ItAr_Sld_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Mercenary Light Armor' - 25 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Sld_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V1) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Mercenary Light Forged Armor' - 30 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V2) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Mercenary Light Forged Armor' - 30 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V3) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Mercenary Light Forged Armor' - 30 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V4) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи наемника' - 30 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_L_V5) == FALSE) && (Npc_HasItems(other,ITAR_SLD_L_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Легкие кованые доспехи наемника' - 35 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи наемника' - 40 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи наемника' - 45 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V2) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи наемника' - 45 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V3) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи наемника' - 45 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V4) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи наемника' - 45 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_M_V5) == FALSE) && (Npc_HasItems(other,ITAR_SLD_M_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Кованые доспехи наемника' - 50 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLP_UL) == FALSE) && (Npc_HasItems(other,ITAR_SLP_UL) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Доспехи послушника Братства' - 30 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLP_UL);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLP_L) == FALSE) && (Npc_HasItems(other,ITAR_SLP_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Тяжелые доспехи послушника Братства' - 35 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLP_L);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_NOV_L) == FALSE) && (Npc_HasItems(other,ItAr_NOV_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба послушника Огня' - 25 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ItAr_NOV_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_NDW_L) == FALSE) && (Npc_HasItems(other,ITAR_NDW_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do,"'Роба послушника Воды' - 25 кусков руды",XBS_7513_DARRION_CanSellArmor_Do_ITAR_NDW_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_NDM_L) == FALSE) && (Npc_HasItems(other,ITAR_NDM_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Dark Acolyte Robe' - 25 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_NDM_L);
	};
	if ((Hlp_IsItem(EquipWeap,ItAr_KDF_L) ==  FALSE ) && (Npc_HasItems(other,ItAr_KDF_L) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Junior Fire Mage Rob' - 30 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDF_M) == FALSE) && (Npc_HasItems(other,ITAR_KDF_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Darrion_CanSellArmor_Do' - 40 minutes " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDF_M_NEW) == FALSE) && (Npc_HasItems(other,ITAR_KDF_M_NEW) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Page 100' - 40 minutes " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_M_NEW);
	};
	if ((Hlp_IsItem(EquipWeap,ITAR_KDW_L_Addon) ==  FALSE ) && (Npc_HasItems(other,ITAR_KDW_L_Addon) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Advanced Code' - 35 minutes " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_L_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DMT_L) == FALSE) && (Npc_HasItems(other,ITAR_DMT_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Please wait' - 40 minutes ago " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_L);
	};
	if ((Hlp_IsItem(EquipWeap, ITAR_GUR_L ) ==  FALSE ) && (Npc_HasItems(other, ITAR_GUR_L ) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Please sell armor' - 40 minutes " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_GUR_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MAYA_PRIEST) == FALSE) && (Npc_HasItems(other,ITAR_MAYA_PRIEST) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Robe of Ancient Priests' - 45 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_MAYA_PRIEST);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_Addon) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " Water Ring Armor - 40 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V1) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " Ring of Water Hammered Armor - 45 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V2) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " Ring of Water Hammered Armor - 45 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V3) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " Ring of Water Hammered Armor - 45 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V4) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " Ring of Water Hammered Armor - 45 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_RANGER_ADDON_V5) == FALSE) && (Npc_HasItems(other,ITAR_RANGER_ADDON_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " Ring of Water Hammered Armor - 50 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PIR_L_Addon) == FALSE) && (Npc_HasItems(other,ITAR_PIR_L_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Pirate Light Armor' - 40 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_L_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PIR_M_Addon) == FALSE) && (Npc_HasItems(other,ITAR_PIR_M_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Pirate Armor' - 50 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_M_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PIR_H_Addon) == FALSE) && (Npc_HasItems(other,ITAR_PIR_H_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Pirate Heavy Armor' - 60 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_H_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_BDT_M) == FALSE) && (Npc_HasItems(other,ItAr_BDT_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Light Bandit Armor' - 30 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_BDT_M);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_BDT_H) == FALSE) && (Npc_HasItems(other,ItAr_BDT_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Bandit Armor' - 40 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_BDT_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_BDT_F) == FALSE) && (Npc_HasItems(other,ITAR_BDT_F) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Bandit Armor' - 50 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_BDT_F);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_GRD_L) == FALSE) && (Npc_HasItems(other,ITAR_GRD_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Guard's Light Armor' - 40 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_GRD_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_GRD_L_V1) == FALSE) && (Npc_HasItems(other,ITAR_GRD_L_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Guard's Light Forged Armor' - 45 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_GRD_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Bloodwyn_Addon) == FALSE) && (Npc_HasItems(other,ITAR_Bloodwyn_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Guard's Armor' - 50 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bloodwyn_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_BLOODWYN_ADDON_V1) == FALSE) && (Npc_HasItems(other,ITAR_BLOODWYN_ADDON_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Guard's Forged Armor' - 55 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_BLOODWYN_ADDON_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Thorus_Addon) == FALSE) && (Npc_HasItems(other,ITAR_Thorus_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Guard Armor' - 60 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_Thorus_Addon);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_THORUS_ADDON_V1) == FALSE) && (Npc_HasItems(other,ITAR_THORUS_ADDON_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Guard Armor' - 65 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_THORUS_ADDON_V1);
	};
	if ((Hlp_IsItem(EquipWeap,ITAR_OreBaron_Addon) ==  FALSE ) && (Npc_HasItems(other,ITAR_OreBaron_Addon) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Ore Baron Armor' - 80 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_OreBaron_Addon);
	};
	if ((Hlp_IsItem(EquipWeap,ITAR_DJG_Crawler) ==  FALSE ) && (Npc_HasItems(other,ITAR_DJG_Crawler) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Crawler Shell Armor' - 40 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_Crawler);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_MIL_M) == FALSE) && (Npc_HasItems(other,ItAr_MIL_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Militia Armor' - 60 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_MIL_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Militia Armor' - 65 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V12) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V12) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Militia Armor' - 65 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V12);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V13) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V13) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Militia Armor' - 65 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V13);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V14) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V14) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Militia Armor' - 65 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V14);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_MIL_M_V15) == FALSE) && (Npc_HasItems(other,ITAR_MIL_M_V15) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Militia Armor' - 70 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V15);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_L) == FALSE) && (Npc_HasItems(other,ITAR_PAL_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Squire's Armor' - 80 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_L);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_Sld_H) == FALSE) && (Npc_HasItems(other,ItAr_Sld_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Mercenary Armor' - 70 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Sld_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V1) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Mercenary Armor' - 75 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V2) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Mercenary Armor' - 75 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V3) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Mercenary Armor' - 75 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V4) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Mercenary Armor' - 75 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_SLD_H_V5) == FALSE) && (Npc_HasItems(other,ITAR_SLD_H_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Mercenary Armor' - 80 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V5);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_PAL_M) == FALSE) && (Npc_HasItems(other,ItAr_PAL_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Knight Armor' - 90 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_PAL_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Knight's Forged Armor' - 95 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V12) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V12) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Knight's Forged Armor' - 95 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V12);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V13) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V13) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Knight's Forged Armor' - 95 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V13);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V14) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V14) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Knight's Forged Armor' - 95 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V14);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V15) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V15) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Knight's Ore Armor' - 100 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V15);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_M_V2) == FALSE) && (Npc_HasItems(other,ITAR_PAL_M_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Sacred Knight's Ore Armor' - 105 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V2);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_PAl_H) == FALSE) && (Npc_HasItems(other,ItAr_PAl_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Paladin Armor' - 120 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_PAl_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V1) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Paladin's Forged Armor' - 130 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V12) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V12) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Paladin's Forged Armor' - 130 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V12);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V13) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V13) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Paladin's Forged Armor' - 130 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V13);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V14) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V14) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Paladin's Forged Armor' - 130 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V14);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V15) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V15) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Paladin Ore Armor' - 140 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V15);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_PAL_H_V2) == FALSE) && (Npc_HasItems(other,ITAR_PAL_H_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Sanctified Paladin Ore Armor' - 150 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V2);
	};
	if ((Hlp_IsItem(EquipWeap, ITAR_DJG_L ) ==  FALSE ) && (Npc_HasItems(other, ITAR_DJG_L ) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Dragon Slayer Light Armor' - 80 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L);
	};
	if ((Hlp_IsItem(EquipWeap, ITAR_DJG_L_V1 ) ==  FALSE ) && (Npc_HasItems(other, ITAR_DJG_L_V1 ) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Light Forged Dragonslayer Armor' - 90 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_L_V2) == FALSE) && (Npc_HasItems(other,ITAR_DJG_L_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Light Forged Dragonslayer Armor' - 90 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V2);
	};
	if ((Hlp_IsItem(EquipWeap, ITAR_DJG_L_V3 ) ==  FALSE ) && (Npc_HasItems(other, ITAR_DJG_L_V3 ) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Light Forged Dragonslayer Armor' - 90 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V3);
	};
	if ((Hlp_IsItem(EquipWeap, ITAR_DJG_L_V4 ) ==  FALSE ) && (Npc_HasItems(other, ITAR_DJG_L_V4 ) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Light Forged Dragonslayer Armor' - 90 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V4);
	};
	if ((Hlp_IsItem(EquipWeap, ITAR_DJG_L_V5 ) ==  FALSE ) && (Npc_HasItems(other, ITAR_DJG_L_V5 ) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Light Forged Dragonslayer Armor' - 100 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Dragon Slayer Armor' - 110 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Dragonslayer Armor' - 120 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V2) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Dragonslayer Armor' - 120 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V3) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Dragonslayer Armor' - 120 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V4) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Dragonslayer Armor' - 120 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_M_V5) == FALSE) && (Npc_HasItems(other,ITAR_DJG_M_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Dragonslayer Armor' - 130 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V5);
	};
	if ((Hlp_IsItem(EquipWeap,ITAR_Dargonscale) ==  FALSE ) && (Npc_HasItems(other,ITAR_Dargonscale) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Dragonscale Armor' - 140 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_Dargonscale);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Dragonslayer Armor' - 140 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V1) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Dragonslayer Armor' - 150 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V2) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Dragonslayer Armor' - 150 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V3) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Dragonslayer Armor' - 150 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V4) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Dragonslayer Armor' - 150 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DJG_H_V5) == FALSE) && (Npc_HasItems(other,ITAR_DJG_H_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Dragonslayer Armor' - 160 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V5);
	};
	if ((Hlp_IsItem(EquipWeap,ItAr_DragonKiller) ==  FALSE ) && (Npc_HasItems(other,ItAr_DragonKiller) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Dragon Slayer Armor' - 200 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_DragonKiller);
	};
	if ((Hlp_IsItem(EquipWeap,ItAr_SHVWarrior) ==  FALSE ) && (Npc_HasItems(other,ItAr_SHVWarrior) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Armor of the Executor' - 130 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_SHVWarrior);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_LST) == FALSE) && (Npc_HasItems(other,ITAR_TPL_LST) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Brotherhood Guard Battle Kilt' - 70 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_LST);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Brotherhood Guard Light Armor' - 80 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V1) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Brotherhood Guard Light Forged Armor' - 90 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V2) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Brotherhood Guard Light Forged Armor' - 90 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V3) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Brotherhood Guard Light Forged Armor' - 90 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V4) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Brotherhood Guard Light Forged Armor' - 90 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_L_V5) == FALSE) && (Npc_HasItems(other,ITAR_TPL_L_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Fraternity Guard Light Forged Armor' - 100 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Brotherhood Guard Armor' - 110 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V1) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Brotherhood Guard Armor' - 120 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V2) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Brotherhood Guard Armor' - 120 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V3) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Armor of the Brotherhood Guard' - 120 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V4) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Armor of the Brotherhood Guard' - 120 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_M_V5) == FALSE) && (Npc_HasItems(other,ITAR_TPL_M_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Forged Armor of the Brotherhood Guard' - 130 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Brotherhood Guard Armor' - 140 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V1) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Brotherhood Guard Armor' - 150 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V2) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Armor of the Brotherhood Guard' - 150 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V3) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Brotherhood Guard Armor' - 150 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V4) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Armor of the Brotherhood Guard' - 150 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TPL_S_V5) == FALSE) && (Npc_HasItems(other,ITAR_TPL_S_V5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Forged Armor of the Brotherhood Guard' - 160 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V5);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_KDF_H) == FALSE) && (Npc_HasItems(other,ItAr_KDF_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Robe of the Grand Fire Mage' - 80 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDF_H_BLESSED) == FALSE) && (Npc_HasItems(other,ITAR_KDF_H_BLESSED) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Sanctified Robe of the High Fire Mage' - 90 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_H_BLESSED);
	};
	if ((Hlp_IsItem(EquipWeap,ItAr_KDF_SH) ==  FALSE ) && (Npc_HasItems(other,ItAr_KDF_SH) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Please sell armor' - 100 minutes " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_SH);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_KDW_H) == FALSE) && (Npc_HasItems(other,ITAR_KDW_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Robe of Grand Water Mage' - 80 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_H);
	};
	if ((Hlp_IsItem(EquipWeap,ItAr_KDW_SH) ==  FALSE ) && (Npc_HasItems(other,ItAr_KDW_SH) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Robe of the Water Archmage' - 90 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDW_SH);
	};
	if ((Hlp_IsItem(EquipWeap, ITAR_KDW_ADANOS ) ==  FALSE ) && (Npc_HasItems(other, ITAR_KDW_ADANOS ) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Personal Self' - 100 minutes " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_ADANOS);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DMT_H) == FALSE) && (Npc_HasItems(other,ITAR_DMT_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Superior Shadow Mage Robe' - 100 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DMT_H_BELIAR_1) == FALSE) && (Npc_HasItems(other,ITAR_DMT_H_BELIAR_1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Corrupted Supreme Shadow Mage Robe' - 110 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H_BELIAR_1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DMT_H_BELIAR_3) == FALSE) && (Npc_HasItems(other,ITAR_DMT_H_BELIAR_3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Darkbringer Robe' - 120 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H_BELIAR_3);
	};
	if ((Hlp_IsItem(EquipWeap,ItAr_KDM_SH) ==  FALSE ) && (Npc_HasItems(other,ItAr_KDM_SH) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Robe of the Archmage of Darkness' - 130 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDM_SH);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_GUR_H) == FALSE) && (Npc_HasItems(other,ITAR_GUR_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Brotherhood Supreme Guru Robes' - 110 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_GUR_H);
	};
	if ((Hlp_IsItem(EquipWeap, ITAR_HARADRIMMAGE ) ==  FALSE ) && (Npc_HasItems(other, ITAR_HARADRIMMAGE ) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Rob of the Guardian Adept' - 50 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_HARADRIMMAGE);
	};
	if ((Hlp_IsItem(EquipWeap,ItAr_BloodArmor) ==  FALSE ) && (Npc_HasItems(other,ItAr_BloodArmor) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Blood Armor' - 170 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_BloodArmor);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_01) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_01) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Masyaf Shadow Heavy Armor' - 100 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_01);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_02) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_02) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Armor of Prior Masyaf' - 120 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_02);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_03) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_03) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Masyaf Acolyte Armor' - 80 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_03);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_04) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_04) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Masyaf Shadow Armor' - 90 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_04);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASSASINS_DEMONMAGE) == FALSE) && (Npc_HasItems(other,ITAR_ASSASINS_DEMONMAGE) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Guru Demon Armor' - 150 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_DEMONMAGE);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_Hun_H) == FALSE) && (Npc_HasItems(other,ItAr_Hun_H) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Heavy Hunter Armor' - 40 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Hun_H);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Database' - 10 minutes ago " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END);
	};
	if ((Hlp_IsItem(EquipWeap,ItAr_HuntArmor_01) ==  FALSE ) && (Npc_HasItems(other,ItAr_HuntArmor_01) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Hunter Armor' - 40 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_01);
	};
	if ((Hlp_IsItem(EquipWeap,ItAr_HuntArmor_02) ==  FALSE ) && (Npc_HasItems(other,ItAr_HuntArmor_02) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'St. John's Wort Armor' - 60 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_02);
	};
	if ((Hlp_IsItem(EquipWeap,ItAr_HuntArmor_03) ==  FALSE ) && (Npc_HasItems(other,ItAr_HuntArmor_03) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Troll Hunter Armor' - 80 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_03);
	};
	if ((Hlp_IsItem(EquipWeap,ItAr_HuntArmor_04) ==  FALSE ) && (Npc_HasItems(other,ItAr_HuntArmor_04) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Master Hunter Armor' - 100 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_04);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_1) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_1) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Thief Armor' - 20 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_1);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_2) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_2) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Ghost Armor' - 30 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_2);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_3) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_3) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Nightshade Armor' - 50 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_3);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_4) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_4) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Master Thief Armor' - 60 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_4);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_5) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_5) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Thieves Leader Armor' - 80 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_5);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_DHT_END_6) == FALSE) && (Npc_HasItems(other,ITAR_DHT_END_6) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Armor of the King of Thieves' - 100 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_6);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASS) == FALSE) && (Npc_HasItems(other,ITAR_ASS) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Assassin Armor' - 120 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASS);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_TOPTHIEF) == FALSE) && (Npc_HasItems(other,ITAR_TOPTHIEF) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Er'Hazir Armor' - 150 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_TOPTHIEF);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ASGARD) == FALSE) && (Npc_HasItems(other,ITAR_ASGARD) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Ghost Shadow Armor' - 180 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASGARD);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_ADVENTURE_HERO) == FALSE) && (Npc_HasItems(other,ITAR_ADVENTURE_HERO) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Adventurer Armor' - 30 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_ADVENTURE_HERO);
	};
	if((Hlp_IsItem(EquipWeap,ItAr_OldSteelArmor) == FALSE) && (Npc_HasItems(other,ItAr_OldSteelArmor) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Steel Self-Forged Armor' - 60 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_OldSteelArmor);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_STTP_01) == FALSE) && (Npc_HasItems(other,ITAR_STTP_01) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Ghost Chain' - 40 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_STTP_01);
	};
	if ((Hlp_IsItem(EquipWeap, ITAR_OREARMOR ) ==  FALSE ) && (Npc_HasItems(other, ITAR_OREARMOR ) >=  1 ))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Ore Armor of Light' - 250 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_OREARMOR);
	};
	if((Hlp_IsItem(EquipWeap,ITAR_Raven_Addon) == FALSE) && (Npc_HasItems(other,ITAR_Raven_Addon) >= 1))
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Dark Ore Armor' - 250 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ITAR_Raven_Addon);
	};
	if(Npc_HasItems(other,ItAr_Hut) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Mother's Hat' - 1 piece of ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Hut);
	};
	if(Npc_HasItems(other,ItAr_HoodHelm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Cloth Cape' - 2 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_HoodHelm);
	};
	if(Npc_HasItems(other,ItAr_ThiefHut) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Can SellArmor_Do' - 2 pages " ,XBS_7513_DARRION_CanSellArmor_Do_ItIs_ThiefHut);
	};
	if(Npc_HasItems(other,ItAr_PirateHat) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Entertainment' - 3 pages " ,XBS_7513_DARRION_CanSellArmor_Do_ItIs_PirateHat);
	};
	if(Npc_HasItems(other,ItAr_Helm_01) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Iron Helmet' - 5 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_01);
	};
	if(Npc_HasItems(other,ItAr_Helm_New_01) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Archer's Helm' - 5 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_New_01);
	};
	if(Npc_HasItems(other,ItAr_Helm_New_02) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Boy's 'Armor' - 30 minutes ago " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_New_02);
	};
	if(Npc_HasItems(other,ItAr_Helm_02) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Darrion Armor' - 8 minutes ago " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_02);
	};
	if(Npc_HasItems(other,ItAr_Helm_Hunt) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Can SellArmor_Do' - 15 years ago " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Hunt_Hunt);
	};
	if(Npc_HasItems(other,ItAr_Helm_03) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Knight's Helmet' - 10 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_03);
	};
	if(Npc_HasItems(other,ItAr_Pal_Helm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Boy's' - 15 minutes ago " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Pal_Helm);
	};
	if(Npc_HasItems(other,ItAr_Pal_Helm_Open) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Boy's' - 15 minutes ago " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Pal_Helm_Open);
	};
	if(Npc_HasItems(other,ItAr_DJG_Helm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Dragon Slayer Helm' - 20 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_DJG_Helm);
	};
	if(Npc_HasItems(other,ItAr_Helm_Demon) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Dragon Helmet' - 40 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_Demon);
	};
	if(Npc_HasItems(other,ItAr_God_Helm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Ancient Helmet' - 50 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_God_Helm);
	};
	if(Npc_HasItems(other,ItAr_Helm_G3_01) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Steel Helmet' - 10 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_01);
	};
	if(Npc_HasItems(other,ItAr_Helm_G3_02) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Boy's' - 12 minutes ago " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_02);
	};
	if(Npc_HasItems(other,ItAr_Helm_G3_04) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Horned Helm' - 12 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_04);
	};
	if(Npc_HasItems(other,ItAr_ShrecHelm) >= 1)
	{
		Info_AddChoice(XBS_7513_DARRION_CanSellArmor_Do, " 'Architect Priest Helmet' - 8 Ore " ,XBS_7513_DARRION_CanSellArmor_Do_ItAr_ShrecHelm);
	};
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Hut()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Hut,1);
	B_GiveInvItems(self,other,ItMi_Nugget,1);
	Npc_RemoveInvItems(self,ItAr_Hut,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HoodHelm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_HoodHelm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	Npc_RemoveInvItems(self,ItAr_HoodHelm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_ThiefHut()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_ThiefHut,1);
	B_GiveInvItems(self,other,ItMi_Nugget,2);
	Npc_RemoveInvItems(self,ItAr_ThiefHut,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_PirateHat()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_PirateHat,1);
	B_GiveInvItems(self,other,ItMi_Nugget,3);
	Npc_RemoveInvItems(self,ItAr_PirateHat,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_01()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ItAr_Helm_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_New_01()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_New_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ItAr_Helm_New_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_New_02()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_New_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ItAr_Helm_New_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_02()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,8);
	Npc_RemoveInvItems(self,ItAr_Helm_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_Hunt()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_Hunt,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ItAr_Helm_Hunt,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_03()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_03,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ItAr_Helm_03,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Pal_Helm_Open()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Pal_Helm_Open,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ItAr_Pal_Helm_Open,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Pal_Helm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Pal_Helm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ItAr_Pal_Helm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_DJG_Helm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_DJG_Helm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,20);
	Npc_RemoveInvItems(self,ItAr_DJG_Helm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_Demon()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_Demon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ItAr_Helm_Demon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_God_Helm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_God_Helm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ItAr_God_Helm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_01()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_G3_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ItAr_Helm_G3_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_02()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_G3_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,12);
	Npc_RemoveInvItems(self,ItAr_Helm_G3_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Helm_G3_04()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_Helm_G3_04,1);
	B_GiveInvItems(self,other,ItMi_Nugget,12);
	Npc_RemoveInvItems(self,ItAr_Helm_G3_04,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_ShrecHelm()
{
	B_GivePlayerXP(50);
	B_GiveInvItems(other,self,ItAr_ShrecHelm,1);
	B_GiveInvItems(self,other,ItMi_Nugget,8);
	Npc_RemoveInvItems(self,ItAr_ShrecHelm,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_STTP_01()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_STTP_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_STTP_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_back()
{
	Info_ClearChoices(XBS_7513_DARRION_CanSellArmor_Do);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PRISONEL()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PRISONEL,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_PRISONEL,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Prisoner()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Prisoner,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Prisoner,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bau_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Bau_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Bau_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Vlk_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Vlk_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bau_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Bau_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Bau_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Vlk_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,5);
	Npc_RemoveInvItems(self,ITAR_Vlk_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Vlk_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Vlk_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_Vlk_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SEKBED()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SEKBED,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SEKBED,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SEKBED_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SEKBED_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SEKBED_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_01()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_02()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_03()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_03,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_03,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_04()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_04,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_04,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SMITH_NOV_05()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SMITH_NOV_05,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_SMITH_NOV_05,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Leather_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Leather_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ITAR_Leather_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Leather_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Leather_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ITAR_Leather_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ALCHEMY_NOV()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ALCHEMY_NOV,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_ALCHEMY_NOV,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KIL_SL()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KIL_SL,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ITAR_KIL_SL,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KIL_SLS()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KIL_SLS,1);
	B_GiveInvItems(self,other,ItMi_Nugget,20);
	Npc_RemoveInvItems(self,ITAR_KIL_SLS,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TOWNGUARD()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TOWNGUARD,1);
	B_GiveInvItems(self,other,ItMi_Nugget,15);
	Npc_RemoveInvItems(self,ITAR_TOWNGUARD,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Mil_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Mil_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,20);
	Npc_RemoveInvItems(self,ITAR_Mil_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V12()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V12,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V12,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V13()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V13,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V13,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V14()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V14,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V14,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_L_V15()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_L_V15,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_MIL_L_V15,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Sld_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_Sld_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ItAr_Sld_L,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V2,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V3,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V4,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_L_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_L_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,35);
	Npc_RemoveInvItems(self,ITAR_SLD_L_V5,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_SLD_M,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_M_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_M_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_SLD_M_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLP_UL()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLP_UL,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_SLP_UL,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLP_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLP_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,35);
	Npc_RemoveInvItems(self,ITAR_SLP_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_NOV_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_NOV_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ItAr_NOV_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_NDW_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_NDW_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_NDW_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_NDM_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_NDM_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,25);
	Npc_RemoveInvItems(self,ITAR_NDM_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDF_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ItAr_KDF_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDF_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_KDF_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_M_NEW()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDF_M_NEW,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_KDF_M_NEW,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_L_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDW_L_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,35);
	Npc_RemoveInvItems(self,ITAR_KDW_L_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DMT_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_DMT_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_GUR_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_GUR_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_GUR_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MAYA_PRIEST()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MAYA_PRIEST,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_MAYA_PRIEST,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_RANGER_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_RANGER_ADDON_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_RANGER_ADDON_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_RANGER_ADDON_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_L_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PIR_L_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_PIR_L_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_M_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PIR_M_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_PIR_M_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PIR_H_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PIR_H_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ITAR_PIR_H_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_BDT_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_BDT_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ItAr_BDT_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_BDT_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_BDT_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ItAr_BDT_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_BDT_F()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_BDT_F,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_BDT_F,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_GRD_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_GRD_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_GRD_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_GRD_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_GRD_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,45);
	Npc_RemoveInvItems(self,ITAR_GRD_L_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Bloodwyn_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Bloodwyn_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_Bloodwyn_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_BLOODWYN_ADDON_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_BLOODWYN_ADDON_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,55);
	Npc_RemoveInvItems(self,ITAR_BLOODWYN_ADDON_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Thorus_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Thorus_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ITAR_Thorus_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_THORUS_ADDON_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_THORUS_ADDON_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_THORUS_ADDON_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_OreBaron_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_OreBaron_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,70);
	Npc_RemoveInvItems(self,ITAR_OreBaron_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_Crawler()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_Crawler,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ITAR_DJG_Crawler,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_MIL_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_MIL_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ItAr_MIL_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V12()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V12,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V12,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V13()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V13,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V13,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V14()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V14,1);
	B_GiveInvItems(self,other,ItMi_Nugget,65);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V14,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_MIL_M_V15()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_MIL_M_V15,1);
	B_GiveInvItems(self,other,ItMi_Nugget,70);
	Npc_RemoveInvItems(self,ITAR_MIL_M_V15,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_PAL_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Sld_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_Sld_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,70);
	Npc_RemoveInvItems(self,ItAr_Sld_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,75);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,75);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,75);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,75);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_SLD_H_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_SLD_H_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_SLD_H_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_PAL_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_PAL_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ItAr_PAL_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,95);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V12()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V12,1);
	B_GiveInvItems(self,other,ItMi_Nugget,95);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V12,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V13()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V13,1);
	B_GiveInvItems(self,other,ItMi_Nugget,95);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V13,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V14()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V14,1);
	B_GiveInvItems(self,other,ItMi_Nugget,95);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V14,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V15()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V15,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V15,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_M_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_M_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,105);
	Npc_RemoveInvItems(self,ITAR_PAL_M_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_PAl_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_PAl_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ItAr_PAl_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V12()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V12,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V12,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V13()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V13,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V13,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V14()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V14,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V14,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V15()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V15,1);
	B_GiveInvItems(self,other,ItMi_Nugget,140);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V15,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_PAL_H_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_PAL_H_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_PAL_H_V2,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_DJG_L,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V2,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V3,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V4,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_L_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_L_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_DJG_L_V5,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,110);
	Npc_RemoveInvItems(self,ITAR_DJG_M,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V1,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V2,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V3,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V4,1);
};


func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_M_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_M_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_DJG_M_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Dargonscale()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Dargonscale,1);
	B_GiveInvItems(self,other,ItMi_Nugget,140);
	Npc_RemoveInvItems(self,ITAR_Dargonscale,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,140);
	Npc_RemoveInvItems(self,ITAR_DJG_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DJG_H_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DJG_H_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,160);
	Npc_RemoveInvItems(self,ITAR_DJG_H_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_DragonKiller()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_DragonKiller,1);
	B_GiveInvItems(self,other,ItMi_Nugget,200);
	Npc_RemoveInvItems(self,ItAr_DragonKiller,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_SHVWarrior()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_SHVWarrior,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ItAr_SHVWarrior,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_LST()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_LST,1);
	B_GiveInvItems(self,other,ItMi_Nugget,70);
	Npc_RemoveInvItems(self,ITAR_TPL_LST,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_TPL_L,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_L_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_L_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_TPL_L_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M,1);
	B_GiveInvItems(self,other,ItMi_Nugget,110);
	Npc_RemoveInvItems(self,ITAR_TPL_M,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_M_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_M_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ITAR_TPL_M_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S,1);
	B_GiveInvItems(self,other,ItMi_Nugget,140);
	Npc_RemoveInvItems(self,ITAR_TPL_S,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TPL_S_V5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TPL_S_V5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,160);
	Npc_RemoveInvItems(self,ITAR_TPL_S_V5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDF_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ItAr_KDF_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDF_H_BLESSED()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDF_H_BLESSED,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_KDF_H_BLESSED,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDF_SH()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDF_SH,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ItAr_KDF_SH,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDW_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_KDW_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDW_SH()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDW_SH,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ItAr_KDW_SH,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_KDW_ADANOS()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_KDW_ADANOS,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_KDW_ADANOS,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DMT_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_DMT_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_OREARMOR()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_OREARMOR,1);
	B_GiveInvItems(self,other,ItMi_Nugget,250);
	Npc_RemoveInvItems(self,ITAR_OREARMOR,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_Raven_Addon()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_Raven_Addon,1);
	B_GiveInvItems(self,other,ItMi_Nugget,250);
	Npc_RemoveInvItems(self,ITAR_Raven_Addon,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H_BELIAR_1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DMT_H_BELIAR_1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,110);
	Npc_RemoveInvItems(self,ITAR_DMT_H_BELIAR_1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DMT_H_BELIAR_3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DMT_H_BELIAR_3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_DMT_H_BELIAR_3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_KDM_SH()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_KDM_SH,1);
	B_GiveInvItems(self,other,ItMi_Nugget,130);
	Npc_RemoveInvItems(self,ItAr_KDM_SH,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_GUR_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_GUR_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,110);
	Npc_RemoveInvItems(self,ITAR_GUR_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_HARADRIMMAGE()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_HARADRIMMAGE,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_HARADRIMMAGE,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_BloodArmor()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_BloodArmor,1);
	B_GiveInvItems(self,other,ItMi_Nugget,170);
	Npc_RemoveInvItems(self,ItAr_BloodArmor,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_01()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_02()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_03()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_03,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_03,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_04()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_04,1);
	B_GiveInvItems(self,other,ItMi_Nugget,90);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_04,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASSASINS_DEMONMAGE()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASSASINS_DEMONMAGE,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_ASSASINS_DEMONMAGE,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_Hun_H()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_Hun_H,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ItAr_Hun_H,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END,1);
	B_GiveInvItems(self,other,ItMi_Nugget,10);
	Npc_RemoveInvItems(self,ITAR_DHT_END,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_01()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_HuntArmor_01,1);
	B_GiveInvItems(self,other,ItMi_Nugget,40);
	Npc_RemoveInvItems(self,ItAr_HuntArmor_01,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_02()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_HuntArmor_02,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ItAr_HuntArmor_02,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_03()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_HuntArmor_03,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ItAr_HuntArmor_03,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_HuntArmor_04()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_HuntArmor_04,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ItAr_HuntArmor_04,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_1()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_1,1);
	B_GiveInvItems(self,other,ItMi_Nugget,20);
	Npc_RemoveInvItems(self,ITAR_DHT_END_1,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_2()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_2,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_DHT_END_2,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_3()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_3,1);
	B_GiveInvItems(self,other,ItMi_Nugget,50);
	Npc_RemoveInvItems(self,ITAR_DHT_END_3,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_4()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_4,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ITAR_DHT_END_4,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_5()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_5,1);
	B_GiveInvItems(self,other,ItMi_Nugget,80);
	Npc_RemoveInvItems(self,ITAR_DHT_END_5,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_DHT_END_6()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_DHT_END_6,1);
	B_GiveInvItems(self,other,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ITAR_DHT_END_6,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASS()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASS,1);
	B_GiveInvItems(self,other,ItMi_Nugget,120);
	Npc_RemoveInvItems(self,ITAR_ASS,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_TOPTHIEF()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_TOPTHIEF,1);
	B_GiveInvItems(self,other,ItMi_Nugget,150);
	Npc_RemoveInvItems(self,ITAR_TOPTHIEF,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ASGARD()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ASGARD,1);
	B_GiveInvItems(self,other,ItMi_Nugget,180);
	Npc_RemoveInvItems(self,ITAR_ASGARD,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ITAR_ADVENTURE_HERO()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ITAR_ADVENTURE_HERO,1);
	B_GiveInvItems(self,other,ItMi_Nugget,30);
	Npc_RemoveInvItems(self,ITAR_ADVENTURE_HERO,1);
};

func void XBS_7513_DARRION_CanSellArmor_Do_ItAr_OldSteelArmor()
{
	B_GivePlayerXP(100);
	B_GiveInvItems(other,self,ItAr_OldSteelArmor,1);
	B_GiveInvItems(self,other,ItMi_Nugget,60);
	Npc_RemoveInvItems(self,ItAr_OldSteelArmor,1);
};
