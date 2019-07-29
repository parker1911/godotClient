extends Node

const PORT = 4050

var id
var userName
var password
var ip
var cube = preload("res://Scenes/World.tscn")

func _ready():
	var a = get_tree().connect("connected_to_server", self, "enter_room")
	var b = get_tree().connect("server_disconnected", self, "serverGotDisconnected")
	print(a)
	print(b)


func _on_Join_button_down():
	var host = NetworkedMultiplayerENet.new()
	ip = $"../UI/LoginScreen/IPAddress".text
	host.create_client(ip, PORT)
	get_tree().set_network_peer(host)	
	
	
func enter_room():
	print("connected to the sever")
	id = get_tree().get_network_unique_id()
	print(id)
	$"../UI/LoginScreen/Join".hide()
	$"../UI/LoginScreen/login".show()
	
	
func serverGotDisconnected():
	print("disconnected from the sever")
	get_tree().set_network_peer(null)
	
remote func userThere():
	get_tree().get_root().add_child(cube.instance())
	$"../UI/LoginScreen".hide()
	$"../UI/Game".show()
	
	print("user is here") 

remote func userNotThere():
	print("no user exist")	
	

func _on_login_button_down():
	userName = $"../UI/LoginScreen/NameInput".text
	password = $"../UI/LoginScreen/PassWordInput".text
	rpc_id(1,"playerInfo",userName,password)
