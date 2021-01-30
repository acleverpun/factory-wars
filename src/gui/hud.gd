extends CanvasLayer

onready var modeValue: RichTextLabel = $sections/modeBar/valueContainer/value
onready var selectionValue: RichTextLabel = $sections/selectionBar/valueContainer/value

func _ready() -> void:
	events.on("mode_changed", self, "_onModeChanged")
	events.on("selected", self, "_onSelected")
	events.on("deselected", self, "_onDeselected")

func _onModeChanged(mode: Node) -> void:
	modeValue.text = mode.name

func _onSelected(target: Node) -> void:
	selectionValue.text = target.name

func _onDeselected(target: Node) -> void:
	selectionValue.text = ""
