extends Component

signal selected
signal deselected

export(Mode.Type) var intent

func _ready() -> void:
	events.on("round:changed", self, "_on_round_changed")

func _on_round_changed(currentRound: int) -> void:
	self.enable()
