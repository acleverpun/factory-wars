extends Mode

const UnitScene := preload("res://src/entities/units/unit.tscn")
const factoryDialog := preload("res://src/gui/factoryDialog.tscn")

var dialog: PopupDialog

func _init(data).(Mode.Type.Build, data): pass

func _ready() -> void:
	dialog = factoryDialog.instance()
	dialog.setData(self.data)
	dialog.connect("bought", self, "_onBuy")
	map.add_child(dialog)

func _exit_tree() -> void:
	dialog.queue_free()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_cancel"):
		dialog.free()
		modes.change(Mode.Type.Select)
		return

func _onBuy(unitModel) -> void:
	# TODO: do price check here
	prints("onBuy", unitModel.name, unitModel.cost.money, self.data.entity)

	modes.change(Mode.Type.Place, {
		"entity": self.data.entity,
		"model": unitModel,
		"unitScene": UnitScene,
	})
