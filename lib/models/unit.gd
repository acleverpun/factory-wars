class_name UnitModel extends EntityModel

export(PackedScene) var entity = preload("res://src/entities/units/unit.tscn")

export(bool) var enabled = true

export(Cache) var cost: Cache
