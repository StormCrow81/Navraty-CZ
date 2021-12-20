instance DMT_1212_DAGOT_EXIT(C_Info)
{
	npc = dmt_1212_dagot;
	No. = 999 ;
	condition = dmt_1212_dagot_exit_condition;
	information = dmt_1212_dagot_exit_info;
	important = FALSE;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int dmt_1212_dagot_exit_condition()
{
	return TRUE;
};

func void dmt_1212_dagot_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DMT_1212_DAGOT_HELLO(C_Info)
{
	npc = dmt_1212_dagot;
	condition = dmt_1212_dagot_hello_condition;
	information = dmt_1212_dagot_hello_info;
	important = TRUE;
	permanent = FALSE ;
};

func int dmt_1212_dagot_hello_condition()
{
	if((Npc_KnowsInfo(other,DIA_Xardas_FirstEXIT) == TRUE) && (Npc_IsInState(self,ZS_Talk) == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1212_dagot_hello_info()
{
	B_GivePlayerXP(100);
	AI_Output (self, other, " DMT_1212_Dagot_Hello_01 " );	// I understand that it was you who expelled the Sleeper from this world?
	AI_Output (other, self, " DMT_1212_Dagot_Hello_02 " );	// Yes, it was me.
	AI_Output (self, other, " DMT_1212_Dagot_Hello_03 " );	// Xardas told a lot about you. Few of the heroes of this world have succeeded in such a thing!
	AI_Output (other, self, " DMT_1212_Dagot_Hello_04 " );	// Who are you? And what are you doing here, in the tower of Xardas?
	AI_Output (self, other, " DMT_1212_Dagot_Hello_05 " );	// I am Dagoth, one of the nine Guardians of the sacred Halls of Bacchan.
	AI_Output (other, self, " DMT_1212_Dagot_Hello_07 " );	// Are you also a necromancer and demon summoner like Xardas?
	AI_Output (self, other, " DMT_1212_Dagot_Hello_08 " );	// If you mean that I am endowed with the same abilities and the mighty power of the runes bestowed by Beliar as Xardas, yes.
	AI_Output (self, other, " DMT_1212_Dagot_Hello_10 " );	// But Xardas is just beginning to take the first steps of this path, while we - the Guardians - have been following it for a long time.
	AI_Output (self, other, " DMT_1212_Dagot_Hello_11 " );	// Our path is our life and the meaning of our stay in this world.
	AI_Output (other, self, " DMT_1212_Dagot_Hello_12 " );	// What is this path?
	AI_Output (self, other, " DMT_1212_Dagot_Hello_13 " );	// The Path of the Guardian. Its meaning cannot be understood and it cannot be defined in words. This is your essence, your inner world, your destiny!
	AI_Output (self, other, " DMT_1212_Dagot_Hello_14 " );	// Each living creature has its own path predetermined, which it will follow throughout its life - from birth to death.
	AI_Output (other, self, " DMT_1212_Dagot_Hello_15 " );	// What's my path?
	AI_Output (self, other, " DMT_1212_Dagot_Hello_16 " );	// This shouldn't worry you right now. As well as the reason for my stay here.
	AI_Output (other, self, " DMT_1212_Dagot_Hello_18 " );	// What deity do the Guardians serve? I very much doubt that those with the power of black magic are serving the gods.
	AI_Output (self, other, " DMT_1212_Dagot_Hello_19 " );	// Keepers don't serve anyone. Their goal is to keep the balance of this world from the destructive actions of Beliar, Innos and Adanos!
	AI_Output (other, self, " DMT_1212_Dagot_Hello_20 " );	// Adanos?! Isn't his very reason for existence the goal of maintaining balance between his brothers?
	AI_Output (self, other, " DMT_1212_Dagot_Hello_22 " );	// Listen: it doesn't matter what the deity is associated with - the crimson darkness of Beliar, the sacred light of Innos or the wise waters of Adanos ...
	AI_Output (self, other, " DMT_1212_Dagot_Hello_23 " );	// Their paths, despite their goals, cannot bring a state of equilibrium to this world or any other, because ...
	AI_Output (self, other, " DMT_1212_Dagot_Hello_24 " );	// ... there is no good without evil, just as there is no evil without good, just as there is no middle without a beginning and an end!
	AI_Output (self, other, " DMT_1212_Dagot_Hello_25 " );	// Each force by its intervention in this world violates the whole essence of the sacred balance ...
	AI_Output (self, other, " DMT_1212_Dagot_Hello_26 " );	// ... like how Beliar broke it by allowing the Sleeper to come into this world ...
	AI_Output (self, other, " DMT_1212_Dagot_Hello_27 " );	// ... or how Innos violated it by destroying the great Halls of the Beast with the help of his paladins ...
	AI_Output (self, other, " DMT_1212_Dagot_Hello_28 " );	// ... or how Adanos violated it, destroying all the creations of his brothers along with what he considered evil.
	AI_Output (self, other, " DMT_1212_Dagot_Hello_29 " );	// The Path of the Guardians is laid both between each of these paths and between their common path as a whole.
	AI_Output (self, other, " DMT_1212_Dagot_Hello_30 " );	// If you can understand all this - perhaps you can follow this path yourself.
	AI_Output (other, self, " DMT_1212_Dagot_Hello_31 " );	// So you're saying that I can become a Guardian too?
	AI_Output (self, other, " DMT_1212_Dagot_Hello_32 " );	// Possibly, but it's too early to talk about it now.
	AI_Output (other, self, " DMT_1212_Dagot_Hello_33 " );	// What are the Halls of Bacchan? I've never heard of them.
	AI_Output (self, other, " DMT_1212_Dagot_Hello_34 " );	// Sacred Halls of Bacchan ... The ancients called them the 'Halls of Chaos'. This is a place where there is nothing but emptiness ...
	AI_Output (self, other, " DMT_1212_Dagot_Hello_35 " );	// ... and a force capable of forever changing the face of this world!
	AI_Output (self, other, " DMT_1212_Dagot_Hello_36 " );	// And even powerful deities such as Innos, Beliar or Adanos will not be able to withstand this force if it comes into this world.
	AI_Output (self, other, " DMT_1212_Dagot_Hello_37 " );	// And we - the Guardians, the guardians of these Halls - are called to hide this place and the secret that it has kept for millennia.
	AI_Output (other, self, " DMT_1212_Dagot_Hello_39 " );	// What do you want from me now?
	AI_Output (self, other, " DMT_1212_Dagot_Hello_40 " );	// For now, I only suggest that you embark on this path, hero. And I can only offer you this once!
	AI_Output (self, other, " DMT_1212_Dagot_Hello_41 " );	// After that you cannot change your mind. So think carefully before giving me an answer ...
	AI_Output (self, other, " DMT_1212_Dagot_Hello_42 " );	// (domineering) So, your choice?
	DAGOT_MEET = TRUE;
	XARDAS_SPEAKDAGOT = FALSE;
	GUARDIAN_WAY = FALSE;
	Info_ClearChoices(dmt_1212_dagot_hello);
	Info_AddChoice (dmt_1212_dagot_hello, " No, this is too difficult for me. " , Dmt_1212_dagot_hello_no);
	Info_AddChoice(dmt_1212_dagot_hello,"I'm ready.",dmt_1212_dagot_hello_yes);
};

func void dmt_1212_dagot_hello_yes()
{
	AI_Output(other,self,"DMT_1212_Dagot_Hello_43");	//I'm ready.
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	GUARDIAN_WAY = TRUE;
	AI_Output (self, other, " DMT_1212_Dagot_Hello_44 " );	// Your decision is inscribed in the great Book of Destiny! You may not even realize what you have done now.
	AI_Output (self, other, " DMT_1212_Dagot_Hello_45 " );	// Although I had no doubt that it would be so - you chose the path of the Guardian before you were even born.
	AI_Output (other, self, " DMT_1212_Dagot_Hello_46 " );	// What should I do now?
	AI_Output (self, other, " DMT_1212_Dagot_Hello_47 " );	// Now you can go about your worldly affairs.
	AI_Output (self, other, " DMT_1212_Dagot_Hello_48 " );	// You will find out about the rest later.
	AI_Output(self,other,"DMT_1212_Dagot_Hello_49");	//Goodbye.
	MIS_GUARDIANS = LOG_Running;
	Log_CreateTopic(TOPIC_GUARDIANS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUARDIANS,LOG_Running);
	B_LogEntry ( TOPIC_GUARDIANS , " In the tower of Xardas, I met one of the Guardians - Dagoth, the ancient guardian of the sacred Halls of Bacchan. " );
	Log_AddEntry ( TOPIC_GUARDIANS , " I accepted Dagoth's offer to follow the Guardian's path. After that he suddenly disappeared. This is probably not our last meeting. I need to consult with Xardas. " );
	Info_ClearChoices(dmt_1212_dagot_hello);
	Info_AddChoice (dmt_1212_dagot_hello, " Hey, wait ... (I should talk to Xardas about this) " , dmt_1212_dagot_endyes);
};

func void dmt_1212_dagot_hello_no()
{
	AI_Output (other, self, " DMT_1212_Dagot_Hello_50 " );	// No, this is all too complicated for me.
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	AI_Output (self, other, " DMT_1212_Dagot_Hello_51 " );	// Your decision is inscribed in the great Book of Destiny! You may not even realize what you have done now.
	AI_Output (self, other, " DMT_1212_Dagot_Hello_52 " );	// Your answer disappointed me greatly. But this is exactly how it should have been.
	AI_Output (self, other, " DMT_1212_Dagot_Hello_53 " );	// We will never meet again. Goodbye!
	GUARDIAN_WAY = FALSE;
	MIS_GUARDIANS = LOG_Running;
	Log_CreateTopic(TOPIC_GUARDIANS,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUARDIANS,LOG_Running);
	B_LogEntry ( TOPIC_GUARDIANS , " In the tower of Xardas, I met one of the Guardians - Dagoth, the ancient guardians of the sacred Halls of Bacchan. " );
	Log_AddEntry ( TOPIC_GUARDIANS , " I turned down his offer to enter the Guardian's path. We will never meet again. I must consult with Xardas. " );
	Info_ClearChoices(dmt_1212_dagot_hello);
	Info_AddChoice (dmt_1212_dagot_hello, " ... (I should talk to Xardas about this) " , dmt_1212_dagot_endno);
};

func void dmt_1212_dagot_endyes()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
	Wld_InsertNpc(Wisp,"NW_DMT_1212_DAGOT");
	Wld_InsertNpc(Wisp,"NW_DMT_1213_MORIUS");
	Wld_InsertNpc(Wisp,"NW_DMT_1214_TEGON");
	Wld_InsertNpc(Wisp,"NW_DMT_1215_KELIOS");
	Wld_InsertNpc(Wisp,"NW_DMT_1216_DEMOS");
	Wld_InsertNpc(Wisp,"NW_DMT_1217_FARION");
	Wld_InsertNpc(Wisp,"NW_DMT_1218_GADER");
	Wld_InsertNpc(Wisp,"NW_DMT_1219_NARUS");
	Wld_InsertNpc(Wisp,"NW_DMT_1220_WAKON");
	Wld_InsertNpc(Wisp,"NW_DMT_1297_STONNOS");
};

func void dmt_1212_dagot_endno()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};


instance DMT_1212_DAGOT_HELLOTWO(C_Info)
{
	npc = dmt_1212_dagot;
	condition = dmt_1212_dagot_hellotwo_condition;
	information = dmt_1212_dagot_hellotwo_info;
	important = TRUE;
	permanent = FALSE ;
};


func int dmt_1212_dagot_hellotwo_condition()
{
	if((MIS_GUARDIANS == LOG_Running) && (XARDAS_SPEAKDAGOT == TRUE))
	{
		return TRUE;
	};
};

func void dmt_1212_dagot_hellotwo_info()
{
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_00 " );	// So, your path led you here.
	AI_Output (other, self, " DMT_1212_Dagot_HelloTwo_02 " );	// How did you get here?
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_04 " );	// Don't be surprised by this. Our meeting was already predetermined at the moment when you accepted my offer.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_05 " );	// Sooner, later. It does not matter. All that matters is the fact that it happened and you are here.
	AI_Output (other, self, " DMT_1212_Dagot_HelloTwo_06 " );	// Have you been waiting for me? What for?
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_07 " );	// My presence here, like our meeting, means that it's time for you to learn more about us - the Guardians ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_08 " );	// ... and take your first step towards your destiny.
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_09");	//Are you ready?
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_10");	//Yes, master.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_11 " );	// Good. Listen to me carefully...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_12 " );	// At the dawn of ancient times, the world was plunged into chaos. It was not like the world that surrounds you now.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_13 " );	// There was nothing in this world - one endless emptiness. In this chaos, four elements were born - Earth, Water, Stone and Fire.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_14 " );	// But in the chaos, these elements carried only destruction. And there was no rest for them in their eternal struggle among themselves.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_15 " );	// And all this would lead to one fact: that they would destroy themselves and sink into oblivion ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_16 " );	// And they understood: in a reality ruled by Chaos, they would have no place. Only by getting rid of it, could they find peace.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_17 " );	// Then, having come to a fretful harmony with each other, the elements were able to expel the Great Chaos and imprison it in the place where it was generated ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_18 " );	// In the Halls of Bacchan ... Forever hiding it from this world behind the sacred gates, imposing on them the great seal of eternity.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_19 " );	// And so that no one else could open these gates, each element gave birth to its own deity ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_20 " );	// So four brother deities came to this world ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_21 " );	// Innos, born of flaming Fire, was the first of the brothers ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_22 " );	// The second was Beliar, who was spawned by the earthly Darkness ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_23 " );	// Adanos became a deity, which was spawned by the Surface of Water ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_24 " );	// And the fourth of the brothers was Stonnos - the deity who gave birth to the solid Rock ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_25 " );	// And these deities kept the secret of the seal and what is hidden by it.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_26 " );	// But the brothers could not live in harmony for long, since each considered himself the One True God, not accepting the balance of the elements.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_27 " );	// And it so happened that Beliar, having argued with his brother Stonnos, killed him in desperate rage ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_28 " );	// And there were three of them ... That is why the name of the fourth deity has been forgotten by the tongues of mortals.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_29 " );	// Innos, the first of the brothers, condemned Beliar's actions, and since then the brothers have hated each other ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_30 " );	// Adanos did not take either the side of Innos, or the side of Beliar, but stood between them, identifying himself with the wise middle in their confrontation.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_31 " );	// And the brothers forgot why they were sent to this world. And the more their struggle flared up among themselves ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_32 " );	// ... the more the great seal of eternity, which guarded against true evil, weakened.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_33 " );	// And there was a danger that Chaos will again take possession of this world and plunge everyone into the void of nothingness.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_34 " );	// Then the primal elements that gave birth to these deities, and no longer wanted to look at their enmity and feared the appearance of Chaos in this world ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_35 " );	// ...told each deity to create three Guardians from a piece of themselves ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_36 " );	// ... so that those endowed with the strength and wisdom of their creators could take guardianship of the Halls of Bacchan.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_37 " );	// The element itself created one guard, endowing him with the power of three and by the consent of the other elements ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_38 " );	// ... so that there was no more disagreement among the guards, as well as between their creators, and put him in charge of all the others.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_39 " );	// And so there were nine Guardians of the sacred Circle of Equilibrium and Balance, and the main Guardian, the lord of Bacchan and the lord of the four elements ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_40 " );	// ... and to this day, the Guardians stand guard over the sacred Halls.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_41 " );	// This world has been granted many millennia of peace and tranquility.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_42 " );	// But the enmity between Innos and Beliar grew with irresistible force, and the consequences of this enmity became more and more terrible ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_43 " );	// And Innos created man, and endowed him with his divine power, and Beliar created the beast, giving him his rage and anger ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_44 " );	// And just like the brothers, man and beast started a war against each other on Earth ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_45 " );	// And soon this fratricidal confrontation began to threaten this world to the same extent as Chaos once threatened all living things.
	AI_Output (other, self, " DMT_1212_Dagot_HelloTwo_46 " );	// What did Adanos do? The third of the brothers ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_47 " );	// Adanos, seeing that he could not reconcile his brothers, protected his sacred domain from their destructive enmity ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_48 " );	// ... And he forbade his brothers to sow terror and death where neither Innos nor Beliar had power - destroying everything that disturbed his sacred peace.
	AI_Output (other, self, " DMT_1212_Dagot_HelloTwo_49 " );	// I see. What can we do about it?
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_50 " );	// We - the Guardians - are able to keep this world from destruction, leading its existence along the path of balance and balance of power.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_51 " );	// Therefore, our intervention in the divine conflict only has the goal of not letting one of the parties gain the upper hand.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_52 " );	// That is why Xardas was able to solve the riddle of the Sleeper, thereby nullifying all of Beliar's efforts to bring one of his most powerful demons into this world.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_53 " );	// This is why the paladins of Innos were unable to destroy the two remaining Halls of Irdorat, as they simply disappeared. The elements hid them from the gaze of Innos' servants.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_54 " );	// And that is why the wrath of Adanos could not prevent the arrival of the most powerful artifacts of antiquity, created by his brothers, into this world.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_55 " );	// This is the wisdom of the path of the Guardians, which you are now a part of ...
	AI_Output (other, self, " DMT_1212_Dagot_HelloTwo_56 " );	// But how can I become a Guardian like you?
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_57 " );	// Naturally, you cannot become exactly like us, since our origin is divine.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_58 " );	// But, like all deities in this world, we, the Guardians, also have followers from the dead, who embody our thoughts and will.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_59 " );	// Like the paladins of Innos and the Fire mages, like the water mages of Adanos and his ring, like the servants of Beliar and all the creatures of Darkness - our warriors bear the name of the sacred Circle of Guardians ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_60 " );	// ... on our lips and our faith in our hearts!
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_61 " );	// The Asgardians are warriors of the elements, that is how they bear the name. From time immemorial, they stood guard over the Guardians and their great secret.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_62 " );	// And only a select few of them were honored to bear the name of the Prophet - the greatest spellcaster of the four elements, whose power was bestowed by the sacred knowledge of the Circle of Guardians.
	AI_Output (other, self, " DMT_1212_Dagot_HelloTwo_63 " );	// So my path is the path of a warrior of the elements?
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_64 " );	// You are still far from becoming a great warrior of the elements. You just entered this path without taking a step along it.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_66 " );	// First of all, you must be honored to bear the name of an adept of our Circle.
	AI_Output (other, self, " DMT_1212_Dagot_HelloTwo_67 " );	// How can I get this honor, Master?
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_68 " );	// Only the Guardians themselves can decide whether you are worthy to wear it or not. Each Guardian will give you a test that you must pass.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_69 " );	// After you have received the approval of all nine Guardians, you will have to pass the Test of Faith, and only after passing it, you will be awarded this honor.
	AI_Output (other, self, " DMT_1212_Dagot_HelloTwo_70 " );	// Where can I find the Guardians, master?
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_71 " );	// (laughs) Don't try to look for them - your path itself will lead you to them, as it brought you to me.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_72 " );	// I will be the first Guardian whose test you must pass.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_73 " );	// And, having received my consent and approval, you can meet with the next of us.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_74 " );	// Having enlisted the support of all the Guardians, you will be honored to meet with the head of our Circle - the main Guardian, the ruler of Bacchan.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_75 " );	// He will explain to you what your Test of Faith is ... But now you are still very far from that ...
	AI_Output(other,self,"DMT_1212_Dagot_HelloTwo_76");	//I understand, master.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_77 " );	// So are you ready to take my test?
	MIS_GUARDIANSTEST = LOG_Running;
	Log_CreateTopic(TOPIC_GUARDIANSTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GUARDIANSTEST,LOG_Running);
	B_LogEntry ( TOPIC_GUARDIANSTEST , " In order to become a warrior of the elements, I must meet the Guardians' Circle. Each of them will test my strength and perseverance. At the end, there will be a Test of Faith, which will be offered by the Chief Guardian. " );
	Log_AddEntry ( TOPIC_GUARDIANSTEST , " Only after completing the challenge of one of the Guardians will I be able to appear before the next one. " );
	Log_AddEntry ( TOPIC_GUARDIANS , " In one of the caves, I crossed paths with the Guardian again. Dagoth told me the legends of the past. I learned about the beginning of the world, about the gods, about the struggle of the gods, about the hatred of the gods, about the Guardians. About the sacred Circle of balance and balance. " );
	Log_AddEntry ( TOPIC_GUARDIANS , " Dagoth told me that no mortal can become a Guardian, and that my path is the path of the warrior of the elements, Asgard. This is the goal I will come to at the end of my path. " );
	Info_ClearChoices(dmt_1212_dagot_hellotwo);
	Info_AddChoice (dmt_1212_dagot_hellotwo, " Yes, master. I'm ready. " , Dmt_1212_dagot_hellotwo_test);
};

func void dmt_1212_dagot_hellotwo_test()
{
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output (other, self, " DMT_1212_Dagot_HelloTwo_78 " );	// Yes, master. I'm ready.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_79 " );	// Good. I am Dagoth, the first Guardian of the god Beliar and the seventh Guardian of the sacred Halls of Bacchan, - I give you your first test ...
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_80 " );	// You must find and destroy one of Baal's ancient flame demons - Lucian. Bring me his heart and you will pass my test.
	AI_Output (other, self, " DMT_1212_Dagot_HelloTwo_81 " );	// It won't be easy. Where can I find this demon?
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_82 " );	// Nobody said that the path you chose would be an easy walk. You have to find it yourself.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_99 " );	// But I can give you one piece of advice. If you're in doubt about something, it's best to go back to the beginning.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_83 " );	// Lucian is an ancient creature that has come from the time of the emergence of this world. Meeting with him for a mere mortal is almost the same as certain death.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_84 " );	// I don't care how you do it. But without his heart, you cannot get my consent.
	AI_Output (other, self, " DMT_1212_Dagot_HelloTwo_85 " );	// Ok, I'll find and destroy this demon.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_86 " );	// Good! I will wait for you here.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_87 " );	// (domineering) And one more thing.
	AI_Output (self, other, " DMT_1212_Dagot_HelloTwo_88 " );	// Take this ring from me. Perhaps it will be useful to you.
	B_GiveInvItems(self,other,itri_guardians_01,1);
	AI_Output(self,other,"DMT_1212_Dagot_HelloTwo_89");	//Now go.
	MIS_DAGOTTEST = LOG_Running;
	Log_CreateTopic(TOPIC_DAGOTTEST,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DAGOTTEST,LOG_Running);
	B_LogEntry ( TOPIC_DAGOTTEST , " Guardian Dagoth gave me my first test. I must destroy the ancient demon Lucian and bring his heart to Dagoth as proof. " );
	GUARDIAN_RING = FALSE;
	AI_StopProcessInfos(self);
	Wld_InsertNpc(XOR_12207_WARRIORNATURE,"NW_XARDAS_TOWER_VALLEY_09");
	Wld_InsertNpc(luzian_demon,"NW_XARDAS_TOWER_SECRET_CAVE_04");
};

instance DMT_1212_DAGOT_LUZIAN (C_Info)
{
	npc = dmt_1212_dagot;
	no. = 1 ;
	condition = dmt_1212_dagot_luzian_condition;
	information = dmt_1212_dagot_luzian_info;
	permanent = FALSE ;
	description = " I brought you Lucian's heart! " ;
};

func int dmt_1212_dagot_luzian_condition ()
{
	if((MIS_GUARDIANSTEST == LOG_Running) && (MIS_DAGOTTEST == LOG_Running) && (Npc_HasItems(other,itat_luzianheart) >= 1) && Npc_IsDead(luzian_demon))
	{
		return TRUE;
	};
};

func void dmt_1212_dagot_luzian_info ()
{
	B_GivePlayerXP(100);
	AI_Output (other, self, " DMT_1212_Dagot_Luzian_00 " );	// I brought you Lucian's heart!
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_01");	//Show it to me.
	B_GiveInvItems (other, self, itat_luzianheart, 1 );
	AI_Output (self, other, " DMT_1212_Dagot_Luzian_02 " );	// Yes, this is his heart! You proved that you are capable of much, and did not lose heart in the face of mortal danger.
	MIS_DAGOTTEST = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_DAGOTTEST,LOG_SUCCESS);
	B_LogEntry ( TOPIC_DAGOTTEST , " I brought Lucian's heart to Guardian Dagoth, and thus passed my first test. " );
	Info_ClearChoices (dmt_1212_dagot_luzian);
	Info_AddChoice (dmt_1212_dagot_luzian, " Now will you give me your consent, master? " , Dmt_1212_dagot_luzian_pass);
};

func void dmt_1212_dagot_luzian_pass ()
{
	AI_Output (other, self, " DMT_1212_Dagot_Luzian_03 " );	// Now will you give me your consent, master?
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output (self, other, " DMT_1212_Dagot_Luzian_04 " );	// You have proven yourself worthy of my consent.
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_05");	//It is given!
	AI_Output (self, other, " DMT_1212_Dagot_Luzian_06 " );	// Now go! Look for the next Guardian - he will give you your next test.
	AI_Output(self,other,"DMT_1212_Dagot_Luzian_07");	//Goodbye.
	B_LogEntry ( TOPIC_GUARDIANSTEST , " I have received the consent of the Guardian of Dagoth to be accepted into the Circle of Adepts. Now I must seek the next Guardian and pass my next test. " );
	DAGOT_AGREE = TRUE;
	B_RemoveNpc(XOR_12207_WARRIORNATURE);
	Info_ClearChoices (dmt_1212_dagot_luzian);
	Info_AddChoice (dmt_1212_dagot_luzian, " (end conversation) " , dmt_1212_dagot_luzian_end);
};

func void dmt_1212_dagot_luzian_end ()
{
	Npc_ExchangeRoutine(self,"WaitInSecretLab");
	AI_StopProcessInfos(self);
	B_Attack(self,other,0,0);
};
