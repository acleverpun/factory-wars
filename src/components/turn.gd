extends Component

signal changed(turn, team)

# TODO: get teams from map or dynamically
@export var teams := 2

var team := 0
var turn := 0

func _unhandled_key_input(event: InputEventKey) -> void:
	if not event.is_action_type(): return

	if Input.is_action_just_pressed("ui_accept"):
		nextTurn()

func nextTurn() -> void:
	team = (team + 1) % teams
	if team == 0:
		turn += 1

	emit_signal("changed", team, turn)
