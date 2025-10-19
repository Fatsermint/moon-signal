extends Control



@onready var phone: Control = self
@onready var messageApp: MarginContainer = $MarginContainer6

@onready var texture_rect: TextureRect = $MarginContainer8/TextureRect
@onready var margin_container_9: MarginContainer = $MarginContainer9
@onready var car: VehicleBody3D = $"../Node3D/Car"
@onready var player: CharacterBody3D = $"../CharacterBody3D"

var isphone
var app_mode = 0 #0 = home, 1 = signal
var value = 1
var posy = 0
var posx = 0
var posz = 0
enum AppMode {
	HOME,
	SIGNAL
}

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	if app_mode == AppMode.SIGNAL:
		margin_container_9.visible = false
		texture_rect.visible = false
	else:
		margin_container_9.visible = true
		texture_rect.visible = true
		
	if Input.is_action_just_pressed("Phone"):
		if isphone == true:	
			phone.position = Vector2(700, 524)
			isphone = false
			phone.scale.x = 0.32
			phone.scale.y = 0.32
			app_mode = AppMode.HOME
			messageApp.visible = false
		else:
			phone.position = Vector2(577, 50)
			isphone = true
			phone.scale.x = 0.48
			phone.scale.y = 0.48
			
func _on_button_pressed() -> void:
	app_mode = AppMode.SIGNAL
	messageApp.visible = true

func _on_home_button_pressed() -> void:
	app_mode = AppMode.HOME
	


func _on_truck_button_pressed() -> void:
	print("carspawn")
	posx = player.position.x + 20
	posy = player.position.y + 20
	posz = player.position.z 
	car.position = Vector3(posx, posy, posz)
	
	
	
	
	


func _on_button_mouse_entered() -> void:
	print("eeaaa")
