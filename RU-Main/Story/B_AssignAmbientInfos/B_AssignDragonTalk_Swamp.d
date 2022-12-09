

instance DIA_Dragon_Swamp_Exit(C_Info)
{
	nr = 999;
	condition = DIA_Dragon_Swamp_Exit_Condition;
	information = DIA_Dragon_Swamp_Exit_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Dragon_Swamp_Exit_Condition()
{
	if(DragonTalk_Exit_Free == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_Exit_Info()
{
	Npc_RemoveInvItems(other,ItMi_InnosEye_MIS,1);
	CreateInvItems(other,ItMi_InnosEye_Discharged_Mis,1);
	AI_Output(self,other, " DIA_Dragon_Swamp_Exit_20_00 " );	// The power of the Eye has run out. Your life will end here, man.
	SwampDragon = Hlp_GetNpc(Dragon_Swamp);
	SwampDragon.flags = 0;
	AI_StopProcessInfos(self);
	DragonTalk_Exit_Free = FALSE;

	if(DJG_SwampParty_GoGoGo == TRUE)
	{
		if((DJG_SwampParty == TRUE) && (Npc_IsDead(DJG_Cipher) == FALSE))
		{
			B_StartOtherRoutine(DJG_Rod,"SwampDragon");
		};
		B_StartOtherRoutine(DJG_Cipher,"SwampDragon");
	};
	if(DJG_Biff_Stay == TRUE)
	{
		B_StartOtherRoutine(Biff,"Follow");
		DJG_Biff_Stay = FALSE;
	};
	if(SBMODE == TRUE)
	{
		if(RealMode[2] == TRUE)
		{
			Wld_SpawnNpcRange(hero,SwampGolem,3,500);
		}
		else
		{
			Wld_SpawnNpcRange(hero,SwampGolem,2,500);
		};
	};
};


instance DIA_Dragon_Swamp_Hello(C_Info)
{
	nr = 5;
	condition = DIA_Dragon_Swamp_Hello_Condition;
	information = DIA_Dragon_Swamp_Hello_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Dragon_Swamp_Hello_Condition()
{
	if(Npc_HasItems(other,ItMi_InnosEye_MIS) >= 1)
	{
		return TRUE;
	};
};

func void DIA_Dragon_Swamp_Hello_Info()
{
	AI_Output(self,other, " DIA_Dragon_Swamp_Hello_20_00 " );	// Woe to you if you take one more step forward!
	if(MIS_KilledDragons == 0)
	{
		AI_Output(other,self, " DIA_Dragon_Swamp_Hello_15_01 " );	// Ah. Innos' eye appears to be working.
	};
	AI_Output(self,other, " DIA_Dragon_Swamp_Hello_20_02 " );	// Many of you have come here. I swept them all.
	AI_Output(other,self, " DIA_Dragon_Swamp_Hello_15_03 " );	// Stop talking. Your big words don't frighten me, you stinking creature of the swamp.
	AI_Output(other,self, " DIA_Dragon_Swamp_Hello_15_04 " );	// Tell me what I want to know, or I'll drown you in your own blood.
	AI_Output(self,other, " DIA_Dragon_Swamp_Hello_20_05 " );	// Ha-ha-ha. You dare to threaten me, pathetic worm? Give me one reason why I shouldn't tear you to shreds right now.
	AI_Output(other,self, " DIA_Dragon_Swamp_Hello_15_06 " );	// I am the messenger of Innos, and his Eye is with me. You have no choice. You must submit to my will or you will be destroyed.
	AI_Output(self,other, " DIA_Dragon_Swamp_Hello_20_07 " );	// (roar) Ahh. Say what you need from me.
};


instance DIA_Dragon_Swamp_WERBISTDU(C_Info)
{
	nr = 6;
	condition = DIA_Dragon_Swamp_WERBISTDU_Condition;
	information = DIA_Dragon_Swamp_WERBISTDU_Info;
	description = " Who are you? " ;
};


func int DIA_Dragon_Swamp_WERBISTDU_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Swamp_Hello))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Dragon_Swamp_WERBISTDU_Info()
{
	AI_Output(other,self,"DIA_Dragon_Swamp_WERBISTDU_15_00");	//Кто ты?
	AI_Output(self,other, " DIA_Dragon_Swamp_WERBISTDU_20_01 " );	// My name is Pandrodor. And it's best for you to quickly crawl back under the stone from which you crawled out.
};


instance DIA_Dragon_Swamp_WOSINDDIEANDEREN(C_Info)
{
	nr = 7;
	condition = DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition;
	information = DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info;
	description = " Where can I find the rest of you disgusting creatures? " ;
};


func int DIA_Dragon_Swamp_WOSINDDIEANDEREN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Dragon_Swamp_Hello))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Dragon_Swamp_WOSINDDIEANDEREN_Info()
{
	AI_Output(other,self, " DIA_Dragon_Swamp_WOSINDDIEANDEREN_15_00 " );	// Where can I find the rest of you disgusting creatures?
	AI_Output(self,other, " DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_01 " );	// The elements that make up everything maintain the integrity of this world.
	AI_Output(self,other, " DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_02 " );	// Each of them is responsible for its own part of the world.
	AI_Output(self,other, " DIA_Dragon_Swamp_WOSINDDIEANDEREN_20_03 " );	// Look for the elements and you'll find the rest.
};

func void B_AssignDragonTalk_Swamp(var C_Npc slf)
{
	DIA_Dragon_Swamp_Exit.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_Hello.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WERBISTDU.npc = Hlp_GetInstanceID(slf);
	DIA_Dragon_Swamp_WOSINDDIEANDEREN.npc = Hlp_GetInstanceID(slf);
	B_AssignDragonTalk_Main(slf);
};

