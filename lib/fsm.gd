class_name Fsm extends Node

export(Array, Script) var States

export var states = {}
export var default: String

var state: Node

func _ready() -> void:
	for State in States:
		var name := utils.getBasename(State.resource_path)
		prints("Initializing state: %s" % name)
		State.set_meta("name", name)
		states[name] = State

	# Set initial state to default
	change(states[default])

func change(State: Script) -> void:
	var name: String = State.get_meta("name")

	# Safeguard against state injections
	if not states.has(name) or states.get(name) != State:
		printerr("State not found: %s" % State)

	# Replace old state
	# TODO: add history stack
	if state:
		remove_child(state)

	var newState: Node = State.new()
	newState.name = utils.lowerFirst(name)

	var oldState: String = state.name if state != null else "NONE"
	prints("Switching states: %s => %s" % [ oldState, newState.name ])

	state = newState
	add_child(state)
