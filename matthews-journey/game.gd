extends Node2D
const HUD = preload("res://hud.tscn")

func _ready() -> void:
	MusicManager.play("Town")
	var game_hud = HUD.instantiate() as CanvasLayer
	add_child(game_hud)
