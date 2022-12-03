

instance DIA_ORC_6666_XASH_GOR_EXIT(C_Info)
{
	npc = orc_6666_hash_gor;
	condition = dia_orc_6666_xash_gor_exit_condition;
	information = dia_orc_6666_xash_gor_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_6666_xash_gor_exit_condition()
{
	return TRUE;
};

func void dia_orc_6666_xash_gor_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_6666_XASH_GOR_FINALLY(C_Info)
{
	npc = orc_6666_hash_gor;
	condition = dia_orc_6666_xash_gor_finally_condition;
	information = dia_orc_6666_xash_gor_finally_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_orc_6666_xash_gor_finally_condition()
{
	return TRUE;
};

func void dia_orc_6666_xash_gor_finally_info()
{
	Wld_SendTrigger("EVT_ORCGRYRD_HASHGOR");
	AI_Output(self,other, " DIA_Orc_6666_Xash_Gor_Finally_Info_18_01 " );	// Mortal!
	AI_Output(self,other, " DIA_Orc_6666_Xash_Gor_Finally_Info_18_02 " );	// How dare you disturb me?
	AI_Output(self,other, " DIA_Orc_6666_Xash_Gor_Finally_Info_18_03 " );	// Prepare to die!
	AI_Output(other,self, " DIA_Orc_6666_Xash_Gor_Finally_Info_18_04 " );	// We'll see which of us will have to prepare for death - you rotten corpse!
	AI_Output(self,other, " DIA_Orc_6666_Xash_Gor_Finally_Info_18_05 " );	// Now you will die!!!
	HashGorBattleStart = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_XASHGUARD_01");
		Wld_InsertNpc(UndeadOrcWarrior,"FP_ROAM_XASHGUARD_02");
	};

	B_Attack(self,other,AR_NONE,0);
};
