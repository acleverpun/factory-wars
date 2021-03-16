extends Component

signal selected
signal deselected

export(Mode.Type) var intent

func _ready() -> void:
	events.on("turn:changed", self, "_on_turn_changed")

func _on_turn_changed(turn: int, commander: int) -> void:
	self.enable(entity.commander == map.commander)
