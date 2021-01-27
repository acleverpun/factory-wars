extends Node

func _ready() -> void:
	prints("System ready:", self.name)

func on(event: String, node: Node, method: String, args := []) -> void:
	_ensure(event)
	connect(event, node, method)

func _ensure(event: String) -> void:
	if not has_user_signal(event):
		add_user_signal(event)
