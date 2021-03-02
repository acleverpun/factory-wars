extends PopupDialog

signal bought

var selected: int
var factory: Factory
var listItems: Array

onready var buyButton: Button = $buy
onready var description: RichTextLabel = $description
onready var list: ItemList = $list
onready var price: RichTextLabel = $price

func _ready() -> void:
	_populate()
	popup()

func _populate() -> void:
	list.clear()

	for l in len(listItems):
		var listItem = listItems[l]
		list.add_item("%s [%d]" % [ listItem.name, listItem.cost.money ])
		list.set_item_disabled(l, not listItem.enabled)
		list.set_item_metadata(l, listItem)

func setData(data: Dictionary) -> void:
	factory = data.get("entity")
	listItems = factory.unitList

func _on_change(index: int) -> void:
	if list.is_item_disabled(index): return

	selected = index

	var listItem = listItems[index]
	description.text = listItem.description
	price.text = str(listItem.cost.money)

	buyButton.disabled = false

func _on_buy() -> void:
	var listItem = listItems[selected]
	emit_signal("bought", listItem)
