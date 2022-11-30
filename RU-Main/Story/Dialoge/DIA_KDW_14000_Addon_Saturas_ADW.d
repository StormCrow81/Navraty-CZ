

instance DIA_Addon_Saturas_ADW_EXIT (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 999;
	condition = DIA_Addon_Saturas_ADW_EXIT_Condition;
	information = DIA_Addon_Saturas_ADW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Addon_Saturas_ADW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_ADW_EXIT_Info()
{
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_EXIT_14_00 " );	// May Adanos protect you.
	AI_StopProcessInfos(self);
};


instance DIA_Addon_Saturas_ADWStart (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = DIA_Addon_Saturas_ADWStart_Condition;
	information = DIA_Addon_Saturas_ADWStart_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_ADWStart_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_ADWStart_Info()
{
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_14_00 " );	// Thank Adanos! Finally you are here. We thought you wouldn't show up again.
	AI_Output(other,self, " DIA_Addon_Saturas_ADWStart_15_01 " );	// What? How did you manage to get HERE?
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_14_02 " );	// You went through the portal, we followed you. Our journey was short.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_14_03 " );	// However, you weren't there. We've been here for several days.
	AI_Output(other,self, " DIA_Addon_Saturas_ADWStart_15_04 " );	// SEVERAL DAYS? Is it possible?
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_14_05 " );	// After we couldn't find you anywhere, Nefarious decided to find out what might have happened. It seemed that up to now all his efforts had been in vain.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_14_06 " );	// Okay. Now you're here and you can get to work.
	Wld_InsertNpc(Giant_Rat,"ADW_PORTALTEMPEL_11");
	Wld_InsertNpc(Giant_Rat,"ADW_PORTALTEMPEL_11");

	if(SBMODE == TRUE)
	{
		Wld_InsertNpc(OrcBiter,"ADW_CANYON_PATH_TO_LIBRARY_31A");
		Wld_InsertNpc(OrcBiter,"ADW_CANYON_PATH_TO_LIBRARY_16A");
		Wld_InsertNpc(Wolf,"ADW_CANYON_PATH_TO_LIBRARY_12A");
		Wld_InsertNpc(Bloodhound,"ADW_CANYON_PATH_TO_MINE2_09");
		Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_PATH_TO_BANDITS_26");
		Wld_InsertNpc(Giant_DesertRat,"ADW_CANYON_PATH_TO_BANDITS_66");
		Wld_InsertNpc(Minecrawler,"ADW_CANYON_PATH_TO_BANDITS_22");
		Wld_InsertNpc(Minecrawler,"ADW_CANYON_PATH_TO_BANDITS_14");
		Wld_InsertNpc(Gobbo_Black,"ADW_ENTRANCE_2_PIRATECAMP_19");
		Wld_InsertNpc(Gobbo_Black,"ADW_ENTRANCE_2_PIRATECAMP_19");
		Wld_InsertNpc(orcwarrior3,"ADW_CANYON_ORCS_08");
		Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_ORCS_11");
		Wld_InsertNpc(orcwarrior4,"ADW_CANYON_ORCS_01");
		Wld_InsertNpc(orcwarrior3s,"ADW_VALLEY_PATH_035");
	};

	Wld_InsertNpc(CanyonRazor03,"ADW_CANYON_PATH_TO_LIBRARY_07A");
	Wld_InsertNpc(CanyonRazor04,"ADW_CANYON_PATH_TO_LIBRARY_36");
	Wld_InsertNpc(Valley_Troll,"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertItem(itpl_super_herb,"FP_ITEM_VALLEY_05");
	Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_MINE2_09");
	Wld_InsertNpc(MinecrawlerWarrior,"ADW_CANYON_MINE2_09");
	Info_ClearChoices(DIA_Addon_Saturates_ADWStart);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart, " What's happened lately? " ,DIA_Addon_Saturas_ADWStart_was);
};

func void DIA_Addon_Saturates_ADWStart_was()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADWStart_was_15_00 " );	// What happened in the meantime?
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_was_14_01 " );	// We learned a lot.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_was_14_02 " );	// Earthquakes are really much stronger here. Now we are not so far from their epicenter.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_was_14_03 " );	// We can say with confidence that the builders of these ancient structures once built a city on this site.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_was_14_04 " );	// However, for some reason, their culture has declined.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_was_14_05 " );	// But for now, we can only speculate why this happened.
	Info_AddChoice(DIA_Addon_Saturas_ADWStart, " Any trace of missing people? " ,DIA_Addon_Saturas_ADWStart_missingPeople);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart, " How about Raven? " ,DIA_Addon_Saturas_ADWStart_Raven);
};

func void DIA_Addon_Saturas_ADWStart_Raven()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADWStart_Raven_15_00 " );	// How about Raven?
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_Raven_14_01 " );	// Raven's letter talks about the temple he tried to break into.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_Raven_14_02 " );	// We agree that Raven is looking for a way to desecrate the Temple of Adanos.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_Raven_14_03 " );	// Apparently, the earthquake is caused by a powerful spell's resistance to an unholy spell.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_Raven_14_04 " );	// There is a magical seal on the gate of the temple, and it is her magic that revives the stone guards.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_Raven_14_05 " );	// The temple is being defended. We must stop Raven before he breaks into the holy of holies.
	Info_AddChoice(DIA_Addon_Saturation_ADWStart, " Why? " ,DIA_Addon_Saturation_ADWStart_wastun);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart, " Raven is just a former ore baron, not a mage. " ,DIA_Addon_Saturas_ADWStart_RavenOnlyBaron);
	Info_AddChoice(DIA_Addon_Saturas_ADWStart, " What does Raven need in the temple? " ,DIA_Addon_Saturas_ADWStart_RavenAim);
};

func void DIA_Addon_Saturates_ADWStart_RavenAim()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADWStart_RavenAim_15_00 " );	// What does Raven need in the temple?
	AI_Output(self,other, " DIA_Addon_Bodo_14_01 " );	// We only know that this is about a powerful artifact somehow connected to Adanos and Beliar.
	AI_Output(self,other, " DIA_Addon_Bodo_14_02 " );	// (grimly) Naturally, we don't expect anything good from him...
};

func void DIA_Addon_Saturas_ADWStart_RavenOnlyBaron()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_15_00 " );	// Raven is just a former ore baron, not a mage. Can HE do something like this?
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_01 " );	// Perhaps he will not act on his own, but will hire some renegade mage.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_RavenOnlyBaron_14_02 " );	// One way or another, we MUST prevent evil.
};

func void DIA_Addon_Saturas_ADWStart_missingPeople()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADWStart_missingPeople_15_00 " );	// Are there any traces of missing people?
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_missingPeople_14_01 " );	// Only yesterday we found the fisherman's body. It lay under the ruins to the east of here.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_missingPeople_14_02 " );	// Looks like it was a fisherman from Khorinis. Take a look there.
	Saturas_AboutWilliam = TRUE ;
	B_LogEntry(TOPIC_Addon_MissingPeople,LogText_Addon_WilliamLeiche);
};

func void DIA_Addon_Saturate_ADWStart_repeat()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADWStart_wastun_15_00 " );	// What's next?
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_wastun_14_01 " );	// We will stay here and continue to study the ancient culture.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_wastun_14_02 " );	// In the ancient writings of the architects, many and many secrets are hidden that we must unravel if we want to understand what happened here.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_wastun_14_03 " );	// In the meantime, there are some things you need to do for us...
	Info_AddChoice(DIA_Addon_Saturas_ADWStart, " What should I do? " ,DIA_Addon_Saturas_ADWStart_wastun2);
};

func void DIA_Addon_Saturates_ADWStart_wastun2()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADWStart_wastun2_15_00 " );	// What should I do?
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_wastun2_14_01 " );	// You must find Raven and stop him from desecrating the Temple of Adanos.
	AI_Output(other,self, " DIA_Addon_Saturas_ADWStart_wastun2_15_02 " );	// So I have to KILL him?
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_wastun2_14_03 " );	// If this is the only way to stop him, then, in the name of Adanos, yes!
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_wastun2_14_04 " );	// Collect all the ancient relics and records of the architects that you find and bring them to us.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_wastun2_14_05 " );	// We need to learn as much as we can about these people and their deaths.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_wastun2_14_06 " );	// We can only thwart Raven's plans if we can see right through them.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_wastun2_14_07 " );	// Also, you must find a way to free the slaves.
	AI_Output(other,self, " DIA_Addon_Saturas_ADWStart_wastun2_15_08 " );	// (cynically) Is that all? I'll do it all with one left.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_wastun2_14_09 " );	// (annoyed) I know I'm asking too much. Take this as a chance to win back my trust.
	MY_ADDON_Saturates_GoToRaven = LOG_Running;
	Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
	B_LogEntry(TOPIC_Addon_RavenKDW, " The raven is desecrating the holy temple of Adanos. I must stop him, even if I have to kill him. " );
	Log_CreateTopic(TOPIC_Addon_Sklaven,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Sklaven,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Sklaven, " Saturas wants me to free the slaves. " );
	Log_CreateTopic(TOPIC_Addon_Relicts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Relicts, " Saturas wants me to bring him anything that will help him learn new information about the architects. " );
	Info_AddChoice(DIA_Addon_Saturas_ADWStart, " Then I'll go. " ,DIA_Addon_Saturas_ADWStart_back);
};

func void DIA_Addon_Saturas_ADWStart_back()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADWStart_back_15_00 " );	// Then I'll go.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_back_14_01 " );	// One more thing... Raven has gathered around him a large gang of bandits.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_back_14_02 " );	// In your absence, another member of the Ring of Water has arrived.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_back_14_03 " );	// We sent him to the swamp. He didn't come back.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_back_14_04 " );	// We suspect that the bandits attack anyone who looks different from them.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_back_14_05 " );	// Therefore, you should get the same armor as theirs.
	AI_Output(self,other, " DIA_Addon_Saturas_ADWStart_back_14_06 " );	// This is the only way to get close to them without being immediately attacked.
	Log_CreateTopic(TOPIC_Addon_BDTRuestung,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BDTRuestung,LOG_Running);
	B_LogEntry(TOPIC_Addon_BDTRuestung, " Bandits kill anyone who doesn't look like them. I need bandit armor to get to them. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};

instance DIA_Addon_Saturas_PoorRanger(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_PoorRanger_Condition;
	information = DIA_Addon_Saturas_PoorRanger_Info;
	description = " Who was the poor fellow you sent to the swamp? " ;
};


func int DIA_Addon_Saturas_PoorRanger_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_PoorRanger_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_PoorRanger_15_00 " );	// Who was the poor guy you sent to the swamp?
	AI_Output(self,other, " DIA_Addon_Saturas_PoorRanger_14_01 " );	// His name was Lance.
	AI_Output(self,other, " DIA_Addon_Saturas_PoorRanger_14_02 " );	// I'm afraid he didn't get far.
	Log_CreateTopic(TOPIC_Addon_Lance,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Lance,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Lance, " Saturas has sent a man named Lance to the swamp. He fears that Lance hasn't gotten far. " );
};

instance DIA_Addon_Saturas_WhatThink(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_WhatThink_Condition;
	information = DIA_Addon_Saturas_WhatThink_Info;
	description = " What do you think of Raven? " ;
};

func int DIA_Addon_Saturas_WhatThink_Condition()
{
	return TRUE;
};

func void DIA_Addon_Saturas_WhatThink_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_WhatThink_01_00");	//Что ты думаешь о Вороне?
	AI_Output(self,other,"DIA_Addon_Saturas_WhatThink_01_01");	//В Старом Лагере он был правой рукой Гомеза и одним из самых влиятельных людей колонии.
	AI_Output(self,other,"DIA_Addon_Saturas_WhatThink_01_02");	//Не знаю, как он вступил на путь зла, но его действия носят очень серьезный характер, и нам необходимо его остановить!
	AI_Output(self,other,"DIA_Addon_Saturas_WhatThink_01_03");	//Правда, мне кажется, что Ворон является лишь исполнителем чужой воли. А истинное зло нам еще не явило своего лица. 
};

instance DIA_Addon_Saturas_Piraten(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_Piraten_Condition;
	information = DIA_Addon_Saturas_Piraten_Info;
	description = "Где можно найти бандитские доспехи моего размера?";
};


func int DIA_Addon_Saturas_Piraten_Condition()
{
	if ((AlligatorJack.aivar[AIV_TalkedToPlayer] ==  FALSE ) && (Greg.aivar[AIV_TalkedToPlayer] ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Saturas_Piraten_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_Piraten_15_00 " );	// Where can I find bandit armor in my size?
	AI_Output(self,other, " DIA_Addon_Saturas_Piraten_14_01 " );	// Looks like there was a pirate camp to the west of here.
	AI_Output(self,other, " DIA_Addon_Saturas_Piraten_14_02 " );	// As far as we know, they keep in touch with the bandits.
	AI_Output(self,other, " DIA_Addon_Saturas_Piraten_14_03 " );	// I don't think they'll attack you when you approach.
	AI_Output(self,other, " DIA_Addon_Saturas_Piraten_14_04 " );	// Maybe they can help you with something.
	B_LogEntry(TOPIC_Addon_BDTRuestung, " Saturas said the pirates could help me get the bandit armor. " );
};


instance DIA_Addon_Saturate_LaunchMilk (C_Info);
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_LanceLeiche_Condition;
	information = DIA_Addon_Saturated_Launch_Milk_Info;
	description = " I found Lance's body. " ;
};


func int DIA_Addon_Saturas_LanceLeiche_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Saturates_PoorRanger ) && ( Npc_HasItems ( NONE_ Addon_114_Launch_ADW , ItRi_LaunchRing ) ==  FALSE )) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Saturates_Launches_Milk_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_LanceLeiche_15_00 " );	// I found Lance's body.
	AI_Output(self,other, " DIA_Addon_Saturas_LanceLeiche_14_01 " );	// May his soul rest in the realm of Adanos.
	AI_Output(self,other, " DIA_Addon_Saturas_LanceLeiche_14_02 " );	// Be careful, son. I don't want to mourn another such loss.
	TOPIC_End_Lance = TRUE;
	B_GivePlayerXP(XP_Addon_LanceLeiche);
};

instance DIA_Addon_Saturas_LanceChange(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_LanceChange_Condition;
	information = DIA_Addon_Saturas_LanceChange_Info;
	permanent = FALSE;
	description = " Who will replace Lance now? " ;
};

func int DIA_Addon_Saturas_LanceChange_Condition()
{
	if(TOPIC_End_Lance == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_LanceChange_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_LanceChange_01_00 " );	// Who will replace Lance now?
	AI_Output(self,other, " DIA_Addon_Saturas_LanceChange_01_01 " );	// I don't even know. All the other brothers of the Ring of Water are now busy with other important assignments.
	AI_Output(other,self, " DIA_Addon_Saturas_LanceChange_01_02 " );	// In my opinion, you just don't have enough people.
	AI_Output(self,other, " DIA_Addon_Saturas_LanceChange_01_03 " );	// It's true, my son... (dejectedly) But we are unlikely to find someone worthy to take Lance's place here.
	AI_Output(self,other, " DIA_Addon_Saturas_LanceChange_01_04 " );	// After all, there are only bandits and pirates around.
	MIS_LanceChange = LOG_Running;
	Log_CreateTopic(TOPIC_LanceChange,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LanceChange,LOG_Running);
	B_LogEntry(TOPIC_LanceChange, " Saturas doesn't think there's a person on this part of the island who can replace Lance. But who knows, maybe I can find one? " );
};

instance DIA_Addon_Saturas_LanceChange_Eremit(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_LanceChange_Eremit_Condition;
	information = DIA_Addon_Saturas_LanceChange_Eremit_Info;
	permanent = FALSE;
	description = " I found you a new helper. " ;
};

func int DIA_Addon_Saturas_LanceChange_Eremit_Condition()
{
	if (( MIS_LanceChange == LOG_Running ) && ( EremitAgreed ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_LanceChange_Eremit_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self, " DIA_Addon_Saturas_LanceChange_Eremit_01_00 " );	// I found you a new helper.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_Eremit_01_01");	//И кто же он?
	AI_Output(other,self,"DIA_Addon_Saturas_LanceChange_Eremit_01_02");	//Его зовут Эрмит. Он отшельник и живет в глубине долины.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_Eremit_01_03");	//Думаешь, он может быть нам полезен?
	AI_Output(other,self,"DIA_Addon_Saturas_LanceChange_Eremit_01_04");	//Более чем. К тому же он кое-что знает о культуре Зодчих и еще умеет читать древние таблички.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceChange_Eremit_01_05");	//Правда? Хммм...(задумчиво) Хорошо, сын мой. Я согласен принять его в наши ряды.
	MIS_LanceChange = LOG_Success;
	Log_SetTopicStatus(TOPIC_LanceChange,LOG_Success);
	B_LogEntry(TOPIC_LanceChange,"Сатурас согласился взять Эрмита в качестве помощника магов. Надо бы сообщить об этом самому Эрмиту.");
};

instance DIA_Addon_Saturas_LanceRing(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_LanceRing_Condition;
	information = DIA_Addon_Saturas_LanceRing_Info;
	description = "У меня аквамариновое кольцо Ланса.";
};


func int DIA_Addon_Saturas_LanceRing_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Addon_Saturas_LanceLeiche) && Npc_HasItems(other,ItRi_LanceRing))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_LanceRing_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_LanceRing_15_00");	//У меня аквамариновое кольцо Ланса.
	AI_Output(self,other,"DIA_Addon_Saturas_LanceRing_14_01");	//Лучше отдай его мне, чтобы оно не попало в дурные руки.
	B_GiveInvItems(other,self,ItRi_LanceRing,1);
	B_GivePlayerXP(XP_Addon_LanceRing);
};


instance DIA_Addon_Saturas_Tokens(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 10;
	condition = DIA_Addon_Saturas_Tokens_Condition;
	information = DIA_Addon_Saturas_Tokens_Info;
	permanent = TRUE;
	description = "Насчет реликвий...";
};


func int DIA_Addon_Saturas_Tokens_Condition()
{
	if(Saturas_SCBroughtAllToken == FALSE)
	{
		return TRUE;
	};
	return FALSE;
};


var int DIA_Addon_Saturas_Tokens_OneTime;
var int Saturas_SCBroughtAllToken;
var int Saturas_BroughtTokenAmount;
var int ScBroughtToken;
var int Saturas_SCFound_ItMi_Addon_Stone_01;
var int Saturas_SCFound_ItMi_Addon_Stone_02;
var int Saturas_SCFound_ItMi_Addon_Stone_03;
var int Saturas_SCFound_ItMi_Addon_Stone_04;
var int Saturas_SCFound_ItMi_Addon_Stone_05;

func void DIA_Addon_Saturas_Tokens_Info()
{
	var int BroughtToken;
	var int XP_BroughtTokens;
	var int Kohle;
	AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_00");	//Насчет реликвий...
	if((DIA_Addon_Saturas_Tokens_OneTime == FALSE) && (C_ScHasMagicStonePlate() || Npc_HasItems(other,ItWr_StonePlateCommon_Addon)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_01");	//У меня для тебя кое-что есть.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_02");	//Нам уже известны подобные каменные таблички. От них нам мало прока.
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_03");	//Должно же быть что-то еще.
		DIA_Addon_Saturas_Tokens_OneTime = TRUE;
	};
	BroughtToken = 0;
	XP_BroughtTokens = 0;
	if((Npc_HasItems(other,ItMi_Addon_Stone_01) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_02) && (Saturas_SCFound_ItMi_Addon_Stone_02 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_03) && (Saturas_SCFound_ItMi_Addon_Stone_03 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_04) && (Saturas_SCFound_ItMi_Addon_Stone_04 == FALSE)) || (Npc_HasItems(other,ItMi_Addon_Stone_05) && (Saturas_SCFound_ItMi_Addon_Stone_05 == FALSE)))
	{
		AI_Output(other,self,"DIA_Addon_Saturas_Tokens_15_04");	//Как насчет ЭТОГО?
		AI_Output(self,other,"DIA_Addon_Saturas_Tokens_14_05");	//Выглядит неплохо. Где ты это нашел?
		B_LogEntry(TOPIC_Addon_Relicts,"Я отдал Сатурасу следующие реликвии:");
		if(Npc_HasItems(other,ItMi_Addon_Stone_01) && (Saturas_SCFound_ItMi_Addon_Stone_01 == FALSE))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_01,1);
			Saturas_SCFound_ItMi_Addon_Stone_01 = TRUE ;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self, " DIA_Addon_Saturas_Tokens_15_06 " );	// Bandits use these tablets as money.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_07 " );	// On the tablets is the sign of Quarhodron, the great warrior.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_08 " );	// This is the commander, through the fault of whose son, Rademes, the whole city perished.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_09 " );	// (contemptuously) I bet the bandits don't even know what they're using instead of money.
			Log_AddEntry(TOPIC_Addon_Relicts, " A red stone tablet. Bandits use these tablets as money. It bears the name of the great warrior Quarhodron. " );
		};
		if ( Npc_HasItems ( other , It_My_Addon_Stone_02 ) && ( Saturas_SCFound_It_My_Addon_Stone_02 ==  FALSE ))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_02,1);
			Saturas_SCFound_ItMi_Addon_Stone_02 = TRUE ;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self, " DIA_Addon_Saturas_Tokens_15_10 " );	// I found this plaque in a building south of here.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_11 " );	// A! Tablet of the Guardians of the Dead. That's who summoned the spirits of their dead.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_12 " );	// Architects maintained a very close relationship with their ancestors.
			Log_AddEntry(TOPIC_Addon_Relicts, " Purple stone tablet from the palace of the guardians of the dead in the south. " );
		};
		if ( Npc_HasItems ( other , ItMy_Addon_Stone_03 ) && ( Saturas_SCFound_It_My_Addon_Stone_03 ==  FALSE ))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_03,1);
			Saturas_SCFound_ItMi_Addon_Stone_03 = TRUE ;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self, " DIA_Addon_Saturas_Tokens_15_13 " );	// I found this plaque in a building southwest of here.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_14 " );	// Judging by the tablet, it is somehow connected with the palace of the city priests.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_15 " );	// The high priest's name was Cardimon. Little is known about him.
			Log_AddEntry(TOPIC_Addon_Relicts, " A blue stone tablet from the priests' palace in the southwest. " );
		};
		if ( Npc_HasItems ( other , It_My_Addon_Stone_04 ) && ( Saturas_SCFound_It_My_Addon_Stone_04 ==  FALSE ))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_04,1);
			Saturas_SCFound_ItMi_Addon_Stone_04 = TRUE ;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self, " DIA_Addon_Saturas_Tokens_15_15 " );	// It was by a building next to a huge swamp.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_16 " );	// Most likely, it was the palace of healers.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_17 " );	// We don't know much about them. Looks like they disappeared first.
			Log_AddEntry(TOPIC_Addon_Relicts, " A green stone tablet from the healers' palace in the southern part of the swamp. " );
		};
		if ( Npc_HasItems ( other , It_My_Addon_Stone_05 ) && ( Saturas_SCFound_It_My_Addon_Stone_05 ==  FALSE ))
		{
			B_GiveInvItems(other,self,ItMi_Addon_Stone_05,1);
			Saturas_SCFound_ItMi_Addon_Stone_05 = TRUE ;
			BroughtToken = BroughtToken + 1;
			AI_Output(other,self, " DIA_Addon_Saturas_Tokens_15_18 " );	// This thing was in a large building in a deep gorge.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_19 " );	// This is the library of the ancient people.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_20 " );	// Presumably this is a tablet of scientists.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_80 " );	// Many of the writings we found lead to the head of the scholar caste.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_81 " );	// Curiously enough, he didn't leave his name anywhere...
			Log_AddEntry(TOPIC_Addon_Relicts, " Yellow stone tablet from the Library of Scientists in the north. " );
		};
		if(SC_Knows_WeaponInAdanosTempel == TRUE)
		{
		};
		XP_BroughtTokens = XP_Addon_ForOneToken * BroughtToken;
		B_GivePlayerXP(XP_BroughtTokens);
		Saturas_BroughtTokenAmount = Saturas_BroughtTokenAmount + BroughtToken;
		if ( Saturates_BroughtTokenAmount <  5 )
		{
			if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
			{
				AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_21 " );	// Very good. The image of the city is clearing up, but we still don't know enough.
			};
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_22 " );	// There should be five different types of tablets hidden in this area.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_23 " );	// Find them and bring them to me.
		};
		AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_24 " );	// Here's some gold as a reward.
		Coal = 200  * BroughtToken;
		CreateInvItems(self,ItMi_Gold,Coal);
		B_GiveInvItems(self,other,ItMi_Gold,Coal);
		ScBroughtToken = TRUE;
	};
	if ( Saturates_BroughtTokenAmount ==  5 )
	{
		AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_25 " );	// Now we have collected all the necessary relics.
		if(Ghost_SCKnowsHow2GetInAdanosTempel == FALSE)
		{
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_26 " );	// You've done us a huge favor. Thank you.
			AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_27 " );	// This will take us a big step forward in our research.
		};
		MIS_Saturas_LookingForHousesOfRulers = LOG_SUCCESS;
		Saturas_SCBroughtAllToken = TRUE;
	}
	else
	{
		AI_Output(other,self, " DIA_Addon_Saturas_Tokens_15_28 " );	// Let's see if I can find something.
		AI_Output(self,other, " DIA_Addon_Saturas_Tokens_14_29 " );	// Good. But hurry! Time is working against us.
	};
};


instance DIA_Addon_Saturas_StonePlateHint(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_StonePlateHint_Condition;
	information = DIA_Addon_Saturas_StonePlateHint_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_StonePlateHint_Condition()
{
	if (((Merdarion_GotFocusCount >=  2 ) || (RavenIsInTemple ==  TRUE )) && (Saturas_SCBroughtAllToken ==  FALSE ) && (Ghost_SCKnowsHow2GetInAdanosTemple ==  FALSE ) && (RavenAway ==  FALSE )) ;
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Saturas_StonePlateHint_Info()
{
	AI_Output(self,other, " DIA_Addon_Saturas_StonePlateHint_14_00 " );	// It's good that you came. We want to share new discoveries with you.
	AI_Output(other,self, " DIA_Addon_Saturas_StonePlateHint_15_01 " );	// Tell me.
	AI_Output(self,other, " DIA_Addon_Saturas_StonePlateHint_14_02 " );	// The sunken city was once called Yarkendar. Its people were jointly ruled by five rulers.
	AI_Output(self,other, " DIA_Addon_Saturas_StonePlateHint_14_03 " );	// Each of these rulers had a palace in which the ruler lived and kept his property.
	AI_Output(self,other, " DIA_Addon_Saturas_StonePlateHint_14_04 " );	// Therefore, in search of the remains of an ancient culture, it is most important for you to explore these palaces.
	MIS_Saturas_LookingForHousesOfRulers = LOG_Running;
	Info_ClearChoices(DIA_Addon_Saturas_StonePlateHint);
	Info_AddChoice(DIA_Addon_Saturas_StonePlateHint, " What if there's nothing left of them? " ,DIA_Addon_Saturas_StonePlateHint_unter);
	Info_AddChoice(DIA_Addon_Saturas_StonePlateHint, " Where can I find palaces? " ,DIA_Addon_Saturas_StonePlateHint_wo);
};

func void DIA_Addon_Saturates_StonePlateHint_wo();
{
	AI_Output(other,self, " DIA_Addon_Saturas_StonePlateHint_wo_15_00 " );	// Where can I find palaces?
	AI_Output(self,other, " DIA_Addon_Saturas_StonePlateHint_wo_14_01 " );	// Riordian studied the arrangement of buildings in Yarkendar.
	AI_Output(self,other, " DIA_Addon_Saturas_StonePlateHint_wo_14_02 " );	// He will tell you where to find these palaces.
	Log_CreateTopic(TOPIC_Addon_HousesOfRulers,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_HousesOfRulers,LOG_Running);
	B_LogEntry(TOPIC_Addon_HousesOfRulers, " Saturas wants me to search the builders' palaces. Riordian will tell me where to find these buildings. " );
};

func void DIA_Addon_Saturas_StonePlateHint_unter()
{
	AI_Output(other,self, " DIA_Addon_Saturas_StonePlateHint_unter_15_00 " );	// What if there's nothing left of them?
	AI_Output(self,other, " DIA_Addon_Saturas_StonePlateHint_unter_14_01 " );	// If you don't find them, they probably drowned with the city.
	AI_Output(self,other, " DIA_Addon_Saturas_StonePlateHint_unter_14_02 " );	// However, if they exist, their importance for our research cannot be overestimated.
};


instance DIA_Addon_Saturation_SCBroughtAllToken (C_Info) .
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_SCBroughtAllToken_Condition;
	information = DIA_Addon_Saturation_SCBroughtAllToken_Info;
	description = " Why do you need five stone tablets? " ;
};


func int DIA_Addon_Saturation_SCBroughtAllToken_Condition();
{
	if (( ScBroughtToken ==  TRUE ) && ( Ghost_SCKnowsHow2GetInAdanosTemple ==  FALSE ) && ( RavenAway ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Saturation_SCBroughtAllToken_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_SCBroughtAllToken_15_00 " );	// Why do you need five stone tablets?
	AI_Output(self,other, " DIA_Addon_Saturas_SCBroughtAllToken_14_01 " );	// The records we were able to find in the ruins are incomplete.
	AI_Output(self,other, " DIA_Addon_Saturas_SCBroughtAllToken_14_02 " );	// But the letters of the architects speak of five rulers who ruled the city.
	AI_Output(self,other, " DIA_Addon_Saturas_SCBroughtAllToken_14_03 " );	// Each of them had one of these tablets as a symbol of power.
	AI_Output(self,other, " DIA_Addon_Saturas_SCBroughtAllToken_14_04 " );	// I think the answer to all our questions is in these tablets.
};


instance DIA_Addon_Saturas_Flut (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_Flut_Condition;
	information = DIA_Addon_Saturas_Flut_Info;
	description = " Nefarius told me about the flood... " ;
};


func int DIA_Addon_Saturations_Flut_Condition()
{
	if ((NefariusADW_Talk2Saturas ==  TRUE ) && (RavenAway ==  FALSE ))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_Flut_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_Flut_15_00");	//Нефариус рассказал мне про потоп...
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_02");	//Написано, что сам Аданос снизошел с небес, чтобы наказать неверных и ввергнуть их в царство мертвых.
	AI_Output(self,other,"DIA_Addon_Saturas_Flut_14_03");	//Объятый святым гневом, он приказал морю обрушиться на строителей города и таким образом стер его с лица земли.
	AI_Output(self,other, " DIA_Addon_Saturas_Flut_14_04 " );	// The swamp to the east of here witnessed these long-gone events.
	TOPIC_END_Flut = TRUE;
	B_GivePlayerXP(XP_Ambient);
};


instance DIA_Addon_Saturas_AdanosZorn (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_AdanosZorn_Condition;
	information = DIA_Addon_Saturas_AdanosZorn_Info;
	description = " What could have angered Adanos so much? " ;
};


func int DIA_Addon_Saturas_AdanosZorn_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Saturates_Flut ) && ( RavenAway ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Saturas_AdanosZorn_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_AdanosZorn_15_00 " );	// What could have angered Adanos so much?
	AI_Output(self,other, " DIA_Addon_Saturas_AdanosZorn_14_01 " );	// At one time the temple of this city was a great and famous building.
	AI_Output(self,other, " DIA_Addon_Saturas_AdanosZorn_14_02 " );	// Everyone revered him and prayed to our god Adanos.
	AI_Output(self,other, " DIA_Addon_Saturas_AdanosZorn_14_03 " );	// Rademes, son of Commander Quarhodron, defiled the temple.
	AI_Output(self,other, " DIA_Addon_Saturas_AdanosZorn_14_04 " );	// As a result of this, the inhabitants fell victim to evil one by one.
	AI_Output(self,other, " DIA_Addon_Saturas_AdanosZorn_14_05 " );	// I suspect that Adanos could not forgive this, and his retribution fell upon the entire region.
	AI_Output(self,other, " DIA_Addon_Saturas_AdanosZorn_14_06 " );	// That's why it's so important to stop Raven. He's going to do the same...
};


instance DIA_Addon_Saturas_RavenInfos (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 9;
	condition = DIA_Addon_Saturas_RavenInfos_Condition;
	information = DIA_Addon_Saturas_RavenInfos_Info;
	permanent = TRUE;
	description = " About Raven... " ;
};


var int DIA_Addon_Saturas_RavenInfos_OneTime1;
var int DIA_Addon_Saturas_RavenInfos_OneTime2;
var int DIA_Addon_Saturas_RavenInfos_OneTime3;
var int DIA_Addon_Saturas_RavenInfos_OneTime4;
var int DIA_Addon_Saturas_RavenInfos_OneTime5;
var int Addon_Saturates_Fortune;

func int DIA_Addon_Saturas_RavenInfos_Condition()
{
	if ((MY_ADDON_Saturates_GoToRaven == LOG_Running) && (RavenAway ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RavenInfos_Info()
{
	var int RavenNeuigkeit;
	var int XP_RavenNeuigkeit;
	AI_Output(other,self, " DIA_Addon_Saturas_RavenInfos_15_00 " );	// About Raven...
	RavenNews = 0 ;
	if ((Thorus.aivar[AIV_TalkedToPlayer] ==  TRUE ) && (DIA_Addon_Saturates_RavenInfos_OneTime1 ==  FALSE ) && (RavenIsInTemple ==  FALSE )) ;
	{
		AI_Output(other,self, " DIA_Addon_Saturas_RavenInfos_15_01 " );	// I've been to the bandit camp east of here. Raven is their leader.
		AI_Output(other,self, " DIA_Addon_Saturas_RavenInfos_15_02 " );	// But before I got close to Raven, I had to get a few bandits out of the way.
		AI_Output(self,other, " DIA_Addon_Saturas_RavenInfos_14_03 " );	// Great. Good luck. But don't forget that you need to act quickly.
		AI_Output(self,other, " DIA_Addon_Saturas_RavenInfos_14_04 " );	// The raven must never reach the target under any circumstances.
		DIA_Addon_Saturas_RavenInfos_OneTime1 = TRUE ;
		RavenNews = RavenNews +  1 ;
	};
	if ((SC_KnowsRavensGoldmine ==  TRUE ) && (DAY_Addon_Saturates_RavenInfos_OneTime2 ==  FALSE ))
	{
		AI_Output(other,self, " DIA_Addon_Saturas_RavenInfos_15_05 " );	// He owns the gold mine and the prisoners who mine the gold.
		AI_Output(self,other, " DIA_Addon_Saturas_RavenInfos_14_06 " );	// It looks like him. You must free the prisoners.
		AI_Output(other,self, " DIA_Addon_Saturas_RavenInfos_15_07 " );	// (sighs) Yes, of course. I'm working on it.
		DIA_Addon_Saturas_RavenInfos_OneTime2 = TRUE ;
		RavenNews = RavenNews +  1 ;
	};
	if((SC_KnowsFortunoInfos == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime3 == FALSE))
	{
		AI_Output(other,self, " DIA_Addon_Saturas_RavenInfos_15_08 " );	// One bandit guy claims to know about Raven's plans.
		AI_Output(other,self, " DIA_Addon_Saturas_RavenInfos_15_09 " );	// His name is Fortuno. He says that Raven wants to break into the temple in order to take possession of a powerful artifact.
		AI_Output(self,other, " DIA_Addon_Bodo_14_03 " );	// And? Did he know anything else about this artifact?
		AI_Output(other,self, " DIA_Addon_Saturas_RavenInfos_15_11 " );	// He told me only that Raven opened the tomb of the priest Adanos.
		AI_Output(self,other, " DIA_Addon_Saturas_RavenInfos_14_12 " );	// This tomb may contain the key to the temple. Examine her.
		AI_Output(other,self, " DIA_Addon_Saturas_RavenInfos_15_13 " );	// The raven forced the prisoners to dig up the priest's tomb.
		AI_Output(self,other, " DIA_Addon_Saturas_RavenInfos_14_14 " );	// Bad! You must hurry and stop the Raven.
		Addon_Saturas_Fortuno = TRUE ;
		DIA_Addon_Saturas_RavenInfos_OneTime3 = TRUE;
		RavenNews = RavenNews +  1 ;
	};
	if((RavenIsInTempel == TRUE) && (DIA_Addon_Saturas_RavenInfos_OneTime4 == FALSE))
	{
		AI_Output(other,self, " DIA_Addon_Saturas_RavenInfos_15_15 " );	// I snuck into Raven's quarters.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_16");	//И? Что с Вороном?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_17");	//Я опоздал. Он скрылся в храме Аданоса у меня на глазах.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_18");	//(взволнованно) Что?! Это КАТАСТРОФА! Почему ты не последовал за ним?!
		DIA_Addon_Saturas_RavenInfos_OneTime4 = TRUE;
		MIS_ADDON_Saturas_GoToRaven = LOG_SUCCESS;
		RavenNeuigkeit = RavenNeuigkeit + 1;
	};
	if(RavenNeuigkeit != 0)
	{
		XP_RavenNeuigkeit = RavenNeuigkeit * XP_Ambient;
		B_GivePlayerXP(XP_RavenNeuigkeit);
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_19");	//Ты можешь рассказать что-то новое?
		AI_Output(other,self,"DIA_Addon_Saturas_RavenInfos_15_20");	//Нет, пока ничего.
		AI_Output(self,other,"DIA_Addon_Saturas_RavenInfos_14_21");	//Мой тебе совет: не стоит недооценивать Ворона. Запомни это.
	};
};


instance DIA_Addon_Saturas_TuerZu(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_TuerZu_Condition;
	information = DIA_Addon_Saturas_TuerZu_Info;
	description = "Я не смог последовать за Вороном!";
};


func int DIA_Addon_Saturas_TuerZu_Condition()
{
	if((MIS_ADDON_Saturas_GoToRaven == LOG_SUCCESS) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_TuerZu_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_00");	//Я не смог последовать за Вороном. Он закрыл вход изнутри.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_02");	//Я должен подумать...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_03");	//Нам нужно понять, как Ворон смог попасть в храм...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_04");	//Что он делал перед тем, как открыть проход в храм?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_05");	//Прочитал перед воротами заклинание.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_06");	//А до этого?
	AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_07");	//Он вскрыл гробницу жреца.
	if(Addon_Saturas_Fortuno == TRUE)
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_09");	//Я же тебе об этом уже говорил...
		AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_10");	//Верно!
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_TuerZu_15_08");	//Я знаю только то, что он провел там какой-то ритуал...
	};
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_11");	//(задумчиво) Ритуал...
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_12");	//Да! Правильно!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_13");	//Боюсь, Ворон получил силу стражей мертвых.
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_14");	//Он получил знание о том, как попасть в храм, у духа!
	AI_Output(self,other,"DIA_Addon_Saturas_TuerZu_14_15");	//Ты должен рассказать об этом Миксиру!
	Log_CreateTopic(TOPIC_Addon_Quarhodron,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Quarhodron,LOG_Running);
	B_LogEntry(TOPIC_Addon_Quarhodron,"Ворон обрел силу стражей мертвых. Он получил от призрака знания о храме Аданоса. Я должен рассказать об этом Миксиру.");
	Saturas_RiesenPlan = TRUE;
};


instance DIA_Addon_Saturas_GhostQuestions(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_GhostQuestions_Condition;
	information = DIA_Addon_Saturas_GhostQuestions_Info;
	description = "Я говорил с Куарходроном.";
};


func int DIA_Addon_Saturas_GhostQuestions_Condition()
{
	if((Npc_IsDead(Quarhodron) == FALSE) && (SC_TalkedToGhost == TRUE) && (Ghost_SCKnowsHow2GetInAdanosTempel == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_GhostQuestions_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_00");	//Я говорил с Куарходроном.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_01");	//Что же он тебе сказал?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_02");	//Что он поможет мне только в том случае, если я отвечу на его вопросы.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_03");	//И в чем проблема?
	AI_Output(other,self,"DIA_Addon_Saturas_GhostQuestions_15_04");	//Я не знаю правильных ответов.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_05");	//Хммм...(задумчиво) Нам известно, что на севере отсюда находится библиотека ученых.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_06");	//Ученые тщательно записывали сведения обо всех важных событиях прошлого.
	AI_Output(self,other,"DIA_Addon_Saturas_GhostQuestions_14_07");	//Возможно, в библиотеке ты найдешь ответы на вопросы Куарходрона.
	B_LogEntry(TOPIC_Addon_Quarhodron,"Сатурас думает, что я смогу найти ответы на вопросы Куарходрона в библиотеке ученых. Она находится далеко на севере.");
};


instance DIA_Addon_Saturas_TalkedToGhost(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_TalkedToGhost_Condition;
	information = DIA_Addon_Saturas_TalkedToGhost_Info;
	description = "Проблема с воротами храма решена.";
};


func int DIA_Addon_Saturas_TalkedToGhost_Condition()
{
	if((Ghost_SCKnowsHow2GetInAdanosTempel == TRUE) && (RavenAway == FALSE))
	{
		return TRUE;
	};
	return FALSE;
};

func void DIA_Addon_Saturas_TalkedToGhost_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_00");	//Проблема с воротами храма решена.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_01");	//Дух заговорил?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_02");	//Да.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_03");	//Значит, ты знаешь, как попасть в храм?
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_04");	//Именно так. И еще дух рассказал мне, что ждет меня внутри.
	AI_Output(other,self,"DIA_Addon_Saturas_TalkedToGhost_15_05");	//Он говорил о могущественном мече и залах Аданоса.
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_06");	//О, Аданос! Какие же мы глупцы. Как мы могли быть так слепы?
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_07");	//В записях же все сказано...
	AI_Output(self,other,"DIA_Addon_Saturas_TalkedToGhost_14_08");	//Этот меч - не что иное, как Коготь Белиара.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_14_09 " );	// We should get through the Halls of Adanos as soon as possible and retrieve the sword.
	Info_ClearChoices(DIA_Addon_Saturas_TalkedToGhost);
	Info_AddChoice(DIA_Addon_Saturas_TalkedToGhost, " What is Beliar's Claw? " ,DIA_Addon_Saturas_TalkedToGhost_wasistdas);
	Info_AddChoice(DIA_Addon_Saturas_TalkedToGhost, " What are these Halls of Adanos? " ,DIA_Addon_Saturas_TalkedToGhost_kammern);
};

func void DIA_Addon_Saturas_TalkedToGhost_wasistdas()
{
	AI_Output(other,self, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_15_00 " );	// What is Beliar's Claw?
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_01 " );	// The embodiment of pure evil. Beliar forged this sword with his own hands.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_02 " );	// The owner of the sword gets his hands on a terrible weapon of destruction.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_03 " );	// And the more powerful the owner, the greater the power of the Claw becomes.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_04 " );	// Only the most adamant and strong-willed can resist him.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_05 " );	// Now I understand why the architects closed their valley.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_06 " );	// They let a weapon of evil into this world and succumbed to its dark influence.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_07 " );	// Anger and greed made them destroy each other.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_08 " );	// Finally, Adanos' patience wore out, and he unleashed his wrath on the valley, drowning it in the sea.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_09 " );	// The creators of the portal acted wisely, hiding the city from the rest of the world.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_10 " );	// What a tragic end to ancient culture!
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_11 " );	// Do you understand the importance of your task now?
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_12 " );	// Raven is a seasoned fighter, and his lust for power has blinded him.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_13 " );	// In his hands, the Claw will be an unstoppable weapon of destruction.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_wasistdas_14_14 " );	// The raven must not get the claw or all will be lost.
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	B_LogEntry(TOPIC_Addon_Klaue, " There is a powerful weapon in the temple of Adanos. It's called the 'Claw of Beliar'. Raven must not get his hands on it! " );
};

func void DIA_Addon_Saturas_TalkedToGhost_kammern()
{
	AI_Output(other,self, " DIA_Addon_Saturas_TalkedToGhost_kammern_15_00 " );	// What are these Halls of Adanos?
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_kammern_14_01 " );	// Now we know that not only the gates close access to what is hidden in the depths of the temple.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_kammern_14_02 " );	// On your way there will be three halls, each of which is designed to destroy any uninvited guest.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_kammern_14_03 " );	// The key to solving the mysteries of the Halls of Adanos is the colored relics of the Builders.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_kammern_14_04 " );	// When you collect all the relics and understand what the inscriptions on them say, you can enter the inner sanctuary of the temple.
	AI_Output(self,other, " DIA_Addon_Saturas_TalkedToGhost_kammern_14_05 " );	// I don't know if Raven was able to solve the temple's puzzles, but if he did, then we're in big trouble.
	Log_CreateTopic(TOPIC_Addon_Kammers, LOG_MISSION );
	Log_SetTopicStatus(TOPIC_Addon_Kammern,LOG_Running);
	B_LogEntry(TOPIC_Addon_Kammers,LogText_Addon_Relicts);
	Log_CreateTopic(TOPIC_Addon_Relicts,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Relicts,LOG_Running);
	B_LogEntry_Quiet(TOPIC_Addon_Relicts,LogText_Addon_Relicts);
	Saturas_KnowsHow2GetInTempel = TRUE ;
};

instance DIA_Addon_Saturas_RelictsBack(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_RelictsBack_Condition;
	information = DIA_Addon_Saturas_RelictsBack_Info;
	description = " How exactly will the relics help me in the temple? " ;
};


func int DIA_Addon_Saturas_RelictsBack_Condition()
{
	if ((Saturas_SCBroughtAllToken ==  TRUE ) && (Saturas_KnowsHow2GetInTemple ==  TRUE ) && (RavenAway ==  FALSE ))
	{
		return TRUE;
	};
	return  FALSE ;
};

func void DIA_Addon_Saturas_RelictsBack_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_RelictsBack_15_00 " );	// How exactly will the relics help me in the temple?
	AI_Output(self,other, " DIA_Addon_Saturas_RelictsBack_14_03 " );	// We don't know enough for me to tell you this. I hope that, once in the temple, you will understand everything yourself.
	AI_Output(self,other, " DIA_Addon_Saturas_RelictsBack_14_05 " );	// Sorry, but I can't say more. Now everything depends on you.
	AI_Output(self,other, " DIA_Addon_Saturas_RelictsBack_14_06 " );	// Take the relics and head to the temple as soon as possible.
	CreateInvItems(hero,ItMi_Addon_Stone_01,1);
	CreateInvItems(hero,ItMi_Addon_Stone_02,1);
	CreateInvItems(hero,ItMi_Addon_Stone_03,1);
	CreateInvItems(hero,ItMi_Addon_Stone_04,1);
	CreateInvItems(hero,ItMi_Addon_Stone_05,1);
	B_GiveInvItemsManyThings(self,other);
	B_LogEntry(TOPIC_Addon_Kammern, " Saturas sent me with five relics to the temple of Adanos to pass the chambers and stop the Raven. " );
	AI_Output(self,other, " DIA_Addon_Saturas_RelictsBack_14_07 " );	// May the mercy of Adanos protect us!
	AI_Output(self,other, " DIA_Addon_Saturas_RelictsBack_14_08 " );	// Maybe it's not too late.
};

instance DIA_Addon_Saturas_RavensDead(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_RavensDead_Condition;
	information = DIA_Addon_Saturas_RavensDead_Info;
	important = TRUE;
};


func int DIA_Addon_Saturas_RavensDead_Condition()
{
	if(RavenIsDead == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_RavensDead_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other, " DIA_Addon_Saturas_RavensDead_14_00 " );	// The earthquakes have stopped, and I see you are still alive.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_01");	//Это значит, что ты сделал то, что должен был сделать?
	AI_Output(other,self,"DIA_Addon_Saturas_RavensDead_15_02");	//Да! Ворон мертв.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_03");	//Значит, все кончено. Слава Аданосу!
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_04");	//Ты сделал славное дело, сын мой. Мы все перед тобой в долгу.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_05");	//Ты вырвал мощное оружие из лап зла и восстановил равновесие в этой части мира.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_06");	//Когда закончились землетрясения, мы обсудили план дальнейших действий и пришли к соглашению.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_07");	//Возьми Коготь Белиара. Отныне - ты его хозяин!
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_08");	//В твоих руках он станет орудием справедливости.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_09");	//Используй его разумно, сын мой. И да поможет тебе Аданос.
	AI_Output(self,other,"DIA_Addon_Saturas_RavensDead_14_11");	//Мы останемся здесь и восстановим храм во всем его прежнем великолепии.
	MIS_AdanosCrone = LOG_Success;
	Log_SetTopicStatus(TOPIC_AdanosCrone,LOG_Success);
	B_LogEntry(TOPIC_AdanosCrone,"Я сообщил Сатурасу, что Ворон мертв.");
};

instance DIA_Addon_Saturas_MixyrBack(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_MixyrBack_Condition;
	information = DIA_Addon_Saturas_MixyrBack_Info;
	description = " Vatras needs help in the city. " ;
};

func int DIA_Addon_Saturas_MixyrBack_Condition()
{
	if(MIS_VatrasAbloesung == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_MixyrBack_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Saturas_MixyrBack_01_01 " );		// Vatras needs help in the city.
	AI_Output(self,other, " DIA_Addon_Saturas_RavensDead_14_12 " );	// Only Mixer went back! He will help Vatras.
	AI_Output(self,other, " DIA_Addon_Saturas_RavensDead_14_13 " );	// Vatras has been alone in the city for too long.
	MyxirIsBack = TRUE;
	B_LogEntry(TOPIC_Addon_VatrasAbloesung, " Mixir was sent to help Vatras. " );
	AI_Teleport(KDW_14030_Addon_Myxir_ADW,"TOT");
	Npc_ExchangeRoutine(KDW_14030_Addon_Myxir_ADW,"TOT");
};

instance DIA_Addon_Saturas_FreedMissingPeople(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = DIA_Addon_Saturas_FreedMissingPeople_Condition;
	information = DIA_Addon_Saturas_FreedMissingPeople_Info;
	description = " I freed the captives. " ;
};

func int DIA_Addon_Saturas_FreedMissingPeople_Condition()
{
	if(MissingPeopleReturnedHome == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_FreedMissingPeople_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_FreedMissingPeople_15_00 " );	// I freed the captives.
	AI_Output(self,other, " DIA_Addon_Saturas_FreedMissingPeople_14_01 " );	// Very good. Hope they get home safe and sound.
	B_GivePlayerXP(XP_Addon_Saturas_FreedMissingPeople);
};


instance DIA_Addon_Saturas_BeliarsWeapon(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_BeliarsWeapon_Condition;
	information = DIA_Addon_Saturas_BeliarsWeapon_Info;
	description = " I took the Claw of Beliar. " ;
};

func int DIA_Addon_Saturas_BeliarsWeapon_Condition()
{
	if((RavenIsDead == TRUE) && C_ScHasBeliarsWeapon())
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_BeliarsWeapon_Info()
{
	AI_UnequipWeapons(hero);
	AI_Output(other,self, " DIA_Addon_Saturas_BeliarsWeapon_15_00 " );	// I took the Claw of Beliar.

	if(Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) && (SC_FailedToEquipBeliarsWeapon == TRUE))
	{
		AI_Output(other,self, " DIA_Addon_Saturas_BeliarsWeapon_15_01 " );	// But I can't use it!
	};

	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_14_02 " );	// Beliar's Claw is an unusual weapon.
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_14_03 " );	// He has his own mind and his own will.
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_14_04 " );	// Being its owner, you become its master and master.
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_14_05 " );	// And it becomes a part of you and adapts to your capabilities.
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_14_06 " );	// However, he will not do this of his own free will.
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_14_07 " );	// Only Beliar himself can force him to submit to you.
	AI_Output(other,self, " DIA_Addon_Saturas_BeliarsWeapon_besser_15_00 " );	// How can I get Beliar to help me?
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_besser_14_01 " );	// This can be achieved by praying to him.
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_besser_14_02 " );	// But be careful! Beliar is angry and cunning.
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_besser_14_03 " );	// If you displease him, he will unleash his wrath on you.
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_besser_14_04 " );	// Yes, and one more thing you should know...
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_besser_14_05 " );	// Don't assume that the Dark God will force Talon to bend to your will just because you want to.
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_besser_14_06 " );	// If his mercy to you is too small, then he won't even listen to all your prayers.
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_besser_14_07 " );	// Only with the favor of the Dark God will you be able to subdue this weapon!
	Log_CreateTopic(TOPIC_Addon_Klaue,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_Klaue,LOG_Running);
	Log_AddEntry(TOPIC_Addon_Klaue, " To bend Talon to my will, I must pray to Beliar. " );
	Info_ClearChoices(DIA_Addon_Saturas_BeliarsWeapon);
	Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon, " What should I do with this weapon? " ,DIA_Addon_Saturas_BeliarsWeapon_wastun);
};

func void DIA_Addon_Saturas_BeliarsWeapon_wastun()
{
	AI_Output(other,self, " DIA_Addon_Saturas_BeliarsWeapon_wastun_15_00 " );	// What should I do with this weapon?
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_wastun_14_01 " );	// You decide. You have conquered the sword and you are now its master.

	if(TASKFINDCLAW == FALSE)
	{
		AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_wastun_14_02 " );	// I can only give you advice.
		AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_wastun_14_03 " );	// You can either give it to me and I'll make sure it never falls into evil hands again...
		AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_wastun_14_04 " );	// ...or harness its power and use the sword in battle.
		Info_ClearChoices(DIA_Addon_Saturas_BeliarsWeapon);
		Info_AddChoice(DIA_Addon_Saturas_BeliarsWeapon, " Can you keep the sword? " ,DIA_Addon_Saturas_BeliarsWeapon_geben);
	};
};

func void DIA_Addon_Saturas_BeliarsWeapon_geben()
{
	AI_Output(other,self, " DIA_Addon_Saturas_BeliarsWeapon_geben_15_00 " );	// Can you keep the sword?
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_geben_14_03 " );	// If you give it to me, I will strip the sword of its powers, and it can never serve evil again.
	AI_Output(self,other, " DIA_Addon_Saturas_BeliarsWeapon_geben_14_04 " );	// So decide. The choice is yours.
	SaturasTakeClaw = TRUE;
	B_LogEntry(TOPIC_Addon_Klaue, " I can give the Claw of Beliar to Saturas or keep it for myself. " );
};

instance DIA_Addon_Saturas_PermENDE_ADDON (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_PermENDE_ADDON_Condition;
	information = DIA_Addon_Saturas_PermENDE_ADDON_Info;
	permanent = TRUE;
	description = " What would you like to do next? " ;
};

func int DIA_Addon_Saturas_PermENDE_ADDON_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Addon_Saturates_RavensDead ) && ( INVASIONSTART  ==  FALSE )) ;
	{
		return TRUE;
	};
};

var int DIA_Addon_Saturas_PermENDE_ADDON_OneTime;

func void DIA_Addon_Saturas_PermENDE_ADDON_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_PermENDE_ADDON_15_00 " );	// What would you like to do next?
	AI_Output(self,other, " DIA_Addon_Saturas_PermENDE_ADDON_14_01 " );	// We will stay here and restore the temple to its former glory.
	AI_Output(self,other, " DIA_Addon_Saturas_PermENDE_ADDON_14_02 " );	// It's been in such a sorry state for too long.
	if (DIA_Addon_Saturas_PermENDE_ADDON_OneTime ==  FALSE )
	{
		AI_Output(self,other, " DIA_Addon_Saturas_PermENDE_ADDON_14_03 " );	// If you're interested, my son...
		AI_Output(self,other, " DIA_Addon_Saturas_PermENDE_ADDON_14_04 " );	// I'm glad I didn't mistake you. You are the true Keeper of Balance. I no longer have any doubts about it.
		AI_Output(self,other, " DIA_Addon_Saturas_PermENDE_ADDON_14_05 " );	// If not for your courage and strength, the entire island would have been destroyed. We thank you for your great work.
		AI_Output(self,other, " DIA_Addon_Saturas_PermENDE_ADDON_14_06 " );	// Now you must devote yourself to other tasks and restore peace and balance to our lands.
		AI_Output(self,other, " DIA_Addon_Saturas_PermENDE_ADDON_14_07 " );	// Go and fulfill your destiny, Guardian. We will pray for you.
		DIA_Addon_Saturas_PermENDE_ADDON_OneTime = TRUE ;
	};
};

instance DIA_Addon_Saturas_BeliarWeapGeben(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = DIA_Addon_Saturas_BeliarWeapGeben_Condition;
	information = DIA_Addon_Saturas_BeliarWeapGeben_Info;
	description = "Возьми Коготь Белиара и уничтожь его.";
};

func int DIA_Addon_Saturas_BeliarWeapGeben_Condition()
{
	if(C_ScHasBeliarsWeapon() && (RavenIsDead == TRUE) && (SaturasTakeClaw == TRUE) && (TASKFINDCLAW == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_BeliarWeapGeben_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGeben_15_00");	//Возьми Коготь Белиара и уничтожь его.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_01");	//Как скажешь, сын мой. Дай мне Коготь.
	B_ClearBeliarsWeapon();
	AI_Print(b_formgivestring(other,1));
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_02");	//Чтобы оно больше никому не причинило зла, я погружу его на дно морское.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGeben_14_03");	//Мудрость Аданоса будет охранять его.
	TOPIC_END_Klaue = TRUE;
	B_GivePlayerXP(XP_Addon_BeliarsWeaponAbgegeben);
	Saturas_KlaueInsMeer = TRUE;
};


instance DIA_ADDON_SATURAS_BELIARWEAPGEBENBACK(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 5;
	condition = dia_addon_saturas_beliarweapgebenback_condition;
	information = dia_addon_saturas_beliarweapgebenback_info;
	permanent = FALSE;
	description = "Коготь еще у тебя?!";
};

func int dia_addon_saturas_beliarweapgebenback_condition()
{
	if((Saturas_KlaueInsMeer == TRUE) && (TASKFINDCLAW == TRUE) && (MIS_GOLDDRAGONPORTAL == LOG_Running) && !Npc_KnowsInfo(other,dia_dragon_gold_whatman))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_beliarweapgebenback_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGebenBack_15_00");	//Коготь еще у тебя?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_01");	//Да, он все еще у меня.
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_02");	//Ты же собирался его уничтожить.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_03");	//Уничтожить Коготь оказалось мне не под силу, и я пока не знаю, каким образом это можно сделать.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_04");	//Но мудрость Аданоса подскажет мне, как следует поступить. А почему ты спрашиваешь?
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_05");	//Мне он очень нужен. Ты не мог бы мне его вернуть?
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_06");	//(удивленно) Но зачем?
	AI_Output(other,self,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_07");	//Поверь, это дело очень большой важности.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_08");	//Твои слова звучат странно, однако у меня нет причин не верить тебе.
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_09");	//Если тебе и вправду он так необходим, то вот, возьми его.
	B_GiveInvItems(self,other,ItMw_BeliarWeapon_Raven,1);
	AI_Output(self,other,"DIA_Addon_Saturas_BeliarWeapGebenBack_14_12");	//Надеюсь, ты знаешь, что делаешь.
};

instance DIA_ADDON_SATURAS_CANBEWATERMAGE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_canbewatermage_condition;
	information = dia_addon_saturas_canbewatermage_info;
	permanent = FALSE;
	description = "Могу ли я просить робу мага Воды, мастер?";
};

func int dia_addon_saturas_canbewatermage_condition()
{
	if(hero.guild == GIL_NDW)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_canbewatermage_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_CanBeWaterMage_14_00");	//Могу ли я просить робу мага Воды, мастер?

	if(ATR_INTELLECT >= 40)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_01");	//Да! Думаю, время пришло.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_02");	//За все то время, что ты был послушником, ты зарекомендовал себя с лучшей стороны.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_03");	//И доказал, что готов следовать заветам Аданоса даже ценой своей собственной жизни.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_04");	//Я считаю, что ты готов принять этот божественный дар и вступить в Круг магов Воды.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_05");	//Но ты должен понимать обдуманность своего решения и не сомневаться в своем выборе.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_06");	//Думаю, тебе нужно время, чтобы по-настоящему обдумать этот шаг.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_07");	//Никто не ограничивает тебя во времени.
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_08");	//А когда окончательно придешь к этому решению, обратись ко мне, и я введу тебя в Священный Круг избранных служителей Аданоса.
	}
	else
	{
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_09");	//Время еще не пришло...
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_10");	//Сила твоего ума еще недостаточна для этого.
		Log_CreateTopic(TOPIC_KDW_Accept,LOG_NOTE);
		B_LogEntry(TOPIC_KDW_Accept,"По мнению Сатураса, мне еще не хватает опыта для вступления в Круг магов Воды. (Требование: не менее 40 единиц интеллекта)");
	};
};

instance DIA_ADDON_SATURAS_BEWATERMAGE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_bewatermage_condition;
	information = dia_addon_saturas_bewatermage_info;
	permanent = TRUE;
	description = "Я готов стать магом Воды.";
};

func int dia_addon_saturas_bewatermage_condition()
{
	if(Npc_KnowsInfo(other,dia_addon_saturas_canbewatermage) && (hero.guild == GIL_NDW))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_bewatermage_info()
{
	if(ATR_INTELLECT < 40)
	{
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_09");	//Время еще не пришло...
		AI_Output(self,other,"DIA_Addon_Saturas_CanBeWaterMage_14_10");	//Сила твоего ума еще недостаточна для этого.
	}
	else
	{
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_00");	//Я готов стать магом Воды.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_01");	//Твое решение обдуманно и окончательно?
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_02");	//Да.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_03");	//Помни, что я тебе говорил, - это выбор не на день или на месяц, а на всю жизнь. Ты понимаешь это?
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_04");	//Да.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_05");	//Хорошо. Готов ли ты принести клятву?
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_06");	//Я готов.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_07");	//Тогда приготовься получить благословение Воды и Аданоса!
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_08");	//Повторяй за мной слова клятвы:
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_09");	//Мощью богов я клянусь...
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_10");	//Мощью богов я клянусь...
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_11");	//...и силой священной Воды...
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_12");	//...и силой священной Воды...
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_13");	//...что знания и действия мои будут служить Воде отныне и до скончания веков...
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_14");	//...что знания и действия мои будут служить Воде отныне и до скончания веков...
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_15");	//...до тех пор, пока мое бренное тело не обретет покой в чертогах Белиара и не иссякнет источник моей жизни.
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_16");	//...до тех пор, пока мое бренное тело не обретет покой в чертогах Белиара и не иссякнет источник моей жизни.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_17");	//Эта клятва дала тебе силу и благословение Воды.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_18");	//Возьми это одеяние и носи его в знак связи со священной Водой и с Аданосом.
		CreateInvItems(self,ITAR_KDW_L_Addon,1);
		B_GiveInvItems(self,other,ITAR_KDW_L_Addon,1);
		other.guild = GIL_KDW;
		CheckHeroGuild[0] = TRUE;
		Snd_Play("GUILD_INV");
		Mdl_ApplyOverlayMds(hero,"Humans_Mage.mds");
		B_GivePlayerXP(XP_BecomeMage);
		ATR_INTELLECT += 10;
		Npc_SetTalentSkill(self,NPC_TALENT_INTELLECT,ATR_INTELLECT);
		AI_PrintClr("Интеллект + 10",83,152,48);
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_1A");	//Также прими от меня этот посох. Только нам, магам Воды дарована честь обладать им и распоряжаться его силой.
		CreateInvItems(self,ITMW_2H_G3_STAFFWATER_01,1);
		B_GiveInvItems(self,other,ITMW_2H_G3_STAFFWATER_01,1);
		AI_Output(other,self,"DIA_Addon_Saturas_BeWaterMage_14_19");	//И каковы теперь мои обязанности?
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_20");	//Теперь твоя основная обязанность - нести добро и божественную мудрость Аданоса всему живому.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_21");	//Будь мудр в своих поступках и помни про ту ответственность, которую на тебя возлагает твой нынешний статус.
		AI_Output(self,other,"DIA_Addon_Saturas_BeWaterMage_14_22");	//Да пребудет с тобой, Аданос, брат.
		AI_StopProcessInfos(self);
	};
};

instance DIA_Addon_Saturas_ADW_PreTeachCircle(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 10;
	condition = DIA_Addon_Saturas_ADW_PreTeachCircle_Condition;
	information = DIA_Addon_Saturas_ADW_PreTeachCircle_Info;
	permanent = FALSE;
	description = "Ты обучить меня Кругам магии?";
};


func int DIA_Addon_Saturas_ADW_PreTeachCircle_Condition()
{
	if(hero.guild == GIL_KDW)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_PreTeachCircle_Info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_PreTeachCircle_15_00");	//Ты обучить меня Кругам магии?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_10");	//Поскольку теперь ты являешься магом Воды, то я с превеликим удовольствием введу тебя в магические Круги.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_11");	//Кроме того, Нефариус может научить тебя создавать руны нашей стихии, а Мердарион поможет тебе повысить твою магическую силу.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_12");	//У Кроноса всегда найдется для тебя пара магических свитков магии Воды. Риордиан же научит тебя варить различные эликсиры.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_PreTeachCircle_14_13");	//И, естественно, ты всегда можешь рассчитывать на нашу помощь, брат.
	Saturas_Addon_TeachCircle = TRUE;
	Log_CreateTopic(TOPIC_Addon_KDWTeacher,LOG_NOTE);
	B_LogEntry(TOPIC_Addon_KDWTeacher,LogText_Addon_SaturasTeach);
};


instance DIA_ADDON_SATURAS_ADW_EXPLAINCIRCLES(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	condition = dia_addon_saturas_adw_explaincircles_condition;
	information = dia_addon_saturas_adw_explaincircles_info;
	important = FALSE;
	permanent = FALSE;
	description = "Объясни мне, в чем смысл магических Кругов?";
};


func int dia_addon_saturas_adw_explaincircles_condition()
{
	if((hero.guild == GIL_KDW) && Npc_KnowsInfo(other,DIA_Addon_Saturas_ADW_PreTeachCircle))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_explaincircles_info()
{
	AI_Output(other,self,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_15_01");	//Объясни мне, в чем смысл магических Кругов?
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_02");	//С удовольствием. Круги символизируют твое понимание магии.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_03");	//Они обозначают уровень твоих знаний и навыков, способность обучаться новым заклинаниям.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_04");	//Ты должен пройти каждый Круг до конца, прежде чем сможешь вступить в следующий.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_05");	//Потребуются долгие часы обучения и намного больше опыта, чтобы достичь высших Кругов.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_06");	//Твои старания каждый раз будут вознаграждаться новыми могущественными заклинаниями. Но в любом случае магические Круги значат куда больше.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_07 " );	// They are part of your life. They will always be with you. Make them part of you.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_EXPLAINCIRCLES_Info_14_08 " );	// In order to understand their power, you must know yourself.
	EXPLAINCIRCLEMEAN = TRUE;
};


instance DIA_ADDON_SATURAS_ADW_TEACHFIRSTCIRCLE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 10;
	condition = dia_addon_saturas_adw_teachfirstcircle_condition;
	information = dia_addon_saturas_adw_teachfirstcircle_info;
	permanent = TRUE;
	description = " Teach me the first circle of magic. (Learning points: 20) " ;
};


func int dia_addon_saturas_adw_teachfirstcircle_condition()
{
	if (( hero . guild ==  GIL_KDW ) && ( Npc_GetTalentSkill ( hero , NPC_TALENT_MAGE ) <  1 ) && ( Saturates_Addon_TeachCircle ==  TRUE )) ;
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_teachfirstcircle_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_TeachFirstCircle_01_00 " );	// Teach me the first circle of magic.

	if(B_TeachMagicCircle(self,other,1))
	{
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_TeachFirstCircle_01_03 " );	// By joining the First Circle, you will learn how to use magical runes.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_TeachFirstCircle_01_04 " );	// Each rune contains the structure of a special magic spell.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_TeachFirstCircle_01_05 " );	// By using your own magical power, you can release the rune's magic.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_TeachFirstCircle_01_06 " );	// But unlike scrolls, which are essentially magic formulas, rune magic maintains the structure of the spell at all times.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_TeachFirstCircle_01_07 " );	// Each rune contains a magical power that you can take away at any time.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_TeachFirstCircle_01_08 " );	// Just like with the scroll, the moment you use a rune, your own magic power is consumed.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_TeachFirstCircle_01_09 " );	// With each new Circle you will learn more and more about runes.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_TeachFirstCircle_01_10 " );	// Use their power to know yourself.
	};
};


instance DIA_Addon_Saturas_ADW_CIRCLE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 99;
	condition = DIA_Addon_Saturas_ADW_CIRCLE_Condition;
	information = DIA_Addon_Saturas_ADW_CIRCLE_Info;
	permanent = TRUE;
	description = " I want to go to the next level of magic. " ;
};

var int DIA_Addon_Saturas_ADW_CIRCLE_NoPerm;

func int DIA_Addon_Saturas_ADW_CIRCLE_Condition()
{
	if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE ) >=  1 ) && (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE ) <=  6 ) && (Saturas_Addon_TeachCircle ==  TRUE ) && (DIA_Addon_Saturas_ADW_CIRCLE_NoPerm ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_CIRCLE_Info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_CIRCLE_15_00 " );	// I want to go to the next level of magic.
	Info_ClearChoices(DIA_Addon_Saturates_ADW_CIRCLE);
	Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE,Dialog_Back,DIA_Addon_Saturas_ADW_CIRCLE_Back);

	if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE ) ==  1 ) && (Chapter >=  2 )) .
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE, " 2 Circle of Magic (Training Points: 30) " ,DIA_Addon_Saturas_ADW_CIRCLE_2);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 2) && (Kapitel >= 3))
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE, " 3 Circle of Magic (Training Points: 40) " ,DIA_Addon_Saturas_ADW_CIRCLE_3);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 3) && (MIS_ReadyforChapter4 == TRUE))
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE, " 4 Circle of Magic (Training Points: 60) " ,DIA_Addon_Saturas_ADW_CIRCLE_4);
	}
	else if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 4) && (Kapitel >= 5))
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE, " 5 Circle of Magic (Training Points: 80) " ,DIA_Addon_Saturas_ADW_CIRCLE_5);
	}
	else  if ((Npc_GetTalentSkill(hero, NPC_TALENT_MAGE ) ==  5 ) && (Chapter >=  5 ) && (MY_DarkOrder == LOG_Success) && (MY_JarCurse == LOG_Success) && ( MY_URNAZULRAGE  ==  LOG_SUCCESS )) ;
	{
		Info_AddChoice(DIA_Addon_Saturas_ADW_CIRCLE, " 6 Circle of Magic (Training Points: 100) " ,DIA_Addon_Saturas_ADW_CIRCLE_6);
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_CIRCLE_14_12 " );	// You're not ready for this yet! Come back later.
	};
};

func void DIA_Addon_Saturas_ADW_CIRCLE_Back()
{
	Info_ClearChoices(DIA_Addon_Saturates_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_2()
{
	if(B_TeachMagicCircle(self,other,2))
	{
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_CIRCLE_14_01 " );	// Yes, you are ready to increase your knowledge.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_02");	//Вступи же во Второй Круг магии! Да поможет тебе Аданос мудро распоряжаться дарованными тебе знаниями.
	};
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_3()
{
	if(B_TeachMagicCircle(self,other,3))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_03");	//Время пришло. Вступи же в Третий Круг магии!
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_04");	//Теперь ты сможешь применять более мощные заклинания. Используя их, будь рассудителен.
	};
	Info_ClearChoices(DIA_Addon_Saturas_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_4()
{
	if(B_TeachMagicCircle(self,other,4))
	{
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_05");	//Время пришло. Ты готов вступить в Четвертый Круг магии.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_06");	//Да будут могущественными твои слова и деяния. Но не используй свои силы безрассудно.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_0A");	//И еще кое-что. Войдя в четвертый круг магии, ты удостаиваешься чести носить облачение высших магов Воды.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_CIRCLE_14_0B");	//Немногим удавалось такое. Теперь ты - один из избранных Аданоса!
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_CIRCLE_14_0C " );	// Here, take this robe and magic staff.
		CreateInvItems(hero,ItMW_Addon_Stab02,1);
		CreateInvItems(self,itar_kdw_h,1);
		B_GiveInvItems(self,other,itar_kdw_h,1);
	};
	Info_ClearChoices(DIA_Addon_Saturates_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_5()
{
	if(B_TeachMagicCircle(self,other,5))
	{
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_CIRCLE_14_07 " );	// You have been honored to enter the Fifth Circle of Magic.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_CIRCLE_14_08 " );	// The spells that will be revealed to you have tremendous destructive power.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_CIRCLE_14_09 " );	// Keep yourself under control! Don't let megalomania take over you.
	};
	Info_ClearChoices(DIA_Addon_Saturates_ADW_CIRCLE);
};

func void DIA_Addon_Saturas_ADW_CIRCLE_6()
{
	if(B_TeachMagicCircle(self,other,6))
	{
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_CIRCLE_14_13 " );	// It's been a long time since you chose the path of Adanos. You have learned a lot and learned a lot of secrets!
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_CIRCLE_14_14 " );	// It's time to master the last knowledge that our patron grants us.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_CIRCLE_14_15 " );	// You pass into the Sixth Circle - with it you will master the most powerful spells of the Waterbenders.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_CIRCLE_14_16 " );	// Note that only the most powerful of magicians can enter the Sixth Circle. It is for those whose life is a sign.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_CIRCLE_14_17 " );	// Your sign is Water!
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_CIRCLE_14_18 " );	// The Sixth Circle will allow you to use the magic of any rune.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_CIRCLE_14_19 " );	// And don't forget: don't capture power, but be its source.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_CIRCLE_14_20 " );	// Be wise and prudent in your actions and try to use your knowledge for the benefit of the light and Adanos!
		DIA_Addon_Saturas_ADW_CIRCLE_NoPerm = TRUE ;
	};
	Info_ClearChoices(DIA_Addon_Saturates_ADW_CIRCLE);
};

instance DIA_ADDON_SATURAS_MAXROBE (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_MAXROBE_condition;
	information = dia_addon_saturas_MAXROBE_info;
	permanent = FALSE;
	description = " How about a better robe? " ;
};

func int dia_addon_saturas_MAXROBE_condition()
{
	if ((hero.guild ==  GIL_KDW ) && (Chapter >=  5 ) && (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE ) ==  6 ) && (LastRobeKDW ==  FALSE ) && (MAXROBE_Permanent ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_addon_saturas_MAXROBE_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_MAXROBE_01_00 " );	// How about a better robe?
	AI_Output(self,other, " DIA_Addon_Saturas_MAXROBE_01_01 " );	// Since you are proficient with all six Circles of Magic, you are worthy to wear the robe of the archmage of Water.
	AI_Output(self,other, " DIA_Addon_Saturas_MAXROBE_01_02 " );	// However, you will have to pay for it. It's too expensive to make for us to give away.
	AI_Output(other,self,"DIA_Addon_Saturas_MAXROBE_01_03");	//Понимаю.
	LastRobeKDW = TRUE;
};

instance DIA_ADDON_SATURAS_MAXROBE_Buy(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_MAXROBE_Buy_condition;
	information = dia_addon_saturas_MAXROBE_Buy_info;
	permanent = TRUE;
	description = " Sell me the Robe of the Archmage of Water. (Price: 20000 coins) " ;
};

func int dia_addon_saturas_MAXROBE_Buy_condition()
{
	if (( hero . guild ==  GIL_KDW ) && ( LastRobe_KDW ==  TRUE ) && ( MAXROBE_Permanent ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_MAXROBE_Buy_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_MAXROBE_Buy_01_00 " );	// Sell me the robe of the Archmage of Water.

	if(Npc_HasItems(hero,ItMi_Gold) >= 20000)
	{
		B_GiveInvItems(other,self,ItMi_Gold,20000);
		Npc_RemoveInvItems(self,ItMi_Gold,20000);
		AI_Output(self,other, " DIA_Addon_Saturas_MAXROBE_Buy_01 " );	// Good! Hold her.
		AI_Output(self,other, " DIA_Addon_Saturas_MAXROBE_Buy_02 " );	// This is a huge honor! Remember this.
		CreateInvItems(self,itar_kdw_sh,1);
		B_GiveInvItems(self,other,itar_kdw_sh,1);
		MAXROBE_Permanent = TRUE;
	}
	else
	{
		AI_Output(self,other, " DIA_Addon_Saturas_MAXROBE_Buy_01_03 " );	// You don't have enough gold.
	};
};

instance DIA_ADDON_SATURAS_KAPITEL3 (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_kapitel3_condition;
	information = dia_addon_saturas_kapitel3_info;
	permanent = FALSE;
	description = " How are you getting on with exploring the city? " ;
};

func int dia_addon_saturas_kapitel3_condition()
{
	if ((Capital ==  3 ) && (RavenAway ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_kapitel3_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_Kapitel3_15_00 " );	// How are things going with exploring the city?
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel3_14_01 " );	// Work progresses slowly.
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel3_14_02 " );	// The bandits in the swamp really interfere with us.
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel3_14_03 " );	// Because of them, we can't start exploring the Temple of Adanos yet.
};


instance DIA_ADDON_SATURAS_KAPITEL4 (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_kapitel4_condition;
	information = dia_addon_saturas_kapitel4_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_kapitel4_condition()
{
	if ((Chapter >=  4 ) && (RavenAway ==  TRUE ) && ( AWORCINVASIONSTART  ==  FALSE ) && ( CHAPTERORCATC  ==  FALSE )) .
	{
		return TRUE;
	};
};

func void dia_addon_saturas_chapter4_info()
{
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel4_01_01 " );	// Glory to Adanos - you've come!
 	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel4_01_02 " );	// Terrible things have happened here lately.
 	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel4_01_04 " );	// Orcs have invaded the sacred land of Adanos!
	AI_Output(other,self, " DIA_Addon_Saturas_Kapitel4_01_05 " );	// Orcs? Here?
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel4_01_06 " );	// Yes, and a lot. Looks like they came here on ships.
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel4_01_09 " );	// They filled almost the entire valley. And it's only a matter of time before they get here.
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel4_01_11 " );	// And if they find a portal to Khorinis... I can't even imagine what could happen!
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel4_01_13 " );	// You must help us.
	AI_Output(other,self, " DIA_Addon_Saturas_Kapitel4_01_14 " );	// What can I do?
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel4_01_15 " );	// Those orcs that have appeared here are not like the usual reconnaissance groups.
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel4_01_16 " );	// Most likely, this is a fully combat-ready army. And the actions of each army must be coordinated by someone.
	AI_Output(other,self, " DIA_Addon_Saturas_Kapitel4_01_17 " );	// What are you getting at?
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel4_01_18 " );	// The best way to deal with a monster is to cut off its head!
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel4_01_23 " );	// A few days ago, we saw a couple of detachments heading to the ruins of ancient temples, to the west.
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel4_01_24 " );	// Another very large group of orcs headed towards the bandit camp.
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel4_01_25 " );	// That's all I know.
	AI_Output(other,self, " DIA_Addon_Saturas_Kapitel4_01_26 " );	// I'll see what I can do.
	AI_Output(self,other, " DIA_Addon_Saturas_Kapitel4_01_27 " );	// May Adanos bless you, my son.
	AWORCINVASIONSTART = TRUE;
	MY_ADW_ORCINVASION = LOG_Running;
	Log_CreateTopic(TOPIC_ADW_ORCINVASION,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ADW_ORCINVASION,LOG_Running);
	B_LogEntry( TOPIC_ADW_ORCINVASION , " Saturas told me terrible news. Orcs have come to the valley - almost an entire army. The Water Mages fear that they will soon find out about the portal leading to Khorinis, which cannot be allowed. Saturas asked me for help. army - suicide, he came up with a plan from which I should find and finish off the leaders of the horde. " );
	Log_AddEntry( TOPIC_ADW_ORCINVASION , " Saturas told me that he saw a couple of units go west towards the ancient ruins, and another one went east towards the bandit camp. " );
	AI_StopProcessInfos(self);
	B_RemoveNpc(BDT_1091_Addon_Lucia);
	B_KillNpc(BDT_1095_Addon_Crimson);
	B_KillNpc(BDT_10023_Addon_Wache);
	B_KillNpc(BDT_10024_Addon_Garaz);
	B_KillNpc(STRF_1131_Addon_Sklave);
	B_KillNpc(STRF_1132_Addon_Sklave);
	B_KillNpc(STRF_1133_Addon_Sklave);
	B_KillNpc(STRF_1134_Addon_Sklave);
	B_KillNpc(STRF_1135_Addon_Sklave);
	B_KillNpc(STRF_1128_Addon_Sklave);
	B_KillNpc(STRF_1129_Addon_Sklave);
	B_KillNpc(STRF_1130_Addon_Sklave);
	B_KillNpc(STRF_1136_Addon_Sklave);
	B_KillNpc(STRF_1137_Addon_Sklave);
	B_KillNpc(STRF_1138_Addon_Sklave);
	B_KillNpc(STRF_1139_Addon_Sklave);
	B_KillNpc(STRF_1140_Addon_Sklave);
	B_KillNpc(BDT_10025_Addon_Wache);
	B_KillNpc(BDT_10026_Addon_Wache);
	B_KillNpc(BDT_10027_Addon_Buddler);
	B_KillNpc(BDT_10028_Addon_Buddler);
	B_KillNpc(BDT_10029_Addon_Buddler);
	B_KillNpc(BDT_10030_Addon_Buddler);
	B_KillNpc(BDT_1093_Addon_Franco);
	B_KillNpc(BDT_10011_Addon_Bandit);
	B_KillNpc(BDT_10012_Addon_Bandit);
	B_KillNpc(BDT_1076_Addon_Bandit);
	B_KillNpc(BDT_1077_Addon_Bandit);
	B_KillNpc(BDT_1073_Addon_Sancho);
	B_KillNpc(BDT_1087_Addon_Bandit);
	B_KillNpc(BDT_1072_Addon_Logan);
	B_KillNpc(BDT_1074_Addon_Edgor);
	B_KillNpc(BDT_1078_Addon_Bandit);
	B_KillNpc(BDT_1071_Addon_Ramon);
	B_KillNpc(BDT_10004_Addon_Finn);
	B_KillNpc(BDT_1088_Addon_Torwache);
	B_KillNpc(BDT_1083_Addon_Esteban);
	B_KillNpc(BDT_1081_Addon_Wache_01);
	B_KillNpc(BDT_10005_Addon_Wache_02);
	B_KillNpc(BDT_1099_Addon_Huno);
	B_KillNpc(BDT_1070_Addon_Paul);
	B_KillNpc(BDT_1082_Addon_Skinner);
	B_KillNpc(BDT_1075_Addon_Fortune);
	B_KillNpc(BDT_1084_Addon_Senyan);
	B_KillNpc(BDT_10015_Addon_Emilio);
	B_KillNpc(BDT_1096_Addon_Lennar);
	B_KillNpc(BDT_1079_Addon_Carlos);
	B_KillNpc(BDT_10031_Addon_Wache);
	B_KillNpc(STRF_1141_Addon_Sklave);
	B_KillNpc(STRF_1142_Addon_Sklave);
	B_KillNpc(STRF_1143_Addon_Sklave);
	B_KillNpc(STRF_1144_Addon_Sklave);
	B_KillNpc(BDT_10001_Addon_Bandit_L);
	B_KillNpc(BDT_10002_Addon_Bandit_M);
	B_KillNpc(BDT_10003_Addon_Bandit_H);
	B_KillNpc(BDT_10006_Addon_Bandit);
	B_KillNpc(BDT_10007_Addon_Bandit);
	B_KillNpc(BDT_10008_Addon_Bandit);
	B_KillNpc(BDT_10009_Addon_Bandit);
	B_KillNpc(BDT_10010_Addon_Bandit);
	B_KillNpc(BDT_10018_Addon_Torwache);
	B_KillNpc(BDT_10019_Addon_Wache);
	B_KillNpc(BDT_10020_Addon_Wache);
	B_KillNpc(BDT_10021_Addon_Wache);

	if (Npc_IsDead(BDT_10022_Addon_Miguel) ==  FALSE )
	{
		AI_Teleport(BDT_10022_Addon_Miguel,"ADW_PIRATECAMP_CAVE3_92");
		Npc_ExchangeRoutine(BDT_10022_Addon_Miguel,"OrcInvasion");
		MIGUEL_TP = TRUE;
	};
	if (Npc_IsDead(BDT_1097_Addon_Fisk) ==  FALSE )
	{
		AI_Teleport(BDT_1097_Addon_Fisk,"ADW_PIRATECAMP_CAVE3_91");
		Npc_ExchangeRoutine(BDT_1097_Addon_Fisk,"OrcInvasion");
		FISK_TP = TRUE;
	};
	if (Npc_IsDead(BDT_1080_Addon_Tom) ==  FALSE )
	{
		AI_Teleport(BDT_1080_Addon_Tom,"ADW_PIRATECAMP_CAVE3_90");
		Npc_ExchangeRoutine(BDT_1080_Addon_Tom,"OrcInvasion");
		TOM_TP = TRUE;
	};
	if (Npc_IsDead(BDT_10014_Addon_Thorus) ==  FALSE )
	{
		AI_Teleport(BDT_10014_Addon_Thorus,"ADW_PIRATECAMP_CAVE3_01");
		Npc_ExchangeRoutine(BDT_10014_Addon_Thorus,"OrcInvasion");
		THORUS_TP = TRUE;
	};
	if (Npc_IsDead(BDT_1086_Addon_Scatty) ==  FALSE )
	{
		AI_Teleport(BDT_1086_Addon_Scatty,"ADW_PIRATECAMP_CAVE3_03");
		Npc_ExchangeRoutine(BDT_1086_Addon_Scatty,"OrcInvasion");
		SCATTY_TP = TRUE;
	};
	if (Npc_IsDead(BDT_1098_Addon_Snaf) ==  FALSE )
	{
		AI_Teleport(BDT_1098_Addon_Snaf,"ADW_PIRATECAMP_CAVE3_04");
		Npc_ExchangeRoutine(BDT_1098_Addon_Snaf,"OrcInvasion");
		SNAF_TP = TRUE;
	};
	if((Npc_IsDead(BDT_4568_KINJARTS) == FALSE) && (KinjartsIns == TRUE))
	{
		AI_Teleport(BDT_4568_KINJARTS,"ADW_PIRATECAMP_CAVE3_01");
		Npc_ExchangeRoutine(BDT_4568_KINJARTS,"Invasion");
	};

	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_01");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_03");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_05");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_07");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_09");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_11");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_12");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_14");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_16");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_18");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_20");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_22");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_24");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_26");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_28");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_30");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_32");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ORKINCAMP_35");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_37");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_39");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_41");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_43");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_45");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_47");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_49");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_51");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORKINCAMP_53");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORKINCAMP_55");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_57");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ORKINCAMP_59");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ENTRANCEORCGUARD_01");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ENTRANCEORCGUARD_03");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_05");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_07");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_09");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_ORKINCAMP_01");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_ORKINCAMP_03");
	Wld_InsertNpc(OrcShaman_Sit,"FP_CAMPFIRE_ORKINCAMP_05");
	Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_SWAMP_01");
	Wld_InsertNpc(OrcWarrior_Sit,"FP_CAMPFIRE_VP1_02");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCINADANOS_01");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ORCINADANOS_03");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ORCINADANOS_05");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ZOBIE_01");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ZOBIE_03");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ZOBIE_05");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_03");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_04");
	Wld_InsertNpc(orcshaman_leader4,"FP_CAMPFIRE_ELITEORCSHAMAN_04");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_19");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_21");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_23");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_25");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ENTRANCEORCGUARD_27");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_29");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ENTRANCEORCGUARD_31");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_RHADEMES_DEADBDT_02");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_RHADEMES");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_ENTRANCE_17");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_ENTRANCE_20");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_ENTRANCE_13");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_TREASUREPITS_05A");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_TREASUREPITS_05C");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_TREASUREPITS_05E");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_TREASUREPITS_09A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_TREASUREPITS_09C");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_ADANOSTEMPEL_TREASUREPITS_09E");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_RHADEMES_14A");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_RHADEMES_14C");
	Wld_InsertNpc(orkelite_addon1,"ADW_ADANOSTEMPEL_RHADEMES_14E");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_01");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_03");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_05");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_07");
	Wld_InsertNpc(orkelite_addon2,"FP_ROAM_ADANOSTEMPEL_ORC_09");
	Wld_InsertNpc(orkelite_adw_leader,"FP_CAMPFIRE_ADANOSTEMPEL_ORC_08");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_11");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_13");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_15");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ENTRANCEORCGUARD_17");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_LIBRARY_04");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_LIBRARY_LEFT_08");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_LIBRARY_LEFT_07");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_LIBRARY_RIGHT_07");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_LIBRARY_RIGHT_13");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_LIBRARY_STONIE_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_LIBRARY_STONIE_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_ORCS_08");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_PATH_TO_LIBRARY_14");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_CANYON_PATH_TO_LIBRARY_19");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_PATH_TO_LIBRARY_20");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_ORCS_05");
	Wld_InsertNpc(orkelite_addon2,"ADW_CANYON_ORCS_02");
	Wld_InsertNpc(OrcShaman_Sit,"ADW_CANYON_ORCS_02");
	Wld_InsertNpc(orcshaman_leader5,"FP_CAMPFIRE_ELITEORCSHAMAN_05");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_06");
	Wld_InsertNpc(orkelite_addon2,"ADW_SENAT_SIDE_01");
	Wld_InsertNpc(orkelite_addon2,"ADW_SENAT_SIDE_03");
	Wld_InsertNpc(orkelite_addon3,"ADW_SENAT_GUARDIAN_01");
	Wld_InsertNpc(orkelite_addon3,"ADW_SENAT_GUARDIAN_03");
	Wld_InsertNpc(orcshaman_leader3,"FP_CAMPFIRE_ELITEORCSHAMAN_03");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_02");
	Wld_InsertNpc(OrcWarrior_Roam,"STRAND");
	Wld_InsertNpc(orkelite_addon2,"ADW_VALLEY_PATH_131");
	Wld_InsertNpc(orkelite_addon3,"ADW_VALLEY_PATH_132_A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_134");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_135");
	Wld_InsertNpc(orcshaman_leader2,"FP_CAMPFIRE_ELITEORCSHAMAN_02");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_07");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_08");
	Wld_InsertNpc(orkelite_addon2,"ADW_VALLEY_PATH_064_A");
	Wld_InsertNpc(orkelite_addon2,"ADW_VALLEY_PATH_072");
	Wld_InsertNpc(orkelite_addon3,"ADW_VALLEY_PATH_073");
	Wld_InsertNpc(orcshaman_leader1,"FP_CAMPFIRE_ELITEORCSHAMAN_01");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_09");
	Wld_InsertNpc(orkelite_addon3,"FP_ROAM_ELITEORCSHAMANGUARD_10");
	Wld_InsertNpc(orkelite_addon1,"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc(orkelite_addon1,"ADW_CANYON_TELEPORT_PATH_09");
	Wld_InsertNpc(orkelite_addon1,"ADW_ENTRANCE_PATH2BANDITS_10");
	Wld_InsertNpc(orkelite_addon1,"ADW_ENTRANCE_PATH2BANDITS_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PORTALTEMPEL_08A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PORTALTEMPEL_08B");
	Wld_InsertNpc(orkelite_addon1,"ADW_BL_FLIES_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_BL_FLIES_06");
	Wld_InsertNpc(orkelite_addon1,"ADW_LITTLE_HILL_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_LITTLE_HILL_04");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_04");
	Wld_InsertNpc(orkelite_addon1,"ADW_SWAMP_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_LITTLE_SEA_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_LITTLE_SEA_02");
	Wld_InsertNpc(orkelite_addon1,"ADW_SWAMP_LITTLE_SEA_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_12");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_13");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PATH_TO_BL_09");
	Wld_InsertNpc(orkelite_addon1,"ADW_PATH_TO_BL_10");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PATH_TO_LOCH_01");
	Wld_InsertNpc(orkelite_addon1,"ADW_SWAMP_10");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_05");
	Wld_InsertNpc(orkelite_addon1,"ADW_SENAT_MONSTER_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SENAT_MONSTER_04");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_HILLS_DOWN_06");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_HILLS_DOWN_03");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_LOCH_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_SWAMP_TO_BIGSEA_01");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PIRATECAMP_LONEBEACH_11");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PIRATECAMP_LONEBEACH_10");
	Wld_InsertNpc(orkelite_addon2,"DAW_PIRTECAMP_LONEBEACH_07");
	Wld_InsertNpc(orkelite_addon2,"ADW_PIRATECAMP_LONEBEACH_08");
	Wld_InsertNpc(orkelite_addon2,"ADW_PIRATECAMP_LONEBEACH_04");
	Wld_InsertNpc(orkelite_addon3,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
	Wld_InsertNpc(orkelite_addon1,"ADW_PIRATECAMP_LONEBEACH_CAVE_03");
	Wld_InsertNpc(orkelite_addon1,"ADW_PIRATCAMP_PLAIN_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_PIRATCAMP_PLAIN_05");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_033_A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_035");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_036");
	Wld_InsertNpc(orkelite_addon1,"ADW_VALLEY_BIGCAVE_06");
	Wld_InsertNpc(orkelite_addon3,"ADW_VALLEY_BIGCAVE_15");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_110");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_020");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_048_A");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_PATH_047_G");
	Wld_InsertNpc(orkelite_addon1,"ADW_VALLEY_PATH_017");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_SHOWCASE1_02");
	Wld_InsertNpc(OrcWarrior_Roam,"ADW_VALLEY_SHOWCASE1_03");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ADWENTRANCEHRAM_02");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_04");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_06");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_08");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_10");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_12");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_14");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_16");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_18");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_20");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_22");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_24");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_26");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_30");
	Wld_InsertNpc(orkelite_bowmenroam,"FP_ROAM_ADWENTRANCEHRAM_31");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_ADWENTRANCEHRAM_32");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_34");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_ADWENTRANCEHRAM_36");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_02");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_04");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_06");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_GOLDSHAHT_08");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_10");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_12");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_GOLDSHAHT_14");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_GOLDSHAHT_16");
	Wld_InsertNpc(orkelite_addon1,"FP_ROAM_GOLDSHAHT_18");
	Wld_InsertNpc(OrcWarrior_Roam,"FP_ROAM_GOLDSHAHT_20");
};


instance DIA_ADDON_SATURAS_ORCLEADERDS(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 2;
	condition = dia_addon_saturas_orcleaderds_condition;
	information = dia_addon_saturas_orcleaderds_info;
	permanent = TRUE;
	description = " About the orcs... " ;
};


func int dia_addon_saturas_orcleaderds_condition()
{
	if ((Chapter >=  4 ) && (RavenAway ==  TRUE ) && ( INVASIONSTART  ==  TRUE ) && ( INVASIONSTOP  ==  FALSE )) .
	{
		return TRUE;
	};
};

func void dia_addon_saturas_orcleaderds_info()
{
	var int OrcCountXP;

	OrcCountXP = FALSE;
	AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_01 " );	// About orcs...
	AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_02 " );	// What new can you tell me?

	if((ORCSHAMAN1ISDEAD == FALSE) && (Npc_IsDead(orcshaman_leader1) == TRUE))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_03 " );	// One of the orc squads that headed west of the valley is stationed at the House of the Priests. They chose a good place, nothing to say.
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_04 " );	// Apparently, it was led by one of the supreme shamans of the horde - Varrag-Shatan. But now he is not dangerous, just like his warriors.
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaders_01_05 " );	// True, to be honest, I had to sweat a lot to knock them out of there.
		AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_06 " );	// Praise Adanos! Some good news from the past few days...
		ORCSHAMAN1ISDEAD = TRUE;
	};
	if (( ORCSHAMAN2ISDEAD  ==  FALSE ) && ( Npc_IsDead ( orcshaman_leader2 ) ==  TRUE ))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_07 " );	// Orcs seem to be big fans of antiquity.
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_08 " );	// In the Temple of the Dead Watchers, I stumbled upon one of the orc units that had gone west of the valley. I had to fight a little with them.
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_09 " );	// Apparently, they were led by one of the supreme shamans of the horde - Varrag-Kazorg. Now he is dead, as well as all the orcs that were with him.
		AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_10 " );	// Good work, my son!
		ORCSHAMAN2ISDEAD = TRUE;
	};
	if((ORCSHAMAN3ISDEAD == FALSE) && (Npc_IsDead(orcshaman_leader3) == TRUE))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_12 " );	// In the House of Healers in the swamps, I found another group of orcs. They set up a small camp there.
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_13 " );	// One of the supreme shamans of the horde - Varrag-Khashor, was their commander. Now there is nothing left of this group.
		AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaders_01_15 " );	// That's great news! Keep up the good work.
		ORCSHAMAN3ISDEAD = TRUE;
	};
	if (( ORCSHAMAN5ISDEAD  ==  FALSE ) && ( Npc_IsDead ( orcshaman_leader5 ) ==  TRUE ))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_16 " );	// To the north in the canyon, not far from the House of Scholars, there is another group of orcs.
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_17 " );	// The supreme shaman of the horde - Varrag-Khatash - apparently directed his actions.
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_18 " );	// Now there are no orcs in the canyon.
		AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_19");	//Отлично!
		ORCSHAMAN5ISDEAD = TRUE;
	};
	if (( ORCSHAMAN4ISDEAD  ==  FALSE ) && ( Npc_IsDead ( orcshaman_leader4 ) ==  TRUE ))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_20 " );	// Orcs attacked the bandit camp. I was in the midst of a fight.
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_21 " );	// I had to work hard to finish off all these creatures.
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_22 " );	// Including one of the supreme shamans of the horde - Varrag-Nazula. I think it was he who led the group that attacked the camp.
		AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_23 " );	// Great. This will further weaken the orcs!
		ORCSHAMAN4ISDEAD = TRUE;
	};
	if (( ORKELITELEADERISDEAD  ==  FALSE ) && (Npc_IsDead(orkelite_adw_leader) ==  TRUE ))
	{
		OrcCountXP = OrcCountXP + 100;
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_24 " );	// In the temple of Adanos, the orcs set up some kind of headquarters. Everything was just full of these creatures!
		AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_25 " );	// Oh, almighty Adanos! Those damned creatures have defiled his temple! Have you done something?
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_26 " );	// I dealt with all the orcs in the temple and killed their leader. The fight was not easy, but now everything is over.
		AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_27 " );	// Who was it?
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_28 " );	// One of the clan leaders of the horde - Ur-Katan.
		AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_29 " );	// Apparently, the orcs were preparing something serious if they were led by one of the command elite.
		AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_30 " );	// You're on the right track! Keep up the good work and soon we will break their will.
		ORKELITELEADERISDEAD = TRUE;
	};
	if((ORCSHAMAN1ISDEAD == TRUE) && (ORCSHAMAN2ISDEAD == TRUE) && (ORCSHAMAN3ISDEAD == TRUE) && (ORCSHAMAN4ISDEAD == TRUE) && (ORCSHAMAN5ISDEAD == TRUE) && (ORKELITELEADERISDEAD == TRUE))
	{
		OrcCountXP = OrcCountXP + 500;
		B_GivePlayerXP(OrcCountXP);
		AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_31 " );	// I think what you've done is enough. You did an excellent job with this task!
		AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_32 " );	// Without their leaders, the orcs are unlikely to take any serious steps. And they will surely leave this valley soon.
		AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_34 " );	// ...I keep thinking, what would we do without you? Truly, you are the messenger of the gods!
		MIS_ADW_ORCINVASION = LOG_SUCCESS;
		Log_SetTopicStatus(TOPIC_ADW_ORCINVASION,LOG_SUCCESS);
		B_LogEntry( TOPIC_ADW_ORCINVASION , " I have destroyed all the orc leaders who invaded Yarkendar. Now, without their leaders, the orcs will lose interest in this place and leave it. " );

		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_36 " );	// In honor of your deeds for the good of this world, please accept this small gift from me.
			B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_37 " );	// Naturally, your deeds are disproportionately greater than this reward. But this is the most valuable thing I have.
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_39 " );	// Now continue on your way. There is still a lot of evil in this world that we all must fight against.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_40");	//Прощай.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if(other.guild == GIL_PAL)
		{
			AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_41 " );	// It's my sacred duty to fight evil. Innos gives me strength!
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_42 " );	// Then, noble paladin, in honor of your deeds for the good of this world, accept this small gift from me.
			B_GiveInvItems(self,other,ItPo_Perm_Health,2);
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_43 " );	// Naturally, your deeds are disproportionately greater than this reward. But even this will help you in your fight against evil!
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_45 " );	// And now you must continue on your way. There are still places in this world where your help is needed.
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_46");	//Прощай.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if(other.guild == GIL_DJG)
		{
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_48 " );	// In honor of your deeds for the good of this world, please accept this small gift from me.
			B_GiveInvItems(self,other,ItPo_Perm_STR,1);
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_49 " );	// Naturally, your deeds are disproportionately greater than this reward. But I hope it will be enough for you.
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_51 " );	// And now you must continue on your way. Surely your sword will come to the aid of this world in the fight against evil more than once!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_52");	//Прощай.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if((other.guild == GIL_SEK) || (other.guild == GIL_TPL) || (other.guild == GIL_GUR))
		{
			AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_53 " );	// You yourself understand that we in the Brotherhood do not really believe in all these things. Our way is far from you and your gods!
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_54 " );	// Then, swamp, in honor of your deeds for the good of this world, accept this small gift from me.
			if((other.guild == GIL_SEK) || (other.guild == GIL_TPL))
			{
				B_GiveInvItems(self,other,ItPo_Perm_STR,1);
			}
			else
			{
				B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
			};
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_55 " );	// Naturally, your deeds are disproportionately greater than this reward. But I hope it will be enough for you.
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_57 " );	// And now, you must continue on your way. Surely you will come to the aid of this world in the fight against evil more than once!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_58");	//Прощай.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if(other.guild == GIL_KDW)
		{
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_60 " );	// In honor of your deeds for the good of this world, please accept this small gift from me.
			B_GiveInvItems(self,other,itpo_perm_mana,1);
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_61 " );	// Naturally, your deeds are disproportionately greater than this reward. But I hope it will be enough for you.
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_63 " );	// And now, you must continue on your way. Surely you will come to the aid of this world in the fight against evil more than once!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_64");	//Прощай.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		}
		else if(other.guild == GIL_KDM)
		{
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_66 " );	// In honor of your deeds for the good of this world, please accept this small gift from me.
			B_GiveInvItems(self,other,ItPo_Perm_Mana,1);
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_67 " );	// Naturally, your deeds are disproportionately greater than this reward. But I hope it will be enough for you.
			AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_69 " );	// And now you must continue on your way. I hope this will not be your only act in the name of the Light!
			AI_Output(self,other,"DIA_Addon_Saturas_OrcLeaderds_01_70");	//Прощай.
			DIA_Addon_Saturas_ADW_EXIT_Info();
		};
		AWORCINVASIONSTOP = TRUE;
	}
	else
	{
		B_GivePlayerXP(OrcCountXP);
		AI_Output(other,self, " DIA_Addon_Saturas_OrcLeaderds_01_71 " );	// Nothing yet.
		AI_Output(self,other, " DIA_Addon_Saturas_OrcLeaderds_01_72 " );	// Very sorry. I expected to hear more encouraging news.
	};
};


instance DIA_ADDON_SATURA_ADW_UNKNOWNPORTAL (C_Info) .
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 99;
	condition = dia_addon_saturas_adw_unknownportal_condition;
	information = dia_addon_saturas_adw_unknownportal_info;
	permanent = FALSE;
	description = " In the Temple of Adanos, I found this strange stone. " ;
};

func int dia_addon_saturas_adw_unknownportal_condition()
{
	if ((Npc_HasItems(other, ITMI_DRAGONOLDFOCUS ) >=  1 ) && ( DRAGONGOLDFOCUS  ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_unknownportal_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_UnknownPortal_01_00 " );	// In the temple of Adanos, I found this strange stone.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortal_01_01 " );	// Let me take a look at it.
	B_GiveInvItems(other,self,ITMI_DRAGONGOLDFOCUS,1);
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortal_01_02 " );	// Yes, a very interesting artifact.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortal_01_04 " );	// It resembles the magic crystals we used to activate the portals.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortal_01_06 " );	// But it doesn't even occur to me which portal this crystal is intended for.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_UnknownPortal_01_07 " );	// So, it can be used somehow.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortal_01_08 " );	// Most likely. But I'm more concerned about something else - where did you find it?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortal_01_09 " );	// If you found this artifact in the temple of Adanos, it must have been of great value to the architects.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_UnknownPortal_01_10 " );	// Or vice versa - a huge threat if it is so well hidden.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortal_01_11 " );	// In any case, be careful if you figure out how to use it. The consequences can be unpredictable!
	B_GiveInvItems(self,other,ITMI_DRAGONGOLDFOCUS,1);
	Log_CreateTopic(TOPIC_GOLDDRAGONPORTAL,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GOLDDRAGONPORTAL,LOG_Running);
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " I showed Saturas the strange stone I found in the temple of Adanos. He was unable to determine the purpose of the item, only noting its resemblance to magical crystals used to activate portals. Perhaps you should try looking in the valley for something that looks like a portal. " );
	MIS_GOLDDRAGONPORTAL = LOG_Running;
};

instance DIA_ADDON_SATURAS_ADW_UNKNOWNPORTALKNOWN (C_Info);
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 98;
	condition = dia_addon_saturas_adw_unknownportalknown_condition;
	information = dia_addon_saturation_adw_unknownportalknown_info;
	permanent = FALSE;
	description = " I activated the portal with a magic crystal. " ;
};

func int dia_addon_saturas_adw_unknownportalknown_condition()
{
	if(DRAGONGOLDMEET == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_unknownportalknown_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_00 " );	// I activated the portal with the magic crystal I found in the Temple of Adanos.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_01 " );	// Yes? Incredible!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_02 " );	// Where did you find it?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_03 " );	// In the ruins of an old temple not far from here.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_07 " );	// And where does this portal lead to?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_08 " );	// A small valley lurks on the other side of the portal.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_12 " );	// There I met a dragon!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_13 " );	// (horrified) DRAGON?! O Almighty Adanos!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_15 " );	// Then I'm afraid we're all in great danger!
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_16 " );	// There is no danger. Ash'Thar is not a servant of evil.
	AI_Output(self,other, " DIA_Addon_Saturation_ADW_UnknownPortalKnown_01_17 " );	// Аш'Тар?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_18 " );	// Yes, Ash'Thar is a golden dragon. He is not like those dragons that appeared in the Valley of Mines.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_22 " );	// Good. Since you're so sure about it...
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_25 " );	// When exploring the island and the temples of architects, we sometimes came across ancient frescoes depicting an incomprehensible creature...
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_26 " );	// ...very much like a dragon. Perhaps it was him.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_35 " );	// I think I just need to go to that valley and talk to him.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_36 " );	// I'm sure he will be able to tell us a lot about the events that happened here earlier.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_UnknownPortalKnown_01_38 " );	// I think you'll have something to discuss.
	B_LogEntry( TOPIC_GOLDDRAGONPORTAL , " I told Saturas about the dragon. He was shocked by the news and showed great interest in my find. " );
	AI_StopProcessInfos(self);
	SATURASKNOWSASHTAR = TRUE;
	self.aivar[AIV_EnemyOverride] = TRUE ;
};


instance DIA_ADDON_SATURAS_ADW_ARCHDEMON (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 97;
	condition = dia_addon_saturas_adw_archdemon_condition;
	information = dia_addon_saturas_adw_archdemon_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_adw_archdemon_condition()
{
	if (( TASKFINDER SPHERE  ==  TRUE ) && Npc_KnowsInfo( hero , dia_addon_saturas_adw_unknownportalknown ) && ( Npc_GetDistToWP ( self , " ADW_SATURAS_2_GOLDDRAGON " ) <  500 ) && ( AshtarLastWarn ==  FALSE ) && ( SenyakIsDead ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_archdemon_info()
{
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_ArchDemon_01_00 " );	// (excited) Ash'Thar told me about S'anyak!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_ArchDemon_01_01 " );	// If the dragon is right, then this world is in great danger! And this cannot be allowed!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_ArchDemon_01_02 " );	// You must act without delay. Go and find the orbs the dragon told you about.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_ArchDemon_01_03 " );	// Go, my son. Road every minute!
	AI_StopProcessInfos(self);
};

instance DIA_ADDON_SATURAS_ADW_PRAYFORGOMEZ (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_prayforgomez_condition;
	information = dia_addon_saturas_adw_prayforgomez_info;
	permanent = FALSE;
	description = " I need the blessing of Adanos. " ;
};


func int dia_addon_saturas_adw_prayforgomez_condition()
{
	if((MIS_RESCUEGOMEZ == LOG_Running) && (RESCUEGOMEZSTEPONE == TRUE) && (RESCUEGOMEZSTEPONEDONE == FALSE) && (RESCUEGOMEZPRAYADANOS == FALSE) && (SATURASREFUSEHELPGOMEZ == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_prayforgomez_info()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_PrayForGomez_01_01 " );	// I need the blessing of Adanos.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_PrayForGomez_01_02 " );	// (surprised) Do you need Water's blessing?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_PrayForGomez_01_03 " );	// And what did you do again if you ask him?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_PrayForGomez_01_04 " );	// I wanted Adanos to grant forgiveness to one of the restless souls in this world.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_PrayForGomez_01_10 " );	// This is the soul of former ore baron Gomez.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_PrayForGomez_01_11 " );	// (angrily) GOMEZA?! This murderer and executioner?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_PrayForGomez_01_12 " );	// (besides himself) How dare you make such a request to me?!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_PrayForGomez_01_14 " );	// That bastard deserved his fate!
	B_LogEntry( TOPIC_RESCUEGOMEZ , " Saturas and the other Waterbenders refused to help me. " );
	SATURASREFUSEHELPGOMEZ = TRUE;
};


instance DIA_ADDON_SATURAS_ADW_TELLABORKS (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_tellaborks_condition;
	information = dia_addon_saturas_adw_tellaborks_info;
	permanent = FALSE;
	description = " I have bad news. " ;
};


func int dia_addon_saturas_adw_tellaborks_condition()
{
	if((HAGENOTHERSAGREED == FALSE) && (MIS_BEWAREWATERMAGE == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_tellaborks_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_TellAbOrks_01_01 " );	// I have bad news.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_TellAbOrks_01_02 " );	// What are you talking about, my son?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_TellAbOrks_01_03 " );	// Orcs have invaded Khorinis!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_TellAbOrks_01_04 " );	// (shocked) What? But this cannot be!
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_TellAbOrks_01_06 " );	// In a few days, these creatures managed to turn the valley into a living hell.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_TellAbOrks_01_07 " );	// And I came here to warn you of this danger.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_TellAbOrks_01_08 " );	// And what about the city itself?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_TellAbOrks_01_09 " );	// Orcs managed to master it without much difficulty. The paladins were simply powerless to do anything.
	AI_Output(self,other,"DIA_Addon_Saturas_ADW_TellAbOrks_01_10");	//О Аданос!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_TellAbOrks_01_11 " );	// If even paladins are powerless in the face of this evil, then there is little hope.
	BEWAREWATERMAGE = TRUE;
	MIS_BEWAREWATERMAGE = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_BEWAREWATERMAGE,LOG_SUCCESS);
	B_LogEntry( TOPIC_BEWAREWATERMAGE , " I managed to inform the Waterbenders about what happened. " );
};


instances DIA_ADDON_SATURAS_ADW_GATHERARMY (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_gatherarmy_condition;
	information = dia_addon_saturas_adw_gatherarmy_info;
	permanent = FALSE;
	description = "The paladins need your help! " ;
};


func int dia_addon_saturas_adw_gatherarmy_condition()
{
	if((HAGENOTHERSAGREED == TRUE) && (HAGENNOMORETIMEWAIT == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_gatherarmy_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_GatherArmy_01_01 " );	// Paladins need your help!
	if((MIS_BEWAREWATERMAGE == LOG_Running) || (MIS_BEWAREWATERMAGE == FALSE))
	{
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_GatherArmy_01_02 " );	// And why did they need it?
		AI_Output(other,self, " DIA_Addon_Saturas_ADW_GatherArmy_01_05 " );	// Orcs have invaded Khorinis!
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_GatherArmy_01_06 " );	// (shocked) What? But this cannot be!
		AI_Output(other,self, " DIA_Addon_Saturas_ADW_GatherArmy_01_08 " );	// In a few days, these creatures managed to turn the valley into a living hell.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_GatherArmy_01_09 " );	// And what about the city itself?
		AI_Output(other,self, " DIA_Addon_Saturas_ADW_GatherArmy_01_10 " );	// Orcs were able to master it without much difficulty. The paladins were simply powerless to do anything.
		AI_Output(self,other,"DIA_Addon_Saturas_ADW_GatherArmy_01_11");	//О Аданос!
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_GatherArmy_01_12 " );	// If even paladins are powerless in the face of this evil, then there is little hope.
		AI_Output(other,self, " DIA_Addon_Saturas_ADW_GatherArmy_01_13 " );	// Lord Hagen needs your help.
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_GatherArmy_01_14 " );	// Good! We are ready to help him in any way we can.
		BEWAREWATERMAGE = TRUE;
		if(MIS_BEWAREWATERMAGE == LOG_Running)
		{
			B_GivePlayerXP(1000);
			MIS_BEWAREWATERMAGE = LOG_SUCCESS;
			Log_SetTopicStatus(TOPIC_BEWAREWATERMAGE,LOG_SUCCESS);
			Log_AddEntry( TOPIC_BEWAREWATERMAGE , " I managed to inform the Waterbenders about what happened. " );
		}
		else
		{
			B_GivePlayerXP(500);
		};
	}
	else
	{
		B_GivePlayerXP(500);
		AI_Output(self,other, " DIA_Addon_Saturas_ADW_GatherArmy_01_22 " );	// (decidedly) Good! We are ready to help them in any way we can.
	};
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_GatherArmy_01_23 " );	// However, before we leave this valley and go to the aid of the paladins, we need to finish one very important thing here.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_GatherArmy_01_24 " );	// Can't your business wait?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_GatherArmy_01_25 " );	// I'm afraid not. Since the fate of this part of the island depends on it.
	B_LogEntry( TOPIC_OR with GREATWAR , " The Waterbenders agree to help Lord Hagen and his paladins. However, before they go to Khorinis, they must finish some urgent business here. Looks like I'll have to help them to speed up this process. " ) ;
};


instance DIA_ADDON_SATURAS_ADW_ISTOK (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_istok_condition;
	information = dia_addon_saturas_adw_istok_info;
	permanent = FALSE;
	description = " Then tell me what it is. " ;
};


func int dia_addon_saturas_adw_istok_condition()
{
	if(Npc_KnowsInfo(hero,dia_addon_saturas_adw_gatherarmy))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_istok_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Istok_01_01 " );	// Then tell me what's up.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Istok_01_02 " );	// As you know, we have been studying the culture of the ancient people for quite a long time.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Istok_01_03 " );	// We have already managed to comprehend a large number of secrets hidden here, which keep the wisdom of their creators.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Istok_01_04 " );	// However, despite all this, we have always been interested in a slightly different question.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Istok_01_05 " );	// We wanted to understand the original cause, which subsequently caused the course of further unfortunate events.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Istok_01_06 " );	// Wasn't Beliar's Claw the reason?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Istok_01_08 " );	// The artifact of Beliar has indeed brought terrible evil to this valley.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Istok_01_09 " );	// But this would never have happened if Adanos himself had not left this place without his blessing.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Istok_01_12 " );	// Evidence of this is the records we found in one of the ancient manuscripts that were kept in the temple of Adanos.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Istok_01_13 " );	// Apparently, this sacred place was defiled even before the architects found the Claw.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Istok_01_15 " );	// We want to correct this situation, so that Adanos will again bless this land.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Istok_01_19 " );	// And what can we do?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Istok_01_20 " );	// After some deliberation, we have decided to perform a consecration ritual.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Istok_01_21 " );	// This should restore the temple to its former power and grandeur. And along with this, the very blessing of Adanos.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Istok_01_22 " );	// Can I help you with this?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Istok_01_23 " );	// Possibly. I have a feeling that someone will want to interfere with us.
	MIS_RESTOREHRAM = LOG_Running;
	Log_CreateTopic(TOPIC_RESTOREHRAM,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_RESTOREHRAM,LOG_Running);
	B_LogEntry( TOPIC_RESTOREHRAM , " According to Saturas, the Waterbenders finally understood the true reason for the oblivion of the civilization of the Ancients. Apparently, Adanos himself deprived them of their blessing for defiling his temple. And now it is necessary to return his patronage to this part of the island. To do this, the Waterbenders decided to consecrate the defiled temple by performing some mysterious ritual in it. However, Saturas warned me that this might be interfered with. I wonder who exactly? " );
};


instance DIA_ADDON_SATURAS_ADW_FINDRIORDAN (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_findriordan_condition;
	information = dia_addon_saturas_adw_findriordan_info;
	permanent = FALSE;
	description = " When do you plan to perform this ritual? " ;
};


func int dia_addon_saturas_adw_findriordan_condition()
{
	if(MIS_RESTOREHRAM == LOG_Running)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_findriordan_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_FindRiordan_01_01 " );	// When do you plan to perform this ritual?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_FindRiordan_01_02 " );	// Coming soon. But first we need to wait for Riordian.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_FindRiordan_01_04 " );	// A couple of days ago, I sent it to the old temple ruins, which are located in the north of this valley.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_FindRiordan_01_05 " );	// Judging by the ancient records, one of those artifacts that the Builders used for their rituals in the temple of Adanos should be kept there.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_FindRiordan_01_06 " );	// We desperately need it to perform our ritual.
	Wld_InsertNpc(riordian_zombie,"ADW_CANYON_LIBRARY_RIGHT_13");
	B_LogEntry( TOPIC_RESTOREHRAM , " Saturas awaits Riordian's return. He was supposed to bring some ancient artifact from the temple in the north. The architects used it for ceremonies in the Temple of Adanos. " );
};


instance DIA_ADDON_SATURAS_ADW_FINDRIORDANDONE (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_findriordandone_condition;
	information = dia_addon_saturas_adw_findriordandone_info;
	permanent = FALSE;
	description = " I met Riordian. " ;
};


func int dia_addon_saturas_adw_findriordandone_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (RIORDANEVILDEAD == TRUE) && (Npc_HasItems(hero,itmi_adanosamulet) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_findriordandone_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_FindRiordanDone_01_01 " );	// I met Riordian.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_FindRiordanDone_01_02 " );	// Good. But why didn't he come with you?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_FindRiordanDone_01_03 " );	// Because he's dead. An irresistible evil took possession of him, and he almost killed me.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_FindRiordanDone_01_05 " );	// Oh Adanos...(shocked) This is a huge and irreplaceable loss for all Waterbenders! I shouldn't have let this happen.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_FindRiordanDone_01_07 " );	// Okay...(recovering) Then we can't wait any longer!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_FindRiordanDone_01_08 " );	// Apparently, the evil is already close, and at any moment it can take possession of each of us.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_FindRiordanDone_01_09 " );	// Oh yeah, did you manage to find the artifact that Riordian was supposed to bring?
	AI_Output(other, self, " DIA_Addon_Saturas_ADW_FindRiordanDone_01_10 " );	// Yes, here he is.
	B_GiveInvItems(other,self,itmi_adanosamulet,1);
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_FindRiordanDone_01_11 " );	// Great! Then we immediately go to the temple of Adanos to perform this sacred ritual.
	READYWATERRITUAL = TRUE;
	; _ _ _ _ _ _
	AI_StopProcessInfos(self);
	B_StartOtherRoutine(KDW_14000_Addon_Saturas_ADW,"WaitTempel");
	B_StartOtherRoutine(KDW_14020_Addon_Nefarious_ADW, " WaitTempel " );
	B_StartOtherRoutine(KDW_14010_Addon_Cronos_ADW,"WaitTempel");
	B_StartOtherRoutine(KDW_14050_Addon_Merdarion_ADW,"WaitTempel");
};

instance DIA_ADDON_SATURAS_ADW_BEFORERITUAL(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_beforeritual_condition;
	information = dia_addon_saturas_adw_beforeritual_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_adw_beforeritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (READYWATERRITUAL == TRUE) && (Npc_GetDistToWP(self,"ADW_ADANOSTEMPEL_RAVEN_01") <= 2000))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_beforeritual_info()
{
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_BeforeRitual_01_01 " );	// So, you're here. Then let's start.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_BeforeRitual_01_03 " );	// All you have to do is not let anyone stop us so we can finish the ritual we started.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_BeforeRitual_01_04 " );	// When it starts, we'll be completely defenseless against the slightest threat!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_BeforeRitual_01_05 " );	// Therefore, if something goes wrong, all our hope will remain only on you.
	AI_Output(other, self, " DIA_Addon_Saturas_ADW_BeforeRitual_01_06 " );	// I understood everything
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_BeforeRitual_01_07 " );	// Then let's get started. May Adanos protect us!
	B_LogEntry( TOPIC_RESTOREHRAM , " The Waterbenders have begun their consecration ritual. I must make sure no one can interfere with them. " );
	BEGINWATERRITUAL = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"WaterRitual");
	B_StartOtherRoutine(KDW_14020_Addon_Nefarious_ADW, " WaterRitual " );
	B_StartOtherRoutine(KDW_14010_Addon_Cronos_ADW,"WaterRitual");
	B_StartOtherRoutine(KDW_14050_Addon_Merdarion_ADW,"WaterRitual");
};

instance DIA_ADDON_SATURAS_ADW_DURINGRITUAL(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_duringritual_condition;
	information = dia_addon_saturas_adw_duringritual_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_adw_duringritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (BEGINWATERRITUAL == TRUE) && (STOPWATERRITUAL == FALSE) && Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_duringritual_info()
{
	B_Say(self,other,"$NOTNOW");
	AI_StopProcessInfos(self);
};


instance DIA_ADDON_SATURAS_ADW_AFTERRITUAL(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_afterritual_condition;
	information = dia_addon_saturas_adw_afterritual_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_addon_saturas_adw_afterritual_condition()
{
	if((MIS_RESTOREHRAM == LOG_Running) && (STOPWATERRITUAL == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_afterritual_info()
{
	B_GivePlayerXP(1000);
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_AfterRitual_01_01 " );	// Great! It seems we have succeeded.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_AfterRitual_01_04 " );	// Someone clearly did not want to accomplish what we had planned.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_AfterRitual_01_06 " );	// But now I already feel how this place is filled with the blessing of Adanos himself!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_AfterRitual_01_09 " );	// It has become sacred again, and will henceforth guard these lands as it once did.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_AfterRitual_01_11 " );	// Thank you for your help. She proved to be invaluable.
	MIS_RESTOREHRAM = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_RESTOREHRAM,LOG_SUCCESS);
	) ; _ _ _ _ _
};


instance DIA_ADDON_SATURAS_ADW_GATHERARMYDONE(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_gatherarmydone_condition;
	information = dia_addon_saturas_adw_gatherarmydone_info;
	permanent = FALSE;
	description = " Now are you ready to go help Lord Hagen? " ;
};


func int dia_addon_saturas_adw_gatherarmydone_condition()
{
	if(MIS_RESTOREHRAM == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_gatherarmydone_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_GatherArmyDone_01_01 " );	// Now you're ready to go to Lord Hagen's aid?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_GatherArmyDone_01_03 " );	// Tell the head of the paladins that we will come at his first call.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_GatherArmyDone_01_04 " );	// May Adanos help us get through this difficult time!
	KDW_JOINHAGEN = TRUE;
	B_LogEntry( TOPIC_OR with GREATWAR , " Lord Hagen should be informed that the Waterbenders are waiting for his further instructions regarding the upcoming battle with the orcs. " );
};


instance DIA_ADD_SATURA_ADW_RAVENAWAY (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_RAVENAWAY_condition;
	information = dia_addon_saturation_adw_RAVENAWAY_info;
	permanent = FALSE;
	description = " The raven has escaped! " ;
};

func int dia_addon_saturas_adw_RAVENAWAY_condition()
{
	if(RavenAway == TRUE)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_RAVENAWAY_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_RAVENAWAY_01_01 " );	// The raven has escaped!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_RAVENAWAY_01_02 " );	// (uncomprehending) What? So how did you escape?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_RAVENAWAY_01_03 " );	// I overtook him in the inner sanctuary of the temple. A fight ensued between us.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_RAVENAWAY_01_04 " );	// But at the last moment, he used some kind of magic unknown to me and just disappeared.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_RAVENAWAY_01_05 " );	// Hmmm...(thoughtfully) I don't even know what to tell you.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_RAVENAWAY_01_06 " );	// Maybe now it's not so dangerous anymore?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_RAVENAWAY_01_07 " );	// I don't think so. There is still a presence of great evil here!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_RAVENAWAY_01_08 " );	// And until we kill Raven, this won't stop.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_RAVENAWAY_01_09 " );	// Then where can I find it?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_RAVENAWAY_01_10 " );	// If I had known, I would have sent you on his trail long ago. I need time to think things through.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_RAVENAWAY_01_12 " );	// Then maybe I'll be ready to answer this question for you.
	B_LogEntry(TOPIC_Addon_RavenKDW, " Saturas was confused when Raven escaped me. Now he needs time to think about our next steps. " );
	RavenAwayDone = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_Addon_Kammern,LOG_SUCCESS);
};

instance DIA_ADDON_SATURAS_ADW_ADANOSVALLEY (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_ADANOSVALLEY_condition;
	information = dia_addon_saturas_adw_ADANOSVALLEY_info;
	permanent = FALSE;
	description = " What can you say about this ancient tablet? " ;
};

func int dia_addon_saturas_adw_ADANOSVALLEY_condition()
{
	if ((Npc_HasItems(hero,ItWr_CroneAdanos) >=  1 ) && (KnowsTextAdanos ==  FALSE ) && (MY_AdanosCrone == LOG_Running))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_ADANOSVALLEY_info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_01 " );	// What can you say about this ancient tablet?
	B_GiveInvItems(other,self,ItWr_CroneAdanos,1);
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_02 " );	// (surprised) It doesn't look like the tablets we found here earlier.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_03 " );	// Where did you find her?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_04 " );	// In one of the inner sanctuaries of the Temple of Adanos.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_05 " );	// Apparently, it was of great value if the ancients kept it there.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_06 " );	// Can you read what is written on it?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_07 " );	// I'm afraid not. The symbols depicted on it are completely unfamiliar to me.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_08 " );	// It looks like they are all made in some very ancient language. And it can take years to study it.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_10 " );	// I can't wait that long.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_ADANOSVALLEY_01_11 " );	// Then find who owns it. I don't see any other way.
	B_GiveInvItems(self,other,ItWr_CroneAdanos,1);
	B_LogEntry(TOPIC_AdanosCrone, " Saturas was very interested in an ancient tablet that I found in the temple, but he could not read it. It looks like the inscriptions were written in some very ancient language. " );
};

instance DIA_ADDON_SATURAS_ADW_ABOUTANTIENTGUARDS(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_aboutantientguards_condition;
	information = dia_addon_saturas_adw_aboutantientguards_info;
	permanent = FALSE;
	description = " Do you know anything about stone guardians? " ;
};

func int dia_addon_saturas_adw_aboutantientguards_condition()
{
	if((KnowAboutAdVal == TRUE) && (RavenIsDead == FALSE) && (StoneBossIsDead == FALSE) && (TellAboutAdanosWeapon == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_aboutantientguards_info()
{
	var int randomplace;

	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_AboutAntientGuards_01_01 " );	// Do you know anything about stone guards?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_AboutAntientGuards_01_04 " );	// The ancient records say that these creatures, being the creation of Adanos himself, are the guards of his fiefdom.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_AboutAntientGuards_01_05 " );	// They are very strong, and even an experienced warrior will have a hard time dealing with them.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_AboutAntientGuards_01_06 " );	// However, as we managed to understand, there was some kind of weapon with which the ancients pacified these guards.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_AboutAntientGuards_01_07 " );	// What is this weapon?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_AboutAntientGuards_01_08 " );	// I don't know. You will have to find the answer to this question yourself.

	if(DragonGoldIsDead == TRUE)
	{
		if(TellAboutAdanosWeapon == FALSE)
		{
			randomplace = Hlp_Random( 4 );

			if(randomplace == 0)
			{
				Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_01");
			}
			else if(randomplace == 1)
			{
				Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_02");
			}
			else if(randomplace == 2)
			{
				Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_03");
			}
			else
			{
				Wld_InsertItem(itmw_adanosmolot,"FP_ITEM_ADANOSMOLOT_04");
			};

			TELLABOUTSTONEGUARD = TRUE;
			TellAboutAdanosWeapon = TRUE;
		};
	};
};

instance DIA_ADDON_SATURAS_ADW_AncientAltar (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_AncientAltar_condition;
	information = dia_addon_saturas_adw_AncientAltar_info;
	permanent = FALSE;
	description = " Do you know how to restore magic to an ancient altar? " ;
};

func int dia_addon_saturas_adw_AncientAltar_condition()
{
	if((TaskHram_04 == TRUE) && (ANCIENTALTARSIsAwake == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_AncientAltar_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_AncientAltar_01_01 " );	// Do you know how to restore magic to some ancient altar?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_AncientAltar_01_02 " );	// Pretty unusual question. I don't know why you needed it.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_AncientAltar_01_03 " );	// However, in my opinion, this can be done with a focusing crystal.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_AncientAltar_01_04 " );	// Are you talking about a uniter?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_AncientAltar_01_05 " );	// Yes. Usually he has the ability to attract magical energy to himself and, in turn, transfer part of this energy to the place where he is.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_AncientAltar_01_06 " );	// I understand. Do you happen to have an extra couple of these crystals lying around?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_AncientAltar_01_07 " );	// You should take this to Merdarion. All the units that I had, I gave him.
	AltarToMerdarion = TRUE;
};

instance DIA_ADDON_SATURAS_ADW_Tree (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_Tree_condition;
	information = dia_addon_saturas_adw_Tree_info;
	permanent = FALSE;
	description = " Are you good with trees? " ;
};

func int dia_addon_saturas_adw_Tree_condition()
{
	if ((LastAdanosTask ==  TRUE ) && (RootIsUp ==  FALSE ) && (LastAdanosTaskDone ==  FALSE ))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_Tree_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Tree_01_01 " );	// Are you good with trees?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Tree_01_02 " );	// (surprised) What? You start asking very strange questions more and more often.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Tree_01_03 " );	// Why are you doing this?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Tree_01_04 " );	// It's simple. There is a dead tree and it needs to be brought back to life.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Tree_01_05 " );	// But why did you decide to contact me specifically?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Tree_01_06 " );	// Well, you're a mage. I thought you know a way to do this.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Tree_01_07 " );	// Even if I'm a mage, that doesn't mean I can do anything in this world.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Tree_01_08 " );	// What, can't the wise Saturas be able to tell me anything?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Tree_01_09 " );	// I'm afraid nothing this time.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Tree_01_10 " );	// Although... (thoughtfully) The only thing that can help you in this matter, in my opinion, is the magic of the druids.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Tree_01_11 " );	// Druid magic? Never heard of her.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Tree_01_12 " );	// I don't remember much about her anymore. However, it does exist.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Tree_01_13 " );	// When I was as young as you, I used to meet some of the druids.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Tree_01_14 " );	// They - like us, the magicians of Water - honor the sacred commandments of Adanos. But they draw their magical power from his creations - trees and plants.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Tree_01_15 " );	// So I need to find a druid, right?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Tree_01_16 " );	// Yes. However, I doubt that you will be able to find any of them on this island.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Tree_01_17 " );	// As far as I remember, they all lived in the forests of Myrtana on the mainland. True, there is something else.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Tree_01_18 " );	// If my memory serves me, one of the magicians who came to this island to build a magical barrier was well versed in it.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Tree_01_19 " );	// And who is this?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Tree_01_20 " );	// (grouchily) Xardas! At one time, he often fiddled with various magical formulas that vaguely resembled the magic of the druids.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Tree_01_21 " );	// There is nothing more I can do to help you with this matter.
	XarDruid = TRUE;

	if (chapter <  5 )
	{
		B_LogEntry(TOPIC_AdanosCrone, " Saturas mentioned some druidic magic that could help me revive the Great Tree. According to him, Xardas might know something about it. I think it's time to visit the old man. Or find someone else who understands druid magic. " );
	}
	else
	{
		B_LogEntry(TOPIC_AdanosCrone, " Saturas mentioned some druidic magic that could help me revive the Great Tree. I need to find someone who knows about it. " );
	};
};

instance DIA_ADD_SATURA_ADW_JarCurse (C_Info) .
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_JarCurse_condition;
	information = dia_addon_saturas_adw_JarCurse_info;
	permanent = FALSE;
	description = " Are you okay here? " ;
};

func int dia_addon_saturas_adw_JarCurse_condition()
{
	if((MIS_JarCurse == LOG_Running) && (MyxirSendSaturas == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturates_adw_JarCurse_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_JarCurse_01_01 " );	// Are you all right here?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurse_01_02 " );	// No, as you can see. It looks like the desecration of the Temple of Adanos had far-reaching consequences!
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_JarCurse_01_03 " );	// What do you mean?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurse_01_04 " );	// (grouchily) Are you blind? Huge hordes of undead have invaded these lands!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurse_01_05 " );	// Some ancient force, unknown to us, forced them to rise from oblivion.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurse_01_06 " );	// And now they are ready to unleash their wrath on anyone who dares to stand in their way.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_JarCurse_01_07 " );	// Do you think it's Raven's fault?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurse_01_08 " );	// Most likely. His sacrilege and desecration of ancient shrines certainly did not go unnoticed.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurse_01_09 " );	// We can only pray that this will be the only disaster that awaits us in the future.
	MeetSaturasOkPortal = TRUE;
	B_LogEntry(TOPIC_JarCurse, " The situation in Yarkendar is no better than in Khorinis. Some unknown ancient forces have raised a huge army of undead. Apparently, the undead that broke through the portal to Khorinis was only a small part of what awaits all of us. " );	
};

instance DIA_ADDON_SATURA_ADW_JarCurseUndead ( C_Info );
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_JarCurseUndead_condition;
	information = dia_addon_saturas_adw_JarCurseUndead_info;
	permanent = FALSE;
	description = " Does this undead look like normal undead? " ;
};

func int dia_addon_saturas_adw_JarCurseUndead_condition()
{
	if (( MIS_JarCurse == LOG_Running ) && ( Npc_KnowsInfo ( other , DIA_Addon_Saturates_ADW_JarCurse ) ==  TRUE )) .
	{
		return TRUE;
	};
};

func void dia_addon_saturates_adw_JarCurseUndead_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_JarCurseUndead_01_01 " );	// Is this undead not normal?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurseUndead_01_02 " );	// No! And this is the biggest problem. Our magic is practically powerless against them.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurseUndead_01_03 " );	// Apparently, these are the warriors and priests of the ancient people, who at one time befell the curse that destroyed them.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurseUndead_01_04 " );	// And now they have risen to avenge their death and the desecration of these lands by the minions of Beliar!
};

instance DIA_ADDON_SATURAS_ADW_JarCurseDo (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_JarCurseDo_condition;
	information = dia_addon_saturas_adw_JarCurseDo_info;
	permanent = FALSE;
	description = " And what can we do? " ;
};

func int dia_addon_saturas_adw_JarCurseDo_condition()
{
	if (( MIS_JarCurse == LOG_Running ) && ( Npc_KnowsInfo ( other , DIA_Addon_Saturates_ADW_JarCurseUndead ) ==  TRUE )) .
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_JarCurseDo_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_JarCurseDo_01_01 " );	// And what can we do?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurseDo_01_02 " );	// Pray to Adanos to spare us all!
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_JarCurseDo_01_03 " );	// But seriously?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurseDo_01_04 " );	// (thoughtfully) I don't know for sure. But I have a suspicion that all this undead is not a thoughtless herd of the dead at all.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurseDo_01_06 " );	// They must all be driven by someone's evil will! But whose?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_JarCurseDo_01_07 " );	// Do you have any thoughts on this?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurseDo_01_08 " );	// Like any nation, the Architects had their own leaders and leaders. Those whom they respected and revered.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurseDo_01_09 " );	// Perhaps one of them is behind all this!
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_JarCurseDo_01_10 " );	// Maybe Quarhodron? He was a great commander of architects.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurseDo_01_11 " );	// Then the only thing we can do now is ask him about what happened.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurseDo_01_14 " );	// Just be careful! According to my information, all roads from the large temple in this valley are now controlled by the undead.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurseDo_01_15 " );	// And the teleportation stones are probably not safe either.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurseDo_01_16 " );	// So if you can, take care to keep them safe too.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_JarCurseDo_01_17 " );	// I'll try.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurseDo_01_18 " );	// Then hurry up! For us, every minute is precious.
	MIS_FreeTeleport = LOG_Running;
	Log_CreateTopic(TOPIC_FreeTeleport,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FreeTeleport,LOG_Running);
	B_LogEntry(TOPIC_FreeTeleport, " Saturas asked me to rid all teleporters in the valley of the presence of the undead. " );	
	B_LogEntry_Quiet(TOPIC_JarCurse, " Saturas thinks the undead army is being driven by an evil will. I need to find Quarhodron. Maybe he knows something about this. " );	
	AI_StopProcessInfos(self);
	Wld_InsertNpc(NONE_ADDON_1159_Rhademes, " ADW_SATURAS_2_GOLDDRAGON " );
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_VALLEY_037");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_VALLEY_036");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"ADW_VALLEY_PATH_032");
	Wld_InsertNpc(Ancient_Warrior_02,"ADW_VALLEY_PATH_031");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_01,"ADW_SOUTHWEST_TELEPORTSTATION");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"ADW_PORTALTEMPEL_05");
	Wld_InsertNpc(Ancient_Warrior_01,"ADW_PORTALTEMPEL_06");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"ADW_PORTALTEMPEL_08B");
	Wld_InsertNpc(Ancient_Warrior_02,"ADW_PORTALTEMPEL_08A");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_02,"ADW_PORTALTEMPEL_TELEPORTSTATION");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_TELEPORT_03_01");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_TELEPORT_03_02");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_TELEPORT_03_03");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_TELEPORT_03_04");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_03,"FP_ROAM_TELEPORT_03_05");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_CANYON_MONSTER_32");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_CANYON_MONSTER_31");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"ADW_CANYON_TELEPORT_PATH_02");
	Wld_InsertNpc(Ancient_Warrior_02,"FP_ROAM_CANYON_MONSTER_33");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_04,"ADW_CANYON_TELEPORT_PATH_01");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"BL_UP_PLACE_06");
	Wld_InsertNpc(Ancient_Warrior_01,"FP_ROAM_ORKINCAMP_51");
	Wld_InsertNpc(SKELETON_WARRIOR_AV_ELITE,"FP_ROAM_ENTRANCEORCGUARD_10");
	Wld_InsertNpc(Ancient_Warrior_02,"BL_UP_PLACE_03");
	Wld_InsertNpc(Skeleton_Shadow_Priest_ADW_05,"ADW_ADANOSTEMPEL_TELEPORTSTATION");
};

instance DIA_ADDON_SATURAS_ADW_JarCurseDone (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_JarCurseDone_condition;
	information = dia_addon_saturas_adw_JarCurseDone_info;
	permanent = FALSE;
	description = " I've cleared the area near the teleportation stones. " ;
};

func int dia_addon_saturas_adw_JarCurseDone_condition()
{
	if((MIS_FreeTeleport == LOG_Running) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_01) == TRUE) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_02) == TRUE) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_03) == TRUE) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_04) == TRUE) && (Npc_IsDead(Skeleton_Shadow_Priest_ADW_05) == TRUE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_JarCurseDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_JarCurseDone_01_01 " );	// I've cleared the area near the teleportation stones.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_JarCurseDone_01_02 " );	// Good! At least we won't have to wait for a backstab anymore.
	MIS_FreeTeleport = LOG_Success;
	Log_SetTopicStatus(TOPIC_FreeTeleport,LOG_Success);
	B_LogEntry(TOPIC_FreeTeleport, " I informed Saturas that I cleared the teleporters of the undead. " );	
};

instance DIA_ADDON_SATURAS_ADW_Qvardemon (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_Qvardemon_condition;
	information = dia_addon_saturas_adw_Qvardemon_info;
	permanent = FALSE;
	description = " I need your advice. " ;
};

func int dia_addon_saturas_adw_Qvardemon_condition()
{
	if((MIS_Qvardemon == LOG_Running) && (FTDamageQvardemon == TRUE) && (QvardemonIsDead == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_Qvardemon_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Qvardemon_01_01 " );	// I need your advice.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Qvardemon_01_02 " );	// Of course, my son. Which one?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Qvardemon_01_03 " );	// In one of the temples, I found the spirit of the high priest of the Architects - Cardimon.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Qvardemon_01_04 " );	// It is his evil will that guides the undead that attacked us. True, only magicians and priests of the ancients, like himself.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Qvardemon_01_05 " );	// Hmmm...(thoughtfully) Then I guess it should be destroyed immediately.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_Qvardemon_01_06 " );	// I tried but failed. My weapons are powerless against him. Do you have any ideas about this?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Qvardemon_01_08 " );	// I don't want to disappoint you, but I'm afraid our knowledge will not be enough to solve this problem.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Qvardemon_01_09 " );	// But it is possible that in this world there is some powerful artifact that can break the spell of the ancient priest.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Qvardemon_01_10 " );	// True, for this he must have truly divine power! A power that only Adanos himself could give you.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_Qvardemon_01_11 " );	// But that's just my guess. I can't tell you where to find such an artifact.
	B_LogEntry(TOPIC_Qvardemon, " Saturas said that only an artifact that has the power of the gods themselves and can break his protective charms can help me in the battle with Cardimon. However, this is just an assumption. " );	
};

instance DIA_ADDON_SATURAS_ADW_QvardemonDead (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_QvardemonDead_condition;
	information = dia_addon_saturas_adw_QvardemonDead_info;
	permanent = FALSE;
	description = " I destroyed Cardimon! " ;
};

func int dia_addon_saturas_adw_QvardemonDead_condition()
{
	if(MIS_Qvardemon == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_QvardemonDead_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_QvardemonDead_01_01 " );	// I destroyed Cardimon!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_QvardemonDead_01_02 " );	// That's good news, my son. May Adanos bless you!
};

instance DIA_ADDON_SATURAS_ADW_CurseAncient (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_CurseAncient_condition;
	information = dia_addon_saturas_adw_CurseAncient_info;
	permanent = FALSE;
	description = " What do you know about the curse of the ancient people? " ;
};

func int dia_addon_saturas_adw_CurseAncient_condition()
{
	if((MIS_CurseAncient == LOG_Running) && (CurseAncientRemove == FALSE))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_CurseAncient_info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_CurseAncient_01_01 " );	// What do you know about the curse of the ancient people?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_CurseAncient_01_02 " );	// Not very many. Why are you asking?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_CurseAncient_01_03 " );	// We need to rid this land of him as soon as possible.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_CurseAncient_01_04 " );	// My inner voice tells me that this is the only way we can stop the advance of the undead.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_CurseAncient_01_05 " );	// Hmmm... But where do you get such confidence from?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_CurseAncient_01_06 " );	// Too long to tell. Just tell me what can we do?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_CurseAncient_01_07 " );	// As far as I know, the Builder's curse is very ancient and powerful.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_CurseAncient_01_08 " );	// An ordinary person will hardly be able to destroy it.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_CurseAncient_01_09 " );	// What about Adanos? Would he be able to?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_CurseAncient_01_10 " );	// He's a god! Everything is in his power. But I'm afraid that ordinary prayers are unlikely to help you here.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_CurseAncient_01_11 " );	// It's hard for me to even imagine what could make Adanos perform such a miracle.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_CurseAncient_01_12 " );	// It must be something very special! Something for which he will be ready to send his blessing on this damned people.
	B_LogEntry(TOPIC_CurseAncient, " Saturas doesn't know what can make Adanos lift the curse on the ancient people. I feel like I need to look elsewhere. " );	
};

instance DIA_ADDON_SATURAS_ADW_CurseAncientDone (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_CurseAncientDone_condition;
	information = dia_addon_saturas_adw_CurseAncientDone_info;
	permanent = FALSE;
	description = " The ancient undead will no longer disturb you. " ;
};

func int dia_addon_saturas_adw_CurseAncientDone_condition()
{
	if(MIS_JarCurse == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_addon_saturates_adw_CurseAncientDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_CurseAncientDone_01_01 " );	// Ancient undead will no longer disturb you.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_CurseAncientDone_01_02 " );	// And the one that still remains, it will not be difficult for you to kill.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_CurseAncientDone_01_03 " );	// Are you sure about that, my son? Do we all have to thank you for our salvation?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_CurseAncientDone_01_04 " );	// Give thanks to Adanos. And I just did his will.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_CurseAncientDone_01_05 " );	// Well, in that case, I will turn to him every day in prayer and thank him for our salvation.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_CurseAncientDone_01_06 " );	// However, I still believe that you put a lot of effort into this!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_CurseAncientDone_01_07 " );	// Take this elixir. This is the best I can offer you.
	B_GiveInvItems(self,other,ITPO_MEGAPOTIONSKILL,1);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_CurseAncientDone_01_08 " );	// Thank you.
};

instance DIA_ADDON_SATURAS_ADW_WaterMageDocumentsDone(C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_WaterMageDocumentsDone_condition;
	information = dia_addon_saturas_adw_WaterMageDocumentsDone_info;
	permanent = FALSE;
	description = " It looks like it belongs to you. " ;
};

func int dia_addon_saturas_adw_WaterMageDocumentsDone_condition()
{
	if((MIS_WaterMageDocuments == LOG_Running) && (Npc_HasItems(hero,ItWr_WaterMageDoc) >= 1))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_WaterMageDocumentsDone_info()
{
	B_GivePlayerXP(1500);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_01 " );	// Looks like it belongs to you.
	B_GiveInvItems(other,self,ItWr_WaterMageDoc,1);
	Npc_RemoveInvItems(self,ItWr_WaterMageDoc,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_02 " );	// (surprised) Quite unexpectedly, Lee gave you this task.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_03 " );	// Does it really matter who brought you these notes?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_04 " );	// No, I just expected him to send a large force of mercenaries to the Valley of Mines.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_05 " );	// And you, it turns out, coped with this alone.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_06 " );	// Does that surprise you?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_07 " );	// Not much. But in any case, we are all very grateful to you for your help.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_08 " );	// I think you'll find a worthy use for these scrolls.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItSc_IceWave,2);
	CreateInvItems(other,ItSc_LightningFlash,1);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_WaterMageDocumentsDone_01_09 " );	// Thank you.
	MIS_WaterMageDocuments = LOG_Success;
	Log_SetTopicStatus(TOPIC_WaterMageDocuments,LOG_Success);
	B_LogEntry(TOPIC_WaterMageDocuments, " I brought back to Saturas the records of the Waterbenders they left in the Valley of Mines. " );	
};

instance DIA_ADDON_SATURAS_ADW_SendNorolas (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_SendNorolas_condition;
	information = dia_addon_saturas_adw_SendNorolas_info;
	permanent = FALSE;
	description = " What are these posts I brought about? " ;
};

func int dia_addon_saturas_adw_SendNorolas_condition()
{
	if(MIS_WaterMageDocuments == LOG_Success)
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_SendNorolas_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SendNorolas_01_01 " );	// What are these notes I brought about?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_01_02 " );	// These are all our works collected over the long years spent in the Valley of Mines.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_01_03 " );	// Most of them are dedicated to the then existing Brotherhood of the Sleeper.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_01_04 " );	// To be more precise, we were very interested in the magic used by their spiritual leaders - the gurus.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_01_06 " );	// It's pretty unique in nature. We still do not understand where they drew their magical energy and the ability to use the runes.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_01_08 " );	// If we, the magicians of Water, have access to this knowledge thanks to the will of Adanos, then who is their patron?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SendNorolas_01_09 " );	// Wasn't that the Sleeper?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_01_10 " );	// Yes, at first we thought so too. But, as far as I know, the Gurus who survived the disappearance of the Barrier still have the opportunity to use it.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_01_12 " );	// So there must be some other explanation here.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SendNorolas_01_13 " );	// Why not just go and talk to them about it?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_01_14 " );	// I'm afraid they're not likely to reveal their secrets.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SendNorolas_01_15 " );	// And what do you suggest?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_01_16 " );	// I recently made the decision to send one of our mage apprentices to the old Temple of the Brotherhood in the swamps.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_01_17 " );	// Most likely, we can only find answers to our questions there.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SendNorolas_01_18 " );	// But that's pretty dangerous. Are you not afraid that the orcs will catch him or eat some evil creatures?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_01_20 " );	// I'm sure he can handle it. He is very well prepared! Although extra help has never hurt anyone.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_01_21 " );	// If you want, you can go after him and help him in our search.
	MIS_SendNorolas = LOG_Running;
	Log_CreateTopic(TOPIC_SendNorolas,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SendNorolas,LOG_Running);
	B_LogEntry(TOPIC_SendNorolas, " Saturas has sent an aspiring magician to the temple of the Brotherhood of the Sleeper in the swamps in the Valley of Mines. I could help him. Saturas is looking for something that was somehow connected with the Guru's magic. " );
};

var int SaturasReadDay;
var int SaturasReadGuru;

instance DIA_ADDON_SATURAS_ADW_SendNorolas_Done (C_Info)
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = dia_addon_saturas_adw_SendNorolas_Done_condition;
	information = dia_addon_saturas_adw_SendNorolas_Done_info;
	permanent = FALSE;
	description = " I brought Yu'berion's diary. " ;
};

func int dia_addon_saturas_adw_SendNorolas_Done_condition()
{
	if (( MIS_SendNorolas == LOG_Success ) && ( Npc_HasItems ( hero , ItWr_UberionBook ) >=  1 ))
	{
		return TRUE;
	};
};

func void dia_addon_saturas_adw_SendNorolas_Done_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SendNorolas_Done_01_01 " );	// I brought U'berion's diary.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_Done_01_02 " );	// This is very good news, my son. Let me take a look at it.
	AI_Output(other, self, " DIA_Addon_Saturas_ADW_SendNorolas_Done_01_03 " );	// Vot.
	B_GiveInvItems(other,self,ItWr_UberionBook,1);
	Npc_RemoveInvItems(self,ItWr_UberionBook,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_Done_01_04 " );	// Hmmm... Yes, very interesting thoughts visited this man.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_Done_01_05 " );	// Now, I hope we can find out exactly how the Guru managed to use rune magic.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_Done_01_06 " );	// I want to thank you for helping Norolas. By the way, where is he?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SendNorolas_Done_01_07 " );	// He stayed in the Valley of Mines. He was interested in the local camp of former novices of the Brotherhood.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SendNorolas_Done_01_10 " );	// Apparently, their leader is none other than a real druid.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_Done_01_11 " );	// Druid? Hmmm... the last time I heard about them was on the mainland... it was a long time ago.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_Done_01_12 " );	// Oh well. Frankly, we are not up to this druid now.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SendNorolas_Done_01_13 " );	// But for your selfless help, I want to give you some valuable scrolls and potions.
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(other,ItSc_Waterfist,1);
	CreateInvItems(other,ItPo_Perm_Health,1);
	AI_Output(other, self, " DIA_Addon_Saturas_ADW_SendNorolas_Done_01_15 " );	// Thank you
	SaturasReadGuru = TRUE;
	SaturasReadDay = Wld_GetDay();
};

instance DIA_Addon_Saturation_ADW_SwampSecret (C_Info);
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = DIA_Addon_Saturas_ADW_SwampSecret_condition;
	information = DIA_Addon_Saturas_ADW_SwampSecret_info;
	important = TRUE;
};

func int DIA_Addon_Saturas_ADW_SwampSecret_condition()
{
	var int DayNow;

	DayNow = Wld_GetDay();

	if((SaturasReadGuru == TRUE) && (SaturasReadDay < DayNow))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_SwampSecret_info()
{
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SwampSecret_01_01 " );	// It's good that you're here, my son! I was waiting for you.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SwampSecret_01_02 " );	// What happened?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SwampSecret_01_03 " );	// You brought me Yu'Berion's diary some time ago, for which I am very grateful.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SwampSecret_01_04 " );	// But I'm afraid that wasn't enough. It does not explain how the Gurus learned to use magic.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SwampSecret_01_05 " );	// However, we are certain that their magic was bestowed upon them by non-Sleepers!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SwampSecret_01_06 " );	// In his diary, Yu'Berion mentions that he used common marsh grass to increase his magic power.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SwampSecret_01_07 " );	// And, it remains to be assumed that this is the only clue that can lead us to unravel this mystery.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SwampSecret_01_08 " );	// So first of all we need to know a little more about this plant. And in this I really hope for your help.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SwampSecret_01_09 " );	// Of course, old man - I'll try to find out something for you.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SwampSecret_01_10 " );	// Thank you... son.
	MIS_SwampSecret = LOG_Running;
	Log_CreateTopic(TOPIC_SwampSecret,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SwampSecret,LOG_Running);
	B_LogEntry(TOPIC_SwampSecret, " Saturas thinks swamp grass has something to do with the Guru's magic. Maybe I should ask someone who knows a lot more about herbs about it. " );
};

instance DIA_Addon_Saturates_ADW_SwampSecret_Done (C_Info);
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = DIA_Addon_Saturas_ADW_SwampSecret_Done_condition;
	information = DIA_Addon_Saturas_ADW_SwampSecret_Done_info;
	permanent = FALSE;
	description = " I figured out where the gurus get their magical power from. " ;
};

func int DIA_Addon_Saturas_ADW_SwampSecret_Done_condition()
{
	if((MIS_SwampSecret == LOG_Running) && (Npc_HasItems(hero,ItWr_StonePower) >= 1) && (StonePower == TRUE))
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturas_ADW_SwampSecret_Done_info()
{
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SwampSecret_Done_01_01 " );	// I think I figured out where the Gurus get their magical power from.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SwampSecret_Done_01_02 " );	// Tell me everything you've learned.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SwampSecret_Done_01_03 " );	// You were right - it's all about the swamp grass.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SwampSecret_Done_01_04 " );	// Are you serious?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SwampSecret_Done_01_05 " );	// Absolutely. Each blade of grass carries the magical power of the elements of the Earth and the Rock.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SwampSecret_Done_01_06 " );	// Only this magic is shared between every plant that grows in this world.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SwampSecret_Done_01_07 " );	// And if a person is strong enough in spirit, he can use this herb to change his mind and learn to use the magic of this element.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SwampSecret_Done_01_08 " );	// Incredible! I couldn't imagine anything like that. But how did you know about it?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_SwampSecret_Done_01_09 " );	// I read about it in one of the ancient tablets. Here, you can take it, by the way.
	B_GiveInvItems(other,self,ItWr_StonePower,1);
	Npc_RemoveInvItems(self,ItWr_StonePower,1);
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SwampSecret_Done_01_10 " );	// How interesting! It will have to be studied carefully.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_SwampSecret_Done_01_11 " );	// I thank you for your help in this matter. Here, take it - you'll still need these scrolls.
	B_GiveInvItems(self,other,ItSc_IceWave,2);
	MIS_SwampSecret = LOG_Success;
	Log_SetTopicStatus(TOPIC_SwampSecret,LOG_Success);
	B_LogEntry(TOPIC_SwampSecret, " I gave Saturas an ancient tablet describing the magical properties of swamp grass. I think he will figure out the rest on his own. " );
};

instance DIA_Addon_Saturation_ADW_OpenPortal (C_Info) .
{
	npc = KDW_14000_Addon_Saturas_ADW;
	nr = 1;
	condition = DIA_Addon_Saturas_ADW_OpenPortal_condition;
	information = DIA_Addon_Saturas_ADW_OpenPortal_info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_Addon_Saturates_ADW_OpenPortal_condition();
{
	if(AdanosPortalOpen == TRUE)
	{
		return TRUE;
	};
};

func void DIA_Addon_Saturation_ADW_OpenPortal_info()
{
	B_GivePlayerXP(200);
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_OpenPortal_01_01 " );	// (bewildered) My son, what was that?!
	AI_Output(other, self, " DIA_Addon_Saturas_ADW_OpenPortal_01_02 " );	// What are you talking about?
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_OpenPortal_01_03 " );	// I'm talking about a bright flash of light that lit up the sky in the northeast of the valley.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_OpenPortal_01_04 " );	// And then it started to rain, even though there wasn't a single cloud in the sky.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_OpenPortal_01_05 " );	// I think it's all because of the magic portal. I activated it using the ancient magic of the Builders.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_OpenPortal_01_06 " );	// Incredible! But what is this portal and where does it lead?
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_OpenPortal_01_07 " );	// I don't know yet. But I'm going to find out soon.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_OpenPortal_01_08 " );	// If I were you, I'd be extremely careful. Perhaps there is something hidden behind this portal that we are better off avoiding!
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_OpenPortal_01_10 " );	// Though I guess my words won't stop you.
	AI_Output(other,self, " DIA_Addon_Saturas_ADW_OpenPortal_01_11 " );	// You know me well.
	AI_Output(self,other, " DIA_Addon_Saturas_ADW_OpenPortal_01_12 " );	// (sighing) Okay. But remember, the consequences can be unpredictable!
	SaturasKnowPortalOpenDay = Wld_GetDay();
	MIS_LostPower = LOG_Running;
	Log_CreateTopic(TOPIC_LostPower,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_LostPower,LOG_Running);
	B_LogEntry(TOPIC_LostPower, " I told Saturas that I had opened a strange magical portal in the northeast of the valley. He told me to stay away from it for fear of what might be hidden on the other side. At least for now. " );
	AI_StopProcessInfos(self);
};
