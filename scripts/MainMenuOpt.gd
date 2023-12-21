extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	if(get_tree().paused == true):
		get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scene/MainScene.tscn")



func _on_quit_pressed():
	get_tree().quit()


func _on_settings_pressed():
	pass


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scene/Menu/c_credit.tscn")
