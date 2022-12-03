
var int FirstMeet;

instance DIA_TPL_8014_TEMPLER_EXIT(C_Info)
{
	npc = tpl_8014_templer;
	nr = 999;
	condition = dia_tpl_8014_templer_exit_condition;
	information = dia_tpl_8014_templer_exit_info;
	permanent = 1;
	description = Dialog_Ende;
};


func int dia_tpl_8014_templer_exit_condition()
{
	return TRUE;
};

func void dia_tpl_8014_templer_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_TPL_8014_TEMPLER_FIRST(C_Info)
{
	npc = tpl_8014_templer;
	nr = 2;
	condition = dia_tpl_8014_templer_first_condition;
	information = dia_tpl_8014_templer_first_info;
	permanent = 0;
	important = 1;
};


func int dia_tpl_8014_templer_first_condition()
{
	if((STARTBIGBATTLE == FALSE) && (BIGBATTLEBACKPOSITION == FALSE))
	{
		return TRUE;
	};
};

func void dia_tpl_8014_templer_first_info()
{
	AI_Output(self,other, " DIA_TPL_8014_Templer_First_13_00 " );	// Hello stranger!
	AI_Output(self,other, " DIA_TPL_8014_Templer_First_13_01 " );	// What you see before you is the new camp of our Brotherhood.
	AI_Output(self,other, " DIA_TPL_8014_Templer_First_13_02 " );	// What brings you here?
	FirstMeet = TRUE;
	Info_ClearChoices(dia_tpl_8014_templer_first);
	Info_AddChoice(dia_tpl_8014_templer_first, " I want to look around the Camp. " ,dia_tpl_8014_templer_first_justlooking);
	if(other.guild == GIL_NONE)
	{
		Info_AddChoice(dia_tpl_8014_templer_first, " I want to join you. " ,dia_tpl_8014_templer_first_join);
	};
};

func void dia_tpl_8014_templer_first_join()
{
	AI_Output(other,self, " DIA_TPL_8014_Templer_First_Join_15_00 " );	// I heard that you need people. I want to join you.
	AI_Output(self,other, " DIA_TPL_8014_Templer_First_Join_13_01 " );	// Welcome! The Brotherhood will gladly accept anyone who seeks peace of mind.
	AI_Output(self,other, " DIA_TPL_8014_Templer_First_Join_13_02 " );	// If your intentions are serious, try to attract the attention of the Namib Idol. You will find him in the courtyard behind the gate.
	AI_Output(self,other, " DIA_TPL_8014_Templer_First_Join_13_04 " );	// But you must not speak to him until he himself speaks to you.
	Info_ClearChoices(dia_tpl_8014_templer_first);
};

func void dia_tpl_8014_templer_first_justlooking()
{
	AI_Output(other,self, " DIA_TPL_8014_Templer_First_JustLooking_15_00 " );	// I want to inspect the Camp.
	AI_Output(self,other, " DIA_TPL_8014_Templer_First_JustLooking_13_01 " );	// Come in, friend! We always welcome guests.
	AI_Output(self,other, " DIA_TPL_8014_Templer_First_JustLooking_13_02 " );	// But just don't create trouble here and don't distract the Idols from their work.
	Info_ClearChoices(dia_tpl_8014_templer_first);
};


instance DIA_TPL_8014_TEMPLER_SIT(C_Info)
{
	npc = tpl_8014_templer;
	nr = 2;
	condition = dia_tpl_8014_templer_sit_condition;
	information = dia_tpl_8014_templer_sit_info;
	permanent = 1;
	description = " How are you at the Camp? " ;
};


func int dia_tpl_8014_templer_sit_condition()
{
	if((STARTBIGBATTLE == FALSE) && (BIGBATTLEBACKPOSITION == FALSE))
	{
		return TRUE;
	};
};

func void dia_tpl_8014_templer_sit_info()
{
	AI_Output(other,self, " DIA_TPL_8014_Templer_Sit_15_00 " );	// How are things at the Camp?
	AI_Output(self,other, " DIA_TPL_8014_Templer_Sit_13_01 " );	// Everything is quiet. Come in.
};

instance DIA_TPL_8014_TEMPLER_PrioratStart(C_Info)
{
	npc = tpl_8014_templer;
	nr = 2;
	condition = dia_tpl_8014_templer_PrioratStart_condition;
	information = dia_tpl_8014_templer_PrioratStart_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_tpl_8014_templer_PrioratStart_condition()
{
	if (( STARTBIGBATTLE  ==  FALSE ) && ( BIGBATTLEBACKPOSITION  ==  FALSE ) && (Chapter >=  3 ) && (FirstMeet ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void dia_tpl_8014_templer_PrioratStart_info()
{
	if((hero.guild == GIL_SEK) || (hero.guild == GIL_GUR) || (hero.guild == GIL_TPL))
	{
		if(hero.guild == GIL_SEK)
		{
			AI_Output(self,other, " DIA_TPL_8014_Templer_PrioratStart_01_00 " );	// Wait, novice!
			AI_Output(other,self, " DIA_TPL_8014_Templer_PrioratStart_01_01 " );	// What is it?
			AI_Output(self,other, " DIA_TPL_8014_Templer_PrioratStart_01_02 " );	// The Namib Idol wanted to speak to you urgently. Therefore, immediately go to him.
		}
		else  if (hero.guild ==  GIL_GUR )
		{
			AI_Output(self,other, " DIA_TPL_8014_Templer_PrioratStart_01_05 " );	// Please forgive me, master...
			AI_Output(other,self, " DIA_TPL_8014_Templer_PrioratStart_01_06 " );	// I'm listening to you, guard. What happened?
			AI_Output(self,other, " DIA_TPL_8014_Templer_PrioratStart_01_07 " );	// Nothing, master. It's just that the Namib Idol asked me to tell you that he wanted to see you urgently.
		}
		else if(hero.guild == GIL_TPL)
		{
			AI_Output(self,other, " DIA_TPL_8014_Templer_PrioratStart_01_10 " );	// Wait, brother.
			AI_Output(other,self, " DIA_TPL_8014_Templer_PrioratStart_01_11 " );	// What is it?
			AI_Output(self,other, " DIA_TPL_8014_Templer_PrioratStart_01_12 " );	// The Namib Idol wanted to speak to you urgently. So it's best to go straight to him.
		};

	}
	else
	{
		AI_Output(self,other, " DIA_TPL_8014_Templer_PrioratStart_01_15 " );	// Wait, stranger! One of our spirit guides would very much like to speak with you.
		AI_Output(other,self, " DIA_TPL_8014_Templer_PrioratStart_01_18 " );	// And what did he suddenly need from me?
		AI_Output(self,other, " DIA_TPL_8014_Templer_PrioratStart_01_19 " );	// You will find out from him yourself. It is foolish to believe that our mentors initiate us, the guards, in all their affairs.
		AI_Output(self,other, " DIA_TPL_8014_Templer_PrioratStart_01_21 " );	// You should contact the Namib Idol. It is usually located on the meditation platform, to the right of the entrance to the camp.
	};

	PrioratPreStart = TRUE;
	AI_StopProcessInfos(self);
};
