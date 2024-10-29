extends Node3D
@export var look_at_door_when_opens : bool
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_3d: CollisionShape3D = $StaticBody3D/CollisionShape3D
var is_open : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func open_close_door(open : bool) -> void:
	is_open = open
	if open:
		animation_player.play("open")
		collision_shape_3d.set_deferred("disabled", true)
	else:
		animation_player.play("close")
		collision_shape_3d.set_deferred("disabled", false)
	
	if look_at_door_when_opens:
		get_tree().call_group("View", "look_at_target",self)


func receive_input(on : bool) -> void:
	open_close_door(on)
