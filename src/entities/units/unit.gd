class_name Unit extends Entity

func _ready() -> void:
	if model:
		self.color = model.color
