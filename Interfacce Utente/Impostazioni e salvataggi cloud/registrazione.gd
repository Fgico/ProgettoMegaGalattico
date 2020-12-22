extends Control

onready var mailField :LineEdit = get_node("VBoxContainer/HBoxContainer/email")
onready var passField :LineEdit = get_node("VBoxContainer/HBoxContainer2/pass")
onready var passConField :LineEdit = get_node("VBoxContainer/HBoxContainer3/passconfirm")
onready var requester : HTTPRequest = get_node("HTTPRequest")

onready var res = get_node("result")

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	var responseBody = JSON.parse(body.get_string_from_ascii())
	if(response_code != 200):
		res.text = responseBody.result.error.message
	else:
		res.text ="Success!"


func _on_Button_pressed():
	if(passField.text != passConField.text or passField.text.empty() or mailField.text.empty()):
		res.text = "Forms not correctly filled!"
	else:
		Firebase.register(mailField.text, passField.text,requester)
