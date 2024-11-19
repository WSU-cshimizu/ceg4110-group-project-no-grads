class_name Skeleton extends Enemy


@export var health: int = 3
@export var damage: int = 2
@export var knockback_force: int = 25
@export var speed: int = 25
@export var xp: int = 2

var direction = Vector2.ZERO
var cardinal_direction : Vector2 = Vector2.DOWN
const DIRECTIONS = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

@onready var player: Player = %Player
#@onready var player: Player = $"../../Player"
@onready var sprite: AnimatedSprite2D = $Sprite2D
@onready var progress_bar: ProgressBar = $ProgressBar

var knockback_velocity: Vector2 = Vector2.ZERO
var knocked_back: bool = false
var player_detected: bool = false
var current_state : String = "idle"

func _ready() -> void:
	progress_bar.max_value = health
	progress_bar.value = health

func _physics_process(delta: float) -> void:
	if player_detected and not current_state == "dying":
		velocity = position.direction_to(player.position) * speed
	else:
		velocity = Vector2.ZERO
		
	direction = velocity.normalized()
	update_direction()
	update_animation()
	
	if knocked_back:
		velocity = knockback_velocity
	move_and_slide()


func _on_detection_zone_body_entered(body: Node2D) -> void:
	if body is Player:
		player_detected = true
		current_state = "walk"


func _on_detection_zone_body_exited(body: Node2D) -> void:
	if body is Player:
		player = body
		player_detected = false
		current_state = "idle"
		
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
	if current_state == "dying":
		sprite.play("die")
		#await sprite.animation_finished
	else:
		sprite.play(current_state + "_" + animation_direction())

# Return a string representing the current facing cardinal direction
func animation_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
