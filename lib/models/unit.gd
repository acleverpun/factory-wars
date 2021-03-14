class_name UnitModel extends EntityModel

export(PackedScene) var entity = preload("res://src/entities/units/unit.tscn")

export(bool) var enabled = true

# TODO: move to commander model
export(Color) var color

export(Cache) var cost: Cache
