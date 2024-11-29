extends CharacterBody2D
@onready var player: Player = %Player
@onready var water: AudioStreamPlayer2D = $WaterHeal
@onready var bigWater: AudioStreamPlayer2D = $BigWaterHeal
@onready var heal: AudioStreamPlayer2D = $Heal

func _ready() -> void:
	Dialogic.signal_event.connect(DolbzSignal)


func DolbzSignal(arg: String):
	print("Player is about to " + arg)
	if arg == "get_zapped" and player:
		player.take_damage(player.currentHealth)
	elif arg == "get_healed_big" and player:
		player.currentHealth += 3
		player.healthChanged.emit(player.currentHealth)
		bigWater.play()
		heal.play()
	elif arg == "get_healed_small" and player:
		player.currentHealth += 1
		player.healthChanged.emit(player.currentHealth)
		water.play()
		heal.play()
	else:
		print("Could not damage.")

func setHealth():
	Dialogic.VAR.set_variable("currentHealth", player.currentHealth)
	Dialogic.VAR.set_variable("maxHealth", player.maxHealth)
