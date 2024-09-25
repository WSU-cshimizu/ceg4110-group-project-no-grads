extends CharacterBody2D


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

func _physics_process(delta: float) -> void:
	move_and_slide()
