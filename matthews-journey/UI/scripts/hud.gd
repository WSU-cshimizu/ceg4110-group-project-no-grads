extends CanvasLayer

static var image = load('res://assets/UI/health-heart.png')
#VR
@onready var player: Player = $"../Player"
@onready var heartsContainer: HBoxContainer = $MarginContainer/VBoxContainer/heartsContainer
@onready var coinLabel = $MarginContainer/VBoxContainer/coinsContainer/Sprite2D/coinLabel 
@onready var xpLabel =  $MarginContainer/VBoxContainer/xpContainer/Sprite2D/xpLabel


func _ready(): #VR
	player = get_tree().get_first_node_in_group("player")
	heartsContainer.setMaxHearts(player.maxHealth)
	heartsContainer.updateHearts(player.currentHealth)
	player.healthChanged.connect(heartsContainer.updateHearts)
	player.coinsChanged.connect(_on_coins_changed)
	player.xpChanged.connect(_on_xp_changed)
	
func _on_coins_changed(new_amount: int):
	coinLabel.text = str(new_amount)
	if new_amount >= 500:
		$MarginContainer/VBoxContainer/coinsContainer/Sprite2D.frame = 21
	elif new_amount >= 200:
		$MarginContainer/VBoxContainer/coinsContainer/Sprite2D.frame = 3  
	elif new_amount >= 100:
		$MarginContainer/VBoxContainer/coinsContainer/Sprite2D.frame = 12 
	elif new_amount > 30:
		$MarginContainer/VBoxContainer/coinsContainer/Sprite2D.frame = 0  
	else:
		$MarginContainer/VBoxContainer/coinsContainer/Sprite2D.frame = 6  
	
func _on_xp_changed(new_amount: int):
	xpLabel.text = str(new_amount)
	
func _process(delta: float) -> void:
	pass
	
