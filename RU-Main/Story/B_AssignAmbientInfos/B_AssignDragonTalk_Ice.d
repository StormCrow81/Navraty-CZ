

instance DIA_Dragon_Ice_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Ice_Exit_Condition;
	information = DIA_Dragon_Ice_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Ice_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Dragon_Ice_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other, " DIA_Dragon_Ice_Exit_20_00 " );	// The power of the Eye has faded, and your time is up.
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;
	self.flags = 0;

	if(DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};

	Wld_SpawnNpcRange(hero,IceGolem_Dragon,2,500);
};


instance DIA_Dragon_Ice_Hello(C_Info)
{
	nr = 1;
	condition = DIA_Dragon_Ice_Hello_Condition;
	information = DIA_Dragon_Ice_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Ice_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return  1 ;
	};
	return 0;
};

func void DIA_Dragon_Ice_Hello_Info()
{
	AI_Output(self,other, " DIA_Dragon_Ice_Hello_20_00 " );	// Why did you disturb my sleep? Should I dig even deeper so that you pesky flies will finally leave me alone?
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self, " DIA_Dragon_Ice_Hello_15_01 " );	// Talking dragon. Thank you Eye of Innos.
	};
	AI_Output(self,other, " DIA_Dragon_Ice_Hello_20_02 " );	// You humans are funny creatures. Even if you are all blown away by the icy winds of death, there will always be at least one who rises from the ashes, thinking that he is destined to become a hero.
	AI_Output(self,other, " DIA_Dragon_Ice_Hello_20_03 " );	// But soon it will all be over. I will personally see to it that none of you rise again.
	AI_Output(other,self, " DIA_Dragon_Ice_Hello_15_04 " );	// Silence! By the power of the sacred Eye that is bestowed upon me from above, I command you to answer my questions.
	AI_Output(self,other, " DIA_Dragon_Ice_Hello_20_05 " );	// Ha-ha-ha. Then ask. But your knowledge will not help you.
};


instance DIA_Dragon_Ice_WERBISTDU(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Ice_WERBISTDU_Condition;
	information = DIA_Dragon_Ice_WERBISTDU_Info;
	description = " Who are you? " ;
};


func int DIA_Dragon_Ice_WERBISTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Ice_Hello))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Dragon_Ice_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_WERBISTDU_15_00");	//Кто ты?
	AI_Output(self,other, " DIA_Dragon_Ice_WERBISTDU_20_01 " );	// I am Finkreg, lord of ice and snow, Sentinel of Congress and your imminent death!
};

func void B_AssignDragonTalk_Ice(var C_Npc slf)
{
	DIA_Dragon_Ice_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Ice_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

