extends Node

func _ready():
	prints("System ready: events")

func ensure(event: String):
	if not has_user_signal(event):
		prints("Creating event...", event)
		add_user_signal(event)

func on(event: String, node: Node, method: String, args := []):
	ensure(event)

	prints("Binding event...", event, method)
	connect(event, node, method)
