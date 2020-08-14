extends Polygon2D

export var value := 0
export var gain := 10

func _ready():
	events.on("round:changed", self, "onRound")

func onRound(currentRound: int):
	value += gain
	prints("round changed", currentRound, value)

func onSelect():
	prints(value)
