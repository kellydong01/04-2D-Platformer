extends KinematicBody2D

var player = null
var nav = null

var speed = 125

func _ready():
	var lev = Global.levels
	if lev == 1:
		position = Vector2(3300, -200)
	elif lev == 2:
		var doubleSpawn = [Vector2.ZERO, Vector2.ZERO]

func _physics_process(_delta):
	if nav == null:
		nav = get_node_or_null("/root/Game/Nav2D")
	elif player == null:
		player = get_node_or_null("/root/Game/Player_Container/Player")
	else:
		var points = nav.get_simple_path(global_position, player.global_position, true)
		if points.size() > 1:
			var target = points[1] - global_position
			var s = speed
			if target.length() > s:
				s = target.length()
			if abs(s) < 1:
				s = 0
			var dir = target.normalized()
			if dir.x < 0:
				$Sprite.flip_h = true
			else:
				$Sprite.flip_h = false
			var _v = move_and_slide(dir*s, Vector2.ZERO)
				

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.die()
		queue_free()
