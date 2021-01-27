extends Node

func _ready() -> void:
	prints("System ready:", self.name)
	self.pause_mode = PAUSE_MODE_PROCESS

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("game.close"): get_tree().quit()
	elif Input.is_action_pressed("game.restart"): get_tree().reload_current_scene()
