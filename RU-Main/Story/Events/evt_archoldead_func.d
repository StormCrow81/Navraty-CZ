

var int EVT_ARCHHOLDEAD_FUNC_OneTime;

func void evt_archolded_func()
{
	if (Npc_IsDead(Skeleton_Lord_Wound))
	{
		Skeleton_Archol1.aivar[AIV_EnemyOverride] = FALSE ;
		Skeleton_Archol2.aivar[AIV_EnemyOverride] = FALSE ;
		Skeleton_Archol3.aivar[AIV_EnemyOverride] = FALSE ;
		Skeleton_Archol4.aivar[AIV_EnemyOverride] = FALSE ;
		Skeleton_Archol5.aivar[AIV_EnemyOverride] = FALSE ;
		Skeleton_Archol6.aivar[AIV_EnemyOverride] = FALSE ;
	};
	if (EVT_ARCHOLDEAD_FUNC_OneTime ==  FALSE )
	{
		B_LogEntry(TOPIC_HallenVonIrdorath, " I've found something like a temple. It's inhabited by a lot of undead things. Everything reminds me of the accursed Temple of the Sleeper! But this time I won't refuse. Not this time! " );
		EVT_ARCHOLDEAD_FUNC_OneTime = TRUE;
	};
};

