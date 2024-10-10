extends Node2D

@export var Front: Texture2D

var sprite:Sprite2D
var nodeFront:Node2D

var id 
@onready var CardCLick: Button = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	nodeFront = $Button/Control/Front
	nodeFront.visible = false
	sprite = $Button/Control/Front/Sprite2D
	sprite.set_texture(Front)


func ajustar_sprite_para_carta():
	var carta_size = Vector2(100,150)
	var texture_size = sprite.get_rect().size  
	var scale_factor =  carta_size / texture_size
	sprite.scale = scale_factor * 10 # a escala $Button/Control foi reduzida em 10, por isso o *10 
