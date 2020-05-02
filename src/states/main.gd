extends ViewportContainer

const utils = preload("res://src/utils.gd")

onready var Map = preload("res://src/maps/lab.tscn")

var map
# var selected

func _ready():
	map = Map.instance()
	map.name = "map"
	add_child(map)

func _input(event):
	if Input.is_action_pressed("game.close"): get_tree().quit()
	elif Input.is_action_pressed("game.restart"): get_tree().reload_current_scene()

	if utils.isClick(event):
		var nodes = map.get_children()

		for node in nodes:
			if not node.has_node("selectable"): break

			if utils.hasPoint(node, event.get_position()):
				# if selected == node: return
				# if selected: selected.get_node("selectable").deselect()
				# if node.get_node("selectable").toggle():
				# 	selected = node
				node.get_node("selectable").select()
				break
