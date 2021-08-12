extends MarginContainer

func _on_sandbox_pressed() -> void:
	get_tree().change_scene("res://src/maps/map.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
