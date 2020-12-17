instance FA_ENEMY_PREHIT_11(C_FIGHTAI)
{
	move[0] = MOVE_STRAFE;
	move[1] = MOVE_ATTACK;
};

instance FA_ENEMY_STORMPREHIT_11(C_FIGHTAI)
{
	move[0] = MOVE_STRAFE;
};

instance FA_MY_W_RUNTO_11(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_WAIT;
};

instance FA_MY_W_STRAFE_11(C_FIGHTAI)
{
};

instance FA_MY_W_FOCUS_11(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_ATTACK;
};

instance FA_MY_W_NOFOCUS_11(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_RUNTO_11(C_FIGHTAI)
{
};

instance FA_MY_G_STRAFE_11(C_FIGHTAI)
{
};

instance FA_MY_G_FOCUS_11(C_FIGHTAI)
{
};

instance FA_MY_FK_FOCUS_11(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_11(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

