
instance MENU_OPT_AUDIO(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[0] = "MENUITEM_AUDIO_HEADLINE";
	items[1] = "MENUITEM_AUDIO_SFXVOL";
	items[2] = "MENUITEM_AUDIO_SFXVOL_SLIDER";
	items[3] = "MENUITEM_AUDIO_MUSICVOL";
	items[4] = "MENUITEM_AUDIO_MUSICVOL_SLIDER";
	items[5] = "MENUITEM_AUDIO_MUSIC";
	items[6] = "MENUITEM_AUDIO_MUSIC_CHOICE";
	items[7] = "MENUITEM_AUDIO_PROVIDER";
	items[8] = "MENUITEM_AUDIO_PROVIDER_CHOICE";
	items[9] = "MENUITEM_AUDIO_SPEEKER";
	items[10] = "MENUITEM_AUDIO_SPEEKER_CHOICE";
	items[11] = "MENUITEM_AUDIO_REVERB";
	items[12] = "MENUITEM_AUDIO_REVERB_CHOICE";
	items[13] = "MENUITEM_AUDIO_SAMPLERATE";
	items[14] = "MENUITEM_AUDIO_SAMPLERATE_CHOICE";
	items[15] = "MENUITEM_AUDIO_BACK";
	flags = flags | MENU_SHOW_INFO;
};


const int MENU_SOUND_DY = 550;

instance MENUITEM_AUDIO_HEADLINE(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "NASTAVENÍ ZVUKU";
	type = MENU_ITEM_TEXT;
	posx = 0;
	posy = MENU_TITLE_Y;
	dimx = 8100;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_AUDIO_SFXVOL(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Efekty&jazyk";
	text[1] = "Hlasitost zvukových efektů a jazyk.";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 0);
	dimx = 3400;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_AUDIO_SFXVOL_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = 4300;
	posy = MENU_START_Y + (MENU_SOUND_DY * 0);
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "soundVolume";
	onchgsetoptionsection = "SOUND";
	userfloat[0] = 20;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_AUDIO_MUSICVOL(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Hlasitost hudby";
	text[1] = "Hlasitost hudby na pozadí";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 1);
	dimx = 3400;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_AUDIO_MUSICVOL_SLIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_SLIDER_BACK_PIC;
	type = MENU_ITEM_SLIDER;
	posx = 4300;
	posy = MENU_START_Y + (MENU_SOUND_DY * 1);
	dimx = MENU_SLIDER_DX;
	dimy = MENU_SLIDER_DY;
	onchgsetoption = "musicVolume";
	onchgsetoptionsection = "SOUND";
	userfloat[0] = 15;
	userstring[0] = MENU_SLIDER_POS_PIC;
	flags = flags & ~IT_SELECTABLE;
};

instance MENUITEM_AUDIO_MUSIC(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Hudba";
	text[1] = "Zapnout/vypnout hudbu na pozadí";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 2);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_AUDIO_MUSIC_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "vypnuto|zapnuto";
	fontname = MENU_FONT_SMALL;
	posx = 4300;
	posy = MENU_START_Y + (MENU_SOUND_DY * 2) + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "musicEnabled";
	onchgsetoptionsection = "SOUND";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_PERF_OPTION | IT_NEEDS_RESTART;
};

instance MENUITEM_AUDIO_PROVIDER(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Generátor zvuku";
	text[1] = "Nové nastavení se uplatní po dalším spuštění hry Gothic.";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 3);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_AUDIO_PROVIDER_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "1|2|3|4|5";
	fontname = MENU_FONT_SMALL;
	posx = 4300;
	posy = MENU_START_Y + (MENU_SOUND_DY * 3) + MENU_CHOICE_YPLUS;
	dimx = 3000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "soundProviderIndex";
	onchgsetoptionsection = "INTERNAL";
	oneventaction[6] = update_audiooptions;
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_PERF_OPTION | IT_NEEDS_RESTART;
};

instance MENUITEM_AUDIO_SPEEKER(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Reproduktory";
	text[1] = "";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 4);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_AUDIO_SPEEKER_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "2 reproduktory|sluchátka|surround|4 reproduktory";
	fontname = MENU_FONT_SMALL;
	posx = 4300;
	posy = MENU_START_Y + (MENU_SOUND_DY * 4) + MENU_CHOICE_YPLUS;
	dimx = 3000;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "soundSpeakerIndex";
	onchgsetoptionsection = "INTERNAL";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_PERF_OPTION;
};

instance MENUITEM_AUDIO_REVERB(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Prostorový zvuk";
	text[1] = "Umožní prostorové zvukové efekty v jeskyních. (nutno znovu spustit)";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 5);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_AUDIO_REVERB_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "vypnuto|zapnuto";
	fontname = MENU_FONT_SMALL;
	posx = 4300;
	posy = MENU_START_Y + (MENU_SOUND_DY * 5) + MENU_CHOICE_YPLUS;
	dimx = MENU_CHOICE_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "soundUseReverb";
	onchgsetoptionsection = "SOUND";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_PERF_OPTION | IT_NEEDS_RESTART;
};

instance MENUITEM_AUDIO_SAMPLERATE(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Vzorkovací kmit.";
	text[1] = "Nové nastavení se uplatní po dalším spuštění hry Gothic.";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 6);
	dimx = 3000;
	dimy = 750;
	onselaction[0] = SEL_ACTION_UNDEF;
	flags = flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_AUDIO_SAMPLERATE_CHOICE(C_MENU_ITEM_DEF)
{
	backpic = MENU_CHOICE_BACK_PIC;
	type = MENU_ITEM_CHOICEBOX;
	text[0] = "22 khz|44 khz";
	fontname = MENU_FONT_SMALL;
	posx = 4300;
	posy = MENU_START_Y + (MENU_SOUND_DY * 6) + MENU_CHOICE_YPLUS;
	dimx = MENU_CHOICE_DX;
	dimy = MENU_CHOICE_DY;
	onchgsetoption = "soundSampleRateIndex";
	onchgsetoptionsection = "INTERNAL";
	flags = flags & ~IT_SELECTABLE;
	flags = flags | IT_TXT_CENTER | IT_PERF_OPTION | IT_NEEDS_RESTART;
};

instance MENUITEM_AUDIO_BACK(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "Zpět";
	posx = 1000;
	posy = MENU_BACK_Y;
	dimx = 6192;
	dimy = MENU_SOUND_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};


func int update_audiooptions()
{
	Update_ChoiceBox("MENUITEM_AUDIO_PROVIDER_CHOICE");
	return 1;
};

func int apply_audioresolution()
{
	Apply_Options_Audio();
	return 0;
};

