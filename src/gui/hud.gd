extends CanvasLayer

onready var selection: RichTextLabel = $sections/selectionBar/selectionContainer/selection

func _ready():
	events.on("selected", self, "_onSelected")
	events.on("deselected", self, "_onDeselected")

func _onSelected(target: Node):
	prints("selected", target)
	selection.text = target.name

func _onDeselected(target: Node):
	prints("deselected", target)
	selection.text = ""
