extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _unhandled_input(event):
	#if event.is_action_pressed("test_input"):
	#	GameData.notify("Test Notification.")
	#	GameData.Player_HP -= 1
	if event.is_action_pressed("quit"):
		get_tree().quit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
