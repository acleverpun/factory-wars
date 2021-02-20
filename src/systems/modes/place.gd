extends Mode

func _init(value = null).(Mode.Type.Place, value): pass

func _ready() -> void:
	var unit: Unit = value.new()
	prints("place", unit)
