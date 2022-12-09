

var int AntiPaladinTalkcount;

func void B_AssignORC_AntiPaladinTalk(var C_Npc Antipaladin)
{
	if(hero.guild == GIL_PAL)
	{
		if(AntiPaladinTalkcount == 0)
		{
			AI_Output(self,other, " DIA_ORC_AntiPaladin_18_01 " );	// KHROKGNAR! Master say you are a paladin now! The owner is right. The owner is always right.
			AI_Output(self,other, " DIA_ORC_AntiPaladin_18_02 " );	// We, the leaders of the proud army of orcs, now come to kill the great paladin ourselves.
			AI_Output(self,other, " DIA_ORC_AntiPaladin_18_03 " );	// Hagen and his people will be destroyed. Even you can't help them.
			B_GivePlayerXP(XP_Ambient);
		}
		else if(AntiPaladinTalkcount == 1)
		{
			AI_Output(self,other, " DIA_ORC_AntiPaladin_18_04 " );	// Master to tell the orc leaders, bring the head of the great paladin. You die by my hand. KHROKGNAR!
		}
		else if(AntiPaladinTalkcount == 2)
		{
			AI_Output(self,other, " DIA_ORC_AntiPaladin_18_05 " );	// We, the leaders of the orcs, now go to kill you, paladin.
		}
		else
		{
			AI_Output(self,other, " DIA_ORC_AntiPaladin_18_06 " );	// KHROKGNAR! We kill you, paladin.
		};
	}
	else
	{
		AI_Output(self,other, " DIA_Orc_8215_Kan_PreHello_01_03 " );	// DABAR KARAD GOR TAK NIR VAK.
	};

	AntiPaladinTalkcount = AntiPaladinTalkcount + 1;
	TalkedTo_AntiPaladin = TRUE;
	Antipaladin.aivar[AIV_EnemyOverride] = FALSE ;
	AI_StopProcessInfos(Antipaladin);
	Npc_SetRefuseTalk(Antipaladin,20);
};

