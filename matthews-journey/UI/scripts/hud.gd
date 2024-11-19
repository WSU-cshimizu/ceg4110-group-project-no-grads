class_name Hud extends CanvasLayer

static var image = load('res://assets/UI/health-heart.png')
#VR
@onready var player: Player = $"../Player"
@onready var heartsContainer: HBoxContainer = $MarginContainer/VBoxContainer/heartsContainer
@onready var coinLabel = $MarginContainer/VBoxContainer/coinsContainer/Sprite2D/coinLabel 
@onready var keyLabel = $MarginContainer/VBoxContainer/coinsContainer/keysContainer/Sprite2D/keyLabel
@onready var xpLabel =  $MarginContainer/VBoxContainer/xpContainer/Sprite2D/xpLabel
@onready var menu_button: Button = $MenuButton
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready(): #VR
	player = get_tree().get_first_node_in_group("player")
	heartsContainer.setMaxHearts(player.maxHealth)
	heartsContainer.updateHearts(player.currentHealth)
	player.healthChanged.connect(heartsContainer.updateHearts)
	player.coinsChanged.connect(_on_coins_changed)
	player.keysChanged.connect(_on_keys_changed)
	player.xpChanged.connect(_on_xp_changed)
	player.level_up.connect(_on_level_up)
	menu_button.flat = true
	
func _on_coins_changed(new_amount: int):
	coinLabel.text = str(new_amount)
	if new_amount >= 500:
		$MarginContainer/VBoxContainer/coinsContainer/Sprite2D.frame = 35
	elif new_amount >= 200:
		$MarginContainer/VBoxContainer/coinsContainer/Sprite2D.frame = 34  
	elif new_amount >= 100:
		$MarginContainer/VBoxContainer/coinsContainer/Sprite2D.frame = 33 
	elif new_amount > 30:
		$MarginContainer/VBoxContainer/coinsContainer/Sprite2D.frame = 32  
	else:
		$MarginContainer/VBoxContainer/coinsContainer/Sprite2D.frame = 31  
		
func _on_keys_changed(new_amount: int):
	keyLabel.text = str(new_amount)
	
func _on_xp_changed(new_amount: int):
	xpLabel.text = str(new_amount)
	
func _process(delta: float) -> void:
	pass
	
func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")

func _on_level_up(maxHealth: int):
	print("hud recieved level up signal")
	heartsContainer.setMaxHearts(maxHealth)
	animation_player.play("level_up_label")
