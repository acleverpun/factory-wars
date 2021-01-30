class_name Modes extends Fsm

signal mode_changed

func change(State: Script) -> void:
	.change(State)

	events.emit("mode_changed", state)
