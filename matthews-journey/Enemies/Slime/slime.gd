class_name Slime extends Enemy

@onready var player: Player = $"../../Player"

@export var health: int = 2
@export var damage: int = 1
@export var knockback_force: int = 10
@export var speed: int = 25
@export var min_wander: float = 0.3
@export var max_wander: float = 0.5
@export var min_idle: float= 1.0
@export var max_idle: float = 1.5

var wander_time: float
var idle_time: float
var player_detected: bool = false
var knocked_back: bool = false
var knockback_velocity = Vector2.ZERO
var current_state: String

func _ready() -> void:
	wander_time = randf_range(min_wander, max_wander)
	idle_time = randf_range(min_idle, max_idle)
	current_state = "idle"

func _on_hit_box_body_entered(body: Node2D) -> void:
	if body is Player:
		print("Player collided with slime")
		pass

func _physics_process(delta: float) -> void:
	update_state(delta)
	if knocked_back:
		velocity = knockback_velocity
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
	velocity = position.direction_to(player.position) * speed
			
func wander(delta) -> void:
	if wander_time <= 0:
		idle_time = randf_range(min_idle, max_idle)
		velocity = Vector2.ZERO
		current_state = "idle"
	else:
		wander_time -= delta
	
func idle(delta) -> void:
	if idle_time <= 0:
		wander_time = randf_range(min_wander, max_wander)
		velocity = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * speed
		current_state = "wander"
	else:
		idle_time -= delta
		
