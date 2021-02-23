class_name UnitData extends Resource

export(PackedScene) var entity = preload("res://src/entities/units/unit.tscn")

export(String) var name
export(String, MULTILINE) var description
export(bool) var enabled = true

export(Resource) var cost = preload("res://src/models/cache.tres")
