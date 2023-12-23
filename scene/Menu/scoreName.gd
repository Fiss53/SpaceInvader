extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var classement = get_node("/root/State").classement
	var i = 0
	for label in get_children():
		if classement[i][-1] == "":
			break;
		label.text = classement[i][0]
		i += 1
