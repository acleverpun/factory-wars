extends Mode

const UnitScene := preload("res://src/entities/units/unit.tscn")
const factoryDialog := preload("res://src/gui/factoryDialog.tscn")

var dialog: PopupDialog

func _init(prior, data).(Mode.Type.Build, prior, data): pass

func _ready() -> void:
	dialog = factoryDialog.instance()
	dialog.setData(self.data)
	dialog.connect("bought", self, "_on_buy")
	map.add_child(dialog)

func _exit_tree() -> void:
	dialog.queue_free()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_cancel"):
		dialog.queue_free()
		modes.change(Mode.Type.Select)
		return

func _on_buy(unitModel) -> void:
	if not map.cache.contains(unitModel.cost):
		prints("Nope. Not enough money.")
		return

	map.cache.subtract(unitModel.cost)

	modes.change(Mode.Type.Place, {
		"entity": self.data.entity,
		"model": unitModel,
		"unitScene": UnitScene,
	})
