extends CanvasLayer

onready var modeValue: RichTextLabel = $sections/modeBar/valueContainer/value
onready var selectionValue: RichTextLabel = $sections/selectionBar/valueContainer/value

func _ready() -> void:
	events.on("mode_changed", self, "_on_mode_changed")
	events.on("selected", self, "_on_selected")
	events.on("deselected", self, "_on_deselected")

func _on_mode_changed(mode: Node) -> void:
	modeValue.text = mode.name

func _on_selected(target: Node) -> void:
	selectionValue.text = target.name

func _on_deselected(target: Node) -> void:
	selectionValue.text = ""
