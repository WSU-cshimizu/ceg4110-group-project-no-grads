extends Node2D

# Music
@onready var main_menu: AudioStreamPlayer2D = $Music/MainMenu
@onready var game_over: AudioStreamPlayer2D = $Music/GameOver
@onready var town: AudioStreamPlayer2D = $Music/Town

# SFX
@onready var slime: AudioStreamPlayer2D = $SFX/slime
@onready var skeleton: AudioStreamPlayer2D = $SFX/skeleton
@onready var player_hurt: AudioStreamPlayer2D = $SFX/player_hurt
@onready var player_died: AudioStreamPlayer2D = $SFX/player_died
@onready var level_up: AudioStreamPlayer2D = $SFX/level_up

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicManager.play("MainMenu")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play(song: String):
	_stop_all()
	if song == "MainMenu":
		main_menu.play()
	elif song == "Town":
		town.play()
	elif song == "GameOver":
		game_over.play()

func _stop_all():
	game_over.stop()
	town.stop()
	main_menu.stop()
	
func sfx(sound: String):
	if sound == "slime":
		slime.play()
	elif sound == "skeleton":
		skeleton.play()
	elif sound == "player_hurt":
		player_hurt.play()
	elif sound == "player_died":
		player_died.play()
	elif sound == "level_up":
		_stop_all()
		level_up.play()
		await level_up.finished
		town.play()
		
