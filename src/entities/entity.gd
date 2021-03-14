class_name Entity extends Node2D

export(EntityModel) var model: EntityModel
export(int) var commander

var components: Dictionary

onready var id := get_instance_id()
onready var map = get_tree().current_scene

func _ready() -> void:
	if model:
		var sprite: Sprite = Sprite.new()
		sprite.name = "sprite"
		sprite.texture = model.texture
		add_child(sprite)

	call_deferred("setup")

func setup() -> void:
	map.addEntity(self)
