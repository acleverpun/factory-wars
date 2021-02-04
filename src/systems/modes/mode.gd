class_name Mode extends Node

enum values {
	Null,
	Select,
	Move,
}

var value

func _init(arg = null):
	value = arg
