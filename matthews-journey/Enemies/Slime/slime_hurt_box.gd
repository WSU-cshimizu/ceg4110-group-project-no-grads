class_name SlimeHurtBox extends HurtBox

@onready var slime: Slime = $".."

func take_attack(attack: Attack):
	slime.health -= attack.damage
	if slime.health <= 0:
		slime.queue_free()
