extends Control

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
