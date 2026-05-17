extends TextureButton


func _ready() -> void:
	pressed.connect(_press)

func _press() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
