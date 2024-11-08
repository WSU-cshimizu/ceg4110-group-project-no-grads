class_name SwordHitBox extends HitBox

@onready var player: Player = $"../.."

func _on_area_entered(area: Area2D) -> void:
	if area is HurtBox:
		var attack = Attack.new()
		attack.damage = player.damage
		area.take_attack(attack)
