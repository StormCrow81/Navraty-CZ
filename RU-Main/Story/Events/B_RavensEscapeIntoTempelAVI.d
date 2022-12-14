

var int B_RAVENSESCAPEINTOTEMPELAVI_OneTime;

func void b_ravensescapeintotempelavi()
{
	if(B_RAVENSESCAPEINTOTEMPELAVI_OneTime == FALSE)
	{
		PlayVideoEx("PORTAL_RAVEN.BIK",TRUE,FALSE);
		RavenIsInTempel = TRUE;
		Log_CreateTopic(TOPIC_Addon_RavenKDW,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_RavenKDW,LOG_Running);
		B_LogEntry(TOPIC_Addon_RavenKDW, " I entered the Raven's quarters. I was just able to see him disappear behind a closed door. I couldn't follow him. I think this door leads to the Temple of Adanos. I should report this to Saturas. " ) ;
		B_RAVENSESCAPEINTOTEMPELAVI_OneTime = TRUE;
	};
};

