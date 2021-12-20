extends Node

func _ready() -> void:
	prints("System ready:", self.name)

func _unhandled_key_input(event: InputEvent) -> void:
	if not event.is_action_type(): return

	if Input.is_action_pressed("game.close"):
		return get_tree().quit()

	if Input.is_action_pressed("game.restart"):
		get_tree().reload_current_scene()
		return
