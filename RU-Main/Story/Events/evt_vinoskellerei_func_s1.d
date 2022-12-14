

var int FoundVinosKellerei;

func void evt_vinoskellerei_func_s1()
{
	if(FoundVinosKellerei == FALSE)
	{
		FoundVinosKellerei = TRUE;
		B_GivePlayerXP(XP_FoundVinosKellerei);

		if(MIS_FindKillPlace == LOG_Running)
		{
			B_LogEntry(TOPIC_FindKillPlace, " Great place, away from prying eyes! I think I should visit Charlotte and tell her about this place. " );
		};
	};
};

