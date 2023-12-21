extends VBoxContainer

var playerUsername

func _ready():
	if(Input.is_action_pressed("ui_accept_username")):
		get_tree().change_scene_to_file("res://scene/Menu/menu.tscn")



func _process(delta):
	if(Input.is_action_pressed("ui_accept_username")):
		get_tree().change_scene_to_file("res://scene/Menu/menu.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scene/Menu/menu.tscn")


func _on_line_edit_text_submitted(new_text):
	playerUsername = new_text
