extends Mode

const type := Mode.Type.Select
const group := "selecting"

var selection: Entity

onready var modes: Modes = get_parent()

func _init(value = null).(value): pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_select"):
		var gridPos := grid.toGrid(event.position)

		# TODO: improve
		var unit := self.map.layers.getEntity(Entity.Type.Unit, gridPos) as Entity
		var building := self.map.layers.getEntity(Entity.Type.Building, gridPos) as Entity

		# Check for selectable nodes in order of precedence
		if not trySelect(unit):
			trySelect(building)

func select(entity: Entity) -> void:
	if entity == selection: return

	# deselect prior entity, if any
	deselect()

	# change to mode specified by intent
	var selecting := entity.find_node("selecting")
	var intent: int = selecting.intent
	if intent != Mode.Type.None:
		modes.change(intent, entity)

	# select new entity
	selection = entity
	events.emit_signal("selected", selection)
	selection.find_node("selecting").emit_signal("selected")

func deselect() -> void:
	if not selection: return
	events.emit_signal("deselected", selection)
	selection.find_node("selecting").emit_signal("deselected")
	selection = null

func trySelect(entity: Entity) -> bool:
	if not entity or not entity.is_in_group(group):
		deselect()
		return false

	if not entity: return false

	select(entity)
	return true
