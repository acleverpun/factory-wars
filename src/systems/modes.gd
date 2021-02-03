class_name Modes extends Fsm

signal mode_changed

enum values {
	Null,
	Select,
	Move,
}

func change(State, value = null) -> Node:
	var mode = .change(State, value)

	events.emit("mode_changed", mode)

	return mode
