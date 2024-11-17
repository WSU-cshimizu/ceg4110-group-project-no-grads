class_name Player extends CharacterBody2D

# Health Variables
signal healthChanged #VR
@export var maxHealth = 5 #VR
@onready var currentHealth: int = 3 #maxHealth #VR

# Collectables Variables
signal coinsChanged
signal keysChanged
var coins: int = 0
var keys: int = 0

# XP and level variables
signal xpChanged
signal level_up
var xp: int = 0
var level = 1
var xp_to_lvl = {1: 5, 2: 15, 3: 30}

# Knockback Variables
@export var damage: int = 1
@export var knockback_force = 10

# Sprite variables
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var sword_hit_box: SwordHitBox = $Sprite2D/SwordHitBox

# sfx variables
@onready var swing_1: AudioStreamPlayer2D = $swing1
@onready var swing_2: AudioStreamPlayer2D = $swing2
@onready var swing_3: AudioStreamPlayer2D = $swing3
var swings: Array[AudioStreamPlayer2D]
var swung: bool = false

# Direction Variables
const SPEED = 175.0
var direction : Vector2 = Vector2.ZERO
var cardinal_direction : Vector2 = Vector2.DOWN
const DIRECTIONS = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

var knockback_velocity: Vector2 = Vector2.ZERO
var knocked_back: bool = false

# State Variables
var current_state : String = "idle"


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("player")
	sword_hit_box.monitoring = false
	swings.append(swing_1)
	swings.append(swing_2)
	swings.append(swing_3)

func _process(delta: float) -> void:
	# Get the direction the player is pressing
	direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	# normalize the vector to magnitude 1. Prevents faster movement in diagonal.
	).normalized() 
	
	update_state(delta)
	update_direction()
	
	if($"../NPCs/PlayerChatIcon".is_chatting):
		direction = Vector2.ZERO
		current_state = "idle"
	
	update_animation()

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
		
func _heal(area):
	print_debug("_heal called with area: ", area.name)
	if area.has_method("collect"):
		print_debug("Area has collect method")
		area.collect()
		print_debug("Current health: ", currentHealth)
		if currentHealth < maxHealth:
			currentHealth += 1
			healthChanged.emit(currentHealth)
			print_debug("Health after healing: ", currentHealth)

func update_state(delta: float) -> void:
	var new_state: String = current_state
	var prev_state: String = current_state
	
	# Find new state
	if Input.is_action_pressed("attack"):
		new_state = "attack"
		sword_hit_box.monitoring = true
	elif direction == Vector2.ZERO:
		new_state = "idle" # idle
	elif direction != Vector2.ZERO:
		new_state = "walk"
	
	# update the state if it is different than previous
	if new_state != current_state:
		if prev_state == "attack":
			# prevent sfx from playing repeatedly
			if not swung:
				swings.pick_random().play()
				swung = true
			# prevent spamming attack
			await animation_player.animation_finished
			# turn off sword hit box after animation finishes
			sword_hit_box.monitoring = false
			swung = false
		current_state = new_state

func _physics_process(delta: float) -> void:
	if knocked_back:
		velocity = knockback_velocity
	move_and_slide()
	
func player():
	pass

func take_damage(damage):
	MusicManager.sfx("player_hurt")
	currentHealth -= damage
	if currentHealth <= 0:
		get_tree().change_scene_to_file("res://UI/game_over.tscn")
	healthChanged.emit(currentHealth)
	
func collect_coins(amount: int):
	coins += amount
	coinsChanged.emit(coins)
	
func collect_keys(amount: int):
	keys += amount
	keysChanged.emit(keys)
	
func collect_xp(amount: int):
	xp += amount
	print("xp = ", xp)
	xpChanged.emit(xp)
	# if xp is over the level up threshold, increase max health by 1
	if xp >= xp_to_lvl[level]:
		MusicManager.sfx("level_up")
		level += 1
		maxHealth += 1
		currentHealth += 1
		level_up.emit(maxHealth)
		healthChanged.emit(currentHealth)
		
