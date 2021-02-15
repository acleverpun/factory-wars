extends Mode

const type := Mode.Type.Move

func _init(value = null).(value): pass

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_cancel"):
		modes.change(Mode.Type.Select)
		return

	if Input.is_action_just_released("ui_select"):
		move(self.value, event.position)
		return

func move(entity: Node2D, position: Vector2) -> void:
	entity.position = grid.snapped(position)
	self.map.updateEntity(entity)
	entity.find_node("moving").emit_signal("moved")
