class_name PlayerHurtBox extends HurtBox

@onready var player: Player = $"../.."

func take_attack(attack: Attack):
	print("Player took " + str(attack.damage) + " damage!")
	player.take_damage(attack.damage)
	# TODO knockback in player function

func _on_area_entered(area: Area2D) -> void:
	if area is Collectable:
		area.collect()
