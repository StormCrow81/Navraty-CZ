

instance DIA_Addon_Telbor_EXIT(C_Info)
{
	npc = STRF_1121_Addon_Telbor;
	nr = 999;
	condition = DIA_Addon_Telbor_EXIT_Condition;
	information = DIA_Addon_Telbor_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Telbor_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Telbor_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


var int Telbor_Once;

instances of DIA_Addon_Telbor_Hi (C_Info)
{
	npc = STRF_1121_Addon_Telbor;
	nr = 2;
	condition = DIA_Addon_Telbor_Hi_Condition;
	information = DIA_Addon_Telbor_Hi_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Telbor_Hi_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && !Npc_IsDead(Patrick) && !Npc_IsDead(Pardos))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Telbor_Hi_Info()
{
	AI_Output(self,other, " DIA_Addon_Telbor_Hi_12_00 " );	// Hey, I'm fine.
	if (slave_escape ==  FALSE )
	{
		if (Pardos_Healed ==  FALSE )
		{
			AI_Output(self,other, " DIA_Addon_Telbor_Hi_12_01 " );	// But Pardos doesn't look good at all.
		}
		else
		{
			AI_Output(self,other, " DIA_Addon_Telbor_Hi_12_02 " );	// Thanks for helping Pardos.
			if(Telbor_Once == FALSE)
			{
				B_GivePlayerXP(XP_Ambient);
				Telbor_Once = TRUE;
			};
		};
	};
	AI_Output(self,other, " DIA_Addon_Telbor_Hi_12_03 " );	// If you need anything, talk to Patrick. He is our senior.
	AI_StopProcessInfos(self);
};

