extends SubViewportContainer
@onready var player: CollisionShape3D = $"../CharacterBody3D/CollisionShape3D"
@onready var camera_3d: Camera3D = $SubViewport/Camera3D
@onready var playerious: CharacterBody3D = $"../CharacterBody3D"
@onready var car: VehicleBody3D = $"../Node3D/Car"
@onready var map: SubViewportContainer = $"."
@onready var camera_player: Camera3D = $"../CharacterBody3D/Node3D/Camera3D"

var CamMode = 1 #1 normal 2, car
var MapMode = 0
func _process(delta: float) -> void:
	if CamMode == 1:
		camera_3d.position.x = playerious.position.x
		camera_3d.position.z = playerious.position.z
		camera_3d.rotation.y = playerious.rotation.y
	if CamMode == 0:
		camera_3d.position.x = car.position.x
		camera_3d.position.z = car.position.z
	if Input.is_action_just_pressed("Map"):
		if MapMode == 0:
			#bigger
			map.position = Vector2(0,0)
			map.scale = Vector2(3.6,3.6)
			MapMode = 1
			camera_3d.position.y = 150
			
		else:
			#smaller
			map.size = Vector2(320, 180)
			map.position = Vector2(0,468)
			map.scale = Vector2(1,1)
			MapMode = 0
			camera_3d.position.y = 40
		
func _on_car_out_truck() -> void:
	CamMode = 1


func _on_car_to_truck() -> void:
	CamMode = 0
