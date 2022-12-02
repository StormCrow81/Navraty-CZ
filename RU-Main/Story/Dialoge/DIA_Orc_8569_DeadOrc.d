
instance DIA_Orc_8569_DeadOrc_EXIT(C_Info)
{
	npc = Orc_8569_DeadOrc;
	condition = DIA_Orc_8569_DeadOrc_exit_condition;
	information = DIA_Orc_8569_DeadOrc_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int DIA_Orc_8569_DeadOrc_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_8569_DeadOrc_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_8569_DeadOrc_Hello(C_Info)
{
	npc = Orc_8569_DeadOrc;
	condition = DIA_Orc_8569_DeadOrc_Hello_condition;
	information = DIA_Orc_8569_DeadOrc_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_8569_DeadOrc_Hello_condition()
{
	if ((MIS_Stupid == LOG_Running) && (DeadRabOrkovInsertDone ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Orc_8569_DeadOrc_Hello_info()
{
	B_GivePlayerXP(1500);
	AI_ReadyMeleeWeapon(other);
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_01 " );	// Yes. And who do we have here?
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_02 " );	// Arghhh, human...(frightened) Are you coming to kill me?!
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_03 " );	// Maybe. At least that's what I always do with walking corpses.
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_04 " );	// Please don't do this. Don't hit me, don't kill me!
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_05 " );	// Nog-Drag do whatever the person tells him.
	AI_RemoveWeapon(other);
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_06 " );	// Okay, calm down! Why should I kill you when you're already dead.
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_07 " );	// Nog-Drag doesn't want to die again! If a person spares him, then he will do everything that the person orders him to do.
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_08 " );	// And I see that you are very frightened by my appearance. So your name is Nog-Drag?
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_09 " );	// Yes, man, my brothers used to call me that.
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_10 " );	// And apparently, you did not belong to the circle of warriors, since you are shaking so much for your life.
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_11 " );	// Man be right! Nog-Drag will never be a warrior.
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_12 " );	// So you were just a slave. I guessed?
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_13 " );	// Man know everything! Nog-Drag really be a slave and build a big temple here, as ordered by his master.
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_14 " );	// So you've been here since the construction of the Temple?
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_15 " );	// Nog-Drag has been around for a long time. See how the orcs make the temple and how the evil demon kills them all. See and remember a lot!
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_16 " );	// Then maybe you know one very important thing that interests me.
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_17 " );	// Nog-Drag tell the man everything if he doesn't kill him!
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_18 " );	// Here you are doing the same thing... Good! Answer my question and I will spare your life.
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_19 " );	// Then the person to ask, Nog-Drag all talk.
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_20 " );	// Do you know a shaman named Hash-Gor?
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_21 " );	// Hash-Gor?! (terribly frightened) But why would a person ask about him?!
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_22 " );	// This doesn't concern you! Just answer my question.
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_23 " );	// Yes, Nog-Drag know the great shaman of Khash-Gor. He will be the most important person here when the orcs build the Temple.
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_24 " );	// Why do you call him great?
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_25 " );	// Because Hash-Gor knows magic that other shamans don't know!
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_26 " );	// Because of this, all orc brothers are very afraid of Hash-Gor!
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_27 " );	// If the great shaman is angry, then he will kill the orcs, eat their hearts and make them dead, like Nog-Drag.
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_28 " );	// Clear. Do you happen to know where I can find Khash-Gor now?
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_29 " );	// ...it's been a very long time since Nog-Drag saw the great shaman for the last time...
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_30 " );	// Nog-Drag believe that Hash-Gor has long been dead himself!
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_31 " );	// So perhaps a human should look for it where orcs usually bury their dead brothers.
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_32 " );	// You mean the orc graveyard?
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_33 " );	// Nog-Drag to think that the person is right to call this place.
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_34 " );	// But he be very careful there! Khash Gor is a very powerful and evil shaman.
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_35 " );	// If a person accidentally disturbs his spirit, then he himself can easily become dead.
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_36 " );	// Okay, I'll take that into account.
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_37 " );	// Man, is there anything else to ask Nog-Drag?
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Info_18_38 " );	// No, I don't need anything else from you.
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Info_18_39 " );	// So, now the man will not touch Nog-Drag and will not kill him?!
	B_LogEntry(TOPIC_NagDumgar, " I met an undead orc named Nog-Drag. He was once one of the slaves who took part in the construction of the Temple of the Sleeper. After making me promise not to kill him, Nog-Drag told me about the great shaman Khash- Woe. Most likely, he is already dead, and in this case, you should look for him in the orc cemetery. " );
	Info_ClearChoices(DIA_Orc_8569_DeadOrc_Hello);
	Info_AddChoice(DIA_Orc_8569_DeadOrc_Hello, " No, I changed my mind. " ,DIA_Orc_8569_DeadOrc_Hello_No);
	Info_AddChoice(DIA_Orc_8569_DeadOrc_Hello, " I won't touch you. " ,DIA_Orc_8569_DeadOrc_Hello_Yes);
};


func void DIA_Orc_8569_DeadOrc_Hello_Yes()
{
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Yes_18_01 " );	// I won't hurt you, like I promised.
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Yes_18_02 " );	// Arghhh... Nog-Drag thanking the man for keeping his promise.
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Yes_18_03 " );	// For this, he will give him one thing that will help a person if he goes to look for Hash-Gor.
	B_GiveInvItems(self,other,ItMi_DeadOrcItem,1);
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Yes_18_04 " );	// Thank you, Nog-Drag. Hope it really comes in handy for me.
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_Yes_18_05 " );	// Now goodbye, orc - I've got to go.
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_Yes_18_06 " );	// Have a nice trip, man...
	DeadOrcLeavePeace = TRUE;
	AI_StopProcessInfos(self);
};

func void DIA_Orc_8569_DeadOrc_Hello_No()
{
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_No_18_01 " );	// No, I changed my mind.
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_No_18_02 " );	// I don't think it would be right to leave you here to roam the Temple.
	AI_Output(other,self, " DIA_Orc_8569_DeadOrc_Hello_No_18_03 " );	// So now I'm going to kill you! Excuse me.
	AI_Output(self,other, " DIA_Orc_8569_DeadOrc_Hello_No_18_04 " );	// Arghhh! Man trick Nog-Drag!
	AI_StopProcessInfos(self);
	self.flags = FALSE;
	self.aivar[AIV_EnemyOverride] = FALSE ;
};
