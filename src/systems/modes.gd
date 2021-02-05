class_name Modes extends Fsm

signal mode_changed

func change(type, value = null) -> Node:
	# TODO: this relies on Mode.values being in the same order as Fsm.States
	# var mode = .change(self.States[type], value)
	var mode = .change(type, value)

	events.emit("mode_changed", mode)

	return mode
