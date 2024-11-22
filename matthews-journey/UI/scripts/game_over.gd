extends Control

func _ready() -> void:
	MusicManager.play("GameOver")

func _process(delta):
	if Input.is_action_just_pressed("attack"):
		get_tree().change_scene_to_file("res://UI/main_menu.tscn")
