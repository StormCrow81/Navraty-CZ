instance DIA_Ass_178_Prior_ArchDemon_EXIT(C_Info)
{
	npc = Ass_178_Prior_ArchDemon;
	No. = 999 ;
	condition = DIA_Ass_178_Prior_ArchDemon_exit_condition;
	information = DIA_Ass_178_Prior_ArchDemon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Ass_178_Prior_ArchDemon_exit_condition()
{
	return TRUE;
};

func void DIA_Ass_178_Prior_ArchDemon_exit_info()
{
	AI_StopProcessInfos(self);
};

var int GonsHere;

instance DIA_Ass_178_Prior_ArchDemon_Hello(C_Info)
{
	npc = Ass_178_Prior_ArchDemon;
	no. = 1 ;
	condition = DIA_Ass_178_Prior_ArchDemon_hello_condition;
	information = DIA_Ass_178_Prior_ArchDemon_hello_info;
	permanent = FALSE ;
	important= TRUE;
};
	
func int DIA_Ass_178_Prior_ArchDemon_hello_condition()
{
	return TRUE;
};	
	
func void DIA_Ass_178_Prior_ArchDemon_hello_info()
{
	if((GonsalesPW_Up == TRUE) && (GonsalesIsDead == FALSE))
	{
		Npc_ExchangeRoutine(NONE_1190_Assasin,"Temple");
		AI_Teleport(NONE_1190_Assasin,"PW_OUT_TO_IN_CHAMBERS");
		Wld_SendTrigger("EVT_CAM_02");
		GonsHere = TRUE;
		AI_Wait(self,20);
	};

	AI_Output (self, other, " DIA_Ass_178_Prior_ArchDemon_hello_01_00 " );	// So, you managed to find this holy place. Well, so much the worse for you.
	AI_Output (other, self, " DIA_Ass_178_Prior_ArchDemon_hello_01_01 " );	// You can't hide from me.
	AI_Output (self, other, " DIA_Ass_178_Prior_ArchDemon_hello_01_02 " );	// Why do you seek your death with such persistance, little insect?
	AI_Output (self, other, " DIA_Ass_178_Prior_ArchDemon_hello_01_03 " );	// True, the Overlord told me to be wary of your prowess. But the world's mightiest gnat is still just a gnat.
	AI_Output (self, other, " DIA_Ass_178_Prior_ArchDemon_hello_01_04 " );	// I am the chosen of Beliar! Come, you have finally found the death you long for.

	if(GonsHere == TRUE)
	{
		AI_Output (self, other, " DIA_Ass_178_Prior_ArchDemon_hello_01_05 " );	// A-ha. I see your friend Gonzalez is here too.
		AI_Output (self, other, " DIA_Ass_178_Prior_ArchDemon_hello_01_06 " );	// This pathetic worm won't help you!
		AI_Output (self, other, " DIA_Ass_178_Prior_ArchDemon_hello_01_07 " );	// He will die with you, for betraying our Brotherhood!
	};
	if(MIS_RebelsWeapon == LOG_RUNNING)
	{
		MIS_RebelsWeapon = LOG_FAILED;
		B_LogEntry_Failed(TOPIC_RebelsWeapon);
	};

	AI_ReadyMeleeWeapon(self);
	AI_Output (self, other, " DIA_Ass_178_Prior_ArchDemon_hello_01_08 " );	// Enough talking. In the name of Beliar!
	Info_ClearChoices(DIA_Ass_178_Prior_ArchDemon_hello);
	Info_AddChoice(DIA_Ass_178_Prior_ArchDemon_hello,Dialog_Ende,DIA_Ass_178_Prior_ArchDemon_hello_Exit);
};

func void DIA_Ass_178_Prior_ArchDemon_hello_Exit()
{
	var C_Npc Gonsales;

	Gonsales = Hlp_GetNpc(NONE_1190_Assasin);
	Gonsales.attribute[ATR_HITPOINTS] = Gonsales.attribute[ATR_HITPOINTS_MAX];
	Gonsales.aivar [ AIV_PARTYMEMBER ] = TRUE ;
	PlayerIsPrioratFake = TRUE;
	HaniarOrderKill = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_KILL,1);
	B_Attack(Gonsales,self,AR_KILL,1);
};
