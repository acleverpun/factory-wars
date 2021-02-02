extends Node

func _ready() -> void:
	prints("System ready:", self.name)

func on(event: String, node: Node, method: String, args := []) -> void:
	_ensure(event)
	connect(event, node, method)

# Emit signal after ensuring it exists
# FIXME: remove after support for varargs lands [#1034](https://github.com/godotengine/godot-proposals/issues/1034)
func emit(event: String, value) -> void:
	_ensure(event)
	.emit_signal(event, value)

func _ensure(event: String) -> void:
	if not has_user_signal(event):
		add_user_signal(event)
