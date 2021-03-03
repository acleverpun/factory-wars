class_name UnitModel extends EntityModel

export(PackedScene) var entity = preload("res://src/entities/units/unit.tscn")

export(bool) var enabled = true
export(Color) var color

export(Cache) var cost: Cache
