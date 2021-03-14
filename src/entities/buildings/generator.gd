extends Building

export(Cache) var cache: Cache

onready var source: Wrapper = $source

func _ready() -> void:
	events.on("round:changed", self, "_on_round_changed")

func _on_round_changed(turn: int, commander: int) -> void:
	cache.add(source.value)

func _on_selected() -> void:
	prints(cache)
