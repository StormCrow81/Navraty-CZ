

instance DIA_Talbin_NW_EXIT(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 999;
	condition = DIA_Talbin_NW_EXIT_Condition;
	information = DIA_Talbin_NW_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_Talbin_NW_EXIT_Condition()
{
	return TRUE;
};

func void DIA_Talbin_NW_EXIT_Info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Talbin_NW(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = DIA_Talbin_NW_Condition;
	information = DIA_Talbin_NW_Info;
	description = " This passage wasn't that scary, was it? " ;
};

func int DIA_Talbin_NW_Condition()
{
	return TRUE;
};

func void DIA_Talbin_NW_Info()
{
	AI_Output(other,self, " DIA_Talbin_NW_15_00 " );	// This passage wasn't that scary, was it?
	AI_Output(self,other, " DIA_Talbin_NW_07_01 " );	// Thanks for saving me.
	AI_Output(self,other, " DIA_Talbin_NW_07_02 " );	// Here. I found this stone on the pass. I think you'll still need it.

	if((other.guild == GIL_KDF) || (other.guild == GIL_GUR) || (other.guild == GIL_KDM) || (other.guild == GIL_KDW))
	{
		AI_Output(self,other, " DIA_Talbin_NW_07_03 " );	// I think it's a runestone.
		CreateInvItems(self,ItMi_RuneBlank,1);
		B_GiveInvItems(self,other,ItMi_RuneBlank,1);
	}
	else
	{
		AI_Output(self,other, " DIA_Talbin_NW_07_04 " );	// I think it's a piece of ore.
		CreateInvItems(self,ItMi_Nugget,1);
		B_GiveInvItems(self,other,ItMi_Nugget,1);
	};

	AI_Output(self,other, " DIA_Talbin_NW_07_05 " );	// May Innos protect you.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Farm");
	TOPIC_END_Talbin_Runs = TRUE;
	B_GivePlayerXP(XP_SavedTalbin);
};

instance DIA_Talbin_NW_PERM(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = DIA_Talbin_NW_PERM_Condition;
	information = DIA_Talbin_NW_PERM_Info;
	permanent = TRUE;
	description = " Is everything okay? " ;
};

func int DIA_Talbin_NW_PERM_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Talbin_NW))
	{
		return TRUE;
	};
};

func void DIA_Talbin_NW_PERM_Info()
{
	AI_Output(other,self, " DIA_Talbin_NW_PERM_15_00 " );	// Is everything okay?
	AI_Output(self,other, " DIA_Talbin_NW_PERM_07_01 " );	// Yes, thank you. Now go. I'll be all right.
	AI_StopProcessInfos(self);
};

instance DIA_Talbin_NW_HuntCamp(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = DIA_Talbin_NW_HuntCamp_Condition;
	information = DIA_Talbin_NW_HuntCamp_Info;
	permanent = FALSE;
	description = " You're a hunter, aren't you? " ;
};

func int DIA_Talbin_NW_HuntCamp_Condition()
{
	if ((MIS_NewHunters == LOG_Running) && ( TALBINRECRUITEDT  ==  FALSE ) && (Npc_KnowsInfo(other,DIA_Talbin_NW)))
	{
		return TRUE;
	};
};

func void DIA_Talbin_NW_HuntCamp_Info()
{
	B_GivePlayerXP(300);
	AI_Output(other,self, " DIA_Talbin_NW_HuntCamp_01_00 " );	// Are you a hunter?
	AI_Output(self,other, " DIA_Talbin_NW_HuntCamp_01_01 " );	// Now I don't even know. I was about to quit this job.
	AI_Output(other,self,"DIA_Talbin_NW_HuntCamp_01_02");	//Почему?
	AI_Output(self,other, " DIA_Talbin_NW_HuntCamp_01_03 " );	// Yeah, how to say... I can't seem to get over everything I've been through in the Valley of Mines.
	AI_Output(other,self, " DIA_Talbin_NW_HuntCamp_01_04 " );	// I think you just need to relax and do what you love. It will distract you from bad thoughts!
	AI_Output(self,other, " DIA_Talbin_NW_HuntCamp_01_06 " );	// I would love to... (sadly) But for hunting, one desire is not enough!
	AI_Output(other,self, " DIA_Talbin_NW_HuntCamp_01_07 " );	// What else do you need?
	AI_Output(self,other, " DIA_Talbin_NW_HuntCamp_01_08 " );	// For starters, good weapons and armor, so as not to become food for all sorts of creatures. And where can I get all this, I have no idea!
	AI_Output(other,self, " DIA_Talbin_NW_HuntCamp_01_10 " );	// Well, for example, in the camp of hunters, which is located near Onar's farm.
	AI_Output(self,other, " DIA_Talbin_NW_HuntCamp_01_11 " );	// At the hunter's camp? (hopefully) I've heard of him before. Although I thought it was just a fairy tale.
	AI_Output(other,self, " DIA_Talbin_NW_HuntCamp_01_12 " );	// No, the camp really exists and right now it is in dire need of experienced people like you.
	AI_Output(self,other, " DIA_Talbin_NW_HuntCamp_01_13 " );	// You're not kidding, buddy?
	AI_Output(other,self, " DIA_Talbin_NW_HuntCamp_01_14 " );	// What a joke! You can go and see for yourself.
	AI_Output(self,other, " DIA_Talbin_NW_HuntCamp_01_15 " );	// Then, perhaps, I will not waste time. I'll go there right away!
	B_LogEntry(TOPIC_NewHunters, " Talbin is very interested in the hunter camp. " );
	TalbinBecameHunt = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"GoHuntCamp");
};


instance DIA_TALBIN_RECRUITDT(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 15;
	condition = dia_talbin_recruitdt_condition;
	information = dia_talbin_recruitdt_info;
	permanent = FALSE;
	description = " Where will you live now? " ;
};

func int dia_talbin_recruitdt_condition()
{
	if ( Npc_KnowsInfo ( other , DIA_Talbin_NW ) && ( TalbinBecameHunt ==  FALSE ) && ( HURRAYICANHIRE  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_talbin_recruitdt_info()
{
	AI_Output(other,self, " Dia_Talbin_RecruitDT_15_00 " );	// Where will you live now?
	AI_Output(self,other, " Dia_Talbin_RecruitDT_07_01 " );	// I'll stop at the Akila farm. I lived there until the Valley of Mines.
	AI_Output(self,other, " Dia_Talbin_RecruitDT_07_02 " );	// If you don't go deep into the forest, then there are quite good hunting grounds.
	AI_Output(other,self, " Dia_Talbin_RecruitDT_15_03 " );	// Well, yes. Unless you run into orcs.
	AI_Output(self,other, " Dia_Talbin_RecruitDT_07_04 " );	// Oh-orcs? What other orcs?
	AI_Output(other,self, " Dia_Talbin_RecruitDT_15_05 " );	// Some time ago, just in the forest near Akila's farm, a band of orcs roamed.
	AI_Output(self,other, " Dia_Talbin_RecruitDT_07_06 " );	// (Desperate) No, not those damn orcs again! Have they already reached Khorinis?
	AI_Output(other,self, " Dia_Talbin_RecruitDT_15_07 " );	// I'm afraid so.
	AI_Output(self,other, " Dia_Talbin_RecruitDT_07_08 " );	// Damn! Where can I hunt now?
	AI_Output(other,self, " Dia_Talbin_RecruitDT_15_09 " );	// You can stay with me, in the tower next to Onar's farm. There is a forest nearby.
	AI_Output(other,self, " Dia_Talbin_RecruitDT_15_10 " );	// There are both mercenaries and a paladin fort nearby. Orcs don't go there.
	AI_Output(self,other, " Dia_Talbin_RecruitDT_07_11 " );	// Yes? I will gladly accept your offer. Thank you! Just what do you want for it?
	AI_Output(other,self, " Dia_Talbin_RecruitDT_15_12 " );	// I need a hunter to get meat for my camp.

	if(NICLASRECRUITEDDT == TRUE)
	{
		AI_Output(other,self, " Dia_Talbin_RecruitDT_15_13 " );	// I already found one, his name is Niklas. But he wants a partner.
		AI_Output(self,other, " Dia_Talbin_RecruitDT_07_14 " );	// Niklas? Good hunter! I wouldn't mind hunting with him again.
	};

	AI_Output(self,other, " Dia_Talbin_RecruitDT_07_15 " );	// I agree to your terms.
	AI_Output(other,self, " Dia_Talbin_RecruitDT_15_16 " );	// Great. How much do you want me to pay you for this?
	AI_Output(self,other, " Dia_Talbin_RecruitDT_07_17 " );	// (Surprised) Money? Not at all. You are my safe house, I am meat for you. In addition, I will hunt for myself a lot of trophies for sale.
	AI_Output(other,self, " Dia_Talbin_RecruitDT_15_18 " );	// Then agreed. And yes, in order to be allowed into the tower, name the password - "Dragon Treasures".
	AI_Output(self,other, " Dia_Talbin_RecruitDT_07_19 " );	// Good. You say the tower is near Onar's farm? Well then, see you there.
	B_GivePlayerXP(300);
	B_LogEntry( TOPIC_PPL_FOR_TOWER , " Hunter Talbin has joined the camp. " );
	self.npcType = NPCTYPE_FRIEND;
	self.aivar[AIV_ToughGuy] = TRUE;
	self.aivar[AIV_IGNORE_Theft] = TRUE;
	self.aivar[AIV_IGNORE_Sheepkiller] = TRUE ;
	self.aivar[AIV_IgnoresArmor] = TRUE ;
	TALBINRECRUITEDDT = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(VLK_4132_Talbin_NW,"InCastle");
};

instance DIA_TALBIN_INTOWER(C_Info)
{
	npc = VLK_4132_Talbin_NW;
	nr = 22;
	condition = dia_talbin_intower_condition;
	information = dia_talbin_intower_info;
	permanent = TRUE;
	description = " How are you hunting? " ;
};

func int dia_talbin_intower_condition()
{
	if((TALBINRECRUITEDDT == TRUE) && (KAPITELORCATC == FALSE) && (Npc_GetDistToWP(self,"NW_CASTLEMINE_TOWER_CAMPFIRE_01") < 2000))
	{
		return TRUE;
	};
};

func void dia_talbin_intower_info()
{
	AI_Output(other,self, " DIA_Talbin_InTower_15_00 " );	// How's the hunting?
	AI_Output(self,other, " DIA_Talbin_InTower_01_01 " );	// Ok, thanks. Orcs are really not here, and this is the main thing.
};

DIA_TALBIN_INTOWER_ORCKAP (C_Info) instances
{
	npc = VLK_4132_Talbin_NW;
	nr = 22;
	condition = dia_talbin_intower_orckap_condition;
	information = dia_talbin_intower_orckap_info;
	permanent = TRUE;
	description = " Are you okay? " ;
};

func int dia_talbin_intower_orckap_condition()
{
	if (( TALBINRECRUITEDT  ==  TRUE ) && ( CAPITELORCATC  ==  TRUE ))
	{
		return TRUE;
	};
};

func void dia_talbin_intower_orckap_info()
{
	AI_Output(other,self, " DIA_Talbin_InTower_OrcKap_15_00 " );	// Are you okay?
	AI_Output(self,other, " DIA_Talbin_InTower_OrcKap_01_01 " );	// One word - orcs. Too much. A lot of. Orcs.
};
