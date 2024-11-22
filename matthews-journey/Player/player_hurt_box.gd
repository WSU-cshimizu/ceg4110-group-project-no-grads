class_name PlayerHurtBox extends HurtBox

@onready var player: Player = $"../.."

func take_attack(attack: Attack):
	knockback(attack.direction, attack.knockback)
	print("Player took " + str(attack.damage) + " damage!")
	player.take_damage(attack.damage)

func _on_area_entered(area: Area2D) -> void:
	if area is Collectable:
		area.collect()
		
func _on_area_exited(area: Area2D) -> void:
	pass


func knockback(direction: Vector2, force: int) -> void:
	player.knockback_velocity = (player.global_position - direction) * force
	player.knocked_back = true
	await get_tree().create_timer(0.1).timeout
	player.knocked_back = false
