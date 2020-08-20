extends Node

var value

onready var fsm: Fsm = get_parent()

func _ready() -> void:
	connect("input_event", self, "_onInputEvent")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("game.action"):
		prints("action")

	if Input.is_action_just_pressed("game.context"):
		prints("context")
