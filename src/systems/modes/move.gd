extends Mode

func _init(prior, data).(Mode.Type.Move, prior, data): pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_cancel"):
		cancel()
		return

	if Input.is_action_just_released("ui_select"):
		if isValid(self.data.entity, event.position):
			move(self.data.entity, event.position)
		return

func move(entity: Node2D, position: Vector2) -> void:
	# set new position
	entity.position = grid.snapped(position)

	# update map data
	self.map.updateEntity(entity)

	# change back to select mode
	modes.change(Mode.Type.Select)

	# emit signals
	entity.find_node("moving").emit_signal("moved")
	emit_signal("success")

func cancel() -> void:
	# change back to select mode
	modes.change(Mode.Type.Select)

	# emit signals
	emit_signal("cancel")


func isValid(entity: Entity, position: Vector2) -> bool:
	var gridPos := grid.toGrid(position)
	var possibleEntity := self.map.getEntity(gridPos)
	return possibleEntity == null and possibleEntity != entity
