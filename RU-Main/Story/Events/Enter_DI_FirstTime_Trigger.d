

var int EnterDI_Chapter6;

func void enter_di_firsttime_trigger()
{
	if(Npc_HasItems(hero,ItKe_Ship_Levelchange_MIS))
	{
		Npc_RemoveInvItems(hero,ItKe_Ship_Levelchange_MIS,1);
	};
	if(hero.attribute[ATR_DEXTERITY] < 95)
	{
		Wld_InsertItem(ItPo_Perm_DEX,"FP_ITEM_DI_ENTER_05");
	};
	if (EnterDI_Chapter6 ==  FALSE )
	{
		if(hero.guild == GIL_PAL)
		{
			CreateInvItems(Archol,ItRu_PalDestroyEvil,1);
		};

		Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_12");
		Wld_InsertItem(ItMi_Flask,"FP_ITEM_SHIP_06");
		Log_CreateTopic(TOPIC_MyCrew,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_MyCrew,LOG_Running);

		if(JorgenIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew, " Jorgen, my captain, will be waiting on the ship until I return. " );
		};
		if(TorlofIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew, " Torlof, my captain, will stay on the ship and protect it while I'm on the island. He will help me increase my strength and agility. " );
		};
		if(JackIsCaptain == TRUE)
		{
			Log_AddEntry(TOPIC_MyCrew, " Jack, my captain, will be waiting on the ship until I get back. He's a little scared. But I need him. " );
		};
		if(Lee_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew, " Lee will be in command of the ship in my absence. With him, I can improve my skills in combat with one-handed and two-handed weapons. " );
		};
		if(MiltenNW_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew, " At Milten's, I can increase my magical energy. " );
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew, " Milten can teach me how to make runes. " );
			};
		};
		if(Lester_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew, " I have the impression that Leicester's condition has worsened further on this strange island. " );
		};
		if(Mario_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew, " Mario is a little weird. He sat all the way at the back of the ship and hasn't said a word since. " );
		};
		if(Wolf_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew, " Wolf can teach me how to shoot a bow and crossbow. " );
		};
		if(Vatras_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew, " Vatras has retired to the mages' quarters. He can heal me and teach me how to make various drinks. " );
			if(hero.guild == GIL_KDF)
			{
				Log_AddEntry(TOPIC_MyCrew, " Vatras will also be able to increase my Circle of Magic. " );
			};
		};
		if(Bennet_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew, " Bennet will teach me how to forge if I want to. " );
		};
		if(Diego_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew, " Diego will teach me if I don't already know something, he also has equipment. From him I can learn how to pick locks and increase my bow and crossbow skills. " );
		};
		if(Gorn_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew, "The horn hasn't slept during our voyage. He'll look after the ship. I think the ship is in good hands now. " );
			Log_AddEntry(TOPIC_MyCrew, " From Gorn I can learn how to fight with two-handed weapons. " );
		};
		if(Lares_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew, " Lares promised that he would teach me how to sneak and fight with one-handed weapons. In addition, he could increase my dexterity. " );
		};
		if(Biff_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew, " Biff is so money addicted that nothing will stop him. I'll have a hard time keeping him in line. " );
		};
		if(Angar_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew, " The hangar looks very unsettled. I have a feeling that he will soon go to fight alone. " );
		};
		if(Girion_IsOnBoard == LOG_SUCCESS)
		{
			Log_AddEntry(TOPIC_MyCrew, " Girion is as calm as ever, his patience is admirable. He's a combat trainer after all. But it's only good for me. " );
		};

		EnterDI_Chapter6 = TRUE ;
		IntroduceCH_06 = TRUE;
	};
};

