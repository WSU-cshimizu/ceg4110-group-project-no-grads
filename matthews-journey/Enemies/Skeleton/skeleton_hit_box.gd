class_name SkeletonHitBox extends HitBox

@onready var skeleton: Skeleton = $".."

func _on_area_entered(area: Area2D) -> void:
	if area is HurtBox:
		var attack = Attack.new()
		attack.damage = skeleton.damage
		print("Skeleton Attacked")
		area.take_attack(attack)
		
