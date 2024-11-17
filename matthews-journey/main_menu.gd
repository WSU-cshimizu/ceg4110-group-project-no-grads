extends Control

@onready var main_menu_music: AudioStreamPlayer2D = $MainMenuMusic
@onready var begin_game: Button = $VBoxContainer/BeginGame
@onready var controls: Button = $VBoxContainer/Controls
@onready var quit_game: Button = $VBoxContainer/QuitGame


func _ready() -> void:
	main_menu_music.playing = true


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
