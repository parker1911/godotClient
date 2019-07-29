extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_NewUser_button_down():
	$"../NewUser".show()
	$".".hide()


func _on_Back_button_down():
	$"../NewUser".hide()
	$".".show()