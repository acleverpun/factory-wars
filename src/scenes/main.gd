extends MarginContainer

onready var buttons = $rows/buttons
onready var sandboxButton: Button = buttons.get_node("sandbox")
onready var quitButton: Button = buttons.get_node("quit")

func _ready() -> void:
	sandboxButton.connect("button_down", self, "_onPressSandbox")
	quitButton.connect("button_down", self, "_onPressQuit")

func _onPressSandbox() -> void:
	get_tree().change_scene("res://src/maps/sandbox.tscn")

func _onPressQuit() -> void:
	get_tree().quit()
