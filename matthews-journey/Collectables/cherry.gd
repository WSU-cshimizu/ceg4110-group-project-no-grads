class_name Cherry
extends Collectable #inheirits from collectable.gd

@onready var animations = $AnimationPlayer
@onready var heartsContainer = $MarginContainer/heartsContainer 
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

func collect():
	var player = get_tree().get_first_node_in_group("player")
	if player and player.currentHealth < player.maxHealth:
		player.currentHealth = player.maxHealth
		player.healthChanged.emit(player.currentHealth)
		animations.play("spin")
		audio.play()
		await animations.animation_finished
		super.collect()
