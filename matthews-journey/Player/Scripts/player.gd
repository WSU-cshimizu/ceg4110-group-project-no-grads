class_name Player extends CharacterBody2D

# Health Variables
signal healthChanged #VR
@export var maxHealth = 5 #VR
@onready var currentHealth: int = maxHealth #VR

# Sprite variables
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D

# Direction Variables
const SPEED = 175.0
var direction : Vector2 = Vector2.ZERO
var cardinal_direction : Vector2 = Vector2.DOWN
const DIRECTIONS = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

# State Variables
var current_state : String = "idle"
const ATTACK_DELAY: float = 0.35   # delay between player attacks
var attack_cooldown: float = 0.0  # current time delay until player can attack

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	# Get the direction the player is pressing
	direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	# normalize the vector to magnitude 1. Prevents faster movement in diagonal.
	).normalized() 
	
	update_state(delta)
	update_direction()
	update_animation()

		
	if($"../PlayerChatIcon".is_chatting):
		direction = Vector2.ZERO
		
	velocity = direction * SPEED
	
# Source for direction and animation updating: Michael Games AARPG tutorial series on youtube	
	
# Return's true if the cardinal direction has changed based on player direction, false if it has not.
# The function will also update the cardinal direction if direction has changed enough.
func update_direction() -> bool:
	# if no player input then return false
	if direction == Vector2.ZERO:
		return false
	
	# Calculate current cardinal direction
	var direction_id : int = int(round( 
		# bias the direction towards the current cardinal direction to prevent weird player motion (example: moonwalking)
		(direction + cardinal_direction * 0.1  
		# Divide the angle of direction by 2*PI * 4. This converts direction to an integer 0-3 corresponding to an index in DIRECTIONS
		).angle() / TAU * DIRECTIONS.size()))
	# assign the new direction based on calculation above
	var new_dir : Vector2 = DIRECTIONS[direction_id]
	
	# If player still facing the same direction as before return false
	if new_dir == cardinal_direction:
		return false
	
	# update the direction, flip sprite if needed, and return true (direction changed)
	else:
		cardinal_direction = new_dir
		# flip the sprite if facing left
		if cardinal_direction == Vector2.LEFT:
			sprite.scale.x = -1
		else:
			sprite.scale.x = 1
		return true

# update the character animation based on state and current cardinal direction	
func update_animation() -> void:
	animation_player.play(current_state + "_" + animation_direction())

# Return a string representing the players current facing cardinal direction
func animation_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
		
func handleCollision(): #VR
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision. get_collider()
		#print_debug(collider.name)

func _on_hurt_box_area_entered(area): #VR
	if area.name == "hitBox": 
		print_debug(area.get_parent().name)
		currentHealth -= 1
		if currentHealth <= 0:
			get_tree().change_scene_to_file("res://UI/game_over.tscn")
		healthChanged.emit(currentHealth)
		
func update_state(delta: float) -> void:
	var state: String = current_state
	
	if attack_cooldown > 0:
		attack_cooldown -= delta
		
	if Input.is_action_pressed("attack"):
		if attack_cooldown <= 0:
			attack_cooldown = ATTACK_DELAY
			state = "attack"
	elif direction == Vector2.ZERO:
		state = "idle" # idle
	elif direction != Vector2.ZERO:
		state = "walk"

	current_state = state


func _physics_process(delta: float) -> void:
	move_and_slide()
	handleCollision() #VR
	
func player():
	pass
