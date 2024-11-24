extends HBoxContainer
const HEART_GUI = preload("res://UI/heart_gui.tscn")
#@onready var HeartGUIClass = preload("res://UI/heart_gui.tscn")

func setMaxHearts (max: int):
	# remove all current hearts for level up
	for c in get_children():
		remove_child(c)
	# add hearts equal to maximum hearts
	for i in range(max):
		var heart = HEART_GUI.instantiate()
		add_child(heart)
		
func updateHearts(currentHealth: int):
	var hearts = self.get_children()
	
	for i in range(currentHealth):
		hearts[i].update(true)
		
	for i in range(currentHealth, hearts.size()):
		hearts[i].update(false)
