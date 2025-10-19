extends Node3D

@onready var infomargin: Control = $Control
@onready var infolabel: Label = $Control/Label

@onready var timer: Timer = $Timer
@onready var animation: AnimationPlayer = $Control/Label/AnimationPlayer

var signalsOnTruck = 0
var mode = 0 #0 start, 1 lastaa, 2 matkalla, 3 purkaa, 4 valmis, 5 matkalla takaisin
func _ready() -> void:
	infolabel.text = "First head to loading station \nto get signals"
	animation.play("info_text")
	timer.start()

		


func _on_signals_from_area_exited(area: Area3D) -> void:
	if mode == 1:
		mode = 2
		print("matkalla")




func _on_timer_timeout() -> void:
	infomargin.visible = false


func _on_signals_to_area_entered(area: Area3D) -> void:
		if mode == 2:
			mode = 3
			print("purettu")


func _on_signals_from_area_entered(area: Area3D) -> void:
		if mode == 0 or 5:
			mode = 1
			print("lastattu")
			infolabel.text = "Now you have signals in your truck \n next head to unload station"
