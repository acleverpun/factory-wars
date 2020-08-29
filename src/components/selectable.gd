extends Area2D

signal selected
signal deselected

onready var parent := get_parent()
onready var layer: TileMap = parent.get_parent()
onready var grid: Grid = layer.get_parent()
onready var selected := false

func _ready() -> void:
	connect("input_event", self, "_onInputEvent")

	if parent.has_method("_onSelected"): connect("selected", parent, "_onSelected")
	if parent.has_method("_onDeselected"): connect("deselected", parent, "_onDeselected")

	var selectable = grid.getData(parent.position, "selectable", {})
	selectable[layer.name] = parent
	grid.setData(parent.position, "selectable", selectable)

func _onInputEvent(viewport: Viewport, event: InputEvent, shapeIndex: int) -> void:
	if not event is InputEventMouseButton: return
	if not event.pressed: return

	if event.button_index == BUTTON_LEFT:
		if selected:
			emit_signal("deselected")
		else:
			emit_signal("selected")
		selected = not selected

	if event.button_index == BUTTON_RIGHT and selected:
		emit_signal("deselected")
		selected = false
