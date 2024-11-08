class_name SkeletonHurtBox extends HurtBox

@onready var skeleton: Skeleton = $".."

func take_attack(attack: Attack):
	skeleton.health -= attack.damage
	if skeleton.health <= 0:
		skeleton.queue_free()
