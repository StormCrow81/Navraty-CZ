
instance DIA_SEK_168_SLAVEOBSSEK_What(C_Info)
{
	npc = SEK_168_SLAVEOBSSEK;
	nr = 1;
	condition = DIA_SEK_168_SLAVEOBSSEK_What_Condition;
	information = DIA_SEK_168_SLAVEOBSSEK_What_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_SEK_168_SLAVEOBSSEK_What_Condition()
{
	if((Npc_IsDead(Ass_167_Adept_Convoy) == TRUE) && (PW_WelcomeToHram == FALSE))
	{
		return TRUE;
	};
};

func void DIA_SEK_168_SLAVEOBSSEK_What_Info()
{
	AI_Output(self,other, " DIA_SEK_168_SLAVEOBSSEK_What_01_00 " );	// What have you done? (panicked) Now we're all going to die! They will find us and kill us.
	AI_Output(other,self, " DIA_SEK_168_SLAVEOBSSEK_What_01_01 " );	// Calm down! Just keep quiet about what happened here and everything will be fine.
	AI_Output(self,other, " DIA_SEK_168_SLAVEOBSSEK_What_01_02 " );	// Fine, whatever you say... just don't kill me!
	AI_Output(other,self, " DIA_SEK_168_SLAVEOBSSEK_What_01_03 " );	// It's up to you.
	CreateInvItems(hero,ITAR_ASSASINS_03,1);
	AI_EquipArmor(hero, ITAR_ASSASINS_03 );
	AI_Output(other,self, " DIA_SEK_168_SLAVEOBSSEK_What_01_04 " );	// Now I'll take you back to the temple. Come after me!
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	PW_WelcomeToHram = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMasiafTemple");
};

instance DIA_SEK_168_SLAVEOBSSEK_STANDARD(C_Info)
{
	npc = SEK_168_SLAVEOBSSEK;
	nr = 2;
	condition = DIA_SEK_168_SLAVEOBSSEK_Condition;
	information = DIA_SEK_168_SLAVEOBSSEK_Info;
	permanent = TRUE;
	important = TRUE;
};

func int DIA_SEK_168_SLAVEOBSSEK_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (PW_WelcomeToHram == TRUE))
	{
		return TRUE;
	};
};

func void DIA_SEK_168_SLAVEOBSSEK_Info()
{
	be int randy;

	randy = Hlp_Random( 3 );

	if(randy == 0)
	{
		AI_Output(self,other, " DIA_SEK_168_STANDARD_13_00 " );	// Leave me alone!
	};
	if(randy == 1)
	{
		AI_Output(self,other, " DIA_SEK_168_STANDARD_13_01 " );	// What do you want from me? Leave me alone!
	};
	if(randy == 2)
	{
		AI_Output(self,other, " DIA_SEK_168_STANDARD_13_02 " );	// We're all going to die here!
	};

	AI_StopProcessInfos(self);
};
