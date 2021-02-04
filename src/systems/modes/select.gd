extends Mode

var selection: Node

onready var modes: Modes = get_parent()
onready var grid: Grid = modes.get_parent().get_node("grid")

func _init(value = null).(value): pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("game.action"):
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

	# XXX
	if Input.is_action_just_pressed("game.context"):
		modes.change(Mode.values.Move)

func select(node: Node) -> void:
	if node == selection: return

	deselect()

	selection = node
	events.emit_signal("selected", selection)
	selection.find_node("selecting").emit_signal("selected")

func deselect() -> void:
	if not selection: return
	events.emit_signal("deselected", selection)
	selection.find_node("selecting").emit_signal("deselected")
	selection = null
