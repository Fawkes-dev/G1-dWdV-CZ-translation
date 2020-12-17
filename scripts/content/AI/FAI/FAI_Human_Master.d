instance FA_ENEMY_PREHIT_4(C_FIGHTAI)
{
	move[0] = MOVE_PARADE;
	move[1] = MOVE_STRAFE;
	move[1] = MOVE_SIDEATTACK;
};

instance FA_ENEMY_STORMPREHIT_4(C_FIGHTAI)
{
	move[0] = MOVE_STRAFE;
};

instance FA_MY_W_COMBO_4(C_FIGHTAI)
{
	move[0] = MOVE_WHIRLATTACK;
};

instance FA_MY_W_RUNTO_4(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_W_STRAFE_4(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_FOCUS_4(C_FIGHTAI)
{
	move[0] = MOVE_TRIPLEATTACK;
	move[1] = MOVE_MASTERATTACK;
	move[2] = MOVE_WHIRLATTACK;
};

instance FA_MY_W_NOFOCUS_4(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_COMBO_4(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_RUNTO_4(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_TURN;
};

instance FA_MY_G_STRAFE_4(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_TURN;
};

instance FA_MY_G_FOCUS_4(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_FK_FOCUS_4(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_4(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_FK_FOCUS_FAR_4(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_WAIT;
	move[5] = MOVE_WAIT;
};

instance FA_MY_FK_NOFOCUS_FAR_4(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

