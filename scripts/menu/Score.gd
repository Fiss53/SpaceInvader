extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(ev):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_text(get_node("/root/State").playerUsername + " Score: " + str(get_node("/root/State").enemy_count_score))
