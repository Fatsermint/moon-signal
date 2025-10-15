extends SubViewportContainer
@onready var player: CollisionShape3D = $"../CharacterBody3D/CollisionShape3D"
@onready var camera_3d: Camera3D = $SubViewport/Camera3D
@onready var playerious: CharacterBody3D = $"../CharacterBody3D"
@onready var car: VehicleBody3D = $"../Node3D/Car"



func _process(delta: float) -> void:
	camera_3d.position.x = playerious.position.x
	camera_3d.position.z = playerious.position.z
