extends Building

@export var value: int
@export var gain := 20

func setup(turn: int):
	value += gain
	prints("generator setup", turn, team, value)
