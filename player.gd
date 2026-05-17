extends Area2D

@export var speed = 20

var max_size : Vector2
var half_size : Vector2
var bullet_scene = preload("res://bullet.tscn")
var can_shoot = true

func _ready() -> void:
	max_size = get_viewport_rect().size
	var size = $Sprite2D
	half_size = size.texture.get_size() / 2

func _physics_process(delta: float) -> void:
	global_position =  lerp(global_position, get_global_mouse_position(), speed * delta) #movement script
	global_position = global_position.clamp(half_size, max_size - half_size)
	if Input.is_action_pressed("shoot") and can_shoot == true:
		shoot_bullet()
	
func shoot_bullet():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = $muzzel.global_position
	get_parent().add_child(bullet)
	can_shoot = false
	await get_tree().create_timer(1).timeout
	can_shoot = true
