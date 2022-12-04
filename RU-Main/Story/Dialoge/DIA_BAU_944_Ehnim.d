
instance DIA_Ehnim_EXIT(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 999;
	condition = DIA_Ehnim_EXIT_Condition;
	information = DIA_Ehnim_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Ehnim_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Ehnim_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_HALLO (C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 3;
	condition = DIA_Ehnim_HALLO_Condition;
	information = DIA_Ehnim_HALLO_Info;
	description = " Who are you? " ;
};


func int DIA_Ehnim_HALLO_Condition()
{
	return TRUE;
};

func void DIA_Ehnim_HALLO_Info()
{
	AI_Output(other,self,"DIA_Ehnim_HALLO_15_00");	//Who are you?
	AI_Output(self,other, " DIA_Ehnim_HALLO_12_01 " );	// My name is Ehnim. I work here.
	if(Hlp_IsValidNpc(Egill) && !C_NpcIsDown(Egill))
	{
		AI_Output(self,other, " DIA_Ehnim_HALLO_12_02 " );	// And the short one over there is my brother Egill.
	};
	AI_Output(self,other, " DIA_Ehnim_HALLO_12_03 " );	// We have been working here at Akila's Farm for several years.
};


instance DIA_Ehnim_FELDARBEIT (C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 4;
	condition = DIA_Ehnim_FELDARBEIT_Condition;
	information = DIA_Ehnim_FELDARBEIT_Info;
	description = " How is the work going in the field? " ;
};


func int DIA_Ehnim_FELDARBEIT_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Knows_HELLO ))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_FELDARBEIT_Info()
{
	AI_Output(other,self, " DIA_Ehnim_FELDARBEIT_15_00 " );	// How is work going?
	AI_Output(self,other, " DIA_Ehnim_FELDARBEIT_12_01 " );	// Do you want to help? There is another hoe here. Take it and go out into the field.
	AI_Output(self,other, " DIA_Ehnim_FELDARBEIT_12_02 " );	// You just need to be careful that the field predators do not sneak up on you unnoticed. They will end you before you can even blink.
};


instance DIA_Ehnim_FELDRAEUBER(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 5;
	condition = DIA_Ehnim_FELDRAEUBER_Condition;
	information = DIA_Ehnim_FELDRAEUBER_Info;
	description = " Why aren't you doing anything to these field predators? " ;
};


func int DIA_Ehnim_FELDRAEUBER_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Ehnim_FELDARBEIT))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_FELDRAEUBER_Info()
{
	AI_Output(other,self, " DIA_Ehnim_FELDRAEUBER_15_00 " );	// Why aren't you doing anything about these field predators?
	AI_Output(self,other, " DIA_Ehnim_FELDRAEUBER_12_01 " );	// I've killed so many of them I've lost count. But the problem is that new ones take the place of the dead.
};


instance DIA_Ehnim_STREIT1 (C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 6;
	condition = DIA_Ehnim_STREIT1_Condition;
	information = DIA_Ehnim_STREIT1_Info;
	description = " Your brother told me the same thing. " ;
};


func int DIA_Ehnim_STREIT1_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_FELDRAEUBER) && Npc_KnowsInfo(other,DIA_Ehnim_FELDRAEUBER) && (Npc_KnowsInfo(other,DIA_Egill_STREIT2) == FALSE) && (Hlp_IsValidNpc(Egill) && !C_NpcIsDown(Egill)))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT1_Info()
{
	AI_Output(other,self, " DIA_Ehnim_STREIT1_15_00 " );	// Your brother told me the same thing.
	AI_Output(self,other, " DIA_Ehnim_STREIT1_12_01 " );	// What? That coward? Yes, he always disappears as soon as the creatures even come close to our land.
	AI_Output(self,other, " DIA_Ehnim_STREIT1_12_02 " );	// He shouldn't spout nonsense.
};


instance DIA_Ehnim_STREIT3 (C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 7;
	condition = DIA_Ehnim_STREIT3_Condition;
	information = DIA_Ehnim_STREIT3_Info;
	description = " Your brother thinks you're a braggart. " ;
};


func int DIA_Ehnim_STREIT3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Egill_STREIT2) && (Hlp_IsValidNpc(Egill) && !C_NpcIsDown(Egill)))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT3_Info()
{
	AI_Output(other,self, " DIA_Ehnim_STREIT3_15_00 " );	// Your brother thinks you're a braggart.
	AI_Output(self,other, " DIA_Ehnim_STREIT3_12_01 " );	// What? Did he really have the balls to say that?
	AI_Output(self,other, " DIA_Ehnim_STREIT3_12_02 " );	// He'd better watch his mouth or I'll have to teach him a lesson again.
	AI_Output(self,other, " DIA_Ehnim_STREIT3_12_03 " );	// Go and tell him that!
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_STREIT5 (C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 8;
	condition = DIA_Ehnim_STREIT5_Condition;
	information = DIA_Ehnim_STREIT5_Info;
	permanent = TRUE;
	description = " I think you two should just relax. " ;
};


var int DIA_Equal_STREET5_noPerm;

func int DIA_Ehnim_STREIT5_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Egill_STREIT4 ) && ( Hlp_IsValidNpc ( Egill ) &&  ! C_ Npc IsDown ( Egill )) && ( DIA_Ehnim_STREIT5_noPerm ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Ehnim_STREIT5_Info()
{
	AI_Output(other,self, " DIA_Ehnim_STREIT5_15_00 " );	// I think you two should just relax.
	AI_Output(self,other, " DIA_Ehnim_STREIT5_12_01 " );	// That bastard didn't go back on his word, did he?
	AI_Output(self,other, " DIA_Ehnim_STREIT5_12_02 " );	// I'll tear his head off. Tell him I said that.
	Info_ClearChoices(DIA_Ehnim_STREIT5);
	Info_AddChoice(DIA_Ehnim_STREIT5, " I'm not a messenger pigeon. I'm leaving. " ,DIA_Ehnim_STREIT5_gehen);
	Info_AddChoice(DIA_Ehnim_STREIT5, " Why don't you tell him yourself? " ,DIA_Ehnim_STREIT5_Attack);
};

func void DIA_Ehnim_STREIT5_Attack()
{
	AI_Output(other,self, " DIA_Ehnim_STREIT5_Attack_15_00 " );	// Why don't you tell him yourself?
	AI_Output(self,other, " DIA_Ehnim_STREIT5_Attack_12_01 " );	// Fine,I'll do it.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	INNOSCRIMECOUNT = INNOSCRIMECOUNT + 1;

	AI_StopProcessInfos(self);
	DIA_Ehnim_STREIT5_noPerm = TRUE ;
	other.aivar[AIV_INVINCIBLE] = FALSE;
	B_Attack(self,Egill,AR_NONE,0);
	B_GivePlayerXP(XP_EgillEhnimStreit);
};

func void DIA_Ehnim_STREIT5_gehen()
{
	AI_Output(other,self, " DIA_Ehnim_STREIT5_gehen_15_00 " );	// I'm not a messenger pigeon. I'm leaving.
	AI_Output(self,other, " DIA_Ehnim_STREIT5_gehen_12_01 " );	// Yes, get out of here.
	AI_StopProcessInfos(self);
};


instances DIA_Ehnim_PERMKAP1 (C_Info)
{
	npc = BAU_944_Ehnim;
	condition = DIA_Ehnim_PERMKAP1_Condition;
	information = DIA_Ehnim_PERMKAP1_Info;
	important = TRUE;
	permanent = FALSE;
};


func int DIA_Ehnim_PERMKAP1_Condition()
{
	if (( DIA_Ehnim_STREIT5_noPerm ==  TRUE ) && Npc_IsInState ( self , ZS_Talk ) ) ;
	{
		return TRUE;
	};
};

func void DIA_Ehnim_PERMKAP1_Info()
{
	AI_Output(self,other, " DIA_Ehnim_PERMKAP1_12_00 " );	// Haven't you done enough? I think you'd better leave.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_MoleRatFett(C_Info)
{
	npc = BAU_944_Ehnim;
	condition = DIA_Ehnim_MoleRatFett_Condition;
	information = DIA_Ehnim_MoleRatFett_Info;
	important = TRUE;
};

func int DIA_Ehnim_MoleRatFett_Condition()
{
	if (Npc_KnowsInfo(other,DIA_Ehnim_PERMKAP1) && (DIA_Ehnim_STREIT5_noPerm ==  TRUE ) && Npc_IsInState(self,ZS_Talk) && ((hero.guild !=  GIL_KDF ) || (hero.guild !=  GIL_KDW ))) ;
	{
		return TRUE;
	};
};

func void DIA_Ehnim_MoleRatFett_Info()
{
	AI_Output(self,other, " DIA_Ehnim_MoleRatFett_12_00 " );	// Are you STILL here?
	AI_Output(other,self, " DIA_Ehnim_MoleRatFett_15_01 " );	// Well, yes. Are you still fighting?
	AI_Output(self,other, " DIA_Ehnim_MoleRatFett_12_02 " );	// That's none of your business. Tell me, have you been to Lobart's farm lately?
	AI_Output(other,self, " DIA_Ehnim_MoleRatFett_15_03 " );	// Maybe. So what?
	AI_Output(self,other, " DIA_Ehnim_MoleRatFett_12_04 " );	// Oh, nothing really. I just wanted to talk to Vino about his distillery.
	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett, " Sorry, I don't have time. " ,DIA_Ehnim_MoleRatFett_nein);
	Info_AddChoice(DIA_Ehnim_MoleRatFett, " Distillery? Which distillery? " ,DIA_Ehnim_MoleRatFett_was);
	if (Npc_IsDead(Vino))
	{
		Info_AddChoice(DIA_Ehnim_MoleRatFett, " The wine is gone. " ,DIA_Ehnim_MoleRatFett_tot);
	};
};

func void DIA_Ehnim_MoleRatFett_tot()
{
	AI_Output(other,self, " DIA_Ehnim_MoleRatFett_tot_15_00 " );	// The wine is gone.
	AI_Output(self,other, " DIA_Ehnim_MoleRatFett_tot_12_01 " );	// Oh gods. What a horror.
};

func void DIA_Ehnim_MoleRatFett_was()
{
	AI_Output(other,self, " DIA_Ehnim_MoleRatFett_was_15_00 " );	// Distillery? What distillery?
	AI_Output(self,other, " DIA_Ehnim_MoleRatFett_was_12_01 " );	// Oh. I probably shouldn't have talked about it. Vino was always so reverent about that little secret of his.
	AI_Output(self,other, " DIA_Ehnim_MoleRatFett_was_12_02 " );	// Well, anyway, I already blabbed. In the forest, not far from the farm, Vino set up a secret distillery.
	AI_Output(self,other, " DIA_Ehnim_MoleRatFett_was_12_03 " );	// A few days ago, he asked me to give him something to lubricate the mechanism of the grate there.
	AI_Output(self,other, " DIA_Ehnim_MoleRatFett_was_12_04 " );	// It's been raining lately and it's rusty. The winch is jammed and he can't lift the grate.
	Log_CreateTopic(TOPIC_FoundVinosKellerei,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FoundVinosKellerei,LOG_Running);
	; _ _ _ _
	Info_AddChoice(DIA_Ehnim_MoleRatFett, " And? Did you get some lubricant? " ,DIA_Ehnim_MoleRatFett_was_Fett);
};

func void DIA_Ehnim_MoleRatFett_was_Fett()
{
	AI_Output(other,self, " DIA_Ehnim_MoleRatFett_was_Fett_15_00 " );	// And? Did you get lubricant?
	AI_Output(self,other, " DIA_Ehnim_MoleRatFett_was_Fett_12_01 " );	// Yes, of course. The very best. Molerat fat! Amazing stuff, let me tell you. It is even used to lubricate ship cannons.
	Info_AddChoice(DIA_Ehnim_MoleRatFett, " Sell me that fat. " ,DIA_Ehnim_MoleRatFett_was_Fett_habenwill);
};


var int Ehnim_MoleRatFettOffer;

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill()
{
	AI_Output(other,self, " DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_00 " );	// Sell me that fat.
	AI_Output(self,other, " DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_01 " );	// It's going to cost you a lot, mate. It is very rare in this part of the country.
	AI_Output(other,self,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_15_02");	//How much?
	AI_Output(self,other,"DIA_Ehnim_MoleRatFett_was_Fett_habenwill_12_03");	//Hmm...One hundred gold?
	Ehnim_MoleRatFettOffer = 100 ;
	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett, " It's too expensive! " ,DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel);
	Info_AddChoice(DIA_Ehnim_MoleRatFett, " Agreed. " ,DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja()
{
	AI_Output(other,self, " DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_15_00 " );	// Agreed.
	if(B_GiveInvItems(other,self,ItMi_Gold,Ehnim_MoleRatFettOffer))
	{
		AI_Output(self,other, " DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_01 " );	// Good! Here you are.

		if(Npc_HasItems(self,ItMi_Moleratlubric_MIS))
		{
			B_GiveInvItems(self,other,ItMi_Moleratlubric_MIS,1);
			if ( Npc_IsDead ( Wine ) ==  FALSE )
			{
				AI_Output(self,other, " DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_02 " );	// The wife will kill me for this!
			};
		}
		else
		{
			AI_Output(self,other, " DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_03 " );	// Damn, where did it go? What a shame. I'm sorry. Looks like I don't have it. Here, take your money back.
			B_GiveInvItems(self,other,ItMi_Gold,Ehnim_MoleRatFettOffer);
			if (Npc_IsDead(Egill) ==  FALSE )
			{
				AI_Output(self,other, " DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_04 " );	// I bet this is my brother's trick. That bastard!
				AI_StopProcessInfos(self);
				other.aivar[AIV_INVINCIBLE] = FALSE;
				B_Attack(self,Egill,AR_NONE,0);
			};
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja_12_05 " );	// First you negotiate a deal and then it turns out you don't even have the money! Get out of my sight!
	};
	AI_StopProcessInfos(self);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel()
{
	AI_Output(other,self, " DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_15_00 " );	// That's too much!
	AI_Output(self,other, " DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_12_01 " );	// Fine! Seventy gold. But that is my final offer!

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	Ehnim_MoleRatFettOffer = 70 ;
	Info_ClearChoices(DIA_Ehnim_MoleRatFett);
	Info_AddChoice(DIA_Ehnim_MoleRatFett, " That's still too much. " ,DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch);
	Info_AddChoice(DIA_Ehnim_MoleRatFett, " Agreed. " ,DIA_Ehnim_MoleRatFett_was_Fett_habenwill_ja);
};

func void DIA_Ehnim_MoleRatFett_was_Fett_habenwill_zuviel_immernoch()
{
	AI_Output(other,self, " DIA_Ehnim_MoleRatFett_was_immernoch_15_00 " );	// That's still too much.
	AI_Output(self,other, " DIA_Ehnim_MoleRatFett_was_immernoch_12_01 " );	// Then forget about it...Goodbye!
	AI_StopProcessInfos(self);
};

func void DIA_Ehnim_MoleRatFett_nein()
{
	AI_Output(other,self, " DIA_Ehnim_MoleRatFett_nein_15_00 " );	// I don't have time for this right now.
	AI_Output(self,other, " DIA_Ehnim_MoleRatFett_nein_12_01 " );	// Then don't let me keep you, friend.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_PERMKAP3(C_Info)
{
	npc = BAU_944_Ehnim;
	condition = DIA_Ehnim_PERMKAP3_Condition;
	information = DIA_Ehnim_PERMKAP3_Info;
	important = TRUE;
	permanent = TRUE;
};


func int DIA_Ehnim_PERMKAP3_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Ehnim_MoleRatFett) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_Ehnim_PERMKAP3_Info()
{
	AI_Output(self,other, " DIA_Ehnim_PERMKAP3_12_00 " );	// I don't have time for this.
	AI_StopProcessInfos(self);
};


instance DIA_Ehnim_PICKPOCKET(C_Info)
{
	npc = BAU_944_Ehnim;
	nr = 900;
	condition = DIA_Ehnim_PICKPOCKET_Condition;
	information = DIA_Ehnim_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};


func int DIA_Ehnim_PICKPOCKET_Condition()
{
	return  C_Robbery ( 76 , 35 );
};

func void DIA_Ehnim_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Ehnim_PICKPOCKET);
	Info_AddChoice(DIA_Ehnim_PICKPOCKET,Dialog_Back,DIA_Ehnim_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Ehnim_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Ehnim_PICKPOCKET_DoIt);
};

func void DIA_Ehnim_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_Ehnim_PICKPOCKET);
};

func void DIA_Ehnim_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Ehnim_PICKPOCKET);
};
