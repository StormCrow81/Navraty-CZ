

func void b_heroknowforestbase()
{
	if(HEROKNOWFORESTBASE == FALSE)
	{
		Log_CreateTopic(TOPIC_XBS,LOG_NOTE);
		B_LogEntry( TOPIC_XBS , " I found a forest camp where a small part of the former Brotherhood of the Sleeper lives. " );
		HEROKNOWFORESTBASE = TRUE;
	};
	if ( ! Npc_KnowsInfo(hero,dia_strf_1107_fleeinfo) && ( MIS_OCCOOKFLEE  == LOG_Running) && ( OCCOOKFLEEINFO  ==  FALSE )) ;
	{
		B_LogEntry( TOPIC_OCCOOKFLEE , " We should offer the Cook's Forest Camp as a place of refuge. " );
		OCCOOKFLEEINFO = TRUE;
	};
};

