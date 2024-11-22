extends Control
@onready var begin_game: Button = $BeginGame


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play("MainMenu")
	begin_game.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_begin_game_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")
	
func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/controls_menu.tscn")

func _on_quit_game_pressed() -> void:
	get_tree().quit()
