extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Hp.lives = 3


func open_file_classement():
	var index = 0
	var f = FileAccess.open("res://ressource/classement.csv",FileAccess.READ_WRITE)
	var classement = Array()
	while !f.eof_reached():
		var line = f.get_csv_line()
		classement.append(line)
	print(classement)
	return classement




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Hp.lives == 2):
		$Sprite2D.hide()
	if(Hp.lives == 1):
		$Sprite2.hide()	
	if(Hp.lives == 0):
		var classementDico = open_file_classement()
		var playerName = MenuUsername.playerUsername
		var playerScore = EnemyPool.enemy_count_score
		for i in classementDico:
			if classementDico[i] > playerScore:
				classementDico 
				
				
		get_tree().reload_current_scene()
