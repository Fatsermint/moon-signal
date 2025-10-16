extends SubViewportContainer
@onready var player: CollisionShape3D = $"../CharacterBody3D/CollisionShape3D"
@onready var camera_3d: Camera3D = $SubViewport/Camera3D
@onready var playerious: CharacterBody3D = $"../CharacterBody3D"
@onready var car: VehicleBody3D = $"../Node3D/Car"

var CamMode = 1 #1 normal 2, car

func _process(delta: float) -> void:
	if CamMode == 1:
		camera_3d.position.x = playerious.position.x
		camera_3d.position.z = playerious.position.z
	if CamMode == 0:
		camera_3d.position.x = car.position.x
		camera_3d.position.z = car.position.z

func _on_car_out_truck() -> void:
	CamMode = 1


func _on_car_to_truck() -> void:
	CamMode = 0
