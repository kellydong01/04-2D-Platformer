extends Node

var levels = 1
var death_zone = 740
var score = 0
var time = 0
var level_time = [75, 100, 150, 90, 60]

var save_file = "user://save.dat"
var key = "Level pain peko"


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

func save_game():
	var save_game = File.new()
	save_game.open_encrypted_with_pass(save_file, File.WRITE, key)
	
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		if node.filename.empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() method, skipped" % node.name)
			continue
		
		var node_data = node.call("save")
		
		save_game.store_line(to_json(node_data))
	
	save_game.close()
	
func load_game():
	var save_game = File.new()
	save_game.open_encrypted_with_pass(save_file, File.READ, key)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		node.queue_free()
	pass


