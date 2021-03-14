extends Mode

onready var entities := map.find_node("entities")

func _init(prior, data).(Mode.Type.Place, prior, data): pass

func _ready() -> void:
	var building: Building = self.data.entity
	var unit: Unit = self.data.unitScene.instance()

	unit.model = self.data.model
	unit.commander = map.commander
	unit.position = grid.snapped(building.position) + grid.Down

	entities.add_child(unit)

	yield(get_tree(), "idle_frame")
	self.succeed()
