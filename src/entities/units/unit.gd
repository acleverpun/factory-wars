extends Polygon2D

onready var layer: TileMap = get_parent()
onready var grid: Grid = layer.get_parent()
onready var instanceId := get_instance_id()

func _ready() -> void:
	call_deferred("setup")

func setup() -> void:
	grid.setData(self.position, layer.name, instanceId)
