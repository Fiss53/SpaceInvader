extends CharacterBody2D


# Declare member variables here. Examples:
# var a = 2
var speed = 500
var screen_size
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	velocity.x = 0
	velocity.y = 0
	
func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	move_and_slide()
	
	

func collision(area):
	if Hp.lives == 0:
		queue_free()
	if area.name == "EnemyHitBox":
		Hp.lives -= 1
	
