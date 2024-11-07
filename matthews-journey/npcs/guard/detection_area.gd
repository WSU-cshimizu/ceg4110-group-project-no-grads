extends Area2D

func _on_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		Dialogic.start("tent_guard")
		print(body)
		print("HALT DO NOT ENTER")
	
