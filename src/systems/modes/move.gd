extends Mode

onready var modes: Modes = get_parent()
onready var grid: Grid = modes.get_parent().get_node("grid")

func _init(value = null).(value): pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		modes.change(modes.Select)

		# TODO: deselect unit somehow
		# deselect self.value
		# TODO: safeguard

	# XXX
	if Input.is_action_just_pressed("game.context"):
		modes.change(modes.Select)
