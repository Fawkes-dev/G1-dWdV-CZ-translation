
instance SPELLFX_SLEEPER_FIREBALL(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 JAWS";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATEONCE CREATEQUAD";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Fireball_COLLIDE";
	emfxcolldyn_s = "spellFX_Fireball_SENDPERCEPTION";
	emfxcollstatalign_s = "COLLISIONNORMAL";
	emfxcreatedowntrj = 0;
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "100 100";
	userstring[2] = "MUL";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_SLEEPER_FIREBALL_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SLEEPER_FIREBALL_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_INIT";
	lightrange = 0.01;
};

instance SPELLFX_SLEEPER_FIREBALL_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_INVEST";
	emcreatefxid = "spellFX_Fireball_InVEST_BLAST1";
	lightrange = 150;
	sfxid = "MFX_Fireball_invest1";
	sfxisambient = 1;
};

instance SPELLFX_SLEEPER_FIREBALL_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_INVEST_L2";
	emcreatefxid = "spellFX_Fireball_InVEST_BLAST2";
	sfxid = "MFX_Fireball_invest2";
	sfxisambient = 1;
};

instance SPELLFX_SLEEPER_FIREBALL_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_INVEST_L3";
	emcreatefxid = "spellFX_Fireball_InVEST_BLAST3";
	sfxid = "MFX_Fireball_invest3";
	sfxisambient = 1;
};

instance SPELLFX_SLEEPER_FIREBALL_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_INVEST_L4";
	emcreatefxid = "spellFX_Fireball_InVEST_BLAST4";
	sfxid = "MFX_Fireball_invest4";
	sfxisambient = 1;
};

instance SPELLFX_SLEEPER_FIREBALL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	visname_s = "MFX_Fireball_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "MFX_Fireball_Cast";
	sfxisambient = 1;
	emcheckcollision = 1;
};

instance SPELLFX_SLEEPER_FIREBALL_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
};

instance SPELLFX_LIGHT(CFX_BASE_PROTO)
{
	visname_s = "MFX_Light_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emfxcreate_s = "spellFX_Light_ACTIVE";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_LIGHT_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_LIGHT_ACTIVE(CFX_BASE_PROTO)
{
	visname_s = "";
	visalpha = 1;
	emtrjmode_s = "FOLLOW TARGET";
	emtrjeasevel = 0;
	emtrjoriginnode = "BIP01 Head";
	emtrjloopmode_s = "HALT";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.4;
	emtrjtargetrange = 1.2;
	emtrjtargetelev = 89;
	lightpresetname = "JUSTWHITE";
};

instance SPELLFX_LIGHT_ACTIVE_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_LIGHT_ACTIVE_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_LIGHT_ACTIVE_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Light_ORIGIN";
	lightrange = 1000;
	sfxid = "MFX_Light_CAST";
	sfxisambient = 1;
	emtrjeasevel = 1400;
};

instance SPELLFX_FIREBOLT(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firebolt_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATE CREATEQUAD";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Firebolt_COLLIDEFX";
	emfxcolldyn_s = "spellFX_Firebolt_SENDPERCEPTION";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	lightpresetname = "FIRESMALL";
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "40 40";
	userstring[2] = "MUL";
};

instance SPELLFX_FIREBOLT_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.001;
};

instance SPELLFX_FIREBOLT_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Firebolt_INIT";
	lightrange = 0.001;
};

instance SPELLFX_FIREBOLT_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "mfx_firebolt_cast";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "Torch_Enlight";
	lightrange = 200;
	emcheckcollision = 1;
};

instance SPELLFX_FIREBOLT_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	visname_s = "";
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
	sfxid = "TORCH_ENLIGHT";
};

instance SPELLFX_FIREBOLT_COLLIDEFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firebolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_FIREBOLT_SENDPERCEPTION(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firebolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
	sendassessmagic = 1;
};

instance SPELLFX_FIREBALL(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATEONCE CREATEQUAD";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Fireball_COLLIDE";
	emfxcolldyn_s = "spellFX_Fireball_SENDPERCEPTION";
	emfxcollstatalign_s = "COLLISIONNORMAL";
	emfxcreatedowntrj = 0;
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "100 100";
	userstring[2] = "MUL";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_FIREBALL_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_FIREBALL_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_INIT";
	lightrange = 0.01;
};

instance SPELLFX_FIREBALL_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_INVEST";
	emcreatefxid = "spellFX_Fireball_InVEST_BLAST1";
	lightrange = 150;
	sfxid = "MFX_Fireball_invest1";
	sfxisambient = 1;
};

instance SPELLFX_FIREBALL_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_INVEST_L2";
	emcreatefxid = "spellFX_Fireball_InVEST_BLAST2";
	sfxid = "MFX_Fireball_invest2";
	sfxisambient = 1;
};

instance SPELLFX_FIREBALL_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_INVEST_L3";
	emcreatefxid = "spellFX_Fireball_InVEST_BLAST3";
	sfxid = "MFX_Fireball_invest3";
	sfxisambient = 1;
};

instance SPELLFX_FIREBALL_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_INVEST_L4";
	emcreatefxid = "spellFX_Fireball_InVEST_BLAST4";
	sfxid = "MFX_Fireball_invest4";
	sfxisambient = 1;
};

instance SPELLFX_FIREBALL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	visname_s = "MFX_Fireball_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "MFX_Fireball_Cast";
	sfxisambient = 1;
	emcheckcollision = 1;
};

instance SPELLFX_FIREBALL_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
};

instance SPELLFX_FIREBALL_INVEST_BLAST1(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_INVEST_BLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest1";
	sfxisambient = 1;
	visalpha = 0.3;
};

instance SPELLFX_FIREBALL_INVEST_BLAST2(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_INVEST_BLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest2";
	sfxisambient = 1;
	visalpha = 0.5;
};

instance SPELLFX_FIREBALL_INVEST_BLAST3(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_INVEST_BLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest3";
	sfxisambient = 1;
	visalpha = 0.8;
};

instance SPELLFX_FIREBALL_INVEST_BLAST4(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_INVEST_BLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest4";
	sfxisambient = 1;
	visalpha = 1;
};

instance SPELLFX_FIREBALL_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_Collide1";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_FIREBALL_COLLIDE_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide1";
	sfxid = "MFX_Fireball_Collide1";
};

instance SPELLFX_FIREBALL_COLLIDE_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide2";
	sfxid = "MFX_Fireball_Collide2";
};

instance SPELLFX_FIREBALL_COLLIDE_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide3";
	sfxid = "MFX_Fireball_Collide3";
};

instance SPELLFX_FIREBALL_COLLIDE_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide4";
	sfxid = "MFX_Fireball_Collide4";
};

instance SPELLFX_FIREBALL_SENDPERCEPTION(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_Collide1";
	visalpha = 1;
	emtrjoriginnode = "BIP01";
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
	sendassessmagic = 1;
};

instance SPELLFX_FIREBALL_SENDPERCEPTION_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide1";
	sfxid = "MFX_Fireball_Collide1";
};

instance SPELLFX_FIREBALL_SENDPERCEPTION_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide2";
	sfxid = "MFX_Fireball_Collide2";
};

instance SPELLFX_FIREBALL_SENDPERCEPTION_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide3";
	sfxid = "MFX_Fireball_Collide3";
};

instance SPELLFX_FIREBALL_SENDPERCEPTION_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Fireball_Collide4";
	sfxid = "MFX_Fireball_Collide4";
};

instance SPELLFX_FIRESTORM(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATEONCE CREATEQUAD";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Firestorm_SPREAD";
	emfxcolldyn_s = "spellFX_Firestorm_SPREAD";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	emfxinvestorigin_s = "spellFX_Firestorm_INVESTSOUND";
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "100 100";
	userstring[2] = "MUL";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_FIRESTORM_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_FIRESTORM_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Firestorm_INIT";
	lightrange = 0.01;
};

instance SPELLFX_FIRESTORM_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 100;
	emcreatefxid = "spellFX_Firestorm_INVESTBLAST1";
};

instance SPELLFX_FIRESTORM_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	emcreatefxid = "spellFX_Firestorm_INVESTBLAST2";
};

instance SPELLFX_FIRESTORM_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	lightrange = 300;
	emcreatefxid = "spellFX_Firestorm_INVESTBLAST3";
};

instance SPELLFX_FIRESTORM_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	lightrange = 400;
	emcreatefxid = "spellFX_Firestorm_INVESTBLAST4";
};

instance SPELLFX_FIRESTORM_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Firestorm_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "MFX_Firestorm_Cast";
	sfxisambient = 1;
	emcheckcollision = 1;
	lightrange = 200;
};

instance SPELLFX_FIRESTORM_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
};

instance SPELLFX_FIRESTORM_INVESTSOUND(CFX_BASE_PROTO)
{
	visname_s = "simpleglow.tga";
	visalpha = 0.01;
	sfxid = "MFX_Firestorm_Invest";
	sfxisambient = 1;
};

instance SPELLFX_FIRESTORM_INVESTBLAST1(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_INVESTBLAST1";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest1";
	sfxisambient = 1;
};

instance SPELLFX_FIRESTORM_INVESTBLAST2(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_INVESTBLAST2";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest2";
	sfxisambient = 1;
};

instance SPELLFX_FIRESTORM_INVESTBLAST3(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_INVESTBLAST3";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest3";
	sfxisambient = 1;
};

instance SPELLFX_FIRESTORM_INVESTBLAST4(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_INVESTBLAST4";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Fireball_invest4";
	sfxisambient = 1;
};

instance SPELLFX_FIRESTORM_SPREAD(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firestorm_SPREAD";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "CREATE CREATEQUAD";
	emactioncolldyn_s = "CREATEONCE";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	emcheckcollision = 1;
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "40 40";
	userstring[2] = "MUL";
	lightpresetname = "FIRESMALL";
	emfxcreate_s = "spellFX_Firestorm_COLLIDE";
	sfxid = "MFX_FIrestorm_Collide";
	sfxisambient = 1;
};

instance SPELLFX_FIRESTORM_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Fireball_Collide3";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
	sfxid = "MFX_Fireball_Collide3";
};

instance SPELLFX_FIRERAIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_Firerain_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emfxinvestorigin_s = "spellFX_FireRAin_INVESTGLOW";
};

instance SPELLFX_FIRERAIN_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_FireRain_RAIN";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_FIRERAIN_RAIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_FireRain_Rain";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldynalign_s = "COLLISIONNORMAL";
	emcheckcollision = 1;
	lightpresetname = "CATACLYSM";
	sfxid = "MFX_Firerain_rain";
	sfxisambient = 1;
};

instance SPELLFX_FIRERAIN_SUB(CFX_BASE_PROTO)
{
	visname_s = "";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 HEAD";
};

instance SPELLFX_FIRERAIN_INVESTGLOW(CFX_BASE_PROTO)
{
	visname_s = "MFX_FireRain_INVESTGLOW";
	emtrjoriginnode = "BIP01";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	lightpresetname = "REDAMBIENCE";
	sfxid = "MFX_Firerain_INVEST";
	sfxisambient = 1;
	emfxcreate_s = "FX_EarthQuake";
};

instance SPELLFX_SPEED(CFX_BASE_PROTO)
{
	visname_s = "MFX_Heal_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emfxinvestorigin_s = "spellFX_Speed_ORIGIN";
};

instance SPELLFX_SPEED_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Speed_START";
};

instance SPELLFX_SPEED_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_SPEED_START(CFX_BASE_PROTO)
{
	visname_s = "MFX_Heal_Start";
	sfxid = "MFX_Heal_CAST";
	sfxisambient = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 R FOOT";
};

instance SPELLFX_SPEED_ORIGIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_Heal_Invest";
	visalpha = 1;
	lightpresetname = "AURA";
	emtrjmode_s = "FIXED";
};

instance SPELLFX_TELEPORT(CFX_BASE_PROTO)
{
	visname_s = "MFX_Teleport_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emfxinvestorigin_s = "spellFX_Teleport_ORIGIN";
	lightpresetname = "AURA";
};

instance SPELLFX_TELEPORT_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.1;
};

instance SPELLFX_TELEPORT_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.1;
};

instance SPELLFX_TELEPORT_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
};

instance SPELLFX_TELEPORT_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Teleport_CAST";
	pfx_ppsisloopingchg = 1;
	lightrange = 500;
};

instance SPELLFX_TELEPORT_ORIGIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_TELEPORT_INVEST";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	emfxcreate_s = "spellFX_Teleport_Ring";
	sfxid = "MFX_teleport_invest";
	sfxisambient = 1;
};

instance SPELLFX_TELEPORT_RING(CFX_BASE_PROTO)
{
	visname_s = "MFX_TELEPORT_RING";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
};

instance SPELLFX_TELEPORT_CAST(CFX_BASE_PROTO)
{
	visname_s = "MFX_TELEPORT_CAST";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	sfxid = "MFX_teleport_Cast";
	sfxisambient = 1;
	emtrjmode_s = "FIXED";
};

instance SPELLFX_HEAL(CFX_BASE_PROTO)
{
	visname_s = "MFX_Heal_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emfxinvestorigin_s = "spellFX_Heal_ORIGIN";
};

instance SPELLFX_HEAL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_HEAL_START(CFX_BASE_PROTO)
{
	visname_s = "MFX_Heal_Start";
	sfxid = "MFX_Heal_CAST";
	sfxisambient = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 R FOOT";
};

instance SPELLFX_HEAL_ORIGIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_Heal_Invest";
	emtrjoriginnode = "BIP01";
	visalpha = 1;
	emfxcreate_s = "spellFX_Heal_START";
	emtrjmode_s = "FIXED";
	lightpresetname = "AURA";
};

instance SPELLFX_TRANSFORM(CFX_BASE_PROTO)
{
	visname_s = "MFX_Transform_INIT";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjmode_s = "fixed";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 5000;
};

instance SPELLFX_TRANSFORM_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Transform_INIT";
};

instance SPELLFX_TRANSFORM_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Transform_ORIGIN";
	emcreatefxid = "spellFX_Transform_GLOW_SFX";
};

instance SPELLFX_TRANSFORM_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
	emcreatefxid = "spellFX_Transform_BLEND";
};

instance SPELLFX_TRANSFORM_GLOW_SFX(CFX_BASE_PROTO)
{
	visname_s = "MFX_Transform_GLOW";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjdynupdatedelay = 0;
	sfxid = "MFX_Transform_invest";
	sfxisambient = 1;
};

instance SPELLFX_TRANSFORM_GLOW(CFX_BASE_PROTO)
{
	visname_s = "MFX_Transform_GLOW";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjdynupdatedelay = 0;
};

instance SPELLFX_TRANSFORM_BLEND(CFX_BASE_PROTO)
{
	visname_s = "MFX_Transform_BLEND";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjdynupdatedelay = 0;
	sfxid = "MFX_Transform_Cast";
	sfxisambient = 1;
};

instance SPELLFX_LIGHTNING(CFX_BASE_PROTO)
{
	visname_s = "MFX_Lightning_Origin";
	vissize_s = "40 40";
	visalphablendfunc_s = "ADD";
	vistexanifps = 17;
	vistexaniislooping = 1;
	emtrjmode_s = "FIXED";
	emtrjnumkeys = 4;
	emtrjnumkeysvar = 1;
	emtrjangleelevvar = 20;
	emtrjangleheadvar = 20;
	emtrjloopmode_s = "PINGPONG";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0.3;
	emselfrotvel_s = "0 0 50";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
};

instance SPELLFX_LIGHTNING_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Lightning_Origin";
};

instance SPELLFX_LIGHTNING_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "Lightning_Single.ltn";
	emtrjmode_s = "TARGET LINE RANDOM";
	emtrjeasevel = 3000;
};

instance SPELLFX_LIGHTNING_KEY_CAST(C_PARTICLEFXEMITKEY)
{
};

instance SPELLFX_CHAINLIGHTNING(CFX_BASE_PROTO)
{
	visname_s = "lightning_big_a0.tga";
	vissize_s = "3 3";
	visalphablendfunc_s = "ADD";
	vistexanifps = 17;
	vistexaniislooping = 1;
	emfxcreate_s = "spellFX_ChainLightning_Origin";
	emtrjmode_s = "FIXED";
	emtrjnumkeys = 12;
	emtrjnumkeysvar = 3;
	emtrjangleelevvar = 20;
	emtrjangleheadvar = 20;
	emtrjloopmode_s = "none";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 200000;
	emselfrotvel_s = "0 0 50";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
};

instance SPELLFX_CHAINLIGHTNING_ORIGIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_Lightning_Origin";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	lightpresetname = "AURA";
};

instance SPELLFX_CHAINLIGHTNING_ORIGIN_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_CHAINLIGHTNING_ORIGIN_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_CHAINLIGHTNING_ORIGIN_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	sfxid = "MFX_Lightning_Origin";
	lightrange = 200;
};

instance SPELLFX_THUNDERBOLT(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderebolt_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Thunderbolt_COLLIDE";
	emfxcolldyn_s = "spellFX_Thunderbolt_SENDPERCEPTION";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
};

instance SPELLFX_THUNDERBOLT_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderbolt_INIT";
	scaleduration = 0.5;
};

instance SPELLFX_THUNDERBOLT_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderbolt_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "MFX_Thunderbolt_Cast";
	emcheckcollision = 1;
};

instance SPELLFX_THUNDERBOLT_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
	emcheckcollision = 0;
};

instance SPELLFX_THUNDERBOLT_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderbolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "Torch_Enlight";
};

instance SPELLFX_THUNDERBOLT_SENDPERCEPTION(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderbolt_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "Torch_Enlight";
	sendassessmagic = 1;
};

instance SPELLFX_THUNDERBALL(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATEONCE CREATEQUAD";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Thunderball_COLLIDE";
	emfxcolldyn_s = "spellFX_Thunderspell_TARGET";
	emfxcollstatalign_s = "COLLISIONNORMAL";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	userstring[0] = "fireballquadmark.tga";
	userstring[1] = "100 100";
	userstring[2] = "MUL";
	lightpresetname = "AURA";
};

instance SPELLFX_THUNDERBALL_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_INIT";
	lightrange = 0.01;
};

instance SPELLFX_THUNDERBALL_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_INIT";
	lightrange = 0.01;
};

instance SPELLFX_THUNDERBALL_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_INVEST";
	emcreatefxid = "spellFX_Thunderball_InVEST_BLAST1";
	lightrange = 50;
	sfxid = "MFX_Thunderball_invest1";
	sfxisambient = 1;
};

instance SPELLFX_THUNDERBALL_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_INVEST_L2";
	emcreatefxid = "spellFX_Thunderball_InVEST_BLAST2";
	sfxid = "MFX_Thunderball_invest2";
	sfxisambient = 1;
};

instance SPELLFX_THUNDERBALL_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_INVEST_L3";
	emcreatefxid = "spellFX_Thunderball_InVEST_BLAST3";
	sfxid = "MFX_Thunderball_invest3";
	sfxisambient = 1;
};

instance SPELLFX_THUNDERBALL_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_INVEST_L4";
	emcreatefxid = "spellFX_Thunderball_InVEST_BLAST4";
	sfxid = "MFX_Thunderball_invest4";
	sfxisambient = 1;
};

instance SPELLFX_THUNDERBALL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
	visname_s = "MFX_Thunderball_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "MFX_Thunderball_Cast";
	sfxisambient = 1;
	emcheckcollision = 1;
};

instance SPELLFX_THUNDERBALL_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	pfx_flygravity_s = "0 0.0002 0";
	emtrjeasevel = 1e-006;
};

instance SPELLFX_THUNDERBALL_INVEST_BLAST1(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_INVEST_BLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Thunderball_invest1";
	sfxisambient = 1;
	visalpha = 0.3;
};

instance SPELLFX_THUNDERBALL_INVEST_BLAST2(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_INVEST_BLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Thunderball_invest2";
	sfxisambient = 1;
	visalpha = 0.5;
};

instance SPELLFX_THUNDERBALL_INVEST_BLAST3(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_INVEST_BLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Thunderball_invest3";
	sfxisambient = 1;
	visalpha = 0.8;
};

instance SPELLFX_THUNDERBALL_INVEST_BLAST4(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_INVEST_BLAST";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Thunderball_invest4";
	sfxisambient = 1;
	visalpha = 1;
};

instance SPELLFX_THUNDERBALL_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Collide1";
	visalpha = 1;
	emtrjoriginnode = "BIP01";
	emtrjmode_s = "FIXED";
	lightpresetname = "FIRESMALL";
};

instance SPELLFX_THUNDERBALL_COLLIDE_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_Collide1";
	sfxid = "MFX_Thunderball_Collide1";
};

instance SPELLFX_THUNDERBALL_COLLIDE_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_Collide2";
	sfxid = "MFX_Thunderball_Collide2";
};

instance SPELLFX_THUNDERBALL_COLLIDE_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_Collide3";
	sfxid = "MFX_Thunderball_Collide3";
};

instance SPELLFX_THUNDERBALL_COLLIDE_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Thunderball_Collide4";
	sfxid = "MFX_Thunderball_Collide4";
};

instance SPELLFX_ICECUBE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Icecube_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATEONCE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_IceCube_COLLIDE";
	emfxcolldyn_s = "spellFX_Icespell_TARGET";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
	emfxinvestorigin_s = "spellFX_Icespell_Invest";
	lightpresetname = "AURA";
};

instance SPELLFX_ICECUBE_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_ICECUBE_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Icecube_INIT";
	lightrange = 0.01;
	scaleduration = 0.5;
};

instance SPELLFX_ICECUBE_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_ICECUBE_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	emcheckcollision = 1;
	sfxid = "MFX_Icecube_cast";
	sfxisambient = 1;
	lightrange = 200;
};

instance SPELLFX_ICECUBE_KEY_COLLIDE(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 1e-006;
};

instance SPELLFX_ICECUBE_COLLIDE(CFX_BASE_PROTO)
{
	visname_s = "MFX_ICESPELL_Collide";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_ICECUBE_COLLIDE";
};

instance SPELLFX_ICESPELL_INVEST(CFX_BASE_PROTO)
{
	visname_s = "";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_ICECUBE_INVEST";
	sfxisambient = 1;
};

instance SPELLFX_ICEWAVE(CFX_BASE_PROTO)
{
	visname_s = "MFX_IceCUBE_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emfxinvestorigin_s = "spellFX_Icespell_Invest";
};

instance SPELLFX_ICEWAVE_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_IceCUBE_INIT";
};

instance SPELLFX_ICEWAVE_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Icewave_WAVE";
	pfx_ppsisloopingchg = 1;
	sfxid = "MFX_Icewave_Cast";
	sfxisambient = 1;
};

instance SPELLFX_ICEWAVE_WAVE(CFX_BASE_PROTO)
{
	visname_s = "MFX_Icewave_WAVE";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldyn_s = "spellFX_IceSpell_TARGET";
	emfxcolldynalign_s = "COLLISIONNORMAL";
	emcheckcollision = 1;
	lightpresetname = "WHITEBLEND";
};

instance SPELLFX_ICEWAVE_WAVE_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_ICEWAVE_WAVE_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_ICEWAVE_WAVE_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	lightrange = 200;
};

instance SPELLFX_ICEWAVE_SUB(CFX_BASE_PROTO)
{
	visname_s = "";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 HEAD";
};

instance SPELLFX_DEMON(CFX_BASE_PROTO)
{
	visname_s = "MFX_Summondemon_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	lightpresetname = "REDAMBIENCE";
	emfxinvestorigin_s = "spellFX_Demon_INVEST";
};

instance SPELLFX_DEMON_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_DEMON_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_DEMON_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 400;
};

instance SPELLFX_DEMON_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
};

instance SPELLFX_DEMON_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "FX_EarthQuake";
};

instance SPELLFX_DEMON_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_DEMON_INVEST(CFX_BASE_PROTO)
{
	visname_s = "MFX_SummonDemon_Invest";
	emtrjoriginnode = "Bip01";
};

instance SPELLFX_SKELETON(CFX_BASE_PROTO)
{
	visname_s = "MFX_Summondemon_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	lightpresetname = "REDAMBIENCE";
	emfxinvestorigin_s = "spellFX_Demon_INVEST";
};

instance SPELLFX_SKELETON_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SKELETON_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_SKELETON_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 400;
};

instance SPELLFX_SKELETON_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
};

instance SPELLFX_SKELETON_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "FX_EarthQuake";
};

instance SPELLFX_SKELETON_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
	lightrange = 200;
};

instance SPELLFX_GOLEM(CFX_BASE_PROTO)
{
	visname_s = "MFX_Summondemon_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	lightpresetname = "REDAMBIENCE";
	emfxinvestorigin_s = "spellFX_Demon_INVEST";
};

instance SPELLFX_GOLEM_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_GOLEM_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_GOLEM_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 400;
};

instance SPELLFX_GOLEM_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
};

instance SPELLFX_GOLEM_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "FX_EarthQuake";
};

instance SPELLFX_GOLEM_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
	lightrange = 200;
};

instance SPELLFX_ARMYOFDARKNESS(CFX_BASE_PROTO)
{
	visname_s = "MFX_Summondemon_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	lightpresetname = "REDAMBIENCE";
	emfxinvestorigin_s = "spellFX_Demon_INVEST";
};

instance SPELLFX_ARMYOFDARKNESS_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_ARMYOFDARKNESS_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	lightrange = 0.01;
};

instance SPELLFX_ARMYOFDARKNESS_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	lightrange = 400;
};

instance SPELLFX_ARMYOFDARKNESS_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
};

instance SPELLFX_ARMYOFDARKNESS_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "FX_EarthQuake";
};

instance SPELLFX_ARMYOFDARKNESS_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_ArmyOfDarkness_ORIGIN";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_MASSDEATH(CFX_BASE_PROTO)
{
	visname_s = "MFX_MassDeath_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjloopmode_s = "NONE";
	emfxinvestorigin_s = "spellFX_Massdeath_INITGLOW";
	emfxcreatedowntrj = 0;
};

instance SPELLFX_MASSDEATH_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_MassDeath_INIT";
};

instance SPELLFX_MASSDEATH_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_MassDeath_GROUND";
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_MASSDEATH_GROUND(CFX_BASE_PROTO)
{
	visname_s = "MFX_MassDeath_CAST";
	emtrjoriginnode = "BIP01 R Foot";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldyn_s = "spellFX_MassDeath_Target";
	emfxcolldynalign_s = "COLLISIONNORMAL";
	emcheckcollision = 1;
	lightpresetname = "REDAMBIENCE";
	sfxid = "MFX_Massdeath_Cast";
	sfxisambient = 1;
};

instance SPELLFX_MASSDEATH_SUB(CFX_BASE_PROTO)
{
	visname_s = "";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 HEAD";
};

instance SPELLFX_MASSDEATH_TARGET(CFX_BASE_PROTO)
{
	visname_s = "MFX_Massdeath_TARGET";
	emtrjoriginnode = "BIP01";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_MassdeatH_Target";
	sendassessmagic = 1;
};

instance SPELLFX_MASSDEATH_INITGLOW(CFX_BASE_PROTO)
{
	visname_s = "MFX_Massdeath_INIT_GLOW";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emfxcreatedowntrj = 0;
	emtrjmode_s = "FIXED";
	lightpresetname = "REDAMBIENCE";
};

instance SPELLFX_DESTROYUNDEAD(CFX_BASE_PROTO)
{
	visname_s = "MFX_DestroyUndead_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 FIRE";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emactioncollstat_s = "COLLIDE CREATE";
	emactioncolldyn_s = "COLLIDE CREATEONCE";
	emfxcollstat_s = "spellFX_Destroyundead_COLLIDE";
	emfxcolldyn_s = "spellFX_Destroyundead_SENDPERCEPTION";
	emtrjtargetrange = 20;
	emtrjtargetelev = 0;
	emtrjdynupdatedelay = 20000;
};

instance SPELLFX_DESTROYUNDEAD_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_DestroyUndead_INIT";
};

instance SPELLFX_DESTROYUNDEAD_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_DestroyUndead_CAST";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 800;
	sfxid = "MFX_DestroyUndead_Cast";
	sfxisambient = 1;
	emcheckcollision = 1;
};

instance SPELLFX_DESTROYUNDEAD_COLLIDE(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01";
	visname_s = "MFX_DESTROYUNDEAD_COLLIDE";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	lightpresetname = "AURA";
	sfxid = "MFX_DESTROYUNDEAD_COLLIDE";
	sfxisambient = 1;
};

instance SPELLFX_DESTROYUNDEAD_SENDPERCEPTION(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01";
	visname_s = "MFX_DESTROYUNDEAD_COLLIDE";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	lightpresetname = "AURA";
	sendassessmagic = 1;
	sfxid = "MFX_DESTROYUNDEAD_COLLIDE";
	sfxisambient = 1;
};

instance SPELLFX_WINDFIST(CFX_BASE_PROTO)
{
	visname_s = "MFX_WINDFIST_INIT";
	vissize_s = "1 1";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjnumkeys = 7;
	emtrjnumkeysvar = 3;
	emtrjangleelevvar = 5;
	emtrjangleheadvar = 20;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 200000;
	emtrjtargetrange = 100;
	emtrjtargetelev = 1;
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldyn_s = "spellFX_Windfist_Target";
	emfxinvestorigin_s = "spellFX_Windfist_Invest";
};

instance SPELLFX_WINDFIST_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	emcheckcollision = 0;
};

instance SPELLFX_WINDFIST_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Windfist_INVESTBLAST";
};

instance SPELLFX_WINDFIST_KEY_INVEST_2(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Windfist_INVESTBLAST";
};

instance SPELLFX_WINDFIST_KEY_INVEST_3(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Windfist_INVESTBLAST";
};

instance SPELLFX_WINDFIST_KEY_INVEST_4(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "spellFX_Windfist_INVESTBLAST";
};

instance SPELLFX_WINDFIST_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "simpleglow.tga";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	emcheckcollision = 1;
	emcreatefxid = "spellFX_WINDFIST_CAST";
};

instance SPELLFX_WINDFIST_INVEST(CFX_BASE_PROTO)
{
	visname_s = "MFX_WINDFIST_INVEST";
	sfxid = "MFX_WINDFIST_INVEST";
	sfxisambient = 1;
};

instance SPELLFX_WINDFIST_INVESTBLAST(CFX_BASE_PROTO)
{
	visname_s = "MFX_WINDFIST_INVEST_BLAST";
	sfxid = "MFX_WINDFIST_INVESBLASTT";
	sfxisambient = 1;
};

instance SPELLFX_WINDFIST_CAST(CFX_BASE_PROTO)
{
	visname_s = "MFX_WINDFIST_Cast";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	sfxid = "MFX_Windfist_Cast";
	sfxisambient = 1;
};

instance SPELLFX_WINDFIST_TARGET(CFX_BASE_PROTO)
{
	visname_s = "MFX_WINDFIST_COLLIDE";
	sendassessmagic = 1;
};

instance SPELLFX_STORMFIST(CFX_BASE_PROTO)
{
	visname_s = "MFX_WINDFIST_INIT";
	vissize_s = "1 1";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjnumkeys = 7;
	emtrjnumkeysvar = 3;
	emtrjangleelevvar = 5;
	emtrjangleheadvar = 20;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 200000;
	emtrjtargetrange = 100;
	emtrjtargetelev = 1;
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldyn_s = "spellFX_Windfist_Target";
	emfxinvestorigin_s = "spellFX_Windfist_Invest";
};

instance SPELLFX_STORMFIST_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	emcheckcollision = 0;
};

instance SPELLFX_STORMFIST_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_STORMFIST_CAST";
	emcheckcollision = 1;
	sfxid = "MFX_Stormfist_Cast";
	sfxisambient = 1;
};

instance SPELLFX_STORMFIST_INVEST(CFX_BASE_PROTO)
{
	visname_s = "MFX_WINDFIST_INVEST";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
};

instance SPELLFX_TELEKINESIS(CFX_BASE_PROTO)
{
	visname_s = "MFX_Telekinesis_INIT";
	emtrjmode_s = "TARGET";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjnumkeys = 2;
	emtrjnumkeysvar = 1;
	emtrjangleelevvar = 2;
	emtrjangleheadvar = 0;
	emtrjeasefunc_s = "LINEAR";
	emtrjloopmode_s = "HALT";
	emtrjdynupdatedelay = 0;
	emfxinvestorigin_s = "spellFX_Telekinesis_ORIGIN";
	emtrjtargetrange = 0;
	emtrjtargetelev = 0;
};

instance SPELLFX_TELEKINESIS_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Telekinesis_INIT";
	emtrjeasevel = 0.01;
};

instance SPELLFX_TELEKINESIS_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Telekinesis_TARGET";
	emtrjeasevel = 2000;
	sfxid = "MFX_TELEKINESIS_STARTINVEST";
	sfxisambient = 1;
};

instance SPELLFX_TELEKINESIS_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_Telekinesis_TargetEnd";
};

instance SPELLFX_TELEKINESIS_ORIGIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_Telekinesis_BRIDGE";
	emtrjmode_s = "TARGET LINE";
	emtrjeasevel = 0.001;
	emtrjoriginnode = "BIP01 R Hand";
	emtrjdynupdatedelay = 0;
	lightpresetname = "AURA";
	sfxid = "MFX_TELEKINESIS_INVEST";
	sfxisambient = 1;
};

instance SPELLFX_CHARM(CFX_BASE_PROTO)
{
	visname_s = "MFX_CHARM_INIT";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjmode_s = "fixed";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0;
};

instance SPELLFX_CHARM_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_CHARM_ORIGIN";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "MFX_Charm_Cast";
	sfxisambient = 1;
};

instance SPELLFX_SLEEP(CFX_BASE_PROTO)
{
	visname_s = "MFX_SLEEP_INIT";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjmode_s = "fixed";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0;
};

instance SPELLFX_SLEEP_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_SLEEP_INIT";
};

instance SPELLFX_SLEEP_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_SLEEP_ORIGIN";
	emtrjeasevel = 1400;
	sfxid = "MFX_Sleep_Cast";
};

instance SPELLFX_SLEEP_ORIGIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_SLEEP_ORIGIN";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjdynupdatedelay = 0;
};

instance SPELLFX_SLEEP_TARGET(CFX_BASE_PROTO)
{
	lightpresetname = "AURA";
	visname_s = "MFX_SLEEP_TARGET";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	emtrjdynupdatedelay = 0;
};

instance SPELLFX_PYROKINESIS(CFX_BASE_PROTO)
{
	visname_s = "MFX_Pyrokinesis_INIT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 HEAD";
	emtrjnumkeys = 1;
	emtrjnumkeysvar = 1;
	emtrjangleelevvar = 15;
	emtrjangleheadvar = 0;
	emtrjdynupdatedelay = 0;
	emfxinvesttarget_s = "spellFX_Pyrokinesis_target";
	emtrjtargetrange = 0;
	emtrjtargetelev = 0;
};

instance SPELLFX_PYROKINESIS_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
};

instance SPELLFX_PYROKINESIS_TARGET(CFX_BASE_PROTO)
{
	visname_s = "MFX_Pyrokinesis_TARGET";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 HEAD";
	lightpresetname = "FIRESMALL";
	emtrjtargetrange = 0;
	emtrjtargetelev = 0;
	sendassessmagic = 1;
	emtrjdynupdatedelay = 0.01;
	sfxid = "MFX_Pyrokinesis_target";
	sfxisambient = 1;
};

instance SPELLFX_CONTROL(CFX_BASE_PROTO)
{
	visname_s = "MFX_CONTROL_INIT";
	vissize_s = "1 1";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01 HEAD";
	emtrjloopmode_s = "none";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0;
	emtrjtargetrange = 0;
	emtrjtargetelev = 0;
	emfxinvesttarget_s = "spellFX_Control_TARGET";
	emfxinvestorigin_s = "spellFX_Control_BRIDGE";
};

instance SPELLFX_CONTROL_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	visname_s = "simpleglow.tga";
	sfxid = "MFX_CONTROL_STARTINVEST";
	sfxisambient = 1;
};

instance SPELLFX_CONTROL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	pfx_ppsisloopingchg = 1;
	emcreatefxid = "CONTROL_CASTBLEND";
	sfxid = "MFX_CONTROL_CAST";
	sfxisambient = 1;
};

instance SPELLFX_CONTROL_TARGET(CFX_BASE_PROTO)
{
	visname_s = "MFX_CONTROL_TARGET";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01 HEAD";
	emtrjtargetrange = 0;
	emtrjtargetelev = 0;
	sendassessmagic = 1;
};

instance SPELLFX_CONTROL_BRIDGE(CFX_BASE_PROTO)
{
	visname_s = "MFX_CONTROL_BRIDGE";
	emtrjmode_s = "TARGET LINE";
	emtrjoriginnode = "BIP01 HEAD";
	emtrjtargetnode = "BIP01 HEAD";
	emtrjtargetrange = 0;
	emtrjtargetelev = 0;
	emfxcreate_s = "spellFX_Control_ORIGIN";
	sfxid = "MFX_CONTROL_INVEST";
	sfxisambient = 1;
};

instance SPELLFX_CONTROL_BRIDGE_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 0.01;
};

instance SPELLFX_FEAR(CFX_BASE_PROTO)
{
	visname_s = "MFX_FEAR_INIT";
	emtrjmode_s = "FIXED";
	emtrjeasefunc_s = "linear";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjdynupdatedelay = 10000;
};

instance SPELLFX_FEAR_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 0;
};

instance SPELLFX_FEAR_KEY_INVEST_1(C_PARTICLEFXEMITKEY)
{
	emcreatefxid = "FX_EarthQuake";
};

instance SPELLFX_FEAR_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_FEAR_ORIGIN";
	emcreatefxid = "spellFX_Fear_Face";
};

instance SPELLFX_FEAR_FACE(CFX_BASE_PROTO)
{
	emtrjmode_s = "FIXED";
	emtrjeasefunc_s = "linear";
	emtrjoriginnode = "BIP01 HEAD";
	emtrjdynupdatedelay = 10000;
	lightpresetname = "REDAMBIENCE";
	sfxid = "MFX_FEAR_CAST";
	sfxisambient = 1;
	visname_s = "MFX_FEAR_FACE";
	emfxcreate_s = "spellFX_Fear_WAVE";
};

instance SPELLFX_FEAR_WAVE(CFX_BASE_PROTO)
{
	visname_s = "MFX_FEAR_WAVE";
	emtrjoriginnode = "BIP01";
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldyn_s = "spellFX_Fear_SENDPERCEPTION";
	emfxcolldynalign_s = "COLLISIONNORMAL";
	emcheckcollision = 1;
};

instance SPELLFX_FEAR_SENDPERCEPTION(CFX_BASE_PROTO)
{
	visname_s = "";
	sfxid = "HAMMER";
	sendassessmagic = 1;
};

instance SPELLFX_BERZERK(CFX_BASE_PROTO)
{
	visname_s = "MFX_BERZERK_INIT";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjmode_s = "fixed";
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 0;
};

instance SPELLFX_BERZERK_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "MFX_BERZERK_ORIGIN";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	sfxid = "MFX_Berzerk_Cast";
	sfxisambient = 1;
};

instance SPELLFX_BERZERK_ORIGIN(CFX_BASE_PROTO)
{
	visname_s = "MFX_CHARM_ORIGIN";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjdynupdatedelay = 0;
};

instance SPELLFX_BREATHOFDEATH(CFX_BASE_PROTO)
{
	visname_s = "MFX_BREATHOFDEATH_INIT";
	vissize_s = "1 1";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjnumkeys = 7;
	emtrjnumkeysvar = 3;
	emtrjangleelevvar = 5;
	emtrjangleheadvar = 20;
	emtrjloopmode_s = "NONE";
	emtrjeasefunc_s = "LINEAR";
	emtrjdynupdatedelay = 200000;
	emtrjtargetrange = 100;
	emtrjtargetelev = 1;
	emactioncolldyn_s = "CREATEONCE";
	emfxcolldyn_s = "spellFX_BreathOfDeath_Target";
	emfxinvestorigin_s = "spellFX_BreathOfDeath_Invest";
};

instance SPELLFX_BREATHOFDEATH_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	emcheckcollision = 0;
};

instance SPELLFX_BREATHOFDEATH_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	visname_s = "simpleglow.tga";
	emtrjmode_s = "TARGET";
	emtrjeasevel = 1400;
	emcheckcollision = 1;
	emcreatefxid = "spellFX_BreathOfDeath_CAST";
};

instance SPELLFX_BREATHOFDEATH_INVEST(CFX_BASE_PROTO)
{
	visname_s = "MFX_BREATHOFDEATH_INVEST";
	sfxid = "MFX_BREATHOFDEATH_INVEST";
	sfxisambient = 1;
};

instance SPELLFX_BREATHOFDEATH_CAST(CFX_BASE_PROTO)
{
	visname_s = "MFX_BREATHOFDEATH_Cast";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	sfxid = "MFX_BreathOfDeath_Cast";
	sfxisambient = 1;
};

instance SPELLFX_BREATHOFDEATH_TARGET(CFX_BASE_PROTO)
{
	visname_s = "MFX_BREATHOFDEATH_COLLIDE";
	sfxid = "MFX_BREATHOFDEATH_TARGET";
	sfxisambient = 1;
	sendassessmagic = 1;
};

instance SPELLFX_SHRINK(CFX_BASE_PROTO)
{
	visname_s = "MFX_SHRINK_INIT";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "ZS_RIGHTHAND";
	emtrjtargetnode = "BIP01";
	emtrjnumkeys = 5;
	emtrjnumkeysvar = 1;
	emtrjangleelevvar = 15;
	emtrjangleheadvar = 0;
	emtrjeasefunc_s = "LINEAR";
	emtrjloopmode_s = "HALT";
	emtrjdynupdatedelay = 0;
	emtrjtargetrange = 0;
	emtrjtargetelev = 0;
	lightpresetname = "AURA";
	emfxinvestorigin_s = "spellFX_SHRINK_ORIGIN";
};

instance SPELLFX_SHRINK_KEY_OPEN(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 0.01;
	lightrange = 0.01;
};

instance SPELLFX_SHRINK_KEY_INIT(C_PARTICLEFXEMITKEY)
{
	emtrjeasevel = 0.01;
	lightrange = 0.01;
};

instance SPELLFX_SHRINK_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emtrjmode_s = "TARGET LINE";
	visname_s = "MFX_SHRINK_TARGET";
	emtrjeasevel = 6000;
	lightrange = 200;
	sfxid = "MFX_SHRINK_CAST";
	sfxisambient = 1;
};

instance SPELLFX_SHRINK_ORIGIN(CFX_BASE_PROTO)
{
	emfxcreatedowntrj = 0;
	visname_s = "";
	emtrjmode_s = "FIXED";
	emtrjoriginnode = "BIP01";
	sfxid = "MFX_SHRINK_INVEST";
	sfxisambient = 1;
};

instance VOB_BURN(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 FIRE";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreate_s = "VOB_BURN_CHILD1";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	lightpresetname = "FIRESMALL";
	sfxid = "MFX_Firespell_Humanburn";
};

instance VOB_BURN_CHILD1(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 R UPPERARM";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreate_s = "VOB_BURN_CHILD2";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_BURN_CHILD2(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 L UPPERARM";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreate_s = "VOB_BURN_CHILD3";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_BURN_CHILD3(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 L HAND";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreate_s = "VOB_BURN_CHILD4";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_BURN_CHILD4(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 R HAND";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreate_s = "VOB_BURN_CHILD5";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_BURN_CHILD5(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 L FOOT";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreate_s = "VOB_BURN_CHILD6";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance VOB_BURN_CHILD6(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 R FOOT";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreate_s = "spellFX_Firespell_HUMANSMOKE";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
};

instance SPELLFX_FIRESPELL_HUMANBURN(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 FIRE";
	visname_s = "MFX_Firespell_HUMANBURN";
	emfxcreatedowntrj = 1;
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	emadjustshptoorigin = 1;
};

instance SPELLFX_FIRESPELL_HUMANSMOKE(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 FIRE";
	visname_s = "MFX_Firespell_HUMANSMOKE";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	emadjustshptoorigin = 1;
};

instance FX_ELECTRIC(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 Head";
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Lightning_Target";
	emfxcreate_s = "spellFX_Thunderspell_TARGET_CHILD1";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_LIGHTNING_TARGET(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 Head";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sfxid = "MFX_Lightning_Target";
	emfxcreate_s = "spellFX_Thunderspell_TARGET_CHILD1";
};

instance SPELLFX_THUNDERSPELL_TARGET(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 Head";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sendassessmagic = 1;
	sfxid = "MFX_Lightning_Target";
	emfxcreate_s = "spellFX_Thunderspell_TARGET_CHILD1";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD1(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 R UPPERARM";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_TARGET_CHILD2";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD2(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 L UPPERARM";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_TARGET_CHILD3";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD3(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 L HAND";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_TARGET_CHILD4";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD4(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 R HAND";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_TARGET_CHILD5";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD5(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 L FOOT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_TARGET_CHILD6";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD6(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 R FOOT";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_TARGET_CHILD7";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD7(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 L THIGH";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_TARGET_CHILD8";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD8(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 R THIGH";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_TARGET_CHILD9";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD9(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 L CALF";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_TARGET_CHILD10";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD10(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01 R CALF";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderspell_TARGET_CHILD11";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_THUNDERSPELL_TARGET_CHILD11(CFX_BASE_PROTO)
{
	visname_s = "MFX_Thunderball_Target";
	emtrjoriginnode = "BIP01";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	emfxcreate_s = "spellFX_Thunderball_COLLIDE";
	emfxcreatedowntrj = 1;
};

instance SPELLFX_ICESPELL_TARGET(CFX_BASE_PROTO)
{
	visname_s = "MFX_IceSpell_Target";
	visalpha = 1;
	emtrjmode_s = "FIXED";
	sendassessmagic = 1;
	emadjustshptoorigin = 1;
	sfxid = "MFX_Icecube_Target";
};

instance FX_EARTHQUAKE(CFX_BASE_PROTO)
{
	visname_s = "earthquake.eqk";
	userstring[0] = "1000";
	userstring[1] = "5";
	userstring[2] = "5 5 5";
	sfxid = "MFX_EarthQuake";
	sfxisambient = 1;
};

instance CONTROL_LEAVERANGEFX(CFX_BASE_PROTO)
{
	visname_s = "screenblend.scx";
	userstring[0] = "1";
	userstring[1] = "0 100 0 100";
	userstring[2] = "0.5";
};

instance CONTROL_CASTBLEND(CFX_BASE_PROTO)
{
	visname_s = "screenblend.scx";
	userstring[0] = "0.5";
	userstring[1] = "255 255 255 255";
	userstring[2] = "0.5";
	emfxlifespan = 0.6;
};

instance TRANSFORM_CASTBLEND(CFX_BASE_PROTO)
{
	visname_s = "screenblend.scx";
	userstring[0] = "0.5";
	userstring[1] = "255 0 0 255";
	userstring[2] = "0.5";
	emfxlifespan = 0.6;
};

instance TRANSFORM_NOPLACEFX(CFX_BASE_PROTO)
{
	visname_s = "screenblend.scx";
	userstring[0] = "1";
	userstring[1] = "255 0 0 100";
	userstring[2] = "1.5";
	emfxlifespan = 0.6;
};

instance FX_COLL_SMALL(CFX_BASE_PROTO)
{
	visname_s = "coldummy.3ds";
	emactioncollstat_s = "NORESP";
	emactioncolldyn_s = "NORESP CREATEONCE";
	visalpha = 0;
};

instance FX_COLL_SMALL_KEY_CAST(C_PARTICLEFXEMITKEY)
{
	emcheckcollision = 1;
};

instance BARRIERE_PC_SHOOT(CFX_BASE_PROTO)
{
	visname_s = "Blast";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	sfxid = "MFX_Lightning_Origin";
};

instance BARRIERE_PC_WARNING(CFX_BASE_PROTO)
{
	emtrjoriginnode = "BIP01 TOE";
	visname_s = "MFX_lightning_target";
	emtrjmode_s = "FIXED";
	emtrjdynupdatedelay = 0;
	lightpresetname = "AURA";
};

