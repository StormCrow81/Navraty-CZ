

func void b_countbackcrew()
{
	if((MIS_HELPCREW == LOG_Running) && (PERMCOUNTBACKNW >= GLOBALCOUNTBACKNW) && (MOVECREWTOHOME == FALSE))
	{
		Log_AddEntry( TOPIC_HELPCREW , " I've talked to everyone on the ship. Now only Innos will decide who lives and who doesn't! " );
		MOVECREWTOHOME = TRUE;
	};
	if(PYROKARUSEONCE == FALSE)
	{
		PYROKARUSEONCE = TRUE;
	};
};

