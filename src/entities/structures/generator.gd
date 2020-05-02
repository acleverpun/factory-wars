extends Polygon2D

func onSelect():
	print("selected: " + name)

func onDeselect():
	print("deselected: ", self.name)
