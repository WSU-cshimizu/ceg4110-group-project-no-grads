class_name SlimeHitBox extends HitBox

@onready var slime: Slime = $".."

func _on_area_entered(area: Area2D) -> void:
	if area is HurtBox and area.owner is Player:
		var attack = Attack.new()
		attack.damage = slime.damage
		print("Slime Attacked!")
		area.take_attack(attack)
