class_name SlimeHurtBox extends HurtBox

@onready var slime: Slime = $".."
var player: Player
var drop_count = 2
const COIN_03 = preload("res://Collectables/Currency/coin03.tscn")
@onready var damage_sound: AudioStreamPlayer2D = $AudioStreamPlayer2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

func take_attack(attack: Attack):
	MusicManager.sfx("slime")
	slime.health -= attack.damage
	slime.progress_bar.value = slime.health
	slime.progress_bar.visible = true
	knockback(attack.direction, attack.knockback)
	if slime.health <= 0:
		destroy()

func knockback(direction: Vector2, force: int) -> void:
	slime.knockback_velocity = (slime.global_position - direction) * force
	slime.knocked_back = true
	await get_tree().create_timer(0.1).timeout
	slime.knocked_back = false

func destroy():
	player.collect_xp(slime.xp)
	spawn_drops()
	slime.queue_free()
	
func spawn_drops():
	for i in range(drop_count):
		var coin: Coin03 = COIN_03.instantiate()
		slime.get_parent().call_deferred("add_child", coin)
		var spawn_offset = Vector2(randi_range(1, 15), randi_range(1, 15))
		coin.global_position = slime.global_position + spawn_offset
