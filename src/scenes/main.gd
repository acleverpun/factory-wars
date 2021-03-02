extends MarginContainer

onready var buttons = $rows/buttons
onready var sandboxButton: Button = buttons.get_node("sandbox")
onready var quitButton: Button = buttons.get_node("quit")

func _ready() -> void:
	sandboxButton.connect("button_down", self, "_on_press_sandbox")
	quitButton.connect("button_down", self, "_on_press_quit")

func _on_press_sandbox() -> void:
	get_tree().change_scene("res://src/maps/sandbox.tscn")

func _on_press_quit() -> void:
	get_tree().quit()
