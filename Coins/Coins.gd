extends Area2D

export var value = 5

func _ready():
	pass

func save():
	var save_dict = {
		"filename" : get_filename(),
		"parent" : get_parent().get_path(),
		"pos_x" : position.x,
		"pos_y" : position.y,
		"value" : value
	}
	return save_dict

func _on_Coins_body_entered(body):
	if body.name == "Player":
		Global.plus_score(value)
		visible = false
		$Collect.playing = true
		yield ($Collect, "finished")
		queue_free()
