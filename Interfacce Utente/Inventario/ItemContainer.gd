extends HBoxContainer

var item = null
var itemPos = 0
var item_curr = null

func _on_ItemContainer_gui_input(event):
	get_parent().selezionaOggetto(item, itemPos)
	pass # Replace with function body.
