extends Area3D

@onready var audio_stream:AudioStreamPlayer = $"../AudioStreamPlayer"
@export var bubbles: CPUParticles3D
@export var flashLight: SpotLight3D



func _on_body_entered(body: Node3D) -> void:
	audio_stream.play()
	bubbles.emitting = true
	flashLight.light_energy = 6
	






func _on_body_exited(body: Node3D) -> void:
	
	audio_stream.stop()
	bubbles.emitting = false
	flashLight.light_energy = 1
	
	
