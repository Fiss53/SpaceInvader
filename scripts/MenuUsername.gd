extends VBoxContainer

var buttonReady = false
func _ready():
	if buttonReady:
		var button = get_node("Button")
		if(Input.is_action_pressed("ui_accept_username") || buttonReady):
			get_node("/root/State").playerUsername = get_node("LineEdit").text
			get_tree().change_scene_to_file("res://scene/Menu/menu.tscn")



func _process(delta):
	
	if buttonReady:
		var button = get_node("Button")
		if(Input.is_action_pressed("ui_accept_username") || buttonReady):
			get_node("/root/State").playerUsername = $LineEdit.text
			get_tree().change_scene_to_file("res://scene/Menu/menu.tscn")



func _on_line_edit_text_submitted(new_text):
	var playerUsername = get_node("/root/State").playerUsername
	get_node("/root/State").playerUsername = new_text





func _on_button_pressed():
	buttonReady = true
