class_name Key
extends Collectable #inheirits from collectable.gd

@onready var animations = $AnimationPlayer
@onready var heartsContainer = $MarginContainer/heartsContainer 

func collect():
	var player = get_tree().get_first_node_in_group("player")
	player.collect_keys(1)  # Worth 1
	animations.play("spin")
	await animations.animation_finished
	super.collect()
