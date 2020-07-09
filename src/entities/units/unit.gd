extends Polygon2D

onready var layer := get_parent() as TileMap
onready var grid := layer.get_parent() as Grid
onready var instanceId := get_instance_id()

func _ready():
	call_deferred("init")

func init():
	grid.setData(layer.name, self.position, instanceId)

func onSelect():
	prints("Unit selected:", self.name)
