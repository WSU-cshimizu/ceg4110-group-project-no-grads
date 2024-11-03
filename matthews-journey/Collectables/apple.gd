extends "res://Collectables/collectable.gd" #inheirits from collectable.gd

@onready var animations = $AnimationPlayer
@onready var heartsContainer = $MarginContainer/heartsContainer 

func collect():
	var player = get_tree().get_first_node_in_group("player")
	if player and player.currentHealth < player.maxHealth:
		player.currentHealth += 1
		player.healthChanged.emit(player.currentHealth)
		animations.play("spin")
		await animations.animation_finished
		super.collect()
