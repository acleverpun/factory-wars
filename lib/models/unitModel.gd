class_name UnitModel extends Resource

export(PackedScene) var entity = preload("res://src/entities/units/unit.tscn")

export(String) var name
export(String, MULTILINE) var description
export(bool) var enabled = true

export(Cache) var cost
