

instance DIA_ORC_8564_VANHAN_EXIT(C_Info)
{
	npc = orc_8564_old;
	condition = dia_orc_8564_vanhan_exit_condition;
	information = dia_orc_8564_vanhan_exit_info;
	important = FALSE;
	permanent = TRUE;
	nr = 999;
	description = Dialog_Ende;
};


func int dia_orc_8564_vanhan_exit_condition()
{
	return TRUE;
};

func void dia_orc_8564_vanhan_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8564_OLD_HELLO (C_Info)
{
	npc = orc_8564_old;
	nr = 1;
	condition = dia_orc_8564_vanhan_hello_condition;
	information = dia_orc_8564_old_hello_info;
	important = TRUE;
	permanent = FALSE;
};


func int dia_orc_8564_vanhan_hello_condition()
{
	if((FIRSTVANHAN == FALSE) && (BLKDRAGNISDEAD == FALSE))
	{
		return TRUE;
	};
};

func void dia_orc_8564_old_hello_info()
{
	var C_Item heroweapon;
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_01 " );	// UCHA-CHA... FATGAR!
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_02 " );	// NOR KHATAG BAR KER DARAN!
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_03 " );	// I don't understand... What are you talking about?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_04 " );	// BER TOGAN URHAN BOGOTH! Why should a mortal disturb Ur-Khan, why come here?
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_05 " );	// (to himself) So Emnol was right - they really are all ghosts!
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_06 " );	// I came to talk to the orcs - I have questions.
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_07 " );	// NOKAN BADAR! Why did the man decide that the orcs would listen to the man?
	if(Npc_HasItems(hero,itmw_2h_orcprestige) >= 1)
	{
		heroweapon = Npc_GetEquippedMeleeWeapon(hero);
		if(Hlp_IsItem(heroweapon,itmw_2h_orcprestige) == TRUE)
		{
			AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_08 " );	// Here's why.
			AI_ReadyMeleeWeapon(other);
			AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_09 " );	// Mmm...(surprised) Ur-Khan remember what it is. Seeing a man wearing Ulu-Mulu. Be a great warrior, suppose.
			AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_10 " );	// How does a mortal know about Ulu-Mulu? How does a person know that he will not die if he comes here?
			AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_11 " );	// One orc made it for me and told me what this talisman means.
			AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_12 " );	// So you can't get away, orc!
			AI_RemoveWeapon(other);
		}
		else
		{
			AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_51 " );	// Since you spoke to me, then you will listen to me!
			AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_52 " );	// QUAGAD JABAR! Okay, man. Say what you want to say.
		};
	}
	else
	{
		AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_53 " );	// Since you spoke to me, then you will listen to me!
		AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_54 " );	// QUAGAD JABAR! Okay, man. Say what you want to say.
	};
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_12A " );	// So your name is Ur-Khan. Who were you?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_13 " );	// Be once a great son of spirit many winters ago. People call shaman...
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_14 " );	// Why are you all ghosts now?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_15 " );	// Evil demon kill everyone, curse everyone... take the spirit.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_16 " );	// Do you mean soul?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_17 " );	// Ur-Khan believe so.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_18 " );	// And what kind of demon was this?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_19 " );	// KRAKTAR TEKAN...
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_20 " );	// And what does that mean?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_21 " );	// People say - Great Shadow, be the one who curses everyone...
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_22 " );	// Great Shadow?! I already heard about it...
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_23 " );	// Didn't this creature look like a big black dragon called Azgalor by any chance?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_24 " );	// MOLE BUTUR ORPHAG! Ur-Khan believe so... KRAKTAR TEKAN AZGALOR!
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_25 " );	// Now everything is clear. But how did Azgalor get into this world?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_26 " );	// Ur-Khan and brothers call the demon. To think the demon to help the brothers is to make them strong.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_27 " );	// How predictable orcs are! Apparently, the story of the Sleeper hasn't taught you anything!
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_28 " );	// Who be Sleeper?!
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_29 " );	// Orcish - KRUSHAK! He's kind of like your Azgalor... also an evil demon.
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_30 " );	// Ur-Khan don't know KRUSHAK... But thinking is a bad demon if you kill brothers.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_31 " );	// Tell me, how did you manage to summon Azgalor to the valley?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_32 " );	// Brothers to look for an ancient artifact, called DAH BAR FATGAR... Find and conjure a demon to come.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_33 " );	// DAH BAR FATGAR is, apparently, the Eye of Wrath...
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_34 " );	// To believe that this is how people are called... Ur-Khan to see that a person knows a lot. Ur-Khan wonder at this!
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_35 " );	// Nothing surprising - I heard about one legend, which just spoke of the Great Shadow, and the Eye of Wrath, and what all this could lead to ...
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_37 " );	// Okay, tell me, where is this Azgalor now? Where can I find it?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_38 " );	// Ur-Khan not to know. The demon hasn't been here for a long time. Not to be since then how to curse...
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_39 " );	// And why would a person look for an evil demon?
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_40 " );	// I want to rid this world of this monster once and for all.
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_41 " );	// A human wants to kill a demon?! HROTOK JABAR!
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_42 " );	// Man think he's a great warrior. But a person will die if you do so. The demon is very strong, more than a human think.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_43 " );	// Well, we'll see about that! So do you know how I can find Azgalore?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_44 " );	// Ur-Khan doesn't know this...
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_45 " );	// But to think, if a person conjure a demon like brothers - the demon will come here again.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_46 " );	// Then I need this Eye of Wrath... Where can I find it?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_47 " );	// Brothers give DAH BAR FATGAR to the demon when he comes...
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Hello_01_48 " );	// Ur-Khan doesn't know where to look for DAH BAR FATGAR. Man search for himself...
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Hello_01_49 " );	// Yes, as always, you have to do everything yourself... (ironic)
	FIRSTVANHAN = TRUE;
	B_LogEntry( TOPIC_URNAZULRAGE , " I was able to speak with a ghost orc, Ur-Khan. Now the whole picture is clear. According to him, the orcs found an ancient artifact in the valley - the Eye of Wrath, which Elvais mentioned in the legend. With the help of this artifact, the orcs and they summoned the Great Shadow - Azgalora to the valley. And after that, the actions in the valley developed according to the scenario known to me. " );
	B_LogEntry( TOPIC_URNAZULRAGE , " Also according to Ur-Khan, Azgalor has not appeared in the valley for many centuries, and the only way for me to call him back is to find the very Eye of Wrath and perform some spell ritual with it. Then, perhaps Azgolor will again appear at the call of the artifact, and I can finish it off here. It's simple... " );
	B_LogEntry( TOPIC_URNAZULRAGE , " Ur-Khan doesn't know where this artifact is now. We'll have to look for it ourselves. " );
	self.name[ 0 ] = " Ur-Khan, the ghost shaman " ;
	AI_StopProcessInfos(self);
};


instance DIA_ORC_8564_OLD_TALISMAN (C_Info)
{
	npc = orc_8564_old;
	nr = 1;
	condition = dia_orc_8564_vanhan_talisman_condition;
	information = dia_orc_8564_vanhan_talisman_info;
	important = FALSE;
	permanent = TRUE;
	description = " I found your talisman. " ;
};


func int dia_orc_8564_vanhan_talisman_condition()
{
	if (( FIRSTVANHAN  ==  TRUE ) && ( BLKDRAGNISDEAD  ==  FALSE ) && (Npc_HasItems(other,itmi_orcamulet_vanhan) >=  1 )) ;
	{
		return TRUE;
	};
};

func void dia_orc_8564_old_talisman_info()
{
	B_GivePlayerXP(200);
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Talisman_01_01 " );	// I found your talisman.
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Talisman_01_02 " );	// (surprised) KAWAROQ MATAR NEMROK...
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Talisman_01_03 " );	// Where can a person look for it?
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Talisman_01_04 " );	// In the underground temple to the east of here. And how did he even get there?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Talisman_01_05 " );	// Ur-Khan not to know. He lose it when fighting the dead for a very long time.
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Talisman_01_06 " );	// Ur-Khan will be very upset then - the talisman will be a gift from one great shaman...
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Talisman_01_07 " );	// But now the man will return it to Ur-Khan and he will rejoice again...
	B_GiveInvItems(other,self,itmi_orcamulet_vanhan, 1 );
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Talisman_01_09 " );	// Shaman to say thank you man.
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Talisman_01_10 " );	// To want to thank a person is to want to give him something instead of a talisman...
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Talisman_01_11 " );	// Ur-Khan know what to give... Giving the key to the chest in Ur-Khan's plague. Man open it up and take it all for yourself.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Talisman_01_12 " );	// Where is your chum?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Talisman_01_13 " );	// Downstairs, continue looking for the brothers' camp. Look for a chest there.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Talisman_01_14 " );	// What's in the chest?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_Talisman_01_15 " );	// Ur-Khan not to remember. Be very long time when put there.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_Talisman_01_16 " );	// Got it.
	B_GiveInvItems(self,other,itke_orcshaman_shv,1);
};


instance DIA_ORC_8564_OLD_PRISONSOUL (C_Info)
{
	npc = orc_8564_old;
	nr = 1;
	condition = dia_orc_8564_vanhan_prisonsoul_condition;
	information = dia_orc_8564_vanhan_prisonsoul_info;
	important = FALSE;
	permanent = TRUE;
	description = " I found this strange gem. " ;
};


func int dia_orc_8564_old_prisonsoul_condition()
{
	if (( FIRSTVANHAN  ==  TRUE ) && ( BLKDRAGNISDEAD  ==  FALSE ) && (Npc_HasItems(other,itmi_prisonsoul) >=  1 ) && ( FINDPRISONSSOUL  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_orc_8564_vanhan_prisonsoul_info()
{
	AI_Output(other,self, " DIA_Orc_8564_VanHan_PrisonSoul_01_01 " );	// In the underground temple, I found this strange stone.
	AI_Output(self,other, " DIA_Orc_8564_VanHan_PrisonSoul_01_02 " );	// Let Ur-Khan watch the stone. Ur-Khan speak.
	B_GiveInvItems(other,self,itmi_prisonsoul,1);
	AI_Output(self,other, " DIA_Orc_8564_VanHan_PrisonSoul_01_03 " );	// Mmm... Ur-Khan look and see that it is DAH FATGAR!
	AI_Output(other,self, " DIA_Orc_8564_VanHan_PrisonSoul_01_04 " );	// What is it, DAH FATGAR?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_PrisonSoul_01_05 " );	// Man find DAH FATGAR - Eye of Wrath, but he does not have the power of magic.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_PrisonSoul_01_06 " );	// And what does that mean?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_PrisonSoul_01_07 " );	// A person must return the stone to magic, then it becomes DAH BAR FATGAR. It will be possible to conjure a demon.
	if(READ_AZGOLOR == FALSE)
	{
		AI_Output(other,self, " DIA_Orc_8564_VanHan_PrisonSoul_01_08 " );	// How can I get him back to his former strength?
		AI_Output(self,other, " DIA_Orc_8564_VanHan_PrisonSoul_01_09 " );	// Ur-Khan doesn't know this.
		B_LogEntry( TOPIC_URNAZULRAGE , " I showed Ur-Khan the strange-looking stone I found in the temple. The orc said that I had found the very ancient artifact - the Eye of Wrath. But the stone had lost its magical power. And he does not know how to return it to the artifact. " );
	}
	else
	{
		B_GivePlayerXP(100);
		AI_Output(other,self, " DIA_Orc_8564_VanHan_PrisonSoul_01_10 " );	// I seem to know how to do this. In the temple, I found one old book, which just says this.
		AI_Output(other,self, " DIA_Orc_8564_VanHan_PrisonSoul_01_11 " );	// Let's see what happens...
		B_LogEntry( TOPIC_URNAZULRAGE , " I showed Ur-Khan the strange-looking stone I found in the temple. The orc said that I found this very Eye of Wrath. Now I just have to restore its magical power to it, as described in the book of demons I found. " ) ;
	};
	B_GiveInvItems(self,other,itmi_prisonsoul,1);
	FINDPRISONSOUL = TRUE;
};


instance DIA_ORC_8564_VANHAN_AZGALORBOOK (C_Info)
{
	npc = orc_8564_old;
	nr = 1;
	condition = dia_orc_8564_vanhan_azgalorbook_condition;
	information = dia_orc_8564_vanhan_azgalorbook_info;
	important = FALSE;
	permanent = TRUE;
	description = " Can you read this book? " ;
};


func int dia_orc_8564_vanhan_azgalorbook_condition()
{
	if (( FIRSTVANHAN  ==  TRUE ) && ( BLKDRAGNISDEAD  ==  FALSE ) && ( Npc_HasItems ( other , itwr_azgolor ) >=  1 ) && ( FINDAZGALORBOOK  ==  FALSE ) && ( READ_AzGOLOR  ==  FALSE )) ;
	{
		return TRUE;
	};
};

func void dia_orc_8564_vanhan_azgalorbook_info()
{
	var int ingcount;
	ingcount = 0;
	AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_01 " );	// Can you read this book?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_AzgalorBook_01_02 " );	// Man to give the book to Ur-Khan...
	B_GiveInvItems(other,self,itwr_azgolor,1);
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_03");	//...(смотрит книгу)
	AI_Output(self,other, " DIA_Orc_8564_VanHan_AzgalorBook_01_04 " );	// A very ancient language is the language of the demon... Ur-Khan knows this language and spells it.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_05 " );	// What does it say?
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_06");	//...(смотрит книгу)
	AI_Output(self,other, " DIA_Orc_8564_VanHan_AzgalorBook_01_07 " );	// Here to say why DAH BAR FATGAR is needed and how to get his magic back.
	AI_Output(self,other, " DIA_Orc_8564_VanHan_AzgalorBook_01_09 " );	// Man wait some more... Ur-Khan watch.
	AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_10");	//...(смотрит книгу)
	AI_Output(self,other, " DIA_Orc_8564_VanHan_AzgalorBook_01_11 " );	// To return the magic, a person must have BLADAR, HORKAN and SOLFAG.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_12 " );	// You always speak in a language I don't understand. What is BLADAR?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_AzgalorBook_01_13 " );	// To be the blood of a brother is the blood of an orc.
	if(Npc_HasItems(other,itmi_orcblood) >= 1)
	{
		ingcount = ingcount + 1;
	};
	AI_Output(other,self,"DIA_Orc_8564_VanHan_AzgalorBook_01_14");	//А ХОРКАН?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_AzgalorBook_01_15 " );	// Be a blood fire demon.
	if (Npc_HasItems(other,itmi_barlokheart) >=  1 )
	{
		ingcount = ingcount + 1;
	};
	AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_16 " );	// Well, what is SOLFAG?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_AzgalorBook_01_17 " );	// Be a yellow stone of fire. If set on fire, it will burn.
	if(Npc_HasItems(other,ItMi_Sulfur) >= 1)
	{
		ingcount = ingcount + 1;
	};
	AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_18 " );	// Yes, not a bad set. And what should be done with all this?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_AzgalorBook_01_19 " );	// You need to conjure, you need to conjure everything together with DAH BAR FATGAR so that it wakes up and fills with magic.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_19A " );	// That is, filled with magical energy, the Eye of Wrath will awaken!
	if(ingcount == 0)
	{
		AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_20 " );	// Interesting. Do you happen to know where I can find all these things?
		AI_Output(self,other,"DIA_Orc_8564_VanHan_AzgalorBook_01_21");	//...
		AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_22 " );	// Clearly, you don't know.
		B_LogEntry( TOPIC_URNAZULRAGE , " I brought a book to Ur-Khan that I found in the temple. As it turned out, the book was written in the ancient language of demons. From it I learned how to return the magic power to the Eye of Wrath. For this, three ingredients are needed - orc blood, blood a demon and an incomprehensible yellow substance. Ur-Khan could not explain to me what it is. Now I need to find all these things and try to use them to restore the power of the artifact. " );
	}
	else if(ingcount == 3)
	{
		B_GivePlayerXP(300);
		AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_23 " );	// Interesting. It looks like everything you listed I already have.
		AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_24 " );	// Now it only remains to think about how to return the magic of the Eye with the help of these items.
		B_LogEntry( TOPIC_URNAZULRAGE , " I brought a book to Ur-Khan that I found in the temple. As it turned out, the book was written in the ancient language of demons. From it I learned how to return the magic power to the Eye of Wrath. For this, three ingredients are needed - orc blood, blood a demon and an incomprehensible yellow substance. Ur-Khan could not explain to me what it is, but I suspect it is sulfur. Now you need to find all these things and try to use them to return the power to the artifact. " );
	}
	else
	{
		AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_25 " );	// Interesting. I already have some of the items needed for this...
		AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_26 " );	// It remains only to find the rest and think about how to use them to return the magic of the Eye.
		B_LogEntry( TOPIC_URNAZULRAGE , " I brought a book to Ur-Khan that I found in the temple. As it turned out, the book was written in the ancient language of demons. From it I learned how to return the magic power to the Eye of Wrath. For this, three ingredients are needed - orc blood, blood a demon and an incomprehensible yellow substance. Ur-Khan could not explain to me what it is. Now I need to find all these things and try to use them to restore the power of the artifact. " );
	};
	AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_27 " );	// Is there anything else in this book?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_AzgalorBook_01_28 " );	// Yes... In order to conjure a demon, a person must also know the Words of Power.
	AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_29 " );	// What are these words?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_AzgalorBook_01_30 " );	// Words that make the demon come.
	if(KNOWS_AZGOGLOR_SUMMON == TRUE)
	{
		AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_31 " );	// I think I know what you're talking about. 		
		AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_32 " );	// In one old book that I found in an abandoned crypt, it was mentioned about some strange ritual, which should be accompanied by some spells.
		AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_33 " );	// I think that these are just the right words...
		B_LogEntry( TOPIC_URNAZULRAGE , " Ur-Khan also said that in order to summon Azgalor, I need to know some kind of spell - or, as it is written in the book, Words of Power. I remember reading one of the books in an abandoned crypt, which mentioned this expression... " );
	}
	else
	{
		AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_34 " );	// Is there anything else in the book that can help me?
		B_LogEntry( TOPIC_URNAZULRAGE , " Ur-Khan also said that in order to summon Azgalor, I need to know some kind of spell - or, as it says in the book, Words of Power... " );
	};
	AI_Output(other,self, " DIA_Orc_8564_VanHan_AzgalorBook_01_34 " );	// Nothing else in the book that can help me no?
	AI_Output(self,other, " DIA_Orc_8564_VanHan_AzgalorBook_01_35 " );	// Ur-Khan think that's all.
	AI_Output(self,other, " DIA_Orc_8564_VanHan_AzgalorBook_01_37 " );	// Good luck, man.
	B_GiveInvItems(self,other,itwr_azgolor,1);
	READ_AZGOLOR = TRUE;
	FINDAZGALORBOOK = TRUE;
};

