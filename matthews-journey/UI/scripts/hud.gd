extends CanvasLayer

static var image = load('res://assets/UI/health-heart.png')
#VR
@onready var player: Player = $"../Player"
@onready var heartsContainer: HBoxContainer = $MarginContainer/heartsContainer

func _ready(): #VR
	heartsContainer.setMaxHearts(player.maxHealth)
	heartsContainer.updateHearts(player.currentHealth)
	player.healthChanged.connect(heartsContainer.updateHearts)
		
func _process(delta: float) -> void:
	pass
