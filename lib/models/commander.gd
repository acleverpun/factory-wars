class_name Commander extends Resource

export(String) var name: String

export(Image) var portrait: Image

export(Color) var color: Color

export(Cache) var cache: Cache

func _init() -> void:
	if cache == null:
		cache = Cache.new()
