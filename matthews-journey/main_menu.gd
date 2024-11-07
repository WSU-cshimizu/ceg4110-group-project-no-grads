extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_begin_game_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")


func _on_controls_pressed() -> void:
	var controls = load("res://controls_menu.tscn").instance()
	get_tree().current_scene.add_child(controls)


func _on_quit_game_pressed() -> void:
	get_tree().quit()
