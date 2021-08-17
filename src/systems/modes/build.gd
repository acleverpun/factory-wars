extends Mode

const UnitScene := preload("res://src/entities/units/unit.tscn")
const factoryDialog := preload("res://src/gui/factoryDialog.tscn")

var dialog: PopupDialog

func _init(prior, data).(Mode.Type.Build, prior, data): pass

func _ready() -> void:
	dialog = factoryDialog.instance()
	dialog.setData(self.data)
	dialog.connect("bought", self, "_on_buy")
	self.stage.add_child(dialog)

func _exit_tree() -> void:
	dialog.queue_free()

func _input(event: InputEvent) -> void:
	if not event.is_action_type(): return

	if Input.is_action_just_released("ui_cancel"):
		dialog.queue_free()
		self.cancel()
		return

func _on_buy(unitModel) -> void:
	if not self.stage.commander.cache.contains(unitModel.cost):
		prints("Nope. Not enough money.")
		return

	self.stage.commander.cache.subtract(unitModel.cost)

	var mode: Mode = modes.change(Mode.Type.Place, {
		"entity": self.data.entity,
		"model": unitModel,
		"unitScene": UnitScene,
	})

	mode.connect("success", self, "_on_place_success", [ mode ], CONNECT_ONESHOT)

func _on_place_success(mode: Mode) -> void:
	# disable selection for the rest of the turn
	self.data.entity.components.selecting.enable(false)
