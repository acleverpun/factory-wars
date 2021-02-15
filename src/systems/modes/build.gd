extends Mode

const type := Mode.Type.Build
const factoryDialog = preload("res://src/gui/factoryDialog.tscn")

var dialog: PopupDialog

func _init(value = null).(value): pass

func _ready() -> void:
	dialog = factoryDialog.instance()
	map.add_child(dialog)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_cancel"):
		dialog.free()
		modes.change(Mode.Type.Select)
		return
