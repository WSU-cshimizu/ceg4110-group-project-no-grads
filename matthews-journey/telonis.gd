extends Sprite2D


# Called when the node enters the scene tree for the first time.
var player_in_area = false
var is_chatting = false
var we_talked = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(TelonisSignal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area and !is_chatting and !we_talked:
		run_dialogue("Tragoudi")
		

func run_dialogue(dialogue_string):
	is_chatting = true
	we_talked = true
	Dialogic.start(dialogue_string)
	
	
func TelonisSignal(arg: String):
	if arg == "end_all":
		is_chatting = false
		get_tree().quit()

func _on_telonis_detect_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true


func _on_telonis_detect_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
		we_talked = false
		# Replace with function body.
