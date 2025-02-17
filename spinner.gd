extends Node3D

@export var speed : float = 1
@export var amount : float = 0.25

var axis : Vector3
var elapsed : float
var start_y : float
var offset : float

func _ready():
	start_y = position.y
	offset = 1000 * randf()
	
	axis.x = randf()
	axis.y = randf()
	axis.z = randf()
	axis = axis.normalized()
	
func _process(delta):
	elapsed += delta
	quaternion = Quaternion(axis, speed * elapsed)
	var t = (sin((elapsed * speed) + offset) + 1) * 0.5
	position.y = lerp(start_y - amount, start_y + amount, t)
	
