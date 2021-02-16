extends Mode

const type := Mode.Type.Select
const group := "selecting"

var selection: Entity

func _init(value = null).(value): pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_select"):
		var gridPos := grid.toGrid(event.position)

		# TODO: improve
		var entity := self.map.getEntity(gridPos)

		# Check for selectable nodes in order of precedence
		if isValid(entity):
			select(entity)
		else:
			deselect()

func select(entity: Entity) -> void:
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

func isValid(entity: Entity) -> bool:
	return entity and entity.is_in_group(group)
