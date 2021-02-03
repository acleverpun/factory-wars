extends Node

onready var parent := get_parent()
onready var selecting := parent.find_node("selecting")
onready var layer: TileMap = parent.get_parent()
onready var grid: Grid = layer.get_parent()

# TODO: add better and more universal way of accessing modes. singleton or something.
onready var modes: Modes = grid.get_parent().find_node("modes")

func _ready() -> void:
	selecting.connect("selected", self, "_onSelected")
	selecting.connect("deselected", self, "_onDeselected")
	pass

func _onSelected() -> void:
	prints("Unit selected:", self.name)
	# TODO: this shouldn't be changing modes, the select mode should do this?
	modes.change(modes.values.Move, self)

func _onDeselected() -> void:
	prints("Unit deselected:", self.name)
	# TODO: this shouldn't be changing modes, the select mode should do this?
	modes.change(modes.values.Select)
