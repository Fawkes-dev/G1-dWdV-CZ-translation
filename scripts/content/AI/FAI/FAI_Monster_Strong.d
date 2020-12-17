instance FA_ENEMY_PREHIT_26(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_STRAFE;
	move[3] = MOVE_JUMPBACK;
};

instance FA_ENEMY_STORMPREHIT_26(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_STRAFE;
};

instance FA_MY_W_RUNTO_26(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_STRAFE;
};

instance FA_MY_W_STRAFE_26(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_STRAFE;
};

instance FA_MY_W_FOCUS_26(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_STRAFE;
	move[3] = MOVE_ATTACK;
};

instance FA_MY_W_NOFOCUS_26(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_RUNTO_26(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_RUN;
	move[3] = MOVE_ATTACK;
};

instance FA_MY_G_STRAFE_26(C_FIGHTAI)
{
};

instance FA_MY_G_FOCUS_26(C_FIGHTAI)
{
	move[0] = MOVE_WAIT;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_RUN;
};

instance FA_MY_FK_FOCUS_26(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_26(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

