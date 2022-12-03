

instance DIA_SHRAT_EXIT(C_Info)
{
	npc = sek_8047_shrat;
	nr = 999;
	condition = dia_shrat_exit_condition;
	information = dia_shrat_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_shrat_exit_condition()
{
	return TRUE;
};

func void dia_shrat_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SHRAT_NOFOREVER(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_noforever_condition;
	information = dia_shrat_noforever_info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};

func int dia_shrat_noforever_condition()
{
	return TRUE;
};

func void dia_shrat_noforever_info()
{
	AI_Output(other,self, " DIA_Shrat_NoForever_01_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Shrat_NoForever_01_01 " );	// Why can't you see? We collect the swamp so that later our brothers in the camp can smoke it.
	AI_Output(self,other, " DIA_Shrat_NoForever_01_02 " );	// Do you know how many people in our Brotherhood who like to score a joint? (laughs) A LOT!

	MeetLobartPsiCamp = TRUE;

	if(MIS_Lobart_Psicamp == LOG_Running)
	{
		B_GivePlayerXP(50);
		B_LogEntry(TOPIC_Lobart_Psicamp, " It seems that the people Lobart was talking about are just ordinary swamp grass pickers. " );
	};
};


instance DIA_SHRAT_PSIINFO(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_psiinfo_condition;
	information = dia_shrat_psiinfo_info;
	permanent = FALSE;
	description = " In the Brotherhood? What Brotherhood?! " ;
};


func int dia_shrat_psiinfo_condition()
{
	if ( ! Npc_KnowsInfo(hero,dia_tpl_8014_templer_first) && !  Npc_KnowsInfo (hero, dia_hanis_psiinfo ) &&  !
	{
		return TRUE;
	};
};

func void dia_shrat_psiinfo_info()
{
	AI_Output(other,self, " DIA_Shrat_PsiInfo_01_00 " );	// In the Brotherhood? Which Brotherhood?
	AI_Output(self,other, " DIA_Shrat_PsiInfo_01_01 " );	// In the Brotherhood of the Sleeper, of course! Although now it can be called simply - the Brotherhood.
	AI_Output(other,self, " DIA_Shrat_PsiInfo_01_02 " );	// But I thought that after the fall of the barrier, the Brotherhood of the Sleeper ceased to exist!
	AI_Output(self,other, " DIA_Shrat_PsiInfo_01_03 " );	// It's not. Most of our brothers died, and many went crazy from the corrupting influence of demonic forces.
	AI_Output(self,other, " DIA_Shrat_PsiInfo_01_04 " );	// But there were those who survived. It was they who became the leaders of our new camp.
	AI_Output(other,self, " DIA_Shrat_PsiInfo_01_05 " );	// Where is your camp?
	AI_Output(self,other, " DIA_Shrat_PsiInfo_01_06 " );	// Head towards the passage to the Valley of Mines. Before reaching the passage itself, you will find a small farm.
	AI_Output(self,other, " DIA_Shrat_PsiInfo_01_07 " );	// Not far from it is our new abode.
};


instance DIA_SHRAT_HELLO(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_hello_condition;
	information = dia_shrat_hello_info;
	permanent = FALSE;
	description = " Hey, I know you! " ;
};


func int dia_shrat_hello_condition()
{
	if(Npc_KnowsInfo(hero,dia_shrat_noforever))
	{
		return TRUE;
	};
};

func void dia_shrat_hello_info()
{
	B_GivePlayerXP(50);
	AI_Output(other, self, " DIA_Shrat_Hello_01_00 " );	// Hey, I know you!
	AI_Output(other,self, " DIA_Shrat_Hello_01_01 " );	// You're the guy hiding in the cabin in the swamps.
	AI_Output(self,other, " DIA_Shrat_Hello_01_02 " );	// Hmmm... Right. Have we met before?
	AI_Output(self,other, " DIA_Shrat_Hello_01_03 " );	// But wait! (looks closely) Well...
	AI_Output(self,other, " DIA_Shrat_Hello_01_04 " );	// Oh yes! Now I remember you... (laughs) You are the guy who brought us the eggs of the crawlers.
	AI_Output(other,self, " DIA_Shrat_Hello_01_05 " );	// Well, I finally remembered.
	AI_Output(self,other, " DIA_Shrat_Hello_01_06 " );	// Okay, don't be offended. So much has happened lately - unless you remember everything and everyone.
	AI_Output(self,other, " DIA_Shrat_Hello_01_07 " );	// Glad to see you - healthy and unharmed!
};


instance DIA_SHRAT_HELLOTWO(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_hellotwo_condition;
	information = dia_shrat_hellotwo_info;
	permanent = TRUE;
	description = " How's the bog harvest going? " ;
};


func int dia_shrat_hellotwo_condition()
{
	if(Npc_KnowsInfo(hero,dia_shrat_noforever))
	{
		return TRUE;
	};
};

func void dia_shrat_hellotwo_info()
{
	AI_Output(other,self, " DIA_Shrat_HelloTwo_01_00 " );	// How's the bog harvest progressing?
	AI_Output(self,other, " DIA_Shrat_HelloTwo_01_01 " );	// If you don't pester our pickers, he'll move even faster!
};

instance dia_shrat_PrioratStart(C_Info)
{
	npc = sek_8047_shrat;
	nr = 1;
	condition = dia_shrat_PrioratStart_condition;
	information = dia_shrat_PrioratStart_info;
	permanent = FALSE;
	description = "The Namib Idol sent me. " ;
};

func int dia_shrat_PrioratStart_condition()
{
	if(MIS_PrioratStart == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_shrat_PrioratStart_info()
{
	B_GivePlayerXP(100);
	AI_Output(other, self, " dia_shrat_PrioratStart_01_00 " );	// The Namib Idol sent me.
	AI_Output(self,other, " dia_shrat_PrioratStart_01_01 " );	// I'm all ears... (respectfully) What does the Guru of the Brotherhood want from us?
	AI_Output(other,self, " dia_shrat_PrioratStart_01_02 " );	// He wants to know what the situation is at your camp at the moment.
	AI_Output(self,other, " dia_shrat_PrioratStart_01_03 " );	// You can tell him that we're fine.
	AI_Output(self,other, " dia_shrat_PrioratStart_01_04 " );	// The harvest of the bogweed is progressing at a normal pace, and a new batch will be delivered right on time.
	AI_Output(other,self, " dia_shrat_PrioratStart_01_05 " );	// Okay, so I'll pass it on to him. I've got one more question.
	AI_Output(self,other, " dia_shrat_PrioratStart_01_06 " );	// Ask if there is.
	AI_Output(other,self, " dia_shrat_PrioratStart_01_07 " );	// Have you heard anything about the missing acolytes of the Brotherhood?
	AI_Output(self,other, " dia_shrat_PrioratStart_01_08 " );	// Are you serious?! (horrified) Are a few of our acolytes missing?
	AI_Output(other, self, " dia_shrat_PrioratStart_01_09 " );	// No, these are just rumors. Nothing serious!
	AI_Output(self,other, " dia_shrat_PrioratStart_01_10 " );	// Ah... well, if so... (bewildered) I already thought something really bad had happened.
	AI_Output(self,other, " dia_shrat_PrioratStart_01_11 " );	// No, we don't know anything about it.
	PsiCamp_02_Ok = TRUE;
	B_LogEntry(TOPIC_PrioratStart, " Nothing has changed in Shrat's gathering camp. They don't know about the missing acolytes either. " );
};

instance DIA_SHRAT_GIVEPLANT(C_Info)
{
	npc = sek_8047_shrat;
	nr = 5;
	condition = dia_shrat_giveplant_condition;
	information = dia_shrat_giveplant_info;
	permanent = TRUE;
	description = " I'm from the Idol of Kadar. " ;
};


func int dia_shrat_giveplant_condition()
{
	if (( MY_PLANTFORBAALFRAME  == LOG_Running) && ( THIRDGROUPSEK  ==  FALSE ) && (other.guild ==  GIL_SEK ) && Npc_KnowsInfo(hero,dia_shrat_noforever));
	{
		return TRUE;
	};
};

func void dia_shrat_giveplant_info()
{
	var C_Item itm;
	itm = Npc_GetEquippedArmor(other);
	AI_Output(other, self, " DIA_Shrat_GivePlant_01_00 " );	// I'm from Idol Kadar.
	AI_Output(self,other, " DIA_Shrat_GivePlant_01_01 " );	// Idol Kadar sent you? But why?
	AI_Output(other,self, " DIA_Shrat_GivePlant_01_02 " );	// I should pick up your bogweed crop you've harvested so far.
	if((Hlp_IsItem(itm,itar_sekbed) == TRUE) || (Hlp_IsItem(itm,itar_sekbed_v1) == TRUE) || (Hlp_IsItem(itm,itar_slp_ul) == TRUE) || (Hlp_IsItem(itm,itar_slp_l) == TRUE))
	{
		AI_Output(self,other, " DIA_Shrat_GivePlant_01_03 " );	// Finally! I thought everyone forgot about us.
		B_GiveInvItems(self,other,ItPl_SwampHerb,50);
		AI_Output(self,other, " DIA_Shrat_GivePlant_01_04 " );	// Here, hold it and don't lose it. Here is all the swamp that we have.
		THIRDGROUPSEK = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Shrat_GivePlant_01_05 " );	// The idol Kadar couldn't have sent us such a ragamuffin!
		AI_Output(self,other, " DIA_Shrat_GivePlant_01_06 " );	// You're joking right, mate.
	};
};

