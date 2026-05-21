extends Area2D

var bullet = preload("res://bullet.tscn")
var shoot_fast_powerup = preload("res://shoot_fast_power_up.tscn")

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		area.bullet_speed = 1200
		queue_free()
		
func _ready() -> void:
	if Waves.wave == 4:
		shoot_fast_powerup.instantiate()
		get_parent().add_child(shoot_fast_powerup)
