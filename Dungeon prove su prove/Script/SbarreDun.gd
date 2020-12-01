extends Area


func _ready():
	pass # Replace with function body.


func _on_SbarreDun_body_entered(body):
	if body.name == "player":
		var passaggio = load("res://Scene Principali/Passaggio.tscn")
		var passaggioCreato = passaggio.instance() 
		passaggioCreato.get_node("Sbarre").ponte = get_parent().ponte #usiamo Dun1 (ponte) come ponte per passare il nodo
		get_parent().get_parent().add_child(passaggioCreato)
		passaggioCreato.get_node("Camera").current = true
		passaggioCreato.get_node("player").UI.hide()
		body.UI.hide()
