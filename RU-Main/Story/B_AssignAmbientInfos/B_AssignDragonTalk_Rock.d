

instance DIA_Dragon_Rock_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Rock_Exit_Condition;
	information = DIA_Dragon_Rock_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Rock_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Dragon_Rock_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other, " DIA_Dragon_Rock_Exit_20_00 " );	// But stop talking! Your temporary power has run out. The eye has lost its power. Prepare to die...
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;
	Wld_SpawnNpcRange(hero,StoneGolem_Dragon,2,500);
};


instance DIA_Dragon_Rock_Hello(C_Info)
{
	nr = 1;
	condition = DIA_Dragon_Rock_Hello_Condition;
	information = DIA_Dragon_Rock_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Rock_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Rock_Hello_Info()
{
	Wld_SendTrigger("STONEDRAGON_GATE");
	AI_Output(self,other, " DIA_Dragon_Rock_Hello_20_00 " );	// Another arrogant human dared to climb my rock. You people are so pathetic. So brave and so weak.
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self, " DIA_Dragon_Rock_Hello_15_01 " );	// Look, he's really talking.
	};
	AI_Output(self,other, " DIA_Dragon_Rock_Hello_20_02 " );	// I'll rip out your insides and feed them to the rats.
	AI_Output(other,self, " DIA_Dragon_Rock_Add_15_00 " );	// Not so fast. I have the Eye of Innos with me. You will obey me and answer my questions.
	AI_Output(self,other, " DIA_Dragon_Rock_Hello_20_04 " );	// (roar) Ahh. Ask your questions.
};


instance DIA_Dragon_Rock_WERBISTDU(C_Info)
{
	nr = 6;
	condition = DIA_Dragon_Rock_WERBISTDU_Condition;
	information = DIA_Dragon_Rock_WERBISTDU_Info;
	description = " Who are you? " ;
};


func int DIA_Dragon_Rock_WERBISTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Rock_Hello))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Dragon_Rock_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Dragon_Rock_WERBISTDU_15_00");	//Кто ты?
	AI_Output(self,other, " DIA_Dragon_Rock_WERBISTDU_20_01 " );	// My name is Pedrakan, and I'll slowly, slowly, skin you when I get to you.
};


instance DIA_Dragon_Rock_HIERARCHIE(C_Info)
{
	nr = 7;
	condition = DIA_Dragon_Rock_HIERARCHIE_Condition;
	information = DIA_Dragon_Rock_HIERARCHIE_Info;
	description = " Who is the strongest among you dragons? " ;
};


func int DIA_Dragon_Rock_HIERARCHIE_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Rock_Hello))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Dragon_Rock_HIERARCHIE_Info()
{
	AI_Output(other,self, " DIA_Dragon_Rock_HIERARCHIE_15_00 " );	// Who is the strongest of you dragons?
	AI_Output(self,other, " DIA_Dragon_Rock_HIERARCHIE_20_01 " );	// We draw our strength from the elements of this world. The hierarchy is clear and simple.
	AI_Output(self,other, " DIA_Dragon_Rock_HIERARCHIE_20_02 " );	// The earth covered with soft soil gives life to all creatures that live under the sun. But it can open up and swallow you whole if you get too close.
	AI_Output(self,other, " DIA_Dragon_Rock_HIERARCHIE_20_03 " );	// The rock, which would rather split than give in, proudly rises above all and buries the careless under it. It also provides better protection against the tide.
	AI_Output(self,other, " DIA_Dragon_Rock_HIERARCHIE_20_04 " );	// The sparks of life live in the deep fires of this world. And the fire burns everything with its breath, leaving behind nothing but ashes.
	AI_Output(self,other, " DIA_Dragon_Rock_HIERARCHIE_20_05 " );	// All these elements are preserved and destroyed. But only in the water, which has become hard as a rock, everything turns into an eternal column of salt, where life is hardly possible.
};

func void B_AssignDragonTalk_Rock(var C_Npc slf)
{
	DIA_Dragon_Rock_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Rock_HIERARCHIE.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

