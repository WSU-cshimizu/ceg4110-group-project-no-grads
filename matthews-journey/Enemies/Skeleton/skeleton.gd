class_name Skeleton extends Enemy


@export var health: int = 3
@export var damage: int = 2
@export var knockback_force: int = 25
@export var speed: int = 25
@export var xp: int = 2


@onready var player: Player = $"../../Player"
var knockback_velocity: Vector2 = Vector2.ZERO
var knocked_back: bool = false
var player_detected: bool = false

func _on_hit_box_body_entered(body: Node2D) -> void:
	#print("skelly hitbox entered")
	#if body is Player:
		#print("Skelly hit player")
		#SignalBus.enemy_attack.emit(damage)
		#print("skelly attack signal emitted")
		pass

func _physics_process(delta: float) -> void:
	if player_detected:
		velocity = position.direction_to(player.position) * speed
	if knocked_back:
		velocity = knockback_velocity
	move_and_slide()


func _on_detection_zone_body_entered(body: Node2D) -> void:
	if body is Player:
		player_detected = true


func _on_detection_zone_body_exited(body: Node2D) -> void:
	if body is Player:
		player_detected = false
