extends Node

enum Mode {
	Select,
}

const modes = {
	Mode.Select: preload("modes/select.gd"),
}

var mode

func _ready():
	prints("System ready:", self.name)
	switch(Mode.Select)

func switch(mode, value = null):
	if self.mode:
		remove_child(self.mode)
	self.mode = modes[mode].new()
	self.mode.name = Mode.keys()[mode]
	self.mode.value = value
	add_child(self.mode)
