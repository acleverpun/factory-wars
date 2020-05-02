static func isClick(event, button = 1):
	return (
		event is InputEventMouseButton and
		event.button_index == button and
		event.is_pressed()
	)

static func hasPoint(polygon, point):
	if not polygon.has_method("get_polygon"): return false

	var verts = polygon.get_polygon()
	var isInside = false;

	for v in range(verts.size()):
		verts[v] = verts[v] + polygon.position

	var vert2 = verts[-1]
	for vert in verts:
		var intersects = (
			(vert.y > point.y) != (vert2.y > point.y) &&
			point.x < (vert2.x - vert.x) * (point.y - vert.y) / (vert2.y - vert.y) + vert.x
		)
		if intersects: isInside = !isInside
		vert2 = vert

	return isInside
