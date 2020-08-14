extends Area2D

signal select
signal deselect

onready var parent := get_parent()
onready var selected := false

func _ready():
	connect("input_event", self, "onInputEvent")

	if parent.has_method("onSelect"): connect("select", parent, "onSelect")
	if parent.has_method("onDeselect"): connect("deselect", parent, "onDeselect")

func onInputEvent(viewport: Viewport, event: InputEvent, shapeIndex: int):
	if not event is InputEventMouseButton: return
	if not event.pressed: return

	if event.button_index == BUTTON_LEFT:
		if selected:
			emit_signal("deselect")
		else:
			emit_signal("select")
		selected = not selected

	if event.button_index == BUTTON_RIGHT and selected:
		emit_signal("deselect")
		selected = false
