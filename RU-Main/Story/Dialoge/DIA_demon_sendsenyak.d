

instance DIA_DEMON_SENDSENYAK_EXIT(C_Info)
{
	npc = demon_sendsenyak;
	nr = 999;
	condition = dia_demon_sendsenyak_exit_condition;
	information = dia_demon_sendsenyak_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_demon_sendsenyak_exit_condition()
{
	return TRUE;
};

func void dia_demon_sendsenyak_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DEMON_SENDSENYAK_HELLO (C_Info)
{
	npc = demon_sendsenyak;
	nr = 1;
	condition = dia_demon_sendsenyak_hello_condition;
	information = dia_demon_sendsenyak_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_demon_sendsenyak_hello_condition()
{
	if(GIVESBWSENYAK == FALSE)
	{
		return TRUE;
	};
};

func void dia_demon_sendsenyak_hello_info()
{
	be int random;
	random = Hlp_Random( 3 );
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	//Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	Snd_Play("DEM_WARN01");
	if(random == 0)
	{
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_00 " );	// (dead voice) Mortal!..
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_01 " );	// You have what belongs to our master!
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_02 " );	// Give me the Claw of Beliar and I'll spare your life!
	}
	else if(random == 1)
	{
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_00 " );	// (dead voice) Mortal!..
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_04 " );	// My master wants the Claw of Beliar back - this sword is rightfully his only!
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_05 " );	// Give it to me - and you will live...
	}
	else if(random == 2)
	{
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_00 " );	// (dead voice) Mortal!..
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_07 " );	// You must give us the Claw of Beliar! He really needs our master!
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_08 " );	// Do this and we won't hurt you...
	}
	else if(random == 3)
	{
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_00 " );	// (dead voice) Mortal!..
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_10 " );	// You dared to possess something that you do not have enough strength and power for!
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_11 " );	// Beliar's claw belongs to my master and only him!
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_12 " );	// Give him this sword...
	};
	Info_ClearChoices(dia_demon_sendsenyak_hello);
	Info_AddChoice(dia_demon_sendsenyak_hello, " Forget it! " ,dia_demon_sendsenyak_hello_no);
	Info_AddChoice(dia_demon_sendsenyak_hello, " Okay, the claw is yours. " ,dia_demon_sendsenyak_hello_ok);
};

func void dia_demon_sendsenyak_hello_no()
{
	Snd_Play("MYSTERY_04");
	AI_Output(other,self, " DIA_Demon_SendSenyak_Hello_No_01_00 " );	// Forget it!
	AI_Output(other,self, " DIA_SkeletonMage_SendSenyak_1_Hello_No_01_01 " );	// Your master won't get anything from me!
	AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_No_01_02 " );	// Then you will die, mortal!
	AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_No_01_03 " );	// Now you will feel the power of our lord! And you can't run away from her...
	Info_ClearChoices(dia_demon_sendsenyak_hello);
	Info_AddChoice(dia_demon_sendsnyak_hello, " ... " ,dia_demon_sendsnyak_hello_ex1);
};

func void dia_demon_sendsenyak_hello_ok()
{
	Snd_Play("MYSTERY_04");
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Demon_SendSenyak_Hello_Ok_01_00 " );	// Okay, I'll give you the claw.
	B_ClearBeliarsWeapon();
	CreateInvItems(other,ItMw_BeliarWeapon_Raven,1);
	B_GiveInvItems(other,self,ItMw_BeliarWeapon_Raven,1);
	AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_01 " );	// (dead voice) You made the right choice, mortal!
	AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_02 " );	// My master will be pleased...
	AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_03 " );	// With this sword, he will gain truly divine majesty!
	AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_04 " );	// ...and easily complete the design of its creator!
	Info_ClearChoices(dia_demon_sendsenyak_hello);
	Info_AddChoice(dia_demon_sendsenyak_hello, " (что я наделал?..) " ,dia_demon_sendsenyak_hello_ex2);
};

func void dia_demon_sendsenyak_hello_ex1()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.start_aistate = ZS_MM_AllScheduler;
	self.aivar[AIV_EnemyOverride] = FALSE ;
};

func void dia_demon_sendsenyak_hello_ex2()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.start_aistate = zs_mm_rtn_demonrest;
	GIVESBWSENYAK = TRUE;
};

