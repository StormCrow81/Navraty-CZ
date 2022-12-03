

instance DIA_GOMEZ_EXIT(C_Info)
{
	npc = none_104_gomez;
	nr = 999;
	condition = dia_gomez_exit_condition;
	information = dia_gomez_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dia_gomez_exit_condition()
{
	return TRUE;
};

func void dia_gomez_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_GOMEZ_HELLO(C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_hello_condition;
	information = dia_gomez_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_gomez_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_gomez_hello_info()
{
	AI_Output(self,other, " DIA_Gomez_Hello_01_00 " );	// So our paths crossed again, hero. Who would have thought.
	AI_Output(self,other, " DIA_Gomez_Hello_01_01 " );	// Thank you for delivering me from this rotten body in which my soul languished.
	AI_Output(other,self,"DIA_Gomez_Hello_01_02");	//Гомез?! Ты же...
	AI_Output(self,other, " DIA_Gomez_Hello_01_03 " );	// Dead? You probably wanted to say that.
	AI_Output(self,other, " DIA_Gomez_Hello_01_04 " );	// I can please you, you are not far from the truth - I really am dead.
	AI_Output(other,self, " DIA_Gomez_Hello_01_05 " );	// You deserve it, you bastard!
	AI_Output(self,other, " DIA_Gomez_Hello_01_06 " );	// You're right, in my time I did just terrible things.
	AI_Output(other,self, " DIA_Gomez_Hello_01_07 " );	// Terrible?! That's too weak to say!
	AI_Output(other,self, " DIA_Gomez_Hello_01_08 " );	// What is worth only that massacre of innocent Firebenders!
	AI_Output(self,other, " DIA_Gomez_Hello_01_09 " );	// You can be sure that for all this blood, the gods have already made me pay a high price.
	AI_Output(self,other, " DIA_Gomez_Hello_01_10 " );	// And now I have a whole eternity to think and repent of everything I have done...
};


instance DIA_GOMEZ_HAST (C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_hast_condition;
	information = dia_gomez_hast_info;
	permanent = FALSE;
	description = " So you're cursed? " ;
};


func int dia_gomez_hast_condition()
{
	if(Npc_KnowsInfo(hero,dia_gomez_hello))
	{
		return TRUE;
	};
};

func void day_gomez_hast_info()
{
	AI_Output(other,self, " DIA_Gomez_Hast_01_00 " );	// So, are you cursed?
	AI_Output(self,other, " DIA_Gomez_Hast_01_03 " );	// Yes, the dead are finally beginning to understand the price of power and gold.
	AI_Output(self,other, " DIA_Gomez_Hast_01_05 " );	// I was sure that I can do EVERYTHING. And it really was just that!
	AI_Output(self,other, " DIA_Gomez_Hast_01_06 " );	// In my hands was the power that the king himself would envy.
	AI_Output(self,other, " DIA_Gomez_Hast_01_07 " );	// But only now I realized that the most valuable thing with us is the soul.
	AI_Output(self,other, " DIA_Gomez_Hast_01_08 " );	// The soul, which now has no rest.
};


var int gomezpermonetime;

instance DAY_GOMEZ_CANDO (C_Info)
{
	npc = none_104_gomez;
	nr = 5;
	condition = dia_gomez_cando_condition;
	information = dia_gomez_cando_info;
	permanent = TRUE;
	description = " What are you going to do now? " ;
};


func int day_gomez_cando_condition()
{
	if(Npc_KnowsInfo(hero,dia_gomez_hast) && (MIS_RESCUEGOMEZ != LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void dia_gomez_cando_info()
{
	AI_Output(other,self, " DIA_Gomez_CanDo_01_00 " );	// What are you going to do now?
	AI_Output(self,other, " DIA_Gomez_CanDo_01_01 " );	// I can't get out of here.
	AI_Output(self,other, " DIA_Gomez_CanDo_01_02 " );	// The sea of ​​blood I once shed holds me firmly in this place.
	AI_Output(self,other, " DIA_Gomez_CanDo_01_03 " );	// I never thought I'd become the curse of my own castle.
	if(GOMEZPERMONETIME == FALSE)
	{
		AI_Output(other,self, " DIA_Gomez_CanDo_01_04 " );	// So you're stuck here for a long time.
		AI_Output(self,other, " DIA_Gomez_CanDo_01_05 " );	// Yes, for all eternity.
		AI_Output(self,other, " DIA_Gomez_CanDo_01_06 " );	// But if you would help me atone for my guilt and thereby calm my sinful soul...
		AI_Output(self,other, " DIA_Gomez_CanDo_01_07 " );	// Then I would be able to leave this place and find the long-awaited peace.
		AI_Output(other,self, " DIA_Gomez_CanDo_01_08 " );	// You definitely can't count on my help!
		GOMEZPERMONETIME = TRUE;
	};
};


instance DIA_GOMEZ_MRAMORSTATUE (C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_mramorstatue_condition;
	information = dia_gomez_mramorstatue_info;
	permanent = FALSE;
	description = " What do you know about marble figurines? " ;
};


func int dia_gomez_mramorstatue_condition()
{
	if(Npc_KnowsInfo(hero,dia_gomez_hast) && (MIS_RARETHINGS == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_gomez_mramorstatue_info()
{
	AI_Output(other,self, " DIA_Gomez_MramorStatue_01_00 " );	// What do you know about marble figurines?
	AI_Output(self,other, " DIA_Gomez_MramorStatue_01_01 " );	// What are you talking about?
	AI_Output(other,self, " DIA_Gomez_MramorStatue_01_02 " );	// I'm talking about the three statuettes of Innos, made of black Nordmar marble.
	AI_Output(other,self, " DIA_Gomez_MramorStatue_01_03 " );	// One of the ore barons demanded them from King Rhobar as payment for a shipment of magical ore.
	AI_Output(other,self, " DIA_Gomez_MramorStatue_01_04 " );	// Do you know where they are?
	AI_Output(self,other, " DIA_Gomez_MramorStatue_01_05 " );	// Of course. I was also an ore baron, and I know where my predecessors kept their treasures.
	AI_Output(self,other, " DIA_Gomez_MramorStatue_01_06 " );	// But you have to do me one small favor.
	AI_Output(self,other, " DIA_Gomez_MramorStatue_01_08 " );	// Help me be free! Calm my soul, and I will share with you all that I know myself.
	AI_Output(self,other, " DIA_Gomez_MramorStatue_01_09 " );	// My suffering, this pain - they are just awful!
	AI_Output(self,other, " DIA_Gomez_MramorStatue_01_10 " );	// And every day my torment becomes more and more unbearable.
	AI_Output(self,other, " DIA_Gomez_MramorStatue_01_11 " );	// Especially when a great evil has come to this valley.
	AI_Output(other,self, " DIA_Gomez_MramorStatue_01_12 " );	// How do you know this? Have you ever left the castle?
	AI_Output(self,other, " DIA_Gomez_MramorStatue_01_13 " );	// I can feel it!
	AI_Output(self,other, " DIA_Gomez_MramorStatue_01_14 " );	// The pernicious bonds of this evil spread throughout the area, penetrating into every crack and into every soul. And I am no exception.
	AI_Output(other,self, " DIA_Gomez_MramorStatue_01_15 " );	// Hmmm... What if I don't help you?
	AI_Output(self,other, " DIA_Gomez_MramorStatue_01_16 " );	// Then you'll never find what you're looking for.
	AI_Output(other,self, " DIA_Gomez_MramorStatue_01_17 " );	// So I don't have a choice.
	B_LogEntry(TOPIC_RARETHINGS,"In the castle of the Old Camp, I met with an old acquaintance - the ore baron Gomez. More precisely, with his damned soul, convicted in the form of a ghost. Quite an unexpected meeting... Taking the opportunity, I asked Gomez about those precious figurines, which Luthero so desperately needs. Gomez replied that he knew where these marble figurines were, and agreed to show me the place. But on one condition - I will have to help him remove the curse from his soul. It seems that in order to get the things I need, I must I will give up my principles a little and help Gomez remove his curse.");
};


instance DIA_GOMEZ_MRAMORSTATUEHELP(C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_mramorstatuehelp_condition;
	information = dia_gomez_mramorstatuehelp_info;
	permanent = FALSE;
	description = " Okay, I'll help you. " ;
};


func int dia_gomez_mramorstatuehelp_condition()
{
	if ( Npc_KnowsInfo ( hero , dia_gomez_motherstatue ) && ( MY_RARETHINGS  == LOG_Running ))
	{
		return TRUE;
	};
};

func void dia_gomez_mramorstatuehelp_info()
{
	AI_Output(other,self, " DIA_Gomez_MramorStatueHelp_01_00 " );	// Okay, I'll help you. What should I do?
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_01 " );	// First you need to visit the altars of all three great deities and pray before them for my soul.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_02 " );	// Here in the valley you can easily find altars dedicated to Innos and Beliar.
	AI_Output(other,self, " DIA_Gomez_MramorStatueHelp_01_03 " );	// What about praying to Adanos?
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_04 " );	// Waterbenders will surely be able to help you with this.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_05 " );	// Blessing one of them will suffice.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_11 " );	// After that, you should go to the Old Mine.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_12 " );	// In it, you will have to find at least ten restless souls of those people who used to work there for me.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_14 " );	// Make sure they finally find the peace they long for.
	AI_Output(other,self, " DIA_Gomez_MramorStatueHelp_01_15 " );	// How can I do this?
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_16 " );	// Just kill them.
	AI_Output(other,self, " DIA_Gomez_MramorStatueHelp_01_17 " );	// Kill? Hmmm... And I see that your methods of solving problems are not very diverse.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_18 " );	// Believe me, this is the only way to free these souls from the curse that has been placed on them.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_20 " );	// And remember...
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_21 " );	// ...before you kill another soul, you will have to ask her forgiveness for me.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_22 " );	// And only after receiving it - draw your sword!
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_23 " );	// Otherwise, all your actions will be a waste of time.
	AI_Output(other,self, " DIA_Gomez_MramorStatueHelp_01_24 " );	// And why did you need their forgiveness?
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_25 " );	// Because I cursed these people myself. And it is my fault that their souls still cannot find peace in this world.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_27 " );	// When I learned that the Old Mine had collapsed, I flew into an uncontrollable rage and was just pissed off about what happened!
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_28 " );	// I felt like everyone around me had betrayed me.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_29 " );	// In my hopeless attempts to somehow correct the current situation, I did not find anything better than to curse all those who allowed the collapse of this mine.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_30 " );	// The mine that held all my power and all my wealth.
	AI_Output(other,self, " DIA_Gomez_MramorStatueHelp_01_35 " );	// Yes, it's not easy.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_36 " );	// That's not all.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_37 " );	// After you visit the Old Mine, you will need to return here to the castle.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_39 " );	// As you know, my gravest crime is the murder of Corristo and his Firebenders.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_40 " );	// Therefore, you will still need to perform the ritual of summoning the souls of dead mages.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_43 " );	// On the top floor in the former cell of the Fire Mages, a magical pentagram has been preserved.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_44 " );	// Use it. To do this, stand in the middle of the magic circle and say the words - FAR ACTUS BEK NOR KAR!
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_46 " );	// These words are part of an ancient magic spell that will help you summon the souls of the dead to this world...
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_47 " );	// ...and, of course, as you understand, only for a while.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_49 " );	// Lest you forget them, I will give you a scroll where they will be written.
	B_GiveInvItems(self,other,itwr_gomezmagicwords,1);
	AI_Output(other,self, " DIA_Gomez_MramorStatueHelp_01_55 " );	// And what are my next steps?
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_56 " );	// Speak to each of them, and may each grant me their forgiveness. This will be enough!
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_58 " );	// That's all. So don't waste your time and hit the road.
	AI_Output(self,other, " DIA_Gomez_MramorStatueHelp_01_59 " );	// I'll be waiting for you here, and I hope you bring me good news.
	MIS_RESCUEGOMEZ = LOG_Running;
	RESCUEGOMEZSTEPONE = TRUE;
	Log_CreateTopic(TOPIC_RESCUEGOMEZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESCUEGOMEZ,LOG_Running);
	B_LogEntry( TOPIC_RESCUEGOMEZ , " In order to remove the curse from Gomez's soul, I need to do three things. " );
	Log_AddEntry( TOPIC_RESCUEGOMEZ , " First you need to pray for the soul of the ore baron to all three gods - Innos, Beliar and Adanos. For prayers to the first two deities, their altars are suitable, which I can easily find in the Valley of Mines. As for the blessing of Adanos, then in Water magicians can help me with this. However, remembering the horror that Gomez sowed during his lifetime, many of them will probably refuse my request. I will have to look for a magician who did not know Gomez during his lifetime. " );
	Log_AddEntry( TOPIC_RESCUEGOMEZ , " After I get the consent of all three deities, I will have to go to the Old Mine. There I have to find at least ten restless souls of those people who once worked for Gomez, and bring them a long-awaited rest or , in other words, kill them all. However, before death, the souls must give forgiveness to Gomez - this is a very important point. " );
	Log_AddEntry( TOPIC_RESCUEGOMEZ , " And last but not least, I need to perform the ritual of calling the souls of the Fire Mages killed on the orders of Gomez in the Old Camp. To do this, he gave me a scroll with the words of an ancient spell. The ritual must be performed in the former cell of magicians inside the castle, near the pentagram on the top floor. The souls of the mages must also agree to forgive Gomez's atrocities. " );
	Log_AddEntry( TOPIC_RESCUEGOMEZ , " After I complete all these tasks, I need to return to Gomez. " );
};


instance DIA_GOMEZ_ISFREE(C_Info)
{
	npc = none_104_gomez;
	nr = 1;
	condition = dia_gomez_isfree_condition;
	information = dia_gomez_isfree_info;
	permanent = FALSE;
	description = " You are free! " ;
};


func int dia_gomez_isfree_condition()
{
	if((MIS_RARETHINGS == LOG_Running) && (GOMEZISFREE == TRUE) && (MIS_RESCUEGOMEZ == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_gomez_isfree_info()
{
	B_GivePlayerXP(400);
	GOMEZISFREENOW = TRUE;
	MIS_RESCUEGOMEZ = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RESCUEGOMEZ,LOG_SUCCESS);
	Log_AddEntry( TOPIC_RESCUEGOMEZ , " Gomez's soul has left this world. " );
	AI_Output(other,self, " DIA_Gomez_IsFree_01_00 " );	// You are free! Your soul is forgiven.
	AI_Output(self,other, " DIA_Gomez_IsFree_01_01 " );	// Finally. I'm feeling it! My suffering, my torment - they have come to an end ...
	AI_Output(self,other, " DIA_Gomez_IsFree_01_02 " );	// This cursed place no longer holds me back. I'm really free!
	AI_Output(other,self, " DIA_Gomez_IsFree_01_04 " );	// What about those precious Nordmar marble figurines? You promised to tell me where to look for them.
	AI_Output(self,other, " DIA_Gomez_IsFree_01_05 " );	// Trust me, you won't have to look for them - they're in that chest behind me.
	AI_Output(self,other, " DIA_Gomez_IsFree_01_06 " );	// I'll give you the key to open this chest.
	AI_Output(self,other, " DIA_Gomez_IsFree_01_07 " );	// Here, take it.
	B_GiveInvItems(self,other,itkey_gomeztreasure,1);
	AI_Output(self,other, " DIA_Gomez_IsFree_01_09 " );	// And now I have to go... Farewell!
	B_LogEntry( TOPIC_RARETHINGS , " After I helped Gomez remove the curse from his soul, he gave me the key to the chest, which is located here in the old tower. All three Nordmar figurines are stored in this chest. " );
	Info_ClearChoices(dia_gomez_isfree);
	Info_AddChoice(dia_gomez_isfree, " Goodbye Ore Baron... " ,dia_gomez_isfree_ok);
};

func void dia_gomez_isfree_ok()
{
	AI_StopProcessInfos(self);
	GomezSoulAway = TRUE;
};
