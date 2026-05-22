extends Area2D

var bullet = preload("res://bullet.tscn")
var shoot_fast_powerup = preload("res://shoot_fast_power_up.tscn")
@onready var wave_label : RichTextLabel = $RichTextLabel

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		area.bullet_speed = 1200
		queue_free()
		
func _ready() -> void:
	if Waves.wave == 4:
		var power_instance = shoot_fast_powerup.instantiate()
		power_instance.global_position = Vector2(randi_range(0, 480), randi_range(0, 720))
		get_tree().get_current_scene().add_child(power_instance)
