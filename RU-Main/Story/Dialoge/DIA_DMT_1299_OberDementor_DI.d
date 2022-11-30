
instance DIA_Schwarzmagier_HELLO (C_Info)
{
	npc = DMT_1299_OberDementor_DI;
	nr = 5;
	condition = DIA_Schwarzmagier_HELLO_Condition;
	information = DIA_Schwarzmagier_HELLO_Info;
	important = TRUE;
};


func int DIA_Schwarzmagier_HELLO_Condition()
{
	return TRUE;
};


var int SC_KnowsMadPsi;

func void DIA_Black Mage_HELLO_Info()
{
	AI_Output(self,other, " DIA_Schwarzmagier_HELLO_09_00 " );	// Well, little worm, you really dared to come to the master's gate.
	AI_Output(other,self, " DIA_Schwarzmagier_HELLO_15_01 " );	// Are you the one running the show here?
	AI_Output(self,other, " DIA_Schwarzmagier_HELLO_09_02 " );	// I am the guardian of the Halls of Irdorath! The greatest source of Beliar's power on earth. The divine power of the overlord flows through my hands.
	AI_Output(self,other, " DIA_Schwarzmagier_HELLO_09_03 " );	// One word from me, and you will plunge into eternal madness.
	B_LogEntry(TOPIC_HallenVonIrdorath, " I'm at the last gate. The black mage seems to be the key to it. " );
	Info_ClearChoices(DIA_Schwarzmagier_HELLO);
	Info_AddChoice(DIA_Schwarzmagier_HELLO, " Take me to your master. " ,DIA_Schwarzmagier_HELLO_meister);
	Info_AddChoice(DIA_Schwarzmagier_HELLO, " How many more of your kind will I have to kill? " ,DIA_Schwarzmagier_HELLO_dmt);
	Info_AddChoice(DIA_Schwarzmagier_HELLO, " What's behind that huge portal over there? " ,DIA_Schwarzmagier_HELLO_hinterTor);
	Info_AddChoice(DIA_Schwarzmagier_HELLO, " Who is your boss? " ,DIA_Schwarzmagier_HELLO_wer);

	if(SC_KnowsMadPsi == TRUE)
	{
		Info_AddChoice(DIA_Schwarzmagier_HELLO, " You were a follower of the Sleeper. " ,DIA_Schwarzmagier_HELLO_schlaefer);
	};
};

func void DIA_Black Mage_HELLO_who()
{
	AI_Output(other,self, " DIA_Schwarzmagier_HELLO_wer_15_00 " );	// Who is your master?
	AI_Output(self,other, " DIA_Schwarzmagier_HELLO_wer_09_01 " );	// He's a wanderer between worlds. His divine wisdom enlightens us.
	AI_Output(self,other, " DIA_Schwarzmagier_HELLO_wer_09_02 " );	// He is Beliar's Chosen. He is the one who will free the kingdom from the despicable followers of Innos.
	AI_Output(self,other, " DIA_Schwarzmagier_HELLO_wer_09_03 " );	// He brings death to all who doubt his greatness.
};

func void DIA_blackmagician_HELLO_behindgate()
{
	AI_Output(other,self, " DIA_Schwarzmagier_HELLO_hinterTor_15_00 " );	// What's behind that huge portal over there?
	AI_Output(self,other, " DIA_Schwarzmagier_HELLO_hinterTor_09_01 " );	// (laughs) My lord's quarters will remain out of your reach. I will not give you the opportunity to open these gates.
};

func void DIA_black magician_HELLO_sleeper()
{
	AI_Output(other,self, " DIA_Schwarzmagier_HELLO_schlaefer_15_00 " );	// You were a follower of the Sleeper.
	AI_Output(self,other, " DIA_Schwarzmagier_HELLO_schlaefer_09_01 " );	// That was in the distant past! The Master has opened our eyes. Now no one will stop us.
	TOPIC_END_DEMENTOREN = TRUE;
	B_GivePlayerXP(XP_Ambient);
};

func void DIA_Black Mage_HELLO_dmt()
{
	AI_Output(other,self, " DIA_Schwarzmagier_HELLO_dmt_15_00 " );	// And how many more of your kind will I have to kill?
	AI_Output(self,other, " DIA_Schwarzmagier_HELLO_dmt_09_01 " );	// There are many of us. You have no idea how many are those who are waiting for this freedom to come.
	AI_Output(self,other, " DIA_Schwarzmagier_HELLO_dmt_09_02 " );	// Their cry will reverberate throughout the land as we enter this world.
	AI_Output(self,other, " DIA_Schwarzmagier_HELLO_dmt_09_03 " );	// To free him from the barbarians who call themselves the Fire Guardians.
};

func void DIA_Black Mage_HELLO_master()
{
	//Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DIA_Schwarzmagier_HELLO_meister_09_00 " );	// (threateningly) Enough talk! I will destroy you.
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other, " DIA_Schwarzmagier_HELLO_meister_09_01 " );	// Your gaze will go out, and your spirit will melt into darkness.

	if (Npc_HasItems(other,ItAm_Prot_BlackEye_Mis) ==  FALSE )
	{
		AI_PlayAni(hero,"T_INSANE");
		hero.attribute[ATR_MANA] = 0;
		if(hero.attribute[ATR_HITPOINTS] > 50)
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] / 2;
		};
		SC_ObsessionCounter = 100;
		B_SCIsObsessed(hero);
	};
	Info_ClearChoices(DIA_Schwarzmagier_HELLO);
	Info_AddChoice(DIA_Schwarzmagier_HELLO,Dialog_End,DIA_Schwarzmagier_HELLO_back);
};

func void DIA_Schwarzmagier_HELLO_back()
{
	AI_StopProcessInfos(self);
	Wld_StopEffect("DEMENTOR_FX");
	self.flags = 0;
	Snd_Play("MFX_FEAR_CAST");
	B_Attack(self,other,AR_SuddenEnemyInferno,1);
	self.aivar[AIV_EnemyOverride] = FALSE ;
};
