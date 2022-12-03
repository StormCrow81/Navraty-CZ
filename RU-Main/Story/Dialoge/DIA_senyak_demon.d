

instance DIA_SENYAK_DEMON_EXIT (C_Info)
{
	npc = senyak_demon;
	nr = 999;
	condition = dia_senyak_demon_exit_condition;
	information = dia_senyak_demon_exit_info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int day_senyak_demon_exit_condition()
{
	if(SHEMRON_TALK == TRUE)
	{
		return TRUE;
	};
};

func void day_senyak_demon_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SENYAK_DEMON_HELLO (C_Info)
{
	npc = senyak_demon;
	nr = 1;
	condition = dia_senyak_demon_hello_condition;
	information = dia_senyak_demon_hello_info;
	important = TRUE;
};


func int day_senyak_demon_hello_condition()
{
	return TRUE;
};

func void day_senyak_demon_hello_info()
{
	Snd_Play("MFX_FEAR_CAST");
	Npc_RemoveInvItems(self,ITMI_DRAGONGOLDGORN,1);
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_00 " );	// ...(growls) WHO DARES TO DISTURB MY PRIVACY?!!!
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_01 " );	// ( peering intently ) Pitiful human, is it really you who dared to do this ?!
	AI_Output(other,self, " DIA_Senyak_Demon_Hello_01_02 " );	// Yes, I called you!
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_03 " );	// WHY DID YOU DO THIS?!
	AI_Output(other,self, " DIA_Senyak_Demon_Hello_01_04 " );	// Can't you guess, demon?!
	AI_Output(other,self, " DIA_Senyak_Demon_Hello_01_05 " );	// I have summoned you here to kill you and thereby end the horror you are about to plunge this world into...
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_06 " );	// ...(laughs) DID YOU DECIDE TO CHALLENGE ME?!!!
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_07 " );	// Arghhh...(growls) You must be very stupid if you think you can do it!
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_08 " );	// DO YOU KNOW - WHO AM I?!
	AI_Output(other,self, " DIA_Senyak_Demon_Hello_01_09 " );	// I know. You don't have to bother introducing yourself, S'anyak!
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_10 " );	//Arghhh...(growls ) If you know my name, then what you've done is even more proof that you clearly don't realize who's in front of you right now!
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_11 " );	// Challenge ME... the immortal creature of Beliar's divine darkness and the most powerful of his demons... (growls)
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_12 " );	// This is tantamount to suicide! How reckless of you to expect success in this matter.
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_13 " );	// Perhaps even you now realize that the last moments of your life are already numbered...

	if((Npc_HasItems(other,itru_beliarsrune01) == TRUE) || (Npc_HasItems(other,itru_beliarsrune02) == TRUE) || (Npc_HasItems(other,itru_beliarsrune03) == TRUE) || (Npc_HasItems(other,itru_beliarsrune04) == TRUE) || (Npc_HasItems(other,itru_beliarsrune05) == TRUE) || (Npc_HasItems(other,itru_beliarsrune06) == TRUE) || Npc_HasItems(hero,ItMw_BeliarWeapon_Raven) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_1H_20) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_01) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_02) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_03) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_04) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_05) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_06) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_07) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_08) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_09) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_10) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_11) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_12) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_13) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_14) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_15) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_16) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_17) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_18) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_19) || Npc_HasItems(hero,ItMw_BeliarWeapon_2H_20))
	{
		AI_Output(self,other,"DIA_Senyak_Demon_Hello_01_14");	//...(рычит)!!!
		AI_Output(other,self,"DIA_Senyak_Demon_Hello_01_15");	//Что?
		AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_16 " );	// ....(carefully peering) I felt that you have one thing with you that rightfully belongs to me!
		AI_Output(other,self, " DIA_Senyak_Demon_Hello_01_17 " );	// If you're talking about the Claw of Beliar, then you're wrong - now it's my thing!
		AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_18 " );	// MY CLAW!!! He and I are one, he is my second essence, my essence!
		AI_Output(other,self, " DIA_Senyak_Demon_Hello_01_19 " );	// Well, so much the worse for you. Now you won't be able to see him!
		AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_20 " );	// It won't be long! When I rip your heart out of your chest and take your soul, he will be mine again!
		AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_21 " );	// Arghhh...(growls) Stupid mortal! I need to thank you for this gift.
	}
	else
	{
		AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_22 " );	//Arghhh...(growls ) I can easily rip your heart out of your chest and take your soul!
	};
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_23 " );	// Don't be afraid! Death will seem to you not as painful and scary as you can imagine.
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_24 " );	// You won't even realize that you're already dead!
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_01_25 " );	// You can even consider that it has already happened! Arghhh... (growls)
	Info_ClearChoices(dia_senyak_demon_hello);
	Info_AddChoice(dia_senyak_demon_hello, " Stop talking! Time to get down to business... " ,dia_senyak_demon_hello_ok);

	if(MoraUlartuIsOn[1] == TRUE)
	{
		Info_AddChoice(dia_senyak_demon_hello, " (use Mora Ulartu) " ,dia_senyak_demon_hello_mora);
	};
};

func void day_senyak_demon_hello_ok()
{
	Snd_Play("MYSTERY_04");
	AI_Output(other,self, " DIA_Senyak_Demon_Hello_Ok_01_00 " );	// Stop talking! It's time to get down to business...
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_Ok_01_01 " );	// You're in such a hurry to die - well, that's your right, mortal.
	AI_Output(other,self, " DIA_Senyak_Demon_Hello_Ok_01_02 " );	// We'll see about that!
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Ok_01_03");	//Аргххх...(рычит)
	TALKSENYAK = TRUE;
	self.start_aistate = ZS_MM_AllScheduler;
	AI_StopProcessInfos(self);
};

func void day_senyak_demon_hello_mora()
{
	AI_PlayAni(other,"T_PRACTICEMAGIC2");
	Wld_PlayEffect("spellFX_Innoseye",self,self,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_LIGHTSTAR_RED",self,self,0,0,0,FALSE);
	Snd_Play("DEM_Warn");
	AI_TurnToNPC(other,self);
	AI_Output(self,other,"DIA_Senyak_Demon_Hello_Mora_01_00");	//Аргххх...(рычит)
	AI_Output(other,self, " DIA_Senyak_Demon_Hello_Mora_01_01 " );	// And how do you like it, demon!
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_Mora_01_02 " );	// ...(growls) I underestimated you! And I think I can guess what you're up to, you pathetic worm!
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_Mora_01_03 " );	// But you still can't defeat me, just like you can't get my soul!
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_Mora_01_04 " );	// Plus, you won't need it when you're dead! Arghhh... (growls)
	AI_Output(self,other, " DIA_Senyak_Demon_Hello_Mora_01_05 " );	// Mora Ulartu won't help you!
	USEMORAULARTU = TRUE;
};

