class_name Modes extends Fsm

signal mode_changed

# TODO: this introduces code duplication with Mode.Type
var modeStates := [
	null,
	load("res://src/systems/modes/select.gd"),
	load("res://src/systems/modes/move.gd"),
	load("res://src/systems/modes/build.gd"),
	load("res://src/systems/modes/place.gd"),
]

func _init() -> void:
	States = modeStates

func change(type, value = null) -> Node:
	# TODO: this relies on Mode.Type being in the same order as Fsm.States
	# var mode = .change(self.States[type], value)
	var mode = .change(type, value)

	events.emit("mode_changed", mode)

	return mode
