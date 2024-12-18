extends Area3D

@onready var aduio_stream:AudioStreamPlayer = $"../AudioStreamPlayer"
@export var isPlaying : bool = false


	


func _on_body_entered(body: Node3D) -> void:
	isPlaying = true
	aduio_stream.play()
	
