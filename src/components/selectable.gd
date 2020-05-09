extends Node

signal select
signal deselect

onready var parent := get_parent()

var selected := false

func _ready():
	if parent.has_method("onSelect"): connect("select", parent, "onSelect")
	if parent.has_method("onDeselect"): connect("deselect", parent, "onDeselect")

func select():
	# TODO: letting node always be selected for dev
	selected = false

	if not selected:
		selected = true
		emit_signal("select")
	return selected

func deselect():
	if selected:
		selected = false
		emit_signal("deselect")
	return selected

func toggle():
	if selected == true: return deselect()
	return select()
