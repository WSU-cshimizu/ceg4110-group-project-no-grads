class_name Enemy
extends CharacterBody2D

## XP Variables
#signal xpChanged
#var xp: int = 0
#
#func collect_xp(amount: int):
	#xp += amount
	#xpChanged.emit(xp)
