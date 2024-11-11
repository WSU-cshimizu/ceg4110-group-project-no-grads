class_name SkeletonHitBox extends HitBox

@onready var skeleton: Skeleton = $".."

func _on_area_entered(area: Area2D) -> void:
	if area is HurtBox and area.owner is Player:
		var attack = Attack.new()
		attack.damage = skeleton.damage
		attack.direction = skeleton.global_position
		attack.knockback = skeleton.knockback_force
		print("Skeleton Attacked")
		area.take_attack(attack)
		
