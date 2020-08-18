class_name Fsm extends Node

export(Array, Script) var scripts

export var states = {}
var state: Object

var history = []

func _ready() -> void:
	for State in scripts:
		var name: String = State.resource_path.get_file().trim_suffix("." + State.resource_path.get_extension()).capitalize()
		State.set_meta("name", name)
		states[name] = State

	prints(states)

	# Set initial state to first entry
	switch(states.Select)

func switch(State: Script, value = null) -> void:
	var state: Node = State.new()
	state.name = utils.lowerFirst(State.get_meta("name"))
	add_child(state)
	# history.append(state.name)

func back() -> void:
	pass

func _enter(newState) -> void:
	# prints("Entering state:", newState.name)
	# state = newState
	# state.fsm = self
	# state.enter()
	pass
