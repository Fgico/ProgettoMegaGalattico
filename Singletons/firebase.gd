extends Node

const apiKey = "qua"
const projId = "qui"

const registerUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=%s" % apiKey
const loginUrl = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=%s" % apiKey
const firestoreUrl = "https://firestore.googleapis.com/v1/projects/%s/databases/(default)/documents/" % projId

var userInfo = {
	
	
}

func getUserInfo(result):
	var resultBody = JSON.parse(result[3].get_string_from_ascii()).result as Dictionary
	return {
			"token" : resultBody.idToken,
			"id" 	: resultBody.localId
		}
	
func getHeaders():
	return PoolStringArray([
		"Content-Type: application/json",
		"Authorization: Bearer %s" % userInfo.token
	])
	
func register(email, password, httpNode):
	var body = {
		"email" : email,
		"password" : password,
	}
	httpNode.request(registerUrl,[], true,HTTPClient.METHOD_POST,to_json(body))
	var result = yield(httpNode, "request_completed") as Array
	if( result[1]== 200):
		userInfo = getUserInfo(result)
		saveDic(httpNode)

func login(email, password, httpNode, saveOrLoad):
	var body = {
		"email" : email,
		"password" : password,
		"returnSecureToken" : true
	}
	httpNode.request(loginUrl,[], true,HTTPClient.METHOD_POST,to_json(body))
	var result = yield(httpNode, "request_completed") as Array
	if( result[1]== 200):
		userInfo = getUserInfo(result)
		if(saveOrLoad == 1):
			getDic(httpNode)
		else:
			updateDic(httpNode)
		
	
func saveDic(requester):
	var path = firestoreUrl + "users?documentId=%s" %  userInfo.id
	var body = {
		"fields" : prepareDataToSend()
	}
	body = to_json(body)
	requester.request(path, getHeaders(), true, HTTPClient.METHOD_POST, body)
	
func getDic(requester):
	var path = firestoreUrl + "users/%s" %  userInfo.id
	requester.request(path, getHeaders(), true, HTTPClient.METHOD_GET)

func updateDic(requester):
	var path = firestoreUrl + "users/%s" %  userInfo.id
	var body = {
		"fields" : prepareDataToSend()
	}
	body = to_json(body)
	requester.request(path, getHeaders(), true, HTTPClient.METHOD_PATCH, body)
	
func deleteDic(requester):
	var path = firestoreUrl + "users/%s" % userInfo.id
	requester.request(path, getHeaders(), true, HTTPClient.METHOD_DELETE)

func prepareDataToSend():
	var file = {
		"curwpn" : {"integerValue" : userData.equipped.curWeapon},
		"curhead" : {"integerValue" : userData.equipped.head},
		"curchest" : {"integerValue" : userData.equipped.chest},
		"curpants" : {"integerValue" : userData.equipped.pants},
		"curshoes" : {"integerValue" : userData.equipped.shoes},
		"numCoin": {"integerValue" : userData.numCoin},
		"numItem" : {"integerValue" : userData.numItem},
		"cityStatus" : {"integerValue" : userData.cityStatus.smith},
		"weapons" : {"arrayValue": {"values" : [{"integerValue" : 0}]}},
		"armors"  : {"arrayValue": {"values" : [{"integerValue" : 0}]}}
	}
	for arma in userData.inventory.weapons:
		file.weapons.arrayValue.values.append({"integerValue": arma})
	for armor in userData.inventory.armors:
		file.armors.arrayValue.values.append({"integerValue": armor})
	return file

func storeReceivedData(body):
	var file = body.fields
	userData.equipped.curWeapon = int(file.curwpn.integerValue)
	userData.equipped.head = int(file.curhead.integerValue)
	userData.equipped.chest = int(file.curchest.integerValue)
	userData.equipped.pants = int(file.curpants.integerValue)
	userData.equipped.shoes = int(file.curshoes.integerValue)
	userData.numCoin = int(file.numCoin.integerValue)
	userData.numItem = int(file.numItem.integerValue)
	userData.cityStatus.smith = int(file.cityStatus.integerValue)
	userData.inventory.weapons = []
	for arma in file.weapons.arrayValue.values:
		if (int(arma.integerValue) != 0):
			userData.inventory.weapons.append(int(file.weapons.arrayValue.values[arma].integerValue))
	userData.inventory.armors = []
	for armor in file.armors.arrayValue.values:
		if(int(armor.integerValue) != 0):
			userData.inventory.armors.append(int(file.armors.arrayValue.values[armor].integerValue))
