extends VehicleBody3D

@onready var camera_player: Camera3D = $"../../CharacterBody3D/Node3D/Camera3D"
@onready var camera_truck: Camera3D = $BackUp
@onready var back_up: Camera3D = $BackUp
@onready var pov: Camera3D = $Pov
@onready var front_up: Camera3D = $FrontUp
@onready var player: CharacterBody3D = $"../../CharacterBody3D"
@onready var right1: VehicleWheel3D = $VehicleWheel3D
@onready var left2: VehicleWheel3D = $VehicleWheel3D2
@onready var left3: VehicleWheel3D = $VehicleWheel3D3
@onready var right4: VehicleWheel3D = $VehicleWheel3D4
@onready var playerpos: CSGBox3D = $CSGBox3D
@onready var car: VehicleBody3D = $"."
@onready var node: Node3D = $"../.."




var notyet = true
signal outTruck
signal toTruck
@export var MAX_STEER = 0.45
@export var ENGINE_POWER = 6000
var oncar = false
var canJoIn = false
var p 

func _ready() -> void:
	#right1.scale = Vector3(3,3,3)
	car.center_of_mass_mode = RigidBody3D.CENTER_OF_MASS_MODE_AUTO
	#car.center_of_mass = Vector3(0, 1, 0) 
	
func _process(delta: float) -> void:
	p = delta
	if oncar == true:
		player.position = playerpos.position
		
	else:
		pass
func  _physics_process(delta: float) -> void:
	if notyet == false:
		if oncar == true:
			steering = move_toward(steering, Input.get_axis("right", "left") * MAX_STEER, delta * 2)
			engine_force = Input.get_axis("down", "up") * ENGINE_POWER * 0.1
		
		
			car.center_of_mass_mode = RigidBody3D.CENTER_OF_MASS_MODE_CUSTOM
		#if angular_velocity.length() > 10:
			#angular_velocity = angular_velocity.normalized() * 10
		else:
			pass
		if Input.is_action_just_pressed("toCar"):
			print("yay")
			if oncar == true:
				back_up.current = false
				front_up.current = false
				pov.current = false
				camera_player.current = true
				outTruck.emit()
				oncar = false
				car.freeze = true
				return
			if oncar == false and canJoIn == true:
				car.freeze = false
				camera_player.current = false
				back_up.current = true
				oncar = true
				#player.get_parent().remove_child(player)
				#car.add_child(player)
				player.visible = false
				toTruck.emit()

	if Input.is_action_just_pressed("1") and oncar == true:
		back_up.current = false
		front_up.current = false
		pov.current = true
		
	if Input.is_action_just_pressed("2") and oncar == true:
		front_up.current = false
		pov.current = false
		back_up.current = true
		
	if Input.is_action_just_pressed("3") and oncar == true:
		pov.current = false
		back_up.current = false
		front_up.current = true
func _on_character_body_3d_out_of_car() -> void:
	oncar = false


func _on_character_body_3d_to_car() -> void:
	oncar = true


func _on_area_3d_body_entered(body: Node3D) -> void:
	canJoIn = true
	print(body)

func _on_area_3d_body_exited(body: Node3D) -> void:
	canJoIn = false
	print(body)


func _on_tuto_play() -> void:
	notyet = false
