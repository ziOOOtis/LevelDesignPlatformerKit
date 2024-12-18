extends Area3D



func _on_area_entered(area: Area3D) -> void:
	Audio.play("res://sounds/zapsplat_warfare_arrow_whoosh_hit_water_splash_001_90114.mp3")
