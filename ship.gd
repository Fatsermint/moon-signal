extends Node3D

@onready var infomargin: Control = $Control
@onready var infolabel: Label = $Control/Label

@onready var timer2: Timer = $Timer
@onready var animation: AnimationPlayer = $Control/Label/AnimationPlayer
@onready var label: Label = $"../Control2/MarginContainer/Label"
@onready var label2: Label = $"../Control2/MarginContainer2/Label"
@onready var label3: Label = $"../Control2/MarginContainer3/Label"
@onready var label4: Label = $"../Control2/MarginContainer4/Label"
var timergoing = false

"res://images/Cross Out.ttf"
@onready var loadlabel: Label = $"../Control2/MarginContainer5/Label"
@onready var loadcontainer: MarginContainer = $"../Control2/MarginContainer5"
@onready var timer: Timer = $"../Control2/Timer"



var signalsOnTruck = 0
var mode = 0 #0 start, 1 lastaa, 2 matkalla, 3 purkaa, 4 valmis, 5 matkalla takaisin
func _ready() -> void:
	timer2.start()
func _process(delta: float) -> void:
	if timergoing == true:
		if mode ==1:
			loadcontainer.visible = true
			loadlabel.text = "Loading " + str(snappedf(timer.time_left, 0.1))
		if mode == 3:
			loadlabel.text = "unLoading " + str(snappedf(timer.time_left, 0.1))
			loadcontainer.visible = true
			
	if mode == 4:
		mode = 5
func _on_signals_from_area_exited(area: Area3D) -> void:
	pass
	



func _on_timer_timeout() -> void:
	infomargin.visible = false


func _on_signals_to_area_entered(area: Area3D) -> void:
		if mode == 2:
			timer.start()
			timergoing = true
			label3.add_theme_font_override("font", load("res://images/Cross Out.ttf"))
			mode = 3

func _on_signals_from_area_entered(area: Area3D) -> void:
		label.add_theme_font_override("font", load("res://images/Cross Out.ttf"))
		if mode == 0 or mode == 5:
			mode = 1
			timer.start()
			timergoing = true
			loadcontainer.visible = true
			

func _on_timer_loaded_timeout() -> void:
	if mode == 1:
		mode = 2
		print("matkalla")
		label2.add_theme_font_override("font", load("res://images/Cross Out.ttf"))
		loadcontainer.visible = false
	if mode == 3:
		print("Purettu")
		mode = 4
		label.add_theme_font_override("font", load("res://addons/pixelFont-7-8x14-sproutLands.ttf"))
		label2.add_theme_font_override("font", load("res://addons/pixelFont-7-8x14-sproutLands.ttf"))
		label3.add_theme_font_override("font", load("res://addons/pixelFont-7-8x14-sproutLands.ttf"))
		label4.add_theme_font_override("font", load("res://addons/pixelFont-7-8x14-sproutLands.ttf"))
		
		
		
		
		
	loadcontainer.visible = false
