extends Label

func _process(delta: float) -> void:
	text = "Wave: " + str(Waves.wave)
