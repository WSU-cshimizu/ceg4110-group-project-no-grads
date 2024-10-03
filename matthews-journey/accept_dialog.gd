extends AcceptDialog


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$".".popup_centered($"..".position)
	$".".keep_title_visible = true
	$".".dialog_text = "I'm gonna alert you!"
	$".".ok_button_text = "I literally don't care."
	$".".set_hide_on_ok(true)
