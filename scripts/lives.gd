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


class Sorter:
	func custom_sort(a, b):
		return a > b
var sorter = Sorter.new()
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
		
		#for i in classementDico:
		#	if classementDico[i] < playerScore:
		#		var temp = classementDico[i]
		get_tree().change_scene_to_file("res://scene/Menu/end_game_menu.tscn")
