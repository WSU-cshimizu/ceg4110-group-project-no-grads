class_name Player extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

const SPEED = 175.0
var direction : Vector2 = Vector2.DOWN
var cardinal_direction : Vector2 = Vector2.DOWN
var health: int = 3

func _ready(): 
	#set up health
	get_tree().call_group('ui', 'set_health', health)

func _process(delta: float) -> void:
	# Get the direction the player is pressing
	direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	# normalize the vector to magnitude 1. Prevents faster movement in diagonal.
	).normalized() 
	if($"../PlayerChatIcon".is_chatting):
		direction = Vector2.ZERO
	velocity.x = direction.x * SPEED
	velocity.y = direction.y * SPEED
	
	if direction == Vector2.ZERO:
		if cardinal_direction == Vector2.DOWN:
			animation_player.play("idle_down")
		elif cardinal_direction == Vector2.UP:
			animation_player.play("idle_up")
		else:
			animation_player.play("idle_side")
	elif direction == Vector2.DOWN:
		animation_player.play("walk_down")
		cardinal_direction = Vector2.DOWN
	elif direction == Vector2.UP:
		animation_player.play("walk_up")
		cardinal_direction = Vector2.UP
	elif direction == Vector2.RIGHT:
		# flip sprite right
		sprite.scale.x = 1
		animation_player.play("walk_side")
		cardinal_direction = Vector2.RIGHT
	elif direction == Vector2.LEFT:
		# flip sprite left
		sprite.scale.x = -1
		animation_player.play("walk_side")
		cardinal_direction = Vector2.LEFT
		
	
	

func _physics_process(delta: float) -> void:
	move_and_slide()
	
func player():
	pass
