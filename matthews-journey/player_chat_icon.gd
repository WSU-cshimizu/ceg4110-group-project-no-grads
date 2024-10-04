extends Sprite2D

var player_in_area = false
@export var is_chatting = false
var we_talked = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(DialogicSignal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area and !is_chatting and !we_talked:
		run_dialogue("TalkingGuyTalking")
		

func run_dialogue(dialogue_string):
	is_chatting = true
	we_talked = true
	Dialogic.start(dialogue_string)
	
	
func DialogicSignal(arg: String):
	if arg == "end_chat":
		is_chatting = false

func _on_chat_detect_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true


func _on_chat_detect_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false
		we_talked = false
		# Replace with function body.
