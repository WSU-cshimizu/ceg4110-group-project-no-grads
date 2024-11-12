class_name FireHitBox extends HitBox

@onready var campfire: StaticBody2D = $".."

func _on_area_entered(area: Area2D) -> void:
	if area is HurtBox and area.owner is Player:
		var attack = Attack.new()
		attack.damage = 1
		attack.direction = campfire.global_position
		attack.knockback = 10
		print("Player burned by fire")
		area.take_attack(attack)
