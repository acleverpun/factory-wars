extends Node

func _ready():
	prints("Event system ready")

func create(event: String):
	if not has_user_signal(event): add_user_signal(event)

func needs(events: Array):
	for event in events:
		create(event)

func on(event: String, node: Node, method: String, args := []):
	prints("Binding event...", event, method)
	connect(event, node, method)
