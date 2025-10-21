extends Node
@onready var margin_container: MarginContainer = $MarginContainer
@onready var tutoa: MarginContainer = $MarginContainer3
@onready var timer: Timer = $Timer
var page = 0
signal play
signal tuto
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
@onready var label: Label = $MarginContainer3/ColorRect/Label
@onready var camera1: Camera3D = $"../Node3D2/CSGBox3D3/Camera3D"
@onready var camera2: Camera3D = $"../Node3D2/CSGBox3D4/Camera3D"



func _on_button_pressed() -> void:
	#play
	play.emit()
	$MarginContainer2.visible = false
	margin_container.visible = false

func _on_tuto_button_pressed() -> void:
	tuto.emit()
	$MarginContainer2.visible = false
	margin_container.visible = false
	tutoa.visible = true
	timer.start()
	page = 1
	

func _on_timer_timeout() -> void:
	page += 1
	if page == 5:
		play.emit()
	if page == 4:
		label.text = "remember to spress b to check messages"
	if page == 3:
		label.text = "And this is the place where you load the signals to"
		timer.start()
		camera2.current = true
	if page == 2:
		label.text ="this is where you get the signals.."
		timer.start()
		camera1.current = true
	
