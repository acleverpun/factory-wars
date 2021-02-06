extends Mode

const id = Mode.values.Select

var selection: Node

onready var modes: Modes = get_parent()
onready var grid: Grid = modes.get_parent().get_node("grid")

func _init(value = null).(value): pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_select"):
		var data := grid.getAllData(event.position)

		if not data.has("selecting"):
			deselect()
			return

		# Check for selectable nodes in order of precedence
		var node: Node
		if data.selecting.has("units"):
			node = data.selecting.units
		elif data.selecting.has("buildings"):
			node = data.selecting.buildings

		if not node: return

		select(node)

func select(node: Node) -> void:
	if node == selection: return

	# deselect prior entity, if any
	deselect()

	# change to mode specified by intent
	var selecting: Area2D = node.find_node("selecting")
	var intent: int = selecting.intent
	modes.change(intent, node)

	# select new entity
	selection = node
	events.emit_signal("selected", selection)
	selection.find_node("selecting").emit_signal("selected")

func deselect() -> void:
	if not selection: return
	events.emit_signal("deselected", selection)
	selection.find_node("selecting").emit_signal("deselected")
	selection = null
