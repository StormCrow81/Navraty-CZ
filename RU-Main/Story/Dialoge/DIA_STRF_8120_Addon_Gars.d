

instance DIA_STRF_8120_Addon_Gars_EXIT(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 999;
	condition = DIA_STRF_8120_Addon_Gars_exit_condition;
	information = DIA_STRF_8120_Addon_Gars_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};
func int DIA_STRF_8120_Addon_Gars_exit_condition()
{
	return TRUE;
};
func void DIA_STRF_8120_Addon_Gars_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_STRF_8120_Addon_Gars_PreHello(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_PreHello_condition;
	information = DIA_STRF_8120_Addon_Gars_PreHello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8120_Addon_Gars_PreHello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_PreHello_info()
{
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_PreHello_01_00 " );	// (sullenly) Oh, another orc henchman has come to visit us.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_PreHello_01_01 " );	// Where did you get it from?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_PreHello_01_03 " );	// Yes, this is clear even to a fool! Otherwise, the orcs simply wouldn't let you roam here.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_PreHello_01_04 " );	// Well, so... (sullenly) What do you want from me?
};

instance DIA_STRF_8120_Addon_Gars_HELLO(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_hello_condition;
	information = DIA_STRF_8120_Addon_Gars_hello_info;
	permanent = FALSE;
	description = " Who are you? " ;
};

func int DIA_STRF_8120_Addon_Gars_hello_condition()
{
	return TRUE;
};

func void DIA_STRF_8120_Addon_Gars_hello_info()
{
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Hello_01_00");	//А ты кто?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Hello_01_01 " );	// You can just call me Gars. I am a slave to the orcs, just like everyone else here.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Hello_01_02 " );	// Well, if you don't count you, of course...
};

instance DIA_STRF_8120_Addon_Gars_NoOrc(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_NoOrc_condition;
	information = DIA_STRF_8120_Addon_Gars_NoOrc_info;
	permanent = FALSE;
	description = " You're wrong! " ;
};

func int DIA_STRF_8120_Addon_Gars_NoOrc_condition()
{
	return TRUE;
};

func void DIA_STRF_8120_Addon_Gars_NoOrc_info()
{
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_NoOrc_01_00 " );	// You're wrong! I don't work for orcs.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NoOrc_01_01 " );	// Hmmm... (snidely) Anyone can say that! But I used to usually believe in deeds, not words.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NoOrc_01_02 " );	// So if you want people to trust you, prove it first!
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NoOrc_01_03 " );	// And no one here will believe empty words and promises.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_NoOrc_01_04 " );	// And how can I do this?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NoOrc_01_05 " );	// Well, I have one idea about this.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NoOrc_01_06 " );	// The Elder of Ar Dagar has the key to the warehouse where all the Orc food supplies are kept.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NoOrc_01_07 " );	// Bring it to me! Just make sure he doesn't get suspicious.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NoOrc_01_08 " );	// That's when I might change my mind about you. But not before.
	MIS_ArDagarKey = LOG_Running;
	Log_CreateTopic(TOPIC_ArDagarKey,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_ArDagarKey,LOG_Running);
	B_LogEntry(TOPIC_ArDagarKey, " Before Gars believes I'm not working for the orcs, I need to steal the key to the orc food store from the orc Ar Dagar. " );
};

instance DIA_STRF_8120_Addon_Gars_ArDagarKey(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_ArDagarKey_condition;
	information = DIA_STRF_8120_Addon_Gars_ArDagarKey_info;
	permanent = FALSE;
	description = " Here is the key you need. " ;
};

func int DIA_STRF_8120_Addon_Gars_ArDagarKey_condition()
{
	if ((MIS_ArDagarKey == LOG_Running) && (Npc_HasItems(other,ItKe_ArDagar) >=  1 ))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_ArDagarKey_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_ArDagarKey_01_00 " );	// Here's the key you need.
	B_GiveInvItems(other,self,ItKe_ArDagar,1);
	Npc_RemoveInvItems(self,ItKe_ArDagar,1);
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_ArDagarKey_01_01 " );	// Hmmm...(pretty) Quite different, mate!
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_ArDagarKey_01_02 " );	// Now you can really see that you are your own person.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_ArDagarKey_01_03 " );	// Why do you need it?
	AI_PlayAni(self,"T_SEARCH");
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_ArDagarKey_01_04 " );	// We're all having a pretty hard time here.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_ArDagarKey_01_05 " );	// Many are starving. And the orcs in the warehouse certainly have something to profit from.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_ArDagarKey_01_06 " );	// I don't think they'll notice if some food goes missing from the warehouse.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_ArDagarKey_01_07 " );	// And for guys, an extra piece of bread is only a joy. Are you savvy?
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_ArDagarKey_01_08 " );	// Of course. The main thing is that the orcs do not suspect anything.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_ArDagarKey_01_09 " );	// How will they know? (with a smirk) You're not going to tell them anything, are you?
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_ArDagarKey_01_10");	//Само собой.
	RT_Respect = RT_Respect + 1;
	MIS_ArDagarKey = LOG_Success;
	Log_SetTopicStatus(TOPIC_ArDagarKey,LOG_Success);
	B_LogEntry(TOPIC_ArDagarKey, " I brought the warehouse key to Gars. " );
};

instance DIA_STRF_8120_Addon_Gars_Paladin(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Paladin_condition;
	information = DIA_STRF_8120_Addon_Gars_Paladin_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8120_Addon_Gars_Paladin_condition()
{
	if(MIS_RemoveOrc == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Paladin_info()
{
	B_GivePlayerXP(150);
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Paladin_01_00 " );	// Hey...(sternly) Are you looking to meet me?
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Paladin_01_01 " );	// Yes, that was me. If you really are a paladin.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Paladin_01_02 " );	// He's the best! My real name is Wenzel.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Paladin_01_03 " );	// Wenzel?! It turns out that I was not mistaken.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Paladin_01_04 " );	// Happy for you. But what did you want from me?
	FindVenzel = TRUE;
	self.name[0] = "Венцель";
	B_LogEntry(TOPIC_LostPaladins, " I found a paladin in the mine. It turned out to be miner Gars! Who would have thought... " );
};


instance DIA_STRF_8120_Addon_Gars_Name(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Name_condition;
	information = DIA_STRF_8120_Addon_Gars_Name_info;
	permanent = FALSE;
	description = " Gars isn't your real name? " ;
};

func int DIA_STRF_8120_Addon_Gars_Name_condition()
{
	if(FindVenzel == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Name_info()
{
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Name_01_00 " );	// So Gars isn't your real name?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Name_01_01 " );	// No. It's just the first thing that came to my mind when the orcs grabbed me.
};

instance DIA_STRF_8120_Addon_Gars_Back(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Back_condition;
	information = DIA_STRF_8120_Addon_Gars_Back_info;
	permanent = FALSE;
	description = " Garond sent me. " ;
};

func int DIA_STRF_8120_Addon_Gars_Back_condition()
{
	if(FindVenzel == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Back_info()
{
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Back_01_00 " );	// Garond sent me.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Back_01_01 " );	// Garond?! Do you know Garonda?
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Back_01_02 " );	// Of course. He has now taken refuge with his paladins in the old castle of the ore barons.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Back_01_03 " );	// True, he was surrounded on all sides by orcs, so they have a hard time there.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Back_01_04 " );	// But he sent me to find out what happened to you and your squad.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Back_01_05 " );	// That's why I'm here now!
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Back_01_06 " );	// I'm afraid I have some sad news for him... All my people are dead.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Back_01_07 " );	// Only I managed to survive, but, as you can see, I was captured by the orcs.
};

instance DIA_STRF_8120_Addon_Gars_Happen(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Happen_condition;
	information = DIA_STRF_8120_Addon_Gars_Happen_info;
	permanent = FALSE;
	description = " How did this happen? " ;
};

func int DIA_STRF_8120_Addon_Gars_Happen_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_Back) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Happen_info()
{
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Happen_01_00 " );	// How did this happen?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Happen_01_01 " );	// (sadly) We ran into one of their patrols... Orcs attacked us suddenly!
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Happen_01_02 " );	// In just a few minutes of the fight, I lost almost half of my people.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Happen_01_03 " );	// Seeing that the situation is not in our favor, I ordered my people to retreat to the river.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Happen_01_04 " );	// But it was too late! The orcs were getting bigger and bigger.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Happen_01_05 " );	// In the end, only I managed to cross the river.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Happen_01_06 " );	// Praise Innos - the orcs did not chase me. However, I was injured and bled profusely.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Happen_01_07 " );	// I even had to take off my armor, because it severely restricted my actions.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Happen_01_08 " );	// Now the only hope was that Garond managed to take up defense in the castle.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Happen_01_09 " );	// And I had to somehow get there.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Happen_01_10 " );	// But as you can see, I couldn't do that... Orcs caught me earlier and dragged me here.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Happen_01_11 " );	// So now I'm just an iron ore mining slave.
};

instance DIA_STRF_8120_Addon_Gars_DontKnow(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_DontKnow_condition;
	information = DIA_STRF_8120_Addon_Gars_DontKnow_info;
	permanent = FALSE;
	description = " Orcs don't know you're a paladin, do they? " ;
};

func int DIA_STRF_8120_Addon_Gars_DontKnow_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_Happen) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_DontKnow_info()
{
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_DontKnow_01_00 " );	// Orcs don't know you're a paladin, do they?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_DontKnow_01_01 " );	// No. These creatures mistook me for an ordinary convict miner.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_DontKnow_01_02 " );	// If they only knew who was really standing in front of them, I'd be dead by now.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_DontKnow_01_03 " );	// Понимаю.
};

instance DIA_STRF_8120_Addon_Gars_GetOut(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_GetOut_condition;
	information = DIA_STRF_8120_Addon_Gars_GetOut_info;
	permanent = FALSE;
	description = " I need to somehow get you out of here! " ;
};

func int DIA_STRF_8120_Addon_Gars_GetOut_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_Back) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_GetOut_info()
{
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_GetOut_01_00 " );	// I need to get you out of here somehow!
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_GetOut_01_01 " );	// Interesting! And how are you going to do it?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_GetOut_01_02 " );	// Do you think the orcs will just take me and let me go?!
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_GetOut_01_03 " );	// No, of course not! But I will definitely come up with something.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_GetOut_01_04 " );	// Listen to me, buddy...(seriously) I'm certainly flattered that you've come this long just for me.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_GetOut_01_05 " );	// But there are other people in this mine! You can't just pick them up and leave them to the mercy of fate.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_GetOut_01_06 " );	// After all, when they found out that there was now a paladin among them, people had a real hope for salvation.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_GetOut_01_07 " );	// So now I'm responsible for their lives. So either get out of here all together, or no way!
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_GetOut_01_08 " );	// But you have to understand that I can't get everyone out of this shaft.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_GetOut_01_09 " );	// Then you better not talk about it anymore!
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_GetOut_01_10 " );	// I'm not leaving here unless I'm sure everyone else is safe.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_GetOut_01_11");	//Понимаю.
	VenzelNeedProof = TRUE;
	OrcDoneWalArDagar = TRUE;
	B_LogEntry(TOPIC_LostPaladins, " Even if I can find a way to get Wenzel out of the clutches of the orcs, he still won't leave the mine until he makes sure the rest of the slaves are safe. " );
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(STRF_8120_Addon_Gars,"Start");
};

instance DIA_STRF_8120_Addon_Gars_Teleport(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Teleport_condition;
	information = DIA_STRF_8120_Addon_Gars_Teleport_info;
	permanent = FALSE;
	description = " There should be a magical portal around here somewhere. " ;
};

func int DIA_STRF_8120_Addon_Gars_Teleport_condition()
{
	if(MIS_MineTeleport == LOG_Running)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Teleport_info()
{
	B_GivePlayerXP(100);
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Teleport_01_00 " );	// There should be a magical portal around here somewhere.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Teleport_01_01 " );	// Portal? Where did you even get this?!
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Teleport_01_02 " );	// Crowe translated an old tablet that Nuts found here in the mine.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Teleport_01_03 " );	// It just says about its existence.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Teleport_01_04 " );	// Hmmm...(thoughtfully) I wouldn't put too much faith in any of this.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Teleport_01_05 " );	// We don't even know who exactly wrote this!
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Teleport_01_06 " );	// But if it's true, then you might have a chance to be saved.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Teleport_01_07 " );	// You're right, of course, mate. I have nothing to oppose you in response.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Teleport_01_08 " );	// So we need to find out everything that could be related to this!
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Teleport_01_09 " );	// But if the portal really exists, then most likely it is on the lower level of the mine.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Teleport_01_10 " );	// Orcs won't let anyone in there. Some even say that there is a terrible evil.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Teleport_01_11 " );	// Looks like you'll have to clear a path first.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Teleport_01_12 " );	// You're right...(seriously) However, you'll have to act alone.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Teleport_01_13 " );	// For we cannot risk the lives of others.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Teleport_01_14 " );	// Well, I'm not used to it.
	B_LogEntry_Quiet(TOPIC_MineTeleport, " I told Wenzel about the portal. However, in his opinion, this portal can only be located on the lower level of the mine. Therefore, I need to somehow get there. " );	
};

instance DIA_STRF_8120_Addon_Gars_TeleportFind(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_TeleportFind_condition;
	information = DIA_STRF_8120_Addon_Gars_TeleportFind_info;
	permanent = FALSE;
	description = " I've been to the lower level of the mine. " ;
};

func int DIA_STRF_8120_Addon_Gars_TeleportFind_condition()
{
	if((MIS_MineTeleport == LOG_Running) && (Npc_HasItems(other,ItMi_PortalCrystal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_TeleportFind_info()
{
	B_GivePlayerXP(1000);
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_TeleportFind_01_00 " );	// I've been to the lower level of the mine.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_TeleportFind_01_01 " );	// Then what will please you?
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_TeleportFind_01_02 " );	// Looks like I actually managed to find something that looks like a magical portal.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_TeleportFind_01_03 " );	// And with him this strange stone.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_TeleportFind_01_04 " );	// Hmmm... (thoughtfully) This item is very much like a focus stone that only mages normally use.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_TeleportFind_01_05 " );	// Try to take it to Crow! Perhaps he can give you some advice.
	B_LogEntry_Quiet(TOPIC_MineTeleport, " I informed Wenzel that there was a place below that vaguely resembled a magical portal. I also showed him a strange-looking stone that I was lucky to find below. According to Wenzel, it looks very much like a focusing element, which usually used only by magicians. And he advised me to talk with Crow. " );	
	SendPortalKrow = TRUE;
};

instance DIA_STRF_8120_Addon_Gars_NeedWeapons(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_NeedWeapons_condition;
	information = DIA_STRF_8120_Addon_Gars_NeedWeapons_info;
	permanent = FALSE;
	description = " I spoke to Crowe. " ;
};

func int DIA_STRF_8120_Addon_Gars_NeedWeapons_condition()
{
	if(MIS_MineTeleport == LOG_Success)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_NeedWeapons_info()
{
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_00 " );	// I've spoken to Crow.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_01 " );	// (seriously) And what did he say?
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_02 " );	// Looks like you were right. This is truly a magical unit.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_03 " );	// And, apparently, with its help it will be possible to activate the portal I found.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_04 " );	// That's good news! Thanks to you, we now have a real chance to save all people!
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_05 " );	// But that's not all. According to Crow, the portal could lead to the mainland.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_06 " );	// (surprised) To the mainland? Are you sure?
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_07 " );	// The unit itself bears the mark of the royal order of the Fire Mages.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_08 " );	// Therefore, it is possible that it may turn out that way.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_09 " );	// So, Mirtana... (thoughtfully) I already thought that I would never see her again.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_10 " );	// Is something bothering you?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_11 " );	// No, of course... (nostalgically) That's where my house is. As well as many of those who sailed here with Lord Hagen.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_12 " );	// But okay, enough memories! There is simply no time for this right now.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_13 " );	// Crowe said you'd tell us how to proceed.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_14 " );	// It's very simple. I'll take charge of the people.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_15 " );	// But first, we need to prepare well for the escape.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_16 " );	// We need decent weapons and enough food.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_17 " );	// Without all this, our plans will initially be doomed to failure.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_18 " );	// Other than that, it would be nice if you could bring me back my armor and sword.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_NeedWeapons_01_19 " );	// If we have to fight our way through, they'll save more than one life!
	; _ _ _ _
};

instance DIA_STRF_8120_Addon_Gars_Weapons(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Weapons_condition;
	information = DIA_STRF_8120_Addon_Gars_Weapons_info;
	permanent = FALSE;
	description = " How many weapons do you need? " ;
};

func int DIA_STRF_8120_Addon_Gars_Weapons_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_NeedWeapons) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Weapons_info()
{
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Weapons_01_00 " );	// How many weapons do you need?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Weapons_01_01 " );	// Considering the total number of people, at least two dozen swords. Ordinary ones will do.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Weapons_01_02 " );	// But I'll give it to the people just before we start making our way to the portal.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Weapons_01_03 " );	// It'll be too dangerous before, or the orcs might get suspicious.
	AI_Output(other,self,"DIA_STRF_8120_Addon_Gars_Weapons_01_04");	//Понимаю.
	MIS_GarsWeapons = LOG_Running;
	Log_CreateTopic(TOPIC_GarsWeapons,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GarsWeapons,LOG_Running);
	B_LogEntry(TOPIC_GarsWeapons, " To arm the people, Wenzel needs at least two dozen regular swords. " );
};

instance DIA_STRF_8120_Addon_Gars_WeaponsDone(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_WeaponsDone_condition;
	information = DIA_STRF_8120_Addon_Gars_WeaponsDone_info;
	permanent = FALSE;
	description = " I brought you a weapon. " ;
};

func int DIA_STRF_8120_Addon_Gars_WeaponsDone_condition()
{
	if((MIS_GarsWeapons == LOG_Running) && (Npc_HasItems(other,ItMw_1H_Common_01) >= 20))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_WeaponsDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_WeaponsDone_01_00 " );	// I brought you a weapon.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_WeaponsDone_01_01 " );	// (whispers) Shut up, buddy... If the orcs hear us, don't blow our heads off!
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_WeaponsDone_01_02 " );	// Give it here. Let him lie here for now, in a secluded place.
	B_GiveInvItems(other,self,ItMw_1H_Common_01,20);
	Npc_RemoveInvItems(self,ItMw_1H_Common_01,20);
	MIS_GarsWeapons = LOG_Success;
	Log_SetTopicStatus(TOPIC_GarsWeapons,LOG_Success);
	B_LogEntry(TOPIC_GarsWeapons, " I brought a weapon for Wenzel. " );
};

instance DIA_STRF_8120_Addon_Gars_Food(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Food_condition;
	information = DIA_STRF_8120_Addon_Gars_Food_info;
	permanent = FALSE;
	description = " How much food do you need? " ;
};

func int DIA_STRF_8120_Addon_Gars_Food_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_NeedWeapons) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Food_info()
{
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Food_01_00 " );	// How much food do you need?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Food_01_01 " );	// Hmmm, let me think... (seriously) Let's say twenty bottles of water and fifty pieces of meat would be enough.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Food_01_02 " );	// But only fried. I don't want one of my people to have their stomach twisted at the most crucial moment.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Food_01_03 " );	// Isn't that enough?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Food_01_04 " );	// No, just right... (firmly) For the first time, this will be enough for us. And besides, it will not burden us so much.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Food_01_05 " );	// Well, the rest is already in the hands of Innos!
	MIS_BarleyFood = LOG_Running;
	Log_CreateTopic(TOPIC_GarsFood,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GarsFood,LOG_Running);
	B_LogEntry(TOPIC_GarsFood, " To feed people on a campaign, Wenzel needs fifty fried pieces of meat and twenty bottles of water. " );
};

instance DIA_STRF_8120_Addon_Gars_FoodDone(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_FoodDone_condition;
	information = DIA_STRF_8120_Addon_Gars_FoodDone_info;
	permanent = FALSE;
	description = " I brought you some food. " ;
};

func int DIA_STRF_8120_Addon_Gars_FoodDone_condition()
{
	if((MIS_GarsFood == LOG_Running) && (Npc_HasItems(other,ItFoMutton) >= 50) && (Npc_HasItems(other,ItFo_Water) >= 20))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_FoodDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_FoodDone_01_00 " );	// I brought you food.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItFoMutton,50);
	Npc_RemoveInvItems(other,ItFo_Water,20);
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_FoodDone_01_01 " );	// Great, mate! Without her, we would have had a really hard time.
	MIS_GarsFood = LOG_Success;
	Log_SetTopicStatus(TOPIC_GarsFood,LOG_Success);
	B_LogEntry(TOPIC_GarsFood, " I brought Wenzel the right amount of food. " );
};

instance DIA_STRF_8120_Addon_Gars_Armor(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Armor_condition;
	information = DIA_STRF_8120_Addon_Gars_Armor_info;
	permanent = FALSE;
	description = " Where can I find your armor and sword? " ;
};

func int DIA_STRF_8120_Addon_Gars_Armor_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8120_Addon_Gars_NeedWeapons) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Armor_info()
{
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Armor_01_00 " );	// Where can I find your armor and sword?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Armor_01_01 " );	// Before the orcs grabbed me, I hid them in a cave, under a waterfall.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Armor_01_02 " );	// But don't you dare wear them!
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Armor_01_03 " );	// Why else?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Armor_01_04 " );	// (proudly) My armor is sanctified by the tears of Innos himself.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Armor_01_05 " );	// If you dare to wear them, you will die a painful death! The same goes for the sword...
	MIS_GarsArmor = LOG_Running;
	Log_CreateTopic(TOPIC_GarsArmor,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_GarsArmor,LOG_Running);
	B_LogEntry(TOPIC_GarsArmor, " Before the orcs captured Wenzel, he managed to hide his armor and sword in a cave under a waterfall. " );
};

instance DIA_STRF_8120_Addon_Gars_ArmorDone(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_ArmorDone_condition;
	information = DIA_STRF_8120_Addon_Gars_ArmorDone_info;
	permanent = FALSE;
	description = " Here is your armor and sword. " ;
};

func int DIA_STRF_8120_Addon_Gars_ArmorDone_condition()
{
	if((MIS_GarsArmor == LOG_Running) && (Npc_HasItems(other,ItMw_1H_Blessed_Venzel) >= 1) && (Npc_HasItems(other,ITAR_PAL_H_V2_VENZEL) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_ArmorDone_info()
{
	B_GivePlayerXP(500);
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_ArmorDone_01_00 " );	// Here is your armor and sword.
	B_GiveInvItemsManyThings(other,self);
	Npc_RemoveInvItems(other,ItMw_1H_Blessed_Venzel,1);
	Npc_RemoveInvItems(other,ITAR_PAL_H_V2_VENZEL,1);
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_ArmorDone_01_01 " );	// Hmmm... (respectfully) To be honest, I didn't think you could handle all this.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_ArmorDone_01_02 " );	// It was easy. You told me where to find them.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_ArmorDone_01_03 " );	// Then it looks like I needn't have worried.
	MIS_GarsArmor = LOG_Success;
	Log_SetTopicStatus(TOPIC_GarsArmor,LOG_Success);
	B_LogEntry(TOPIC_GarsArmor, " I returned Wenzel's armor and sword. " );
};

instance DIA_STRF_8120_Addon_Gars_Buy(C_Info)
{
	npc = STRF_8120_Addon_Gars;
	nr = 2;
	condition = DIA_STRF_8120_Addon_Gars_Buy_condition;
	information = DIA_STRF_8120_Addon_Gars_Buy_info;
	permanent = FALSE;
	description = " Do you need anything else? " ;
};

func int DIA_STRF_8120_Addon_Gars_Buy_condition()
{
	if((MIS_GarsArmor == LOG_Success) && (MIS_GarsFood == LOG_Success) && (MIS_GarsWeapons == LOG_Success))
	{
		return TRUE;
	};
};

func void DIA_STRF_8120_Addon_Gars_Buy_info()
{
	B_GivePlayerXP(2000);
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Buy_01_00 " );	// Do you need anything else?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Buy_01_01 " );	// Probably not... (seriously) We already have everything we need to escape.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Buy_01_02 " );	// Good. Then what's next?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Buy_01_03 " );	// Now we just have to wait for the right moment and get out of here as soon as possible.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Buy_01_04 " );	// You know... (thoughtfully) I was thinking that maybe we won't see each other anymore.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Buy_01_05 " );	// Therefore, here and now I want to thank you for your help!
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Buy_01_06 " );	// For all of us, it turned out to be simply priceless.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Buy_01_07 " );	// You managed to save many human lives, which has always been valued above all else.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Buy_01_08 " );	// Nice to hear that. But what about Garonde?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Buy_01_09 " );	// Tell him I won't be returning to the Valley of Mines again.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Buy_01_10 " );	// What are you going to do?
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Buy_01_11 " );	// I will go to Myrtana and continue to fight against the orcs.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Buy_01_12 " );	// After all, things are no better there now than they are here! The king has every man who knows how to hold a sword on his account.
	AI_Output(other,self, " DIA_STRF_8120_Addon_Gars_Buy_01_13 " );	// Okay, so I'll pass it on to him.
	AI_Output(self,other, " DIA_STRF_8120_Addon_Gars_Buy_01_14 " );	// Then goodbye! May Innos always be with you...
	MIS_EscapeMine = LOG_Success;
	Log_SetTopicStatus(TOPIC_EscapeMine,LOG_Success);
	B_LogEntry(TOPIC_EscapeMine, " Now the fate of the prisoners is in their own hands! I helped them in every way I could... " );
	AI_StopProcessInfos(self);
};

// --------------------------------Hart--------------- -----------------------

instance DIA_STRF_8146_Hart_EXIT(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 999;
	condition = DIA_STRF_8146_Hart_exit_condition;
	information = DIA_STRF_8146_Hart_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};

func int DIA_STRF_8146_Hart_exit_condition()
{
	return TRUE;
};

func void DIA_STRF_8146_Hart_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_STRF_8146_Hart_HELLO(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_hello_condition;
	information = DIA_STRF_8146_Hart_hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_STRF_8146_Hart_hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_hello_info()
{
	AI_Output(self,other, " DIA_STRF_8146_Hart_Hello_01_00 " );	// (surprised) Hey buddy! How did you even get here?
	AI_Output(other,self, " DIA_STRF_8146_Hart_Hello_01_01 " );	// I have the same question for you.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Hello_01_02 " );	// I'm not here of my own free will. It just so happened.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Hello_01_03 " );	// But here you are - a completely different matter. And how did the orcs let you in here?
	AI_Output(other,self, " DIA_STRF_8146_Hart_Hello_01_04 " );	// You'd better ask them yourself.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Hello_01_05 " );	// No, fire me... I prefer to have less contact with these creatures.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Hello_01_06 " );	// They have too cool a temper! A little something wrong, they immediately grab their ax.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Hello_01_07 " );	// And I don't need any extra trouble at all!
};

instance DIA_STRF_8146_Hart_About(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_About_condition;
	information = DIA_STRF_8146_Hart_About_info;
	permanent = FALSE;
	description = " What are you doing here? " ;
};

func int DIA_STRF_8146_Hart_About_condition()
{
	return TRUE;
};

func void DIA_STRF_8146_Hart_About_info()
{
	AI_Output(other,self, " DIA_STRF_8146_Hart_About_01_00 " );	// What are you doing here?
	AI_Output(self,other, " DIA_STRF_8146_Hart_About_01_01 " );	// I'm a fighter in the arena here, and I fight here for the amusement of the orcs.
	AI_Output(self,other, " DIA_STRF_8146_Hart_About_01_02 " );	// True, I won this honor at the cost of my own life.
	AI_Output(other,self, " DIA_STRF_8146_Hart_About_01_03 " );	// Interesting! Orcs usually don't like humans much.
	AI_Output(other,self, " DIA_STRF_8146_Hart_About_01_04 " );	// Why didn't they kill you?
	AI_Output(self,other, " DIA_STRF_8146_Hart_About_01_05 " );	// It's a long story... At that time I was in the personal guard of one of the ore barons.
	AI_Output(self,other, " DIA_STRF_8146_Hart_About_01_06 " );	// Somehow, during one hunt, we were ambushed by these green-skinned degenerates.
	AI_Output(self,other, " DIA_STRF_8146_Hart_About_01_07 " );	// We fought bravely, but there were far more orcs than us.
	AI_Output(self,other, " DIA_STRF_8146_Hart_About_01_08 " );	// But before I fell into their clutches, I killed a dozen of these creatures!
	AI_Output(self,other, " DIA_STRF_8146_Hart_About_01_09 " );	// (proudly) I fought to the last! Desperately! Knowing that almost already doomed to death.
	AI_Output(self,other, " DIA_STRF_8146_Hart_About_01_10 " );	// And when the blow of one of the orcs pinned me to the ground and I was about to say goodbye to my life...
	AI_Output(self,other, " DIA_STRF_8146_Hart_About_01_11 " );	// ...it turned out that one of their elders had his eye on me!
	AI_Output(self,other, " DIA_STRF_8146_Hart_About_01_12 " );	// Orcs have great respect for strong and brave warriors, even if you are their enemy.
	AI_Output(self,other, " DIA_STRF_8146_Hart_About_01_13 " );	// That elder was called Ur Kahn. He took me here to the city and made me a fighter in his arena.
	AI_Output(self,other, " DIA_STRF_8146_Hart_About_01_14 " );	// And now I will have to work off my debt to him until the end of my days.
	AI_Output(other,self, " DIA_STRF_8146_Hart_About_01_15 " );	// What do you owe him?
	AI_Output(self,other, " DIA_STRF_8146_Hart_About_01_16 " );	// Like what? Own life! Just her, mate.
	AI_Output(other,self,"DIA_STRF_8146_Hart_About_01_17");	//Ясно.
};

instance DIA_STRF_8146_Hart_Arena(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Arena_condition;
	information = DIA_STRF_8146_Hart_Arena_info;
	permanent = FALSE;
	description = " Tell me a little about the arena. " ;
};

func int DIA_STRF_8146_Hart_Arena_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_About) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Arena_info()
{
	AI_Output(other,self, " DIA_STRF_8146_Hart_Arena_01_00 " );	// Tell me about the arena.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Arena_01_01 " );	// What's there to say? Ur Kahn is in charge here.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Arena_01_02 " );	// If you want to fight, you'll have to talk to him first.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Arena_01_03 " );	// Basically all arena fighters are orcs. The strongest of them is Umrak!
	AI_Output(self,other, " DIA_STRF_8146_Hart_Arena_01_04 " );	// But I don't advise you to mess with him, because this black orc is damn strong.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Arena_01_05 " );	// Some say that even Ur Kahn himself is a little afraid of him.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Arena_01_06 " );	// Well, that's all. Ur Kahn himself will tell you the rest.
	AI_Output(other,self, " DIA_STRF_8146_Hart_Arena_01_07 " );	// Okay, thanks.
	KnowAboutUmrak = TRUE;
};

instance DIA_STRF_8146_Hart_Escape(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Escape_condition;
	information = DIA_STRF_8146_Hart_Escape_info;
	permanent = FALSE;
	description = " Have you tried to escape from here? " ;
};

func int DIA_STRF_8146_Hart_Escape_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_About) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Escape_info()
{
	AI_Output(other,self, " DIA_STRF_8146_Hart_Escape_01_00 " );	// Have you tried escaping from here?
	AI_Output(self,other, " DIA_STRF_8146_Hart_Escape_01_01 " );	// Ha! Are you joking? (laughs) Such numbers will not work here.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Escape_01_02 " );	// It's an orc town, mate! There are security guards almost everywhere.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Escape_01_03 " );	// The only way to get out of here is to become the absolute winner in their arena.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Escape_01_04 " );	// But then you'll have to fight Umrak, and that's certain death!
};

instance DIA_STRF_8146_Hart_Duel(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Duel_condition;
	information = DIA_STRF_8146_Hart_Duel_info;
	permanent = FALSE;
	description = " Can I challenge you to a duel? " ;
};

func int DIA_STRF_8146_Hart_Duel_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_Arena) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Duel_info()
{
	AI_Output(other,self, " DIA_STRF_8146_Hart_Duel_01_00 " );	// Can I challenge you to a duel?
	AI_Output(self,other, " DIA_STRF_8146_Hart_Duel_01_01 " );	// Only if Ur Kahn gives his permission.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Duel_01_02 " );	// Here everything is done only with his knowledge. No other way!
};

instance DIA_STRF_8146_Hart_Help(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Help_condition;
	information = DIA_STRF_8146_Hart_Help_info;
	permanent = FALSE;
	description = " Maybe I can help you with something? " ;
};

func int DIA_STRF_8146_Hart_Help_condition()
{
	if(Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_Escape) == TRUE)
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Help_info()
{
	AI_Output(other, self, " DIA_STRF_8146_Hart_Help_01_00 " );	// Maybe I can help you with something?
	AI_Output(self,other, " DIA_STRF_8146_Hart_Help_01_01 " );	// Hmmm...(thoughtfully) Well, I could use a new weapon.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Help_01_02 " );	// These orc axes are too heavy for a man like me.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Help_01_03 " );	// Of course, I learned how to use them, but I still prefer human weapons.
	AI_Output(other,self, " DIA_STRF_8146_Hart_Help_01_04 " );	// What kind of weapon do you need?
	AI_Output(self,other, " DIA_STRF_8146_Hart_Help_01_05 " );	// Eh... (nostalgically) If only you could bring me my old sword.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Help_01_06 " );	// Then I would show these creatures how people really know how to fight!
	AI_Output(other,self, " DIA_STRF_8146_Hart_Help_01_07 " );	// Where is your sword now?
	AI_Output(self,other, " DIA_STRF_8146_Hart_Help_01_08 " );	// I have no idea, mate...(sadly) I left my sword to the local blacksmith that day to have it sharpened well.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Help_01_10 " );	// And then it landed here! Therefore, what happened to my sword later, Beliar knows it.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Help_01_11 " );	// Maybe he's still in the castle, or maybe someone has had their eye on him for a long time.
	AI_Output(self,other, " DIA_STRF_8146_Hart_Help_01_12 " );	// The sword was really luxurious!
	MIS_HartSword = LOG_Running;
	Log_CreateTopic(TOPIC_HartSword,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_HartSword,LOG_Running);
	B_LogEntry(TOPIC_HartSword, " Hart fights in the arena with orc weapons, but he wouldn't mind getting his old sword. On the day he was lucky enough to be captured by the orcs, Hart left the sword to the local blacksmith in the castle to sharpen it. So he has no idea where that sword is now. " );
};

instance DIA_STRF_8146_Hart_HelpDone(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_HelpDone_condition;
	information = DIA_STRF_8146_Hart_HelpDone_info;
	permanent = FALSE;
	description = " Is this your sword? " ;
};

func int DIA_STRF_8146_Hart_HelpDone_condition()
{
	if((MIS_HartSword == LOG_Running) && (Npc_HasItems(hero,ItMw_HartSword) >= 1))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_HelpDone_info()
{
	B_GivePlayerXP(350);
	AI_Output(other,self, " DIA_STRF_8146_Hart_HelpDone_01_00 " );	// Is this your sword?
	B_GiveInvItems(other,self,ItMw_HartSword,1);
	AI_Output(self,other, " DIA_STRF_8146_Hart_HelpDone_01_01 " );	// I can't believe my eyes! Where did you dig it up?
	AI_Output(other,self, " DIA_STRF_8146_Hart_HelpDone_01_02 " );	// In the warehouse, in the old castle of the ore barons.
	AI_Output(other,self, " DIA_STRF_8146_Hart_HelpDone_01_03 " );	// Apparently, no one was interested in them there.
	AI_Output(self,other, " DIA_STRF_8146_Hart_HelpDone_01_04 " );	// Well, so much the better for me... (laughs)
	AI_UnequipWeapons(self);
	Npc_RemoveInvItems(self,ItMw_2H_OrcAxe_01,Npc_HasItems(self,ItMw_2H_OrcAxe_01));
	AI_EquipBestMeleeWeapon(self);
	AI_ReadyMeleeWeapon(self);
	AI_PlayAni(self,"T_1HSINSPECT");
	AI_Output(self,other, " DIA_STRF_8146_Hart_HelpDone_01_05 " );	// My old friend! Your hilt is in my hand again, as it was then.
	AI_RemoveWeapon(self);
	AI_Output(self,other, " DIA_STRF_8146_Hart_HelpDone_01_06 " );	// Thank you, mate! You have no idea how important this was to me.
	AI_Output(other,self, " DIA_STRF_8146_Hart_HelpDone_01_07 " );	// Well, glad to help.
	AI_Output(self,other, " DIA_STRF_8146_Hart_HelpDone_01_08 " );	// You know, I don't have anything to thank you for.
	AI_Output(self,other, " DIA_STRF_8146_Hart_HelpDone_01_09 " );	// So I'll show you my favorite technique to help you with a one-handed sword.
	AI_Output(self,other, " DIA_STRF_8146_Hart_HelpDone_01_10 " );	// Many have fallen for this trick, costing them their own lives! Well, how is it going?
	MIS_HartSword = LOG_Success;
	Log_SetTopicStatus(TOPIC_HartSword,LOG_Success);
	B_LogEntry(TOPIC_HartSword, " I brought Hart his sword. " );
	Info_ClearChoices(DIA_STRF_8146_Hart_HelpDone);
	Info_AddChoice(DIA_STRF_8146_Hart_HelpDone,"Договорились!",DIA_STRF_8146_Hart_HelpDone_Ok);
};

func void DIA_STRF_8146_Hart_HelpDone_Ok()
{
	var string concatText;

	AI_Output(other, self, " DIA_STRF_8146_Hart_HelpDone_Ok_01_00 " );	// Agreed!
	AI_Output(self,other, " DIA_STRF_8146_Hart_HelpDone_Ok_01_01 " );	// Good. Then listen carefully.
	AI_Output(self,other, " DIA_STRF_8146_Hart_HelpDone_Ok_01_02 " );	// When fighting with a sword, try to use your opponent's momentum.
	AI_Output(self,other, " DIA_STRF_8146_Hart_HelpDone_Ok_01_03 " );	// When he throws his next blow, don't forcefully block him.
	AI_Output(self,other, " DIA_STRF_8146_Hart_HelpDone_Ok_01_04 " );	// You smoothly dodge and instantly counterattack.
	AI_Output(self,other, " DIA_STRF_8146_Hart_HelpDone_Ok_01_05 " );	// Basically, you don't have to do anything! Your enemy will run into the edge of your blade.
	AI_Output(self,other, " DIA_STRF_8146_Hart_HelpDone_Ok_01_06 " );	// Well, remember?
	AI_Output(other,self, " DIA_STRF_8146_Hart_HelpDone_Ok_01_07 " );	// Yes, everything is very clear.
	B_RaiseFightTalent_Bonus(other,NPC_TALENT_1H,2);
	concatText = ConcatStrings(PRINT_Learn1H," + ");
	concatText = ConcatStrings(concatText,IntToString(2));
	concatText = ConcatStrings(concatText," (Навык: ");
	concatText = ConcatStrings(concatText,IntToString(hero.HitChance[NPC_TALENT_1H]));
	concatText = ConcatStrings(concatText,"%)");
	AI_Print(concatText);
	Snd_Play("Levelup");
};

instance DIA_STRF_8146_Hart_Fight(C_Info)
{
	npc = STRF_8146_Hart;
	condition = DIA_STRF_8146_Hart_Fight_condition;
	information = DIA_STRF_8146_Hart_Fight_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_STRF_8146_Hart_Fight_condition()
{
	if ((ArenaBattle_04 ==  TRUE ) && (ArenaBattle_04_Won ==  FALSE ) && (ArenaBattle_04_Lost ==  FALSE ) && (HartIsFight ==  FALSE ) && (Npc_GetDistToWP(hero, " ORC_CITY_ARENA_HERO " ) <  150 ) && (Npc_Get01, " ARTO_DistToWP_self " ) <  200 ))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Fight_info()
{
	Wld_SendTrigger( " EVT_ORCARENA_01 " );
	AI_ReadyMeleeWeapon(self);
	AI_Output(self,other, " DIA_STRF_8146_Hart_Fight_01_01 " );	// Well, buddy... (smiling) Show me now what you're capable of!
	HartIsFight = TRUE;
	AI_StopProcessInfos(self);
	B_Attack(self,other,AR_NONE,0);
};

var int HartTeach;

instance DIA_STRF_8146_Hart_Teach(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 2;
	condition = DIA_STRF_8146_Hart_Teach_condition;
	information = DIA_STRF_8146_Hart_Teach_info;
	permanent = TRUE;
	description = " Can you teach me something? " ;
};

func int DIA_STRF_8146_Hart_Teach_condition()
{
	if ((Npc_KnowsInfo(hero,DIA_STRF_8146_Hart_Arena) ==  TRUE ) && (HartTeach ==  FALSE ))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Teach_info()
{
	AI_Output(other,self, " DIA_STRF_8146_Hart_Teach_01_00 " );	// Can you teach me something?

	if((Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT) == FALSE) && (MIS_HartSword == LOG_Success) && (HeroIsMorDar == TRUE))
	{
		AI_Output(self,other, " DIA_ORG_833_Buster3_02_01 " );	// I can teach you body control. This art is called acrobatics.
		HartTeach = TRUE;
		Log_CreateTopic(Topic_OutTeacher,LOG_NOTE);
		B_LogEntry(Topic_OutTeacher, " Orc mercenary Hart can teach me acrobatics. " );
	}
	else
	{
		AI_Output(self,other, " DIA_STRF_8146_Hart_Teach_01_01 " );	// Sorry mate. But I don't have time for that at all.
		AI_Output(self,other, " DIA_STRF_8146_Hart_Teach_01_02 " );	// Fight with Turuk soon! And I need to be well prepared for it.
	};
};

instance DIA_STRF_8146_Hart_Acrobat(C_Info)
{
	npc = STRF_8146_Hart;
	nr = 10;
	condition = DIA_STRF_8146_Hart_Acrobat_Condition;
	information = DIA_STRF_8146_Hart_Acrobat_Info;
	permanent = TRUE;
	description = " Show me how to control my body properly. (Learning points: 10) " ;
};

func int DIA_STRF_8146_Hart_Acrobat_Condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_ACROBAT) == FALSE) && (HartTeach == TRUE))
	{
		return TRUE;
	};
};

func void DIA_STRF_8146_Hart_Acrobat_Info()
{
	AI_Output(other,self, " DIA_Cassia_Acrobat_15_00 " );	// Show me how to properly control your body.

	if(B_TeachThiefTalentFree(self,other,NPC_TALENT_ACROBAT))
	{
		AI_Output(self,other, " DIA_ORG_833_Buster3_02_02 " );	// When you control your body, you can jump much further.
		AI_Output(self,other, " DIA_ORG_833_Buster3_02_03 " );	// I'll teach you how to roll to the side, show you how to land after a fall. But do not forget that you are still not immortal!
		AI_Output(self,other, " DIA_ORG_833_Buster3_02_04 " );	// Acrobatics are also very useful in combat. You can quickly change the distance between yourself and the enemy. Well, with God!
	};
};
