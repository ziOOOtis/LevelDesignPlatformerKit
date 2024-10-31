extends Path3D
@onready var path_follow_3d: PathFollow3D = $PathFollow3D
@onready var remote_transform_3d: RemoteTransform3D = $PathFollow3D/RemoteTransform3D

@export var object_to_move : Node
@export var movement_speed : float = 1.0
@export var is_on_from_start : bool = true
@export var look_at_object_when_activated : bool
var original_object_pos : Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	remote_transform_3d.remote_path = object_to_move.get_path()
	object_to_move.set_deferred("position", Vector3.ZERO)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if object_to_move and is_on_from_start:
		path_follow_3d.progress += (delta*movement_speed)


func receive_input(on : bool) -> void:
	is_on_from_start = on
	
	if on and look_at_object_when_activated:
		get_tree().call_group("View", "look_at_target",object_to_move)
