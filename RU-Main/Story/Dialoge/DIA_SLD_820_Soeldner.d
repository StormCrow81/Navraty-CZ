

instance DIA_Sld_820_EXIT(C_Info)
{
	npc = SLD_820_Soeldner;
	nr = 999;
	condition = DIA_Sld_820_EXIT_Condition;
	information = DIA_Sld_820_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Sld_820_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Sld_820_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Sld_820_Halt(C_Info)
{
	npc = SLD_820_Soeldner;
	nr = 1;
	condition = DIA_Sld_820_Halt_Condition;
	information = DIA_Sld_820_Halt_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Sld_820_Halt_Condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void DIA_Sld_820_Halt_Info()
{
	AI_Output(self,other, " DIA_Sld_820_Halt_07_00 " );	// And where are you going?
	AI_Output(other,self, " DIA_Sld_820_Halt_15_01 " );	// To the house, of course.
	AI_Output(self,other, " DIA_Sld_820_Halt_07_02 " );	// Onar is paying us to keep guys like you out of the house!
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other, " DIA_Sld_820_Halt_07_03 " );	// This is no place for militia! He said exactly that.
	};
	AI_Output(other,self, " DIA_Sld_820_Halt_15_04 " );	// I want to talk to Lee!
	AI_Output(self,other, " DIA_Sld_820_Halt_07_05 " );	// What do you need from him?
	Info_ClearChoices(DIA_Sld_820_Halt);
	Info_AddChoice(DIA_Sld_820_Halt, " He and I are old friends... " ,DIA_Sld_820_Halt_KenneLee);
	if(other.guild == GIL_NONE)
	{
		Info_AddChoice(DIA_Sld_820_Halt, " I want to join the mercenaries! " ,DIA_Sld_820_Halt_WannaJoin);
	};
};

func void B_Sld_820_LeeIsRight()
{
	AI_Output(self,other, " B_Sld_820_LeeIsRight_07_00 " );	// Lee in the right wing. And don't even try to look anywhere else!
};

func void DIA_Sld_820_Halt_WannaJoin()
{
	AI_Output(other,self, " DIA_Sld_820_Halt_WannaJoin_15_00 " );	// I want to join the mercenaries!
	AI_Output(self,other, " DIA_Sld_820_Halt_WannaJoin_07_01 " );	// Ah, fresh cannon fodder! Welcome.
	B_Sld_820_LeeIsRight();
	AI_Output(self,other, " DIA_Sld_820_Halt_WannaJoin_07_02 " );	// But just a warning: leave Onar alone! He really doesn't like it when strangers talk to him. Especially guys like you.
	AI_StopProcessInfos(self);
};

func void DIA_Sld_820_Halt_KenneLee()
{
	AI_Output(other,self, " DIA_Sld_820_Halt_KenneLee_15_00 " );	// He and I are old acquaintances...
	AI_Output(self,other, " DIA_Sld_820_Halt_KenneLee_07_01 " );	// Are you Lee's buddy? I do not believe in that! But anyway, come on in, and if he doesn't recognize you, then hold on... (laughs)
	B_Sld_820_LeeIsRight();
	AI_StopProcessInfos(self);
};


instance DIA_Sld_820_PERM(C_Info)
{
	npc = SLD_820_Soeldner;
	nr = 1;
	condition = DIA_Sld_820_PERM_Condition;
	information = DIA_Sld_820_PERM_Info;
	permanent = TRUE;
	description = " How are you? " ;
};


func int DIA_Sld_820_PERM_Condition()
{
	return TRUE;
};

func void DIA_Sld_820_PERM_Info()
{
	AI_Output(other,self,"DIA_Sld_820_PERM_15_00");	//Как дела?
	AI_Output(self,other, " DIA_Sld_820_PERM_07_01 " );	// Come in if you want, but don't talk here.
	AI_StopProcessInfos(self);
};

