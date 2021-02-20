extends Mode

onready var entities := map.find_node("entities")

func _init(value = null).(Mode.Type.Place, value): pass

func _ready() -> void:
	var building: Building = value[0]
	var unit: Unit = value[1].instance()

	unit.position = grid.snapped(building.position) + grid.Down
	entities.add_child(unit)

	modes.change(Mode.Type.Select)
