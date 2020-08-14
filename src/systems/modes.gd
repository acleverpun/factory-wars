extends Node

enum Mode {
	Select,
}

onready var modes = {
	Mode.Select: $select,
}

var mode

func _ready():
	prints("System ready:", self.name)
	switch(Mode.Select)

func switch(mode, value = null):
	if self.mode:
		remove_child(self.mode)
	self.mode = modes[mode]
	self.mode.value = value
	add_child(self.mode)
