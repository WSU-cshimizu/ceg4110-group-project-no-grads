class_name Skeleton extends CharacterBody2D

@onready var player: Player = $"../../Player"
var player_detected = false
const SPEED = 25

func _on_hit_box_body_entered(body: Node2D) -> void:
	if body is Player:
		pass

func _physics_process(delta: float) -> void:
	if player_detected:
		velocity = position.direction_to(player.position) * SPEED
		move_and_slide()


func _on_detection_zone_body_entered(body: Node2D) -> void:
	if body is Player:
		player_detected = true


func _on_detection_zone_body_exited(body: Node2D) -> void:
	if body is Player:
		player_detected = false
