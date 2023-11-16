extends Node2D


# Declare member variables here. Examples:
# var a = 2
var speed = 500
const limitxright = 970
const limitxleft = -120
const limitydown = -15
const limityup = 565

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _input(event):
	print(event.as_text())
	if (event.is_action_pressed("ui_right")):
		print("aj")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.is_action_pressed("ui_right") && !(position.x > limitxright)):
		position.x += speed * delta
	if Input.is_action_pressed("ui_left")  && !(position.x < limitxleft):
		position.x -= speed * delta
	if Input.is_action_pressed("ui_up") && !(position.y < limitydown):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down")&& !(position.y > limityup):
		position.y += speed * delta
	

func collision(area):
	if Hp.lives == 0:
		queue_free()
	if area.name == "EnemyHitBox":
		Hp.lives -= 1
	
