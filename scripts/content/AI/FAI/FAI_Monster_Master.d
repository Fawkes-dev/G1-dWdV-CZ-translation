instance FA_ENEMY_PREHIT_1(C_FIGHTAI)
{
};

instance FA_ENEMY_STORMPREHIT_1(C_FIGHTAI)
{
};

instance FA_MY_W_RUNTO_1(C_FIGHTAI)
{
};

instance FA_MY_W_STRAFE_1(C_FIGHTAI)
{
};

instance FA_MY_W_FOCUS_1(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_WAIT;
	move[5] = MOVE_ATTACK;
};

instance FA_MY_W_NOFOCUS_1(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_RUNTO_1(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_STRAFE_1(C_FIGHTAI)
{
};

instance FA_MY_G_FOCUS_1(C_FIGHTAI)
{
};

instance FA_MY_FK_FOCUS_1(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_1(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

