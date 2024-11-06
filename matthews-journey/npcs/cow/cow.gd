extends CharacterBody2D

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


const SPEED = 15.0
const MAX_WANDER = 1.5
const MAX_IDLE = 1.5
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
		animation_player.play("eat")
		current_state = "idle"
	else:
		wander_time -= delta
	
func idle(delta) -> void:
	if idle_time <= 0:
		wander_time = MAX_WANDER
		direction = Vector2(-direction.x, direction.y)
		sprite.scale.x = -sprite.scale.x
		velocity = direction * SPEED
		animation_player.play("walk")
		current_state = "wander"
	else:
		idle_time -= delta
		
func update_state(delta):
	if current_state == "wander":
		wander(delta)
	else:
		idle(delta)


func _on_detection_zone_body_entered(body: Node2D) -> void:
	if body is Player:
		Dialogic.start("cow")
		print(body)
		print("Mooooo")
