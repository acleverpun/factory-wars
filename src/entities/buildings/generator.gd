extends Building

export(Cache) var cache: Cache

onready var source: Wrapper = $source

func _ready() -> void:
	events.on("turn:changed", self, "_on_turn_changed")

func _on_turn_changed(turn: int, commanderId: int) -> void:
	cache.add(source.value)

func _on_selected() -> void:
	prints(cache)
