class_name Fsm extends Node

export(Array, Script) var scripts

export var states = {}
var state: Node

var history = []

func _ready() -> void:
	for State in scripts:
		var name: String = utils.getBasename(State.resource_path)
		State.set_meta("name", name)
		states[name] = State

	# Set initial state to first entry
	change(states[states.keys()[0]])

func enter(newState: Node, value = null) -> void:
	prints("Switching to state:", newState.name)
	state = newState
	state.fsm = self
	add_child(state)

	if state.has_method("enter"):
		state.enter()

func change(State: Script, value = null) -> void:
	if state:
		history.append(state)
		remove_child(state)

	var newState: Node = State.new()
	newState.name = utils.lowerFirst(State.get_meta("name"))
	enter(newState, value)

func back() -> void:
	if history.size() == 0: return
	enter(history.pop_back())
