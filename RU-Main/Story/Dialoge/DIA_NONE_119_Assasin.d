
instance DIA_NONE_119_Assasin_EXIT(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 999;
	condition = DIA_NONE_119_Assasin_EXIT_Condition;
	information = DIA_NONE_119_Assasin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_119_Assasin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_119_Assasin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_119_Assasin_PICKPOCKET(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 900;
	condition = DIA_NONE_119_Assasin_PICKPOCKET_Condition;
	information = DIA_NONE_119_Assasin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_NONE_119_Assasin_PICKPOCKET_Condition()
{
	return  C_Robbery ( 95 , 350 );
};

func void DIA_NONE_119_Assasin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_NONE_119_Assasin_PICKPOCKET);
	Info_AddChoice(DIA_NONE_119_Assassin_PICKPOCKET,Dialog_Back,DIA_NONE_119_Assassin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_NONE_119_Assassin_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_NONE_119_Assassin_PICKPOCKET_DoIt);
};

func void DIA_NONE_119_Assasin_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_NONE_119_Assasin_PICKPOCKET);
};

func void DIA_NONE_119_Assasin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_NONE_119_Assasin_PICKPOCKET);
};


instance DIA_NONE_119_Assasin_PreHallo(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PreHallo_Condition;
	information = DIA_NONE_119_Assasin_PreHallo_Info;
	permanent = FALSE;
	description = " Who are you? " ;
};

func int DIA_NONE_119_Assasin_PreHallo_Condition()
{
	return TRUE;
};

func void DIA_NONE_119_Assasin_PreHallo_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PreHallo_01_00");	//Кто ты?
	AI_Output(self,other, " DIA_NONE_119_Assasin_PreHallo_01_01 " );	// My name is Gonzalez. And you don't need to know more.
};

instance DIA_NONE_119_Assassin_Hello (C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_Hallo_Condition;
	information = DIA_NONE_119_Assassin_Hello_Info;
	permanent = FALSE;
	description = " You don't look like a resident of this city. " ;
};

func int DIA_NONE_119_Assasin_Hallo_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_NONE_119_Assassin_PreHallo ) )
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_Hallo_Info()
{
	AI_Output(other,self, " DIA_NONE_119_Assasin_Hallo_01_00 " );	// You don't look like a resident of this city.
	AI_Output(self,other, " DIA_NONE_119_Assasin_Hallo_01_01 " );	// It's so striking, isn't it?
	AI_Output(self,other, " DIA_NONE_119_Assasin_Hallo_01_02 " );	// The tavern owner was also suspicious of me at first.
	AI_Output(self,other, " DIA_NONE_119_Assasin_Hallo_01_03 " );	// However, when he saw my tightly stretched purse of gold, he immediately changed his attitude.
	AI_Output(self,other, " DIA_NONE_119_Assasin_Hallo_01_04 " );	// Now I'm one of his best clients.
	AI_Output(self,other, " DIA_NONE_119_Assasin_Hallo_01_05 " );	// Everyone loves gold. And you probably do too.
	AI_Output(other,self, " DIA_NONE_119_Assasin_Hallo_01_06 " );	// What are you doing here?
	AI_Output(self,other, " DIA_NONE_119_Assasin_Hallo_01_07 " );	// Try to stay out of trouble whenever possible.
	AI_Output(self,other, " DIA_NONE_119_Assasin_Hallo_01_08 " );	// And I advise you to stick to the same.
};


instance DIA_NONE_119_Assasin_WorkFor(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_WorkFor_Condition;
	information = DIA_NONE_119_Assasin_WorkFor_Info;
	permanent = FALSE;
	description = " Do you have a job for me? " ;
};

func int DIA_NONE_119_Assasin_WorkFor_Condition()
{
	if ( Npc_KnowsInfo ( other , DIA_NONE_119_Assassin_Hello ))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_WorkFor_Info()
{
	AI_Output(other,self, " DIA_NONE_119_Assasin_WorkFor_01_00 " );	// Do you have a job for me?
	AI_Output(self,other, " DIA_NONE_119_Assasin_WorkFor_01_01 " );	// Hmmm... (thoughtfully) As such, I don't have a job for you.
	AI_Output(self,other, " DIA_NONE_119_Assasin_WorkFor_01_02 " );	// But I have one problem, maybe you can help me solve it.
	AI_Output(other,self, " DIA_NONE_119_Assasin_WorkFor_01_03 " );	// What exactly happened to you?
	AI_Output(self,other, " DIA_NONE_119_Assasin_WorkFor_01_04 " );	// You see, during my journey to Khorinis, I lost my sword.
	AI_Output(self,other, " DIA_NONE_119_Assasin_WorkFor_01_05 " );	// Or maybe it was stolen, I can't say for sure.
	AI_Output(self,other, " DIA_NONE_119_Assasin_WorkFor_01_06 " );	// And the local weapons didn't impress me too much. It is of very poor quality and quickly deteriorates.
	AI_Output(self,other, " DIA_NONE_119_Assasin_WorkFor_01_07 " );	// I'm sure you go to different places. And maybe you will come across something that will please me.
	AI_Output(self,other, " DIA_NONE_119_Assasin_WorkFor_01_08 " );	// I will reward you generously for this. Be sure.
	AI_Output(other,self, " DIA_NONE_119_Assasin_WorkFor_01_09 " );	// Okay, I'll try to find something suitable for you.
	AI_Output(self,other, " DIA_NONE_119_Assasin_WorkFor_01_10 " );	// Great! You really try.
	Log_CreateTopic(TOPIC_AssasinHelp,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AssasinHelp,LOG_Running);
	B_LogEntry(TOPIC_AssasinHelp, " I met a strange-looking stranger named Gonzalez in a waterfront tavern. He asked me to solve his problem - to find a weapon for him that he would like. According to him, the local weapons are too poor quality and cannot be relied upon in battle. " );
	MIS_AssasinHelp = LOG_Running;
};

instance DIA_NONE_119_Assasin_WorkForDone(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_WorkForDone_Condition;
	information = DIA_NONE_119_Assasin_WorkForDone_Info;
	permanent = FALSE;
	description = " I have something for you. " ;
};

func int DIA_NONE_119_Assasin_WorkForDone_Condition()
{
	if((MIS_AssasinHelp == LOG_Running) && (Npc_HasItems(other,ItMw_2H_Katana) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_WorkForDone_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_NONE_119_Assasin_WorkForDone_01_00 " );	// I have something for you.
	AI_Output(self,other, " DIA_NONE_119_Assasin_WorkForDone_01_01 " );	// Then show, don't delay. What you have there?
	AI_Output(other,self, " DIA_NONE_119_Assasin_WorkForDone_01_02 " );	// Hold on! I think you will like this weapon.
	AI_UnequipWeapons(self);
	B_ClearNpcInventory(self);
	B_GiveInvItems(other,self,ItMw_2H_Katana,1);
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_RemoveWeapon(self);
	AI_Output(self,other, " DIA_NONE_119_Assasin_WorkForDone_01_03 " );	// Incredible! Where did you get this blade?
	AI_Output(other,self, " DIA_NONE_119_Assasin_WorkForDone_01_04 " );	// One of the paladins gave it to me. This sword was one of his spoils of war, which he brought back from Varant.
	AI_Output(self,other, " DIA_NONE_119_Assasin_WorkForDone_01_05 " );	// Hmm, paladin? Well, it's quite possible.
	AI_Output(self,other, " DIA_NONE_119_Assasin_WorkForDone_01_06 " );	// As for the sword, I think you won't mind if I keep it.
	AI_Output(other,self, " DIA_NONE_119_Assasin_WorkForDone_01_07 " );	// What about the promised reward?
	AI_Output(self,other, " DIA_NONE_119_Assasin_WorkForDone_01_08 " );	// As agreed. Here is a thousand gold coins.
	B_GiveInvItems(self,other,ItMi_Gold,1000);
	AI_Output(self,other, " DIA_NONE_119_Assasin_WorkForDone_01_09 " );	// I guess that should be enough to make up for your troubles.
	MIS_AssasinHelp = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_AssasinHelp,LOG_SUCCESS);
	B_LogEntry(TOPIC_AssasinHelp, " I brought Gonzales a two-handed sword that I got from paladin Parsival. He was very pleased with this weapon. " );
};

instance DIA_NONE_119_Assasin_PrioratBlade(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratBlade_Condition;
	information = DIA_NONE_119_Assasin_PrioratBlade_Info;
	permanent = FALSE;
	description = " You're an assassin, aren't you? " ;
};

func int DIA_NONE_119_Assasin_PrioratBlade_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (BladePrioratKnowsAssasins == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratBlade_Info()
{
	AI_Output(other,self, " DIA_NONE_119_Assasin_PrioratBlade_01_00 " );	// You're an assassin, aren't you?
	AI_Output(self,other, " DIA_NONE_119_Assasin_PrioratBlade_01_01 " );	// Hmmm. (arrogantly) Did you figure it out yourself - or did someone tell you?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_02");	//Вижу, что я не ошибся. Тогда ты именно тот, кто мне нужен.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_03");	//У меня есть к тебе один вопрос, на который, я надеюсь, ты сможешь ответить.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_04");	//Неужели? Ну, спрашивай, если есть.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_05");	//Ты можешь взглянуть на этот клинок? Я слышал, что он из тех мест, где живете вы - ассасины.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_06");	//Хммм. (с интересом) Ты меня заинтересовал. Показывай его.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_07");	//Вот, держи.
	B_GiveInvItems(other,self,ItMw_1H_AssBlade,1);
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_08");	//Невероятно... Откуда он у тебя?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_09");	//По правде говоря, это очень долгая история, и...
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_10");	//(серьезно) У меня достаточно много времени, чтобы ее выслушать.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_11");	//И потом, если ты расскажешь мне, откуда у тебя этот клинок, то я отсыплю тебе такую гору золота, которую ты еще никогда не видел в своей жизни!
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_12");	//Я смотрю, он тебя сильно заинтересовал. Кстати, в основании клинка есть какая-то странная гравировка.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_13");	//В ней все и дело! Обычно такие клинки не редкость в наших краях.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_14");	//Но эти символы...(серьезно) Так ты мне расскажешь, как в твоих руках очутилось это оружие?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_15");	//Ну хорошо. Это оружие я забрал у одного очень странного типа. 
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_16");	//И как он выглядел?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_17");	//Его лица я не видел - оно было скрыто под маской.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_18");	//На лице маска, сверху капюшон, а на теле странного вида татуировки?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_19");	//Именно так.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_20");	//Тогда мне все ясно. А где именно ты его встретил?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_21");	//Я наткнулся на него в одной из пещер. Он истекал кровью.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_22");	//Но, несмотря на это, мне стоило больших трудов не дать ему убить себя.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_23");	//Тебе еще повезло, что ты остался жив! Обычно встреча с этими людьми - это последнее, что человек видит в своей жизни.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_24");	//А кто они? Похоже, ты что-то знаешь о них.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_25");	//Больше, чем ты думаешь.

	if(MIS_AssasinHelp == LOG_SUCCESS)
	{
		B_GivePlayerXP(500);
		B_GiveInvItems(self,other,ItMw_1H_AssBlade,1);
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_26");	//Может, тогда расскажешь мне о них?
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_27");	//Хммм...(задумчиво) А для тебя это так важно?
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_28");	//Ты не представляешь, насколько.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_29");	//Ну хорошо. Ты все-таки помог мне в моей проблеме. А я помогу тебе...
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_30");	//Тогда слушай внимательно. Те, с кем ты столкнулся в лесу, именуют себя Тенями Масиафа.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_31");	//Это древнее Братство безжалостных убийц, которое наводит страх на всех жителей Варанта только при одном упоминании их имени.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_32");	//Полагаю, что ты и сам смог убедится в том, насколько сильны и беспощадны эти люди.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_33");	//Здешние местные головорезы - просто дети по сравнению с бойцами Масиафа.
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_34");	//И неужели никто не пытался разделаться с ними?
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_35");	//Это не так просто, малыш. (ехидно) Выследить даже одного из них практически не представляется возможным. 
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_36");	//И то, что тебе это удалось, крайне меня удивляет!
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_37");	//Во-вторых, услугами Теней иногда пользуются некоторые влиятельные ассасины, решая свои проблемы с помощью их кинжалов.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_38");	//Поговаривают, что даже сам Зубен прибегал к услугам этого Братства.
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_39");	//Зубен?
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_40");	//(уважительно) Зубен. Это тот, кто на правах самого сильного из нас, ассасинов, правит Варантом уже долгие годы.
		AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBlade_01_41");	//Понимаю.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_42");	//Ну, а в-третьих, мало кто решится открыто выступить против них. Поскольку всем попросту дорога их собственная жизнь.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_43");	//Тени ничего, никому и никогда не прощают!
		B_LogEntry(TOPIC_PrioratStart,"Кажется, я нашел того, кого искал. Гонсалес, ассасин из Варанта, только при одном взгляде на загадочный клинок дал понять, что знает, кому он принадлежит. Его хозяином был один из воинов древнего Братства убийц Варанта, именуемого Тенями Масиафа.");
		AssBlaseHistory = TRUE;
	}
	else
	{
		B_GivePlayerXP(250);
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_44");	//Однако я тебе не слишком доверяю, чтобы обсуждать с тобой подобные вещи.
		AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBlade_01_45");	//Вот, возьми свой клинок обратно. Все, что я хотел узнать, я уже выяснил.
		B_GiveInvItems(self,other,ItMw_1H_AssBlade,1);
		B_LogEntry(TOPIC_PrioratStart,"Кажется, я нашел того, кого искал. Гонсалес, ассасин из Варанта, только при одном взгляде на загадочный клинок дал понять что знает, кому он принадлежит. Однако он пока недостаточно мне доверяет, чтобы обсуждать со мной подобные темы.");
		AssDoNotTrust = TRUE;
	};
};

instance DIA_NONE_119_Assasin_PrioratBladeTrust(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratBladeTrust_Condition;
	information = DIA_NONE_119_Assasin_PrioratBladeTrust_Info;
	permanent = FALSE;
	description = "Может, теперь ты расскажешь, кто эти люди?";
};


func int DIA_NONE_119_Assasin_PrioratBladeTrust_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (MIS_AssasinHelp == LOG_SUCCESS) && (AssDoNotTrust == TRUE) && (AssBlaseHistory == FALSE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratBladeTrust_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_00");	//Может, теперь ты расскажешь, кто эти люди?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_01");	//Хммм... (задумчиво) А для тебя это так важно?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_02");	//Ты не представляешь, насколько.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_03");	//Ну хорошо. Ты все-таки помог мне в моей проблеме. А я помогу тебе...
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_04");	//Тогда слушай внимательно. Те, с кем ты столкнулся в лесу, именуют себя Тенями Масиафа.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_05");	//Это древнее Братство безжалостных убийц, которое наводит страх на всех жителей Варанта только при одном упоминании их имени.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_06");	//Полагаю, что ты и сам смог убедится в том, насколько сильны и беспощадны эти люди.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_07");	//Здешние головорезы просто дети по сравнению с бойцами Масиафа.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_08");	//И неужели никто не пытался разделаться с ними?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_09");	//Это не так просто, малыш. (ехидно) Выследить даже одного из них практически не представляется возможным. 
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_10");	//И то, что тебе это удалось, крайне меня удивляет!
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_11");	//Во-вторых, услугами Теней иногда пользуются некоторые влиятельные ассасины, решая свои проблемы с помощью их кинжалов.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_12");	//Поговаривают, что даже сам Зубен прибегал к услугам этого ордена.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_13");	//Зубен?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_14");	//Зубен. (уважительно) Это тот, кто на правах самого сильного из нас, ассасинов, правит Варантом уже долгие годы.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_15");	//Понимаю.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_16");	//Ну, а в-третьих, мало кто решится открыто выступить против них. Поскольку всем попросту дорога их собственная жизнь.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeTrust_01_17");	//Тени ничего, никому и никогда не прощают!
	B_LogEntry(TOPIC_PrioratStart,"По словам Гонсалеса, загадочное оружие принадлежало одному из воинов древнего ордена убийц Варанта, именуемого Тенями Масиафа.");
	AssBlaseHistory = TRUE;
};

instance DIA_NONE_119_Assasin_TellAboutVarrant(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 2;
	condition = DIA_NONE_119_Assasin_TellAboutVarrant_Condition;
	information = DIA_NONE_119_Assasin_TellAboutVarrant_Info;
	permanent = FALSE;
	description = "Расскажи мне о Варанте.";
};

func int DIA_NONE_119_Assasin_TellAboutVarrant_Condition()
{
	if(AssBlaseHistory == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_TellAboutVarrant_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_TellAboutVarrant_01_00");	//Расскажи мне о Варанте.
	AI_Output(self,other,"DIA_NONE_119_Assasin_TellAboutVarrant_01_01");	//Да что тут рассказывать. Обычная пустыня. Кругом раскаленный песок, а над головой жаркое палящее солнце.
	AI_Output(self,other,"DIA_NONE_119_Assasin_TellAboutVarrant_01_02");	//Жара стоит такая, что легко может свести с ума неподготовленного человека!
	AI_Output(self,other,"DIA_NONE_119_Assasin_TellAboutVarrant_01_03");	//Но за долгие годы мы, местные жители, научились ее как-то переносить.
	AI_Output(other,self,"DIA_NONE_119_Assasin_TellAboutVarrant_01_04");	//Ясно.
};

instance DIA_NONE_119_Assasin_HotReduce(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 2;
	condition = DIA_NONE_119_Assasin_HotReduce_Condition;
	information = DIA_NONE_119_Assasin_HotReduce_Info;
	permanent = FALSE;
	description = "Ты можешь научить меня переносить жару?";
};

func int DIA_NONE_119_Assasin_HotReduce_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_NONE_119_Assasin_TellAboutVarrant) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_HotReduce_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_HotReduce_01_00");	//А МЕНЯ ты можешь научить переносить жару?
	AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduce_01_01");	//Хммм. (оценивающе) Даже и не знаю. Вообще-то этому учатся многие годы.
	AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduce_01_02");	//Но я могу дать тебе некоторые советы, как можно немного справиться с удушьем жары и солнечными ожогами.
	AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduce_01_03");	//Правда, тебе понадобится для этого некоторый опыт. Ну и от пары золотых монет я тоже не откажусь.
	GonsaCanTeachMeHot = TRUE;
};

instance DIA_NONE_119_Assasin_HotReduceTeach(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 800;
	condition = DIA_NONE_119_Assasin_HotReduceTeach_Condition;
	information = DIA_NONE_119_Assasin_HotReduceTeach_Info;
	permanent = TRUE;
	description = "Научи меня переносить жару (Очки обучения: 10, Цена: 5000 монет)";
};

func int DIA_NONE_119_Assasin_HotReduceTeach_Condition()
{
	if((GonsaCanTeachMeHot == TRUE) && (HotReduceKnow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_HotReduceTeach_Info()
{
	var int kosten;
	var int money;

	AI_Output(other,self,"DIA_NONE_119_Assasin_HotReduceTeach_01_00");	//Научи меня переносить жару.

	kosten = 10;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_01");	//Извини, но для этого у тебя еще не хватает опыта.
		AI_StopProcessInfos(self);
	};

	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_02");	//Извини, но бесплатно я этого делать не стану.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_03");	//Не делай лишних движений.
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_04");	//Двигайся как можно меньше, экономь силы.
		AI_Output(self,other,"DIA_NONE_119_Assasin_HotReduceTeach_01_05");	//Жара может быть более изнуряющей, чем бой с целой стаей монстров.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + kosten;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		hero.protection[PROT_FIRE] += 5;
		REALPROTFIRE += 5;
		AI_Print(PRINT_LEARNPROTHOT);
		HotReduceKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

instance DIA_NONE_119_Assasin_PrioratBladeKnown(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratBladeKnown_Condition;
	information = DIA_NONE_119_Assasin_PrioratBladeKnown_Info;
	permanent = FALSE;
	description = "А что насчет самого оружия?";
};

func int DIA_NONE_119_Assasin_PrioratBladeKnown_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssBlaseHistory == TRUE) && (Npc_HasItems(other,ItMw_1H_AssBlade) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratBladeKnown_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_00");	//А что насчет самого оружия?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_01");	//Мы, ассасины, называем его Кама. Легкое, очень прочное и смертельно опасное для тех, кто решится встать у него на пути.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_02");	//Но будь осторожен, если решишь использовать его. Лезвие этого клинка отравлено сильнодействующим ядом.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_03");	//Это большое преимущество в тех случаях, когда клинок бессилен.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratBladeKnown_01_04");	//Понимаю.
	Npc_RemoveInvItems(other,ItMw_1H_AssBlade,Npc_HasItems(other,ItMw_1H_AssBlade));
	CreateInvItems(other,ItMw_1H_AssBlade_Known,1);
	B_LogEntry(TOPIC_PrioratStart,"Само оружие ассасины называют Кама. Если я решу его использовать, то мне надо будет учесть, что лезвие клинка смазано сильнодействующим ядом и способно убить практически любое живое существо.");
};


instance DIA_NONE_119_Assasin_PrioratNeedFind(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratNeedFind_Condition;
	information = DIA_NONE_119_Assasin_PrioratNeedFind_Info;
	permanent = FALSE;
	description = "По поводу этого Братства...";
};


func int DIA_NONE_119_Assasin_PrioratNeedFind_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssBlaseHistory == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratNeedFind_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_01");	//По поводу этого Братства...
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_02");	//У тебя нет никаких мыслей насчет того, каким образом те парни могли оказаться на этом острове?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_03");	//По всей видимости, что-то привело их сюда. Просто так Братство никогда бы не покинуло Варант.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_04");	//Правда, ходили слухи, что в последнее время Масиаф стал слишком кровожаден, и это не особо пришлось по душе Зубену.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_05");	//В итоге под его давлением Теням пришлось скрыться на время.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_06");	//И, по всей видимости, этот остров пришелся им по душе.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_07");	//Полагаешь, у меня есть шансы отыскать их здесь?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_08");	//Ну, раз ты смог выследить одного из них, то и остальных, думаю, сможешь. Чем Белиар не шутит?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_09");	//Однако ты должен понимать, что в одиночку тебе вряд ли удастся справиться с ними.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_10");	//Поэтому если ты все-таки узнаешь, где находится их укрытие - не забудь сообщить мне об этом.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_11");	//А тебе-то это зачем?
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_12");	//Сейчас это не так важно. (серьезно) Просто дай знать, что нашел место, где скрывается Масиаф.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratNeedFind_01_13");	//Ну ладно.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratNeedFind_01_14");	//Смотри не забудь.
	GonsalesRemind = TRUE;
};


instance DIA_NONE_119_Assasin_AmuletFind(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_AmuletFind_Condition;
	information = DIA_NONE_119_Assasin_AmuletFind_Info;
	permanent = FALSE;
	description = "Полагаю, что эта вещица тебя заинтересует.";
};


func int DIA_NONE_119_Assasin_AmuletFind_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (AssInvasionStop == TRUE) && (NamibAmuletResearch == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_AmuletFind_Info()
{
	B_GivePlayerXP(250);
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_01");	//Полагаю, что эта вещица тебя заинтересует.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_02");	//Какая именно?
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_03");	//Вот, взгляни на этот амулет.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_04");	//Хммм. (задумчиво) Амулет? Нет, приятель, это вовсе не амулет. Хотя и выглядит довольно схоже.
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_05");	//А что же тогда?
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_06");	//Этот медальон, что ты мне сейчас показал - не что иное, как тайный знак Братства Масиафа!
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_07");	//Ты в этом уверен?
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_08");	//Его очень трудно спутать с чем-либо еще, уж поверь мне.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_09");	//И, раз ты держишь его у себя в руках, то, значит, смог подобраться к ним ближе, чем это можно себе представить.
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_10");	//Что ты имеешь в виду?
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_11");	//Видишь этот металлический узор, изображенный в центре медальона? Он сделан не просто так.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_12");	//Если верить слухам, Тени Масиафа используют его в качестве ключа, чтобы открывать потайные ходы, ведущие в их логова.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_13");	//(задумчиво) Правда это или нет... никто точно не знает.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_14");	//Но заполучить подобную вещь представляется почти невозможным, если ты, конечно, не один из них.
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_15");	//Просто удача на моей стороне.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_16");	//Как знать. Многие предпочитают держаться от подобных вещей подальше.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_17");	//Но, по всей видимости, ты не из их числа.
	AI_Output(self,other,"DIA_NONE_119_Assasin_AmuletFind_01_18");	//(серьезно) И еще. Если вдруг найдешь что-нибудь интересное, сообщи об этом.
	AI_Output(other,self,"DIA_NONE_119_Assasin_AmuletFind_01_19");	//Хорошо.
	PlayerKnowsMasiafKey = TRUE;
	B_LogEntry(TOPIC_PrioratStart,"Я показал Гонсалесу тот амулет, что я нашел у одного из убийц. По его словам, этот амулет - тайный знак Братства Масиафа. Тени используют этот медальон в качестве ключа. Однако что именно можно открыть этим ключом, никто толком не знает. Гонсалес попросил меня сообщить ему, если я вдруг наткнусь на что-нибудь интересное.");
};

instance DIA_NONE_119_Assasin_PrioratFindOk(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 1;
	condition = DIA_NONE_119_Assasin_PrioratFindOk_Condition;
	information = DIA_NONE_119_Assasin_PrioratFindOk_Info;
	permanent = FALSE;
	description = "У меня есть для тебя новости.";
};

func int DIA_NONE_119_Assasin_PrioratFindOk_Condition()
{
	if((MIS_PrioratStart == LOG_Running) && (GonsalesRemind == TRUE) && (ReadyGoForMasiafLair == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_PrioratFindOk_Info()
{
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_01");	//У меня есть для тебя новости.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_02");	//Хммм...(ехидно) Надеюсь, что они хорошие.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_03");	//Я нашел тайный проход в скале. 
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_04");	//И что с того?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_05");	//Этот проход открылся, когда я использовал амулет, найденный у одного из твоих старых друзей.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_06");	//Вот это уже интересней! И ты уже ходил туда?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_07");	//Еще нет. Но я собираюсь отправиться туда и выяснить, что сокрыто по ту сторону прохода.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_08");	//Хорошо. Но прежде чем это сделать, я хочу, чтобы ты отвел меня к этому месту. Сможешь?
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_09");	//Конечно.
	AI_Output(self,other,"DIA_NONE_119_Assasin_PrioratFindOk_01_10");	//Тогда пошли. Пора немного прогуляться, а то эта таверна мне уже порядком надоела.
	AI_Output(other,self,"DIA_NONE_119_Assasin_PrioratFindOk_01_11");	//Иди за мной.
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine(self,"FollowMasiafLair");
	Log_CreateTopic(TOPIC_FollowMasiafLair,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_FollowMasiafLair,LOG_Running);
	B_LogEntry(TOPIC_FollowMasiafLair,"Гонсалес попросил меня отвести его к тайному проходу, который мне удалось открыть.");
	MIS_FollowMasiafLair = LOG_Running;
};


instance DIA_NONE_119_Assasin_ANGEKOMMEN(C_Info)
{
	npc = NONE_119_Assasin;
	nr = 55;
	condition = DIA_NONE_119_Assasin_ANGEKOMMEN_Condition;
	information = DIA_NONE_119_Assasin_ANGEKOMMEN_Info;
	important = TRUE;
};

func int DIA_NONE_119_Assasin_ANGEKOMMEN_Condition()
{
	if((MIS_FollowMasiafLair == LOG_Running) && (Npc_GetDistToWP(self,"NW_ASSASINS_ENTRANCE_01") < 2000))
	{
		return TRUE;
	};
};

func void DIA_NONE_119_Assasin_ANGEKOMMEN_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_00");	//Постой! Я уже вижу его.
	AI_Output(other,self,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_01");	//Да, этот тот самый проход, о котором я тебе говорил.
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_02");	//Спасибо, что довел. Дальше я как-нибудь сам.
	AI_Output(other,self,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_03");	//И что ты теперь собираешься делать?
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_04");	//Сначала немного передохну, а потом двину дальше - проверю, куда ведет эта пещера.
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_05");	//Кстати, если ты собрался сделать то же самое, то на твоем месте я бы сначала очень хорошо подготовился.
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_06");	//Ибо, если там окажется то, о чем я подумал... Это запросто может стать для тебя просто непосильной ношей.
	AI_Output(other,self,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_07");	//Хорошо, буду иметь в виду.
	AI_Output(self,other,"DIA_NONE_119_Assasin_ANGEKOMMEN_01_08");	//Не за что, приятель. Ладно, давай, еще увидимся.
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_FollowMasiafLair = LOG_SUCCESS;
	Log_SetTopicStatus(TOPIC_FollowMasiafLair,LOG_SUCCESS);
	B_LogEntry(TOPIC_FollowMasiafLair,"Я довел Гонсалеса до места назначения.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
};


//--------------------Гонсалес в PRIORAT-------------------------------



instance DIA_NONE_1190_Assasin_EXIT(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 999;
	condition = DIA_NONE_1190_Assasin_EXIT_Condition;
	information = DIA_NONE_1190_Assasin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_1190_Assasin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_1190_Assasin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assasin_PICKPOCKET(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 900;
	condition = DIA_NONE_1190_Assasin_PICKPOCKET_Condition;
	information = DIA_NONE_1190_Assasin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_NONE_1190_Assasin_PICKPOCKET_Condition()
{
	return  C_Robbery ( 95 , 350 );
};

func void DIA_NONE_1190_Assasin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_NONE_1190_Assasin_PICKPOCKET);
	Info_AddChoice(DIA_NONE_1190_Assassin_PICKPOCKET,Dialog_Back,DIA_NONE_1190_Assassin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_NONE_1190_Assassin_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_NONE_1190_Assassin_PICKPOCKET_DoIt);
};

func void DIA_NONE_1190_Assasin_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_NONE_1190_Assasin_PICKPOCKET);
};

func void DIA_NONE_1190_Assasin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_NONE_1190_Assasin_PICKPOCKET);
};


instance DIA_NONE_1190_Assasin_PreHallo(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_PreHallo_Condition;
	information = DIA_NONE_1190_Assasin_PreHallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_PreHallo_Condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_PreHallo_Info()
{
	AI_Output(self,other, " DIA_NONE_1190_Assasin_PreHallo_01_00 " );	// Aha, there you are! Come on, sit down by the fire, get warm.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_PreHallo_01_01 " );	// There's nowhere to hurry anyway.
};


instance DIA_NONE_1190_Assassin_Hello (C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Hallo_Condition;
	information = DIA_NONE_1190_Assassin_Hello_Info;
	permanent = FALSE;
	description = " What is this place? " ;
};

func int DIA_NONE_1190_Assasin_Hallo_Condition()
{
	return TRUE;
};

func void DIA_NONE_1190_Assasin_Hallo_Info()
{
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Hallo_01_00 " );	// What is this place?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_01 " );	// How should I know? I, like you, here for the first time.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_02 " );	// But I can advise you one thing - I would not go further than this place.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_03");	//Почему?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_04 " );	// Because there, except for death, nothing awaits you. Unless, of course, you're thinking of committing suicide.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Hallo_01_05 " );	// What's so dangerous there?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_06 " );	// Ahead is the sanctuary of the Brotherhood of Masyaf. (seriously) And I don't think these guys will be happy to see you.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Hallo_01_07 " );	// So we found their lair?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_08 " );	// Yes, but... The question is - what to do with all this now?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Hallo_01_09 " );	// And what are your thoughts on this?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_10 " );	// Well, in my opinion, I only see, umm... three solutions to this problem.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_11 " );	// If you are confident in your abilities, then we can try to attack them in the forehead.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_12 " );	// Although this is a completely stupid idea for me. Most likely, we will not even reach the gate of the temple.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_13 " );	// Because the odds are clearly not in our favor.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_14 " );	// Secondly, we can just walk away from here and forget about all this, like a bad dream.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_15 " );	// More precisely, only you will leave, since I did not cross the sea to abandon my plans so easily.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_16 " );	// Well, you'll save your own life. She's worth it, trust me.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Hallo_01_17 " );	// I don't want to upset you, but the back passage is filled with stones, so you can't just leave here.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_18 " );	// So much the better! So now you don't have to choose.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Hallo_01_19 " );	// Okay. And what about the third one?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_20 " );	// The last option is even worse than the first two. We must somehow try to get into the temple, but without too much noise.

	if((PlayerIsPrioratFake == FALSE) && (InsMasiafKillers == FALSE))
	{
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Hallo_01_21 " );	// Do you know how to do this?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_22 " );	// No. But I have one idea. And she might work.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Hallo_01_23 " );	// Then lay it out, don't delay.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Hallo_01_24 " );	// Good! So. (seriously) I've been here for a few days, and in that time I managed to sniff out something.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_25");	//Иногда из храма по направлению к вон той скале ходит один из послушников Масиаф.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_26");	//Сначала я не придал этому большого значения, - до тех пор, пока не увидел, с кем он возвращается обратно.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_27");	//И с кем же?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_28");	//Как оказалось, он вел с собой обратно в храм нескольких рабов.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_29");	//Я решил проверить то место, и, как оказалось, в скале есть пещера.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_30");	//Заходить вглубь я не стал, но, судя по всему, там они держат своих пленников.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_31");	//И что ты предлагаешь?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_32");	//Единственный шанс попасть в храм, не привлекая к себе внимания, это выдать себя за одного из них.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_01_33");	//План, конечно, хорош, но почему бы это не сделать тебе самому?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_34");	//Нет! Некоторые из них видели меня раньше. А вот ты - другое дело!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_35");	//Убьешь его, заберешь доспехи, и вместо него отведешь рабов обратно к святилищу. 
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_36");	//Уверен, что с одним-то бойцом ты должен справиться.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_37");	//А уж дальше решим, что нам делать.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_01_38");	//Ну так как, что скажешь?
		Info_ClearChoices(DIA_NONE_1190_Assasin_Hallo);
		Info_AddChoice(DIA_NONE_1190_Assasin_Hallo,"Я бы предпочел бой.",DIA_NONE_1190_Assasin_Hallo_Fight);
		Info_AddChoice(DIA_NONE_1190_Assasin_Hallo,"Надеюсь, что твой план сработает.",DIA_NONE_1190_Assasin_Hallo_Spy);
	}
	else
	{
		Info_ClearChoices(DIA_NONE_1190_Assasin_Hallo);
		Info_AddChoice(DIA_NONE_1190_Assasin_Hallo,"Я бы предпочел бой.",DIA_NONE_1190_Assasin_Hallo_Fight);
	};
};

func void DIA_NONE_1190_Assasin_Hallo_Fight()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_Fight_01_01");	//Я бы предпочел бой.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Fight_01_02");	//Эх, горячая ты голова, как я погляжу... 
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Fight_01_03");	//Но, раз ты так уверен в себе, то тогда не будем терять времени.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Fight_01_04");	//Иди вперед, я за тобой!
	PlayerChooseFight_PW = TRUE;
	PlayerIsPrioratFake = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_MasiafStory = LOG_Running;
	Log_CreateTopic(TOPIC_MasiafStory,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MasiafStory,LOG_Running);
	B_LogEntry(TOPIC_MasiafStory,"Я вновь повстречал Гонсалеса. По его словам, в этой долине находится храм Теней, Братства фанатиков Масиаф. Кажется, я нашел то, что искал. Теперь осталось понять, что нам делать дальше. Я без раздумий предложил Гонсалесу атаковать храм. Эта идея показалась ему немного абсурдной, но он поддержит меня. Итак, пора нам покончить с этим мерзким отродьем.");
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMasiafTemple");
	Npc_ExchangeRoutine(Ass_126_Haniar,"TOT");
	AI_Teleport(Ass_126_Haniar,"TOT");
	Wld_InsertNpc(Ass_129_DeadNrozas,"PW_INNER_DEMON_SPAWN");
};

func void DIA_NONE_1190_Assasin_Hallo_Spy()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Hallo_Spy_01_01");	//Надеюсь, что твой план сработает.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Spy_01_02");	//Если он не сработает, то в скором времени мы оба с тобой будем мертвы.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Spy_01_03");	//Тени поймут, что они не одни тут, и наверняка пошлют найти нас.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_Hallo_Spy_01_04");	//А это лишь всего вопрос времени!
	MIS_MasiafStory = LOG_Running;
	Log_CreateTopic(TOPIC_MasiafStory,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MasiafStory,LOG_Running);
	B_LogEntry(TOPIC_MasiafStory,"Я вновь повстречал Гонсалеса. По его словам, в этой долине находится храм фанатиков Масиаф. Кажется, я нашел то, что искал. Теперь осталось понять, что нам делать дальше. Гонсалес предложил пойти на хитрость и тайком проникнуть в храм. Каждое утро из храма по направлению к высокой горе ходит один из послушников Братства, а обратно он возвращается с пленными рабами. Если перехватить этот конвой, то, возможно, мне удастся без малейших подозрений проникнуть в святилище, выдав себя за послушника Масиаф.");
	PlayerChooseSpy_PW = TRUE;
	Info_ClearChoices(DIA_NONE_1190_Assasin_Hallo);
};

var int PW_BeginFakeOnceAgainQuest;

instance DIA_NONE_1190_Assasin_When(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_When_Condition;
	information = DIA_NONE_1190_Assasin_When_Info;
	permanent = TRUE;
	description = "Когда начнем?";
};

func int DIA_NONE_1190_Assasin_When_Condition()
{
	if((PlayerChooseSpy_PW == TRUE) && (PW_BeginFake == FALSE) && (PlayerIsPrioratFake == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_When_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_When_01_00");	//Когда начнем?

	if(Wld_IsTime(7,0,8,0))
	{
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_01");	//Сейчас. Думаю, что в это время он уже должен вести рабов обратно в храм.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_02");	//Но смотри, у тебя будет только один шанс.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_03");	//Если он от тебя сбежит, то поднимет тревогу. И тогда все пропало.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_04");	//Так что смотри не наломай дров.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_When_01_05");	//Постараюсь.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_06");	//И еще одна вещь, которую тебе следует знать. Ни с кем не заговаривай сам!
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_07");	//Насколько мне известно, у Масиафа свои правила на этот счет.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_08");	//Если ты сделаешь что-то не так, то все сразу поймут, кто ты.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_09");	//И живым ты уже оттуда не выйдешь. Запомнил?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_When_01_10");	//Да. А куда мне идти?
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_11");	//Иди прямо, вглубь долины, пока не выйдешь на небольшую тропку.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_12");	//Там и поджидай их. Теперь поспеши!
		B_LogEntry(TOPIC_MasiafStory,"Итак, пришло время действовать. Мне нужно выследить послушника и его рабов, после чего разделаться с ним и, одев его доспехи, попытаться проникнуть в храм Теней. Надеюсь, у меня все получится, иначе придется прорубать себе дорогу мечом.");
		PW_BeginFake = TRUE;
		AI_StopProcessInfos(self);
		Wld_InsertNpc(Ass_167_Adept_Convoy,"PW_CONVOY_START_01");
		Wld_InsertNpc(SEK_168_SLAVEOBSSEK,"PW_CONVOY_START_01");
	}
	else
	{
		if(PW_BeginFakeOnceAgainQuest == FALSE)
		{
			AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_13");	//Надо дождаться утра, примерно часов семи. (зевая) Раньше этого времени никто не появится.
			AI_Output(other,self,"DIA_NONE_1190_Assasin_When_01_14");	//Понимаю.
			PW_BeginFakeOnceAgainQuest = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_NONE_1190_Assasin_When_01_15");	//Я же сказал - ждем утра! Ты что, меня не слушаешь?
			AI_StopProcessInfos(self);
		};
	};
};

instance DIA_NONE_1190_Assasin_WhatYourGoal(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_WhatYourGoal_Condition;
	information = DIA_NONE_1190_Assasin_WhatYourGoal_Info;
	permanent = FALSE;
	description = "Что тебя связывает с Масиафом?";
};

func int DIA_NONE_1190_Assasin_WhatYourGoal_Condition()
{
	if(PlayerChooseSpy_PW == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_WhatYourGoal_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatYourGoal_01_00");	//Что тебя связывает с Масиафом?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatYourGoal_01_01");	//О, это долгая история. Может быть, потом я тебе ее расскажу.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatYourGoal_01_02");	//Но сейчас лучше не спрашивай.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatYourGoal_01_03");	//Ладно.
};


instance DIA_NONE_1190_Assasin_WhatAbout(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_WhatAbout_Condition;
	information = DIA_NONE_1190_Assasin_WhatAbout_Info;
	permanent = FALSE;
	description = "Что ты еще можешь рассказать мне про Масиаф?";
};

func int DIA_NONE_1190_Assasin_WhatAbout_Condition()
{
	if(PlayerChooseSpy_PW == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_WhatAbout_Info()
{
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatAbout_01_00");	//Что ты еще можешь рассказать мне про Масиаф?
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_01");	//Хммм... (задумчиво) Не очень много.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_02");	//Если быть кратким, то Масиаф - это слепые фанатики, не знающие ни жалости, ни милосердия.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_03");	//Их Братству насчитывается уже несколько столетий, и иcпокон веков их имя вызывало только страх и трепет.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_04");	//Этих людей, если их так и можно назвать, в чем я лично сомневаюсь...(серьезно) ...ничего не остановит на их пути.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_05");	//Будучи выходцами из Варанта, они поклоняются Белиару, как и все ассасины.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_06");	//Однако вместо золота они приносят ему в дар человеческие жизни!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_07");	//Поговаривают, что сам Белиар покровительствует им лично, но это всего лишь слухи.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_08");	//Сами законы Масиафа жестоки и суровы. 
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_09");	//Железная дисциплина и изнурительные тренировки делают их бойцов лучшими войнами, которых мне доводилось видеть.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_10");	//Я лично наблюдал, как один единственный элитный боец Масиаф перебил всю охрану в несколько десятков человек одного из наместников Зубена!
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_11");	//После чего, судя по всему, у них и начались проблемы, из-за которых им пришлось покинуть материк и перебраться сюда.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_WhatAbout_01_12");	//Так что против нас выступает достойнейший противник, которого ни в коем случае нельзя недооценивать.
};

instance DIA_NONE_1190_Assasin_WhatAdvise(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_WhatAdvise_Condition;
	information = DIA_NONE_1190_Assasin_WhatAdvise_Info;
	permanent = FALSE;
	description = "Можешь дать мне какой-нибудь совет?";
};

func int DIA_NONE_1190_Assasin_WhatAdvise_Condition()
{
	if(PlayerChooseSpy_PW == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_WhatAdvise_Info()
{
	AI_Output(other,self, " DIA_NONE_1190_Assasin_WhatAdvise_01_00 " );	// Can you give me some advice?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhatAdvise_01_01 " );	// Don't do anything you're not sure about.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhatAdvise_01_02 " );	// In our business, any inaccuracy will lead to failure, and even worse, to your death.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhatAdvise_01_03 " );	// Also, when you go to the temple, it's better to take off your helmet and shield.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatAdvise_01_04");	//Почему?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhatAdvise_01_05 " );	// This will easily give you away! Masyaf fighters do not use these types of protection.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhatAdvise_01_06 " );	// And don't you dare steal anything there! Thieves are not welcome anywhere ...
	AI_Output(other,self,"DIA_NONE_1190_Assasin_WhatAdvise_01_07");	//Ясно.
	B_LogEntry(TOPIC_MasiafStory, " Gonzalez advised me to take off my helmet and shield if I went to the Temple of Masyaf. The shadows don't use this type of armor and will easily figure me out as a stranger if I wear them. Well, it's not worth stealing there either. " );
};

instance DIA_NONE_1190_Assasin_InHram (C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_InHram_Condition;
	information = DIA_NONE_1190_Assasin_InHram_Info;
	permanent = FALSE;
	description = " I managed to get into the temple. " ;
};

func int DIA_NONE_1190_Assasin_InHram_Condition()
{
	if(MeetNrozas == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_InHram_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_InHram_01_00 " );	// I managed to get into the temple.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_InHram_01_01 " );	// So you managed to pass for one of their acolytes? This is good news! What else?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_InHram_01_03 " );	// I brought an acolyte to a certain Nrozas. Everyone else called him the master.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_InHram_01_04 " );	// Apparently, this is one of the priors of Masyaf.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_InHram_01_05 " );	// And who are they?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_InHram_01_06 " );	// As far as I know, these people are at the head of the entire Brotherhood and enjoy unlimited respect among fanatics.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_InHram_01_07 " );	// Therefore, you need to be especially careful with them!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_InHram_01_08 " );	// Nrozas has given me some errands that I must complete.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_InHram_01_09 " );	// I guess we should take advantage of this opportunity then.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_InHram_01_10 " );	// If you prove yourself, you might win his respect, and it will give us the opportunity to learn a little more about them.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_InHram_01_11 " );	// So keep doing their errands, if any.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_InHram_01_12 " );	// And hopefully we'll eventually find their weak spot, and then we'll strike the killing blow!
	AI_Output(other, self, " DIA_NONE_1190_Assasin_InHram_01_13 " );	// I understood everything
	B_LogEntry(TOPIC_MasiafStory, " I told Gonzales that I managed to get into the temple of Masiaf. He was surprised by my agility, and advised me to be a novice and take a closer look. " );
};

instances DIA_NONE_1190_Assassin_NARUG (C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NARUG_Condition;
	information = DIA_NONE_1190_Assassin_NARUG_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_NARUG_Condition()
{
	if ((MY_AssassinGold == LOG_Running) && (SickIsDeadNow ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NARUG_Info()
{
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NARUG_01_00 " );	// Oh, it's you... (terribly) And I already thought that I would have to shed blood again today.
	AI_RemoveWeapon(self);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NARUG_01_01 " );	// You killed him?!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NARUG_01_02 " );	// As you can see. I'm sorry, but I didn't have a choice.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NARUG_01_03 " );	// I don't know how he could find me, but I couldn't let him leave.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NARUG_01_04 " );	// What, does it bother you so much?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NARUG_01_05 " );	// I had an assignment. I had to give him gold for a new batch of slaves.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NARUG_01_06 " );	// Hmmm, hmmm... (thoughtfully) Not a very lucky set of circumstances.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NARUG_01_07 " );	// But now there's nothing to be done. What is done is done.
	B_LogEntry(TOPIC_AssasinGold, " It seems that Narug found Gonzalez's hideout, and he had no choice but to kill him. Now we have a big problem, since the loss of one of the Masyaf fighters will not remain unnoticed. " );
	NarugIsDead = TRUE ;
};


instance DIA_NONE_1190_Assassin_NarugProblem (C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NarugProblem_Condition;
	information = DIA_NONE_1190_Assassin_NarugProblem_Info;
	permanent = FALSE;
	description = " What are we going to do? " ;
};

func int DIA_NONE_1190_Assasin_NarugProblem_Condition()
{
	if ((MY_AssassinGold == LOG_Running) && (SickIsDead ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NarugProblem_Info()
{
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_00 " );	// What are we going to do?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_01 " );	// (thoughtfully) Good question. If only the answer would be as simple.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_02 " );	// In my opinion, the only thing we can now...
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_03 " );	// ...is to make the Shadows accept the death of their fighter as, say, an accident.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_04 " );	// Well, yes - the poor fellow accidentally ran into his sword!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_05 " );	// That's just the point. (with annoyance) Any experienced fighter will immediately understand how he was killed, and, most importantly, with what!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_06 " );	// Therefore, this option disappears immediately.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_07 " );	// How fast do you think the Shadows will grab him?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_08 " );	// It all depends on how important he was to them.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_09 " );	// The loss of a simple novice may not be noticed at all. But it's another matter when it's an elite fighter of Masyaf.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_10 " );	// By the way, did you say you had to give him something?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_11 " );	// Yes, a purse of gold.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_12 " );	// Hmmm. Let me take a look at it.

	if (Npc_HasItems(other,ItMi_AssGoldPocket) >=  1 )
	{
		B_GivePlayerXP(500);
		AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_13 " );	// Here, take this.
		B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_14 " );	// Yes, yes. Apparently, you received this purse from the hands of not quite an ordinary person.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_15 " );	// Where did you get it from?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_16 " );	// You see - on this purse the sign of crossed swords is embroidered.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_17 " );	// And this only means that we are dealing with a rather influential person in the Brotherhood.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_18 " );	// Well, yes, you're right. It was given to me by one of the priors of Masyaf.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_19 " );	// Even so? Hmmm... Didn't he give you anything else?
		AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_20 " );	// No. He gave only two purses of gold, which I had to distribute to the Shadows.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_21 " );	// So there were two of them?
		AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_22 " );	// Yes. The other purse was for a Shadow named Hasim.

		if(HasimGetHisGold == TRUE)
		{
			AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_23 " );	// And he already got it.
		};

		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_24 " );	// Hmmm... You know, I think I have an idea how we can solve our problem.
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_25");	//Правда?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_26 " );	// Yes. But it's too risky. A lot will depend on how much you are trusted in the Brotherhood.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_27 " );	// Spread out what you have in mind.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_28 " );	// Listen carefully. You will take this wallet and return to Hasima.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_29 " );	// Say you didn't find his friend and ask him to give him the wallet in case he meets him.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_30 " );	// Shadows are usually forbidden from taking things that don't belong to them.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_31 " );	// So you'll have to figure out how to get him to take this thing for himself.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_32 " );	// This is very important. Because if everything works out, then consider that the first half of our plan was a success.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_33 " );	// Okay, I got it. What's next?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_34 " );	// Then go to the prior who gave you these wallets, and say that you fulfilled his request.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_35 " );	// So I have to lie, saying that I gave the gold to both?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_36 " );	// That's right. Well, then you'll have to wait a while.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_37 " );	// Sooner or later, the Shadows will miss their fighter. That's when we'll see how important he was to them.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_38 " );	// Yes, and one more thing...
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_39 " );	// When you talk to Hasim, it would be nice to try to steal something from him.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_40 " );	// And we'll toss it to our dead friend.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_41 " );	// Then Hasim will never turn his back on the fact that he killed the Masyaf fighter. And he took the gold.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_42 " );	// So that's what you're up to! It doesn't look very pretty.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_43 " );	// (serious) You seem to have forgotten who you're dealing with, mate. And in war, as they say, all means are good.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_01_44 " );	// So take back this wallet, and do everything exactly as I said.
		B_GiveInvItems(self,other,ItMi_AssGoldPocket,1);
		AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_45 " );	// Okay, whatever you say.
		B_LogEntry(TOPIC_AssasinGold, " Gonzalez figured out how we can get out of this situation. I have to force Hasim to take the second purse of gold that was intended for Narug. Although it is forbidden by the laws of the Brotherhood to take things that belonged to others. I also need to try to steal from Hasim some personal item. We will throw it on the corpse of Narug, which will finally convict Hasim of his murder if the Shadows start looking for their fighter. " );
		MakeHasimKiller = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(Ass_171_Adept,"TOT");
	}
	else
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_01_46");	//У меня сейчас нет его с собой.
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_47");	//Тогда пойди и принеси мне его. 
		AI_Output(self,other,"DIA_NONE_1190_Assasin_NarugProblem_01_48");	//Возможно, что это как-то поможет нам. Хотя пока еще и не знаю, как...
		AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_01_49 " );	// As you say.
		B_LogEntry(TOPIC_AssasinGold, " Gonzalez wanted to take a look at the purse Osair gave Narug. Unfortunately, I didn't have it with me. " );
		PreMakeHasimKiller = TRUE;
		AI_StopProcessInfos(self);
	};
};

instance DIA_NONE_1190_Assasin_NarugProblem_Temp(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NarugProblem_Temp_Condition;
	information = DIA_NONE_1190_Assasin_NarugProblem_Temp_Info;
	permanent = FALSE;
	description = " Here, take that wallet. " ;
};

func int DIA_NONE_1190_Assasin_NarugProblem_Temp_Condition()
{
	if((MIS_AssasinGold == LOG_Running) && (PreMakeHasimKiller == TRUE) && (Npc_HasItems(other,ItMi_AssGoldPocket) >= 1) && (MakeHasimKiller == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NarugProblem_Temp_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_13 " );	// Here, take that wallet.
	B_GiveInvItems(other,self,ItMi_AssGoldPocket,1);
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_14 " );	// Well, well. Apparently, you received this purse from the hands of not quite an ordinary person.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_15 " );	// Where did you get it from?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_16 " );	// You see - on this purse the sign of crossed swords is embroidered.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_17 " );	// And this only means that we are dealing with a rather influential person in the Brotherhood.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_18 " );	// Well, yes, you're right. It was given to me by one of the priors of Masyaf.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_19 " );	// Even so? Hmmm... Didn't he give you anything else?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_20 " );	// No. He gave only two purses of gold, which I had to distribute to the Shadows.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_21 " );	// So there were two of them?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_22 " );	// Yes. The other purse was for a Shadow named Hasim.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_23 " );	// And he already got it.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_24 " );	// Hmmm... You know, I think I have an idea how we can solve our problem.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Temp_01_25");	//Правда?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_26 " );	// Yes. But it's too risky. A lot will depend on how much you are trusted in the Brotherhood.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_27 " );	// Spread out what you have in mind.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_28 " );	// Listen carefully. (seriously) You take this wallet and go back to Hashima.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_29 " );	// Say you didn't find his friend and ask him to give him the wallet in case he meets him.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_30 " );	// Shadows are usually forbidden from taking things that don't belong to them.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_31 " );	// So you'll have to figure out how to get him to take this thing for himself.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_32 " );	// This is very important. Because if everything works out, then consider that the first half of our plan was a success.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_33 " );	// Okay, I got it. What's next?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_34 " );	// Then go to the prior who gave you these wallets, and say that you fulfilled his request.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_35 " );	// So I have to lie, saying that I gave the gold to both?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_36 " );	// That's right. Well, then you have to wait a while.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_37 " );	// Sooner or later, the Shadows will miss their fighter. That's when we'll see how important he was to them.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_38 " );	// Yes, and one more thing...
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_39 " );	// When you talk to Hasim, it would be nice to try to steal something from him.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_40 " );	// And we'll toss it to our dead friend.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_41 " );	// Then Hasim will never turn his back on the fact that he killed the Masyaf fighter. And he took the gold!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_42 " );	// So that's what you're up to! It doesn't look very pretty!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_43 " );	// (seriously) You seem to have forgotten who you're dealing with, mate. And in war, as they say, all means are good.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_44 " );	// So take back this wallet, and do everything exactly as I said.
	B_GiveInvItems(self,other,ItMi_AssGoldPocket,1);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_Temp_01_45 " );	// Okay, whatever you say.
	B_LogEntry(TOPIC_AssasinGold, " Gonzalez figured out how we can get out of this situation. I have to force Hasim to take the second purse of gold that was intended for Narug. Although it is forbidden by the laws of the Brotherhood to take things that belonged to others. I also need to try to steal from Hasim some personal item. We will throw it on the corpse of Narug, which will finally convict Hasim of his murder if the Shadows start looking for their fighter. " );
	MakeHasimKiller = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(Ass_171_Adept,"TOT");
};

instance DIA_NONE_1190_Assasin_NarugProblem_Chetki(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NarugProblem_Chetki_Condition;
	information = DIA_NONE_1190_Assasin_NarugProblem_Chetki_Info;
	permanent = FALSE;
	description = " I have Hasim's rosary here. " ;
};

func int DIA_NONE_1190_Assasin_NarugProblem_Chetki_Condition()
{
	if ((Npc_HasItems(other,ItMi_HasimAmuls) >=  1 ) && (MakeHasimKiller ==  TRUE ))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NarugProblem_Chetki_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_01 " );	// I have Hasim's rosary here.
	B_GiveInvItems(other,self,ItMi_HasimAmuls,1);
	Npc_RemoveInvItems(self,ItMi_HasimAmuls,1);
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_02 " );	// Great. They will be useful to us to remove suspicion from us.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_03 " );	// Have you disposed of the corpse yet?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_04 " );	// I just moved it away from here.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_NarugProblem_Chetki_01_05");	//Ясно.
	HasimAmuls = TRUE ;

	if(MIS_AssasinGold == LOG_Running)
	{
		B_LogEntry(TOPIC_AssasinGold, " I gave the rosary to Hasim Gonzalez. Now it's worth waiting about two days for the Shadows to miss their fighter. In the meantime, it's better to do other things. " );
	};
};

instance DIA_NONE_1190_Assasin_HaniarFirstQuest(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HaniarFirstQuest_Condition;
	information = DIA_NONE_1190_Assasin_HaniarFirstQuest_Info;
	permanent = FALSE;
	description = " We have a little problem. " ;
};

func int DIA_NONE_1190_Assasin_HaniarFirstQuest_Condition()
{
	if((HaniarSeekKiller == TRUE) && (HaniarKnowKiller == FALSE))
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_HaniarFirstQuest_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_01 " );	// We have a little problem.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_02 " );	// This doesn't surprise me. (sarcastically) So what this time?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_03 " );	// One of the priors of Masyaf has given me a mission to find Hasim's killer. That is, myself!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_04 " );	// Funny, don't say anything! And which of the priors became interested in his death?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_05 " );	// His name is Khaniar.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_06 " );	// (surprised) Haniar? Did Haniar the Blind himself give you this commission?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_07 " );	// Do you know him?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_08 " );	// Eh, boy. I'd be happy to say no - only it's not.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_09 " );	// Yes, I know him! And I'm willing to bet that I know even better than some of the current Masyaf brothers.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_10 " );	// Haniar the Blind is the most cruel and bloody bastard I've ever dealt with.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_11 " );	// He is the most powerful of the Priors of the Brotherhood. And most importantly - this person is absolutely unpredictable in his actions.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_12 " );	// So watch out - beware of it!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_13 " );	// Thanks for the warning.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_14 " );	// No way! However, if you were able to get to the Blind Man himself, then you are already worth something in the Brotherhood.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_15 " );	// And that's good news. As for Hasim... Let me think.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_16 " );	// We don't have time to think.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_17 " );	// Well, then you only have two options.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_18 " );	// Either you tell Haniar the truth, or try talking to Prior Tiamant.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_19 " );	// After all, it was on his orders that you sent the poor fellow to the next world.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_20 " );	// Now let him get out on his own!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_21 " );	// Clear. No more thoughts on this?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuest_01_22 " );	// No. Of course, this is all quite risky, but you will have to make a choice.
	GonsalesAdvice = TRUE;
	B_LogEntry(TOPIC_HasimKill, " Gonzalez was quite taken aback by the situation. The only thing he could offer was to either talk to Tiamant or try to tell the whole truth to Haniar and hope for his leniency. Either way, it's up to me. " );
};


instance DIA_NONE_1190_Assasin_HaniarFirstQuestFinal(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_Condition;
	information = DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_Info;
	permanent = FALSE;
	description = " About the problem with Hasim... " ;
};

func int DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_Condition()
{
	if(HaniarKnowKiller == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_01 " );	// About the problem with Hasim...
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_02 " );	// It seems to me that since you are still alive, then you managed to get out of this difficult situation.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_03 " );	// You're right as always. Although I had to sweat a lot for this.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_04 " );	// This Khaniar is still a cunning one.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_05 " );	// That's lucky for you... Usually he doesn't like to stand on ceremony with such trifles.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_06 " );	// Something tells me he didn't just keep you alive.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_07 " );	// But why he did it is a big question!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_08 " );	// I've wanted to ask for a long time - how do you know so much about the Brotherhood?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_09 " );	// The time will come - and you will know everything yourself. In the meantime, don't pester me with these questions. Deal?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarFirstQuestFinal_01_10 " );	// As you say.
	GonsalesFinishHasimStory = TRUE;
};

instance DIA_NONE_1190_Assasin_IDo(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_IDo_Condition;
	information = DIA_NONE_1190_Assasin_IDo_Info;
	permanent = FALSE;
	description = " I am now the Shadow of the Brotherhood of Masyaf! " ;
};

func int DIA_NONE_1190_Assasin_IDo_Condition()
{
	if(PlayerIsAssNow == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_IDo_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_IDo_01_01 " );	// I am now the Shadow of the Brotherhood of Masyaf!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_02 " );	// Hmmm... (smiling) I can see that. Well, congratulations.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_03 " );	// Although at first I didn't really believe that you could do it.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_04 " );	// Now we should think about how to take advantage of you.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_IDo_01_05 " );	// What will be the proposals?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_06 " );	// In my opinion, it is essential to take care of the priors first.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_07 " );	// These are the pillars of the Brotherhood of Masyaf. Without them, the rest are just a bunch of bandits, albeit quite dangerous ones.

	if(TiamantIsDead == TRUE)
	{
		AI_Output(other,self, " DIA_NONE_1190_Assasin_IDo_01_08 " );	// One of the priors is already dead.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_09 " );	// (surprised) Who exactly?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_10");	//Тиамант.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_11 " );	// Ah, Tiamant! Swordmaster Masyaf... I wonder how it happened?
		AI_Output(other,self, " DIA_NONE_1190_Assasin_IDo_01_12 " );	// Haniar killed him because he decided to pocket a whole gold mine for himself.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_13 " );	// Well, Haniar is not to be trifled with. You should remember this too.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_14 " );	// Although, to be honest, Tiamant was the only person I ever respected in the Brotherhood.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_15 " );	// It was a real warrior to the core! But, like many, greed killed him.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_16 " );	// By the way, his sword - you don't have it by any chance?

		if(Npc_HasItems(other,ITMW_2H_MASIAF_TIAMANT) >= 1)
		{
			B_GivePlayerXP(1000);
			AI_Output(other,self,"DIA_NONE_1190_Assasin_IDo_01_17");	//Да, вот он.
			B_GiveInvItems(other,self,ITMW_2H_MASIAF_TIAMANT,1);
			AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_18 " );	// Great! Do you mind if I keep it for now?
			AI_Output(other,self, " DIA_NONE_1190_Assasin_IDo_01_19 " );	// Sure, take it.
			AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_20 " );	// Thank you! Yes, and if anything, bring me the swords of other priors too.
			AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_21 " );	// It's better if their cursed weapons stay here.
			AI_Output(other,self, " DIA_NONE_1190_Assasin_IDo_01_22 " );	// Okay, whatever you say.
			GonsaTakeSword_Tiamant = TRUE;
		}
		else
		{
			B_GivePlayerXP(250);
			AI_Output(other,self, " DIA_NONE_1190_Assasin_IDo_01_23 " );	// Unfortunately not.
			AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_24 " );	// If I were you, I would find that sword and bring it to me.
			AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_25 " );	// It's better if this cursed weapon stays here.
			AI_Output(other,self, " DIA_NONE_1190_Assasin_IDo_01_26 " );	// Okay, whatever you say.
		};

		GonsaKnow_Tiamant = TRUE;
	};

	AI_Output(self,other, " DIA_NONE_1190_Assasin_IDo_01_27 " );	// For the rest, I think you can figure it out without me.
};

instance DIA_NONE_1190_Assasin_Sword_Tiamant(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Sword_Tiamant_Condition;
	information = DIA_NONE_1190_Assasin_Sword_Tiamant_Info;
	permanent = FALSE;
	description = " I brought Tiamante's sword. " ;
};

func int DIA_NONE_1190_Assasin_Sword_Tiamant_Condition()
{
	if ((Can'tKnow_Tiamant ==  TRUE ) && (PlayerIsAssNow ==  TRUE ) && (Can'tTakeSword_Tiamant ==  FALSE ) && (Npc_HasItems(other, ITMW_2H_MASIAF_TIAMANT ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Sword_Tiamant_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Sword_Tiamant_01_01 " );	// I brought Tiamante's sword.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_Tiamant_01_02 " );	// Great. Give it here.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Sword_Tiamant_01_03");	//Вот, держи.
	B_GiveInvItems(other,self,ITMW_2H_MASIAF_TIAMANT,1);
	Npc_RemoveInvItems(self,ITMW_2H_MASIAF_TIAMANT,1);
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_Tiamant_01_04 " );	// Thank you! Let it stay with me for now. And that's not enough.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Sword_Tiamant_01_05 " );	// Well, you know better.
	GonsaTakeSword_Tiamant = TRUE;
};

instance DIA_NONE_1190_Assasin_TiamantDead(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_TiamantDead_Condition;
	information = DIA_NONE_1190_Assasin_TiamantDead_Info;
	permanent = FALSE;
	description = " One of the priors is dead! " ;
};

func int DIA_NONE_1190_Assasin_TiamantDead_Condition()
{
	if ((TiamantIsDead ==  TRUE ) && (PlayerIsAssNow ==  TRUE ) && (GonsaKnow_Tiamant ==  FALSE ) && (Npc_KnowsInfo(hero, DIA_NONE_1190_Assassin_ID)))
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_TiamantDead_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_TiamantDead_01_01 " );	// One of the priors is dead.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_TiamantDead_01_02 " );	// (surprised) Who exactly?
	AI_Output(other,self,"DIA_NONE_1190_Assasin_TiamantDead_01_03");	//Тиамант.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_TiamantDead_01_04 " );	// Ah, Tiamant! Swordmaster Masyaf... I wonder how it happened?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_TiamantDead_01_05 " );	// Haniar killed him because he decided to pocket a whole gold mine for himself.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_TiamantDead_01_06 " );	// Well, Haniar is not to be trifled with. You should remember this too.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_TiamantDead_01_07 " );	// Although, to be honest, Tiamant was the only person I ever respected in the Brotherhood.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_TiamantDead_01_08 " );	// It was a real warrior to the core! But, like many, greed killed him.
	GonsaKnow_Tiamant = TRUE;
};


instance DIA_NONE_1190_Assasin_WhoAreYouMister(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_WhoAreYouMister_Condition;
	information = DIA_NONE_1190_Assasin_WhoAreYouMister_Info;
	permanent = FALSE;
	description = " I have a question for you. " ;
};

func int DIA_NONE_1190_Assasin_WhoAreYouMister_Condition()
{
	if((GonsaKnow_Tiamant == TRUE) && (PlayerIsAssNow == TRUE))
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_WhoAreYouMister_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_01 " );	// I have a question for you.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_02 " );	// (seriously) Well, ask if there is.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_03 " );	// I think you already know what I mean.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_04 " );	// After all, I understand perfectly well that something connects you with all these people.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_05 " );	// You know a lot about them, as if you were one of them!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_06 " );	// Hmmm. (firmly) You're not far from the truth.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_07 " );	// Maybe just tell me everything then?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_08 " );	// Okay. I think it's time for you to hear my story.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_09 " );	// But promise me you'll hear me out first. And then do what you think is right.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_10 " );	// Agreed.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_11 " );	// Then I'll start, perhaps...
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_12 " );	// (grimly) Well, the thing is, I used to... I used to be a really bad person.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_13 " );	// And it's not even that for the sake of gold and glory I killed people, not really understanding who they were and what they were guilty of.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_14 " );	// My faith and devotion to the Brotherhood never let me doubt the correctness of my deeds.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_15 " );	// I was blinded by my desire to prove to Beliar himself that I was his most worthy servant.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_16 " );	// Thanks to this blind fanaticism, I was able to achieve a lot and even become one of the priors of Masyaf...
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_17 " );	// ...the mighty Brotherhood of Assassins, whose name alone inspired fear and terror in the inhabitants of all Varant.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_18 " );	// And maybe we wouldn't be talking to you right now...
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_19 " );	// ...if not for one incident that turned my whole life upside down!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_20 " );	// Once in Mora Sul, while chasing my next victim, I met a beautiful maiden named Azil.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_21 " );	// She was beautiful, like love itself! I don't know what happened to me then, but...
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_22 " );	// ...instead of continuing to spy, I, like a stupid ram, just went after her.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_23 " );	// I followed Azil to her house. Although, of course, she didn't suspect anything.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_24 " );	// As it turned out, she was the daughter of one of the major merchants in Mora Sul - a very rich and influential person.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_25 " );	// The laws of Masyaf forbid any relationship with those who are not members of the Brotherhood.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_26 " );	// The one who violates them, only one thing awaits - death.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_27 " );	// However, despite this, I was drawn to Azil with an irresistible force! I wanted to see her again and again.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_28 " );	// And one day I finally decided to approach her. That's how we met...
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_29 " );	// Time passed, and we became very close people for each other.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_30 " );	// But then one fine day, another order to kill came from Ishtar himself.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_31 " );	// I think you yourself have already guessed what its essence was.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_32 " );	// The Masyaf fighters were supposed to slaughter the entire family of that influential merchant from Mora Sul, Azil's father!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_33 " );	// Since his house was very well guarded, all the work was entrusted to the people of Khaniar the Blind.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_34 " );	// True, then he was still sighted. But that's not the point.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_35 " );	// I remember how I was almost on my knees begging Haniar to spare my beloved.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_36 " );	// But he only laughed at me and said that I was unworthy to be Prior of the Brotherhood and Beliar's servant.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_37 " );	// Then, without thinking, I went to Mora Sul, in the hope that I would have time to prevent the attack.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_38 " );	// However, I was late... When I arrived at Azil's house, she was already dead. Like all those who were not lucky enough to be there.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_39 " );	// It was my retribution for my sins, for my murders... For my pride.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_40 " );	// Distraught with grief, I returned to the hall of the Brotherhood with the firm intention of destroying this abode of evil forever.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_41 " );	// My blade with incredible strength and cruelty cut down everyone who only dared to stand in my way.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_42 " );	// And then the one who gave this ill-fated order appeared.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_43 " );	// (angrily) Haniar! My curse and my shame!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_44 " );	// As you understand, then I could not defeat him in battle, and I could only flee.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_45 " );	// However, before I left, I left him a last little reminder of myself.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_46 " );	// I threw a vial of acid at him, and it looks like a few drops got into his eyes.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_47 " );	// That's probably why he's blind. However, I sometimes think that it only made him stronger.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_48 " );	// After that, I swore that I would devote the rest of my life to the destruction of the Brotherhood of Masyaf!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_49 " );	// I understand that this will not fully atone for my guilt.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_WhoAreYouMister_01_50 " );	// But I'll see this through to the end, no matter what the cost.
	B_LogEntry(TOPIC_MasiafStory, " As it turns out, Gonzalez was once one of the priors of Masiaf. He told me his story and the reasons that brought him here. Well, quite an unusual turn of events. And I still don't know how I feel about everything do it. " );
	GonsaTellHistory = TRUE;
};


instance DIA_NONE_1190_Assasin_PrayInnos(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_PrayInnos_Condition;
	information = DIA_NONE_1190_Assasin_PrayInnos_Info;
	permanent = FALSE;
	description = " Are you praying to Innos? " ;
};

func int DIA_NONE_1190_Assasin_PrayInnos_Condition()
{
	if(GonsaTellHistory == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_PrayInnos_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_PrayInnos_01_01 " );	// Are you praying to Innos?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_PrayInnos_01_02 " );	// I'm afraid that after all Innos won't hear me. (doomed) Too much evil I brought into this world!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_PrayInnos_01_03 " );	// But you could try.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_PrayInnos_01_04 " );	// Hmmm... (thoughtfully) Maybe someday I'll be able to kneel before the statue of Innos in a plea for forgiveness.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_PrayInnos_01_05 " );	// But first, I must destroy the evil that I myself have sown.
};


instance DIA_NONE_1190_Assasin_Kills(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Kills_Condition;
	information = DIA_NONE_1190_Assasin_Kills_Info;
	permanent = FALSE;
	description = " Have you often had to kill? " ;
};

func int DIA_NONE_1190_Assasin_Kills_Condition()
{
	if(GonsaTellHistory == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_Kills_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Kills_01_01 " );	// Have you had to kill often?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Kills_01_02 " );	// You can't imagine how often. A lot of people died at my hands!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Kills_01_03 " );	// However, even now, after so many years, I remember the face of almost every one of my victims.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Kills_01_04 " );	// This is my curse! Which, apparently, will forever remain with me.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Kills_01_05 " );	// And it is possible that even death will not give me relief from all that I have done.
};

instance DIA_NONE_1190_Assasin_Death(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Death_Condition;
	information = DIA_NONE_1190_Assasin_Death_Info;
	permanent = FALSE;
	description = " Are you afraid of death? " ;
};

func int DIA_NONE_1190_Assasin_Death_Condition()
{
	if(GonsaTellHistory == TRUE)
	{
		return TRUE;
	};

};

func void DIA_NONE_1190_Assasin_Death_Info()
{
	B_GivePlayerXP(150);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Death_01_01 " );	// Are you afraid of death?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Death_01_02 " );	// No. And even more than that, I myself have been looking for her for so many years!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Death_01_03 " );	// But apparently even she turned her back on me.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Death_01_04 " );	// What prevents you, for example, from throwing yourself down from a cliff?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Death_01_05 " );	// I am a warrior! (terribly) So, only death on the battlefield can wash away my shame.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Death_01_06 " );	// And just committing suicide is the lot of cowards.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Death_01_07 " );	// Maybe I can help you with this?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Death_01_08 " );	// Do you want to fight me? (seriously) Well, I'm ready!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Death_01_09 " );	// Who knows, maybe you are the person I've been waiting for all this time.
	Info_ClearChoices(DIA_NONE_1190_Assasin_Death);
	Info_AddChoice(DIA_NONE_1190_Assasin_Death, " No! This is going to be really stupid. " ,DIA_NONE_1190_Assasin_Death_No);

	if(MIS_PW_PoisonNrozas == FALSE)
	{
		Info_AddChoice(DIA_NONE_1190_Assasin_Death, " Let's fight! " ,DIA_NONE_1190_Assasin_Death_Yes);
	};
};

func void DIA_NONE_1190_Assasin_Death_Yes()
{
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Death_Yes_01_01 " );	// Let's fight!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Death_Yes_01_02 " );	// Then let's not waste time.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Death_Yes_01_03 " );	// I hope that you will give me what I so desire with all my heart!
	GonsaChalange = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,1);
};

func void DIA_NONE_1190_Assasin_Death_No()
{
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Death_No_01_01 " );	// No. Now this is going to be really stupid...
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Death_No_01_02 " );	// We need to deal with the Brotherhood first.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Death_No_01_03 " );	// Everything else is not so important now.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Death_No_01_04 " );	// Eh...(disappointed) Yes, you're probably right. Now the main thing is to destroy Masyaf.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Death_No_01_05 " );	// And my personal problems can only prevent us from doing this.
	Info_ClearChoices(DIA_NONE_1190_Assasin_Death);
};

instance DIA_NONE_1190_Assasin_DeathWin(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_DeathWin_Condition;
	information = DIA_NONE_1190_Assasin_DeathWin_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_DeathWin_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_WON) && (GonsaChalange == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_DeathWin_Info()
{
	AI_Output(self,other, " DIA_NONE_1190_Assasin_DeathWin_01_01 " );	// You fought well...(disappointed) But apparently even you can't give me a decent death.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_DeathWin_01_02 " );	// I'm damned forever!
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assasin_DeathLost(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_DeathLost_Condition;
	information = DIA_NONE_1190_Assasin_DeathLost_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_DeathLost_Condition()
{
	if((self.aivar[AIV_LastFightAgainstPlayer] == FIGHT_LOST) && (GonsaChalange == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_DeathLost_Info()
{
	B_GivePlayerXP(500);
	AI_Output(self,other, " DIA_NONE_1190_Assasin_DeathLost_01_01 " );	// You are a very good fighter. I am sure that you will be able to destroy Masyaf.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_DeathLost_01_02 " );	// It will be visible there!
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assasin_AboutExit(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_AboutExit_Condition;
	information = DIA_NONE_1190_Assasin_AboutExit_Info;
	permanent = FALSE;
	description = " Something is bothering me... " ;
};

func int DIA_NONE_1190_Assasin_AboutExit_Condition()
{
	if(Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_IDo))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_AboutExit_Info()
{
	AI_Output(other,self, " DIA_NONE_1190_Assasin_AboutExit_01_00 " );	// Something's bothering me...
	AI_Output(self,other,"DIA_NONE_1190_Assasin_AboutExit_01_01");	//Что именно?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_AboutExit_01_02 " );	// How do we get out of here when this is over?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_AboutExit_01_03 " );	// I have no desire to stay here forever.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_AboutExit_01_04 " );	// I don't know this yet. But I am sure that the answer we need will come into our own hands.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_AboutExit_01_05 " );	// And now it's better not to think about it. Superfluous thoughts only interfere with focusing on the main thing.
};


instance DIA_NONE_1190_Assasin_Poison(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Poison_Condition;
	information = DIA_NONE_1190_Assasin_Poison_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_Poison_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (NoTrollPoison == FALSE) && (MIS_PW_PoisonNrozas == LOG_Running) && (Npc_HasItems(other,ItMi_NrozasPoison) >= 1) && (Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_PreHallo)))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Poison_Info()
{
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_00 " );	// Hey! (chewing) Want some meat?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_01_01 " );	// Come on later.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_02 " );	// Well, in vain. (enough) Juicy, well-done meat from a scavenger I just killed!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_03 " );	// I'm sure you've never tried this before.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_01_04 " );	// Well, since you're such an expert on eating, maybe you can answer the question?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_05 " );	// What else is this?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_01_06 " );	// Do you happen to know if mountain trolls eat vials of poison?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_07 " );	// You're all kidding, I see.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_08 " );	// And about your question... That depends on what main course you serve him for a snack.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_09 " );	// For example, he may well devour you right along with your bubble.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_10 " );	// But I don't think you're stupid enough to give him that chance.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_11 " );	// By the way, why all these questions?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_01_12 " );	// Prior Nrozas has assigned me to test the effects of one powerful poison.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_01_13 " );	// And, in his opinion, a huge mountain troll would be best suited for this.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_14 " );	// Ah, now everything is clear to me. This means that Nrozas will not calm down in any way.
	AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_01_15");	//В смысле?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_16 " );	// Well, as long as I knew him...
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_17 " );	// ...he was constantly trying to find the perfect composition for such a poison that would be able to instantly kill any living creature.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_18 " );	// And, apparently, his search continues to this day.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_19 " );	// He's just obsessed with all those vials of various poisons, elixirs and other alchemical nonsense!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_01_20 " );	// Let's leave Nrozas alone. Better tell me what should I do?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_21 " );	// Hmmm... (calmly) Nothing! Consider yourself lucky.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_01_22 " );	// What do you mean?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_23 " );	// I just saw one mountain troll in that crevice behind you the other day.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_24 " );	// And now this thing is probably eating the scavengers I killed this morning.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_25 " );	// So I wouldn't waste my time if I were you.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_26 " );	// Try sneaking up on him and treating one of the carrion's dead carcasses with your venom.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_27 " );	// And then it remains only to see if he dies from your poison or not.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_28 " );	// Just be careful not to overdo the potion itself! Strong poisons are usually very odorous, and this can easily scare the creature away.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_01_29 " );	// Okay, I get it.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_30 " );	// And yet, in vain, you refused meat.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_01_31 " );	// Okay, go already! Then tell me how it went.
	TrollPWIsPlace = TRUE;
	B_LogEntry(TOPIC_PW_PoisonNrozas, " Gonzalez advised me to use the carcass of a dead carrion to make poison bait for the troll. " );
	AI_StopProcessInfos(self);
	Wld_InsertNpc(TROLL_YOUNG_PW,"PW_YOUNGTROLL");	
	Wld_InsertNpc(Scavenger_PW_01,"FP_STAND_MOLERATDEAD_01");
	Wld_InsertNpc(Scavenger_PW_02,"FP_STAND_MOLERATDEAD_02");
	Wld_InsertNpc(Scavenger_PW_03,"FP_STAND_MOLERATDEAD_03");
	B_KillNpc(Scavenger_PW_01);
	B_KillNpc(Scavenger_PW_02);
	B_KillNpc(Scavenger_PW_03);
	Wld_SendTrigger("EVT_TROLL_POISON");
};

instance DIA_NONE_1190_Assasin_Poison_Done(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Poison_Done_Condition;
	information = DIA_NONE_1190_Assasin_Poison_Done_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_Poison_Done_Condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Running) && (PoisonResult == TRUE) && (TellNrozasAboutTest == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Poison_Done_Info()
{
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_00 " );	// Well, how did it go?

	if(PoisonDoneFull == TRUE)
	{
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_01 " );	// The troll refused to take the bait. I guess I overdid it a bit with the amount of poison.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_02 " );	// Eh... I warned you that strong poisons are extremely odorous!
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_03 " );	// Therefore, it is natural that, having smelled an unpleasant smell, this creature began to turn up its nose.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_04 " );	// And how much of this poison did you pour into the bait?
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_05 " );	// Everything that was.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_06 " );	// Clear. (distractedly) You are still without poison, besides. Well done, congratulations.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_07 " );	// And what will happen now?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_08 " );	// Well... Knowing Nrozas, no good for you.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_09 " );	// You managed to squander his life's work, so he'll grind you to powder for it.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_10 " );	// So if I were you, I wouldn't go to him anymore. But that's up to you, of course.
	}
	else if(PoisonDoneHalf == TRUE)
	{
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_11 " );	// Everything went like clockwork. The troll took the bait and died instantly.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_12 " );	// Did you take anything with you as evidence?

		if(Npc_HasItems(other,ItAt_TrollPoisonTongue) >= 1)
		{
			AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_13 " );	// Of course! I have his tongue swollen with poison.
			AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_14 " );	// Well, that's all right then. Go to Nrozas and please the old man!
		}
		else
		{
			AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_15 " );	// I somehow didn't think about it.
			AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_16 " );	// Then, if I were you, I'd go back and take something as a memento.
			AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_17 " );	// As far as I know, Nrozas is used to believing only his own eyes!
		};
	}
	else if(PoisonDoneOneTear == TRUE)
	{
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_18 " );	// This creature took the bait, but for some reason refused to die!
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_19 " );	// Looks like you added too little poison. This is the only way I can explain it.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_20 " );	// Maybe Nrozas' poison just doesn't work?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_21 " );	// Don't you dare say that to him! Unless, of course, you still value your life.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_22 " );	// As far as I remember, Nrozas was a real master of his craft.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_23 " );	// He almost never misses. Of course, there were failures, but that was a very long time ago.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_24 " );	// And what will happen now?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_25 " );	// Well... Knowing Nrozas, no good for you.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_26 " );	// By the way, I hope you still have that poison with you?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_27");	//Да, вот он.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_28 " );	// Then take him back, and hope that his anger will not leave you without a head.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_29 " );	// Why don't we try this bait trick again?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_30 " );	// Because it's going to take us a lot of time now! Now every minute counts.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_31 " );	// It turns out that I will also return to Osair with nothing.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_32 " );	// Osairu?! And what does he have to do with it?
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_33 " );	// Nrozas promised to give Master Osair some poison if I could test his potion.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_34 " );	// Hmmm... And this changes things a bit.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_35 " );	// It's possible that we can use your blunder for our purposes!
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_36 " );	// And how?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_37 " );	// We'll try to push them head-on.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_38 " );	// And what do I need to do for this?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_39 " );	// Well, I see only two options.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_40 " );	// Either you give this poison to Osair, or you just tell him that Nrozas' poison won't work.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_41 " );	// However, in the first case, Nrozas will have a good reason to kill you.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_42 " );	// And surely all the other brothers of Masyaf will support him!
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_43 " );	// Well, in the second case - we have only the words of one prior against another.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_44 " );	// Which is better and safer for you.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_45 " );	// After all, this news will surely spread throughout the Brotherhood very quickly.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_46 " );	// And Osair himself will not fail to laugh at Nrozas!
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_47 " );	// I think now I understand what you mean.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_48 " );	// Well, then go ahead. Don't waste time.
		PlayerSafeFromNrozas = TRUE;
		B_LogEntry(TOPIC_PW_PoisonNrozas, " Gonzalez, the cunning fox, figured out how to use my miss. We need to smash the foreheads of two priors - Osair and Nrozas. I can give this vial of poison to Osair, but then Nrozas will have every right to kill me. Or I I can take the vial to Nrozas and tell Osair that the poison just doesn't work. " );
		AI_StopProcessInfos(self);
	}
	else if((NoTrollPoison == TRUE) || (TrollSeeMe == TRUE))
	{
		if(NoTrollPoison == TRUE)
		{
			AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_49 " );	// Unfortunately, I killed the troll before I could test the poison on it.
		}
		else if(TrollSeeMe == TRUE)
		{
			AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_49_01 " );	// Unfortunately, I scared the troll away before I could test the poison on it.
		};

		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_50 " );	// Well, then you missed your chance to stand out in front of Nrozas.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_51 " );	// And what will happen now?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_52 " );	// Well... Knowing Nrozas, no good for you.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_53 " );	// By the way, I hope you still have that poison with you?
		AI_Output(other,self,"DIA_NONE_1190_Assasin_Poison_Done_01_54");	//Да, вот он.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_55 " );	// Then take him back and hope that his anger doesn't leave you without a head.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_56 " );	// Why don't we try this bait trick again?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_57 " );	// Because it's going to take us a lot of time now! Now every minute counts.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_58 " );	// It turns out that I will also return to Osair with nothing.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_59 " );	// Osairu?! And what does he have to do with it?
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_60 " );	// Nrozas promised to give Master Osair some poison if I could test his potion.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_61 " );	// Hmmm... And this changes things a bit.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_62 " );	// It is possible that we can use your mistake for our purposes.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_63 " );	// And how?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_64 " );	// We'll try to push them head-on.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_65 " );	// And what do I need to do for this?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_66 " );	// Well, I see only two options.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_67 " );	// Either you give this poison to Osair, or you just tell him that Nrozas' poison won't work.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_68 " );	// However, in the first case, Nrozas will have a good reason to kill you.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_69 " );	// And surely all the other brothers of Masyaf will support him!
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_70 " );	// Well, in the second case - we have only the words of one prior against another.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_71 " );	// Which is better and safer for you!
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_72 " );	// After all, this news will surely spread throughout the Brotherhood very quickly.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_73 " );	// And Osair himself will not fail to laugh at Nrozas.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_Poison_Done_01_74 " );	// I think now I understand what you mean.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_Poison_Done_01_75 " );	// Well, then go ahead. Don't waste time.
		PlayerSafeFromNrozas = TRUE;
		B_LogEntry(TOPIC_PW_PoisonNrozas, " Gonzalez, the cunning fox, figured out how to use my miss. We need to smash the foreheads of two priors - Osair and Nrozas. I can give this vial of poison to Osair, but then Nrozas will have every right to kill me. Or I I can take the vial to Nrozas and tell Osair that the poison just doesn't work. " );
		AI_StopProcessInfos(self);
	};
};

instance DIA_NONE_1190_Assasin_OsairLiar(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_OsairLiar_Condition;
	information = DIA_NONE_1190_Assasin_OsairLiar_Info;
	permanent = FALSE;
	description = " I'm in big trouble! " ;
};

func int DIA_NONE_1190_Assasin_OsairLiar_Condition()
{
	if((MIS_PW_PoisonNrozas == LOG_Success) && (OsairLiarNrozasPoison == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_OsairLiar_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_OsairLiar_01_01 " );	// I'm in big trouble!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_02 " );	// What happened?!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_OsairLiar_01_03 " );	// That poison story! I couldn't think of anything better than lying to Osair.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_OsairLiar_01_04 " );	// Now he's going to personally visit Nrozas and settle the matter.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_05 " );	// And then your lies will quickly come out. (maliciously) Well, you give, boy!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_06 " );	// You've obviously found the wrong person to fool around with.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_07 " );	// Osair is a very cruel and vindictive person.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_08 " );	// Although I'm sure you yourself know perfectly well what he will do to you when he finds out the truth.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_OsairLiar_01_09 " );	// What can we do in this situation?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_10 " );	// Hmmm...(thoughtfully) In my opinion, the only way out is to kill Osaira himself!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_11 " );	// Only this must be done quietly, without witnesses.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_12 " );	// I think the best time is when Osair goes to Nrozas' temple.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_13 " );	// Of course, I have absolutely no idea if anyone will accompany him, or if he will go to the temple alone.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_14 " );	// But in any case, this will be a real chance to finish off another prior.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_OsairLiar_01_15 " );	// Do you think I can handle it alone?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_16 " );	// I doubt it. Therefore, I will go with you. Yes, just in case.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_17 " );	// I hope you at least know the time when Osair will go to the Temple of the Brotherhood.

	if(OsairGotoHram == TRUE)
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_18");	//Конечно.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_19 " );	// Then I'm calm. Just tell me when you're ready.
	}
	else
	{
		AI_Output(other,self,"DIA_NONE_1190_Assasin_OsairLiar_01_20");	//Эммм...
		AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_21 " );	// (reproachfully) Apparently not.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairLiar_01_22 " );	// Then our idea would make absolutely no sense!
	};
};

var int PW_OsairKill_OneTimer;

instance DIA_NONE_1190_Assasin_OsairGetKill(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_OsairGetKill_Condition;
	information = DIA_NONE_1190_Assasin_OsairGetKill_Info;
	permanent = TRUE;
	description = " It's time to go, let's go! " ;
};

func int DIA_NONE_1190_Assasin_OsairGetKill_Condition()
{
	where int daynow;

	daynow = Wld_GetDay();

	if ((OsairGotoKill ==  TRUE ) && (OsairGotoKill == (daynow -  1 )) && (Npc_KnowsInfo(hero,DIA_NONE_1190_Assassin_OsairLiar)) && ((OsairGetKill ==  FALSE ) || (OsairGoKill ==  FALSE )))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_OsairGetKill_Info()
{
	AI_Output(other,self, " DIA_NONE_1190_Assasin_OsairGetKill_01_01 " );	// It's time, let's go!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_OsairGetKill_01_02 " );	// Osair must arrive at the temple before noon.

	if (Wld_IsTime( 10 , 0 , 12 , 0 ))
	{
		AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_01_03 " );	// (decidedly) Then go ahead. Let's not waste time!
		AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_01_04 " );	// We may even have time to choose a better position to attack.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_01_05 " );	// Follow me.
		OsairGoKill = TRUE;
		AI_StopProcessInfos(self);
		Npc_ExchangeRoutine(Ass_127_Osair,"GotoHram");

		if(SBMODE == 1)
		{
			Npc_ExchangeRoutine(Ass_133_Adept,"GotoHram");			
			Npc_ExchangeRoutine(Ass_134_Adept,"GotoHram");	
		};

		Npc_ExchangeRoutine(self,"FollowOsairKill");
		Npc_SetRefuseTalk(NONE_1190_Assasin,600);
		self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	}
	else  if (Wld_IsTime( 12 , 0 , 23 , 59 ))
	{
		AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_01_06 " );	// Eh! Then we missed our chance. Surely Osair is already there.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_OsairGetKill_01_07 " );	// And what will happen now?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_01_08 " );	// You can go to Osair and find out for yourself!
		AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_01_09 " );	// But I think it's better not to.
		OsairGetKill = TRUE;
	}
	else
	{
		if(PW_OsairKill_OneTimer == FALSE)
		{
			AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_01_10 " );	// Then it's too early for us to move.
			AI_Output(other,self, " DIA_NONE_1190_Assasin_OsairGetKill_01_11 " );	// Why is this?
			AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_01_12 " );	// You know, sticking around in front of the entire Brotherhood is not the best idea.
			AI_Output(other,self, " DIA_NONE_1190_Assasin_OsairGetKill_01_13 " );	// Okay, whatever you say.
			PW_OsairKill_OneTimer = TRUE;
		}
		else
		{
			AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_01_14 " );	// It's still early. Calm down already, and stop pulling me!
		};
	};
};

instance DIA_NONE_1190_Assasin_BattleForever(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_BattleForever_Condition;
	information = DIA_NONE_1190_Assasin_BattleForever_Info;
	permanent = FALSE;
	description = " Looks like the only thing left for me to do is fight Masyaf! " ;
};

func int DIA_NONE_1190_Assasin_BattleForever_Condition()
{
	if((PlayerIsPrioratFake == TRUE) && (PlayerChooseFight_PW == FALSE) && (TempleIsClear == FALSE) && (OsairAttackMe == FALSE) && (HideMeetCome == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_BattleForever_Info()
{
	AI_Output(other,self, " DIA_NONE_1190_Assasin_BattleForever_01_01 " );	// Seems like the only thing left for me to do is fight Masyaf! Will you help me?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_BattleForever_01_02 " );	// Well, if things are that bad. In any case, I'm with you!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_BattleForever_01_03 " );	// Step forward. I'll cover your back.
	PlayerChooseFight_PW = TRUE;
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;

	if(MIS_MasiafStory == FALSE)
	{
		MIS_MasiafStory = LOG_Running;
		Log_CreateTopic(TOPIC_MasiafStory,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MasiafStory,LOG_Running);
	};
	if(MIS_MasiafStory == LOG_Running)
	{
		B_LogEntry(TOPIC_MasiafStory, " Looks like attacking the temple is now the only way out of here. Gonzalez will support me! " );
	};	

	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMasiafTemple");
	Npc_ExchangeRoutine(Ass_126_Haniar,"TOT");
	AI_Teleport(Ass_126_Haniar,"TOT");
	Wld_InsertNpc(Ass_129_DeadNrozas,"PW_INNER_DEMON_SPAWN");
};

instance DIA_NONE_1190_Assasin_OsairGetKill_Done(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_OsairGetKill_Done_Condition;
	information = DIA_NONE_1190_Assasin_OsairGetKill_Done_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_OsairGetKill_Done_Condition()
{
	if((OsairIsDead == TRUE) && (NoGonsaHereMe == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_OsairGetKill_Done_Info()
{
	AI_Output(other,self, " DIA_NONE_1190_Assasin_OsairGetKill_Done_01_01 " );	// Osair is dead!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_Done_01_02 " );	// Yes, he's dead. However, this does not mean that we have won.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_Done_01_03 " );	// We only wounded the beast, but in its death throes, it can be even more terrible!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_OsairGetKill_Done_01_04 " );	// And what do we do next?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_Done_01_05 " );	// Hmmm... I'm sure that once the Brotherhood hears of Osaira's death, they'll probably raise the alarm.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_Done_01_06 " );	// And then Khaniar will start killing everyone who even has a shadow of suspicion.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_Done_01_07 " );	// You weren't in the temple at the time, which means that your life may be in danger upon your return there.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_OsairGetKill_Done_01_08 " );	// What do you suggest?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_Done_01_09 " );	// There's not a minute to lose now. Therefore, we will proceed as follows.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_Done_01_00 " );	// Go back to Osaira's cave and kill all of his people!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_Done_01_10 " );	// And I'll go to the temple and make sure that no one goes from there in your direction.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_Done_01_11 " );	// Yes, and don't forget to free all captive slaves. Don't leave them here!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_OsairGetKill_Done_01_12 " );	// I'll do my best.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_OsairGetKill_Done_01_13 " );	// Great! Then go.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MasiafTempleWait");
};

instance DIA_NONE_1190_Assasin_PreFinalBattle(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_PreFinalBattle_Condition;
	information = DIA_NONE_1190_Assasin_PreFinalBattle_Info;
	permanent = FALSE;
	description = " I took care of Osair's people. " ;
};

func int DIA_NONE_1190_Assasin_PreFinalBattle_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_OsairGetKill_Done)) && (Npc_IsDead(Ass_133_Adept) == TRUE) && (Npc_IsDead(Ass_134_Adept) == TRUE) && (Npc_IsDead(Ass_135_Adept) == TRUE) && (Npc_IsDead(Ass_136_Adept) == TRUE) && (Npc_IsDead(Ass_137_Adept) == TRUE) && (OsairSlavesIsFree == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_PreFinalBattle_Info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_PreFinalBattle_01_01 " );	// I took care of Osaira's people. And how are you?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_PreFinalBattle_01_02 " );	// While everything was quiet. But since you're already here, it's probably time to make some noise here.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_PreFinalBattle_01_03 " );	// Do you want to attack the temple?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_PreFinalBattle_01_04 " );	// That's right! As long as they don't suspect anything, the two of us can do it.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_PreFinalBattle_01_05 " );	// Take them by surprise. Moreover, we cannot delay now.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_PreFinalBattle_01_06 " );	// As you say.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_PreFinalBattle_01_07 " );	// Then go ahead. I'll cover your back.
	PlayerChooseFight_PW = TRUE;
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	B_LogEntry(TOPIC_MasiafStory, " Gonzalez wants to attack the temple. He thinks we're strong enough now. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMasiafTemple");
	Npc_ExchangeRoutine(Ass_126_Haniar,"TOT");
	AI_Teleport(Ass_126_Haniar,"TOT");
	Npc_ExchangeRoutine(Ass_128_Nrozas,"TOT");
	AI_Teleport(Ass_128_Nrozas,"TOT");
	Wld_InsertNpc(Ass_129_DeadNrozas,"PW_INNER_DEMON_SPAWN");
};

instance DIA_NONE_1190_Assasin_Sword_Osair(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Sword_Osair_Condition;
	information = DIA_NONE_1190_Assasin_Sword_Osair_Info;
	permanent = FALSE;
	description = " I have Osaira's sword here. " ;
};

func int DIA_NONE_1190_Assasin_Sword_Osair_Condition()
{
	if((Npc_KnowsInfo(hero,DIA_NONE_1190_Assasin_OsairGetKill_Done)) && (PlayerIsAssNow == TRUE) && (GonsaTakeSword_Osair == FALSE) && (Npc_HasItems(other,ITMW_2H_MASIAF_OSAIR) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Sword_Osair_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Sword_Osair_01_01 " );	// I've got Osair's sword here.
	B_GiveInvItems(other,self,ITMW_2H_MASIAF_OSAIR,1);
	Npc_RemoveInvItems(self,ITMW_2H_MASIAF_OSAIR,1);
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_Osair_01_02 " );	// Aha! He'll be much better for me.
	GonsaTakeSword_Osair = TRUE;
};

instance DIA_NONE_1190_Assasin_Sword_Nrozas(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Sword_Nrozas_Condition;
	information = DIA_NONE_1190_Assasin_Sword_Nrozas_Info;
	permanent = FALSE;
	description = " I have the sword of Nrozas. " ;
};

func int DIA_NONE_1190_Assasin_Sword_Nrozas_Condition()
{
	if ((MY_TrueBattle == LOG_Success) && (RozasIsDead ==  TRUE ) && (PlayerIsAssNow ==  TRUE ) && (GonsaTakeSword_Rozas ==  FALSE ) && (Npc_HasItems(other, ITMW_2H_MASIAF_ROZAS ) >=  1 )) ;
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Sword_Nrozas_Info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Sword_Nrozas_01_01 " );	// I have the sword of Nrozas.
	B_GiveInvItems(other,self,ITMW_2H_MASIAF_NROZAS,1);
	Npc_RemoveInvItems(self,ITMW_2H_MASIAF_NROZAS,1);
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_Nrozas_01_02 " );	// Good. I'll leave it to myself.
	GonsaTakeSword_Nrozas = TRUE;
};

instance DIA_NONE_1190_Assassin_Sword_MasiafRitual (C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Sword_MasiafRitual_Condition;
	information = DIA_NONE_1190_Assassin_Sword_MasiafRitual_Info;
	permanent = FALSE;
	description = " I have a strange sword with me. " ;
};

func int DIA_NONE_1190_Assasin_Sword_MasiafRitual_Condition()
{
	if(Npc_HasItems(other,ITMW_FAKESWORD_01) >= 1)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Sword_MasiafRitual_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_01 " );	// I have one strange sword with me.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_02 " );	// Let me take a look.
	B_GiveInvItems(other,self,ITMW_2H_MASIAF_NROZAS,1);
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_03 " );	// Ah, this one! Well, there's nothing unusual about it.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_04 " );	// It's just that this weapon is only used for sacred ritual killings.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_05 " );	// What do you mean?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_06 " );	// You already know that all the Masyaf brothers worship Beliar.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_07 " );	// So. Sometimes, when they kill their prey, they do it with a special ritual blade.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_08 " );	// Thus bringing the soul of the slain as a gift to the Dark God.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_09 " );	// However, this is done only with the consent and permission of Zuben himself.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_10 " );	// Well, or another very influential dark magician.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_11 " );	// Otherwise, the person who committed such a murder will face a long and painful death.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_12 " );	// With the gods, you know, they don't joke!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_13 " );	// Do you happen to know who might be interested in them?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_14 " );	// Hmmm... Hard to say.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_15 " );	// As far as I remember, they contain a particle of Beliar's magic.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Sword_MasiafRitual_01_16 " );	// So it's likely that one of the dark magicians might be interested in them.
	DarkMageBuySwords = TRUE;
};

instance DIA_NONE_1190_Assasin_NrozasKill_Done(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_NrozasKill_Done_Condition;
	information = DIA_NONE_1190_Assasin_NrozasKill_Done_Info;
	permanent = FALSE;
	description = " Prior Nrozas is dead. " ;
};

func int DIA_NONE_1190_Assasin_NrozasKill_Done_Condition()
{
	if((MIS_TrueBattle == LOG_Success) && (NrozasIsDead == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_NrozasKill_Done_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NrozasKill_Done_01_01 " );	// Prior Nrozas is dead.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NrozasKill_Done_01_02 " );	// (surprised) I wonder how it happened?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_NrozasKill_Done_01_03 " );	// He challenged me to a duel of Truth. So I had no choice!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NrozasKill_Done_01_04 " );	// Hmmm... Well, consider yourself lucky! Sword fighting was not his forte.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NrozasKill_Done_01_05 " );	// In any case, the death of one of the priors will greatly weaken the Brotherhood.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_NrozasKill_Done_01_06 " );	// And this is only to our advantage.
};

instance DIA_NONE_1190_Assasin_HideMeeting(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HideMeeting_Condition;
	information = DIA_NONE_1190_Assasin_HideMeeting_Info;
	permanent = FALSE;
	description = " I have some interesting news for you. " ;
};

func int DIA_NONE_1190_Assasin_HideMeeting_Condition()
{
	if(HaniarReadyMeeting == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_HideMeeting_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HideMeeting_01_01 " );	// I have some interesting news for you.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HideMeeting_01_02 " );	// Then post quickly. What you have there?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HideMeeting_01_03 " );	// Looks like there's going to be a big brawl in the Brotherhood soon!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HideMeeting_01_04 " );	// Where did you get this from?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HideMeeting_01_05 " );	// Osair wanted to take power into his own hands, but Haniar, as you understand, is against it.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HideMeeting_01_06 " );	// Still! Nobody wants to go into the shadows. Especially such a person as Khaniar.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HideMeeting_01_07 " );	// Soon they will have to meet to resolve this issue.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HideMeeting_01_08 " );	// And, most likely, only one of them will survive after that.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HideMeeting_01_09 " );	// How interesting. And how many people will Haniar take with him?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HideMeeting_01_10 " );	// He went to this meeting alone.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HideMeeting_01_11 " );	// Hmmm... Is he out of his mind? This is pure suicide.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HideMeeting_01_12 " );	// He was pretty confident when he told me about it.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HideMeeting_01_13 " );	// I don't like all this! Haniar has never been distinguished by stupidity and recklessness.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HideMeeting_01_14 " );	// He must have prepared some kind of surprise for Osaira, which he does not even suspect anything about.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HideMeeting_01_15 " );	// Do you happen to know where this meeting is supposed to take place?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HideMeeting_01_16 " );	// No, they both kept silent about this.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HideMeeting_01_17 " );	// Then if I were you, I'd know about it.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HideMeeting_01_18 " );	// I think we should attend as well. Naturally, it is invisible to everyone else.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HideMeeting_01_19 " );	// Okay, I'll try to find out.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HideMeeting_01_20 " );	// You really try, buddy!
	MIS_HaniarSecret = LOG_Running;
	Log_CreateTopic(TOPIC_HaniarSecret,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HaniarSecret,LOG_Running);
	B_LogEntry(TOPIC_HaniarSecret, " I told Gonzalez about the upcoming meeting of priors. He was very surprised that Haniar would go to it alone. Gonzalez asked me to find out where the meeting would take place. It would most likely take place somewhere far away from prying eyes. " );
	AI_StopProcessInfos(self);

	B_KillNpc(SEK_179_SLAVEOBSSEK);
	B_KillNpc(SEK_180_SLAVEOBSSEK);
	B_KillNpc(SEK_181_SLAVEOBSSEK);
	B_KillNpc(Ass_182_Adept);

	Wld_InsertNpc(Ass_395_Adept,"PW_OSAIR_MEET_GUARD_05");
	Wld_InsertNpc(Ass_396_Adept,"PW_OSAIR_MEET_GUARD_05_01");
	Wld_InsertNpc(Ass_397_Adept,"PW_OSAIR_MEET_GUARD_05_02");

};

instance DIA_NONE_1190_Assasin_KnowPlaceMeeting(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_KnowPlaceMeeting_Condition;
	information = DIA_NONE_1190_Assasin_KnowPlaceMeeting_Info;
	permanent = FALSE;
	description = " I think I know where the meeting will take place. " ;
};

func int DIA_NONE_1190_Assasin_KnowPlaceMeeting_Condition()
{
	if((MIS_HaniarSecret == LOG_Running) && (KnowPlaceMeeting == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_KnowPlaceMeeting_Info()
{
	AI_Output(other,self, " DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_01 " );	// I think I know where the meeting will take place.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_02");	//И где же?

	if((Npc_IsDead(Ass_395_Adept) == TRUE) && (Npc_IsDead(Ass_396_Adept) == TRUE) && (Npc_IsDead(Ass_397_Adept) == TRUE))
	{
		B_GivePlayerXP(300);
		AI_Output(other,self, " DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_03 " );	// Osaira's people have blocked the entrance to the foothill cave. True, I had to kill them.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_04 " );	// M-yes. You never miss your chance to chop someone to pieces.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_05 " );	// But you're probably right.
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(other,self, " DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_06 " );	// Osaira's people have blocked the entrance to the foothill cave and won't let anyone in.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_07 " );	// You're probably right.
	};

	AI_Output(self,other, " DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_08 " );	// Apparently, Osair took every precaution to ensure that no one bothered him to deal with Khaniar.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_09 " );	// (seriously) Let's not waste time then. Follow me!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_KnowPlaceMeeting_01_10 " );	// We need to break into this cave by all means.
	RespPWMeet = TRUE;
	HideMeetCome = TRUE;
	PlayerIsPrioratFake = TRUE;
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowHideMeet");

	if(FazimAgreed == TRUE)
	{
		Npc_ExchangeRoutine(Ass_391_Adept,"OsairMeet");
	}
	else
	{
		Wld_InsertNpc(Ass_398_Adept,"PW_OSAIR_MEET_GUARD_01");
	};
	if(RafatAgreed == TRUE)
	{
		Npc_ExchangeRoutine(Ass_392_Adept,"OsairMeet");
	}
	else
	{
		Wld_InsertNpc(Ass_399_Adept,"PW_OSAIR_MEET_GUARD_03");
	};
	if(NazimGetOutCave == TRUE)
	{
		Npc_ExchangeRoutine(Ass_393_Adept,"OsairMeet");
	}
	else
	{
		Wld_InsertNpc(Ass_598_Adept,"PW_OSAIR_MEET_GUARD_02");
	};
	if(KudirGetTrollPlant == TRUE)
	{
		Npc_ExchangeRoutine(Ass_394_Adept,"OsairMeet");
	}
	else
	{
		Wld_InsertNpc(Ass_599_Adept,"PW_OSAIR_MEET_GUARD_04");
	};

	Npc_ExchangeRoutine(Ass_126_Haniar,"OsairMeet");
	Npc_ExchangeRoutine(Ass_127_Osair,"OsairMeet");
};

instances DIA_NONE_1190_Assassin_Showdown (C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_Showdown_Condition;
	information = DIA_NONE_1190_Assasin_Showdown_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_Showdown_Condition()
{
	if((MIS_HaniarSecret == LOG_Running) && (HideMeetCamera == TRUE) && (HaniarDemonRitualEnd == TRUE) && (Npc_GetDistToWP(self,"PW_GOLD_CAVEORE_TEMP_06") < 400))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_Showdown_Info()
{
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Showdown_01_01 " );	// What were those creatures?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Showdown_01_02 " );	// Looks like they are demons.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Showdown_01_03 " );	// Hmmm... (thoughtfully) And Khaniar is really not as simple as it seemed at first glance.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Showdown_01_04 " );	// I was just sure that he would give Osair a surprise.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Showdown_01_05 " );	// And he gave it not only to him, right?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Showdown_01_06 " );	// There is no person I would be afraid of. But these creatures make me a little nervous!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Showdown_01_07 " );	// Did you see how they playfully dealt with Osair and his men?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Showdown_01_08 " );	// And what are we going to do now?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Showdown_01_09 " );	// I don't know. But in any case, there will be no better chance to destroy Haniar.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Showdown_01_10 " );	// So we'll have to destroy this Beliar spawn first!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_Showdown_01_11 " );	// Well, you were looking for a worthy enemy - and now - he is in front of you.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_Showdown_01_12 " );	// Go ahead then! Let's not waste time.
	HaniarCantTalk = TRUE;
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"MeetHaniar");
};

instance DIA_NONE_1190_Assassin_HaniarAway (C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HaniarAway_Condition;
	information = DIA_NONE_1190_Assassin_HaniarAway_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_HaniarAway_Condition()
{
	if((MIS_HaniarSecret == LOG_Running) && (HaniarAway == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_HaniarAway_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarAway_01_01 " );	// Good deeds. This bastard just ran away from us!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarAway_01_02 " );	// I'd do the exact same thing if I were him.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarAway_01_03 " );	// So what do you think we should do now?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarAway_01_04 " );	// Chaniar mentioned some kind of inner sanctuary of the temple.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarAway_01_05 " );	// I think we should look for this place.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarAway_01_06 " );	// If you look for him, then only in the temple.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarAway_01_07 " );	// Let's go then. It's time to end all this.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarAway_01_08 " );	// Good! I follow you.
	self.aivar[ AIV_PARTYMEMBER ] = TRUE ;
	MIS_HaniarSecret = LOG_Success;
	Log_SetTopicStatus(TOPIC_HaniarSecret,LOG_Success);
	B_LogEntry(TOPIC_HaniarSecret, " Haniar has fled from us. His vaunted power is no match for Gonzales and my swords. But it's not over yet. Haniar spoke of some inner sanctuary of the temple where his lord resides. it's not too late. We decided to start searching in the temple of Masyaf. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowMasiafTemple");
};

instance DIA_NONE_1190_Assasin_InTemple(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_InTemple_Condition;
	information = DIA_NONE_1190_Assasin_InTemple_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_InTemple_Condition()
{
	if((Npc_GetDistToWP(self,"PW_TEMPLE_HASIM_TEMP") < 1000) && (Npc_IsInFightMode(hero,FMODE_NONE) == TRUE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_InTemple_Info()
{
	AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_01 " );	// So here we are! So this was their lair?

	if(PlayerChooseFight_PW == TRUE)
	{
		AI_Output(other,self, " DIA_NONE_1190_Assasin_InTemple_01_02 " );	// As you can see.
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_03 " );	// Beautiful place! But there is too much evil in it.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_InTemple_01_04 " );	// All this evil now lies dead in a pool of its own blood.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_05 " );	// (grimly) That's not all. We only wounded the beast, but did not cut off his head!
		AI_Output(other,self, " DIA_NONE_1190_Assasin_InTemple_01_06 " );	// Are you sure about this?
		AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_07 " );	// I mean Chaniar the Blind, the most powerful of the priors of Masyaf!
		AI_Output(other,self, " DIA_NONE_1190_Assasin_InTemple_01_08 " );	// But he didn't seem to be among the others.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_09 " );	// That's the point. And if he is alive, then nothing is finished yet.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_10 " );	// Only when his cold corpse falls at my feet...
		AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_11 " );	// ...only then can this battle be won!
		AI_Output(other,self, " DIA_NONE_1190_Assasin_InTemple_01_12 " );	// And where can we find it?
	}
	else
	{
		AI_Output(other,self, " DIA_NONE_1190_Assasin_InTemple_01_13 " );	// As you can see.
		AI_PlayAni(self,"T_SEARCH");
		AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_14 " );	// Beautiful place! But there is too much evil in it.
		AI_Output(other,self, " DIA_NONE_1190_Assasin_InTemple_01_15 " );	// All this evil now lies dead in a pool of its own blood.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_16 " );	// (grimly) That's not all. We only wounded the beast, but did not cut off its head.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_17 " );	// As long as Hanyar is alive, nothing is finished yet.
		AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_18 " );	// Only when his cold corpse falls at my feet...
		AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_19 " );	// ...only then can this battle be won!
		AI_Output(other,self, " DIA_NONE_1190_Assasin_InTemple_01_20 " );	// And where do we start looking?
	};

	AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_21 " );	// First you need to search the entire temple. Take care of it.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_22 " );	// Perhaps we will find something that will help us in our search.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_23 " );	// In the meantime, I'll think about the current situation.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_InTemple_01_24 " );	// Well, as always, the most 'simple' job goes to me.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_InTemple_01_25 " );	// Stop whining! Better get busy.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_InTemple_01_26 " );	// As you say.
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	B_LogEntry(TOPIC_MasiafStory, " Gonzalez and I made it to the temple. However, we were a bit disappointed. Khanyar the Blind, head spiritual guide and most powerful prior of the Masyaf Brotherhood, disappeared without a trace. Gonzalez suggested we search the temple for anything that could help us track him down. . " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"InTemple");
	GonsaInTemple = TRUE;
	Wld_InsertItem(ItWr_DemonScroll,"FP_ITEMSPAWN_DEMONSCROLL");
};

instance DIA_NONE_1190_Assasin_DemonScroll(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_DemonScroll_Condition;
	information = DIA_NONE_1190_Assasin_DemonScroll_Info;
	permanent = FALSE;
	description = " I just found this strange scroll here. " ;
};

func int DIA_NONE_1190_Assasin_DemonScroll_Condition()
{

	if((GonsaInTemple == TRUE) && (Npc_HasItems(other,ItWr_DemonScroll) >= 1))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_DemonScroll_Info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_DemonScroll_01_01 " );	// I just found this weird scroll here.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_DemonScroll_01_02 " );	// Let me take a look at it.
	B_GiveInvItems(other,self,ItWr_DemonScroll,1);
	Npc_RemoveInvItems(self,ItWr_DemonScroll,1);
	B_UseFakeScroll();
	AI_Output(self,other, " DIA_NONE_1190_Assasin_DemonScroll_01_03 " );	// It's not just a scroll! It looks like some kind of spell is written here.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_DemonScroll_01_04 " );	// And it looks like it's written in the ancient language of Beliar.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_DemonScroll_01_05 " );	// How do you know?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_DemonScroll_01_06 " );	// Don't forget that the Masyaf brothers worship Beliar just like the king's paladins worship Innos!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_DemonScroll_01_07 " );	// And how do you think they address him in prayer?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_DemonScroll_01_08 " );	// Well, I don't know.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_DemonScroll_01_09 " );	// Then just trust me! I will not confuse this language with anything.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_DemonScroll_01_10 " );	// And what should I do with it?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_DemonScroll_01_11 " );	// Try using this spell in prayer to Beliar.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_DemonScroll_01_12 " );	// Maybe something will clear up!
	AI_Output(other,self, " DIA_NONE_1190_Assasin_DemonScroll_01_13 " );	// Okay, let's try.
	B_GiveInvItems(self,other,ItWr_HaniarDemonScroll,1);
	B_LogEntry(TOPIC_MasiafStory, " In the temple, I found a scroll with a spell in the ancient language of Beliar. Gonzalez advised me to use this spell in front of the statue of Beliar. Perhaps something will come of this. " );
};

instance DIA_NONE_1190_Assassin_MasiafSecret (C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_MasiafSecret_Condition;
	information = DIA_NONE_1190_Assassin_MasiafSecret_Info;
	permanent = FALSE;
	description = " I found a secret room in the temple. " ;
};

func int DIA_NONE_1190_Assasin_MasiafSecret_Condition()
{

	if((MasiafSecret == TRUE) && (GonsHere == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assassin_MasiafSecret_Info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_NONE_1190_Assasin_MasiafSecret_01_01 " );	// I found a secret room in the temple. And it seems that there is a magical portal in it.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_MasiafSecret_01_02 " );	// Well, looks like Haniar can't get away from us now.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_MasiafSecret_01_03 " );	// I'm willing to bet that this is the portal that leads to the temple's inner sanctuary.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_MasiafSecret_01_04 " );	// However, before you go there, be well prepared!
	AI_Output(self,other, " DIA_NONE_1190_Assasin_MasiafSecret_01_05 " );	// I think there's a much bigger enemy waiting for you there than just one Prior of Masyaf.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_MasiafSecret_01_06 " );	// Aren't you coming with me?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_MasiafSecret_01_07 " );	// Thought I'd leave you? (smiling) I'll follow you as soon as I finish all my business here.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_MasiafSecret_01_08 " );	// Good! Then we'll meet on the other side of the portal.
	AI_Output(self,other,"DIA_NONE_1190_Assasin_MasiafSecret_01_09");	//Удачи.
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assassin_HaniarDead (C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 1;
	condition = DIA_NONE_1190_Assasin_HaniarDead_Condition;
	information = DIA_NONE_1190_Assassin_HaniarDead_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1190_Assasin_HaniarDead_Condition()
{

	if(Npc_IsDead(Ass_178_Prior_ArchDemon) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assassin_HaniarDead_Info()
{
	B_GivePlayerXP(2000);
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarDead_01_01 " );	// It's over! Hanyar is dead.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarDead_01_02 " );	// I think we should check out the rest of the temple.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarDead_01_03 " );	// Maybe... (breathing) But for me, this fight is already over.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarDead_01_04 " );	// Well, if so... Are you satisfied now?
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarDead_01_05 " );	// I did what I had to do. And it does not matter what emotions I experience.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarDead_01_06 " );	// But I'm extremely grateful for your help.
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarDead_01_07 " );	// Don't! This evil had to be destroyed.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarDead_01_08 " );	// Are you going to go deeper into the temple now?
	AI_Output(other,self, " DIA_NONE_1190_Assasin_HaniarDead_01_09 " );	// Yes. We need to find out who is behind all this.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarDead_01_10 " );	// Good. Then I'll stay here for now and watch your back.
	AI_Output(self,other, " DIA_NONE_1190_Assasin_HaniarDead_01_11 " );	// Go. Don't waste time on empty talk.
	GonsaOut = TRUE;
	self.aivar[ AIV_PARTYMEMBER ] = FALSE ;
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1190_Assasin_HotReduceTeach(C_Info)
{
	npc = NONE_1190_Assasin;
	nr = 800;
	condition = DIA_NONE_1190_Assasin_HotReduceTeach_Condition;
	information = DIA_NONE_1190_Assasin_HotReduceTeach_Info;
	permanent = TRUE;
	description = " Teach me how to endure the heat (Training Points: 10, Cost: 5000 coins) " ;
};

func int DIA_NONE_1190_Assasin_HotReduceTeach_Condition()
{
	if((GonsaCanTeachMeHot == TRUE) && (HotReduceKnow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1190_Assasin_HotReduceTeach_Info()
{
	var int cost;
	var int money;

	AI_Output(other,self, " DIA_NONE_119_Assasin_HotReduceTeach_01_00 " );	// Teach me how to endure the heat.

	cost = 10 ;
	money = 5000;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other, " DIA_NONE_119_Assasin_HotReduceTeach_01_01 " );	// Sorry, but you don't have enough experience for this yet.
		AI_StopProcessInfos(self);
	};

	if(Npc_HasItems(hero,ItMi_Gold) < money)
	{
		AI_Print(Print_NotEnoughGold);
		AI_Output(self,other, " DIA_NONE_119_Assasin_HotReduceTeach_01_02 " );	// Sorry, but I won't do this for free.
		AI_StopProcessInfos(self);
	};
	if((hero.lp >= kosten) && (Npc_HasItems(hero,ItMi_Gold) >= money))
	{
		AI_Output(self,other, " DIA_NONE_119_Assasin_HotReduceTeach_01_03 " );	// Don't make unnecessary moves.
		AI_Output(self,other, " DIA_NONE_119_Assasin_HotReduceTeach_01_04 " );	// Move as little as possible, save energy.
		AI_Output(self,other, " DIA_NONE_119_Assasin_HotReduceTeach_01_05 " );	// The heat can be more debilitating than fighting a whole pack of monsters.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		Npc_RemoveInvItems(hero,ItMi_Gold,money);
		hero.protection[PROT_FIRE] += 5;
		REALPROTFIRE += 5;
		AI_Print(PRINT_LEARNPROTHOT);
		HotReduceKnow = TRUE;
		Snd_Play("LevelUP");
	};
};

// --------------------after priority-------------------- -----------------------

instance DIA_NONE_1191_Assasin_EXIT(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 999;
	condition = DIA_NONE_1191_Assasin_EXIT_Condition;
	information = DIA_NONE_1191_Assasin_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_NONE_1191_Assasin_EXIT_Condition()
{
	return TRUE;
};

func void DIA_NONE_1191_Assasin_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_NONE_1191_Assasin_PICKPOCKET(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 900;
	condition = DIA_NONE_1191_Assasin_PICKPOCKET_Condition;
	information = DIA_NONE_1191_Assasin_PICKPOCKET_Info;
	permanent = TRUE;
	description = PICKPOCKET_COMM;
};

func int DIA_NONE_1191_Assasin_PICKPOCKET_Condition()
{
	return  C_Robbery ( 95 , 350 );
};

func void DIA_NONE_1191_Assasin_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_NONE_1191_Assasin_PICKPOCKET);
	Info_AddChoice(DIA_NONE_1191_Assassin_PICKPOCKET,Dialog_Back,DIA_NONE_1191_Assassin_PICKPOCKET_BACK);
	Info_AddChoice(DIA_NONE_1191_Assassin_PICKPOCKET, DIALOG_PICKPOCKET ,DIA_NONE_1191_Assassin_PICKPOCKET_DoIt);
};

func void DIA_NONE_1191_Assasin_PICKPOCKET_DoIt()
{
	B_Robbery();
	Info_ClearChoices(DIA_NONE_1191_Assasin_PICKPOCKET);
};

func void DIA_NONE_1191_Assasin_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_NONE_1191_Assasin_PICKPOCKET);
};

instance DIA_NONE_1191_Assasin_PreHallo(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 1;
	condition = DIA_NONE_1191_Assasin_PreHallo_Condition;
	information = DIA_NONE_1191_Assasin_PreHallo_Info;
	permanent = FALSE;
	important = TRUE;
};

func int DIA_NONE_1191_Assasin_PreHallo_Condition()
{
	if(MIS_PrioratStart == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_NONE_1191_Assasin_PreHallo_Info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_NONE_1191_Assasin_PreHallo_01_00 " );	// (smiling) Glad to see you alive and well, my friend.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_PreHallo_01_01 " );	// How did everything go in the temple?
	AI_Output(other,self, " DIA_NONE_1191_Assasin_PreHallo_01_02 " );	// There were some difficulties, but as you can see, I coped with them.
	AI_Output(other,self, " DIA_NONE_1191_Assasin_PreHallo_01_03 " );	// How did you manage to get out of there?
	AI_Output(self,other, " DIA_NONE_1191_Assasin_PreHallo_01_04 " );	// Very simple! Their leader had a magic rune with him, which teleported me back to Khorinis.
	AI_Output(other,self, " DIA_NONE_1191_Assasin_PreHallo_01_05 " );	// Clear. And what do you intend to do now?
	AI_Output(self,other, " DIA_NONE_1191_Assasin_PreHallo_01_06 " );	// In truth, I was about to sail back to Varant.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_PreHallo_01_07 " );	// But as it turns out, the paladin's galley is the only ship on this island.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_PreHallo_01_08 " );	// And other ships haven't entered the port of Khorinis for several months.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_PreHallo_01_09 " );	// Apparently, the war with the orcs in Myrtana is going very badly.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_PreHallo_01_10 " );	// (seriously) That's it. But then I had another idea.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_PreHallo_01_11 " );	// I thought for a long time about everything that happened in my life.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_PreHallo_01_12 " );	// And in the end, I decided to devote the rest of my life to the service of Innos.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_PreHallo_01_13 " );	// In addition, I heard that there is a monastery of firebenders on the island.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_PreHallo_01_14 " );	// So I'll go there and try to become their acolyte.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_PreHallo_01_15 " );	// And if Innos forgives me or not, it's not for me to decide.
	AI_Output(other,self, " DIA_NONE_1191_Assasin_PreHallo_01_16 " );	// This is the correct solution.
	AI_Output(other,self, " DIA_NONE_1191_Assasin_PreHallo_01_17 " );	// Pray more often and he will forgive you.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_PreHallo_01_18 " );	// Let's hope you're right.
	GonsaGoKloster = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"City");


};

instance DIA_NONE_1191_Assasin_Simple(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 1;
	condition = DIA_NONE_1191_Assasin_Simple_Condition;
	information = DIA_NONE_1191_Assasin_Simple_Info;
	permanent = TRUE;
	description = " How are you? " ;
};

func int DIA_NONE_1191_Assasin_Simple_Condition()
{
	if(GonsaGoKloster == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1191_Assasin_Simple_Info()
{
	AI_Output(other,self,"DIA_NONE_1191_Assasin_Simple_01_00");	//Как дела?
	AI_Output(self,other, " DIA_NONE_1191_Assasin_Simple_01_01 " );	// It's all right, mate.

	if(GonsaGoKlosterDone == TRUE)
	{
		AI_Output(self,other, " DIA_NONE_1191_Assasin_Simple_01_02 " );	// Especially here in the monastery. I seem to have regained faith in life.
		AI_Output(other,self, " DIA_NONE_1191_Assasin_Simple_01_03 " );	// Glad to hear it.
	}
	else
	{
		AI_Output(self,other, " DIA_NONE_1191_Assasin_Simple_01_04 " );	// I'll just take a break first, and then I'll go to the monastery.
		AI_Output(other,self, " DIA_NONE_1191_Assasin_Simple_01_05 " );	// Look, don't delay this.
	};
};

instance DIA_NONE_1191_Assassin_Kloster (C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 1;
	condition = DIA_NONE_1191_Assasin_Kloster_Condition;
	information = DIA_NONE_1191_Assasin_Kloster_Info;
	permanent = FALSE;
	description = " Are you accepted into the monastery? " ;
};

func int DIA_NONE_1191_Assasin_Kloster_Condition()
{
	if(GonsaGoKlosterDone == TRUE)
	{
		return TRUE;
	};
};

func void DIA_NONE_1191_Assasin_Kloster_Info()
{
	AI_Output(other,self, " DIA_NONE_1191_Assasin_Kloster_01_00 " );	// Have you been accepted into the monastery?
	AI_Output(self,other, " DIA_NONE_1191_Assasin_Kloster_01_01 " );	// Yes. As you see.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_Kloster_01_02 " );	// True, for this I had to confess to Pyrokar.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_Kloster_01_03 " );	// He first listened to me carefully, and then said that everyone has a chance to repent.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_Kloster_01_04 " );	// And now I'm here. I pray at night, but during the day I do housework.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_Kloster_01_05 " );	// By the way, they gave me the robe of a novice of the monastery.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_Kloster_01_06 " );	// So I don't need my assassin armor anymore. As well as my weapon.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_Kloster_01_07 " );	// I started a new life, which means there should be no place for the past in it.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_Kloster_01_08 " );	// So if you want, I'll give it all to you.
	AI_Output(self,other, " DIA_NONE_1191_Assasin_Kloster_01_09 " );	// I'm sure you can put them to better use than I ever did.
	CreateInvItems(self,ItAr_NOV_L,1);
	Info_ClearChoices(DIA_NONE_1191_Assasin_Kloster);
	Info_AddChoice(DIA_NONE_1191_Assasin_Kloster, " Okay! I'll take them from you. " ,DIA_NONE_1191_Assasin_Kloster_Go);
};

func void DIA_NONE_1191_Assasin_Kloster_Go()
{
	AI_UnequipWeapons(self);
	Npc_RemoveInvItems(self,ITMW_2H_KATANA_GIFT,1);
	Npc_RemoveInvItems(self,ITRW_G3_SILENTDEATH_BOW_01_NPC,1);
	AI_Output(other,self, " DIA_NONE_1191_Assasin_Kloster_Go_01_01 " );	// Good! I will take them from you.
	AI_EquipArmor(self,ItAr_NOV_L);
	Npc_RemoveInvItems(self,ITAR_GONSALES,1);
	B_GiveInvItemsManyThings(self,other);
	CreateInvItems(hero,ITAR_ASS,1);
	CreateInvItems(hero,ITMW_2H_KATANA,1);
	CreateInvItems(hero,ITRW_G3_SILENTDEATH_BOW_01,1);
	AI_Output(self,other, " DIA_NONE_1191_Assasin_Kloster_Go_01_02 " );	// That's great! Now I am completely freed from the ghosts of the past.
};

instance DIA_NONE_1191_Assasin_HotReduceTeach(C_Info)
{
	npc = NONE_1191_Assasin;
	nr = 800;
	condition = DIA_NONE_1191_Assasin_HotReduceTeach_Condition;
	information = DIA_NONE_1191_Assasin_HotReduceTeach_Info;
	permanent = TRUE;
	description = " Teach me how to endure the heat (Training Points: 10) " ;
};

func int DIA_NONE_1191_Assasin_HotReduceTeach_Condition()
{
	if((GonsaCanTeachMeHot == TRUE) && (HotReduceKnow == FALSE))
	{
		return TRUE;
	};
};

func void DIA_NONE_1191_Assasin_HotReduceTeach_Info()
{
	var int cost;

	AI_Output(other,self, " DIA_NONE_119_Assasin_HotReduceTeach_01_00 " );	// Teach me how to endure the heat.

	cost = 10 ;

	if(hero.lp < kosten)
	{
		AI_Print(PRINT_NotEnoughLearnPoints);
		AI_Output(self,other, " DIA_NONE_119_Assasin_HotReduceTeach_01_01 " );	// Sorry, but you don't have enough experience for this yet.
		AI_StopProcessInfos(self);
	};
	if(hero.lp >= kosten)
	{
		AI_Output(self,other, " DIA_NONE_119_Assasin_HotReduceTeach_01_03 " );	// Don't make unnecessary moves.
		AI_Output(self,other, " DIA_NONE_119_Assasin_HotReduceTeach_01_04 " );	// Move as little as possible, save energy.
		AI_Output(self,other, " DIA_NONE_119_Assasin_HotReduceTeach_01_05 " );	// The heat can be more debilitating than fighting a whole pack of monsters.
		hero.lp = hero.lp - kosten;
		RankPoints = RankPoints + cost;
		hero.protection[PROT_FIRE] += 5;
		REALPROTFIRE += 5;
		AI_Print(PRINT_LEARNPROTHOT);
		HotReduceKnow = TRUE;
		Snd_Play("LevelUP");
	};
};
