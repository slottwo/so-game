extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _pressed() -> void:
	$Control/Front.visible = not $Control/Front.visible
