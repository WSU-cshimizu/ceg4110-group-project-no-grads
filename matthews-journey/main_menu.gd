extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_begin_game_pressed() -> void:
	get_tree().change_scene("res://game.tscn")
	pass # Replace with function body.



func _on_controls_pressed() -> void:
	pass # Replace with function body.
