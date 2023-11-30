extends VBoxContainer

var playerUsername
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("ui_accept_username")):
		get_tree().change_scene_to_file("res://scene/menu.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scene/menu.tscn")


func _on_line_edit_text_submitted(new_text):
	playerUsername = new_text
