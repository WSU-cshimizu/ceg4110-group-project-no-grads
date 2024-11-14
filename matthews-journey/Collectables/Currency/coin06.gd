class_name Coin06
extends Collectable #inheirits from collectable.gd

@onready var animations = $AnimationPlayer
@onready var heartsContainer = $MarginContainer/heartsContainer 

func collect():
	var player = get_tree().get_first_node_in_group("player")
	player.collect_coins(6)  # Worth 6
	animations.play("spin")
	await animations.animation_finished
	super.collect()
