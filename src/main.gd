extends Node2D

func _input(event):
	if event.is_action_pressed("update"):
		update()

func update():
	get_tree().change_scene_to_file("res://src/main.tscn")
