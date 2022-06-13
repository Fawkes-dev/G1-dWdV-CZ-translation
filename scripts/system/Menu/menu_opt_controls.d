
instance MENU_OPT_CONTROLS(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENU_ITEM_CHG_KEYS_HEADLINE";
	items[1] = "MENU_ITEM_KEY_UP";
	items[2] = "MENU_ITEM_KEY_DOWN";
	items[3] = "MENU_ITEM_KEY_LEFT";
	items[4] = "MENU_ITEM_KEY_RIGHT";
	items[5] = "MENU_ITEM_KEY_STRAFE_LEFT";
	items[6] = "MENU_ITEM_KEY_STRAFE_RIGHT";
	items[7] = "MENU_ITEM_KEY_WEAPON";
	items[8] = "MENU_ITEM_KEY_ACTION";
	items[9] = "MENU_ITEM_KEY_JUMPCLIMBSTRAFE";
	items[10] = "MENU_ITEM_KEY_RUNMODETOGGLE";
	items[11] = "MENU_ITEM_KEY_SNEAK";
	items[12] = "MENU_ITEM_KEY_LOOK";
	items[13] = "MENU_ITEM_KEY_LOOK_FP";
	items[14] = "MENU_ITEM_KEY_INVENTORY";
	items[15] = "MENU_ITEM_KEY_SCREEN_STATUS";
	items[16] = "MENU_ITEM_KEY_SCREEN_LOG";
	items[17] = "MENU_ITEM_INP_UP";
	items[18] = "MENU_ITEM_INP_DOWN";
	items[19] = "MENU_ITEM_INP_LEFT";
	items[20] = "MENU_ITEM_INP_RIGHT";
	items[21] = "MENU_ITEM_INP_STRAFE_LEFT";
	items[22] = "MENU_ITEM_INP_STRAFE_RIGHT";
	items[23] = "MENU_ITEM_INP_WEAPON";
	items[24] = "MENU_ITEM_INP_ACTION";
	items[25] = "MENU_ITEM_INP_JUMPCLIMBSTRAFE";
	items[26] = "MENU_ITEM_INP_RUNMODETOGGLE";
	items[27] = "MENU_ITEM_INP_SNEAK";
	items[28] = "MENU_ITEM_INP_LOOK";
	items[29] = "MENU_ITEM_INP_LOOK_FP";
	items[30] = "MENU_ITEM_INP_INVENTORY";
	items[31] = "MENU_ITEM_INP_SCREEN_STATUS";
	items[32] = "MENU_ITEM_INP_SCREEN_LOG";
	items[33] = "MENU_ITEM_CHG_KEYS_SET_DEFAULT";
	items[34] = "MENU_ITEM_CHG_KEYS_SET_ALTERNATIVE";
	items[35] = "MENUITEM_CHG_KEYS_BACK";
	flags = flags | MENU_SHOW_INFO;
};


const int CTRL_SP1_1 = 1100;
const int CTRL_SP1_2 = 3800;
const int CTRL_DIMX = 3200;
const int CTRL_Y_STEP = 260;
const int CTRL_Y_TITLE = 800;
const int CTRL_Y_START = 1320;
const int CTRL_GROUP1 = 0;
const int CTRL_GROUP2 = 260;
const int CTRL_GROUP3 = 520;
const int CTRL_GROUP4 = 780;
const int CTRL_GROUP5 = 1040;

instance MENU_ITEM_CHG_KEYS_HEADLINE(C_MENU_ITEM_DEF)
{
	text[0] = "NASTAVENÍ KLÁVESNICE";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = CTRL_Y_TITLE;
	dimx = 8100;
	fontname = MENU_FONT_BRIGHT;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENU_ITEM_KEY_UP(C_MENU_ITEM_DEF)
{
	text[0] = "Dopředu";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 0) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_UP";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_DOWN(C_MENU_ITEM_DEF)
{
	text[0] = "Dozadu";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 1) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_DOWN";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_LEFT(C_MENU_ITEM_DEF)
{
	text[0] = "Doleva";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 2) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_LEFT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_RIGHT(C_MENU_ITEM_DEF)
{
	text[0] = "Doprava";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 3) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_RIGHT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_STRAFE_LEFT(C_MENU_ITEM_DEF)
{
	text[0] = "Skok doleva";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 4) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_STRAFE_LEFT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_STRAFE_RIGHT(C_MENU_ITEM_DEF)
{
	text[0] = "Skok doprava";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 5) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_STRAFE_RIGHT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_WEAPON(C_MENU_ITEM_DEF)
{
	text[0] = "Zbraně";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 6) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_WEAPON";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_ACTION(C_MENU_ITEM_DEF)
{
	text[0] = "Akce";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 7) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_ACTION";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_JUMPCLIMBSTRAFE(C_MENU_ITEM_DEF)
{
	text[0] = "Skok/Skok do strany";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 8) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_JUMPCLIMBSTRAFE";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_RUNMODETOGGLE(C_MENU_ITEM_DEF)
{
	text[0] = "Běh";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 9) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_RUNMODETOGGLE";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_SNEAK(C_MENU_ITEM_DEF)
{
	text[0] = "Plížení";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 10) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_SNEAK";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_LOOK(C_MENU_ITEM_DEF)
{
	text[0] = "Rozhlížení";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 11) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_LOOK";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_LOOK_FP(C_MENU_ITEM_DEF)
{
	text[0] = "Najít první nejbližší osobu";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 12) + CTRL_GROUP2;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_LOOK_FP";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_INVENTORY(C_MENU_ITEM_DEF)
{
	text[0] = "Inventář";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 13) + CTRL_GROUP3;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_INVENTORY";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_SCREEN_STATUS(C_MENU_ITEM_DEF)
{
	text[0] = "Status hráče";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 14) + CTRL_GROUP3;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_SCREEN_STATUS";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_SCREEN_LOG(C_MENU_ITEM_DEF)
{
	text[0] = "Mise a poznámky";
	text[1] = "Stiskem DEL zrušte stávající klávesu a stiskem ENTER zadejte novou.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 15) + CTRL_GROUP3;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_SCREEN_LOG";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_INP_UP(C_MENU_ITEM_DEF)
{
	backpic = MENU_KBDINPUT_BACK_PIC;
	text[1] = "Stiskněte požadovanou klávesu";
	type = MENU_ITEM_INPUT;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 0) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	onchgsetoption = "keyUp";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_DOWN(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 1) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyDown";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_LEFT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 2) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyLeft";
	onchgsetoptionsection = "KEYS";
	flags = IT_CHROMAKEYED | IT_TRANSPARENT;
};

instance MENU_ITEM_INP_RIGHT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 3) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyRight";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_STRAFE_LEFT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 4) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyStrafeLeft";
	onchgsetoptionsection = "KEYS";
	flags = IT_CHROMAKEYED | IT_TRANSPARENT;
};

instance MENU_ITEM_INP_STRAFE_RIGHT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 5) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyStrafeRight";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_WEAPON(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 6) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyWeapon";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_ACTION(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 7) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyAction";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_JUMPCLIMBSTRAFE(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 8) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keySMove";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_RUNMODETOGGLE(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 9) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keySlow";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_SNEAK(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 10) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keySneak";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_LOOK(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 11) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyLook";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_LOOK_FP(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 12) + CTRL_GROUP2;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyLookFP";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_INVENTORY(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 13) + CTRL_GROUP3;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyInventory";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_SCREEN_STATUS(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 14) + CTRL_GROUP3;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyShowStatus";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_SCREEN_LOG(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = "Stiskněte požadovanou klávesu";
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 15) + CTRL_GROUP3;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyShowLog";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_CHG_KEYS_SET_DEFAULT(C_MENU_ITEM_DEF)
{
	text[0] = "Výchozí nastavení";
	text[1] = "Vrátí nastavení klávesnice do výchozího nastavení.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 16) + CTRL_GROUP4;
	dimy = 300;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "SETDEFAULT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_CHG_KEYS_SET_ALTERNATIVE(C_MENU_ITEM_DEF)
{
	text[0] = "Alternativní nastavení";
	text[1] = "Aktivuje alternativní nastavení.";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 17) + CTRL_GROUP4;
	dimy = 300;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "SETALTERNATIVE";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENUITEM_CHG_KEYS_BACK(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Zpět";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 18) + CTRL_GROUP5;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};

