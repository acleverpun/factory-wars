extends Area2D

signal select
signal deselect

onready var parent := get_parent()

func _ready():
	connect("input_event", self, "onInputEvent")

	if parent.has_method("onSelect"): connect("select", parent, "onSelect")
	if parent.has_method("onDeselect"): connect("deselect", parent, "onDeselect")

func onInputEvent(viewport: Viewport, event: InputEvent, shapeIndex: int):
	if not event is InputEventMouseButton: return
	if not event.pressed: return

	if event.button_index == 1:
		emit_signal("select")
