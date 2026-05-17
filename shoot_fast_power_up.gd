extends Area2D

var bullet = preload("res://bullet.tscn")

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		area.bullet_speed = 1200
		queue_free()
