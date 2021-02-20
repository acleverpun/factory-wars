extends Mode

const UnitScene = preload("res://src/entities/units/unit.tscn")
const factoryDialog = preload("res://src/gui/factoryDialog.tscn")

var dialog: PopupDialog

func _init(value = null).(Mode.Type.Build, value): pass

func _ready() -> void:
	dialog = factoryDialog.instance()
	dialog.connect("bought", self, "_onBuy")
	map.add_child(dialog)

func _exit_tree() -> void:
	dialog.queue_free()

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_cancel"):
		dialog.free()
		modes.change(Mode.Type.Select)
		return

func _onBuy(unitData) -> void:
	modes.change(Mode.Type.Place, [ value, UnitScene ])
