class_name Modes extends Fsm

signal mode_changed

enum {
	Select,
	Move,
}

func change(State) -> Node:
	var mode = .change(State)

	events.emit("mode_changed", mode)

	return mode
