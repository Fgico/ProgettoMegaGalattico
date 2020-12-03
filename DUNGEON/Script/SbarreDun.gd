extends Area

onready var nodoDungeon = get_tree().root.get_node("nodo_dungeon")


func _on_SbarreDun_body_entered(body):
	if body.name == "player":
		var passaggio = load("res://DUNGEON/Scene Principali/Passaggio.tscn")
		var passaggioCreato = passaggio.instance() 
		passaggioCreato.get_node("Sbarre").ponte = get_parent().ponte #usiamo Dun1 (ponte) come ponte per passare il nodo
		nodoDungeon.add_child(passaggioCreato)
		passaggioCreato.get_node("Camera").current = true
		passaggioCreato.get_node("player").UI.hide()
		body.UI.hide()
		nodoDungeon.pianoAttuale.queue_free()
		nodoDungeon.pianoAttuale = passaggioCreato
