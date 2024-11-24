class_name Hud extends CanvasLayer

static var image = load('res://assets/UI/health-heart.png')
#VR
@onready var player: Player = %Player
@onready var heartsContainer: HBoxContainer = %heartsContainer
@onready var coinLabel: Label = %coinLabel
@onready var coin_sprite: Sprite2D = %coinSprite
@onready var keyLabel: Label = %keyLabel
@onready var xpLabel: Label = %xpLabel
@onready var lvLabel: Label = %lvLabel

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
		coin_sprite.frame = 35
	elif new_amount >= 200:
		coin_sprite.frame = 34  
	elif new_amount >= 100:
		coin_sprite.frame = 33 
	elif new_amount > 30:
		coin_sprite.frame = 32  
	else:
		coin_sprite.frame = 31  
		
func _on_keys_changed(new_amount: int):
	keyLabel.text = str(new_amount)
	
func _on_xp_changed(new_amount: int):
	xpLabel.text = str(new_amount)
	
func _process(delta: float) -> void:
	pass
	
func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")

func _on_level_up(new_amount: int, maxHealth: int):
	print("hud recieved level up signal")
	heartsContainer.setMaxHearts(maxHealth)
	lvLabel.text = str(new_amount)
	animation_player.play("level_up_label")
