extends Mode

const group := "selecting"

var selection: Entity

func _init(data).(Mode.Type.Select, data): pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_select"):
		var gridPos := grid.toGrid(event.position)
		var entity := self.map.getEntity(gridPos)

		# Check for selectable nodes
		if isValid(entity):
			select(entity)
		else:
			deselect()

func select(entity: Entity) -> void:
	# change to mode specified by intent
	var selecting := entity.find_node(group)
	var intent: int = selecting.intent
	if intent != Mode.Type.None:
		modes.change(intent, { "entity": entity })

	# select new entity
	selection = entity
	events.emit_signal("selected", selection)
	selection.find_node(group).emit_signal("selected")

func deselect() -> void:
	if not selection: return
	events.emit_signal("deselected", selection)
	selection.find_node(group).emit_signal("deselected")
	selection = null

func isValid(entity: Entity) -> bool:
	return entity and entity.is_in_group(group) and entity.find_node(group).enabled
