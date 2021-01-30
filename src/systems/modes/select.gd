extends Node

var selection: Node

onready var modes: Fsm = get_parent()
onready var grid: Grid = modes.get_parent().get_node("grid")

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("game.action"):
		var data := grid.getAllData(event.position)
		if not data.has("selectable"): return

		# Check for selectable nodes in order of precedence
		var node: Node
		if data.selectable.has("units"):
			node = data.selectable.units
		elif data.selectable.has("buildings"):
			node = data.selectable.buildings

		if not node: return
		if node == selection: return

		if selection:
			events.emit_signal("deselected", selection)
			selection.find_node("selectable").emit_signal("deselected")

		selection = node
		events.emit_signal("selected", selection)
		selection.find_node("selectable").emit_signal("selected")

	if Input.is_action_just_pressed("game.context"):
		modes.change(modes.states.Move)
