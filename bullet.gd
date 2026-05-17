extends Area2D

@export var speed = 600

func _physics_process(delta: float) -> void:
	position.y -= speed * delta
	
	if position.y <= -20:
		queue_free()
