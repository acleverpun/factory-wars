extends Node

var value

var fsm: Fsm

func _ready() -> void:
	connect("input_event", self, "_onInputEvent")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("game.action"):
		prints("action")

	if Input.is_action_just_pressed("game.context"):
		prints("context")
