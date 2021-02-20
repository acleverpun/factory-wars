extends Mode

onready var entities := map.find_node("entities")

func _init(data).(Mode.Type.Place, data): pass

func _ready() -> void:
	var building: Building = self.data.entity
	var unit: Unit = self.data.unitScene.instance()

	unit.position = grid.snapped(building.position) + grid.Down
	entities.add_child(unit)

	modes.change(Mode.Type.Select)
