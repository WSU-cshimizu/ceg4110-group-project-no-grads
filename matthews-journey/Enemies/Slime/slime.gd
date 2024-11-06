class_name Slime extends CharacterBody2D

@onready var player: Player = $"../../Player"
var player_detected: bool = false
const SPEED = 25
const MIN_WANDER = 0.3
const MAX_WANDER = 0.5
const MIN_IDLE = 1.0
const MAX_IDLE = 1.5
var wander_time: float
var idle_time: float
var current_state: String

func _ready() -> void:
	wander_time = MAX_WANDER
	idle_time = MAX_IDLE
	current_state = "idle"

func _on_hit_box_body_entered(body: Node2D) -> void:
	if body is Player:
		print("Player collided with slime")
		pass

func _physics_process(delta: float) -> void:
	update_state(delta)
	move_and_slide()
		
func update_state(delta):
	if current_state == "chase":
		chase(delta)
	elif current_state == "wander":
		wander(delta)
	else:
		idle(delta)
	pass
	
func _on_detection_zone_body_entered(body: Node2D) -> void:
	if body is Player:
		player_detected = true
		current_state = "chase"

func _on_detection_zone_body_exited(body: Node2D) -> void:
	if body is Player:
		player_detected = false
		current_state = "wander"
		
func chase(delta) -> void:
	velocity = position.direction_to(player.position) * SPEED
			
func wander(delta) -> void:
	if wander_time <= 0:
		idle_time = randf_range(MIN_IDLE, MAX_IDLE)
		velocity = Vector2.ZERO
		current_state = "idle"
	else:
		wander_time -= delta
	
func idle(delta) -> void:
	if idle_time <= 0:
		wander_time = randf_range(MIN_WANDER, MAX_WANDER)
		velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * SPEED
		current_state = "wander"
	else:
		idle_time -= delta
