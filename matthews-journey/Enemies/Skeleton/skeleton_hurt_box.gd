class_name SkeletonHurtBox extends HurtBox

@onready var skeleton: Skeleton = $".."
var player: Player

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func take_attack(attack: Attack):
	knockback(attack.direction, attack.knockback)
	skeleton.health -= attack.damage
	if skeleton.health <= 0:
		player.collect_xp(skeleton.xp)
		skeleton.queue_free()

func knockback(direction: Vector2, force: int) -> void:
	skeleton.knockback_velocity = (skeleton.global_position - direction) * force
	skeleton.knocked_back = true
	await get_tree().create_timer(0.1).timeout
	skeleton.knocked_back = false
