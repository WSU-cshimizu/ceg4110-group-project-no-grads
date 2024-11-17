class_name Coin03
extends Collectable #inheirits from collectable.gd

@onready var animations = $AnimationPlayer
@onready var heartsContainer = $MarginContainer/heartsContainer 
@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

func collect():
	var player = get_tree().get_first_node_in_group("player")
	player.collect_coins(3)  # Worth 3
	animations.play("spin")
	audio.play()
	await animations.animation_finished
	super.collect()
