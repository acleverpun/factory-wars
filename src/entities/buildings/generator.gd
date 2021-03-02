extends Building

export var value := 0
export var gain := 10

func _ready() -> void:
	events.on("round:changed", self, "_onRoundChanged")

func _onRoundChanged(currentRound: int) -> void:
	# TODO: redo using Cache
	value += gain
	prints("round changed", currentRound, value)

func _onSelected() -> void:
	prints(value)
