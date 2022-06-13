instance FA_ENEMY_PREHIT_18(C_FIGHTAI)
{
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_WAIT;
};

instance FA_ENEMY_STORMPREHIT_18(C_FIGHTAI)
{
	move[0] = MOVE_STRAFE;
};

instance FA_MY_W_RUNTO_18(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
};

instance FA_MY_W_STRAFE_18(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT;
};

instance FA_MY_W_FOCUS_18(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT;
};

instance FA_MY_W_NOFOCUS_18(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_RUNTO_18(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
	move[1] = MOVE_ATTACK;
};

instance FA_MY_G_STRAFE_18(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_TURN;
};

instance FA_MY_G_FOCUS_18(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_FK_FOCUS_18(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_18(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

