class_name Modes extends Fsm

signal mode_changed

# TODO: this introduces code duplication with Mode.Type
var modeStates = {
	Mode.Type.Select: load("res://src/systems/modes/select.gd"),
	Mode.Type.Move: load("res://src/systems/modes/move.gd"),
	Mode.Type.Build: load("res://src/systems/modes/build.gd"),
}

func _init() -> void:
	States.push_back(null)

	for State in modeStates.values():
		States.push_back(State)

func change(type, value = null) -> Node:
	# TODO: this relies on Mode.Type being in the same order as Fsm.States
	# var mode = .change(self.States[type], value)
	var mode = .change(type, value)

	events.emit("mode_changed", mode)

	return mode
