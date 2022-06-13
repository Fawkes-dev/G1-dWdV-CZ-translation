func void B_Story_AccessToXardas()
{
	CreateInvItem(hero,ItArRuneTeleport3);
	B_LogEntry(CH4_FindXardas,"Předal jsem strážci démonů již tři srdce golemů. Výměnou jsem dostal magickou runu teleportace. Uvidíme, kdy přijde vhod.");
	B_GiveXP(XP_DeliveredGolemhearts);
	FindGolemHearts = 4;
};

