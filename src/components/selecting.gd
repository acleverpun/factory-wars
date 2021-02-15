extends Component

signal selected
signal deselected

export(Mode.Type) var intent

# # TODO: decide whether I always want to connect these, or connect in parent classes when desired
# if parent.has_method("_onSelected"): connect("selected", parent, "_onSelected")
# if parent.has_method("_onDeselected"): connect("deselected", parent, "_onDeselected")
