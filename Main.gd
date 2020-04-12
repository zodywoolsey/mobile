extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player
var cam


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node('player')
	cam = get_node('Camera')
	print(cam)


func _physics_process(delta):
	cam.translation.x = player.translation.x
	cam.translation.z = player.translation.z+10

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_W || event.scancode == KEY_UP:
			player.linear_velocity.z += -5
		if event.scancode == KEY_A || event.scancode == KEY_LEFT:
			player.linear_velocity.x += -5
		if event.scancode == KEY_S || event.scancode == KEY_DOWN:
			player.linear_velocity.z += 5
		if event.scancode == KEY_D || event.scancode == KEY_RIGHT:
			player.linear_velocity.x += 5
		if event.scancode == KEY_R:
			player.linear_velocity = Vector3(0,0,0)
			player.translation = Vector3(0,0,0)
	if event is InputEventScreenDrag:
		var rel = [event.relative[0],event.relative[1]]
		if event.relative[0] > 60:
			rel[0] = 60
		elif event.relative[0] < -60:
			rel[0] = -60
		if event.relative[1] > 60:
			rel[1] = 60
		elif event.relative[1] < -60:
			rel[1] = -60
		player.linear_velocity.x = rel[0]
		player.linear_velocity.z = rel[1]
	# elif event is InputEventScreenTouch:
	# 	player.linear_velocity = Vector3(0,0,0)
