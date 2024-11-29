extends Area2D

var chatting: bool = false
var done_talking: bool = false
@onready var chat_icon: Sprite2D = $ChatIcon
@onready var player: Player = %Player
@onready var metDolbz: bool = false


func _on_body_entered(body: PhysicsBody2D) -> void:
	if body is Player:
		chatting = true
		chat_icon.visible = true
	
func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		chatting = false
		chat_icon.visible = false
		done_talking = false
		
func _input(event: InputEvent) -> void:
	if chatting and not done_talking and event.is_action_pressed("dialogic_default_action"):
		done_talking = true
		var dialog = Dialogic.start("tent_guard")
	

	
