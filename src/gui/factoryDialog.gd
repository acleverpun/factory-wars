extends PopupDialog

signal bought

var listItems := [
	{
		"name": "Foo",
		"description": "Foooooood.",
		"cost": 10,
	},
	{
		"name": "Bar",
		"description": "Baaaaaard.",
		"cost": 20,
	},
	{
		"name": "Baz",
		"enabled": false,
		"description": "Baaaaaaaz.",
		"cost": 2,
	},
]

var selected: int

onready var buyButton: Button = $buy
onready var description: RichTextLabel = $description
onready var list: ItemList = $list

func _ready() -> void:
	_populate()
	popup()

func _populate() -> void:
	list.clear()

	for index in len(listItems):
		var listItem = listItems[index]
		list.add_item(listItem.name)
		list.set_item_disabled(index, not listItem.get("enabled", true))
		list.set_item_metadata(index, listItem)

func _onChange(index: int) -> void:
	if list.is_item_disabled(index): return

	selected = index

	var listItem = listItems[index]
	description.bbcode_text = listItem.description

	buyButton.disabled = false

func _onBuy() -> void:
	var listItem = listItems[selected]
	emit_signal("bought", listItem)
