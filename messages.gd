extends MarginContainer


@onready var timer: Timer = $Timer
@onready var high: ColorRect = $ColorRect/High
@onready var police: ColorRect = $ColorRect/Police
@onready var smokin: ColorRect = $ColorRect/Smokin
@onready var normal: ColorRect = $ColorRect/Normal
@onready var highlabel: Label = $ColorRect/High/Label
@onready var policelabel: Label = $ColorRect/Police/Label
@onready var smokinlabel: Label = $ColorRect/Smokin/Label
@onready var normallabel: Label = $ColorRect/Normal/Label
@onready var labeltext: Label = $"../MarginContainer9/Label"
@onready var magtext: MarginContainer = $"../MarginContainer9"
@onready var red_dot: TextureRect = $"../MarginContainer8/TextureRect"
@onready var text: TextureRect = $ColorRect/VBoxContainer/TextureRect3
@onready var Scrolltext: VBoxContainer = $ColorRect/VBoxContainer
@onready var App: MarginContainer = self


var randomJohn
var messaageloc = 0
var messagetohigh = 0
var messagetopolice = 0
var messagetosmokin = 0
var messagetonormal = 0
var messagelistfromhigh = ["ra", "a", 5]
var randommessage
var totalmessage
var textOpen = 0
var pingmessages = 0
func _ready() -> void:
	print(messagelistfromhigh)
	timer.start()
	randomJohn = randi_range(1,4)
	randommessage = randi_range(1,2)
	
func _on_timer_timeout() -> void:
	
	if randomJohn == 1:
		if textOpen == 0:
			high.visible = true
		if messagetohigh == 0:
			high.position.y = messaageloc
			messaageloc += 4.955
		messagetohigh += 1
		highlabel.text = "High john: " + str(messagetohigh) + " New Message"

	if randomJohn == 2:
		if textOpen == 0:
			police.visible = true
		if messagetopolice == 0:
			police.position.y = messaageloc
			messaageloc += 4.955
			messagetopolice = 1
		else:
			messagetopolice += 1
		policelabel.text = "High john : " + str(messagetopolice) + " New Message"
		
	if randomJohn == 3:
		if textOpen == 0:
			smokin.visible = true
		if messagetosmokin == 0:
			smokin.position.y = messaageloc
			messaageloc += 4.955
			messagetosmokin = 1
			
		else:
			messagetosmokin += 1
		smokinlabel.text = "High john : " + str(messagetosmokin) + " New Message"
	if randomJohn == 4:
		if textOpen == 0:
			normal.visible = true
		
		if messagetonormal == 0:
			normal.position.y = messaageloc
			messaageloc += 4.955
			messagetonormal = 1
			
		else:
			messagetonormal += 1
		normallabel.text = "High john : " + str(messagetonormal) + " New Message"
		
		
	totalmessage = messagetohigh + messagetonormal + messagetopolice + messagetosmokin
	
	if totalmessage >= 0:
		pingmessages += 1
		
		
		labeltext.text = str(pingmessages)
	_ready()


func _on_home_button_pressed() -> void:
	totalmessage = 0
	if App.visible == true:
		pingmessages = 0
		App.visible = false
func _on_high_button_pressed() -> void:
	textOpen = 1
	high.visible = false
	police.visible = false
	smokin.visible = false
	normal.visible = false
	Scrolltext.visible = true
