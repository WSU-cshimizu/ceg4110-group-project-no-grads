class_name Player extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

const SPEED = 175.0
var direction : Vector2 = Vector2.DOWN

func _process(delta: float) -> void:
	# Get the direction the player is pressing
	direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	# normalize the vector to magnitude 1. Prevents faster movement in diagonal.
	).normalized() 
	
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
	
	if direction == Vector2.ZERO:
		animation_player.pause()
	elif direction == Vector2.DOWN:
		animation_player.play("walk_down")
	elif direction == Vector2.UP:
		animation_player.play("walk_up")
	elif direction == Vector2.RIGHT:
		# flip sprite right
		sprite.scale.x = 1
		animation_player.play("walk_side")
	elif direction == Vector2.LEFT:
		# flip sprite left
		sprite.scale.x = -1
		animation_player.play("walk_side")
		
	
	

func _physics_process(delta: float) -> void:
	move_and_slide()
