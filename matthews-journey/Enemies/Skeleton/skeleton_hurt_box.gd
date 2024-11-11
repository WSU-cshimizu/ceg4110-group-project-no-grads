class_name SkeletonHurtBox extends HurtBox

@onready var skeleton: Skeleton = $".."

func take_attack(attack: Attack):
	knockback(attack.direction, attack.knockback)
	skeleton.health -= attack.damage
	if skeleton.health <= 0:
		skeleton.queue_free()

func knockback(direction: Vector2, force: int) -> void:
	skeleton.knockback_velocity = (skeleton.global_position - direction) * force
	skeleton.knocked_back = true
	await get_tree().create_timer(0.1).timeout
	skeleton.knocked_back = false
