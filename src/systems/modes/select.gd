extends Node

var value

onready var fsm: Fsm = get_parent()
onready var grid: Grid = fsm.get_parent().get_node("grid")

func _ready() -> void:
	connect("input_event", self, "_onInputEvent")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("game.action"):
		var data := grid.getAllData(event.position)
		prints(data)

	if Input.is_action_just_pressed("game.context"):
		prints("context")
