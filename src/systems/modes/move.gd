extends Mode

func _init(value = null).(Mode.Type.Move, value): pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_cancel"):
		modes.change(Mode.Type.Select)
		return

	if Input.is_action_just_released("ui_select"):
		if isValid(self.value, event.position):
			move(self.value, event.position)
		return

func move(entity: Node2D, position: Vector2) -> void:
	entity.position = grid.snapped(position)
	self.map.updateEntity(entity)
	entity.find_node("moving").emit_signal("moved")

func isValid(entity: Entity, position: Vector2) -> bool:
	var gridPos := grid.toGrid(position)
	var possibleEntity := self.map.getEntity(gridPos)
	return possibleEntity == null and possibleEntity != entity
