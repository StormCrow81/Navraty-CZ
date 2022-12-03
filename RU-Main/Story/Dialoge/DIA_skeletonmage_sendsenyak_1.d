

instance DIA_SKELETONMAGE_SENDSENYAK_1_EXIT(C_Info)
{
	npc = skeletonmage_sendsenyak_1;
	nr = 999;
	condition = dia_skeletonmage_sendsenyak_1_exit_condition;
	information = dia_skeletonmage_sendsenyak_1_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_skeletonmage_sendsenyak_1_exit_condition()
{
	return TRUE;
};

func void dia_skeletonmage_sendsenyak_1_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SKELETONMAGE_SENDSENYAK_1_HELLO(C_Info)
{
	npc = skeletonmage_sendsenyak_1;
	nr = 1;
	condition = dia_skeletonmage_sendsenyak_1_hello_condition;
	information = dia_skeletonmage_sendsenyak_1_hello_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_skeletonmage_sendsenyak_1_hello_condition()
{
	if(GIVESBWSENYAK == FALSE)
	{
		return TRUE;
	};
};

func void dia_skeletonmage_sendsenyak_1_hello_info()
{
	be int random;
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	random = Hlp_Random( 3 );
	if(random == 0)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//...СМЕРТНЫЙ!!!...(мертвым голосом)
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_01 " );	// YOU HAVE SOMETHING THAT IS OUR LORD'S!
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_02 " );	// GIVE ME THE CLAW OF BELIARS AND I WILL SPARE YOUR LIFE...
	}
	else if(random == 1)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//...СМЕРТНЫЙ!!!...(мертвым голосом)
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_04 " );	// MY MASTER WANTS TO GET BELIARA'S CLAW BACK - THIS SWORD IS ONLY HIM'S!
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_05 " );	// GIVE IT TO ME AND YOU WILL STAY LIVING...
	}
	else if(random == 2)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//...СМЕРТНЫЙ!!!...(мертвым голосом)
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_07 " );	// YOU MUST GIVE US THE CLAW OF BELIAR! HE IS VERY NECESSARY TO OUR LORD!
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_08 " );	// DO THIS AND WE WON'T TOUCH YOU... (dead voice)
	}
	else if(random == 3)
	{
		AI_Output(self,other,"DIA_SkeletonMage_SendSenyak_1_Hello_01_00");	//...СМЕРТНЫЙ!!!...(мертвым голосом)
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_10 " );	// YOU DARE TO HAVE WHAT YOU DON'T HAVE ENOUGH STRENGTH AND POWER FOR!
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_11 " );	// BELIARA'S CLAW IS MY LORD AND HIM ONLY!
		AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_01_12 " );	// GIVE THIS SWORD TO HIM... (dead voice)
	};
	Info_ClearChoices(dia_skeletonmage_sendsenyak_1_hello);
	Info_AddChoice(dia_skeletonmage_sendsenyak_1_hello, " Forget it! " ,dia_skeletonmage_sendsenyak_1_hello_no);
	Info_AddChoice(dia_skeletonmage_sendsenyak_1_hello, " Good! Your claw is... " ,dia_skeletonmage_sendsenyak_1_hello_ok);
};

func void dia_skeletonmage_sendsenyak_1_hello_no()
{
	AI_Output(other,self, " DIA_SkeletonMage_SendSenyak_1_Hello_No_01_00 " );	// Forget it...
	AI_Output(other,self, " DIA_SkeletonMage_SendSenyak_1_Hello_No_01_01 " );	// Your master won't get anything from me!
	AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_No_01_02 " );	// THEN YOU WILL DIE, MORTAL!
	AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_No_01_03 " );	// NOW YOU WILL FEEL THE POWER OF OUR LORD! AND YOU CAN'T GET AWAY FROM HER...(dead voice)
	Info_ClearChoices(dia_skeletonmage_sendsenyak_1_hello);
	Info_AddChoice(dia_skeletonmage_sendsenyak_1_hello,"...",dia_skeletonmage_sendsenyak_1_hello_ex1);
};

func void dia_skeletonmage_sendsenyak_1_hello_ok()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_00 " );	// Good! Your claw...
	B_ClearBeliarsWeapon();
	CreateInvItems(hero,ItMw_BeliarWeapon_Raven,1);
	B_GiveInvItems(other,self,ItMw_BeliarWeapon_Raven,1);
	AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_01 " );	// YOU HAVE MADE THE RIGHT CHOICE, MORTAL!
	AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_02 " );	// MY MASTER WILL BE PLEASED... (dead voice)
	AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_03 " );	// WITH THE HELP OF THIS SWORD, HE WILL ACHIEVE A VERY DIVINE GREAT...
	AI_Output(self,other, " DIA_SkeletonMage_SendSenyak_1_Hello_Ok_01_04 " );	// ...AND EASILY COMPLETE THE PLAN OF ITS CREATOR!
	Info_ClearChoices(dia_skeletonmage_sendsenyak_1_hello);
	Info_AddChoice(dia_skeletonmage_sendsenyak_1_hello, " ...(what have I done?!) " ,dia_skeletonmage_sendsenyak_1_hello_ex2);
};

func void dia_skeletonmage_sendsenyak_1_hello_ex1()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.start_aistate = ZS_MM_AllScheduler;
	self.aivar[AIV_EnemyOverride] = FALSE ;
	sndarkskel1.aivar[AIV_EnemyOverride] = FALSE ;
	sndarkskel2.aivar[AIV_EnemyOverride] = FALSE ;
};

func void dia_skeletonmage_sendsenyak_1_hello_ex2()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	self.start_aistate = zs_mm_rtn_demonrest;
	sndarkskel1.start_aistate = zs_mm_rtn_demonrest;
	sndarkskel2.start_aistate = zs_mm_rtn_demonrest;
	GIVESBWSENYAK = TRUE;
};

