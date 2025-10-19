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
@onready var Scrolltext = $ColorRect/Messages
@onready var messageblank: TextureRect = $ColorRect/Messages/VBoxContainer/TextureRect3
@onready var messagelabel: Label = $ColorRect/Messages/VBoxContainer/TextureRect3/Label
@onready var basement4kids: VBoxContainer = $ColorRect/Messages/VBoxContainer
@onready var highcontainer: MarginContainer = $ColorRect/Container
@onready var messages: Control = $ColorRect/Messages

@onready var App: MarginContainer = self
var messagesGeneated = 0
var nextmessagepos = 100
var randomJohn
var messaageloc = 0
var messagetohigh = 0
var messagetopolice = 0
var messagetosmokin = 0
var messagetonormal = 0
var messagelistfromsmokin = ["Man, I’ve been waitin’ \n forever.", "Signal’s slower than \n my smoke.", "Yo, what’s the holdup?", "Still no signal? Figures.", "Bro, I could’ve had \n a nap.", "Come on, I’m burnin’ \n daylight.", "You movin’ or chillin’?", "Late again, huh?", "I could’ve rolled two\n by now.", "You’re slower than \nmy lighter.", "Guess I’ll light \nanother one.", "This delay’s killin’\n my vibe.", "You drive like you’re\n dreamin’.", "Bro, did you get \nlost again?", "Signal’s takin’ the \nscenic route.", "Don’t rush, but \nhurry up.", "Been sittin’ here \ntoo long.", "Still smokin’, \nstill waitin’.", "That signal’s ghostin’\n me.", "You movin’ in slow\n motion, dude."]
var messagelistfromnormal = ["Where’s my signal?", "Still waiting…", "Late again?", "Clock’s ticking!", "You’re behind schedule!", "This delay costs me!", "You missed the window!", "What’s taking so long?", "You promised on time!", "My systems are down!", "Too slow!", "Not again…", "Unacceptable delay!", "That’s not service.", "You’re off schedule!", "I’m losing trust.", "You call this reliable?", "Come on already!", "Tick-tock, driver.", "Late delivery = angry\n customer"]
var messagelistfromhigh = ["Whoa… did time stop?", "Is the signal lost \nin space?", "I swear it was \njust here.", "Everything’s blinking\n weird.", "Did you deliver it to\n another dimension?", "My vibes are off… \nno signal yet.", "Maybe it already\n arrived… somewhere.", "Bro, the signal’s\n trippin’ out.", "I can feel it… but\n it’s not here.", "Whoa… late? Or\n am I early?", "Reality’s buffering\n again.", "Signal’s taking the\n scenic route.", "Did you see it\n fly by?", "Feels like a glitch\n in the universe.", "Wait… what was\n I waiting for?", "Maybe it’s invisible\n now.", "The air feels \nlaggy today.", "Signal’s totally \nvibed out.", "Time’s just \nmelting, man.", "Whoa… that’s deep\n delay."]
var messagelistfrompolice = ["You’re off schedule,\n driver.", "That signal was due\n five minutes ago.", "This delay’s \nunacceptable.", "Do you know what \na deadline is?", "That’s a clear \nviolation.", "I expect punctuality,\n always.", "You’ll be written\n up for this.", "Next time,\n double-check\n your route.", "Keep your clock \nsynced, driver.", "Late again?\n That’s noted.", "Your timing report\n looks bad.", "Consider this a\n warning.", "You’re losing reliability\n status.", "Deliver on time or\n face review.", "Maintain schedule\n discipline.", "I don’t tolerate delays.", "Your ETA was wrong again.", "Get your act together.", "Do it by the book\n next run.", "Not on my watch,\n driver."]
var messagesopen = 0 # 1 high 2 police 3 smokin 4 normal
var randommessage
var totalmessage
var textOpen = 0
var pingmessages = 0
var highused = false
var policeused = false
var smokinused = false
var normalused = false
var delete = 0


func _ready() -> void:
	timer.start()
	randomJohn = randi_range(1,4)
	randommessage = randi_range(0,19)
	
func _on_timer_timeout() -> void:
	
	if randomJohn == 1:
		if messagesopen == 0:
			high.visible = true
		
			
		if messagetohigh == 0:
			if highused == false:
				high.position.y = messaageloc
				messaageloc += 4.955
		messagetohigh += 1
		highlabel.text = "john: " + str(messagetohigh) + " New Message"

	if randomJohn == 2:
		if messagesopen == 0:
			police.visible = true
		if messagetopolice == 0:
			if policeused == false:
				police.position.y = messaageloc
				messaageloc += 4.955
			messagetopolice = 1
		else:
			messagetopolice += 1
		policelabel.text = "police : " + str(messagetopolice) + " New Message"
		
	if randomJohn == 3:
		if messagesopen == 0:
			smokin.visible = true
		if messagetosmokin == 0:
			if smokinused == false:
				
				smokin.position.y = messaageloc
				messaageloc += 4.955
			messagetosmokin = 1
			
		else:
			messagetosmokin += 1
		smokinlabel.text = "smokin : " + str(messagetosmokin) + " New Message"
	if randomJohn == 4:
		if messagesopen == 0:
			normal.visible = true

		
		if messagetonormal == 0:
			if normalused == false:
				normal.position.y = messaageloc
				messaageloc += 4.955
			messagetonormal = 1
			
		else:
			messagetonormal += 1
		normallabel.text = "Normal : " + str(messagetonormal) + " New Message"
		
		
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
		Scrolltext.visible = false
		
func _on_high_button_pressed() -> void:
	messages.visible = true
	textOpen = 1
	high.visible = false
	police.visible = false
	smokin.visible = false
	normal.visible = false
	Scrolltext.visible = false
	highcontainer.visible = false
	print("button pressed")
	messagesGeneated = messagetohigh
	messagesopen = 1
	App.visible = true
	messages.visible = true
	highcontainer.visible = true
func _process(delta: float) -> void:
	if delete == 1 or delete == 2 or delete == 3 or delete == 4:
		pass
	if messagesopen == 1: 
		$ColorRect/Container/High/Label.text = "a" #here john name ------------------------
		if messagesGeneated >= 1.1:
			messageblank.get_child(0).text = messagelistfromhigh[randommessage]
			randommessage = randi_range(0,19)
			messageblank.visible = true
			var NewMessage = messageblank.duplicate()
			var label = NewMessage.get_child(0)
			messageblank.get_parent().add_child(NewMessage)
			NewMessage.name = "foo"
			label.visible = true
			label.text = messagelistfromhigh[randommessage]
			
			NewMessage.visible = true
			messagesGeneated -= 1
			highcontainer.visible = true
			nextmessagepos -=  100
			NewMessage.position.y = nextmessagepos
			
			randommessage = randi_range(0,19)
			
		else:
			pass
	if messagesopen == 3:
		$ColorRect/Container/High/Label.text = " bob"
		if messagesGeneated >= 1.1:
			messageblank.get_child(0).text = messagelistfromsmokin[randommessage]
			randommessage = randi_range(0,19)
			messageblank.visible = true
			var NewMessage = messageblank.duplicate()
			var label = NewMessage.get_child(0)
			messageblank.get_parent().add_child(NewMessage)
			NewMessage.name = "foo"
			label.visible = true
			print(label.position)
			label.text = messagelistfromsmokin[randommessage]
			print(label.text)
			NewMessage.visible = true
			messagesGeneated -= 1
			highcontainer.visible = true
			nextmessagepos -=  100
			NewMessage.position.y = nextmessagepos
			print(messagesGeneated)
			randommessage = randi_range(0,19)
			
		else:
			pass
	if messagesopen == 2: 
		$ColorRect/Container/High/Label.text = " lucas"
		
		if messagesGeneated >= 1.1:
			messageblank.get_child(0).text = messagelistfrompolice[randommessage]
			randommessage = randi_range(0,19)
			messageblank.visible = true
			var NewMessage = messageblank.duplicate()
			var label = NewMessage.get_child(0)
			messageblank.get_parent().add_child(NewMessage)
			NewMessage.name = "foo"
			label.visible = true
			print(label.position)
			label.text = messagelistfrompolice[randommessage]
			print(label.text)
			NewMessage.visible = true
			messagesGeneated -= 1
			highcontainer.visible = true
			nextmessagepos -=  100
			NewMessage.position.y = nextmessagepos
			print(messagesGeneated)
			randommessage = randi_range(0,19)
			
		else:
			pass
	if messagesopen == 4: 
		$ColorRect/Container/High/Label.text = " henry"
		
		if messagesGeneated >= 1.1:
			messageblank.get_child(0).text = messagelistfromnormal[randommessage]
			randommessage = randi_range(0,19)
			messageblank.visible = true
			var NewMessage = messageblank.duplicate()
			var label = NewMessage.get_child(0)
			messageblank.get_parent().add_child(NewMessage)
			NewMessage.name = "foo"
			label.visible = true
			print(label.position)
			label.text = messagelistfromnormal[randommessage]
			print(label.text)
			NewMessage.visible = true
			messagesGeneated -= 1
			highcontainer.visible = true
			nextmessagepos -=  100
			NewMessage.position.y = nextmessagepos
			print(messagesGeneated)
			randommessage = randi_range(0,19)
			
		else:
			pass
			
	if messagesopen == 0:
		if messageblank.get_parent().get_child(1):
			messageblank.get_parent().get_child(1).queue_free()
			print("deleted")
		else:
			print("notdeletdd")
func _on_back_button_pressed() -> void:
	highcontainer.visible = false
	messages.visible = false
	App.visible = true
	Scrolltext.visible = false
	
	if messagetohigh >= 0.9:
		high.visible = true
	if messagetopolice >= 0.9:
		police.visible = true
	if messagetosmokin >= 0.9:
		smokin.visible = true
	if messagetonormal >= 0.9:
		normal.visible = true
	if messagesopen == 1:
		highlabel.text = "john"
		delete = 1
		
		messagetohigh = 0
		highused = true
	if messagesopen == 2:
		policelabel.text = "police"
		delete = 2
		
		messagetopolice = 0
		policeused = true
	if messagesopen == 3:
		messagetosmokin = 0
		smokinlabel.text = "smokin"
		delete = 3
		
		smokinused = true
	if messagesopen == 4:
		messagetonormal = 0
		delete = 4
		normalused = true
		normallabel.text = "Normal"
	police.visible = true
	high.visible = true
	smokin.visible = true
	normal.visible = true

	messagesopen = 0

func _on_somkin_button_pressed() -> void:
	messages.visible = true
	textOpen = 3
	high.visible = false
	police.visible = false
	smokin.visible = false
	normal.visible = false
	Scrolltext.visible = false
	highcontainer.visible = false
	print("button pressed")
	messagesGeneated = messagetosmokin
	messagesopen = 3
	App.visible = true
	messages.visible = true
	highcontainer.visible = true


func _on_normal_button_pressed() -> void:
	messages.visible = true
	textOpen = 4
	high.visible = false
	police.visible = false
	smokin.visible = false
	normal.visible = false
	Scrolltext.visible = false
	highcontainer.visible = false
	print("button pressed")
	messagesGeneated = messagetonormal
	messagesopen = 4
	App.visible = true
	messages.visible = true
	highcontainer.visible = true


func _on_police_button_pressed() -> void:
	messages.visible = true
	textOpen = 2
	high.visible = false
	police.visible = false
	smokin.visible = false
	normal.visible = false
	Scrolltext.visible = false
	highcontainer.visible = false
	print("button pressed")
	messagesGeneated = messagetopolice
	messagesopen = 2
	App.visible = true
	messages.visible = true
	highcontainer.visible = true
