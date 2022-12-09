

instance DIA_Dragon_Fire_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Fire_Exit_Condition;
	information = DIA_Dragon_Fire_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Fire_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Dragon_Fire_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other, " DIA_Dragon_Fire_Exit_20_00 " );	// The eye has lost its power, and you won't live to see the next dawn.
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;

	if(DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};

	Wld_SpawnNpcRange(hero,FireGolem_Dragon,2,500);
};


instance DIA_Dragon_Fire_Hello(C_Info)
{
	nr = 1;
	condition = DIA_Dragon_Fire_Hello_Condition;
	information = DIA_Dragon_Fire_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Fire_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return  1 ;
	};
	return  FALSE ;
};

func void DIA_Dragon_Fire_Hello_Info()
{
	Wld_SendTrigger("FIREDRAGON_GATE");
	AI_Output(self,other, " DIA_Dragon_Fire_Hello_20_00 " );	// I can't believe there are still people willing to give their lives just to see a living dragon.
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self, " DIA_Dragon_Fire_Hello_15_01 " );	// You're pretty clear for such a bulky monster.
	};
	AI_Output(other,self, " DIA_Dragon_Fire_Hello_15_02 " );	// I didn't come to see you. I'm afraid my goals are somewhat more radical.
	AI_Output(self,other, " DIA_Dragon_Fire_Hello_20_03 " );	// Are you saying you're ready to challenge me to a fight?
	AI_Output(self,other, " DIA_Dragon_Fire_Hello_20_04 " );	// Ha-ha-ha! I'll break your flimsy neck.
	AI_PlayAni(hero,"T_INNOSEYE");
	AI_Output(other,self, " DIA_Dragon_Fire_Hello_15_05 " );	// Not so fast, mate. The Eye of Innos is with me! You cannot resist my will. Answer my questions, otherwise unbearable agony awaits you.
	AI_Output(self,other, " DIA_Dragon_Fire_Hello_20_06 " );	// Ahhh...(roaring) Then ask your stupid questions while you still can. Your strength will not last long.
};


instance DIA_Dragon_Fire_WerBistDu(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Fire_WerBistDu_Condition;
	information = DIA_Dragon_Fire_WerBistDu_Info;
	description = " Who are you? " ;
};


func int DIA_Dragon_Fire_WerBistDu_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Fire_Hello))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Dragon_Fire_WerBistDu_Info()
{
	AI_Output(other,self,"DIA_Dragon_Fire_WerBistDu_15_00");	//Кто ты?
	AI_Output(self,other, " DIA_Dragon_Fire_WerBistDu_20_01 " );	// My name is Feomatar, and that's all you'll know about me.
	AI_Output(self,other, " DIA_Dragon_Fire_WerBistDu_20_02 " );	// When the spell of the Eye releases me, you will burn in the fire.
};


instance DIA_Dragon_Fire_HORT(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Fire_HORT_Condition;
	information = DIA_Dragon_Fire_HORT_Info;
	description = " Where is your treasure chest? " ;
};


func int DIA_Dragon_Fire_HORT_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Fire_Hello))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Dragon_Fire_HORT_Info()
{
	AI_Output(other,self, " DIA_Dragon_Fire_HORT_15_00 " );	// Each dragon has a treasury where he keeps his treasures. Where is your treasure?
	AI_Output(self,other, " DIA_Dragon_Fire_HORT_20_01 " );	// In a place that will be inaccessible to you when I am free from the bonds of the Eye.
	AI_Output(self,other, " DIA_Dragon_Fire_HORT_20_02 " );	// I keep my treasures high up in these hot cliffs, where it's almost impossible for a wingless creature like you to reach.
};

func void B_AssignDragonTalk_Fire(var C_Npc slf)
{
	DIA_Dragon_Fire_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_WerBistDu.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Fire_HORT.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

