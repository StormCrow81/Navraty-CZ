

instances of DIA_Pedro_DI_EXIT (C_Info)
{
	npc = NOV_600_Pedro_DI;
	nr = 999;
	condition = DIA_Pedro_DI_EXIT_Condition;
	information = DIA_Pedro_DI_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Pedro_DI_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Pedro_DI_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


DIA_Pedro_DI_YOU (C_Info) instances
{
	npc = NOV_600_Pedro_DI;
	nr = 2;
	condition = DIA_Pedro_DI_YOU_Condition;
	information = DIA_Pedro_DI_YOU_Info;
	description = " Traitor! " ;
};


func int DIA_Pedro_DI_YOU_Condition()
{
	return TRUE;
};

func void DIA_Pedro_DI_YOU_Info()
{
	AI_Output(other,self, " DIA_Pedro_DI_YOU_15_00 " );	// Traitor! Finally I found you.

	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self, " DIA_Pedro_DI_YOU_15_01 " );	// You may not expect me to spare you, because I am a paladin.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self, " DIA_Pedro_DI_YOU_15_02 " );	// Many of us mercenaries have sold our souls to Beliar, and I often feel guilty when I kill them. But for you, you vile pig, I will make an exception!
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self, " DIA_Pedro_DI_YOU_15_03 " );	// Of all the soulless bastards I've ever met in my life, you're the worst. You are a disgrace to our order.
	};
	if(hero.guild == GIL_KDW)
	{
		AI_Output(other,self, " DIA_Pedro_DI_YOU_15_0A " );	// How could you do that! Even I, the servant of Adanos, cannot believe this!
	};
	if(hero.guild == GIL_KDM)
	{
		AI_Output(other,self, " DIA_Pedro_DI_YOU_15_0B " );	// Even though I serve the Dark God, no one honors betrayal!
	};
	if((hero.guild == GIL_TPL) || (hero.guild == GIL_GUR))
	{
		AI_Output(other,self, " DIA_Pedro_DI_YOU_15_0C " );	// Of course, the Brotherhood doesn't care about this showdown between the gods. But for your deed you deserve only one thing!
	};
	AI_Output(other,self, " DIA_Pedro_DI_YOU_15_04 " );	// I should just kill you.
	AI_Output(self,other, " DIA_Pedro_DI_YOU_09_05 " );	// Wait. Please. They bewitched me. I would never willingly betray the monastery of Innos.
	AI_Output(self,other, " DIA_Pedro_DI_YOU_09_06 " );	// You don't even know what I've been through in recent days. They put that voice in my head. I couldn't resist him.
	AI_Output(self,other, " DIA_Pedro_DI_YOU_09_07 " );	// The orc warchief tortured me for days on end. He constantly beat me. I'm sorry. It's not my fault. You must believe me.
	Info_ClearChoices(DIA_Pedro_DI_YOU);
	Info_AddChoice(DIA_Pedro_DI_YOU, " Tell me what you know. " ,DIA_Pedro_DI_YOU_verschon);
	Info_AddChoice(DIA_Pedro_DI_YOU, " I don't want to hear anything. I'll kill you. " ,DIA_Pedro_DI_YOU_tot);
	Info_AddChoice(DIA_Pedro_DI_YOU, " Give me one reason why I should believe you. " ,DIA_Pedro_DI_YOU_grund);

	if(MIS_Gorax_KillPedro == LOG_Running)
	{
		Info_AddChoice(DIA_Pedro_DI_YOU, " Serpentes gave me the order to kill you. " ,DIA_Pedro_DI_YOU_Serpentes);
	};
};

func void DIA_Pedro_DI_YOU_grund()
{
	AI_Output(other,self, " DIA_Pedro_DI_YOU_grund_15_00 " );	// Give me at least one reason why I should believe you.
	AI_Output(self,other, " DIA_Pedro_DI_YOU_grund_09_01 " );	// (pleadingly) Leave me alive. I can tell you something that will help you get out of here. You must listen to me.
};


var int PedroDI_Flee;

func void DIA_Pedro_DI_YOU_tot()
{
	AI_Output(other,self, " DIA_Pedro_DI_YOU_tot_15_00 " );	// And I don't want to hear anything. I'll kill you.
	AI_Output(self,other, " DIA_Pedro_DI_YOU_tot_09_01 " );	// I beg all the gods...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	B_Attack(self,other,AR_NONE,1);
	PedroDI_Flee = LOG_Running;
};

func void DIA_Pedro_DI_YOU_Serpentes()
{
	AI_Output(other,self, " DIA_Pedro_DI_YOU_Serpentes_15_00 " );	// Serpentes gave me a commission to kill you, as a rule, I carry out my orders.
	AI_Output(self,other, " DIA_Pedro_DI_YOU_Serpentes_09_01 " );	// (mournfully) Please, no. You won't do it. I can still be of use to you. You know it.
};

func void DIA_Pedro_DI_YOU_verschon()
{
	AI_Output(other,self, " DIA_Pedro_DI_YOU_verschon_15_00 " );	// Tell me what you know.
	AI_Output(self,other, " DIA_Pedro_DI_YOU_verschon_09_01 " );	// (relieved) Yes, of course. I'll tell you everything you want to know. But on one condition. You have to take me off this damned island, do you hear?
	Info_ClearChoices(DIA_Pedro_DI_YOU);
	Info_AddChoice(DIA_Pedro_DI_YOU, " I don't want to hear anything. I'll kill you. " ,DIA_Pedro_DI_YOU_tot);
	Info_AddChoice(DIA_Pedro_DI_YOU, " Okay. Follow me, I'll take you to the ship. " ,DIA_Pedro_DI_YOU_FollowShip);
};


var int MY_PETER_THE_FollowShip;

func void DIA_Pedro_DI_YOU_FollowShip()
{
	AI_Output(other,self, " DIA_Pedro_DI_YOU_FollowShip_15_00 " );	// Good. Follow me, I'll take you to the ship.
	AI_Output(self,other, " DIA_Pedro_DI_YOU_FollowShip_09_01 " );	// Thank you. You won't regret it.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowShip");
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	MIS_Peter_NOT_FollowShip = LOG_Running;

	if(MIS_Gorax_KillPedro == LOG_Running)
	{
		B_LogEntry(Topic_Gorax_KillPedro, " I decided to keep Pedro alive. I don't know if I did the right thing?! " );
	};
};


instance DIA_Pedro_DI_ArrivedAtShip (C_Info)
{
	npc = NOV_600_Pedro_DI;
	nr = 4;
	condition = DIA_Pedro_DI_ArrivedAtShip_Condition;
	information = DIA_Pedro_DI_ArrivedAtShip_Info;
	description = "Пришли!";
};


func int DIA_Pedro_DI_ArrivedAtShip_Condition()
{
	if((Npc_GetDistToWP(self,"SHIP") < 6000) && (MIS_Pedro_DI_FollowShip == LOG_Running))
	{
		return TRUE;
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Info()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_00");	//Пришли!
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_09_01 " );	// You have an amazing ship. You are a real general.
	AI_Output(other,self, " DIA_Pedro_DI_ArrivedAtShip_15_02 " );	// Stop talking. Tell me what should I know?
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_09_03 " );	// Yes, of course. Where do I begin?
	Info_ClearChoices(DIA_Pedro_DI_ArrivedAtShip);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip, " I've heard enough. " ,DIA_Pedro_DI_ArrivedAtShip_Back);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip, " How do I get inside this island? " ,DIA_Pedro_DI_ArrivedAtShip_Innere);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip, " What other monsters inhabit this island? " ,DIA_Pedro_DI_ArrivedAtShip_Monster);
	Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip, " What about that orc colonel? " ,DIA_Pedro_DI_ArrivedAtShip_OrkOberst);
};

func void DIA_Pedro_DI_ArrivedAtShip_OrkOberst()
{
	AI_Output(other,self, " DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00 " );	// What about that orc colonel?
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01 " );	// He took away from me the last ray of hope to ever see my native land.
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02 " );	// Since I arrived here, he's been interrogating me about the strategic placement of paladins on Khorinis.
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03 " );	// Of course, I couldn't tell him much. How the hell do I know about this? I am a follower of fire.
	if (Npc_IsDead(OrkElite_AntiPaladinOrkOberst_DI))
	{
		Info_AddChoice(DIA_Pedro_DI_ArrivedAtShip, " Orc chief is dead. " ,DIA_Pedro_DI_ArrivedAtShip_OberstTot);
	};
};

func void DIA_Pedro_DI_ArrivedAtShip_Monster()
{
	AI_Output(other,self, " DIA_Pedro_DI_ArrivedAtShip_Monster_15_00 " );	// What other monsters inhabit this island?
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_Monster_09_01 " );	// During the day, you can often see lizard people walking towards the shore. They usually carry very large eggs with them.
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_Monster_09_02 " );	// I couldn't see well from my camera, but I think they're getting ready to leave the island.
};

func void DIA_Pedro_DI_ArrivedAtShip_Innere()
{
	AI_Output(other,self, " DIA_Pedro_DI_ArrivedAtShip_Innere_15_00 " );	// How do I get inside this island?
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_Innere_09_01 " );	// There is a secret passage in the orc colonel's throne room.
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_Innere_09_02 " );	// I was dragged through it every time they wanted to interrogate. I have seen how it works.
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_Innere_09_03 " );	// One of the shamans started the mechanism by turning the torches hanging on the walls of this hall.
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_Innere_09_04 " );	// Mmm. It seems to me that he first turned the left torch, and then the right, but I do not remember exactly.
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_Innere_09_05 " );	// And then suddenly a secret passage opened up, leading deep into the mountains.
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_Innere_09_06 " );	// Where this passage ends, I don't know.
};

func void DIA_Pedro_DI_ArrivedAtShip_OberstTot()
{
	AI_Output(other,self, " DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00 " );	// The orc colonel is dead.
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01 " );	// Dead? Thanks to Innos. I will never forget his terrible face.
};

func void DIA_Pedro_DI_ArrivedAtShip_Back()
{
	AI_Output(other,self, " DIA_Pedro_DI_ArrivedAtShip_Back_15_00 " );	// I've heard enough. Find yourself a place on my ship. I still need to do something.
	AI_Output(self,other, " DIA_Pedro_DI_ArrivedAtShip_Back_09_01 " );	// May the power of Innos protect you. I will pray for you.

	if((Vatras_IsOnBoard != LOG_SUCCESS) && (MIS_Gorax_KillPedro == LOG_Running))
	{
		B_GivePlayerXP(100);
		MIS_Gorax_KillPedro = LOG_SUCCESS;
		Log_SetTopicStatus(Topic_Gorax_KillPedro,LOG_SUCCESS);
		B_LogEntry(Topic_Gorax_KillPedro, " Pedro will remain on our ship for now. I don't think I have the right to decide his fate on my own. Let the Firebenders judge him. " );

		if(MIS_TraitorPedro == LOG_Running)
		{
			MIS_TraitorPedro = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_TraitorPedro,LOG_SUCCESS);
		};
	};

	PEDROWITHUS = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
};


instances of DIA_Pedro_DI_PERM (C_Info)
{
	npc = NOV_600_Pedro_DI;
	nr = 5;
	condition = DIA_Pedro_DI_PERM_Condition;
	information = DIA_Pedro_DI_PERM_Info;
	permanent = TRUE;
	description = "Устал?";
};


var int PedroDI_TalkNomore;

func int DIA_Pedro_DI_PERM_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Peter_DI_YOU ) && ( DIA_Peter_DI_TalkNumber ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Pedro_DI_PERM_Info()
{
	AI_Output(other,self,"DIA_Pedro_DI_PERM_15_00");	//Устал?
	if(Npc_GetDistToWP(self,"SHIP_DECK_05") < 1000)
	{
		if(PedroDI_Flee == LOG_Running)
		{
			AI_Output(other,self, " DIA_Pedro_DI_PERM_15_01 " );	// Do you want me to bring you a pillow?
			AI_Output(self,other, " DIA_Pedro_DI_PERM_09_02 " );	// Have mercy on me, please. I will sit here very quietly and not make a sound.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_03");	//М-м-м.
			B_GivePlayerXP(XP_Ambient);
			PedroDI_Flee = LOG_SUCCESS;
		}
		else if(UndeadDragonIsDead == TRUE)
		{
			AI_Output(self,other, " DIA_Pedro_DI_PERM_09_04 " );	// I'm completely exhausted.
			AI_Output(other,self, " DIA_Pedro_DI_PERM_15_05 " );	// Get some sleep. Soon we will go out to sea again.
			AI_Output(self,other, " DIA_Pedro_DI_PERM_09_06 " );	// Thank you. I'm about to fall. Goodnight.
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"SleepShip");
			self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
			PedroDI_TalkNomore = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_Pedro_DI_PERM_09_07 " );	// Everything is fine. Thank you.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Pedro_DI_PERM_09_08 " );	// Please don't kill me!
		AI_StopProcessInfos(self);
	};
};

