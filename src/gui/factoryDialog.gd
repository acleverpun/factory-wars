extends PopupDialog

signal bought

var selected: int
var factory: Factory
var listItems: Array

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
		list.set_item_disabled(l, not listItem.enabled)
		list.set_item_metadata(l, listItem)

func setData(data: Dictionary) -> void:
	factory = data.get("entity")
	listItems = factory.unitList

func _onChange(index: int) -> void:
	if list.is_item_disabled(index): return

	selected = index

	var listItem = listItems[index]
	description.bbcode_text = listItem.description

	buyButton.disabled = false

func _onBuy() -> void:
	var listItem = listItems[selected]
	emit_signal("bought", listItem)
