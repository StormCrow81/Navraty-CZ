

instance DIA_Pal_212_Schiffswache_EXIT(C_Info)
{
	npc = PAL_212_Schiffswache;
	nr = 999;
	condition = DIA_Pal_212_Schiffswache_EXIT_Condition;
	information = DIA_Pal_212_Schiffswache_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pal_212_Schiffswache_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pal_212_Schiffswache_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Pal_212_Schiffswache_WERSEIDIHR (C_Info)
{
	npc = PAL_212_Schiffswache;
	condition = DIA_Pal_212_Schiffswache_WERSEIDIHR_Condition;
	information = DIA_Pal_212_Schiffswache_WERSEIDIHR_Info;
	description = " Who are you? " ;
};


func int DIA_Pal_212_Schiffswache_WERSEIDIHR_Condition()
{
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void DIA_Pal_212_Schiffswache_WERSEIDIHR_Info()
{
	AI_Output(other,self,"DIA_Pal_212_Schiffswache_WERSEIDIHR_15_00");	//Кто вы?
	AI_Output(self,other, " DIA_Pal_212_Schiffswache_WERSEIDIHR_08_01 " );	// We are emissaries of King Rhobar and servants of Innos. We are also called paladins.
};


instance DIA_Pal_212_Schiffswache_WASMACHSTDU2 (C_Info)
{
	npc = PAL_212_Schiffswache;
	condition = DIA_Pal_212_Schiffswache_WASMACHSTDU2_Condition;
	information = DIA_Pal_212_Schiffswache_WASMACHSTDU2_Info;
	description = " What are you doing here? " ;
};


func int DIA_Pal_212_Schiffswache_WASMACHSTDU2_Condition()
{
	return TRUE;
};

func void DIA_Pal_212_Schiffswache_WASMACHSTDU2_Info()
{
	AI_Output(other,self, " DIA_Pal_212_Schiffswache_WASMACHSTDU2_15_00 " );	// What are you doing here?
	if(MIS_ShipIsFree == FALSE)
	{
		if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
		{
			AI_Output(self,other, " DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_01 " );	// You can't get on this ship. That's all you need to know.
		}
		else
		{
			AI_Output(self,other, " DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_02 " );	// We stand guard here. No one can board this ship. You are included. I'm sorry.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Pal_212_Schiffswache_WASMACHSTDU2_08_03 " );	// People like you make me waste my time. I'd rather go with our brothers to the Valley of Mines.
	};
	AI_StopProcessInfos(self);
};

