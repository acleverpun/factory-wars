extends Node

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("game.close"): get_tree().quit()
	elif Input.is_action_pressed("game.restart"): get_tree().reload_current_scene()
