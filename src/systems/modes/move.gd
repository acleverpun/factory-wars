extends Mode

const id = Mode.values.Move

onready var modes: Modes = get_parent()
onready var grid: Grid = modes.get_parent().get_node("grid")

func _init(value = null).(value): pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		modes.change(Mode.values.Select)

	# XXX
	if Input.is_action_just_pressed("game.context"):
		modes.change(Mode.values.Select)