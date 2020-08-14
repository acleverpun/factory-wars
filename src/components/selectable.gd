extends Area2D

signal selected
signal deselected

onready var parent := get_parent()
onready var selected := false

func _ready():
	connect("input_event", self, "onInputEvent")

	if parent.has_method("onSelect"): connect("selected", parent, "onSelect")
	if parent.has_method("onDeselect"): connect("deselected", parent, "onDeselect")

func onInputEvent(viewport: Viewport, event: InputEvent, shapeIndex: int):
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
