extends Node2D

onready var Turret = load("res://Enemy/Turret.tscn")

func _physics_process(_delta):
	if not has_node("Turret"):
		var turret = Turret.instance()
		turret.name = "Turret"
		turret.rotation = (3*PI)/2
		turret.position = Vector2(2200, 216)
		add_child(turret)
