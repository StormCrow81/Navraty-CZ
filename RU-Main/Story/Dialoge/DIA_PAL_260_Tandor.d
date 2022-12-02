

instance DIA_Tandor_EXIT (C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_EXIT_Condition;
	information = DIA_Tandor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_EXIT_Condition()
{
	if (chapter <  3 )
	{
		return TRUE;
	};
};

func void DIA_Tandor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_Hallo (C_Info)
{
	npc = PAL_260_Tandor;
	nr = 2;
	condition = DIA_Tandor_Hallo_Condition;
	information = DIA_Tandor_Hallo_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Tandor_Hallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Tandor_Hallo_Info()
{
	AI_Output(self,other, " DIA_Tandor_Hallo_08_00 " );	// Did you come through the Passage? This is good. We've already lost a lot of good people there.
	AI_Output(self,other, " DIA_Tandor_Hallo_08_01 " );	// I know what it's like there - I served in the reconnaissance squad for a while.
	AI_Output(self,other, " DIA_Tandor_Hallo_08_02 " );	// Do you have a weapon? If you need a good weapon, contact me.
	Log_CreateTopic(TOPIC_Trader_OC,LOG_NOTE);
	B_LogEntry(TOPIC_Trader_OC, " Tandor trades weapons in the castle. " );
};


instance DIA_Tandor_Trupp (C_Info)
{
	npc = PAL_260_Tandor;
	nr = 2;
	condition = DIA_Tandor_Trupp_Condition;
	information = DIA_Tandor_Trupp_Info;
	permanent = FALSE;
	description = " What happened to this squad? " ;
};


func int DIA_Tandor_Trupp_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Tandor_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Tandor_Trupp_Info()
{
	AI_Output(other,self, " DIA_Tandor_Trupp_15_00 " );	// What happened to this unit?
	AI_Output(self,other, " DIA_Tandor_Trupp_08_01 " );	// We were reconnaissance, and we were going to move towards the coast. We set up camp in a cave.
	AI_Output(self,other, " DIA_Tandor_Trupp_08_02 " );	// But the orcs came late at night. They lit the slope with torches and found us.
	AI_Output(self,other, " DIA_Tandor_Trupp_08_03 " );	// We tried to hide, but I'm the only one who managed to get through.
	AI_Output(self,other, " DIA_Tandor_Trupp_08_04 " );	// Soon after, the orcs erected a huge palisade, and we had to retreat to the castle.
};


instance DIA_TANDOR_TRUPPFINDED (C_Info)
{
	npc = PAL_260_Tandor;
	nr = 2;
	condition = dia_tandor_truppfinded_condition;
	information = dia_tandor_truppfound_info;
	permanent = FALSE;
	description = " I found your group! " ;
};


func int dia_tandor_truppfinded_condition()
{
	if(SAYTOTANDORABOUTGROUP == TRUE)
	{
		return TRUE;
	};
};

func void dia_tandor_truppfinded_info()
{
	AI_Output(other,self, " DIA_Tandor_TruppFinded_15_00 " );	// I found your group. They are alive! Albert says hello to you.
	AI_Output(self,other, " DIA_Tandor_TruppFinded_08_01 " );	// Innos righteous! So they got away? What joyful news!
	AI_Output(self,other, " DIA_Tandor_TruppFinded_08_02 " );	// Where are they now?
	AI_Output(other,self, " DIA_Tandor_TruppFinded_15_03 " );	// Behind the orc fence, in a cave.
	AI_Output(other,self, " DIA_Tandor_TruppFinded_15_04 " );	// It's safe there, but getting into the castle from there is very difficult.
	AI_Output(self,other, " DIA_Tandor_TruppFinded_08_05 " );	// Nothing. The main thing is that they are alive and that they are safe! I'm sure I'll get a chance to meet them again!
	AI_Output(self,other, " DIA_Tandor_TruppFinded_08_06 " );	// Bless you Innos, good man! You delivered me from the burden of spiritual lamentation and grief for my comrades.
	B_GivePlayerXP(XP_Ambient * 2);
};


instance DIA_Tandor_Trade(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 900;
	condition = DIA_Tandor_Trade_Condition;
	information = DIA_Tandor_Trade_Info;
	permanent = TRUE;
	trade = TRUE;
	description = " Show me your products. " ;
};


func int DIA_Tandor_Trade_Condition()
{
	return TRUE;
};

func void DIA_Tandor_Trade_Info()
{
	if(C_BodyStateContains(self,BS_SIT))
	{
		AI_Standup(self);
		AI_TurnToNPC(self,other);
	};

	AI_Output(other,self, " DIA_Tandor_Trade_15_00 " );	// Show me your products.
	B_GiveTradeInv(self);
};


instance DIA_Tandor_Equipment(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 3;
	condition = DIA_Tandor_Equipment_Condition;
	information = DIA_Tandor_Equipment_Info;
	description = " Garond sent me - I need equipment. " ;
};


func int DIA_Tandor_Equipment_Condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Garond_Equipment ) & & ( other . guild == GIL_MIL ) && ( Chapter == 2 )) ;  
	{
		return TRUE;
	};
};

func void DIA_Tandor_Equipment_Info()
{
	AI_Output(other,self, " DIA_Tandor_Equipment_15_00 " );	// Garond sent me - I need equipment.
	AI_Output(self,other, " DIA_Tandor_Equipment_08_01 " );	// For melee or ranged combat?
	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment, " Melee " ,DIA_Tandor_Equipment_Nah);
	Info_AddChoice(DIA_Tandor_Equipment, " Ranged " ,DIA_Tandor_Equipment_Fern);
};

func void DIA_Tandor_Equipment_Nah()
{
	AI_Output(other,self, " DIA_Tandor_Equipment_Nah_15_00 " );	// For close combat.
	AI_Output(self,other, " DIA_Tandor_Equipment_Nah_08_01 " );	// One-handed or two-handed?
	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment, " One-Handed Weapon " ,DIA_Tandor_Equipment_Ein);
	Info_AddChoice(DIA_Tandor_Equipment, " Two-Handed Weapon " ,DIA_Tandor_Equipment_Zwei);
};

func void DIA_Tandor_Equipment_Fern()
{
	AI_Output(other,self, " DIA_Tandor_Equipment_Fern_15_00 " );	// For ranged combat.
	AI_Output(self,other, " DIA_Tandor_Equipment_Fern_08_01 " );	// Bow or crossbow?
	Info_ClearChoices(DIA_Tandor_Equipment);
	Info_AddChoice(DIA_Tandor_Equipment,"Лук ",DIA_Tandor_Equipment_Bow);
	Info_AddChoice(DIA_Tandor_Equipment, " Box " ,DIA_Tandor_Equipment_Crossbow);
};

func void DIA_Tandor_Equipment_Ein()
{
	AI_Output(other,self, " DIA_Tandor_Equipment_Ein_15_00 " );	// One-handed.
	AI_Output(self,other, " DIA_Tandor_Equipment_Ein_08_01 " );	// Then take this stone crusher. This is a good weapon.
	B_GiveInvItems(self,other,ItMw_Steinbrecher, 1 );
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Zwei()
{
	AI_Output(other,self, " DIA_Tandor_Equipment_Zwei_15_00 " );	// Two-handed.
	AI_Output(self,other, " DIA_Tandor_Equipment_Zwei_08_01 " );	// You'll love this two-hander.
	B_GiveInvItems(self,other,ItMw_Zweihaender1,1);
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Bow()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Bow_15_00");	//Лук.
	AI_Output(self,other, " DIA_Tandor_Equipment_Bow_08_01 " );	// This hunting bow is perfect for you. I will also give you a quiver of arrows.
	B_GiveInvItems(self,other,ItRw_Bow_L_03,1);
	B_GiveInvItems(self,other,ItRw_Arrow,50);
	Info_ClearChoices(DIA_Tandor_Equipment);
};

func void DIA_Tandor_Equipment_Crossbow()
{
	AI_Output(other,self,"DIA_Tandor_Equipment_Crossbow_15_00");	//Арбалет.
	AI_Output(self,other, " DIA_Tandor_Equipment_Crossbow_08_01 " );	// Then take this light crossbow. And bolts to it in addition.
	B_GiveInvItems(self,other,ItRw_Crossbow_L_02,1);
	B_GiveInvItems(self,other,ItRw_Bolt,10);
	Info_ClearChoices(DIA_Tandor_Equipment);
};


instance DIA_Tandor_KAP3_EXIT(C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP3_EXIT_Condition;
	information = DIA_Tandor_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP3_EXIT_Condition()
{
	if (chapter ==  3 )
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_KAP4_EXIT (C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP4_EXIT_Condition;
	information = DIA_Tandor_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP4_EXIT_Condition()
{
	if (chapter ==  4 )
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_News (C_Info)
{
	npc = PAL_260_Tandor;
	nr = 40;
	condition = DIA_Tandor_News_Condition;
	information = DIA_Tandor_News_Info;
	permanent = TRUE;
	description = " Any news? " ;
};


func int DIA_Tandor_News_Condition()
{
	if ((Capital ==  4 ) && Npc_KnowsInfo(hero, DIA_Tandor_Hello))
	{
		return TRUE;
	};
};

func void DIA_Tandor_News_Info()
{
	AI_Output(other,self, " DIA_Tandor_News_15_00 " );	// Any news?
	if(hero.guild == GIL_DJG)
	{
		AI_Output(self,other, " DIA_Tandor_News_08_01 " );	// The only news lately is that you dragon hunters are here.
	}
	else
	{
		AI_Output(self,other, " DIA_Tandor_News_08_02 " );	// The dragon hunters have arrived here.
		AI_Output(self,other, " DIA_Tandor_News_08_03 " );	// Looks like they're tough bastards. I hope this is true, otherwise they are unlikely to survive here.
	};
};


instance DIA_Tandor_KAP5_EXIT (C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP5_EXIT_Condition;
	information = DIA_Tandor_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP5_EXIT_Condition()
{
	if (chapter ==  5 )
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_WASISTLOS (C_Info)
{
	npc = PAL_260_Tandor;
	nr = 51;
	condition = DIA_Tandor_WASISTLOS_Condition;
	information = DIA_Tandor_WASISTLOS_Info;
	permanent = TRUE;
	description = " You're not happy. " ;
};


func int DIA_Tandor_WASISTLOS_Condition()
{
	if ((Capital ==  5 ) && Npc_KnowsInfo(hero,DIA_Tandor_Hello))
	{
		return TRUE;
	};
};

func void DIA_Tandor_WASISTLOS_Info()
{
	AI_Output(other,self, " DIA_Tandor_WASISTLOS_15_00 " );	// Something you are not cheerful.
	if(MIS_OCGateOpen == TRUE)
	{
		AI_Output(self,other, " DIA_Tandor_WASISTLOS_08_01 " );	// Orcs are pouring in. Soon we will all be finished.
	}
	else
	{
		AI_Output(self,other, " DIA_Tandor_WASISTLOS_08_02 " );	// Food supplies are running low. We are starving.
	};
};


instance DIA_Tandor_KAP6_EXIT (C_Info)
{
	npc = PAL_260_Tandor;
	nr = 999;
	condition = DIA_Tandor_KAP6_EXIT_Condition;
	information = DIA_Tandor_KAP6_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Tandor_KAP6_EXIT_Condition()
{
	if (Chapter >=  6 )
	{
		return TRUE;
	};
};

func void DIA_Tandor_KAP6_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Tandor_PICKPOCKET (C_Info)
{
	npc = PAL_260_Tandor;
	nr = 900;
	condition = DIA_Tandor_PICKPOCKET_Condition;
	information = DIA_Tandor_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Tandor_PICKPOCKET_Condition()
{
	return  C_Robbery ( 47 , 90 );
};

func void DIA_Tandor_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
	Info_AddChoice(DIA_Tandor_PICKPOCKET,Dialog_Back,DIA_Tandor_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Tandor_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_Tandor_PICKPOCKET_DoIt);
};

func void DIA_Tandor_PICKPOCKET_DoIt()
{
	B_Robbery();
	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
};

func void DIA_Tandor_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Tandor_PICKPOCKET);
};

