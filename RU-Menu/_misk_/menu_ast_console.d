

instance MENU_AST_CONSOLE(C_MENU_DEF)
{
	items[0] = "MENUITEM_GAME_DYNAMICBARS";
	items[1] = "MENUITEM_GAME_DYNAMICBARS_CHOICE";
	items[2] = "MENUITEM_GAME_REMOVEEMPTYBODY";
	items[3] = "MENUITEM_GAME_REMOVEEMPTYBODY_CHOICE";
	items[4] = "MENUITEM_GAME_NUMLOCK";
	items[5] = "MENUITEM_GAME_NUMLOCK_CHOICE";
	items[6] = "MENUITEM_GAME_SHOWPOCKET";
	items[7] = "MENUITEM_GAME_SHOWPOCKET_CHOICE";
	items[8] = "MENUITEM_GAME_SHOWBAG";
	items[9] = "MENUITEM_GAME_SHOWBAG_CHOICE";
	items[10] = "MENUITEM_GAME_SHOWNOTICE";
	items[11] = "MENUITEM_GAME_SHOWNOTICE_CHOICE";
	items[12] = "MENUITEM_GAME_FIRESHIELD";
	items[13] = "MENUITEM_GAME_FIRESHIELD_CHOICE";
	items[14] = "MENUITEM_GAME_COLORNAMES";
	items[15] = "MENUITEM_GAME_COLORNAMES_CHOICE";
	items[16] = "MENUITEM_GAME_CONSOLEPOS";
	items[17] = "MENUITEM_GAME_CONSOLEPOS_CHOICE";
	items[18] = "MENUITEM_CONSOLEX";
	items[19] = "MENUITEM_CONSOLEX_SLIDER";
	items[20] = "MENUITEM_CONSOLEY";
	items[21] = "MENUITEM_CONSOLEY_SLIDER";
	items[22] = "MENUITEM_GAME_CONSOLEARRAY";
	items[23] = "MENUITEM_GAME_CONSOLEARRAY_CHOICE";
	items[24] = "MENUITEM_GAME_CONSOLESPEED";
	items[25] = "MENUITEM_GAME_CONSOLESPEED_CHOICE";
	items[26] = "MENUITEM_GAME_CONSOLEFPS";
	items[27] = "MENUITEM_GAME_CONSOLEFPS_CHOICE";
	items[28] = "MENUITEM_GAME_RENDERITEM";
	items[29] = "MENUITEM_GAME_RENDERITEM_CHOICE";
	items[30] = "MENUITEM_SUB_ASTBACK";
	flags = flags | MENU_SHOW_INFO | MENU_DONTSCALE_DIM;
};

instance MENUITEM_GAME_DYNAMICBARS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Hide status bars " ;
	text[ 1 ] = " Hide dynamic game status bars " ;
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 7);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_DYNAMICBARS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[ 0 ] = " no|yes " ;
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 7)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bViewStatusBars";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_REMOVEEMPTYBODY(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Remove empty NPCs " ;
	text[ 1 ] = " Clean up monster corpses with empty inventory " ;
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 6);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_REMOVEEMPTYBODY_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[ 0 ] = " no|yes " ;
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 6)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bRemoveEmptyBodys";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_NUMLOCK(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Disable Numlock " ;
	text[ 1 ] = " Disable Numlock (required for DX11!) " ;
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 5);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_NUMLOCK_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[ 0 ] = " no|yes " ;
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 5)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bNumlockOff";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_SHOWHELM(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Hide helmet " ;
	text[ 1 ] = " Display the helmet model of the hero " ;
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 5);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT | IT_ONLY_IN_GAME;
};

instance MENUITEM_GAME_SHOWHELM_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[ 0 ] = " no|yes " ;
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 5)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bHideHelm";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_ONLY_IN_GAME;
};

instance MENUITEM_GAME_SHOWPOCKET(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Show wallet " ;
	text[ 1 ] = " Display wallet model on hero's belt " ;
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 4);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_SHOWPOCKET_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[ 0 ] = " no|yes " ;
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 4)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bShowPocket";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_SHOWBAG(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Show bag " ;
	text[ 1 ] = " Display bag model on hero's belt " ;
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 3);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_SHOWBAG_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[ 0 ] = " no|yes " ;
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 3)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bShowBag";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_SHOWNOTICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Location Tags " ;
	text[ 1 ] = " Enables hero location messages " ;
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 2);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_SHOWNOTICE_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[ 0 ] = " no|yes " ;
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 2)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bShowNotice";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_FIRESHIELD(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Magic Shield Effects " ;
	text[ 1 ] = " Visual display of hero protection spells " ;
	posx = 0;
	posy = MENU_START_Y - (MENU_SOUND_DY * 1);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_FIRESHIELD_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[ 0 ] = " no|yes " ;
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = (MENU_START_Y - (MENU_SOUND_DY * 1)) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bShowFireShield";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_COLORNAMES(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Highlight NPC names " ;
	text[ 1 ] = " Color display of the NPC's relationship to the hero " ;
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 0);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_COLORNAMES_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[ 0 ] = " no|yes " ;
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 0) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bSetColorNames";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_CONSOLEPOS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Console position on screen " ;
	text[ 1 ] = " Placing a message box on the screen " ;
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 1);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_CONSOLEPOS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[ 0 ] = " Left|Center|Right " ;
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 1) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "nCslAlignment";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CONSOLEX(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " X Position " ;
	text[ 1 ] = " The horizontal position of the message box on the screen " ;
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 2);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_CONSOLEX_SLIDER(C_MENU_ITEM_DEF)
{
	backPic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	text[0] = "";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 2) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "fCslPositionX";
	onchgsetoptionsection = "AST";
	userfloat[0] = 20;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_CONSOLEY(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Y position " ;
	text[ 1 ] = " The vertical position of the message box on the screen " ;
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 3);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_CONSOLEY_SLIDER(C_MENU_ITEM_DEF)
{
	backPic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	text[0] = "";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 3) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "fCslPositionY";
	onchgsetoptionsection = "AST";
	userfloat[0] = 20;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_CONSOLEARRAY(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Maximum messages " ;
	text[ 1 ] = " The maximum number of possible messages on the screen " ;
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 4);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_CONSOLEARRAY_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "1|2|3|4|5|6|7|8|9|10|15|20|30";
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 4) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "nCslSize";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_CONSOLESPEED(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Animation speed " ;
	text[ 1 ] = " How fast messages disappear on the screen " ;
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 5);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_CONSOLESPEED_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[ 0 ] = " slow|medium|fast " ;
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 5) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "fCslInterval";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_CONSOLEFPS(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Show FPS " ;
	text[ 1 ] = " Displays the current FPS on the screen " ;
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 6);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_CONSOLEFPS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[ 0 ] = " no|yes " ;
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 6) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bToggleFPS";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_GAME_RENDERITEM(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Item Render " ;
	text[ 1 ] = " Enables rendering of inventory items " ;
	posx = 0;
	posy = MENU_START_Y + (MENU_SOUND_DY * 7);
	dimx = 7000 ;
	five = 750 ;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_RENDERITEM_CHOICE(C_MENU_ITEM_DEF)
{
	backPic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[ 0 ] = " no|yes " ;
	fontname = MENU_FONT_SMALL;
	posx = 8000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 7) + MENU_CHOICE_YPLUS + 25;
	dimx = MENU_SLIDER_DX ;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "bShowInvRender";
	onchgsetoptionsection = "AST";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_SUB_ASTBACK(C_MENU_ITEM_DEF)
{
	backPic = MENU_ITEM_BACK_PIC;
	text[ 0 ] = " Back " ;
	text[1] = "";
	posx = 1000;
	rickshaw = 7000 ;
	dimx = 6192 ;
	dimy = MENU_SOUND_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};

