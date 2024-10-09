extends Node2D


func _process(delta: float) -> void:
	scale = (get_viewport_rect().size / $Sprite2D.get_rect().size)
	pass
