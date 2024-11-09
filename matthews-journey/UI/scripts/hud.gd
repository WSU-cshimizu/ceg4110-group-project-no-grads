extends CanvasLayer

static var image = load('res://assets/UI/health-heart.png')

#VR
@onready var heartsContainer = $MarginContainer/heartsContainer
@onready var player = $"../Player"

func set_health(amount):
	# remove all children from hbox container
	for child in $MarginContainer/HBoxContainer.get_children():
		child.queue_free()
		
	# create new children using ammount
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		

func _ready(): #VR
	heartsContainer.setMaxHearts(player.maxHealth)
	heartsContainer.updateHearts(player.currentHealth)
	player.healthChanged.connect(heartsContainer.updateHearts)
