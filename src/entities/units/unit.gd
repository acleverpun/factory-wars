extends Polygon2D

onready var layer: TileMap = get_parent()
onready var grid: Grid = layer.get_parent()
onready var instanceId := get_instance_id()

# TODO: add better and more universal way of accessing modes. singleton or something.
onready var modes: Modes = grid.get_parent().find_node("modes")

func _ready() -> void:
	call_deferred("init")

func init() -> void:
	grid.setData(self.position, layer.name, instanceId)

func _onSelected() -> void:
	prints("Unit selected:", self.name)
	modes.change(modes.Move)

func _onDeselected() -> void:
	prints("Unit deselected:", self.name)
	modes.change(modes.Select)
