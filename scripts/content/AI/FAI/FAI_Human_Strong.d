instance FA_ENEMY_PREHIT_3(C_FIGHTAI)
{
	move[0] = MOVE_PARADE;
	move[1] = MOVE_JUMPBACK;
	move[2] = MOVE_SIDEATTACK;
	move[3] = MOVE_WAIT;
};

instance FA_ENEMY_STORMPREHIT_3(C_FIGHTAI)
{
	move[0] = MOVE_PARADE;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_ATTACK;
	move[3] = MOVE_ATTACK;
	move[4] = MOVE_SIDEATTACK;
	move[5] = MOVE_SIDEATTACK;
};

instance FA_MY_W_COMBO_3(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_FRONTATTACK;
};

instance FA_MY_W_RUNTO_3(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_STRAFE_3(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_W_FOCUS_3(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_ATTACK;
	move[2] = MOVE_TRIPLEATTACK;
	move[3] = MOVE_FRONTATTACK;
	move[4] = MOVE_STRAFE;
};

instance FA_MY_W_NOFOCUS_3(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_COMBO_3(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_RUNTO_3(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

instance FA_MY_G_STRAFE_3(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_TURN;
};

instance FA_MY_G_FOCUS_3(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_FK_FOCUS_3(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[0] = MOVE_RUN;
};

instance FA_MY_G_FK_NOFOCUS_3(C_FIGHTAI)
{
	move[0] = MOVE_RUN;
};

instance FA_MY_FK_FOCUS_FAR_3(C_FIGHTAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_WAIT;
	move[5] = MOVE_WAIT;
};

instance FA_MY_FK_NOFOCUS_FAR_3(C_FIGHTAI)
{
	move[0] = MOVE_TURN;
};

