extends Node

var value

func _ready():
	connect("input_event", self, "onInputEvent")

func _input(event: InputEvent):
	if Input.is_action_just_pressed("game.action"):
		prints("action")

	if Input.is_action_just_pressed("game.context"):
		prints("context")
