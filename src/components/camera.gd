extends Camera2D

const zoomMax = Vector2.ONE
const zoomMin = 0.1 * Vector2.ONE
const zoomStep = 0.1 * Vector2.ONE

var initialZoom := self.zoom

func _ready() -> void:
	changeZoom()

func _unhandled_input(event: InputEvent) -> void:
	# zoom in
	if Input.is_action_pressed("cam.zoom.out") and self.zoom + zoomStep < zoomMax:
		changeZoom(1)
		return

	# zoom out
	if Input.is_action_pressed("cam.zoom.in") and self.zoom - zoomStep > zoomMin:
		changeZoom(-1)
		return

	# zoom reset
	if Input.is_action_pressed("cam.zoom.reset"):
		changeZoom()
		return

func changeZoom(level: int = 0):
	# allow resetting zoom
	if level == 0:
		self.zoom = initialZoom
		return

	self.zoom += level * zoomStep
