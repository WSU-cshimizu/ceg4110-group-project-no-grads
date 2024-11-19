class_name SkeletonHurtBox extends HurtBox

@onready var skeleton: Skeleton = $".."
var player: Player
@onready var game: Node2D = $"."
const COIN_03 = preload("res://Collectables/Currency/coin03.tscn")
var drop_count = 4
@onready var sprite: AnimatedSprite2D = $"../Sprite2D"
@onready var hit_box: SkeletonHitBox = $"../HitBox"

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func take_attack(attack: Attack):
	MusicManager.sfx("skeleton")
	knockback(attack.direction, attack.knockback)
	skeleton.health -= attack.damage
	skeleton.progress_bar.value = skeleton.health
	skeleton.progress_bar.visible = true
	if skeleton.health <= 0:
		destroy()

func knockback(direction: Vector2, force: int) -> void:
	skeleton.knockback_velocity = (skeleton.global_position - direction) * force
	skeleton.knocked_back = true
	await get_tree().create_timer(0.1).timeout
	skeleton.knocked_back = false

func destroy():
	skeleton.velocity = Vector2.ZERO
	skeleton.current_state = "dying"
	hit_box.monitoring = false
	await sprite.animation_finished
	player.collect_xp(skeleton.xp)
	spawn_drops()
	skeleton.queue_free()

func spawn_drops():
	for i in range(drop_count):
		var coin: Coin03 = COIN_03.instantiate()
		skeleton.get_parent().call_deferred("add_child", coin)
		var spawn_offset = Vector2(randi_range(1, 15), randi_range(1, 15))
		coin.global_position = skeleton.global_position + spawn_offset
