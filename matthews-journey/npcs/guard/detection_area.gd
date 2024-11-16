extends Area2D

var chatting: bool = false
@onready var chat_icon: Sprite2D = $ChatIcon

func _on_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		chatting = true
		chat_icon.visible = true
	
func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		chatting = false
		chat_icon.visible = false
		
func _input(event: InputEvent) -> void:
	if chatting and event.is_action_pressed("interact"):
		Dialogic.start("tent_guard")
