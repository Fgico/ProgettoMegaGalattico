extends Control

onready var mailField = get_node("VBoxContainer/HBoxContainer/LineEdit")
onready var passField = get_node("VBoxContainer/HBoxContainer2/LineEdit2")
onready var requester = get_node("HTTPRequest")

onready var res = get_node("result")

# con 0 salva con 1 carica
var saveOrLoad = 0

func _on_Button_pressed():
	if(mailField.text.empty() or passField.text.empty()):
		print("bad input")
	else:
		Firebase.login(mailField.text,passField.text, requester, saveOrLoad)


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var responseBody = JSON.parse(body.get_string_from_ascii())
	if response_code != 200:
		res.text = responseBody.result.error.message.capitalize()
	else:
		res.text = "Success!"
