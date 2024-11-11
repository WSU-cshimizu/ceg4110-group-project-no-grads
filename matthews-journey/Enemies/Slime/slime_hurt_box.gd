class_name SlimeHurtBox extends HurtBox

@onready var slime: Slime = $".."

func take_attack(attack: Attack):
	knockback(attack.direction, attack.knockback)
	slime.health -= attack.damage
	if slime.health <= 0:
		slime.queue_free()

func knockback(direction: Vector2, force: int) -> void:
	slime.knockback_velocity = (slime.global_position - direction) * force
	slime.knocked_back = true
	await get_tree().create_timer(0.1).timeout
	slime.knocked_back = false
