extends Node

var levels = 4
var death_zone = 740
var score = 0
var time = 0
var level_time = [75, 110, 150, 90, 100]

func _ready():
	time = level_time[0]

func _unhandled_input(_event):
	if Input.is_action_pressed("quit"):
		get_tree().quit()

func plus_score(s):
	score += s
	var hud = get_node_or_null("/root/Game/UI/HUD")
	if hud != null:
		hud.update_score()
