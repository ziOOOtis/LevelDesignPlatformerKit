extends Area3D

@onready var audio_stream:AudioStreamPlayer = $"../AudioStreamPlayer"
@export var bubbles: CPUParticles3D



func _on_body_entered(body: Node3D) -> void:
	audio_stream.play()
	bubbles.emitting = true
	






func _on_body_exited(body: Node3D) -> void:
	
	audio_stream.stop()
	bubbles.emitting = false
	
