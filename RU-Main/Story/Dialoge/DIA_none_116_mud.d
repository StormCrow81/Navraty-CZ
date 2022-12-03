

instance NONE_116_MUD_EXIT(C_Info)
{
	npc = none_116_mud;
	nr = 999;
	condition = none_116_mud_exit_condition;
	information = none_116_mud_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int none_116_mud_exit_condition()
{
	return TRUE;
};

func void none_116_mud_exit_info()
{
	AI_StopProcessInfos(self);
};


instance NONE_116_MUD_HALLO(C_Info)
{
	npc = none_116_mud;
	condition = none_116_mud_hallo_condition;
	information = none_116_mud_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int none_116_mud_hallo_condition()
{
	return TRUE;
};

func void none_116_mud_hallo_info()
{
	AI_Output(self,other, " NONE_116_Mud_Hallo_Info_01_00 " );	// Hey, who are you? And where?
	AI_Output(self,other, " NONE_116_Mud_Hallo_Info_01_01 " );	// But wait... I know you! Well, of course...
	AI_Output(self,other, " NONE_116_Mud_Hallo_Info_01_02 " );	// You're the newbie who killed Gomez himself!
	AI_Output(self,other, " NONE_116_Mud_Hallo_Info_01_03 " );	// Oh, man, how glad I am for this meeting!
	Info_ClearChoices(none_116_mud_hallo);
	Info_AddChoice(none_116_mud_hallo, " I see you haven't changed a bit, Mud. " ,none_116_mud_hallo_mud);
	Info_AddChoice(none_116_mud_hallo, " Sorry, but my memory is messed up. " ,none_116_mud_hallo_who);
};

func void none_116_mud_hallo_mud()
{
	B_GivePlayerXP(50);
	AI_Output(other,self, " NONE_116_Mud_Hallo_Mud_01_01 " );	// And, as I see it, you haven't changed a bit, Mad. You are also talking non-stop!
	AI_Output(other,self, " NONE_116_Mud_Hallo_Mud_01_02 " );	// True, it began to look ... a little different than before.
	AI_Output(self,other, " NONE_116_Mud_Hallo_Mud_01_03 " );	// You remembered me! What happiness! My old friend!
	AI_Output(self,other, " NONE_116_Mud_Hallo_Mud_01_04 " );	// Do you remember how we met in the Old Camp?
	AI_Output(self,other, " NONE_116_Mud_Hallo_Mud_01_06 " );	// That was the time, eh! By the way, what are you doing here?
	AI_Output(self,other, " NONE_116_Mud_Hallo_Mud_01_07 " );	// Well, what's the difference - now you're next to me again, and I've even stopped being a little afraid...
	AI_Output(other,self, " NONE_116_Mud_Hallo_Mud_01_08 " );	// Shut up, Mud! Otherwise, I'll beat you now - like in the good old days.
	AI_Output(self,other, " NONE_116_Mud_Hallo_Mud_01_09 " );	// Okay, okay... As you say, I'm already silent. You see, I am silent.
	AI_Output(self,other, " NONE_116_Mud_Hallo_Mud_01_10 " );	// Although, if I keep silent, how can I talk to you?
	Info_ClearChoices(none_116_mud_hallo);
};

func void none_116_mud_hallo_who()
{
	AI_Output(other,self, " NONE_116_Mud_Hallo_Who_01_01 " );	// Sorry, but I don't remember you.
	AI_Output(self,other, " NONE_116_Mud_Hallo_Who_01_02 " );	// How?! Do you remember an old friend? Do you remember Mad?
	AI_Output(self,other, " NONE_116_Mud_Hallo_Who_01_04 " );	// You and I were friends!
	AI_Output(self,other, " NONE_116_Mud_Hallo_Who_01_05 " );	// You were my only friend in the Old Camp, even though everyone else thought I was a jerk.
	AI_Output(self,other, " NONE_116_Mud_Hallo_Who_01_06 " );	// But they were wrong. Especially when they found out that I have a friend like you!
	AI_Output(self,other, " NONE_116_Mud_Hallo_Who_01_07 " );	// It's good to have friends. Do you have friends?
	AI_Output(self,other, " NONE_116_Mud_Hallo_Who_01_08 " );	// Well, you definitely have one - it's me.
	AI_Output(other,self, " NONE_116_Mud_Hallo_Who_01_09 " );	// I think you talk too much.
	AI_Output(self,other, " NONE_116_Mud_Hallo_Who_01_10 " );	// What's surprising about that? It's always nice to chat with an old friend.
	AI_Output(self,other, " NONE_116_Mud_Hallo_Who_01_11 " );	// Don't you think so, huh?
	AI_Output(other,self, " NONE_116_Mud_Hallo_Who_01_12 " );	// I think you should learn to keep your mouth shut at least once in a while.
	AI_Output(self,other, " NONE_116_Mud_Hallo_Who_01_14 " );	// Okay, whatever you say. I can keep quiet.
	Info_ClearChoices(none_116_mud_hallo);
};


instance NONE_116_MUD_FACE(C_Info)
{
	npc = none_116_mud;
	nr = 1;
	condition = none_116_mud_face_condition;
	information = none_116_mud_face_info;
	permanent = FALSE;
	description = " What happened to you? " ;
};


func int none_116_mud_face_condition()
{
	if(Npc_KnowsInfo(hero,none_116_mud_hallo))
	{
		return TRUE;
	};
};

func void none_116_mud_face_info()
{
	AI_Output(other,self, " NONE_116_Mud_Face_Info_01_01 " );	// What happened to you?
	AI_Output(self,other, " NONE_116_Mud_Face_Info_01_02 " );	// Do you mean my face?
	AI_Output(other,self, " NONE_116_Mud_Face_Info_01_03 " );	// Yes. That's exactly what I mean. Who spoiled you like that?
	AI_Output(self,other, " NONE_116_Mud_Face_Info_01_04 " );	// Eh... One vile creature tried.
	AI_Output(self,other, " NONE_116_Mud_Face_Info_01_05 " );	// Although I have to thank my fate that I survived at all!
	AI_Output(self,other, " NONE_116_Mud_Face_Info_01_09 " );	// Never met here before!
	AI_Output(self,other, " NONE_116_Mud_Face_Info_01_10 " );	// A bit like a snapper, but even more terrible and ferocious.
	AI_Output(other,self, " NONE_116_Mud_Face_Info_01_12 " );	// How did you get here?
	AI_Output(self,other, " NONE_116_Mud_Face_Info_01_14 " );	// After the barrier collapsed, I thought about heading back to Khorinis.
	AI_Output(self,other, " NONE_116_Mud_Face_Info_01_15 " );	// But on the way to the passage, I accidentally stumbled upon a squad of orcs.
	AI_Output(self,other, " NONE_116_Mud_Face_Info_01_18 " );	// Apparently, these green-skinned creatures decided that I would look good in their bowler hat. Well, come after me!
	AI_Output(self,other, " NONE_116_Mud_Face_Info_01_19 " );	// As I remember now - I ran then, with all my strength, without really understanding where exactly.
	AI_Output(self,other, " NONE_116_Mud_Face_Info_01_21 " );	// And when I noticed that the orcs fell behind, - looking around, I realized that I was lost.
	AI_Output(other,self, " NONE_116_Mud_Face_Info_01_25 " );	// So you haven't tried the passage again?
	AI_Output(self,other, " NONE_116_Mud_Face_Info_01_26 " );	// No. I'm in the valley more than a foot!
	AI_Output(self,other, " NONE_116_Mud_Face_Info_01_27 " );	// Just stick your head in there and you'll be eaten alive right away. So it's better here.
	AI_Output(self,other, " NONE_116_Mud_Face_Info_01_28 " );	// By the way, I'll tell you the truth, this place is pretty good.
	AI_Output(self,other, " NONE_116_Mud_Face_Info_01_30 " );	// And the orcs don't roam here - their camp is up there in the mountains.
};


instance NONE_116_MUD_CRATES(C_Info)
{
	npc = none_116_mud;
	nr = 1;
	condition = none_116_mud_crates_condition;
	information = none_116_mud_crates_info;
	permanent = FALSE;
	description = " What are these boxes? " ;
};


func int none_116_mud_crates_condition()
{
	if ( Npc_KnowsInfo ( hero , none_116_mud_hallo ) && ( Capital <  5 )) .
	{
		return TRUE;
	};
};

func void none_116_mud_crates_info()
{
	AI_Output(other,self, " NONE_116_Mud_Crates_Info_01_00 " );	// What are these boxes?
	AI_Output(self,other, " NONE_116_Mud_Crates_Info_01_01 " );	// These are crates of magical ore.
	AI_Output(other,self, " NONE_116_Mud_Crates_Info_01_02 " );	// With ore? Where did they come from?
	AI_Output(self,other, " NONE_116_Mud_Crates_Info_01_03 " );	// They were here before I even settled here.
	AI_Output(self,other, " NONE_116_Mud_Crates_Info_01_06 " );	// There are at least twenty of them!
	AI_Output(other,self, " NONE_116_Mud_Crates_Info_01_07 " );	// Hmmm... Then I think we should report this to the paladins. Garond will be very surprised.
	AI_Output(self,other, " NONE_116_Mud_Crates_Info_01_08 " );	// Paladins? Which paladins?
	AI_Output(other,self, " NONE_116_Mud_Crates_Info_01_09 " );	// Yeah, looks like you're way behind the times.
	AI_Output(self,other, " NONE_116_Mud_Crates_Info_01_10 " );	// Ha! Why be surprised? You are the first person I have met in the last few weeks.
	AI_Output(self,other, " NONE_116_Mud_Crates_Info_01_11 " );	// What did you say about paladins?
	AI_Output(other,self, " NONE_116_Mud_Crates_Info_01_12 " );	// Recently, a small band of paladins of the king came to the valley, and settled in the old castle of the barons.
	AI_Output(other,self, " NONE_116_Mud_Crates_Info_01_16 " );	// At the moment the castle is under siege by orcs, so getting there is quite difficult.
	AI_Output(other,self, " NONE_116_Mud_Crates_Info_01_17 " );	// And the exit from the valley is also blocked by these green-skinned creatures. So only a few managed to get out of the valley.
	AI_Output(self,other, " NONE_116_Mud_Crates_Info_01_18 " );	// Damn! Oh those orcs!
	AI_Output(self,other, " NONE_116_Mud_Crates_Info_01_20 " );	// And now what?
	AI_Output(other,self, " NONE_116_Mud_Crates_Info_01_21 " );	// We need to go to the castle and tell the paladins about these magical ore deposits.
	AI_Output(self,other, " NONE_116_Mud_Crates_Info_01_24 " );	// Listen, uh... could you take me with you if you go to this castle?
	AI_Output(self,other, " NONE_116_Mud_Crates_Info_01_26 " );	// I'm sure I can't get in there alone, but with you I have at least some chance.
	AI_Output(other,self, " NONE_116_Mud_Crates_Info_01_29 " );	// Sorry, but this is too dangerous.
	AI_Output(other,self, " NONE_116_Mud_Crates_Info_01_31 " );	// And as far as I remember, you were never a good fighter.
	AI_Output(self,other, " NONE_116_Mud_Crates_Info_01_32 " );	// Well, yes, I understand. Okay, I'll sit here for now.
	AI_Output(other,self, " NONE_116_Mud_Crates_Info_01_34 " );	// Don't worry, I'll try to get reinforcements.
	MIS_MADERZ = LOG_Running;
	Log_CreateTopic(TOPIC_MADERZ,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_MADERZ,LOG_Running);
	B_LogEntry( TOPIC_MADERZ , " At the place where Mud settled, I discovered a large amount of magic ore. I need to urgently get to the castle and report this to Garond. This news should please him. " );
	Log_AddEntry( TOPIC_MADERZ , " I decided not to take Mad with me to the castle, but I promised him that I would try to persuade Garond to send him help. " );
};


instance NONE_116_MUD_PERM(C_Info)
{
	npc = none_116_mud;
	nr = 1;
	condition = none_116_mud_perm_condition;
	information = none_116_mud_perm_info;
	permanent = TRUE;
	description = " How are you, Mud? " ;
};


func int none_116_mud_perm_condition()
{
	if(Npc_KnowsInfo(hero,none_116_mud_face))
	{
		return TRUE;
	};
};

func void none_116_mud_perm_info()
{
	AI_Output(other,self, " NONE_116_Mud_Perm_01_00 " );	// How are you, Mad?
	if(MIS_MADERZ == LOG_SUCCESS)
	{
		AI_Output(self,other, " NONE_116_Mud_Perm_01_01 " );	// Could be better. I don't like all this.
		AI_Output(self,other, " NONE_116_Mud_Perm_01_02 " );	// The only thing that calms me down is these guys in armor.
	}
	else
	{
		AI_Output(self,other, " NONE_116_Mud_Perm_01_06 " );	// How-how... No way!
		AI_Output(self,other, " NONE_116_Mud_Perm_01_07 " );	// Look around, and you will understand everything - there is only hopelessness around!
		AI_Output(self,other, " NONE_116_Mud_Perm_01_08 " );	// Eh... And when it all ends.
	};
};


instance NONE_116_MUD_NOTINCASTLE(C_Info)
{
	npc = none_116_mud;
	nr = 1;
	condition = none_116_mud_notincastle_condition;
	information = none_116_mud_notincastle_info;
	permanent = FALSE;
	description = " Aren't you so scared now? " ;
};


func int none_116_mud_notincastle_condition()
{
	if(MIS_MADERZ == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func void none_116_mud_notincastle_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " NONE_116_Mud_NotInCastle_01_00 " );	// Are you not so scared now?
	AI_Output(self,other, " NONE_116_Mud_NotInCastle_01_02 " );	// These guys make me feel completely safe.
	AI_Output(self,other, " NONE_116_Mud_NotInCastle_01_04 " );	// Thank you friend!
};

