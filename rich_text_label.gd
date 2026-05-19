extends RichTextLabel

@onready var main = "res://main.tscn"

func _ready() -> void:
	var current_scene = get_tree().current_scene
	if current_scene.scene_file_path == main:
		await get_tree().create_timer(4).timeout
	
		var tween = create_tween()
		tween.tween_property(self, 'modulate:a', 0, 1)
