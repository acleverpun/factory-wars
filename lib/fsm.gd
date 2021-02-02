class_name Fsm extends Node

export var default: String
export(Array, Script) var States

var state: Node
var states = {}

func _ready() -> void:
	for State in States:
		var name := utils.getBasename(State.resource_path)
		prints("Initializing state: %s" % name)
		State.set_meta("name", name)
		states[name] = State

	# Default initial state
	if default:
		change(states[default])

# State may be `Script` or `int`
func change(State, value = null) -> Node:
	if typeof(State) == TYPE_INT: State = States[State]

	var name: String = State.get_meta("name")

	# Safeguard against state injections
	if not states.has(name) or states.get(name) != State:
		printerr("State not found: %s" % State)

	# Replace old state
	# TODO: add history stack when needed
	if state:
		remove_child(state)

	var newState: Node = State.new(value)
	newState.name = utils.lowerFirst(name)

	var oldState: String = state.name if state != null else "NONE"
	prints("Switching states: %s => %s" % [ oldState, newState.name ])

	state = newState
	add_child(state)

	return state
