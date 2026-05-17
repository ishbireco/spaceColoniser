extends Area2D

@export var speed = 200

func _physics_process(delta: float) -> void:
	position.y += speed * delta
	
	if position.y > 800:
		queue_free()


func _on_body_entered(body):
	if body.is_in_group("hitter"):
		queue_free()
