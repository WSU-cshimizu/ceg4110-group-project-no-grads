extends CanvasLayer

static var image = load('res://assets/UI/health-heart.png')

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
