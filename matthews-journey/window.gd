extends Window


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100, 100) # Replace with function body.
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$AcceptDialog.dialog_hide_on_ok = true
	
