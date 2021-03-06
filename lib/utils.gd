class_name utils extends Reference

static func printNode(node: Node) -> void:
	prints(node.name, node, node.get_children())

static func getAncestor(node: Node, name: String) -> Node:
	var parent = node.get_parent()
	while parent != null:
		if node.name == name: return parent
		parent = parent.get_parent()
	return null

static func isClick(event: InputEvent, button: int = 1) -> bool:
	return (
		event is InputEventMouseButton and
		event.button_index == button and
		event.is_pressed()
	)

static func hasPoint(polygon: Polygon2D, point: Vector2) -> bool:
	if not polygon.has_method("get_polygon"): return false

	var verts := polygon.get_polygon()
	var isInside := false;

	for v in range(verts.size()):
		verts[v] = verts[v] + polygon.position

	var vert2 := verts[-1]
	for vert in verts:
		var intersects = (
			(vert.y > point.y) != (vert2.y > point.y) and
			point.x < (vert2.x - vert.x) * (point.y - vert.y) / (vert2.y - vert.y) + vert.x
		)
		if intersects: isInside = !isInside
		vert2 = vert

	return isInside

static func lowerFirst(value: String) -> String:
	return value[0].to_lower() + value.substr(1)

static func getBasename(resourcePath: String) -> String:
	return resourcePath.get_file().trim_suffix("." + resourcePath.get_extension()).capitalize()
