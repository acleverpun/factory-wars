extends Node

func _ready() -> void:
	prints("System ready:", self.name)

func ensure(event: String) -> void:
	if not has_user_signal(event):
		prints("Creating event...", event)
		add_user_signal(event)

func on(event: String, node: Node, method: String, args := []) -> void:
	ensure(event)

	prints("Binding event...", event, method)
	connect(event, node, method)
