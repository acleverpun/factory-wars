extends PopupDialog

var listItems := [
	{
		"name": "Foo",
		"description": "Foooooood.",
	},
	{
		"name": "Bar",
		"description": "Baaaaaard.",
	},
	{
		"name": "Baz",
		"description": "Baaaaaaaz.",
		"enabled": false,
	},
]

onready var buyButton: Button = $buy
onready var description: RichTextLabel = $description
onready var list: ItemList = $list

func _ready() -> void:
	_populate()
	popup()

func _populate() -> void:
	list.clear()

	for l in len(listItems):
		var listItem = listItems[l]
		list.add_item(listItem.name)
		list.set_item_disabled(l, not listItem.get("enabled", true))

func _onChange(index: int) -> void:
	if list.is_item_disabled(index): return
	prints(listItems[index])
