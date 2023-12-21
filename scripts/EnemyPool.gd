extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()
var max_enemy = 10
var enemy_number = 0
var hors_limite = 1920
var sizeScreenx
var sizeScreeny 
var enemy_count_score = 0
# Called when the node enters the scene tree for the first time.
	
func get_all_children(in_node,arr:=[]):
	arr.push_back(in_node)
	for child in in_node.get_children():
		arr = get_all_children(child,arr)
	return arr
	
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sizeScreenx = get_viewport().get_size().x
	sizeScreeny = get_viewport().get_size().y
	if enemy_number < max_enemy:
		var enemy = load("scene/Enemy.tscn").instantiate()
		var enemyArray = get_all_children(enemy,[])
		var randValx = randf_range(0, sizeScreenx)
		var randValy = randf_range(-1000, 0)
		for i in enemyArray:
			var otherEnemyX = i.position.x
			var otherEnemyY = i.position.y
			while(randValx > otherEnemyX  && randValx < otherEnemyX ):# pas bon
				randValx = randf_range(0, 1000)
			
		enemy.position.x = randValx
		enemy.position.y = randValy
		add_child(enemy)
		enemy_number += 1
	

func sortie(area):
	for enemy in get_children():
		if(enemy.position.y >= sizeScreeny):
			enemy.queue_free()
			enemy_number -= 1
			enemy_count_score += 1
