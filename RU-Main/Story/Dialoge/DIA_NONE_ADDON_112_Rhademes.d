

instance DIA_Addon_Rhademes_EXIT(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 999;
	condition = DIA_Addon_Rhademes_EXIT_Condition;
	information = DIA_Addon_Rhademes_EXIT_Info;
	permanent = TRUE;
	description = " I'll find my way there myself! " ;
};


func int DIA_Addon_Rhademes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Rhademes_EXIT_Info()
{
	AI_Output(other,self, " DIA_Addon_Rhademes_EXIT_15_00 " );	// I'll find my own way!
	AI_Output(self,other, " DIA_Addon_Rhademes_EXIT_03_01 " );	// As you wish...
	AI_StopProcessInfos(self);
};


var int Rhademes_Understood;

instance DIA_Addon_Rhademes_First(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 1;
	condition = DIA_Addon_Rhademes_First_Condition;
	information = DIA_Addon_Rhademes_First_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Rhademes_First_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Rhademes_Understood == FALSE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Rhademes_First_Info()
{
	if(PLAYER_TALENT_FOREIGNLANGUAGE[LANGUAGE_1] == TRUE)
	{
		AI_Output(self,other, " DIA_Addon_Rhademes_First_03_00 " );	// My spirit has been trapped here for an eternity.
		AI_Output(self,other, " DIA_Addon_Rhademes_First_03_01 " );	// Now I'm finally free. The sword has a new owner!
		AI_Output(self,other, " DIA_Addon_Rhademes_First_03_02 " );	// Passage to the last hall is open.
		AI_Output(other,self, " DIA_Addon_Rhademes_First_15_03 " );	// But the gates are closed!
		AI_Output(self,other, " DIA_Addon_Rhademes_First_03_04 " );	// This gate does not lead to the last hall.
		AI_Output(self,other, " DIA_Addon_Rhademes_First_03_05 " );	// They lead to a small lobby.
		AI_Output(self,other, " DIA_Addon_Rhademes_First_03_06 " );	// The owner of the sword... closed them behind him.
		Rhademes_Understood = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Rhademes_First_03_07 " );	// Ghanima en kandra Adanos?
		B_Say(other,self,"$CANTUNDERSTANDTHIS");
		AI_Output(self,other,"DIA_Addon_Rhademes_First_03_08");	//Бенгла антани!
		AI_StopProcessInfos(self);
	};
};


instance DIA_Addon_Rhademes_Pforte (C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 2;
	condition = DIA_Addon_Rhademes_Pforte_Condition;
	information = DIA_Addon_Rhademes_Pforte_Info;
	permanent = FALSE;
	description = " How to open the gate? " ;
};


func int DIA_Addon_Rhademes_Pforte_Condition()
{
	return TRUE;
};

func void DIA_Addon_Rhademes_Pforte_Info()
{
	AI_Output(other,self, " DIA_Addon_Rhademes_Pforte_15_00 " );	// How to open the gate?
	AI_Output(self,other, " DIA_Addon_Rhademes_Pforte_03_01 " );	// Pull... one of the levers.
	AI_Output(other,self,"DIA_Addon_Rhademes_Pforte_15_02");	//Любой?
	AI_Output(self,other, " DIA_Addon_Rhademes_Pforte_03_03 " );	// Yes. Any of them opens the gate.
};


instance DIA_Addon_Rhademes_Hebel(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 3;
	condition = DIA_Addon_Rhademes_Hebel_Condition;
	information = DIA_Addon_Rhademes_Hebel_Info;
	permanent = FALSE;
	description = " But not everyone activates the trap, right? " ;
};


func int DIA_Addon_Rhademes_Hebel_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Rhademes_Pforte) && !Npc_KnowsInfo(other,DIA_Addon_Rhademes_DeinVater))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Rhademes_Hebel_Info()
{
	AI_Output(other,self, " DIA_Addon_Rhademes_Hebel_15_00 " );	// But not everyone activates the trap, right?
	AI_Output(self,other,"DIA_Addon_Rhademes_Hebel_03_01");	//Все!
};


instance DIA_Addon_Rhademes_DontBelieve(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 4;
	condition = DIA_Addon_Rhademes_DontBelieve_Condition;
	information = DIA_Addon_Rhademes_DontBelieve_Info;
	permanent = FALSE;
	description = " I don't believe you! " ;
};


func int DIA_Addon_Rhademes_DontBelieve_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Rhademes_Pforte) && !Npc_KnowsInfo(other,DIA_Addon_Rhademes_DeinVater))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Rhademes_DontBelieve_Info()
{
	AI_Output(other,self, " DIA_Addon_Rhademes_DontBelieve_15_00 " );	// I don't believe you!
	AI_Output(self,other, " DIA_Addon_Rhademes_DontBelieve_03_01 " );	// And yet I speak the truth.
};


instance DIA_Addon_Rhademes_DeinVater(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 5;
	condition = DIA_Addon_Rhademes_DeinVater_Condition;
	information = DIA_Addon_Rhademes_DeinVater_Info;
	permanent = FALSE;
	description = " Your father created this trap. How do you know how it works?! " ;
};


func int DIA_Addon_Rhademes_DeinVater_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Rhademes_Pforte ) && ( Npc_HasItems ( other , ItMy_Addon_Stone_04 ) >=  1 )) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Rhademes_DeinVater_Info()
{
	AI_Output(other,self, " DIA_Addon_Rhademes_DeinVater_15_00 " );	// Your father created this trap. How do you know how it works?!
	AI_Output(self,other, " DIA_Addon_Rhademes_DeinVater_03_01 " );	// Quarhodron! I still remember the knocking of hammers... on the other side of the gate... after all this time...
	AI_Output(self,other, " DIA_Addon_Rhademes_DeinVater_03_02 " );	// The sword... took revenge on me... for failing...
	AI_Output(other,self, " DIA_Addon_Rhademes_DeinVater_15_03 " );	// Do you remember which lever is the right one?
	AI_Output(self,other, " DIA_Addon_Rhademes_DeinVater_03_04 " );	// I forgot everything a long time ago.
	Info_ClearChoices(DIA_Addon_Rhademes_DeinVater);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater, " Then try to guess! " ,DIA_Addon_Rhademes_DeinVater_Guess);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater, " Вспоминай! " , DIA_Addon_Rhademes_DeinVater_Remember);
	Info_AddChoice(DIA_Addon_Rhademes_DeinVater,"Думай!",DIA_Addon_Rhademes_DeinVater_Think);
};


var int Rhademes_done;

func void B_Addon_Rhademes_Lever(var int Choice)
{
	AI_Output(self,other, " DIA_Addon_Rhademes_Lever_03_00 " );	// It's been so long...
	AI_StopProcessInfos(self);
	if(Choice <= 1)
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else if(Choice == 2)
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	}
	else
	{
		AI_GotoWP(self,"ADW_ADANOSTEMPEL_RHADEMES_04");
	};
	AI_UseMob(self,"LEVER",1);
	Rhademes_fertig = TRUE ;
};

func void DIA_Addon_Rhademes_DeinVater_Think()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Think_15_00");	//Думай!
	B_Addon_Rhademes_Lever(1);
};

func void DIA_Addon_Rhademes_DeinVater_Remember()
{
	AI_Output(other,self,"DIA_Addon_Rhademes_DeinVater_Remember_15_00");	//Вспоминай!
	B_Addon_Rhademes_Lever(2);
};

func void DIA_Addon_Rhademes_DeinVater_Guess()
{
	AI_Output(other,self, " DIA_Addon_Rhademes_DeinVater_Guess_15_00 " );	// Then try to guess!
	B_Addon_Rhademes_Lever(3);
};


instance DIA_Addon_Rhademes_PERM(C_Info)
{
	npc = NONE_ADDON_112_Rhademes;
	nr = 2;
	condition = DIA_Addon_Rhademes_PERM_Condition;
	information = DIA_Addon_Rhademes_PERM_Info;
	permanent = TRUE;
	important = TRUE;
};


func int DIA_Addon_Rhademes_PERM_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Rhademes_fertig == TRUE))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Rhademes_PERM_Info()
{
	AI_Output(self,other, " DIA_Addon_Rhademes_PERM_03_00 " );	// If you have the power... drown it... in the depths of the sea...
	SC_TookRhademesTrap = TRUE;
	SC_TalkedToRhademAfter = TRUE;
	AI_StopProcessInfos(self);
};

// ---------------------------------Radames new------------- --------


instance DIA_NONE_ADDON_1159_Rhademes_EXIT(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 999;
	condition = DIA_NONE_ADDON_1159_Rhademes_EXIT_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_ADDON_1159_Rhademes_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_ADDON_1159_Rhademes_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_ADDON_1159_Rhademes_Why(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_Why_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_Why_Info;
	permanent = FALSE;
	description = " Radames? What are you doing here? " ;
};

func int DIA_NONE_ADDON_1159_Rhademes_Why_Condition()
{
	return TRUE;
};

func void DIA_NONE_ADDON_1159_Rhademes_Why_Info()
{
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Why_01_00 " );	// Rademes? What are you doing here?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Why_01_01 " );	// (coldly) I came here to talk to Ash'Thar.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Why_01_02 " );	// My spirit still can't find its way to the ancestral world.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Why_01_03 " );	// Maybe he can help me.

	if(DragonGoldIsDead == TRUE)
	{
		AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Why_01_04 " );	// But Ash'Thar is dead!
		AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Why_01_05 " );	// I see. And from this my soul is even more filled with sadness.
		AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Why_01_06 " );	// Apparently, I will never have peace in this world.
	};
};

instance DIA_NONE_ADDON_1159_Rhademes_Father(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_Father_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_Father_Info;
	permanent = FALSE;
	description = " Where is your father? " ;
};

func int DIA_NONE_ADDON_1159_Rhademes_Father_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_Why) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_Father_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_Father_01_00");	//Где твой отец?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Father_01_01 " );	// Quarhodron? Why are you asking?
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Father_01_02 " );	// In case you haven't noticed, the undead have taken over Yarkendar!
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Father_01_03 " );	// And it threatens not only him, but also other parts of the island.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Father_01_04 " );	// Dark times have come for this world...
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Father_01_05 " );	// The children of Adanos can no longer watch the living destroy their shrines and desecrate the ancient temples of our ancestors.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Father_01_06 " );	// Therefore, they rose up to take revenge on them. And they will destroy all who dare to oppose the will of Adanos.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Father_01_07 " );	// I doubt Adanos was involved.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Father_01_08 " );	// Most likely, they obey the evil will of some demon, or maybe even Beliar himself.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Father_01_09 " );	// There's a lot you don't know, man... (coldly) But that's what my father said.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Father_01_10 " );	// I wonder what he has to do with all this?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Father_01_11 " );	// It was my father who called his brothers to him to help him execute the judgment of Adanos.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Father_01_12 " );	// He was once a great general of my people. Many remember him and are ready to serve him even after death.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Father_01_13 " );	// So, then Quarhodron is the cause of all troubles?! Who would have thought...
	B_LogEntry(TOPIC_JarCurse, " I met Rademes near the Temple of Ash'Tar. It seems that Saturas' words about the desecration of the shrines of the Ancients had far-reaching consequences are not far from the truth. And it was his father, Quarhodron, the great warlord of the Builders, who raised his brothers, in order to avenge the living for their sacrilege. " );
};

instance DIA_NONE_ADDON_1159_Rhademes_SeekFath(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_SeekFath_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_SeekFath_Info;
	permanent = FALSE;
	description = " But where can I find it? " ;
};

func int DIA_NONE_ADDON_1159_Rhademes_SeekFath_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_Father) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_SeekFath_Info()
{
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_00 " );	// Still, where can I find it?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_01 " );	// He is now where the great battle of Khar Aram once took place.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_02 " );	// Sounds great. But to be a little more precise?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_03 " );	// Sorry, but I don't remember where this place is anymore.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_SeekFath_01_04 " );	// All this is very bad.
	B_LogEntry(TOPIC_JarCurse, " When asked where Quarhodron is now, Rademes mentioned the place where the great battle of Khar Aram once took place. However, he himself no longer remembers exactly where it is. " );		
};

instance DIA_NONE_ADDON_1159_Rhademes_Near(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_Near_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_Near_Info;
	permanent = FALSE;
	description = " Why aren't you with him now? " ;
};

func int DIA_NONE_ADDON_1159_Rhademes_Near_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_Father) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_Near_Info()
{
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Near_01_00 " );	// Why aren't you with him now?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Near_01_01 " );	// (coldly) I can't just go back to my father...
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Near_01_02 " );	// He cursed me for what I did then. And since then my father doesn't want to see me anymore.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Near_01_03 " );	// Hasn't he forgiven you all this time?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Near_01_04 " );	// I don't know this. I haven't spoken to him for centuries.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Near_01_05 " );	// Then maybe it's worth a try?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Near_01_06 " );	// I've thought about this many times already. But will he want to listen to me?
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Near_01_07 " );	// Well, at least it's better than endless guessing.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Near_01_08 " );	// (thoughtfully) Yes, you might be right.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Near_01_09 " );	// However, until my people's ancient curse is lifted, I won't be able to face them.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Near_01_10 " );	// After all, it was I who caused all our disasters.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Near_01_11 " );	// And I'm the one who needs to fix this situation somehow.
};

instance DIA_NONE_ADDON_1159_Rhademes_Priest(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_Priest_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_Priest_Info;
	permanent = FALSE;
	description = " So Quarhodron himself controls this undead army? " ;
};

func int DIA_NONE_ADDON_1159_Rhademes_Priest_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_Father) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_Priest_Info()
{
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Priest_01_00 " );	// So Quarhodron himself controls this undead army?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Priest_01_01 " );	// (coldly) My father only leads an army of warriors...
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Priest_01_02 " );	// What about priests?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Priest_01_03 " );	// They obey the will of Cardimon, high priest of our people.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Priest_01_04 " );	// I've heard this name before.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Priest_01_05 " );	// It was his spirit that Raven called into this world to penetrate the temple of Adanos.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Priest_01_06 " );	// I don't understand what you're talking about, human.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_Priest_01_07 " );	// Okay, whatever. Just tell me where can I find this Cardimon?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_Priest_01_08 " );	// His spirit should dwell in a large temple in the northeast of this valley.
	MIS_Qvardemon = LOG_Running;
	Log_CreateTopic(TOPIC_Qvardemon,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Qvardemon,LOG_Running);
	B_LogEntry(TOPIC_Qvardemon, " Quarhodron controls only an army of undead warriors. The priests are subordinate to Cardimon, archmage of the Builders. Apparently, I will have to deal with him too. According to Rademes, the spirit of Cardimon dwells in the ruins of a temple in the northeast of the valley. " );	
	Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_ROAM_ENTRANCEORCGUARD_18");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_ROAM_ENTRANCEORCGUARD_17");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_02");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_LEFT_01");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_RIGHT_01");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_LEFT_07");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_LEFT_04");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_LEFT_08");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_RIGHT_03");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_RIGHT_06");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"ADW_CANYON_LIBRARY_RIGHT_07");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"ADW_CANYON_LIBRARY_RIGHT_09");
	Wld_InsertNpc(Skeleton_Shadow_Priest,"FP_STAND_QUARDIMON_GUARD_02");
	Wld_InsertNpc(Skeleton_Mage_AV_Elite,"FP_STAND_QUARDIMON_GUARD_01");
	Wld_InsertNpc(Skeleton_Shadow_Priest_Quardimon,"ADW_CANYON_LIBRARY_RIORDIAN");
};

instance DIA_NONE_ADDON_1159_Rhademes_SeekFathDone(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_Info;
	permanent = FALSE;
	description = " What will help you remember this? " ;
};

func int DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_Condition()
{
	if((MIS_JarCurse == LOG_Running) && (Npc_KnowsInfo(other,DIA_NONE_ADDON_1159_Rhademes_SeekFath) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_Info()
{
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_00 " );	// What will help you remember this?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_01 " );	// (sighing) The curse of my people prevents me from returning to the past.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_02 " );	// If I could just get rid of him, maybe it would give me back my memories.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_03 " );	// How can this be done?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_04 " );	// I don't know... (coldly) Adanos does not hear my prayers, no matter how much I turn to him.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_SeekFathDone_01_05 " );	// And if someone can do it, then only he.
	MIS_CurseAncient = LOG_Running;
	Log_CreateTopic(TOPIC_CurseAncient,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_CurseAncient,LOG_Running);
	B_LogEntry(TOPIC_CurseAncient, " I need to find a way to rid Rademes and his people of an ancient curse. According to him, only Adanos himself can do it. " );	
};

instance DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone(C_Info)
{
	npc = NONE_ADDON_1159_Rhademes;
	nr = 4;
	condition = DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_Condition;
	information = DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_Info;
	permanent = FALSE;
	description = " Adanos lifted the curse on your people. " ;
};

func int DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_Condition()
{
	if((MIS_CurseAncient == LOG_Running) && (CurseAncientRemove == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_00 " );	// Adanos lifted the curse on your people.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_01 " );	// Yes, I already felt it... (sighing) Now I'm finally free.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_02 " );	// So, your memory returned to you, and now you will tell me where to look for your father?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_03 " );	// As I said, it is now where the great battle of Khar Aram once took place.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_04 " );	// I already know this. Where exactly is this place?
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_05 " );	// Look for him in the sacred lands of Adanos. It is there that my father is gathering his army, which will have to take revenge on the people.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_06 " );	// And if it's even more precise? Those lands are quite vast.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_07 " );	// Hmmm...(thoughtfully) There's a huge rock near that place.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_08 " );	// As far as I remember, it once had an amazing view of almost the entire valley.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_09 " );	// Well, at least something. Otherwise, I would have to wander in the desert for an eternity.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_10 " );	// Wait, that's not all...
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_11 " );	// If you really want to meet my father, you'll have to wait until night first.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_12 " );	// For only in the gleam of moonlight can you see it.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_13 " );	// But be careful. He is surrounded by a large army of dead warriors.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_14 " );	// Then we'll have to deal with them first.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_15 " );	// They won't touch you if you let them know that you serve Adanos himself.
	AI_Output(other,self, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_16 " );	// Okay, I'll keep that in mind.
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_17 " );	// Now goodbye. We don't see each other anymore...
	AI_Output(self,other, " DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_18 " );	// And thank you for saving my people!
	AI_Output(other,self,"DIA_NONE_ADDON_1159_Rhademes_CurseAncientDone_01_19");	//Прощай.
	MIS_CurseAncient = LOG_Success;
	Log_SetTopicStatus(TOPIC_CurseAncient,LOG_Success);
	B_LogEntry(TOPIC_JarCurse,"Looks like I'll have to go to the Plateau of the Ancients again. That's where Quarhodron is gathering an army of the dead to destroy all life on this island. Rademes said that there is a huge rock near the place where I can find Quarhodron. However, I I'll have to wait for the night, because only in the moonlight will I be able to meet his father.He also warned me that Quarchodron was guarded by a huge number of warriors of the Builders.But if I can somehow prove that I serve Adanos, they will not attack me. Otherwise, I'll have to fight an entire army.");
	B_LogEntry_Quiet(TOPIC_CurseAncient, " The soul of Rademes is now free, as are all his people. Looks like the story of the ancient curse is over. " );
	AI_StopProcessInfos(self);
};
