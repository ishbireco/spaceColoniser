extends Node

var enemy_scene = preload("res://enemy.tscn")
var spawn_interval = 5
var spawn_points = []

func _ready() -> void:
	for child in get_children():
		if child is Marker2D:
			spawn_points.append(child)
	
	var timer = Timer.new()
	add_child(timer)
	timer.wait_time = spawn_interval
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	
func _on_timer_timeout():
	spawn_enemy()
	
func spawn_enemy():
	if spawn_points.is_empty():
		return
		
	var point = spawn_points[randi() % spawn_points.size()]
	
	var enemy = enemy_scene.instantiate()
	enemy.global_position = point.global_position
	get_parent().add_child(enemy)
