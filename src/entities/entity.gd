tool
class_name Entity extends Node2D

export(EntityModel) var model: EntityModel

export(Commander) var commander: Commander

var sprite: Sprite

var components: Dictionary

onready var id := get_instance_id()
onready var map = get_tree().current_scene

func _ready() -> void:
	if model:
		# add sprite from model
		sprite = Sprite.new()
		sprite.name = "sprite"
		sprite.texture = model.texture
		add_child(sprite)

	call_deferred("setup")

func setup() -> void:
	if commander and sprite:
		# set sprite color
		sprite.modulate = commander.color

	map.addEntity(self)
