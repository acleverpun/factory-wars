extends Mode

const group := "selecting"

var selection: Entity

func _init(prior, data).(Mode.Type.Select, prior, data): pass

func _input(event: InputEvent) -> void:
	if not event.is_action_type(): return

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
		var mode: Mode = modes.change(intent, { "entity": entity })
		mode.connect("success", self, "_on_intent_success", [ mode ], CONNECT_ONESHOT)
		mode.connect("cancel", self, "_on_intent_cancel", [ mode ], CONNECT_ONESHOT)

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

func _on_intent_success(mode: Mode) -> void:
	# disable selection for the rest of the turn
	selection.components.selecting.enable(false)

func _on_intent_cancel(mode: Mode) -> void:
	pass
