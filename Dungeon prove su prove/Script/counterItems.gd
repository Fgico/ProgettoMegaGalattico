extends Label

var items = 0

func _ready():
	text = String(items)

#incremento items raccolti
func _on_Item_itemCollected():
	items = items + 1
	_ready()
