extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D


const SPEED = 15.0
const MAX_WANDER = 1.5
const MAX_IDLE = 5.0
var wander_time: float
var idle_time: float
var direction: Vector2
var current_state: String


func _ready() -> void:
	wander_time = MAX_WANDER
	idle_time = 0
	direction = Vector2.LEFT
	current_state = "wander"

func _physics_process(delta: float) -> void:
	update_state(delta)
	move_and_slide()

func wander(delta) -> void:
	if wander_time <= 0:
		idle_time =MAX_IDLE
		velocity = Vector2.ZERO
		current_state = "idle"
	else:
		wander_time -= delta
	
func idle(delta) -> void:
	if idle_time <= 0:
		wander_time = MAX_WANDER
		direction = Vector2(-direction.x, direction.y)
		sprite.scale.x = -sprite.scale.x
		velocity = direction * SPEED
		current_state = "wander"
	else:
		idle_time -= delta
		
func update_state(delta):
	if current_state == "wander":
		wander(delta)
	else:
		idle(delta)
