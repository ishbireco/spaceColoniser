extends Area2D

@export var speed = 200

func _physics_process(delta: float) -> void:
	position.y += speed * delta
	if position.y > 800:
		queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("hitter"):
		Global.kills += 1
		area.queue_free()
		queue_free()
		
	if Global.kills % 5 == 0:  # every 5 kills, not just when kills == 5
		Waves.wave += 1
		Global.spawn_interval *= 0.8  # increase speed by 20%
