

instance DIA_ORC_8550_URNAZUL_EXIT(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_exit_condition;
	information = dia_orc_8550_urnazul_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8550_urnazul_exit_condition()
{
	return TRUE;
};

func void dia_orc_8550_urnazul_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8550_URNAZUL_HIFIRST(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_hifirst_condition;
	information = dia_orc_8550_urnazul_hifirst_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_orc_8550_urnazul_hifirst_condition()
{
	if(MEETURNAZUL == FALSE)
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_hifirst_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_01 " );	// Don't believe your eyes! Human? Who let you?!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_02 " );	// Be very brave or very stupid to come here.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Hello_Info_18_03 " );	// Farrok missed me. I have come to speak with you, Ur-Thrall.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_04 " );	// There must be a very serious reason for Ur-Thrall to listen to a human.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_05 " );	// If not to be - the person to die now!!! Ulu-Mulu can't be helped, stranger.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_06 " );	// Now man to speak - Ur-Thrall to listen.
	MEETURNAZUL = TRUE;
};

instance DIA_ORC_8550_URNAZUL_LostPaladins(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_LostPaladins_condition;
	information = dia_orc_8550_urnazul_LostPaladins_info;
	permanent = FALSE;
	description = " I have one more question for you. " ;
};

func int dia_orc_8550_urnazul_LostPaladins_condition()
{
	if (( MIS_LostPaladins == LOG_Running ) && ( KnowVenzelOrcs ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_LostPaladins_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_LostPaladins_01_01 " );	// I have one more question for you.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LostPaladins_01_02 " );	// A person can set it if they want.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_LostPaladins_01_03 " );	// Did your warriors by any chance take a paladin prisoner recently?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LostPaladins_01_04 " );	// (thoughtfully) Ur-Thrall think not. Otherwise he would know about it.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LostPaladins_01_05 " );	// Paladin to be a very good warrior and know a lot about war plan people.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_LostPaladins_01_06 " );	// But he probably wouldn't tell you anything.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LostPaladins_01_07 " );	// (laughs) Man just don't know how brothers can get the truth out of people.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LostPaladins_01_08 " );	// If he were to get captured by the orcs, then Ur-Thrall would definitely make him talk!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_LostPaladins_01_09 " );	// I don't even want to know how you do it.
	B_LogEntry(TOPIC_LostPaladins, " Orc Warchief Ur-Thrall doesn't know anything about paladins. Or he simply doesn't know that one of the prisoners might be a paladin - otherwise he wouldn't be in trouble. " );
};

instance DIA_ORC_8550_URNAZUL_KnowVenzelOrcs(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_KnowVenzelOrcs_condition;
	information = dia_orc_8550_urnazul_KnowVenzelOrcs_info;
	permanent = FALSE;
	description = " What do you do with the prisoners then? " ;
};

func int dia_orc_8550_urnazul_KnowVenzelOrcs_condition()
{
	if ( Npc_KnowsInfo ( hero , DIA_Orc_8550_UrNazul_LostPaladins ) && ( MIS_LostPaladins == LOG_Running )) .
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_KnowVenzelOrcs_info()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_01 " );	// And what do you do with the prisoners then?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_02 " );	// If a person is strong, then he will go to work in an iron mine.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_03 " );	// And if not, then his brothers simply are. That being useless to the orcs.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_04 " );	// Do you have an iron mine?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_05 " );	// Man is this surprising? Or how, he thinks, orcs make themselves armor and a sword to fight?
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_06 " );	// It turns out that all prisoners work in your iron mine. Is there any way to get there?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_07 " );	// Arrrghhh...(angrily) Man asking too many questions!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_KnowVenzelOrcs_01_08 " );	// He's nothing more to say man. Ur-Thrall did not trust him.
	B_LogEntry(TOPIC_LostPaladins, " All prisoners end up either in the orc iron mine or in their stomach. The only thing left for me is to try somehow to get there and find out if there was a paladin among the prisoners. However, Ur-Thrall flatly refused to talk about this, because doesn't trust me. There's got to be some way to fix this. " );
	MustGoInIronMine = TRUE;
};

instance DIA_ORC_8550_URNAZUL_Psicamp(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_Psicamp_condition;
	information = dia_orc_8550_urnazul_Psicamp_info;
	permanent = FALSE;
	description = " I want to talk to you about the temple in the swamps. " ;
};

func int dia_orc_8550_urnazul_Psicamp_condition()
{
	if (( MEETURNABLUE  ==  TRUE ) && ( MY_PSYCampDemon == LOG_Running ) && ( I'mNotConscious ==  TRUE ) && ( DemonPsicampIsDead ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_Psicamp_info()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Psicamp_01_01 " );	// I want to talk to you about the temple in the swamps.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Psicamp_01_02 " );	// (angrily) What does a human want to say to Ur-Thrall?!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Psicamp_01_03 " );	// High Shaman Ur Hash Nar sent a small force there recently.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Psicamp_01_04 " );	// MEEK JABART! (angrily) He still won't listen to me! To be very stupid for him to do this.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Psicamp_01_05 " );	// Possibly. But now it's too late to lament.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Psicamp_01_06 " );	// Elder Thor Dal, who led the squad, lost almost all of his warriors.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Psicamp_01_07 " );	// (angrily) How could this happen?!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Psicamp_01_08 " );	// They were killed by the undead that settled there in the swamps.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Psicamp_01_09 " );	// And in the Temple of the Brotherhood itself, something even more terrible seems to have begun.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Psicamp_01_10 " );	// Ur-Thrall foresaw that this would be... You shouldn't have gone there.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Psicamp_01_11 " );	// It was impossible to disturb the dead, it was impossible to disturb the evil...
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Psicamp_01_12 " );	// Thor Dal asks for more warriors to be sent to try to recapture the temple.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Psicamp_01_13 " );	// And I understand that only you can give such an order.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Psicamp_01_14 " );	// Ur-Thrall know Thor Dal...(respectfully) Be a brave warrior, never back down before the enemy.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Psicamp_01_15 " );	// He is very sad if Thor let die.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Psicamp_01_16 " );	// So I can tell him help is coming soon?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Psicamp_01_17 " );	// I don't have a choice, man. I send him to help a lot of strong warrior!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Psicamp_01_18 " );	// If a person wants, then he can also go to Tor Dal and help him kill evil in the temple.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Psicamp_01_19 " );	// I'll think about it.
	TorDalMoreWar = TRUE;
	; _ _ _ _	
};

instance DIA_ORC_8550_URNAZUL_AboutIronMine(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_AboutIronMine_condition;
	information = dia_orc_8550_urnazul_AboutIronMine_info;
	permanent = FALSE;
	description = " Let me into the mine. " ;
};

func int dia_orc_8550_urnazul_AboutIronMine_condition()
{
	if ((MIS_LostPaladins == LOG_Running) && (MustGoInIronMine ==  TRUE ) && (CanEnterOrcMine ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_AboutIronMine_info()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_01_01 " );	// Let me into the mine.

	if((MIS_PsicampDemon == LOG_Success) || (DemonPsicampIsDead == TRUE))
	{
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_01_02 " );	// Arrghhh...(respectfully) Human much help Ur-Thrall! Now he become more trust him.
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_01_04 " );	// First, Ur-Thrall wants to know why a human needs to go there.
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_01_05 " );	// If Ur-Thrall agrees with the man, then he let him into the iron mine.
		Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine, " I just want to take a look at her. " ,DIA_Orc_8550_UrNazul_AboutIronMine_Q1);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine, " I need iron ore. " ,DIA_Orc_8550_UrNazul_AboutIronMine_Q2);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine, " Does it matter? " ,DIA_Orc_8550_UrNazul_AboutIronMine_Q3);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine, " I need to talk to prisoners. " ,DIA_Orc_8550_UrNazul_AboutIronMine_Q4);
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_03 " );	// Ur-Thrall to think a human shouldn't go there.
	};
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_Q1()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_01 " );	// I just want to take a look at it.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_02 " );	// Mine be a very dangerous place! Being a bad place to just watch.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_03 " );	// Ur-Thrall to think a human shouldn't go there.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_04 " );	// What a concern...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_Q2()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_01 " );	// I need iron ore.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_02 " );	// Human want to mine orc iron ore?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_03 " );	// Then Ur-Thrall can't let him in there. Ore to be only for orcs!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_04 " );	// Or he can go there, but only as a slave and stay there forever. Man want it?
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_05 " );	// I'm afraid this option doesn't suit me at all.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_Q2_01_06 " );	// Arrrghhh...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_Q3()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_Q3_01_01 " );	// Does it matter?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_Q3_01_02 " );	// If Ur-Thrall says so, then he has.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_Q3_01_03 " );	// If a person does not have a great reason, then he does not go to the iron mine.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_Q4()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_Q4_01_01 " );	// I need to talk to the prisoners.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_Q4_01_02 " );	// And what does the person talk about with them?
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine, " Someone of them must know about the Temple of the Sleeper. " ,DIA_Orc_8550_UrNazul_AboutIronMine_W1);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine, " One of them has information about paladins. " ,DIA_Orc_8550_UrNazul_AboutIronMine_W2);
	};

	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine, " I want to learn how to mine iron ore from them. " ,DIA_Orc_8550_UrNazul_AboutIronMine_W3);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine, " It's about dragons! " ,DIA_Orc_8550_UrNazul_AboutIronMine_W4);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMine, " I just want to make things easier for them. " ,DIA_Orc_8550_UrNazul_AboutIronMine_W5);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W1()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_01 " );	// Some of them must know about the Temple of the Sleeper.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_02 " );	// This can't be true! Temple Krushak build orcs, and only they know his secret.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_03 " );	// People don't build a temple, don't worship Krushak! Know nothing about him.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_04 " );	// Human trying to trick Ur-Thrall?!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_05 " );	// No, what are you! And it was not on my mind.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMine_W1_01_06");	//Аррргххх...(грозно)
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W2()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_01 " );	// One of them has information about paladins.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_02 " );	// And how does a person know this?
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_03 " );	// Among the slaves, there are probably those who came with their squad.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_04 " );	// Hmmm...(thoughtfully) It's quite possible to be like that.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_05 " );	// Be like this! Ur-Thrall let a man into the mine if he brings him information about the enemy.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_06 " );	// That would be right away. Deal! So how can I get into the mine?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_07 " );	// Ur-Thrall give a man the key, and he will open the passage to the mine.
	B_GiveInvItems(self,other,ItKe_OrcOreMine,1);
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_08 " );	// But be careful. The shaman brothers cast strong magic on the passage.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_09 " );	// Orcs will not be harmed by her. But if a person touches, then immediately die!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_10 " );	// Why did you do it?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_11 " );	// To make people forget about the escape forever and not be able to get out of the iron mine.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_W2_01_12 " );	// Got it.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

 	B_LogEntry(TOPIC_LostPaladins, " I managed to convince Ur-Thrall to open a passage to the orc iron mine for me. I hope I can find out something about Wenzel's party there. " );
	CanEnterOrcMine = TRUE ;
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W3()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_W1_03_01 " );	// I want to learn how to mine iron ore from them.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W1_03_02 " );	// A person does not have to go to the orc mine for this.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W1_03_03 " );	// He can learn this from other people.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W4()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_01 " );	// It's about dragons!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_02 " );	// (laughs) What would an ordinary slave know about dragons?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_03 " );	// Ur-Thrall to think that the man is talking nonsense. But it's hard to make him laugh.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_04 " );	// However, he cannot let a person into an iron mine.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_05 " );	// The person will only distract the slave from work!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMine_W4_01_06");	//Ну да...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

func void DIA_Orc_8550_UrNazul_AboutIronMine_W5()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMine_W5_01_01 " );	// I just want to make things easier for them.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W5_01_02 " );	// (laughs) Man be too kind to want to do this.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W5_01_03 " );	// But Ur-Thrall say no! The man will only distract the slave from work.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_W5_01_04 " );	// And they mine less iron ore.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMine);
};

instance DIA_ORC_8550_URNAZUL_AboutIronMineMore(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_AboutIronMineMore_condition;
	information = dia_orc_8550_urnazul_AboutIronMineMore_info;
	permanent = TRUE;
	description = " Let me into the mine. " ;
};

func int dia_orc_8550_urnazul_AboutIronMineMore_condition()
{
	if ((Npc_KnowsInfo(hero,DIA_Orc_8550_UrNazul_AboutIronMine) ==  TRUE ) && (MY_LostPaladins == LOG_Running) && (MustGoInIronMine ==  TRUE ) && (CanEnterOrcMine ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_AboutIronMineMore_info()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_01_01 " );	// Let me into the mine.

	if((MIS_PsicampDemon == LOG_Success) || (DemonPsicampIsDead == TRUE))
	{
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_01_02 " );	// Ur-Thrall still wants to know why a human needs to go there.
		Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore, " I just want to take a look at her. " ,DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore, " I need iron ore! " ,DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore, " Does it matter? " ,DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3);
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore, " I need to talk to prisoners. " ,DIA_Orc_8550_UrNazul_AboutIronMineMore_Q4);
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMine_Q1_01_03 " );	// Ur-Thrall to think a human shouldn't go there.
	};
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1_01_01 " );	// I just want to take a look at it.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1_01_02 " );	// Mine be a very dangerous place! Being a bad place to just watch.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1_01_03 " );	// Ur-Thrall to think a human shouldn't go there.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q1_01_04 " );	// What a concern...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_01 " );	// I need iron ore!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_02 " );	// Human want to mine orc iron ore?!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_03 " );	// Then Ur-Thrall can't let him in there. Ore to be only for orcs!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_04 " );	// Or he can go there, but only as a slave and stay there forever. Man want it?
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_05 " );	// I'm afraid this option doesn't suit me at all.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_06 " );	// Arrrrrghh...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3_01_01 " );	// Does it matter?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3_01_02 " );	// If Ur-Thrall says so, it means to have.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q3_01_03 " );	// If a person does not have a great reason, then he does not go to the iron mine.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_Q4()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q4_01_01 " );	// I need to talk to the prisoners.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q4_01_02 " );	// And what does the person talk about with them?
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore, " Someone of them must know about the Temple of the Sleeper. " ,DIA_Orc_8550_UrNazul_AboutIronMineMore_W1);

	if(RhetorikSkillValue[1] >= 50)
	{
		Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore, " One of them has information about paladins. " ,DIA_Orc_8550_UrNazul_AboutIronMineMore_W2);
	};

	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore, " I want to learn how to mine iron ore from them. " ,DIA_Orc_8550_UrNazul_AboutIronMineMore_W3);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore, " It's about dragons! " ,DIA_Orc_8550_UrNazul_AboutIronMineMore_W4);
	Info_AddChoice(DIA_Orc_8550_UrNazul_AboutIronMineMore, " I just want to make it easy for them as slaves. " ,DIA_Orc_8550_UrNazul_AboutIronMineMore_W5);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W1()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_01 " );	// Some of them must know about the Temple of the Sleeper.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_02 " );	// This can't be true! Temple Krushak build orcs and only they know his secret.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_03 " );	// People don't build a temple, don't worship Krushak! Know nothing about him.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_04 " );	// Ur-Thrall to think that the man just wants to deceive him.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_05 " );	// No, what are you! And it was not on my mind.
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_01_06");	//Аррргххх...(грозно)
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W2()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_01 " );	// One of them has information about paladins.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_02 " );	// And how does a person know this?
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_03 " );	// Among the slaves, there are probably those who came with their squad.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_04 " );	// Hmmm...(thoughtfully) It's quite possible to be like that.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_05 " );	// Be like this. Ur-Thrall let a man into the mine if he brings him information about the enemy.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_06 " );	// That would be right away. OK, deal! So how can I get into the mine?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_07 " );	// Ur-Thrall give a man the key and he will open the passage to the iron mine.
	B_GiveInvItems(self,other,ItKe_OrcOreMine,1);
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_08 " );	// But be careful! The shaman brothers cast strong magic on the passage.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_09 " );	// Orcs will not be harmed by her. But if a person touches, then immediately die!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_10 " );	// Why did you do it?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_11 " );	// To make people forget about the escape forever and not be able to get out of the iron mine.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W2_01_12");	//Понятно.

	if(RhetorikSkillValue[1] < 100)
	{
		RhetoricSkillValue[ 1 ] = RhetoricSkillValue[ 1 ] +  1 ;
		AI_Print( " Rhetoric + 1 " );
	};

	B_LogEntry(TOPIC_LostPaladins, " I managed to convince Ur-Thrall to open the orc iron mine for me. He gave me a key to open the mine. I hope I can find the answer to Wenzel's party there. " );
	CanEnterOrcMine = TRUE ;
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W3()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_03_01 " );	// I want to learn how to mine iron ore from them.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_03_02 " );	// A human doesn't have to go to an orc mine for this.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W1_03_03 " );	// He can learn this from other people.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W4()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_01 " );	// It's about dragons!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_02 " );	// (laughs) What would an ordinary slave know about dragons?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_03 " );	// Ur-Thrall to think that the man is talking nonsense. But it's hard to make him laugh.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_04 " );	// However, he cannot let a person into an iron mine.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_05 " );	// The person will only distract the slave from work!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_AboutIronMineMore_W4_01_06");	//Ну да...
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

func void DIA_Orc_8550_UrNazul_AboutIronMineMore_W5()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_01 " );	// I just want to ease their lot as slaves.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_02 " );	// (laughs) Man be too kind to want to do this.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_03 " );	// But Ur-Thrall say no! The man will only distract the slave from work.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_04 " );	// And they mine less iron ore.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_W5_01_05 " );	// I understand.
	Info_ClearChoices(DIA_Orc_8550_UrNazul_AboutIronMineMore);
};

instance DIA_ORC_8550_URNAZUL_LowLevel(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_LowLevel_condition;
	information = dia_orc_8550_urnazul_LowLevel_info;
	permanent = FALSE;
	description = " Ar Dagar sent me to you. " ;
};

func int dia_orc_8550_urnazul_LowLevel_condition()
{
	if((MIS_LowLevel == LOG_Running) && (SendForHelp == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_LowLevel_info()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_LowLevel_01_01 " );	// Ar Dagar sent me to you.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LowLevel_01_02 " );	// What does he need to be?
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_LowLevel_01_03 " );	// He asks you to send him some strong warriors.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LowLevel_01_04 " );	// Why would Ar Dagar ask for this?
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_LowLevel_01_05 " );	// To send them to a deep mine.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LowLevel_01_06 " );	// So Ar Dagar want to try and kill the demon again?
	AI_PlayAni(self,"T_NO");
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LowLevel_01_07 " );	// Ur-Thrall remember what happened the last time he tried to free the mine.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LowLevel_01_08 " );	// Demon be very strong! Kill many brothers of Ur-Thrall.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_LowLevel_01_09 " );	// Yes, but this time I'll go with them! Are you sure about me?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_13 " );	// Man is not afraid of a demon? Man bruise your head!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Hello_Info_18_14 " );	// I stand alone in the underground city of the orcs, and I speak to you, their leader. Do you think I'll bruise my head?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_15 " );	// Ur-Thrall think yes. But a man from Ulu-Mulu be brave and strong!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LowLevel_01_13 " );	// Ur-Thrall to think that a human might be able to free the orc mine.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LowLevel_01_14 " );	// Therefore, he will send his best warrior with a man. Orak Shaka, man!
	OrcHelpLowLevel = TRUE;
	B_LogEntry(TOPIC_LowLevel, " Ur-Thrall has agreed to send some strong Orc warriors to Ar Dagar. " );
};

instance DIA_ORC_8550_URNAZUL_LowLevelFree(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_LowLevelFree_condition;
	information = dia_orc_8550_urnazul_LowLevelFree_info;
	permanent = FALSE;
	description = " I freed the deep mine from evil! " ;
};

func int dia_orc_8550_urnazul_LowLevelFree_condition()
{
	if(MIS_LowLevel == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_LowLevelFree_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_LowLevelFree_01_01 " );	// I freed the deep mine from evil!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LowLevelFree_01_02 " );	// Ur-Thrall to know that a human can do it. Mor Dar be a great warrior!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LowLevelFree_01_03 " );	// He is thanking the man that he helped his people get rid of this curse.
};

var int TakeIdolKrushak;

instance DIA_ORC_8550_URNAZUL_HELLO(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_hello_condition;
	information = dia_orc_8550_urnazul_hello_info;
	permanent = TRUE;
	description = " I came to talk to you about the Temple of the Sleeper. " ;
};

func int dia_orc_8550_urnazul_hello_condition()
{
	if (( MY_ORCTEMPLE  == LOG_Running ) && ( TakeIdolKrushak ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_hello_info()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Hello_Info_18_07 " );	// I came to talk to you about the Temple of the Sleeper. I heard that a new evil has appeared in the Temple - some kind of evil demon.

	if((MIS_LowLevel == LOG_Success) && ((MIS_PsicampDemon == LOG_Success) || (DemonPsicampIsDead == TRUE)))
	{
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_08 " );	// Temple of Crushak? Demon?! Hmmm... Keep talking.
		AI_Output(other,self, " DIA_Orc_8550_UrNazul_Hello_Info_18_09 " );	// I know that this demon made a real massacre in the Temple, killing many of your brothers.
		AI_Output(other,self, " DIA_Orc_8550_UrNazul_Hello_Info_18_10 " );	// They now serve this demon in undead form.
		AI_Output(other,self, " DIA_Orc_8550_UrNazul_Hello_Info_18_11 " );	// I also know that you orcs sealed the temple with a spell. To keep him from breaking free.
		AI_Output(other,self, " DIA_Orc_8550_UrNazul_Hello_Info_18_12 " );	// I want to fight this demon. How can I get inside?
		AI_PlayAni(self,"T_GREETGRD");
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_Complete_Info_18_04 " );	// Man be a great warrior. Worthy to enter the Temple of Krushak!
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_Complete_Info_18_05 " );	// Ur-Tral say thanks and give the key-magic - man to open the entrance to the temple of Krushak.
		B_GiveInvItems(self,other,itmi_idol_01,1);
		AI_Output(other,self, " DIA_Orc_8550_UrNazul_LowLevel_01_15 " );	// Thank you, chief. This is what I wanted to hear from you.
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrGrom_Info_18_19 " );	// The person can walk. Good way!
		TakeIdolKrushak = TRUE;
		B_LogEntry_Quiet( TOPIC_ORCTEMPLE , " I have received from the orc warchief some magical orc talisman that opens the entrance to the Temple of the Sleeper. " );
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_New_18_01 " );	// Hmmm... It's not a human thing to be! The orcs themselves deal with the evil demon.
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_New_18_02 " );	// Now man better go before Ur-Tral gets really mad at him.
		AI_Output(other,self, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_05 " );	// I'm afraid this option doesn't suit me at all.
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_AboutIronMineMore_Q2_01_06 " );	// Arrrrrghh...
		AI_StopProcessInfos(self);
	};
};
instance DIA_ORC_8550_URNAZUL_ORCTEMPLEISFREE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_ORCTEMPLEISFREE_condition;
	information = dia_orc_8550_urnazul_ORCTEMPLEISFREE_info;
	permanent = FALSE;
	description = " I have destroyed the evil in the Temple of the Sleeper. " ;
};

func int dia_orc_8550_urnazul_ORCTEMPLEISFREE_condition()
{
	if((DARKMAGE_ISDEAD == TRUE) && (SleeperInRage == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_ORCTEMPLEISFREE_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_01 " );	// I destroyed the evil in the Temple of the Sleeper.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_02 " );	// Ur-Thrall is glad to hear that! The man once again prove that he is a great warrior.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_03 " );	// Now the brothers will be able to return there again.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_04");	//Зачем?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_05 " );	// Temple to be a sacred place for them. They will talk to the spirits there.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_06 " );	// So Ur-Thrall thank the humans for his help!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_07 " );	// But to think that words alone won't be enough for him.

	if((hero.guild == GIL_KDM) || (hero.guild == GIL_KDW) || (hero.guild == GIL_KDF) || (hero.guild == GIL_GUR) || (hero.guild == GIL_NDM) || (hero.guild == GIL_NOV) || (hero.guild == GIL_NDW))
	{
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_08 " );	// I see that you are more fond of using magic in battle.
		AI_Output(other,self, " DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_09 " );	// Yes, you're right.

		if(ShamanArmor == FALSE)
		{
			AI_Output(self,other, " DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_10 " );	// Good...(respectfully) Then the human accept these robes and staff of an orc shaman as a reward.
			AI_Output(self,other, " DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_11 " );	// Wear them with pride, for no other person has yet been honored with such an honor!
			B_GiveInvItemsManyThings(self,other);
			CreateInvItems(other,ItMw_2h_OrcStab,1);
			CreateInvItems(other,ITAR_SHAMANROBE,1);
			ShamanArmor = TRUE;
		}
		else
		{
			B_GiveInvItems(self,other,ItRu_OrcFireball, 1 );
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_12 " );	// So man take this armor and sword of an orc warrior as proof of my words.
		AI_Output(self,other, " DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_13 " );	// Wear them with pride, for no man has yet been honored with such an honor!

		if(other.attribute[ATR_STRENGTH] >= other.attribute[ATR_DEXTERITY])
		{
			B_GiveInvItemsManyThings(self,other);
			CreateInvItems(other,ITAR_ORCARMOR,1);
			CreateInvItems(other,Orc_Blade,1);
		}
		else
		{
			B_GiveInvItemsManyThings(self,other);
			CreateInvItems(other,ItPo_Perm_DEX,1);
			CreateInvItems(other,ITAR_ORCARMOR_DEX,1);
			FixOrcArmor = TRUE;
		};
	};

	AI_Output(other,self,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_14");	//Спасибо.
	OrcIsBackTemple = TRUE;
};


// ------------------------------------------------ ---------quest Nag-Dumgar--------------------------------------- ------------------------

instance DIA_Orc_8550_UrNazul_Muritan (C_Info);
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Muritan_condition;
	information = DIA_Orc_8550_UrNazul_Muritan_info;
	important = FALSE;
	permanent = FALSE;
	description = " I heard you needed Muritan's fang. " ;
};

func int DIA_Orc_8550_UrNazul_Muritan_condition()
{
	if((TakeIdolKrushak == TRUE) && (UrTrallTalkTooth == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Muritan_Info()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Info_01_00 " );	// I heard you needed Muritan's fang.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_01 " );	// Yes, be like this.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Info_01_02 " );	// Why do you need it?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_03 " );	// The man may not know, but his poison can kill almost anyone.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_04 " );	// Ur-Thrall has one very strong enemy that is almost impossible to kill. But he thinks that the monster's venom can help defeat him.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Info_01_06 " );	// I think you have a lot of enemies, warchief. And who is this time?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_07 " );	// (seriously) His name is Nag-Dumgar. Once upon a time, he would be as much an orc as Ur-Thrall.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Info_01_08 " );	// Never heard of this name. Can you tell me about him?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_09 " );	// ...(thoughtfully) Many winters ago, the orc brothers built the Temple of the Sleeper.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_10 " );	// Nag-Dumgar be the leader of that clan whose shamans summon the evil demon.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_11 " );	// However, as humans already know for sure, the demon will trick the orcs and kill them all.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Info_01_12 " );	// Yes, I know what happened in the temple. But what about Nag-Dumgar?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_13 " );	// Upon learning of this, Nag-Dumgar took many warriors with him and went to the temple to kill the demon.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_14 " );	// But it will fail! All his warriors will die, and for some reason he alone will remain alive.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_15 " );	// Returning back, Nag-Dumgar order to seal the entrance to the temple so that the evil demon does not break out.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_16 " );	// ...(thoughtfully) However, Nag-Dumgar will change a lot after going to the temple.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_17 " );	// He began to constantly overcome some kind of immense thirst for blood!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_18 " );	// Nag-Dumgar begin to sacrifice orc brothers, saying that this will protect the clan from the wrath and curse of the evil demon.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Info_01_19 " );	// Like this? I don't think the orcs liked it.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_20 " );	// Man be right! The orcs think that Nag-Dumgar is going crazy and decide to kill him.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_21 " );	// However, upon learning of this, Nag-Dumgar will go completely mad!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_22 " );	// He will curse his clan and kill all those who dare to stand in his way.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_23 " );	// Those orc brothers who still managed to survive swore that Nag-Dumgar himself would turn into an evil demon!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Info_01_24 " );	// And what happened next?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_25 " );	// (thoughtfully) Nobody knows this...
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_26 " );	// After Nag-Dumgar kill all his brothers, he will disappear without a trace, and no one else will see him for many winters.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_27 " );	// But recently my scouts reported to me that they see something similar to Nag-Dumgar not far from the high tower, in the north of the valley.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_28 " );	// I send some of my best warriors there, but none of them come back.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Info_01_29 " );	// Do you think this is his doing?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_30 " );	// Ur-Thrall isn't sure exactly, but I think it might be.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_31 " );	// Recent events at the Temple of the Sleeper may have caused Nag-Dumgar to return to the valley.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_32 " );	// If so, then he will surely want to avenge his master's death, and then all orc brothers will be in great danger.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_33 " );	// But Ur-Thrall cannot let Nag-Dumgar harm them again!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Info_01_34 " );	// And you naively think Muritan's poison can stop him?!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_35 " );	// Ur-Thrall certainly doesn't know this! However, he has no other thoughts about how to kill Nag-Dumgar. Maybe people have them?
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Info_01_37 " );	// If you look for the answer to this question, then only in the Temple itself. After all, it was there that Nag-Dumgar became the one with whom you are now dealing.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Info_01_39 " );	// Ur-Thrall can't go there now! But maybe a person could go to the Temple and find out?
	Info_ClearChoices(DIA_Orc_8550_UrNazul_Muritan);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan, " I don't have time for this. " ,DIA_Orc_8550_UrNazul_Muritan_No);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan, " Okay, I'll take care of it. " ,DIA_Orc_8550_UrNazul_Muritan_Yes);
};

func void DIA_Orc_8550_UrNazul_Muritan_No()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_No_01_01 " );	// I don't have time for this.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_No_01_02 " );	// You'll have to deal with this yourself, warchief.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_No_01_03 " );	// Good! Ur-Thrall do everything himself. The person can no longer worry.
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8550_UrNazul_Muritan_Yes()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Yes_01_01 " );	// Okay, I'll take care of it.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Yes_01_02 " );	// Then man no time to waste! He's going to the Temple and learning how to kill Nag-Dumgar!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Yes_01_03 " );	// Wait for news, leader.
	MIS_NagDumgar = LOG_Running;
	Log_CreateTopic(TOPIC_NagDumgar,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_NagDumgar,LOG_Running);
	B_LogEntry(TOPIC_NagDumgar, " I asked Ur-Thrall why he needed a fang with Muritan's venom. The orc warchief believes that it can be used to slay Nag-Dumgar, the once powerful leader of the orc clan that built the Temple of the Sleeper, and who later turned into an evil demon. But it seems to me that even deadly poison will be powerless against this ancient curse of the orcs. Most likely, the secret of the only sure way to kill Nag-Dumgar lies in the ruins of the Temple itself, and I volunteered to find it ... " );
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8550_UrNazul_XashGor(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_XashGor_condition;
	information = DIA_Orc_8550_UrNazul_XashGor_info;
	important = FALSE;
	permanent = FALSE;
	description = " What do you know about High Shaman Khash-Gor? " ;
};

func int DIA_Orc_8550_UrNazul_XashGor_condition()
{
	if ((MIS_Failed == LOG_Running) && (KnowAboutFailed_P3 ==  TRUE ) && (HashGorIsDead ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_XashGor_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_XashGor_01_01 " );	// What do you know about the supreme shaman Khash-Gor?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_XashGor_01_02 " );	// Hmmm... Be a very ancient name...(thoughtfully) As far as Ur-Thrall know, Hash-Gor was once a great orc shaman.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_XashGor_01_03 " );	// I know this myself. What else can you say about him?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_XashGor_01_04 " );	// Ur-Thrall knows little about this, since Khash-Gor lived so many winters ago.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_XashGor_01_06 " );	// And you have no idea where I can find it?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_XashGor_01_07 " );	// If anyone knows where Hash-Gor is now, then only the one who lived at that time.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_XashGor_01_08 " );	// And as you probably understand, there are no such people among the orcs now.
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_XashGor_01_09");	//Ясно.
	DeadRabOrkovInsert = TRUE;
	B_LogEntry(TOPIC_NagDumgar, " As you might expect, Ur-Thrall knows nothing about Hash-Gor. According to him, only someone who lived during the time of Hash-Gor can tell about him. And there are no such among the orcs... Unless among the dead. " );
};

instance DIA_Orc_8550_UrNazul_Muritan_Dagger (C_Info);
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Muritan_Dagger_condition;
	information = DIA_Orc_8550_UrNazul_Muritan_Dagger_info;
	important = FALSE;
	permanent = FALSE;
	description = " I figured out how to kill Nag-Dumgar! " ;
};

func int DIA_Orc_8550_UrNazul_Muritan_Dagger_condition()
{
	if ((MIS_Stunning == LOG_Running) && (KnowAboutStumbling_P3 ==  TRUE ) && (Npc_HasItems(other,ItMw_1h_TributeDagger) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Muritan_Dagger_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_02 " );	// I've been to the Temple of the Sleeper and figured out how to kill Nag-Dumgar!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_04 " );	// Here, take a look at this item.
	B_GiveInvItems(other,self,ItMw_1h_TributeDagger,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_05");	//Хммм...(задумчиво) Что это?!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_06 " );	// Judging by the ancient records that I found in the temple, this dagger was used by the orcs to sacrifice their own brethren.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_07 " );	// However, the sacrifices were not intended for the Sleeper, as they naively believed, but for Nag-Dumgar himself!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_08 " );	// Or rather, an evil spirit that has taken over the mind of a powerful leader.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_09 " );	// That's why Nag-Dumgar was furious that the orcs refused to kill each other. Because then he would stop receiving the sacrificial blood necessary for him.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_11 " );	// And this dagger seems to be capable of killing Nag-Dumgar as well. It remains only to find him and plunge the dagger into his heart.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_13 " );	// (respectfully) The man is very surprised Ur-Thrall that he could find out all this. If everything turns out as he says, then the orcs should no longer be afraid of Nag-Dumgar and his curse!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Info_01_15 " );	// Ur-Thrall thanks the humans for their help. Now he himself will go to find and kill Nag-Dumgar!
	B_LogEntry(TOPIC_NagDumgar, " I brought Ur-Thrall a sacrificial dagger with which to slay Nag-Dumgar. " );
	Info_ClearChoices(DIA_Orc_8550_UrNazul_Muritan_Dagger);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan_Dagger, " Hope you do well. " ,DIA_Orc_8550_UrNazul_Muritan_Dagger_No);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan_Dagger, " Can I kill this demon myself? " ,DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes);
};

func void DIA_Orc_8550_UrNazul_Muritan_Dagger_No()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Dagger_No_01_00 " );	// I hope everything works out for you, chief.
	MIS_NagDumgar = LOG_Success;
	StupidInsertForClockTrall = TRUE ;
	Log_SetTopicStatus(TOPIC_NagDumgar,LOG_SUCCESS);
	B_LogEntry(TOPIC_NagDumgar, " Now with a powerful weapon, Ur-Thrall will fight Nag-Dumgar. My participation in this story has come to an end... " );
	AI_StopProcessInfos(self);

};

func void DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_00 " );	// Can I kill this demon myself?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_01 " );	// (surprised) Human wants to fight Nag-Dumgar?!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_03 " );	// Ur-Thrall to be admired by the courage of a man... (respectfully) But I must warn him that Nag-Dumgar is very strong and dangerous!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_04 " );	// A person must understand that he does not have the right to make a mistake, otherwise many brothers will die.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_05 " );	// I understand that, and I'll try not to let you down.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_06 " );	// Good... (thoughtfully) Ur-Thrall to see a person with more self-confidence!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_07 " );	// Therefore, he is ready to task him to kill Nag-Dumgar! Here is a man to take a dagger and now go fight the demon.
	B_GiveInvItems(self,other,ItMw_1h_TributeDagger,1);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_09 " );	// Where can I find it?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_Dagger_Yes_01_10 " );	// As Ur-Thrall said, Nag-Dumgar was last seen to the north, near the stone fort in the mountains. One has to search there.
	NagDumgarInsert = TRUE ;
	B_LogEntry(TOPIC_NagDumgar, " I volunteered to fight Nag Dumgar myself! Ur-Thrall appreciated my courage, but warned me not to make a mistake. Nag Dumgar was last seen to the north, near the stone fort in the mountains. " );
	Info_ClearChoices(DIA_Orc_8550_UrNazul_Muritan_Dagger);
	Info_AddChoice(DIA_Orc_8550_UrNazul_Muritan_Dagger,Dialog_Ende,DIA_Orc_8550_UrNazul_Muritan_Dagger_Quit);
};

func void DIA_Orc_8550_UrNazul_Muritan_Dagger_Quit()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8550_UrNazul_Muritan_DaggerDone(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Muritan_DaggerDone_condition;
	information = DIA_Orc_8550_DaggerDone_info;
	permanent = FALSE;
	description = " Nag-Dumgar is dead! " ;
};

func int DIA_Orc_8550_UrNazul_Muritan_DaggerDone_condition()
{
	if ((MIS_Failed == LOG_Running) && (FailedIsDead ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info_01_00 " );	// Nag-Dumgar is dead!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info_01_01 " );	// Arghhh...(respectfully) Man once again prove that he be a great warrior!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info_01_02 " );	// Ur-Thrall thank him for helping his brothers. The curse of Nag-Dumgar will no longer trouble us!
	B_GiveInvItems(self,other,ItPo_UrTrallPotion,1);
	MIS_NagDumgar = LOG_Success;
	Log_SetTopicStatus(TOPIC_NagDumgar,LOG_SUCCESS);
	B_LogEntry(TOPIC_NagDumgar, " Ur-Thrall was glad to hear that the orc demon Nag-Dumgar was dead... " );
};

instance DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion (C_Info);
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_condition;
	information = DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_info;
	permanent = FALSE;
	description = " What kind of drink did you give me? " ;
};

func int DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_condition();
{
	if (( MIS_Failed == LOG_Success ) && ( Npc_HasItems ( other , ItPo_UrTrallPotion ) >=  1 )) .
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_Info();
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_01 " );	// What other drink did you give me?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_02 " );	// To be a very ancient and very valuable orc drink! Ur-Thrall keep it for many winters, but never dare to drink it himself.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_03 " );	// But a man to prove that he is worthy to possess it!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_04 " );	// Hope I don't get poisoned by it?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_UrTrallPotion_01_05 " );	// The person need not worry. This drink will not kill him, but only make him stronger.
};

instance DIA_Orc_8550_UrNazul_Sword(C_Info)
{
	npc = Orc_8550_UrNazul;
	condition = DIA_Orc_8550_UrNazul_Sword_condition;
	information = DIA_Orc_8550_UrNazul_Sword_info;
	permanent = FALSE;
	description = " Blacksmith Hash Tor is giving you this sword. " ;
};

func int DIA_Orc_8550_UrNazul_Sword_condition()
{
	if (( MIS_HashTorOre == LOG_Running ) && ( Npc_HasItems ( other , ITMW_2H_ORCSWORD_05 ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_Orc_8550_UrNazul_Sword_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Sword_01_01 " );	// Blacksmith Hash Tor gives you this sword.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Sword_01_02 " );	// Let me see it.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Sword_01_03 " );	// Here it is.
	B_GiveInvItems(other,self,ITMW_2H_ORCSWORD_05,1);
	AI_Output(self,other,"DIA_Orc_8550_UrNazul_Sword_01_04");	//Хммм...(оценивающе)
	AI_UnequipWeapons(self);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Sword_01_05 " );	// Be a very good sword! Ur-Thrall likes him.
	AI_RemoveWeapon(self);
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Sword_01_06 " );	// Tell Hash Tor that I'm happy with his work. He is a real master!
	B_LogEntry(TOPIC_HashTorOre, " Ur-Thrall liked the sword. I should tell Hash Tor about it. " );	
	UrTrallTakeSword = TRUE;
};

instance DIA_ORC_8550_URNAZUL_AZGALOR(C_Info)
{
	npc = orc_8550_urnazul;
	condition = DIA_ORC_8550_URNAZUL_AZGALOR_condition;
	information = DIA_ORC_8550_URNAZUL_AZGALOR_info;
	permanent = FALSE;
	description = " Are there more errands for me? " ;
};

func int DIA_ORC_8550_URNAZUL_AZGALOR_condition()
{
	if((DARKMAGE_ISDEAD == TRUE) && (OrcIsBackTemple == TRUE))
	{
		return TRUE;
	};
};

func void DIA_ORC_8550_URNAZUL_AZGALOR_info()
{
	AI_Output(other,self, " DIA_Ass_127_Osair_AssasinGold_01_01 " );	// Will there be more errands for me?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_21 " );	// Ur-Thrall not to know...(thoughtfully) No, Ur-Thrall to know!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_22 " );	// Human go to Ur-Thrall's old house, and kill Azgalor there.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Hello_Info_18_25 " );	// Azgalore? Who is it?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_33 " );	// No. Azgalor be a big evil dragon. And he live where Ur-Thrall used to live.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Hello_Info_18_35 " );	// Dragon?! Do you want me to kill a dragon for you? Are you not in league with them?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_42 " );	// This dragon is different. Arghhh... Azgalor is evil, don't feel sorry for anyone!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_43 " );	// Many winters ago, Azgalor summoned a demon - a large demon, strong, called the Forge of Souls.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_44 " );	// Demon serve Azgalor! Orcs serve the demon. If the brothers serve well, Azgalor promise to make the brothers strong to defeat the enemies.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_45 " );	// Ur-Thrall don't want to, say you can't do it! Demon is evil!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_46 " );	// But brothers do not listen to Ur-Thrall. Brothers drink the blood of a demon - become strong and serve him.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_47 " );	// Brothers defeat their enemy. And the demon takes the souls of enemies and brings a gift to Azgalor!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_48 " );	// But Azgalor wants more and more souls! The blood of the demon haunts the mind and soul of the brothers.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_49 " );	// But the moment has come and the brothers get tired of fighting - the brothers want peace and quiet. They refuse to serve the demon and Azgalor.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_51 " );	// Azgalor to order to kill them. All orcs - Ur-Thrall and brothers!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_52 " );	// Demon kill many brothers, take their souls. Ur-Thrall come out to fight him. Call your brother Ur-Grom with you.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_55 " );	// Brother and Ur-Thrall go to the valley - fight the demon... Demon die! Brother to die!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_56 " );	// Ur-Thrall hate Azgalor! Promise to avenge his brother's death.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Hello_Info_18_57 " );	// And you want me to take revenge instead of you?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_58 " );	// Arrrrghhh...(angrily) Ur-Thrall cannot return. Ur-Tral is cursed!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_59 " );	// If Ur-Thrall go home, then be immediately dead. Rise up and serve Azgalor!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_61 " );	// Serve, but must kill. Man understand?!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Hello_Info_18_62 " );	// A man to understand... (imitating an orc) It looks like I don't have much choice, I agree. Where is your old house?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_63 " );	// Man understand correctly! Good. The house of Ur-Thrall be far away, no feet to walk. Walking magic!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_65 " );	// Ur-Thrall give two stones. Man search down in the cave for the path of magic. The entrance is closed by a grate. A man put a stone and open a passage.
	B_GiveInvItems(self,other,itmi_1_orcportalstone,1);
	B_GiveInvItems(self,other,itmi_2_orcportalstone,1);
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_68 " );	// Now man go, Ur-Thrall wait, wait for Azgolor's heart.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Hello_Info_18_69 " );	// M-yes, I smell, I'll have to sweat! Well, orc, wait - soon you will be able to break his heart.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_Info_18_70 " );	// Have an easy road and good hunting to you, human.
	MIS_URNAZULRAGE = LOG_Running;
	Log_CreateTopic(TOPIC_URNAZULRAGE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_URNAZULRAGE,LOG_Running);
	B_LogEntry( TOPIC_URNAZULRAGE , " Ur-Thral asked me to kill Azgalor, the mighty black dragon! Once upon a time, he made the orcs drink the blood of a demon to strengthen them against enemies. Orcs became almost invincible, but subject to the demon and the dragon, like their slaves. Azgalor and the demon used orcs to take the souls of their defeated enemies. " );
	B_LogEntry_Quiet( TOPIC_URNAZULRAGE , " Tired of constant bloody wars, the orcs no longer wanted to serve Azgalor and his demon. The dragon ordered the demon to bring the souls of the disobedient. Ur-Thrall and his brother Ur-Grom managed to kill the demon. But the victory cost Ur-Grom his life. Heart of Ur -Thralla wants vengeance on Azgalor. " );
	) ; _ _ _ _ _
	KNOWS_AZGOGLOR_SUMMON = FALSE;
	UrTrallOkShv = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8550_URNAZUL_HELLO_2(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_hello_2_condition;
	information = dia_orc_8550_urnazul_hello_2_info;
	important = TRUE;
	permanent = FALSE;
};

func int dia_orc_8550_urnazul_hello_2_condition()
{
	if((MIS_URNAZULRAGE == LOG_Running) && (BLKDRAGNISDEAD == FALSE) && (GIVEPOTIONURNAZUL == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_hello_2_info()
{
	Snd_Play3d(self,"ORC_AMBIENT_SHORT02");
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_2_Info_18_01 " );	// Man, wait some more. Ur-Thrall give the man a potion. Man drink the potion and be strong, just like an orc.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Hello_2_Info_18_03 " );	// Very handy! It certainly won't hurt me when I cut off the dragon's head.
	B_GiveInvItems(self,other,ItPo_Perm_STR,1);
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Hello_2_Info_18_04 " );	// Now man go.
	GIVEPOTIONURNAZUL = TRUE;
};

instance DIA_ORC_8550_URNAZUL_COMPLETE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_complete_condition;
	information = dia_orc_8550_urnazul_complete_info;
	important = FALSE;
	permanent = TRUE;
	description = " The black dragon Azgalor is dead! " ;
};

func int dia_orc_8550_urnazul_complete_condition()
{
	if((MIS_URNAZULRAGE == LOG_Running) && (BLKDRAGNISDEAD == TRUE) && (Npc_HasItems(other,itat_blackdragonheart) >= 1) && (AZGOLORCOMPLETE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_complete_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Complete_Info_18_01 " );	// The black dragon Azgalor is dead! Here is his heart.
	B_GiveInvItems(other,self,itat_blackdragonheart,1);
	Npc_RemoveInvItems(self,itat_blackdragonheart,1);
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Complete_Info_18_03 " );	// Ur-Thrall to see, Azgalor to die! Ur-Thrall avenge the cursed dragon.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Muritan_DaggerDone_Info_01_01 " );	// Arghhh...(respectfully) Man once again prove that he be a great warrior!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_ORCTEMPLEISFREE_01_14");	//Спасибо.
	AI_PlayAni(self,"T_GREETGRD");
	MIS_URNAZULRAGE = LOG_SUCCESS;
	B_LogEntry( TOPIC_URNAZULRAGE , " I brought Ur-Thrall the heart of a black dragon. " );
	Log_SetTopicStatus(TOPIC_URNAZULRAGE,LOG_SUCCESS);
	AZGOLORCOMPLETE = TRUE;
};

instance DIA_ORC_8550_URNAZUL_URGROM(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_urgrom_condition;
	information = dia_orc_8550_urnazul_urgrom_info;
	important = FALSE;
	permanent = TRUE;
	description = " And one more thing... " ;
};

func int dia_orc_8550_urnazul_urgrom_condition()
{
	if((AZGOLORCOMPLETE == TRUE) && (BROTHERCOMPLETE == FALSE) && (MEETURGROM > 0) && (UrGromIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_urgrom_info()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrGrom_Info_18_01 " );	// And one more thing... By killing Azgalor, I removed the curse that hung over all your brothers.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrGrom_Info_18_02 " );	// Including... your brother, Ur-Grom.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrGrom_Info_18_03 " );	// (uncomprehending) Ur-Thrall doesn't understand! Ur-Thrall think brother is dead!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrGrom_Info_18_04 " );	// Your brother is alive, chief. It was he who helped me destroy this creature whose heart you now hold in your hand.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrGrom_Info_18_07 " );	// In fact, all your ghost brothers have regained their material essence. And now more alive than all the living.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrGrom_Info_18_08 " );	// Brother... brother.. Ur-Thunder!!!...(dazed)
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrGrom_Info_18_09 " );	// Okay, orc, come on. I was glad to meet you!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrGrom_Info_18_12 " );	// Wait... man to bring the news - Ur-Thrall rejoice very much!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrGrom_Info_18_15 " );	// Ur-Thrall to thank the person. You have to think how .... Man chooses for himself! Choose whatever you want.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrGrom_Info_18_16 " );	// I don't need anything right now. But perhaps in the future...
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrGrom_Info_18_17 " );	// Ur-Thrall give your word, Ur-Thrall never forget! Man come and ask. Ur-thrall do!
	AI_Output(other,self,"DIA_Orc_8550_UrNazul_UrGrom_Info_18_20");	//Спасибо.
	BROTHERCOMPLETE = TRUE;
	ORCPROMISE = TRUE;
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8550_URNAZUL_PROMISE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_promise_condition;
	information = dia_orc_8550_urnazul_promise_info;
	important = FALSE;
	permanent = TRUE;
	description = " Do you know an orc named Ur-Shak? " ;
};

func int dia_orc_8550_urnazul_promise_condition()
{
	if((ORCPROMISE == TRUE) && (ORCPROMISEMAKE == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_promise_info()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Promise_Info_01_00 " );	// Do you know an orc named Ur-Shak?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Promise_Info_01_01 " );	// Yes, be big, but a strange son of a spirit, many winters ago. Want to be friends with people. Why do you need him?
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Promise_Info_01_02 " );	// I know who he is, I know why the orcs drove him out.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Promise_Info_01_04 " );	// You promised to fulfill my request, so I ask you: let him return and become a shaman again, as before.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LowLevel_01_11 " );		// Hmmmm. Ur-Thrall remember that the man was able to defeat the evil dragon.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_LowLevel_01_12 " );		// The one to be as strong as the demon in the deep mine!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Promise_Info_01_05 " );	// Ur-Thrall does not wait for such a request. But Ur-Thrall keep his word!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_Promise_Info_01_06 " );	// Ur-Shak to be forgiven - to be able to return home. Become a son of the spirit again!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_Promise_Info_01_07 " );	// Thank you!
	B_LogEntry(TOPIC_Urshak, " I spoke to the orc chieftain about Ur-Shak. The chieftain did not forget his promise and agreed to fulfill my request. Now I must find Ur-Shak and tell him about it. " );
	ORCPROMISEMAKE = TRUE;
};

// --------------------------------Black ore-------- -------------------------------------------------- ----

instance DIA_ORC_8550_URNAZUL_BLACKORE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_blackore_condition;
	information = dia_orc_8550_urnazul_blackore_info;
	permanent = FALSE;
	description = " Rumor has it that you orcs know where to find black ore. " ;
};

func int dia_orc_8550_urnazul_blackore_condition()
{
	if (( MIS_URNAZULRAGE  ==  LOG_SUCCESS ) && ( FINDOREALREADY  ==  FALSE ) && Npc_KnowsInfo(hero,xbs_7513_darrion_blackore) && (RhetoricSkillValue[ 1 ] >=  75 )) ;
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_blackore_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_BlackOre_01_01 " );	// Rumor has it that you orcs know where to find black ore.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_BlackOre_01_02 " );	// Man be need black ore?!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_BlackOre_01_04 " );	// Hmmm... (thoughtfully) When Ur-Thrall has long been living far away with his brothers, finding a lot of black ore and making strong armor, killing all enemies.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_BlackOre_01_05 " );	// Man again go to the valley where Ur-Thrall lived, and look for ore there.
	B_LogEntry( TOPIC_GUARDIANS , " Darrion was right. Ur-Thrall told me where to find the precious black ore. I should go to Shadowdale and look there. " );
};

// ------------------------------------------------ -----Hag-Tar------------------------------------------- ------

instance DIA_ORC_8550_URNAZUL_URHAN (C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_urhan_condition;
	information = dia_orc_8550_urnazul_urhan_info;
	permanent = FALSE;
	description = " I have something to do with you. " ;
};

func int dia_orc_8550_urnazul_urhan_condition()
{
	if(MIS_KILLURTRALL == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_urhan_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_01_04 " );	// I have one thing for you. Do you know an orc named Hag-Thar?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_01_05 " );	// Yes, he is one of my very best warriors.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_01_06 " );	// Ur-Thrall send him to war with the people in the great valley to take the fortress.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_01_07 " );	// And Hag-Tar has already done it. Ur-Thrall respect Hag-Tar!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_01_08 " );	// Of course, of course! What you don't know is that this general of yours now wants to kill you.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_01_09 " );	// What?! Hag-Thar want Ur-Thrall dead?
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_01_10 " );	// Yes, that's right! Because he intends to become a leader himself, instead of you.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_01_11 " );	// KHATAG BAT NAR!...(terribly) If a person lies, then a person will die. Long to die. Be a lot of pain.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_01_12 " );	// I'm telling the truth. Hag-Tar has offered to kill you, promising to release the captured paladins in return.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_01_16 " );	// If you don't believe me, ask Ur-Shak, he can confirm my words.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_01_17 " );	// The son of the spirit to speak and the man to speak, means to be true. Ur-Thrall believe.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_01_22 " );	// But Ur-Thrall didn't understand why the human would tell me?
	Info_ClearChoices(dia_orc_8550_urnazul_urhan);
	Info_AddChoice(dia_orc_8550_urnazul_urhan, " I just don't like killing without warning! " ,dia_orc_8550_urnazul_urhan_killyou);

	if((CANFREEPALADIN == FALSE) && (CASTLEISFREE == FALSE))
	{
		Info_AddChoice(dia_orc_8550_urnazul_urhan, " I have a reason. " ,dia_orc_8550_urnazul_urhan_helpyou);
	};
};

func void dia_orc_8550_urnazul_urhan_killyou()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_KillYou_01_01 " );	// I just don't like to kill without warning!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_KillYou_01_02 " );	// HROTOK YABART!...(angrily) So you decide to challenge me after all?!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_KillYou_01_06 " );	// Man be stupid, I'll tear the man to pieces! Ulu-Mulu can't help. Arrrrrrrg!!!
	URNAZULFUCKOFF = TRUE;
	ULUMULUISEQUIP_NO = TRUE;
	ULUMULUISEQUIP = FALSE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
};

func void dia_orc_8550_urnazul_urhan_helpyou()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_03 " );	// I have a reason for this. I want you to free the paladins imprisoned by Hag-Thar in the fortress.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_04 " );	// HROTOK YABART! (angrily) No! People be enemies! Enemies to lose - must die.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_05 " );	// Chief, the lives of several people in exchange for yours.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_06 " );	// Hag-Tar will strike, if not today then tomorrow. Not me, but one of the orcs.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_09 " );	// Arrrgh... Okay! Ur-Thrall let people go, change lives. But not on your own, but on the life of Hag-Tar!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_12 " );	// Man kill traitor - Ur-Thrall let people go!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_13 " );	// What?! And how will I do it? He is surrounded by the lower ranks.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_14 " );	// Not a single orc in the fortress will watch their general killed.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_15 " );	// (imperiously) A person need not worry about this!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_16 " );	// Man be right.... Ur-Thrall give the man his talisman - Totem of Strength! He is the symbol of Ur-Thrall's power.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_HelpYou_01_17 " );	// No orc will dare to attack a human if he carries it with him.
	Info_ClearChoices(dia_orc_8550_urnazul_urhan);
	Info_AddChoice(dia_orc_8550_urnazul_urhan, " I don't believe you. " ,dia_orc_8550_urnazul_urhan_no);
	Info_AddChoice(dia_orc_8550_urnazul_urhan, " Okay! I agree. " ,dia_orc_8550_urnazul_urhan_OK);
};

func void dia_orc_8550_urnazul_urhan_no()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_No_01_01 " );	// Do I look like an idiot? Decided to get rid of both the opponent and the killer in one fell swoop?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_No_01_02 " );	// Hmmm...(thoughtfully) Then the human leaves no choice Ur-Thrall!
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_No_01_03 " );	// I order my warriors to kill the man, make him dead.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_No_01_04 " );	// Let's see who wins!
	URNAZULFUCKOFF = TRUE;
	ULUMULUISEQUIP_NO = TRUE;
	ULUMULUISEQUIP = FALSE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
};

func void dia_orc_8550_urnazul_urhan_Ок()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_Ok_01_01 " );	// All right! I agree.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHan_Ok_01_02 " );	// Then - here, a man take a talisman and go kill Hag-Tar!
	B_GiveInvItems(self,other,itmi_orcmaintotem,1);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHan_Ok_01_04 " );	// Of course.
	URNAZULGIVETASK = TRUE;
	B_LogEntry( TOPIC_KILLURTRAL , " I decided not to rush things and first talk with Ur-Thrall himself. After listening to me, the supreme leader gave me another assignment - to kill the traitor Hag-Tar himself. If I manage to do this, he will release Garond and him from captivity people. Ur-Thrall gave me his talisman - the Totem of Power, a sign of his power. According to him, the orcs will not dare to attack me if I challenge Hag-Tar. " );
	AI_StopProcessInfos(self);
};

instance DIA_ORC_8550_URNAZUL_URHANKILLDONE(C_Info)
{
	npc = orc_8550_urnazul;
	condition = dia_orc_8550_urnazul_urhankilldone_condition;
	information = dia_orc_8550_urnazul_urhankilldone_info;
	permanent = FALSE;
	description = " Hag-Thar is dead. " ;
};

func int dia_orc_8550_urnazul_urhankilldone_condition()
{
	if((MIS_KILLURTRALL == LOG_Running) && (KILLHAGTARURTRALL == TRUE))
	{
		return TRUE;
	};
};

func void dia_orc_8550_urnazul_urhankilldone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHanKillDone_01_01 " );	// Hag-Thar is dead.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHanKillDone_01_02 " );	// Be good news. Ur-thrall be a happy man!
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHanKillDone_01_03 " );	// What about our agreement - will you release the captive paladins?
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHanKillDone_01_04 " );	// First, the person to return the talisman of strength. Then talk about people.
	MIS_KILLURTRALL = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_KILLURTRALL,LOG_SUCCESS);
	B_LogEntry( TOPIC_KILLURTRAL , " I have informed Ur-Thrall of Hag-Thar's death. I think he will let the paladins go now. " );
	Info_ClearChoices(dia_orc_8550_urnazul_urhankilldone);
	Info_AddChoice(dia_orc_8550_urnazul_urhankilldone, " I'll keep him. " ,dia_orc_8550_urnazul_urhankilldone_no);

	if (Npc_HasItems(hero,itmi_orcmaintotem) >=  1 )
	{
		Info_AddChoice(dia_orc_8550_urnazul_urhankilldone, " Here, take him. " ,dia_orc_8550_urnazul_urhankilldone_OK);
	};
};

func void dia_orc_8550_urnazul_urhankilldone_no()
{
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHanKillDone_No_01_01 " );	// Why? I'll keep it to myself, useful thing.
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHanKillDone_No_01_02 " );	// What?!...(angrily) Insolent person! HROTOK JABART!!!
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry( TOPIC_NEWSSURVIVERS , " I'm afraid now I can hardly negotiate with the orcs to let Garond and his people go. " );
	};
	BOGNARREFUSETALK = TRUE;
	Kurgan.aivar[ 93 ] = TRUE ;
	URNAZULFUCKOFF = TRUE;
	ULUMULUISEQUIP_NO = TRUE;
	ULUMULUISEQUIP = FALSE;
	AI_StopProcessInfos(self);
	self.aivar[AIV_EnemyOverride] = FALSE ;
};

func void dia_orc_8550_urnazul_urhankilldone_Ок()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHanKillDone_OK_01_01 " );	// Here.
	B_GiveInvItems(other,self,itmi_orcmaintotem,1);
	AI_Output(self,other, " DIA_Orc_8550_UrNazul_UrHanKillDone_OK_01_02 " );	// Good! Ur-Thrall then let the people go, as promised.
	AI_Output(other,self, " DIA_Orc_8550_UrNazul_UrHanKillDone_OK_01_04 " );	// Thank you, chief.
	CANFREEPALADIN = TRUE;
	if(MIS_NEWSSURVIVERS == LOG_Running)
	{
		B_LogEntry( TOPIC_NEWSSURVIVERS , "The paladins are free now! We need to let them know. " );
	};
	Info_ClearChoices(dia_orc_8550_urnazul_urhankilldone);
};

// ----------------------Gor Kar------------- ------------

instance DIA_ORC_7550_GORKAR_EXIT(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_exit_condition;
	information = dia_ORC_7550_GORKAR_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int dia_ORC_7550_GORKAR_exit_condition()
{
	return TRUE;
};

func void dia_ORC_7550_GORKAR_exit_info()
{
	AI_StopProcessInfos(self);
};

where int GorKarFM;

instance DIA_ORC_7550_GORKAR_NOHIFIRST(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_nohifirst_condition;
	information = dia_ORC_7550_GORKAR_nohifirst_info;
	important = TRUE;
	permanent = FALSE;
};

func int dia_ORC_7550_GORKAR_nohifirst_condition()
{
	if(PlayerKnowsOrcLanguage == FALSE)
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_nohifirst_info()
{
	if (GorKarFM ==  FALSE )
	{
		AI_Output(self,other, " DIA_Orc_7550_GorKar_NoHiFirst_01_01 " );	// KUTAR GOR DAR DRAK!
		AI_Output(self,other, " DIA_Orc_7550_GorKar_NoHiFirst_01_02 " );	// CRAT BUR SHAR DIR?
		AI_Output(other,self, " DIA_Orc_7550_GorKar_NoHiFirst_01_03 " );	// Umm... What are you talking about?
		AI_Output(self,other, " DIA_Orc_7550_GorKar_NoHiFirst_01_04 " );	// MORRA TOUP DUR...(shakes head) GORKAR STAR CAR OR...
		GorKarFM = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_7550_GorKar_NoHiFirst_01_05 " );	// MORRA GORE! GORKAR RAT...
	};

	AI_StopProcessInfos(self);
};

instance DIA_ORC_7550_GORKAR_HIFIRST(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_hifirst_condition;
	information = dia_ORC_7550_GORKAR_hifirst_info;
	important = TRUE;
	permanent = TRUE;
};

func int dia_ORC_7550_GORKAR_hifirst_condition()
{
	if((PlayerKnowsOrcLanguage == TRUE) && (GorKarInv == FALSE))
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_hifirst_info()
{
	var C_Item itm;

	itm = Npc_GetEquippedArmor(other);

	if ((Hlp_IsItem(itm, ITAR_ORCARMOR ) ==  TRUE ) || (Hlp_IsItem(itm, ITAR_ORCARMOR_DEX ) ==  TRUE ) || (Hlp_IsItem(itm, ITAR_SHAMANROBE ) ==  TRUE ))
	{
		if (GorKarFM ==  FALSE )
		{
			AI_Output(self,other, " DIA_Orc_7550_GorKar_HiFirst_01_01 " );	// (angrily) What do you want here, morra? Did you come here to find your death?
		}
		else
		{
			AI_Output(self,other, " DIA_Orc_7550_GorKar_HiFirst_01_02 " );	// (angrily) You again, morra. Are you all looking for your death here?
		};

		AI_Output(other,self, " DIA_Orc_7550_GorKar_HiFirst_01_03 " );	// I was brought here by a slightly different matter.
		AI_Output(self,other, " DIA_Orc_7550_GorKar_HiFirst_01_04 " );	// (surprised) HROTH GIFT! Morra understand the language of orcs?! HAR TOUR RAT...
		AI_Output(other,self, " DIA_Orc_7550_GorKar_HiFirst_01_05 " );	// Are you that surprised?
		AI_Output(self,other, " DIA_Orc_7550_GorKar_HiFirst_01_06 " );	// Gor Kar has never met a person who would understand him.
		AI_Output(self,other, " DIA_Orc_7550_GorKar_HiFirst_01_07 " );	// But he's more surprised that he's wearing orc-made armor. Where is he from, morra?
		AI_Output(other,self, " DIA_Orc_7550_GorKar_HiFirst_01_08 " );	// It was given to me by Ur-Thrall, leader of an orc clan. Heard about this?
		AI_Output(self,other, " DIA_Orc_7550_GorKar_HiFirst_01_09 " );	// GRAT, GRAT... (nods approvingly) I know the great chieftain Ur-Thrall!
		AI_Output(self,other, " DIA_Orc_7550_GorKar_HiFirst_01_10 " );	// He live deep in the mountain and be a very strong warrior.
		AI_Output(self,other, " DIA_Orc_7550_GorKar_HiFirst_01_11 " );	// But Gor Kar does not understand why the great leader would give him such armor.
		AI_Output(other,self, " DIA_Orc_7550_GorKar_HiFirst_01_12 " );	// It's a long story, orc. But in short, I just helped Ur-Thrall in one very difficult matter.
		AI_Output(other,self, " DIA_Orc_7550_GorKar_HiFirst_01_14 " );	// And as a sign of his respect and gratitude, he gave me this armor.
		AI_Output(self,other, " DIA_Orc_7550_GorKar_HiFirst_01_15 " );	// NUR DAR...(rasterianno) Gore Snow never heard of this!
		AI_Output(self,other, " DIA_Orc_7550_GorKar_HiFirst_01_16 " );	// People always be his enemy, and brothers always kill them and then eat them.
		AI_Output(self,other, " DIA_Orc_7550_GorKar_HiFirst_01_17 " );	// But if the great chief himself under the mountain respects the man, Gor Kar will not kill the morr.
		AI_Output(self,other, " DIA_Orc_7550_GorKar_HiFirst_01_18 " );	// If he doesn't do anything bad to him.
		GorKarInv = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_7550_GorKar_HiFirst_01_01 " );	// (angrily) What do you want here, morra? Did you come here to find your death?
		AI_StopProcessInfos(self);
	};
};

instance DIA_ORC_7550_GORKAR_NoArmor(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_NoArmor_condition;
	information = dia_ORC_7550_GORKAR_NoArmor_info;
	permanent = FALSE;
	description = " What if I wasn't wearing this armor? " ;
};

func int dia_ORC_7550_GORKAR_NoArmor_condition()
{
	if(GorKarInv == TRUE)
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_NoArmor_info()
{
	AI_Output(other,self, " DIA_Orc_7550_GorKar_NoArmor_01_01 " );	// What if I wasn't wearing this armor?
	AI_Output(self,other, " DIA_Orc_7550_GorKar_NoArmor_01_02 " );	// Then Gore Kar kill the morr...(viciously) All humans will be his enemy!
	AI_Output(other,self, " DIA_Orc_7550_GorKar_NoArmor_01_03 " );	// It turns out that only because of them you spoke to me?
	AI_Output(self,other, " DIA_Orc_7550_GorKar_NoArmor_01_04 " );	// HAR RAT... (shaking his head) No! Gor Kar just become wondering who the Morra is and why he is wearing Orc armor.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_NoArmor_01_05 " );	// If Gor Kar were not interesting, then the armor would not save a person from death.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_NoArmor_01_06 " );	// And other brothers will also kill morr if you see him!
	AI_Output(other,self, " DIA_Orc_7550_GorKar_NoArmor_01_07 " );	// So I just got lucky.
};

instance DIA_ORC_7550_GORKAR_Ulumulu (C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_Ulumulu_condition;
	info = dia_ORC_7550_GORKAR_Ulumulu_info;
	permanent = FALSE;
	description = " I have Ulu-Mulu. " ;
};

func int dia_ORC_7550_GORKAR_Ulumulu_condition()
{
	if((Npc_KnowsInfo(other,DIA_Orc_7550_GorKar_NoArmor) == TRUE) && (Npc_HasItems(other,ITMW_2H_ORCPRESTIGE) >= 1))
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_Ulumulu_info()
{
	AI_Output(other,self, " DIA_Orc_7550_GorKar_Ulumulu_01_01 " );	// I have Ulu-Mulu.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_Ulumulu_01_02 " );	// GOR AH, KUTU... (with interest) What is it to be?!
	AI_Output(other,self, " DIA_Orc_7550_GorKar_Ulumulu_01_03 " );	// How?! Do not you know?
	AI_Output(other,self, " DIA_Orc_7550_GorKar_Ulumulu_01_04 " );	// It's a sign of orc strength! Orcs usually do not touch its owner.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_Ulumulu_01_05 " );	// Gor Kar doesn't know what kind of thing a person is showing him.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_Ulumulu_01_06 " );	// He sees that this too is being done by orcs. But he didn't know what it was for!
	AI_Output(other,self, " DIA_Orc_7550_GorKar_Ulumulu_01_07 " );	// How interesting. It turns out that you are not like other orcs if you do not know anything about Ulu-Mulu.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_Ulumulu_01_09 " );	// AR GAR...(nodding) Gor Kara's brothers are different from those who live in the big valley.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_Ulumulu_01_10 " );	// Orcs have been living in these mountains for a very long time! We have our enemy and our customs.
};

instance DIA_ORC_7550_GORKAR_Difference(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_Difference_condition;
	information = dia_ORC_7550_GORKAR_Difference_info;
	permanent = FALSE;
	description = " Do you have an enemy here?! " ;
};

func int dia_ORC_7550_GORKAR_Difference_condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Orc_7550_GorKar_Ulumulu ) ==  TRUE )
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_Difference_info()
{
	AI_Output(other,self, " DIA_Orc_7550_GorKar_Difference_01_01 " );	// Do you have an enemy here?!
	AI_Output(self,other, " DIA_Orc_7550_GorKar_Difference_01_02 " );	// To the north of these mountains lies the large Icewind Clan! This is our most formidable enemy.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_Difference_01_03 " );	// Gor Kar and his brothers have been fighting their warriors for many winters now.
	AI_Output(other,self, " DIA_Orc_7550_GorKar_Difference_01_04 " );	// What is your clan name?
	AI_Output(self,other, " DIA_Orc_7550_GorKar_Difference_01_05 " );	// Fire Stone! Gore Kar himself live there.
	AI_Output(other,self, " DIA_Orc_7550_GorKar_Difference_01_06 " );	// Clear. And why didn't you share?
	AI_Output(self,other, " DIA_Orc_7550_GorKar_Difference_01_07 " );	// Brothers always fight for ore magic! Whoever has more ore, that clan is stronger.
	AI_Output(other,self, " DIA_Orc_7550_GorKar_Difference_01_08 " );	// So you're fighting for magic ore? But why?!
	AI_Output(self,other, " DIA_Orc_7550_GorKar_Difference_01_09 " );	// Ore magic to be very powerful! Shamans draw power from it to speak with spirits.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_Difference_01_10 " );	// The power of the ore to protect the clan from various trouble. Therefore, it needs a lot!
	AI_Output(self,other, " DIA_Orc_7550_GorKar_Difference_01_11 " );	// Our enemy also has a lot of ore magic!
	AI_Output(self,other, " DIA_Orc_7550_GorKar_Difference_01_12 " );	// If they have more of it, they will become stronger and quickly defeat us.
	AI_Output(other,self, " DIA_Orc_7550_GorKar_Difference_01_13 " );	// Hmmm... How serious you are.
};

instance DIA_ORC_7550_GORKAR_WhatDo(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_WhatDo_condition;
	information = dia_ORC_7550_GORKAR_WhatDo_info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};

func int dia_ORC_7550_GORKAR_WhatDo_condition()
{
	if(Npc_KnowsInfo(other,DIA_Orc_7550_GorKar_NoArmor) == TRUE)
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_WhatDo_info()
{
	AI_Output(other,self, " DIA_Orc_7550_GorKar_WhatDo_01_01 " );	// What are you doing here?
	AI_Output(self,other, " DIA_Orc_7550_GorKar_WhatDo_01_02 " );	// Gor Kar to seek a new place for the sanctuary of the brothers! It's going to be a very long and complicated undertaking.
	AI_Output(other,self, " DIA_Orc_7550_GorKar_WhatDo_01_03 " );	// What happened to the old one?
	AI_Output(self,other, " DIA_Orc_7550_GorKar_WhatDo_01_04 " );	// The old shrine is under attack by Icewind Warriors! Many brothers of Gor Kara were then killed.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_WhatDo_01_05 " );	// Now they are all dead there and no one else is allowed into the temple.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_WhatDo_01_06 " );	// Orcs can no longer go there to talk to spirits.
};

instance DIA_ORC_7550_GORKAR_TrailOrcCamp (C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_TrailOrcCamp_condition;
	info = dia_ORC_7550_GORKAR_TrailOrcCamp_info;
	permanent = FALSE;
	description = " I have one question for you. " ;
};

func int dia_ORC_7550_GORKAR_TrailOrcCamp_condition()
{
	if((Npc_KnowsInfo(other,DIA_Orc_7550_GorKar_Difference) == TRUE) && (CanTrailOrcCamp == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_TrailOrcCamp_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_01 " );	// I have one question for you.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_02 " );	// What does a person want to know from Gor Kara?
	AI_Output(other,self, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_03 " );	// I'm looking for a small group of people here. He was last stationed in a small fort not far from here.
	AI_Output(other,self, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_04 " );	// Do you know anything about this?
	AI_Output(self,other, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_05 " );	// GRAT TAR... (shaking his head) Gor Karoo knows nothing! He hasn't seen any of the people here for a very long time.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_06 " );	// If anyone can know about them, then only Grum Lok.
	AI_Output(other,self, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_07 " );	// Groom Lok? Who is it?
	AI_Output(self,other, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_08 " );	// Be the leader of our clan, be the strongest warrior of the Gor Kara brothers!
	AI_Output(other,self, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_09 " );	// Well, I'll have to visit him.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_10 " );	// If a human just come to Gor Kara's camp, the orcs will kill him. They won't talk to him for no apparent reason.
	AI_Output(other,self, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_11 " );	// And what should I do?
	AI_Output(self,other, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_12 " );	// Morra must bring to his brothers something for which they will be ready to listen to you.
	AI_Output(self,other, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_13 " );	// Like what to help them fight their enemy!
	AI_Output(other,self, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_14 " );	// Hmmm... Are you hinting at magic ore?
	AI_Output(self,other, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_15 " );	// Gor Kar to think that for many pieces of ore magic brothers really won't kill people.
	AI_Output(other,self, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_16 " );	// 'a lot' is how much?
	AI_Output(self,other, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_17 " );	// Gore Kar think at least a hundred pieces. Or more!
	AI_Output(other,self, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_18 " );	// But that's almost a whole mountain of ore!
	AI_Output(self,other, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_19 " );	// NUR GAR... (shaking his head) Less brothers won't be enough! But a person has to decide for himself how much his life is worth.
	AI_Output(other,self, " DIA_Orc_7550_GorKar_TrailOrcCamp_01_20 " );	// Okay, I understand you.
	B_LogEntry(TOPIC_MissOldFriend, " In the mountains, I met the orc shaman Gor Kara. He did not show hostility towards me, as he was interested in my armor, presented to me by Ur-Thrall. After talking with him, I learned that the fate of Darius's squad might know his leader clan - Grum Lok. However, the orcs will not speak to me unless I bring them something that will untie their tongues. According to Gor Kara, a hundred pieces of magic ore could do this. Well, you have to bend your back a little in the mine if I want to earn the attention of their leader. " );
	GorKarShowMe = TRUE;
};

instance DIA_ORC_7550_GORKAR_Perm(C_Info)
{
	npc = ORC_7550_GORKAR;
	condition = dia_ORC_7550_GORKAR_Perm_condition;
	information = dia_ORC_7550_GORKAR_Perm_info;
	permanent = TRUE;
	description = " Have you found a suitable place yet? " ;
};

func int dia_ORC_7550_GORKAR_Perm_condition()
{
	if(Npc_KnowsInfo(other,DIA_Orc_7550_GorKar_WhatDo) == TRUE)
	{
		return TRUE;
	};
};

func void dia_ORC_7550_GORKAR_Perm_info()
{
	AI_Output(other,self, " DIA_Orc_7550_GorKar_Perm_01_01 " );	// Well, have you already found a suitable place?
	AI_Output(self,other, " DIA_Orc_7550_GorKar_Perm_01_02 " );	// Gor Kar is still looking for him. Man don't interfere!
	AI_StopProcessInfos(self);
};

// -------------------Camp Guardian------------- ------------

instance DIA_GorkCampGuard_EXIT(C_Info)
{
	npc = GorkCampGuard;
	condition = DIA_GorkCampGuard_exit_condition;
	information = DIA_GorkCampGuard_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_GorkCampGuard_exit_condition()
{
	return TRUE;
};

func void DIA_GorkCampGuard_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GorkCampGuard_Hello(C_Info)
{
	npc = GorkCampGuard;
	condition = DIA_GorkCampGuard_Hello_condition;
	information = DIA_GorkCampGuard_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_GorkCampGuard_Hello_condition()
{
	if((PlayerKnowsOrcLanguage == TRUE) && (GorKarShowMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GorkCampGuard_Hello_info()
{
	AI_Output(self,other, " DIA_GorkCampGuard_Hello_01_01 " );	// (surprised) CRAT GIFT! The first time to see the food itself come to the brothers!
	AI_Output(self,other, " DIA_GorkCampGuard_Hello_01_02 " );	// Probably, the spirits today will be very kind if you send it to us.
	AI_Output(self,other, " DIA_GorkCampGuard_Hello_01_03 " );	// Now morra die fast! And then his brothers eat... He has delicious meat.
	AI_Output(other,self, " DIA_GorkCampGuard_Hello_01_04 " );	// Wait, orc! Maybe listen to me first?
	AI_Output(self,other, " DIA_GorkCampGuard_Hello_01_05 " );	// (surprised) MOUNTAIN DAR!!! Food also be able to speak Orc?!
	AI_Output(other,self, " DIA_GorkCampGuard_Hello_01_06 " );	// Stop wondering already! I've come to speak with your chief Grum Lok.
	AI_Output(self,other, " DIA_GorkCampGuard_Hello_01_07 " );	// Morra know about Groom Lok?! (bewildered) Why would a morra want to see a chieftain?
	Info_ClearChoices(DIA_GorkCampGuard_Hello);
	Info_AddChoice(DIA_GorkCampGuard_Hello, " This is none of your business, orc. " ,DIA_GorkCampGuard_Hello_No);

	if(Npc_HasItems(hero,ItMi_Nugget) >= 100)
	{
		Info_AddChoice(DIA_GorkCampGuard_Hello, " (show magic ore) " ,DIA_GorkCampGuard_Hello_Оre);
	};
};

func void DIA_GorkCampGuard_Hello_Оre()
{
	AI_Output(other,self, " DIA_GorkCampGuard_Ore_01_01 " );	// Here is exactly one hundred pieces of magic ore.
	AI_Output(other,self, " DIA_GorkCampGuard_Ore_01_02 " );	// I want to give it to your chief as a small gift.
	AI_Output(self,other, " DIA_GorkCampGuard_Ore_01_03 " );	// BAR SO...(pretty) Ore magic! Lots of ore! Be good, the brothers need a lot of ore magic.
	AI_Output(other,self, " DIA_GorkCampGuard_Ore_01_04 " );	// So can I get through?
	AI_Output(self,other, " DIA_GorkCampGuard_Ore_01_05 " );	// Morra can go to the leader, the brothers do not touch him.
	AI_Output(other,self, " DIA_GorkCampGuard_Ore_01_06 " );	// Where can I find Groom Lok?
	AI_Output(self,other, " DIA_GorkCampGuard_Ore_01_07 " );	// Man go further and look in the middle of the mountain for a big cave - the chief is to be there.
	PassGrumLok = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_GorkCampGuard_Hello_No()
{
	AI_Output(other,self, " DIA_GorkCampGuard_Hello_No_01_01 " );	// This is none of your business, orc.
	AI_Output(self,other, " DIA_GorkCampGuard_Hello_No_01_02 " );	// Then brothers kill morr!
	FinishSTLSD = TRUE;
	AI_StopProcessInfos(self);
};

// ---------------------------Mountain Orc Chieftain------------ -------------

instance DIA_GorkOrcBoss_EXIT(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_exit_condition;
	information = DIA_GorkOrcBoss_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};

func int DIA_GorkOrcBoss_exit_condition()
{
	return TRUE;
};

func void DIA_GorkOrcBoss_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_GorkOrcBoss_Hello(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Hello_condition;
	information = DIA_GorkOrcBoss_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_GorkOrcBoss_Hello_condition()
{
	return TRUE;
};

func void DIA_GorkOrcBoss_Hello_info()
{
	AI_Output(self,other, " DIA_GorkOrcBoss_Hello_01_01 " );	// DAR TUK! (angrily) Who let the morr in here?!
	AI_Output(other,self, " DIA_GorkOrcBoss_Hello_01_02 " );	// I brought you a present, chief.
	AI_Output(self,other, " DIA_GorkOrcBoss_Hello_01_03 " );	// UR MORA A GIFT...(with interest) Morra bringing a gift to Groom Lok? What is it to be?
	Info_ClearChoices(DIA_GorkOrcBoss_Hello);
	Info_AddChoice(DIA_GorkOrcBoss_Hello, " I'm afraid I don't have it with me. " ,DIA_GorkOrcBoss_Hello_No);

	if(Npc_HasItems(other,ItMi_Nugget) >= 100)
	{
		Info_AddChoice(DIA_GorkOrcBoss_Hello, " There are a hundred pieces of magic ore for you. " ,DIA_GorkOrcBoss_Hello_Ore);
	};
};

func void DIA_GorkOrcBoss_Hello_No()
{
	AI_Output(other,self, " DIA_GorkOrcBoss_Hello_No_01_01 " );	// I'm afraid I don't have it with me.
	AI_Output(self,other, " DIA_GorkOrcBoss_Hello_No_01_02 " );	// Then morra now die!
	FinishSTLSD = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_GorkOrcBoss_Hello_Ore()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_GorkOrcBoss_Hello_Ore_01_01 " );	// Here's a hundred pieces of magic ore for you.
	B_GiveInvItems(other,self,ItMi_Nugget,100);
	Npc_RemoveInvItems(self,ItMi_Nugget,100);
	AI_Output(self,other, " DIA_GorkOrcBoss_Hello_Yes_01_02 " );	// Morra bring Groom Lok ore magic?! Be good... very good.
	AI_Output(self,other, " DIA_GorkOrcBoss_Hello_Yes_01_03 " );	// Groom Lok likes the morr's gift! Now he doesn't kill him.
	AI_Output(self,other, " DIA_GorkOrcBoss_Hello_Yes_01_04 " );	// However, he still doesn't understand why a person would do this.
	AI_Output(self,other, " DIA_GorkOrcBoss_Hello_Yes_01_05 " );	// And why come here?!
	GrumLokAgreed = TRUE;
	Info_ClearChoices(DIA_GorkOrcBoss_Hello);
};

instance DIA_GorkOrcBoss_Talk(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Talk_condition;
	information = DIA_GorkOrcBoss_Talk_info;
	permanent = FALSE;
	description = " I'm looking for a small group of people here. " ;
};

func int DIA_GorkOrcBoss_Talk_condition()
{
	if((GrumLokAgreed == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Talk_info()
{
	AI_Output(other,self, " DIA_GorkOrcBoss_Talk_01_04 " );	// I'm looking for a small group of people here. The last time he was located in a small fort, in the east.
	AI_Output(other,self, " DIA_GorkOrcBoss_Talk_01_05 " );	// Do you know anything about this?
	AI_Output(self,other, " DIA_GorkOrcBoss_Talk_01_06 " );	// Hmmm...(thoughtfully) So, morra look for your people, time to come here.
	AI_Output(self,other, " DIA_GorkOrcBoss_Talk_01_07 " );	// Groom Lok knows a little about this. But he won't say anything man!
	AI_Output(other,self, " DIA_GorkOrcBoss_Talk_01_08 " );	// But why?! Isn't the ore I brought you enough to loosen your tongue?
	AI_Output(self,other, " DIA_GorkOrcBoss_Talk_01_09 " );	// Ore be good! But being very small... (shaking head)
	AI_Output(self,other, " DIA_GorkOrcBoss_Talk_01_10 " );	// Man will always be Groom Lok's enemy! Therefore, he must make sure that the person can be trusted.
	AI_Output(self,other, " DIA_GorkOrcBoss_Talk_01_11 " );	// Morra must bring proof to Groom Lok! Then Groom Lok help the man.
	AI_Output(other,self, " DIA_GorkOrcBoss_Talk_01_12 " );	// And what kind of proof do you need?
	AI_Output(self,other, " DIA_GorkOrcBoss_Talk_01_13 " );	// Man bring the head of his enemy! The head of one of the Icewind Clan elders.
	AI_Output(self,other, " DIA_GorkOrcBoss_Talk_01_14 " );	// Then he believes people and talk to him about people.
	AI_Output(other,self, " DIA_GorkOrcBoss_Talk_01_15 " );	// Well, good! And where can I find their elder?
	AI_Output(self,other, " DIA_GorkOrcBoss_Talk_01_16 " );	// Going to the Icewind Clan and killing the elders there would be a bad idea.
	AI_Output(self,other, " DIA_GorkOrcBoss_Talk_01_17 " );	// Morra may die! Be a lot of strong warrior at the enemy.
	AI_Output(self,other, " DIA_GorkOrcBoss_Talk_01_18 " );	// Groom Lok know that to the north they have to be a small camp.
	AI_Output(self,other, " DIA_GorkOrcBoss_Talk_01_19 " );	// A person can step there and look for an elder there.
	AI_Output(other,self, " DIA_GorkOrcBoss_Talk_01_20 " );	// Okay, I'll try.
	MIS_GrumLockProve = LOG_Running;
	Log_CreateTopic(TOPIC_GrumLockProve,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GrumLockProve,LOG_Running);
	B_LogEntry(TOPIC_GrumLockProve, " I've spoken to the Warchief, Grum Lock. If I want to know anything about the fate of Darius's party, I need to get the Warchief's trust first. He asked me to bring me a spoils of war - the head of one of the Icewind Elders. Only then Groom Lok will say what he knows about people. " );
};

instance DIA_GorkOrcBoss_TalkGood(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_TalkGood_condition;
	information = DIA_GorkOrcBoss_TalkGood_info;
	permanent = FALSE;
	description = " Here's the orc elder's head! " ;
};

func int DIA_GorkOrcBoss_TalkGood_condition()
{
	if((MIS_GrumLockProve == LOG_Running) && (Npc_HasItems(other,ItAt_OlderHead) >= 1))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_TalkGood_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_GorkOrcBoss_TalkGood_01_01 " );	// Here's the orc elder's head!
	B_GiveInvItems(other,self,ItAt_OlderHead,1);
	Npc_RemoveInvItems(self,ItAt_OlderHead,1);
	AI_Output(self,other, " DIA_GorkOrcBoss_TalkGood_01_02 " );	// GRAT GRAT...(respectfully) Man don't lie! He really bring the head of the enemy Groom Lok.
	AI_Output(self,other, " DIA_GorkOrcBoss_TalkGood_01_03 " );	// He knows this elder - his name is Mork Ut. The one to kill a lot of Groom Lok brothers.
	AI_Output(self,other, " DIA_GorkOrcBoss_TalkGood_01_04 " );	// Now they are to be avenged! Now Groom Lok respect the man and trust him.
	MIS_GrumLockProve = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_GrumLockProve,LOG_SUCCESS);
	B_LogEntry(TOPIC_GrumLockProve, " I've brought Elder Icewind's head to Grum Lock. I think he'll be more accommodating now. " );
}; 

instance DIA_GorkOrcBoss_Darius(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Darius_condition;
	information = DIA_GorkOrcBoss_Darius_info;
	permanent = FALSE;
	description = " So what about people? " ;
};

func int DIA_GorkOrcBoss_Darius_condition()
{
	if((MIS_GrumLockProve == LOG_SUCCESS) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Darius_info()
{
	AI_Output(other,self, " DIA_GorkOrcBoss_Darius_01_01 " );	// So what about people?
	AI_Output(self,other, " DIA_GorkOrcBoss_Darius_01_02 " );	// Groom Lok promise man, Grum Lok keep your word...
	AI_StopProcessInfos(self);
	DariusInsert = TRUE;
	Wld_InsertNpc(SLD_852_Darius,"ORC_DARIUS");

};

instance DIA_GorkOrcBoss_Clans(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Clans_condition;
	information = DIA_GorkOrcBoss_Clans_info;
	permanent = FALSE;
	description = " Are there other orc clans around here? " ;
};

func int DIA_GorkOrcBoss_Clans_condition()
{
	if(MIS_GrumLockProve == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Clans_info()
{
	AI_Output(other,self, " DIA_GorkOrcBoss_Clans_01_01 " );	// Are there other orc clans around here?
	AI_Output(self,other, " DIA_GorkOrcBoss_Clans_01_02 " );	// Far away in the mountains there are still many clans of brothers.
	AI_Output(self,other, " DIA_GorkOrcBoss_Clans_01_03 " );	// But they don't come here! Be a very long road through the mountains.
};

instance DIA_GorkOrcBoss_War(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_War_condition;
	information = DIA_GorkOrcBoss_War_info;
	permanent = FALSE;
	description = " Why are you at war with the Icewind clan? " ;
};

func int DIA_GorkOrcBoss_War_condition()
{
	if(MIS_GrumLockProve == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_War_info()
{
	AI_Output(other,self, " DIA_GorkOrcBoss_War_01_01 " );	// Why are you at war with the Icewind Clan?
	AI_Output(self,other, " DIA_GorkOrcBoss_War_01_02 " );	// They want to take over our land! Groom Lok and the brothers protect her.
	AI_Output(other,self, " DIA_GorkOrcBoss_War_01_03 " );	// Why are you sure it's yours?
	AI_Output(self,other, " DIA_GorkOrcBoss_War_01_04 " );	// My clan is the first to populate these mountains, live here many winters, build many ancestral shrines.
	AI_Output(self,other, " DIA_GorkOrcBoss_War_01_05 " );	// Then come the Icewind Clan! They will begin to kill my brothers and destroy our sacrificial altar.
	AI_Output(self,other, " DIA_GorkOrcBoss_War_01_06 " );	// Grum Lok be angry, brothers be angry! Take an oath to destroy them all.
	AI_Output(self,other, " DIA_GorkOrcBoss_War_01_07 " );	// Now they will be his natural enemy. Groom Lok wish them dead more than anyone!
	AI_Output(other,self,"DIA_GorkOrcBoss_War_01_08");	//Понятно.
};

instance DIA_GorkOrcBoss_WarDo(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_WarDo_condition;
	information = DIA_GorkOrcBoss_WarDo_info;
	permanent = FALSE;
	description = " Why don't you attack their camp? " ;
};

func int DIA_GorkOrcBoss_WarDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorkOrcBoss_War) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_WarDo_info()
{
	AI_Output(other,self, " DIA_GorkOrcBoss_WarDo_01_01 " );	// Why don't you attack their camp?
	AI_Output(self,other, " DIA_GorkOrcBoss_WarDo_01_02 " );	// Be very dangerous...(shaking head) If we attack, Icewind Shaman will use the power of ore magic.
	AI_Output(self,other, " DIA_GorkOrcBoss_WarDo_01_03 " );	// Enemy have a lot of ore magic! Many brothers of Grum Lok then perish.
	AI_Output(other,self, " DIA_GorkOrcBoss_WarDo_01_04 " );	// How do they use magic ore?
	AI_Output(self,other, " DIA_GorkOrcBoss_WarDo_01_05 " );	// Their shaman conjure spirits to imbue our enemy with tremendous power when near a magic ore.
	AI_Output(self,other, " DIA_GorkOrcBoss_WarDo_01_06 " );	// The enemy becomes very angry and very strong! The brothers of Grum Lok do not defeat them.
	AI_Output(self,other, " DIA_GorkOrcBoss_WarDo_01_07 " );	// Man, too, don't go there. Otherwise become quickly dead!
};

instances of DIA_GorkOrcBoss_Ruda (C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Ruda_condition;
	information = DIA_GorkOrcBoss_Ruda_info;
	permanent = FALSE;
	description = " Your clan also has a mountain of ore! " ;
};

func int DIA_GorkOrcBoss_Ruda_condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorkOrcBoss_WarDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Ruda_info()
{
	AI_Output(other,self, " DIA_GorkOrcBoss_Ruda_01_01 " );	// Your clan has a mountain of ore too!
	AI_Output(self,other, " DIA_GorkOrcBoss_Ruda_01_02 " );	// But our shaman doesn't know her secret...(shaking his head) We don't know how to use the power of ore magic.
	AI_Output(self,other, " DIA_GorkOrcBoss_Ruda_01_03 " );	// True, the enemy think otherwise! He does not know this and is afraid to come here.
	AI_Output(other,self, " DIA_GorkOrcBoss_Ruda_01_04 " );	// Ah, that's how it is.
};

instance DIA_GorkOrcBoss_WhatDo(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_WhatDo_condition;
	information = DIA_GorkOrcBoss_WhatDo_info;
	permanent = FALSE;
	description = " So how do you defeat them? " ;
};

func int DIA_GorkOrcBoss_WhatDo_condition()
{
	if(Npc_KnowsInfo(hero,DIA_GorkOrcBoss_WarDo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_WhatDo_info()
{
	AI_Output(other,self, " DIA_GorkOrcBoss_WhatDo_01_01 " );	// And how then to defeat them?
	AI_Output(self,other, " DIA_GorkOrcBoss_WhatDo_01_02 " );	// Gotta get the magic out of the ore! Then the brothers of Grum Lok will be able to defeat their enemy.
	AI_Output(self,other, " DIA_GorkOrcBoss_WhatDo_01_03 " );	// But Groom Lok doesn't know how to do it. Maybe a person can do it?
	AI_Output(self,other, " DIA_GorkOrcBoss_WhatDo_01_04 " );	// Grum Lok give Morr the most valuable thing if he helps him destroy the enemy's mountain ore magic!
	AI_Output(other,self, " DIA_GorkOrcBoss_WhatDo_01_05 " );	// And what is the most valuable thing?
	AI_Output(self,other, " DIA_GorkOrcBoss_WhatDo_01_06 " );	// Black ore, very rare ore, lots of black ore!
	AI_Output(self,other, " DIA_GorkOrcBoss_WhatDo_01_07 " );	// Or he can then choose his own reward.
	AI_Output(other,self, " DIA_GorkOrcBoss_WhatDo_01_08 " );	// I'll think about your suggestion.
	MIS_ClansWar = LOG_Running;
	Log_CreateTopic(TOPIC_ClansWar,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ClansWar,LOG_Running);
	B_LogEntry(TOPIC_ClansWar, " Grum Lok promised me a generous reward if I helped him defeat the Icewind Clan. The problem is that the enemy clan's warriors are protected by ore magic. If I can remove this advantage, Grum Lok can send his warriors to fight against them. " );
};

instance DIA_GorkOrcBoss_WhatDoDone(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_WhatDoDone_condition;
	information = DIA_GorkOrcBoss_WhatDoDone_info;
	permanent = FALSE;
	description = " Your enemy has lost the power of a magic ore. " ;
};

func int DIA_GorkOrcBoss_WhatDoDone_condition()
{
	if((MIS_ClansWar == LOG_Running) && (MagicPlace05 == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_WhatDoDone_info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self, " DIA_GorkOrcBoss_WhatDoDone_01_01 " );	// Your enemy will soon lose the power of magic ore.
	AI_Output(self,other, " DIA_GorkOrcBoss_WhatDoDone_01_02 " );	// Morra be sure about that?!
	AI_Output(other,self, " DIA_GorkOrcBoss_WhatDoDone_01_03 " );	// You can send your warriors there and check it out.
	AI_Output(other,self, " DIA_GorkOrcBoss_WhatDoDone_01_04 " );	// And it's better not to waste time until they have collected a new one again!
	AI_Output(self,other, " DIA_GorkOrcBoss_WhatDoDone_01_05 " );	// Hmmm... (thoughtfully) Then Grum Lok think that the brothers would not have a better time to attack.
	AI_Output(self,other, " DIA_GorkOrcBoss_WhatDoDone_01_06 " );	// He's sending his best warrior there right now!
	AI_Output(self,other, " DIA_GorkOrcBoss_WhatDoDone_01_07 " );	// If you want, a person can also participate in the battle. Help the brothers of Grum Lok defeat their enemy.
	AI_Output(other,self, " DIA_GorkOrcBoss_WhatDoDone_01_08 " );	// That's exactly what I was going to do.
	AI_Output(self,other, " DIA_GorkOrcBoss_WhatDoDone_01_09 " );	// Then morra no time to waste! Go and help the brothers of Groom Lok.
	B_LogEntry(TOPIC_ClansWar, " I've informed Groom Lok that I've managed to take all the power of the magic ore from the Icewind clan. Now I need to go there with their warriors and destroy the enemy camp. " );
	LessMagicPower = TRUE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_02");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_10");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_11");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_07");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_07_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_06");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_21");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_23");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_22");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORCWARRIOR_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_12");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORCWARRIOR_03");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_13");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_14");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_15");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_02");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_04");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORC_HIGHGUARD_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_07");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORCPWARRIOR_01");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_ORC_HIGHGUARD_03");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_03");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_06");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_05");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_19");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_20");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_09");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_18");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_16");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_17");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_LOA_ORCCAMP_03");
	Wld_InsertNpc(GorkOrcWarriorTroops,"FP_ROAM_CAMP_02_08");
};

instance DIA_GorkOrcBoss_WarWin(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_WarWin_condition;
	information = DIA_GorkOrcBoss_WarWin_info;
	permanent = FALSE;
	description = " Chieftain of the Icewind Clan is dead. " ;
};

func int DIA_GorkOrcBoss_WarWin_condition()
{
	if((MIS_ClansWar == LOG_Running) && (LessMagicPower == TRUE) && (MorkOrcBossIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_WarWin_info()
{
	B_GivePlayerXP(2500);
	AI_Output(other,self, " DIA_GorkOrcBoss_WarWin_01_01 " );	// Chieftain of the Icewind Clan is dead.
	AI_Output(self,other, " DIA_GorkOrcBoss_WarWin_01_02 " );	// CHROBOR YARAT...(pretty) Be the best news for Groom Lok!
	AI_Output(self,other, " DIA_GorkOrcBoss_WarWin_01_03 " );	// His enemy be dead, and now this whole land will be ours again.
	AI_Output(self,other, " DIA_GorkOrcBoss_WarWin_01_04 " );	// Grum Lok to avenge his brothers and thank Morr for helping him.
	AI_Output(self,other, " DIA_GorkOrcBoss_WarWin_01_05 " );	// NUR GAT... (respectfully)
	AI_PlayAni(self,"T_GREETGRD");
	MIS_ClansWar = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_ClansWar,LOG_SUCCESS);
	B_LogEntry(TOPIC_ClansWar, " I am informing Groom Lok that his enemy has been defeated. The warchief was as happy as a child who has been given a toy. " );

};

instance DIA_GorkOrcBoss_FreeDar(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_FreeDar_condition;
	information = DIA_GorkOrcBoss_FreeDar_info;
	permanent = FALSE;
	description = " What do you want for the prisoner's life? " ;
};

func int DIA_GorkOrcBoss_FreeDar_condition()
{
	if((NeedDariusFree == TRUE) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_FreeDar_info()
{
	AI_Output(other,self, " DIA_GorkOrcBoss_FreeDar_01_01 " );	// What do you want for your prisoner's life?
	AI_Output(self,other, " DIA_GorkOrcBoss_FreeDar_01_02 " );	// GROK TAR...(thoughtfully) Grum Lok think that the life of a human slave is very expensive.
	AI_Output(self,other, " DIA_GorkOrcBoss_FreeDar_01_03 " );	// Morra must give Grum Lok a very valuable item in order for him to agree to let him go.
	AI_Output(other,self, " DIA_GorkOrcBoss_FreeDar_01_04 " );	// Should I bring you more magic ore?
	AI_Output(self,other, " DIA_GorkOrcBoss_FreeDar_01_05 " );	// No. Groom Lok doesn't need it yet.
	AI_Output(self,other, " DIA_GorkOrcBoss_FreeDar_01_06 " );	// This time the morra bring Groom Lok a large white mountain troll pelt.
	AI_Output(self,other, " DIA_GorkOrcBoss_FreeDar_01_07 " );	// This beast must be very rare, and the skin must be very valuable!
	AI_Output(self,other, " DIA_GorkOrcBoss_FreeDar_01_08 " );	// Morra bring her to Groom Lok, and he then let go of the man-slave.
	AI_Output(other,self, " DIA_GorkOrcBoss_FreeDar_01_09 " );	// Where does this troll live?
	AI_Output(self,other, " DIA_GorkOrcBoss_FreeDar_01_10 " );	// The big beast lives in a huge cave where there is a high mountain.
	AI_Output(other,self, " DIA_GorkOrcBoss_FreeDar_01_11 " );	// We are already in the mountains. Can you be more specific?
	AI_Output(self,other, " DIA_GorkOrcBoss_FreeDar_01_12 " );	// Groom Lok talk about the mountain, which is not far from the old camp people.
	AI_Output(self,other, " DIA_GorkOrcBoss_FreeDar_01_13 " );	// Man must look for the beast there! Mountain be big, morra find it fast.
	MIS_FreePrice = LOG_Running;
	Log_CreateTopic(TOPIC_FreePrice,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FreePrice,LOG_Running);
	B_LogEntry(TOPIC_FreePrice, " Groom Lok agreed to let Darius go in exchange for a large white mountain troll skin. " );
};

instance DIA_GorkOrcBoss_FreeDarius(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_FreeDarius_condition;
	information = DIA_GorkOrcBoss_FreeDarius_info;
	permanent = FALSE;
	description = " Here is your skin. " ;
};

func int DIA_GorkOrcBoss_FreeDarius_condition()
{
	if((MIS_FreePrice == LOG_Running) && (Npc_HasItems(other,ItAt_WhiteTroll) >= 1))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_FreeDarius_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_GorkOrcBoss_FreeDarius_01_01 " );	// Here's your skin.
	B_GiveInvItems(other,self,ItAt_WhiteTroll,1);
	Npc_RemoveInvItems(self,ItAt_WhiteTroll,1);
	AI_Output(other,self, " DIA_GorkOrcBoss_FreeDarius_01_02 " );	// Will you let Darius go now?
	AI_Output(self,other, " DIA_GorkOrcBoss_FreeDarius_01_03 " );	// Okay... (seriously) Human Slave should be free now!
	AI_Output(self,other, " DIA_GorkOrcBoss_FreeDarius_01_04 " );	// He can go back to his clan.
	AI_Output(other,self, " DIA_GorkOrcBoss_FreeDarius_01_05 " );	// Thank you, chief.
	MIS_FreePrice = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FreePrice,LOG_SUCCESS);
	B_LogEntry(TOPIC_FreePrice, " I brought a white troll skin to Groom Lok and he agreed to let Darius go. Now old friend Lee is free... " );
};

instance DIA_GorkOrcBoss_Perm(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_Perm_condition;
	information = DIA_GorkOrcBoss_Perm_info;
	permanent = TRUE;
	description = " How are you, chief? " ;
};

func int DIA_GorkOrcBoss_Perm_condition()
{
	if(MIS_FreePrice == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_Perm_info()
{
	AI_Output(other,self, " DIA_GorkOrcBoss_Perm_01_01 " );	// How are you, chief?

	if(MIS_ClansWar == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_GorkOrcBoss_Perm_01_02 " );	// All be well, morra!
	}
	else
	{
		AI_Output(self,other, " DIA_GorkOrcBoss_Perm_01_03 " );	// As long as the enemy is alive, everything will be very bad.
	};
};

instance DIA_GorkOrcBoss_NeedPathDarius(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_NeedPathDarius_condition;
	information = DIA_GorkOrcBoss_NeedPathDarius_info;
	permanent = FALSE;
	description = " He'll need a guide. " ;
};

func int DIA_GorkOrcBoss_NeedPathDarius_condition()
{
	if((MIS_FreePrice == LOG_SUCCESS) && (MIS_MissOldFriend == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_NeedPathDarius_info()
{
	AI_Output(other,self, " DIA_GorkOrcBoss_NeedPathDarius_01_01 " );	// It will need a conductor.

	if(MIS_ClansWar == LOG_SUCCESS)
	{
		AI_Output(self,other, " DIA_GorkOrcBoss_NeedPathDarius_01_02 " );	// Morra help Groom Lok defeat his biggest enemy!
		AI_Output(self,other, " DIA_GorkOrcBoss_NeedPathDarius_01_03 " );	// He give the man a few warriors to show them how to descend from the mountains.
		AI_Output(other,self,"DIA_GorkOrcBoss_NeedPathDarius_01_04");	//Спасибо.
		DariusHasPath = TRUE;
		B_LogEntry(TOPIC_MissOldFriend, " Chieftain Groom Lok has agreed to give Darius some warriors to guide him down the mountains. Time to talk to Darius himself. " );
	}
	else
	{
		AI_PlayAni(self,"T_NO");
		AI_Output(self,other, " DIA_GorkOrcBoss_NeedPathDarius_01_05 " );	// Groom Lok won't help morra... (shaking his head)
		AI_Output(self,other, " DIA_GorkOrcBoss_NeedPathDarius_01_06 " );	// He can't now give his warrior to show the man of the road.
		AI_Output(self,other, " DIA_GorkOrcBoss_NeedPathDarius_01_07 " );	// If the enemy attacks, Groom Lok will need a lot of warriors to defend the camp!
		AI_Output(self,other, " DIA_GorkOrcBoss_NeedPathDarius_01_08 " );	// When he defeat his enemy, then Groom Lok give them.
		AI_Output(other,self,"DIA_GorkOrcBoss_NeedPathDarius_01_09");	//Понятно.
		B_LogEntry(TOPIC_MissOldFriend, " Chieftain Groom Lok will only give guides if the hostile Icewind Clan is destroyed. " );
		NeedDeastoyWind = TRUE;
	};
};

instance DIA_GorkOrcBoss_NeedPathDariusDone(C_Info)
{
	npc = GorkOrcBoss_Rest;
	condition = DIA_GorkOrcBoss_NeedPathDariusDone_condition;
	information = DIA_GorkOrcBoss_NeedPathDariusDone_info;
	permanent = FALSE;
	description = " Now will you give guides? " ;
};

func int DIA_GorkOrcBoss_NeedPathDariusDone_condition()
{
	if((NeedDeastoyWind == TRUE) && (MIS_MissOldFriend == LOG_Running) && (MIS_ClansWar == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_GorkOrcBoss_NeedPathDariusDone_info()
{
	AI_Output(other,self, " DIA_GorkOrcBoss_NeedPathDariusDone_01_01 " );	// Now will you give guides?
	AI_Output(self,other, " DIA_GorkOrcBoss_NeedPathDariusDone_01_02 " );	// Morra help Groom Lok defeat his biggest enemy!
	AI_Output(self,other, " DIA_GorkOrcBoss_NeedPathDariusDone_01_03 " );	// He give the man a few warriors to show them how to descend from the mountains.
	AI_Output(other,self,"DIA_GorkOrcBoss_NeedPathDariusDone_01_04");	//Спасибо.
	DariusHasPath = TRUE;
	B_LogEntry(TOPIC_MissOldFriend, " Chieftain Groom Lok has agreed to give Darius some warriors to guide him down the mountains. Time to talk to Darius himself. " );
};
