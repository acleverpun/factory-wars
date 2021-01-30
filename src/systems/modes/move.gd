extends Node

onready var modes: Modes = get_parent()
onready var grid: Grid = modes.get_parent().get_node("grid")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("game.context"):
		modes.change(modes.states.Select)
