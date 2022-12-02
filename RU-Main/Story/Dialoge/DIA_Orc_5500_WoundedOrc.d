

instance DIA_Orc_5500_WoundedOrc_EXIT(C_Info)
{
	npc = Orc_5500_WoundedOrc;
	condition = DIA_Orc_5500_WoundedOrc_exit_condition;
	information = DIA_Orc_5500_WoundedOrc_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int DIA_Orc_5500_WoundedOrc_exit_condition()
{
	return TRUE;
};

func void DIA_Orc_5500_WoundedOrc_exit_info()
{
	AI_StopProcessInfos(self);
};

instance DIA_Orc_5500_WoundedOrc_Hello(C_Info)
{
	npc = Orc_5500_WoundedOrc;
	condition = DIA_Orc_5500_WoundedOrc_Hello_condition;
	information = DIA_Orc_5500_WoundedOrc_Hello_info;
	important = TRUE;
	permanent = FALSE;
};

func int DIA_Orc_5500_WoundedOrc_Hello_condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (Kapitel <= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_5500_WoundedOrc_Hello_info()
{
	B_GivePlayerXP(100);
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Info_18_01 " );	// Argh!!! (breathing heavily) Another man come to kill me.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Info_18_02 " );	// Yes, I usually do that! It's not often you see an orc speaking a human language, though.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Info_18_03 " );	// I'll listen to you, but I warn you: one wrong move and I'll blow your head off, orc!
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Info_18_04 " );	// And now answer - who are you and what are you doing here?
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Info_18_05 " );	// My name is Ur-Karras, but I don't think that would tell you much about me.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Info_18_06 " );	// Yes, I haven't heard this name before. But judging by your armor, you're no ordinary orc.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Info_18_07 " );	// You are most likely one of the orc warlords. Where is your team then?
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Info_18_08 " );	// Everyone be killed, everyone be dead! Only I will be left alone to live, but to be seriously injured and not be able to go back to the valley.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Info_18_09 " );	// Were they killed by the paladins?
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Info_18_10 " );	// No, we don't fight paladins...(wheezing) My squad is too small to attack them.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Info_18_11 " );	// If not them, then who? And what, then, did you do in Khorinis?
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Info_18_12 " );	// I can't tell this man.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Info_18_13 " );	// If you don't tell me, I'll kill you right now!
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Info_18_14 " );	// If a person wants to kill him, then let him not play for time. (overcoming the pain) Ur-Karras does not fear death.
	Info_ClearChoices(DIA_Orc_5500_WoundedOrc_Hello);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_Hello, " Your words are worthy of respect, Ur-Karras. " ,DIA_Orc_5500_WoundedOrc_Hello_Mercy);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_Hello, " Well, you chose your own destiny, Orc! " ,DIA_Orc_5500_WoundedOrc_Hello_Kill);
};


func void DIA_Orc_5500_WoundedOrc_Hello_Mercy()
{
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_18_01 " );	// Your words are worthy of respect, Ur-Karras. Maybe I'll let you live.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_18_02 " );	// But you must swear to me that you will immediately leave Khorinis! The next time we meet, I won't hesitate to slit your throat.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_18_03 " );	// A person may not try. As I have already said, Ur-Karras is seriously wounded and cannot return to his brothers.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_18_04 " );	// You can kill me now... (breathing heavily) Time won't change anything.
	Info_ClearChoices(DIA_Orc_5500_WoundedOrc_Hello);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_Hello, " As said, I won't do this. " ,DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_Hello, " You leave me no choice Orc. " ,DIA_Orc_5500_WoundedOrc_Hello_Kill_Two);
};

func void DIA_Orc_5500_WoundedOrc_Hello_Kill()
{
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Kill_18_01 " );	// Well, you chose your own fate, orc!
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Kill_18_02 " );	// Now I'll finish you off, and there'll be one less vile creature.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Kill_18_03");	//Аргххх!!!
	AI_StopProcessInfos(self);
	self.guild = GIL_ORC;
};

func void DIA_Orc_5500_WoundedOrc_Hello_Kill_Two()
{
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Kill_Two_18_01 " );	// You leave me no choice, orc. Prepare to die.
	AI_Output(self,other,"DIA_Orc_5500_WoundedOrc_Hello_Kill_Two_18_02");	//Аргххх!!!
	AI_StopProcessInfos(self);
	self.guild = GIL_ORC;
};

func void DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two()
{
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_01 " );	// I won't do this.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_02 " );	// But I can't let you stay in Khorinis either. And what am I to do with you?
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_03 " );	// Ur-Karras cannot know this.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_04 " );	// Hmmm. Let me at least look at your wound.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_05 " );	// Rrrrr...(wheezing) Okay, look, man.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_06 " );	// Yes, the wound is serious. Looks like you've been bitten by some horrible creature.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_07 " );	// Is there any way to help you heal?
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_08 " );	// Ur-Karras to think that only his brothers - the spirit-speakers - could help him. But they be far away in the valley...
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_09 " );	// What are spirit talkers?
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_10 " );	// Be a great orc mage. People usually call them shamans.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_11 " );	// But you can't just walk up to your shamans.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_12 " );	// They'd rather turn me into a burning firebrand than listen to me.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_13 " );	// Then the only thing left for a man to do is to leave Ur-Karras here to die... (wheezing) And leave yourself.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_14 " );	// No. For that matter, I won't leave you.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_15 " );	// I seem to be getting into the habit of helping wounded orcs.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_17 " );	// Arghhh...(surprised) Ur-Karras be surprised that a human is trying to help him.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_18 " );	// Usually before all the people only want to kill him!
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_19 " );	// Okay, sit here and try not to die until I get back.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_20 " );	// I'm not very happy about the prospect of wasting my time on you.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_21 " );	// Ur-Karras to have some Orc healing potions to keep from being dead just yet. But they won't last long.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_Hello_Mercy_Two_18_22 " );	// Then let's not waste time talking. I'll be back soon.
	MIS_Orcwayhero = LOG_Running;
	Log_CreateTopic(TOPIC_Orcwayhero,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Orcwayhero,LOG_Running);
	B_LogEntry(TOPIC_Orcwayhero,"Not far from Khorinis, I came across a wounded orc named Ur-Karras. He led a small detachment that arrived from the Valley on an important mission, which he refused to talk about even under threat of death. He alone survived from the detachment, but serious wounds I decided to help an orc who speaks the language of men. The healing magic of the shamans could help, but where in Khorinis can I find an orc shaman who would agree to talk to me? I will have to think of something myself to help Ur-Karras. Time is short, we must act quickly.");
	AI_StopProcessInfos(self);
	self.name[ 0 ] = " Ur-Karras " ;
};


instance DIA_Orc_5500_WoundedOrc_HaveCure(C_Info)
{
	npc = Orc_5500_WoundedOrc;
	condition = DIA_Orc_5500_WoundedOrc_HaveCure_condition;
	information = DIA_Orc_5500_WoundedOrc_HaveCure_info;
	important = FALSE;
	permanent = FALSE;
	description = " I found a remedy to get you back on your feet. " ;
};


func int DIA_Orc_5500_WoundedOrc_HaveCure_condition()
{
	if((MIS_Orcwayhero == LOG_Running) && (Npc_HasItems(other,ItSc_OrcHeal) >= 1))
	{
		return TRUE;
	};
};

func void DIA_Orc_5500_WoundedOrc_HaveCure_info()
{
	B_GivePlayerXP(250);	
	Npc_RemoveInvItems(other,ItSc_OrcHeal,1);
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_HaveCure_18_01 " );	// I found a remedy to get you back on your feet.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_HaveCure_18_02 " );	// I hope the man is right... (wheezing and spitting blood) Ur-Karras feels like dying soon...
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_HaveCure_18_03 " );	// Not so fast, orc. I think this will help you.
	B_HeroUseFakeScroll();
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_HaveCure_18_04 " );	// Arghh... What's a human to do with Ur-Karras?!
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_HaveCure_18_05 " );	// Calm down! It's just healing magic.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_HaveCure_18_06 " );	// And it seems that your wounds have begun to slowly heal.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_HaveCure_18_07 " );	// Don't believe your eyes! A human being able to cure Ur-Karras.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_HaveCure_18_08 " );	// Ur-Karras can feel his strength begin to return to him. He think that his death to retreat before the magic of man.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_HaveCure_18_09 " );	// Well, wait a little more...
	B_HeroUseFakeScroll();
	AI_PlayAni(other,"T_PRACTICEMAGIC5");
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_HaveCure_18_10 " );	// Well, how? I think you should feel completely healthy now.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_HaveCure_18_11 " );	// Ur-Karras feel completely healthy! (admiringly) The man must be a great shaman who could heal Ur-Karras!
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_HaveCure_18_12 " );	// If you want, you can count that way.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_HaveCure_18_13 " );	// Ur-Karras thanking the man...(respectfully) He never said that to the people, but he is now a very respectful man.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_HaveCure_18_14 " );	// Hey, leave your compliments! Now that you are back on your feet, you can leave Khorinis.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_HaveCure_18_15 " );	// And it's better if you do it as soon as possible.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_HaveCure_18_16 " );	// The man helped Ur-Karras, and he can now go to his brothers in the valley.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_HaveCure_18_17 " );	// Ur-Karras only wait until dark to go to them.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_HaveCure_18_18 " );	// Okay, I believe you, orc. And I hope we never meet again.
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_HaveCure_18_19 " );	// Sometimes things don't go so smoothly.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_HaveCure_18_20 " );	// This Ur-Karras cannot be promised by a man. But he will not forget his help, now a man for him to become a brother!
	AI_PlayAni(self,"T_GREETGRD");
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_HaveCure_18_21 " );	// Ur-Karras swear a man to this. And now Ur-Karras say farewell, great shaman!
	AI_Output(other,self, " DIA_Orc_5500_WoundedOrc_HaveCure_18_22 " );	// Of course... hmm... bro.
	MIS_Orcwayhero = LOG_SUCCESS;
	Log_SetTopicStatus(Topic_Orcwayhero,LOG_SUCCESS);
	B_LogEntry(Topic_Orcwayhero, " I helped Ur-Karras and healed his wounds. Now he can return back to the Vale. In turn, Ur-Karras promised not to forget that I helped him avoid certain death, and from that moment he began to call me his ... brother. Strange, after all, these orcs are creatures. " );
	Info_ClearChoices(DIA_Orc_5500_WoundedOrc_HaveCure);
	Info_AddChoice(DIA_Orc_5500_WoundedOrc_HaveCure,Dialog_Ende,DIA_Orc_5500_WoundedOrc_HaveCure_Quit);
};

func void DIA_Orc_5500_WoundedOrc_HaveCure_Quit()
{
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"TOT");
	self.attribute[ATR_STRENGTH] = 300;
	self.attribute[ATR_DEXTERITY] = 300;
	self.attribute[ATR_HITPOINTS_MAX] = 3000;
	self.attribute[ATR_HITPOINTS] = 3000;
	self.attribute[ATR_MANA_MAX] = 10;
	self.attribute[ATR_MANA] = 10;
	self.protection[PROT_BLUNT] = 300;
	self.protection[PROT_EDGE] = 300;
	self.protection[PROT_POINT] = 300;
	self.protection[PROT_FIRE] = 100;
	self.protection[PROT_FLY] = 100;
	self.protection[PROT_MAGIC] = 100;
	self.HitChance[NPC_TALENT_1H] = 100;
	self.HitChance[NPC_TALENT_2H] = 100;
	self.HitChance[NPC_TALENT_BOW] = 100;
	self.HitChance[NPC_TALENT_CROSSBOW] = 100;
	CreateInvItems(self,ItMw_2H_OrcSword_02,1);
	AI_EquipBestMeleeWeapon(self);
};

instance DIA_Orc_5500_WoundedOrc_Buy(C_Info)
{
	npc = Orc_5500_WoundedOrc;
	condition = DIA_Orc_5500_WoundedOrc_Buy_condition;
	information = DIA_Orc_5500_WoundedOrc_Buy_info;
	important = TRUE;
	permanent = TRUE;
};

func int DIA_Orc_5500_WoundedOrc_Buy_condition()
{
	if((Npc_IsInState(self,ZS_Talk)) && (MIS_Orcwayhero == LOG_SUCCESS))
	{
		return TRUE;
	};
};

func void DIA_Orc_5500_WoundedOrc_Buy_info()
{
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Buy_Info_18_01 " );	// Ur-Karras go to his brothers, as promised brother man.
	AI_Output(self,other, " DIA_Orc_5500_WoundedOrc_Buy_Info_18_02 " );	// He needn't worry!
	AI_StopProcessInfos(self);
};
