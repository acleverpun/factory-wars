extends Mode

const id = Mode.values.Move

onready var modes: Modes = get_parent()
onready var grid: Grid = modes.get_parent().get_node("grid")

func _init(value = null).(value): pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_cancel"):
		modes.change(Mode.values.Select)
		return

	if Input.is_action_just_released("ui_select"):
		self.value.position = grid.snapped(event.position)
		return
