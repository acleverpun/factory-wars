extends CanvasLayer

onready var selection: RichTextLabel = $sections/selectionBar/selectionContainer/selection

func _ready():
	events.on("selected", self, "_onSelected")
	events.on("deselected", self, "_onDeselected")

func _onSelected(target: Node):
	selection.text = target.name

func _onDeselected(target: Node):
	selection.text = ""
