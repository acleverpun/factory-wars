class_name Cache extends Resource

export(int) var copper
export(int) var food
export(int) var iron
export(int) var money

func _to_string() -> String:
	return "{[Cache] money: %d, copper: %d, food: %d, iron: %d }" % [ money, copper, food, iron ]

func subtract(other: Resource) -> void:
	copper -= other.copper
	food -= other.food
	iron -= other.iron
	money -= other.money

func contains(other: Resource) -> bool:
	return (
		copper - other.copper >= 0 and
		food - other.food >= 0 and
		iron - other.iron >= 0 and
		money - other.money >= 0
	)
