extends Polygon2D

func onSelect():
	print("selected: " + self.name)

func onDeselect():
	print("deselected: ", self.name)
