extends Polygon2D

onready var layer: TileMap = get_parent()
onready var grid: Grid = layer.get_parent()
onready var instanceId := get_instance_id()

func _ready():
	call_deferred("init")

func init():
	grid.setData(layer.name, self.position, instanceId)

func _onSelected():
	prints("Unit selected:", self.name)

func _onDeselected():
	prints("Unit deselected:", self.name)
