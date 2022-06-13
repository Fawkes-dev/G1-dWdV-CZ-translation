instance FA_ENEMY_PREHIT_22(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_STRAFE;
	move[2] = MOVE_STRAFE;
};

instance FA_ENEMY_STORMPREHIT_22(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
};

instance FA_MY_W_RUNTO_22(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_STRAFE;
};

instance FA_MY_W_STRAFE_22(C_FIGHTAI)
{
	move[0] = MOVE_STRAFE;
};

instance FA_MY_W_FOCUS_22(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_ATTACK;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_ATTACK;
	move[4] = MOVE_ATTACK;
};

instance FA_MY_W_NOFOCUS_22(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_RUNTO_22(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_STRAFE_22(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
	move[1] = MOVE_WAIT;
};

instance FA_MY_G_FOCUS_22(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_FK_FOCUS_22(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_22(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

