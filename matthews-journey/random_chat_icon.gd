extends Sprite2D
var player_in_area = false
var is_chatting = false
var we_talked = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area and !is_chatting and !we_talked:
		run_rando_dialogue()

func run_rando_dialogue():
	Dialogic.timeline_ended.connect(ended_dialogue)
	
	is_chatting = true
	
	var dialogue_line = randi_range(1, 3)
	Dialogic.start("RandomChat" + str(dialogue_line))

func ended_dialogue():
	Dialogic.timeline_ended.disconnect(ended_dialogue)
	is_chatting = false

func _on_random_detect_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true


func _on_random_detect_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
		we_talked = false
		# Replace with function body.
