extends Node2D

@export var Front: Texture2D

@onready var CardCLick: Button = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button/Control/Front.visible = false
	$Button/Control/Front/Sprite2D.set_texture(Front)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
