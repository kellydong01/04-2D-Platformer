extends KinematicBody2D

export var v = Vector2.ZERO

func _ready():
	pass

func _physics_process(delta):
	position += v.rotated(rotation) * delta

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.die()
		queue_free()

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x,
		"pos_y" : position.y,
		"rotation" : rotation
	}
	return save_dict

func _on_Timer_timeout():
	queue_free()
