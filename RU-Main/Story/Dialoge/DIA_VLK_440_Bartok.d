

instance DIA_Bartok_EXIT(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 999;
	condition = DIA_Bartok_EXIT_Condition;
	information = DIA_Bartok_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Bartok_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Bartok_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Bartok_Hallo (C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_Hallo_Condition;
	information = DIA_Bartok_Hallo_Info;
	permanent = FALSE;
	description = " How are you? " ;
};


func int DIA_Bartok_Hallo_Condition()
{
	return TRUE;
};

func void DIA_Bartok_Hallo_Info()
{
	AI_Output(other,self, " DIA_Bartok_Hello_15_00 " );	// How are you?
	AI_Output(self,other, " DIA_Bartok_Hello_04_01 " );	// You're not from here, are you? Nothing - me too.
	AI_Output(other,self, " DIA_Bartok_Hello_15_02 " );	// Where did you come from?
	AI_Output(self,other, " DIA_Bartok_Hello_04_03 " );	// From the forest! There I hunted scavengers and wolves along with other hunters.
	AI_Output(self,other, " DIA_Bartok_Hello_04_04 " );	// But I quit! These are dangerous times. And all sorts of rabble staggers everywhere ...
};


instances of DIA_Bartok_Jaeger (C_Info)
{
	npc = VLK_440_Bartok;
	nr = 2;
	condition = DIA_Bartok_Jaeger_Condition;
	information = DIA_Bartok_Jaeger_Info;
	permanent = FALSE;
	description = " Where can I find other hunters? " ;
};

func int DIA_Bartok_Jaeger_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Hallo) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_Jaeger_Info()
{
	AI_Output(other,self, " DIA_Bartok_Jager_15_00 " );	// Where can I find other hunters?
	AI_Output(self,other, " DIA_Bartok_Jager_01_01 " );	// Here, in the city, you definitely won't find them. Here, of all the hunters, only I, and my friend Trokar.
	AI_Output(self,other, " DIA_Bartok_Jager_01_02 " );	// The others have gone to the camp next to Onar's farm. Somewhere about halfway from the 'Dead Harpy' tavern.
	AI_Output(other,self, " DIA_Bartok_Jager_01_03 " );	// What kind of camp is this?
	AI_Output(self,other, " DIA_Bartok_Jager_01_04 " );	// It's called the Rogue Hunter camp.
	AI_Output(other,self, " DIA_Bartok_Jager_01_05 " );	// And how are you?
	AI_Output(self,other, " DIA_Bartok_Jager_01_06 " );	// A good place to be if you want to become a hunter, to be honest. And not only...
	AI_Output(other,self, " DIA_Bartok_Jager_01_07 " );	// Then we should also visit there on occasion.
	AI_Output(self,other, " DIA_Bartok_Jager_01_08 " );	// Well, young man, try it. Perhaps you will even become one of them.
	AI_Output(self,other, " DIA_Bartok_Jager_01_09 " );	// Trust me, you can learn a lot from those guys in the camp.
	AI_Output(other,self, " DIA_Bartok_Jager_01_10 " );	// What do I need to do for this?
	AI_Output(self,other, " DIA_Bartok_Jager_01_11 " );	// (thoughtfully) Well, I don't know! So you can't say right off the bat.
	AI_Output(self,other, " DIA_Bartok_Jager_01_12 " );	// I think you should get some hunting armor first.
	AI_Output(self,other, " DIA_Bartok_Jager_01_13 " );	// And in this rag, the guys will take you for an ordinary ragamuffin.
	AI_Output(self,other, " DIA_Bartok_Jager_01_14 " );	// And none of them will even talk to you.
	AI_Output(other,self, " DIA_Bartok_Jager_01_15 " );	// And where can I get such armor?
	AI_Output(self,other, " DIA_Bartok_Jager_01_16 " );	// I know of only one such place - at the merchant Bosper. Only he has the hunter's armor.
	AI_Output(self,other, " DIA_Bartok_Jager_01_17 " );	// True, in order for him to give them to you, you will have to become his student.
	AI_Output(self,other, " DIA_Bartok_Jager_01_18 " );	// It's just that he doesn't give away his armor to anyone.
	AI_Output(self,other, " DIA_Bartok_Jager_01_19 " );	// And how you will act as a student - consider that the armor is in your hands. By the way, I got mine the same way.
	AI_Output(self,other, " DIA_Bartok_Jager_01_20 " );	// But what to do now is up to you.
};


instance DIA_Addon_Bartok_MissingPeople(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Addon_Bartok_MissingPeople_Condition;
	information = DIA_Addon_Bartok_MissingPeople_Info;
	description = " Where is Trocar now? " ;
};

func int DIA_Addon_Bartok_MissingPeople_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Jaeger) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Bartok_MissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Bartok_MissingPeople_15_00 " );	// Where is Trocar now?
	AI_Output(self,other, " DIA_Addon_Bartok_MissingPeople_04_01 " );	// This is a very unusual story.
	AI_Output(self,other, " DIA_Addon_Bartok_MissingPeople_04_02 " );	// A few days ago, we were drinking at Koragon's tavern and talking about hunting.
	AI_Output(self,other, " DIA_Addon_Bartok_MissingPeople_04_03 " );	// Don't ask me what happened next. By that time, I was already pretty pumped up.
	AI_Output(self,other, " DIA_Addon_Bartok_MissingPeople_04_04 " );	// I remember Trokar saying something about getting a few shoals out of the swamp grass. I haven't seen him since.
	MIS_Bartok_MissingTrokar = LOG_Running;
	Info_ClearChoices(DIA_Addon_Bartok_MissingPeople);
	Info_AddChoice(DIA_Addon_Bartok_MissingPeople,"А ты не искал его?",DIA_Addon_Bartok_MissingPeople_such);
	Info_AddChoice(DIA_Addon_Bartok_MissingPeople, " Where can I find a marsh grass joint? " ,DIA_Addon_Bartok_MissingPeople_wo);
};

func void DIA_Addon_Bartok_MissingPeople_wo()
{
	AI_Output(other,self, " DIA_Addon_Bartok_MissingPeople_wo_15_00 " );	// Where can I find a shoal of swamp grass?
	AI_Output(self,other, " DIA_Addon_Bartok_MissingPeople_wo_04_01 " );	// Here at the port. At least that's what I was told.
};

func void DIA_Addon_Bartok_MissingPeople_such()
{
	AI_Output(other,self,"DIA_Addon_Bartok_MissingPeople_such_15_00");	//Ты его искал?
	AI_Output(self,other, " DIA_Addon_Bartok_MissingPeople_such_04_01 " );	// No! But I reported this to the militia.
	AI_Output(self,other, " DIA_Addon_Bartok_MissingPeople_such_04_02 " );	// They haven't found it yet.
	AI_Output(self,other, " DIA_Addon_Bartok_MissingPeople_such_04_03 " );	// I hope he didn't get eaten by wolves or worse.
	AI_Output(self,other, " DIA_Addon_Bartok_MissingPeople_such_04_04 " );	// I'm afraid that one day I'll find his mangled corpse while hunting.
	AI_Output(self,other, " DIA_Addon_Bartok_MissingPeople_such_04_05 " );	// I can't stand this!
	MIS_TROKARMISS = LOG_Running;
	Log_CreateTopic(TOPIC_TROKARMISS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_TROKARMISS,LOG_Running);
	; _ _ _ _ _ _
	Wld_InsertNpc(vlk_6138_trokar,"NW_FOREST_PATH_04_16_MONSTER2");
	B_KillNpc(wolf_6138_trocar);
	Wld_InsertNpc(orcwarrior2,"FP_ROAM_NW_FOREST_PATH_04_16_MONSTER2_02");
	Wld_InsertNpc(orcwarrior2,"FP_ROAM_NW_FOREST_PATH_04_16_MONSTER2_03");
	Wld_InsertNpc(orcwarrior3,"FP_ROAM_NW_FOREST_PATH_04_16_MONSTER2_04");
};

instance DIA_ADDON_BARTOK_FINDTROKAR (C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = dia_addon_bartok_findtrokar_condition;
	information = dia_addon_bartok_findtrokar_info;
	permanent = FALSE;
	description = " I have bad news for you. " ;
};

func int dia_addon_bartok_findtrokar_condition()
{
	if((MIS_TROKARMISS == LOG_Running) && (Npc_HasItems(hero,itri_trokarring) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_bartok_findtrokar_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Bartok_FindTrokar_01_00 " );	// I have bad news for you.
	AI_Output(self,other, " DIA_Addon_Bartok_FindTrokar_01_01 " );	// (excitedly) You mean? What happened?
	AI_Output(other,self, " DIA_Addon_Bartok_FindTrokar_01_02 " );	// I hate to upset you, but I'm afraid that your friend Trokar will never come back to you.
	AI_Output(self,other,"DIA_Addon_Bartok_FindTrokar_01_03");	//Но почему?
	AI_Output(other,self, " DIA_Addon_Bartok_FindTrokar_01_04 " );	// It's just that... he's dead.
	AI_Output(self,other, " DIA_Addon_Bartok_FindTrokar_01_05 " );	// Died? Oh no! It just can't be!
	AI_Output(self,other, " DIA_Addon_Bartok_FindTrokar_01_06 " );	// But how could this happen?
	AI_Output(other,self, " DIA_Addon_Bartok_FindTrokar_01_07 " );	// I found his body in the woods near Akila's farm.
	AI_Output(other,self, " DIA_Addon_Bartok_FindTrokar_01_08 " );	// Most likely, during his hunt, he came across a small band of orcs, and they simply tore him to pieces.
	AI_Output(self,other, " DIA_Addon_Bartok_FindTrokar_01_09 " );	// But... But maybe you made a mistake? Maybe it was not Trokar at all?
	AI_Output(other,self, " DIA_Addon_Bartok_FindTrokar_01_10 " );	// There can be no doubt. He had this ring with him.
	B_GiveInvItems(other,self,itri_trokarring,1);
	Npc_RemoveInvItems(self,itri_trokarring,1);
	AI_Output(self,other, " DIA_Addon_Bartok_FindTrokar_01_11 " );	// Yes, it really is his thing. (doomed) So it's true - my only friend Trokar is dead!
	AI_Output(other,self, " DIA_Addon_Bartok_FindTrokar_01_12 " );	// I'm sorry.
	AI_Output(self,other, " DIA_Addon_Bartok_FindTrokar_01_13 " );	// Eh, okay... (doomed) There's nothing to be done now. So this is his fate.
	AI_Output(self,other, " DIA_Addon_Bartok_FindTrokar_01_14 " );	// Anyway, thanks for bringing me his ring. I'll probably keep it as a memory of a good old friend.
	AI_Output(self,other, " DIA_Addon_Bartok_FindTrokar_01_15 " );	// Now he will always be with me. Although, of course, this is unlikely to calm me down.
	MIS_TROKARMISS = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_TROKARMISS,LOG_SUCCESS);
	B_LogEntry( TOPIC_TROKARMISS , " I informed Bartok of the death of his friend Trokar. " );
};


instance DIA_Bartok_Bosper (C_Info)
{
	npc = VLK_440_Bartok;
	nr = 3;
	condition = DIA_Bartok_Bosper_Condition;
	information = DIA_Bartok_Bosper_Info;
	permanent = FALSE;
	description = " Bosper says you worked for him... " ;
};


func int DIA_Bartok_Bosper_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bosper_Bartok) && Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Bosper_Info()
{
	AI_Output(other,self, " DIA_Bartok_Bosper_15_00 " );	// Bosper says you worked for him...
	AI_Output(self,other, " DIA_Bartok_Bosper_04_01 " );	// Yes, it was. But he was only interested in those damn skins.
	AI_Output(self,other, " DIA_Bartok_Bosper_04_02 " );	// I told him how dangerous hunting had become. But he didn't want to hear anything.
	AI_Output(self,other, " DIA_Bartok_Bosper_04_03 " );	// True, he paid well - it's a sin to complain.
	AI_Output(other,self, " DIA_Bartok_Bosper_15_04 " );	// Can you tell me something about him?
	AI_Output(self,other, " DIA_Bartok_Bosper_04_05 " );	// (laughs) Bosper's bow was recently stolen. Right in broad daylight.
	AI_Output(self,other, " DIA_Bartok_Bosper_04_06 " );	// Someone broke into his shop, grabbed a bow and was gone.
	AI_Output(self,other, " DIA_Bartok_Bosper_04_07 " );	// Thieves will get bold right before your eyes!

	if (MIS_Bosper_Bogen !=  LOG_SUCCESS )
	{
		MIS_Bosper_Bogen = LOG_Running;
	};
};

instance DIA_Bartok_WannaLearn(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_WannaLearn_Condition;
	information = DIA_Bartok_WannaLearn_Info;
	permanent = FALSE;
	description = " Can you teach me how to hunt? " ;
};

func int DIA_Bartok_WannaLearn_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Bartok_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Bartok_WannaLearn_Info()
{
	AI_Output(other,self, " DIA_Bartok_WannaLearn_15_00 " );	// Can you teach me how to hunt?
	AI_Output(self,other, " DIA_Bartok_WannaLearn_04_01 " );	// I can teach you how to sneak and hold your bow properly.
	AI_Output(self,other, " DIA_Bartok_WannaLearn_04_02 " );	// As well as skinning dead animals. Bosper taught me that too.
	Bartok_TeachPlayer = TRUE;
	Log_CreateTopic(TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_CityTeacher, " Bartok can teach me how to sneak, skin and shoot a bow. " );
};

instance DIA_Bartok_TeachFUR(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 900;
	condition = DIA_Bartok_TeachFUR_Condition;
	information = DIA_Bartok_TeachFUR_Info;
	permanent = TRUE;
	description = " Teach me how to skin animals. " ;
};

func int DIA_Bartok_TeachFUR_Condition()
{
	if((Bartok_TeachPlayer == TRUE) && (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Bartok_TeachFUR_Info()
{
	AI_Output(other,self, " DIA_Bosper_TeachFUR_15_00 " );	// Teach me how to skin animals!
	Info_ClearChoices(DIA_Bartok_TeachFUR);
	Info_AddChoice(DIA_Bartok_TeachFUR,Dialog_Back,DIA_Bartok_TeachFUR_Back);
	Info_AddChoice(DIA_Bartok_TeachFUR,b_buildlearnstringforsmithhunt("Содрать шкуру",B_GetLearnCostTalent(other,NPC_TALENT_TAKEANIMALTROPHY,TROPHY_Fur)),DIA_Bartok_TeachFUR_Do);
};

func void DIA_Bartok_TeachFUR_Back()
{
	Info_ClearChoices(DIA_Bartok_TeachFUR);
};

func void DIA_Bartok_TeachFUR_Do()
{
	if(B_TeachPlayerTalentTakeAnimalTrophy(self,other,TROPHY_Fur))
	{
		AI_Output(self,other, " DIA_Bartok_TeachFUR_11_01 " );	// Good. Look... it's pretty simple.
		AI_Output(self,other, " DIA_Bartok_TeachFUR_11_02 " );	// You take a sharp knife and cut open the animal's belly. Then you make a few small incisions on the inside of the legs, and remove the skin.
	};

	Info_ClearChoices(DIA_Bartok_TeachFUR);
};

instance DIA_Bartok_TeachSneak(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 899;
	condition = DIA_Bartok_TeachSneak_Condition;
	information = DIA_Bartok_TeachSneak_Info;
	permanent = TRUE;
	description = " Teach me how to sneak. " ;
};

func int DIA_Bartok_TeachSneak_Condition()
{
	if((Bartok_TeachPlayer == TRUE) && (Npc_GetTalentSkill(other,NPC_TALENT_SNEAK) == 0))
	{
		return TRUE;
	};
};

func void DIA_Bartok_TeachSneak_Info()
{
	AI_Output(other,self, " DIA_Bartok_TeachSneak_15_00 " );	// Teach me how to sneak.
	Info_ClearChoices(DIA_Bartok_TeachSneak);
	Info_AddChoice(DIA_Bartok_TeachSneak,Dialog_Back,DIA_Bartok_TeachSneak_Back);
	Info_AddChoice(DIA_Bartok_TeachSneak,b_buildlearnstringforthief("Подкрадывание",B_GetLearnCostTalent(other,NPC_TALENT_SNEAK,1)),DIA_Bartok_TeachSneak_SNEAK);
};

func void DIA_Bartok_TeachSneak_Back()
{
	Info_ClearChoices(DIA_Bartok_TeachSneak);
};

func void DIA_Bartok_TeachSneak_SNEAK()
{
	if(B_TeachThiefTalent(self,other,NPC_TALENT_SNEAK))
	{
		AI_Output(self,other, " DIA_Bartok_TeachSneak_04_01 " );	// Okay - first you have to learn how to properly distribute your weight.
		AI_Output(self,other, " DIA_Bartok_TeachSneak_04_02 " );	// To do this, bend your knees and try to always lower your foot to the heel.
		AI_Output(self,other, " DIA_Bartok_TeachSneak_04_03 " );	// All load should be on the supporting leg until the other leg is firmly planted on the ground.
		AI_Output(self,other, " DIA_Bartok_TeachSneak_04_04 " );	// Most beasts can't be sneaked on unless they're sleeping. They just teach you.
		AI_Output(self,other, " DIA_Bartok_TeachSneak_04_05 " );	// So be careful when hunting.
	};

	Info_ClearChoices(DIA_Bartok_TeachSneak);
};

var int Bosper_MerkeBow;

instance DIA_Bartok_Teach(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 4;
	condition = DIA_Bartok_Teach_Condition;
	information = DIA_Bartok_Teach_Info;
	permanent = TRUE;
	description = " I want to learn how to shoot a bow better! " ;
};

func int DIA_Bartok_Teach_Condition()
{
	if(Bartok_TeachPlayer == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_Teach_Info()
{
	AI_Output(other,self, " DIA_Bartok_TeachBow_15_00 " );	// I want to learn how to shoot a bow better!
	AI_Output(self,other, " DIA_Bartok_TeachBow_04_01 " );	// Okay, let's see what I can teach you...
	Bosper_MerkeBow = other.HitChance[NPC_TALENT_BOW];
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};

func void DIA_Bartok_Teach_Back()
{
	if(other.HitChance[NPC_TALENT_BOW] >= 60)
	{
		AI_Output(self,other, " DIA_Bartok_TeachBow_BACK_04_00 " );	// You'd better look for someone who knows more than me.
	}
	else if(Bosper_MerkeBow < other.HitChance[NPC_TALENT_BOW])
	{
		AI_Output(self,other, " DIA_Bartok_TeachBow_BACK_04_01 " );	// Okay, you've gotten a lot better at shooting.
	};
	Info_ClearChoices(DIA_Bartok_Teach);
};

func void DIA_Bartok_Teach_BOW_1()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,1,60);
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};

func void DIA_Bartok_Teach_BOW_5()
{
	B_TeachFightTalentPercent(self,other,NPC_TALENT_BOW,5,60);
	Info_ClearChoices(DIA_Bartok_Teach);
	Info_AddChoice(DIA_Bartok_Teach,Dialog_Back,DIA_Bartok_Teach_Back);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow1,B_GetLearnCostTalent(other,NPC_TALENT_BOW,1)),DIA_Bartok_Teach_BOW_1);
	Info_AddChoice(DIA_Bartok_Teach,b_buildlearnstringforfight(PRINT_LearnBow5,B_GetLearnCostTalent(other,NPC_TALENT_BOW,5)),DIA_Bartok_Teach_BOW_5);
};


var int Bartok_Bereit;
var int Bartok_Later;

instance DIA_Bartok_Together (C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Bartok_Together_Condition;
	information = DIA_Bartok_Together_Info;
	permanent = TRUE;
	description = " Why don't we hunt together? " ;
};


func int DIA_Bartok_Together_Condition()
{
	if ((Bartok_Ready ==  FALSE ) && Npc_KnowsInfo(other,DIA_Bartok_Hello))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Together_Info()
{
	if(Bartok_Later == FALSE)
	{
		AI_Output(other,self, " DIA_Bartok_Zusammen_15_00 " );	// Why don't we hunt together?
		AI_Output(self,other, " DIA_Bartok_Zusammen_04_01 " );	// Hmmm... hunting together isn't that dangerous, that's for sure!
		AI_Output(self,other, " DIA_Bartok_Zusammen_04_02 " );	// What do you know about hunting, huh?
		AI_Output(self,other, " DIA_Bartok_Zusammen_04_03 " );	// I mean, do you know how to skin animals?
	};
	if(PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Fur] == TRUE)
	{
		if(Bartok_Later == TRUE)
		{
			AI_Output(self,other, " DIA_Bartok_HuntNOW_04_01 " );	// Do you have fifty coins?
		}
		else
		{
			AI_Output(other,self,"DIA_Bartok_Zusammen_15_04");	//Да.
			AI_Output(self,other, " DIA_Bartok_Zusammen_04_05 " );	// Okay, I want to get fifty gold coins. And you can take the skins for yourself and sell them to Bosper.
			AI_Output(self,other, " DIA_Bartok_Zusammen_04_06 " );	// That would be fair, right?
		};
		Info_ClearChoices(DIA_Bartok_Together);
		Info_AddChoice(DIA_Bartok_Together, " Позже... " ,DIA_Bartok_Together_Later);
		Info_AddChoice(DIA_Bartok_Together, " Вот они... " ,DIA_Bartok_Together_Pay);
	}
	else
	{
		AI_Output(other,self,"DIA_Bartok_Zusammen_15_07");	//Нет.
		AI_Output(self,other, " DIA_Bartok_Zusammen_04_08 " );	// Then the game is not worth the candle.
		AI_Output(self,other, " DIA_Bartok_Zusammen_04_09 " );	// Come back when you've learned something.
	};
};

func void DIA_Bartok_Together_Later()
{
	AI_Output(other,self,"DIA_Bartok_HuntNOW_Later_15_00");	//Позже...
	Bartok_Later = TRUE;
	Info_ClearChoices(DIA_Bartok_Together);
};

func void DIA_Bartok_Together_Pay()
{
	Info_ClearChoices(DIA_Bartok_Together);
	if(B_GiveInvItems(other,self,ItMi_Gold,50))
	{
		AI_Output(other,self, " DIA_Bartok_HuntNOW_GO_15_00 " );	// Here, take this...
		Bartok_Ready = TRUE ;
	}
	else
	{
		AI_Output(self,other, " DIA_Bartok_HuntNOW_GO_04_03 " );	// Where? I do not see! You don't have gold.
	};
};


var int Bartok_Los;

instance DIA_Bartok_HuntNOW(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 5;
	condition = DIA_Bartok_HuntNOW_Condition;
	information = DIA_Bartok_HuntNOW_Info;
	permanent = FALSE;
	description = " Let's go hunting! " ;
};


func int DIA_Bartok_HuntNOW_Condition()
{
	if (Bartok_Ready ==  TRUE )
	{
		return TRUE;
	};
};

func void DIA_Bartok_HuntNOW_Info()
{
	AI_Output(other,self, " DIA_Bartok_HuntNOW_15_00 " );	// Let's go hunting!
	AI_Output(self,other, " DIA_Bartok_HuntNOW_GO_04_01 " );	// Okay, follow me. Beyond the southern gate begins the forest. There are more than enough creatures out there.
	AI_Output(self,other, " DIA_Bartok_HuntNOW_GO_04_02 " );	// (under his breath) Even more than I would like...
	Bartok_Los = TRUE;
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	Npc_ExchangeRoutine(self,"GUIDEMITTE");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
	Wld_InsertNpc(Wolf,"NW_FARM1_CITYWALL_FOREST_02");
};


var int Bartok_OrkStillThere;

instance DIA_Bartok_ImWald(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_ImWald_Condition;
	information = DIA_Bartok_ImWald_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Bartok_ImWald_Condition()
{
	if((Bartok_Los == TRUE) && (Bartok_Ende == FALSE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_03") < 500))
	{
		return TRUE;
	};
};

func void DIA_Bartok_ImWald_Info()
{
	AI_Output(self,other, " DIA_Bartok_ImWald_04_00 " );	// Do you think we should go deeper into the forest or not?
	Info_ClearChoices(DIA_Bartok_ImWald);
	Info_AddChoice(DIA_Bartok_ImWald, " Пойдем назад! " ,DIA_Bartok_ImWald_NachHause);
	Info_AddChoice(DIA_Bartok_ImWald, " Стоит. " ,DIA_Bartok_ImWald_Next);
};

func void DIA_Bartok_ImWald_NachHause()
{
	AI_Output(other,self, " DIA_Bartok_ImWald_NachHause_15_00 " );	// Let's go back!
	AI_Output(self,other, " DIA_Bartok_ImWald_NachHause_04_01 " );	// I think so too. And then we will fall right into the arms of an orc.
	Info_ClearChoices(DIA_Bartok_ImWald);
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;

	if(MIS_CoragonFixBeer == LOG_Success)
	{
		Npc_ExchangeRoutine(self,"Coragon");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};

func void DIA_Bartok_ImWald_Next()
{
	AI_Output(other,self,"DIA_Bartok_ImWald_Weiter_15_00");	//Стоит.
	AI_Output(self,other, " DIA_Bartok_ImWald_Weiter_04_01 " );	// Good. (to himself) Let's hope we're lucky...

	if(OrcWarriorHaradIsDead == FALSE)
	{
		Bartok_OrkStillThere = TRUE;
	};

	Info_ClearChoices(DIA_Bartok_ImWald);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GUIDEENDE");
};

instance DIA_Bartok_Arrival (C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_Arrived_Condition;
	information = DIA_Bartok_Arrived_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Bartok_Arrived_Condition()
{
	if((Bartok_Los == TRUE) && (Bartok_Ende == FALSE) && (Npc_GetDistToWP(self,"NW_FARM1_CITYWALL_FOREST_07") < 500))
	{
		return TRUE;
	};
};

func void DIA_Bartok_Arrived_Info()
{
	AI_Output(self,other, " DIA_Bartok_Angekommen_04_00 " );	// Everyone! I think we need to get back to the city.
	AI_Output(self,other, " DIA_Bartok_Angekommen_04_01 " );	// It's too dangerous for me here! And even for the two of us.

	if(Bartok_OrkStillThere == TRUE)
	{
		B_Bartok_ShitAnOrc();
		Bartok_OrkGesagt = TRUE;
	};
	AI_Output(self,other, " DIA_Bartok_Angekommen_04_03 " );	// See you again!
	AI_Output(self,other, " DIA_Bartok_Angekommen_04_04 " );	// You can sell skins to Bosper.
	Bartok_End = TRUE ;
	AI_StopProcessInfos(self);
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;

	if(MIS_CoragonFixBeer == LOG_Success)
	{
		Npc_ExchangeRoutine(self,"Coragon");
	}
	else
	{
		Npc_ExchangeRoutine(self,"Start");
	};
};

var int BartokCanGoHuntCamp;

instance DIA_Bartok_PERM(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_PERM_Condition;
	information = DIA_Bartok_PERM_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};

func int DIA_Bartok_PERM_Condition()
{
	if(Bartok_Los == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Bartok_PERM_Info()
{
	AI_Output(other,self, " DIA_Bartok_PERM_15_00 " );	// Is everything okay?

	if(BartokBecameHunt == TRUE)
	{
		AI_Output(self,other, " DIA_Bartok_PERM_04_03 " );	// Of course. Let's finish off some more animals!
	}
	else  if (Bartok_End ==  TRUE )
	{
		AI_Output(self,other, " DIA_Bartok_PERM_04_01 " );	// Yes. But I won't leave town again. At least in the near future.

		if(Bartok_OrkGesagt == TRUE)
		{
			AI_Output(self,other, " DIA_Bartok_PERM_04_02 " );	// My hamstrings are still shaking just thinking about that orc.
		};
		
		BartokCanGoHuntCamp = TRUE;
		AI_StopProcessInfos(self);
		self.aivar[ AIV_PARTYMEMBER ] = FALSE ;

		if(MIS_CoragonFixBeer == LOG_Success)
		{
			Npc_ExchangeRoutine(self,"Coragon");
		}
		else
		{
			Npc_ExchangeRoutine(self,"Start");
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Bartok_PERM_04_03 " );	// Of course. Let's finish off some more animals!
	};
};

instance DIA_Bartok_HuntCamp(C_Info)
{
	npc = VLK_440_Bartok;
	nr = 1;
	condition = DIA_Bartok_HuntCamp_Condition;
	information = DIA_Bartok_HuntCamp_Info;
	permanent = FALSE;
	description = " Do you want to finally become a real hunter? " ;
};

func int DIA_Bartok_HuntCamp_Condition()
{
	if((MIS_NewHunters == LOG_Running) && (BartokCanGoHuntCamp == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Bartok_HuntCamp_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Bartok_HuntCamp_01_00 " );	// Do you want to finally become a real hunter?
	AI_Output(self,other, " DIA_Bartok_HuntCamp_01_01 " );	// Interesting. And who do you think I am?
	AI_Output(other,self, " DIA_Bartok_HuntCamp_01_02 " );	// What kind of hunter are you, if you are even afraid to stick your nose out of the city gates.
	AI_Output(self,other, " DIA_Bartok_HuntCamp_01_03 " );	// What? I'm not afraid! Just... just why take the risk?
	AI_Output(other,self, " DIA_Bartok_HuntCamp_01_04 " );	// Then prove it.
	AI_Output(self,other, " DIA_Bartok_HuntCamp_01_05 " );	// And what do you think I should do?
	AI_Output(other,self, " DIA_Bartok_HuntCamp_01_06 " );	// Well, for example, join other hunters, and not sit back here.
	AI_Output(other,self, " DIA_Bartok_HuntCamp_01_07 " );	// Tell me, do you like to hunt?
	AI_Output(self,other, " DIA_Bartok_HuntCamp_01_08 " );	// Of course. Consider this to be my favorite pastime.
	AI_Output(other,self, " DIA_Bartok_HuntCamp_01_09 " );	// Even more so. And the senior hunter Falk just needs new people.
	AI_Output(self,other, " DIA_Bartok_HuntCamp_01_11 " );	// Oh, I forgot about the Rogue Hunter camp.
	AI_Output(self,other, " DIA_Bartok_HuntCamp_01_12 " );	// Hmmm... Anyway, at least I won't have to hunt alone.
	AI_Output(self,other, " DIA_Bartok_HuntCamp_01_13 " );	// So you're saying they need new people?
	AI_Output(other,self, " DIA_Bartok_HuntCamp_01_14 " );	// If you don't believe me, you can go to Falk right now and ask him.
	AI_Output(self,other, " DIA_Bartok_HuntCamp_01_15 " );	// Well, if so, then maybe I'll really take your offer.
	AI_Output(other,self, " DIA_Bartok_HuntCamp_01_16 " );	// Come on. And hurry before someone else takes your place.
	B_LogEntry(TOPIC_NewHunters, " I convinced Bartok to go to the hunters' camp. " );
	BartokBecameHunt = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GoHuntCamp");
};
