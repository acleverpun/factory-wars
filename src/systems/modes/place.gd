extends Mode

onready var entities := self.stage.find_node("entities")

func _init(prior, data).(Mode.Type.Place, prior, data): pass

func _ready() -> void:
	var building: Building = self.data.entity
	var unit: Unit = self.data.unitScene.instance()

	# set data
	unit.model = self.data.model
	unit.commander = self.stage.commander

	# set position
	unit.position = grid.snapped(building.position) + grid.Down

	# add to scene
	entities.add_child(unit)

	# disable selection
	unit.components.selecting.enable(false)

	yield(get_tree(), "idle_frame")
	self.succeed()
