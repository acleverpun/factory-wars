extends MarginContainer

export(StageModel) var stage

func _on_sandbox_pressed() -> void:
	get_tree().change_scene_to(stage.map)

func _on_quit_pressed() -> void:
	get_tree().quit()
