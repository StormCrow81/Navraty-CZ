

instance DIA_328_Miliz_EXIT(C_Info)
{
	npc = Mil_328_Miliz;
	nr = 999;
	condition = DIA_328_Miliz_EXIT_Condition;
	information = DIA_328_Miliz_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_328_Miliz_EXIT_Condition()
{
	return TRUE;
};

func void DIA_328_Miliz_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instances DIA_328_Miliz_Hi (C_Info)
{
	npc = Mil_328_Miliz;
	nr = 1;
	condition = DIA_328_Miliz_Hi_Condition;
	information = DIA_328_Miliz_Hi_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_328_Miliz_Hi_Condition()
{
	return TRUE;
};

func void DIA_328_Miliz_Hi_Info()
{
	AI_Output(self,other, " DIA_328_Miliz_Hi_08_00 " );	// Hey, there's nothing for you to do here. Clear?
	AI_Output(other,self, " DIA_328_Miliz_Hi_15_01 " );	// Who are you?
	AI_Output(self,other, " DIA_328_Miliz_Hi_08_02 " );	// It's none of your business! I'm in charge here. Understood?
	AI_Output(other,self, " DIA_328_Miliz_Hi_15_03 " );	// Main? Above what? Over those chests?
	AI_Output(self,other, " DIA_328_Miliz_Hi_08_04 " );	// Hey, this warehouse is in my charge, got it? So get out or I'll crack your skull open.
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,30);
};


instance DIA_328_Miliz_Kill (C_Info)
{
	npc = Mil_328_Miliz;
	nr = 2;
	condition = DIA_328_Miliz_Kill_Condition;
	information = DIA_328_Miliz_Kill_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_328_Miliz_Kill_Condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void DIA_328_Miliz_Kill_Info()
{
	AI_Output(self,other, " DIA_328_Miliz_Kill_08_00 " );	// Hey, you're still here! Didn't I tell you to get lost?
	AI_Output(self,other, " DIA_328_Miliz_Kill_08_01 " );	// Well, hold on! Now I'll show you who's in charge here!
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,20);
	B_Attack(self,other,AR_KILL,1);
};

