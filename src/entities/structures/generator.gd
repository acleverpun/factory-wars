extends Polygon2D

export var value := 0
export var gain := 10

func _ready():
	events.on("round:next", self, "onRound")

func onRound(currentRound: int):
	value += gain
	prints("next round", currentRound, value)

func onSelect():
	prints(value)
