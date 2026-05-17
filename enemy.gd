extends Area2D

@export var speed = 200

func _physics_process(delta: float) -> void:
	position.y += speed * delta
	
	if position.y > 800:
		queue_free()


func _on_area_entered(area: Area2D):
	if area.is_in_group("hitter"):
		queue_free()
