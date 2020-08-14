extends Polygon2D

export var value := 0
export var gain := 10

func _ready():
	events.on("round:changed", self, "_onRoundChanged")

func _onRoundChanged(currentRound: int):
	value += gain
	prints("round changed", currentRound, value)

func _onSelected():
	prints(value)
