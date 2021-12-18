extends MarginContainer

# const Game = preload("res://src/scenes/game.tscn")

# TODO: ultimately there will be some list of stages or something,
# and each entry will have its own stage model.
export(StageModel) var stage

func _on_sandbox_pressed() -> void:
	# var game: Game = Game.instance()
	get_tree().change_scene_to(stage.map)

func _on_quit_pressed() -> void:
	get_tree().quit()
