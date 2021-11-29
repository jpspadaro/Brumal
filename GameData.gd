extends Node

export var Player_HP = 100 # Humanity Points, not Hit Points
export var Player_Wealth = 0 # Wealth points (Kinda like a score)

var notifications = "WASD to move.\nUse mouse to look around. Clicking picks up items.\nQ quits.\nU uses the currently held item. \nI displays inventory. \n\",\" and \".\" navigate through the list.\nVersion: 0.3 alpha"
var current_world = "res://Main.tscn"

export var inv_list = ["Liber Avaritiae"]
var inv_list_all = ["Liber Avaritiae"] #Includes items previously used. 
#Initialized the same to prevent pass by reference later

var inv_description = {"Liber Avaritiae":"A mystical tome leading to riches, and also providing the way home.",
	"Test Box": "A sacred artifact of debugging.",
	"Relic Of Tongratell": "A sacred relic. Hold it before the portal to travel to Tongratell.",
	"Relic Of Grent": "A strange spire relic. Hold it before the portal to travel to forsaken Grent.",
	"Chest": "Use this to increase your wealth.",
	"Coin": "Every little bit helps. Use to increase your wealth."
	}

var inv_held = 0

var total_relics = 2
var curr_relics = 0

func _ready():
	pass # Replace with function body.

func _unhandled_input(event):
	#if event.is_action_pressed("test_input"):
	#	notify("Test Notification.")
	#	Player_HP -= 1
	if event.is_action_pressed("inventory"):
		notify("Inventory: " + String(get_inventory()))
	if event.is_action_pressed("use"):
		use_item()
	if event.is_action_pressed("nextItem"):
		inv_held += 1
		if inv_held >= len(inv_list):
			inv_held = 0
	if event.is_action_pressed("previousItem"):
		inv_held -= 1
		if inv_held < 0:
			inv_held = len(inv_list) - 1
	if event.is_action_pressed("quit"):
		get_tree().quit()
	

func notify(notification_text):
	notifications = String(notification_text) + "\n" + notifications

func pick_up(node):
	if node.is_in_group("Items"):
		inv_list.append(node.inv_id)
		inv_list_all.append(node.inv_id)
		if node.is_in_group("Relics"):
			add_relic()
		notify(node.inv_id + " has been picked up.")
		node.queue_free()
	else:
		notify("Not an item you can pick up!")
	

func get_inventory():
	print ("Inventory: " + String(inv_list))
	return inv_list

func use_item():
	if inv_list[inv_held] == "Test Box":
		Player_HP += 50
		inv_list.remove(inv_held)
		inv_held = 0
	if inv_list[inv_held] == "Chest":
		Player_Wealth += 50
		inv_list.remove(inv_held)
		inv_held = 0
	if inv_list[inv_held] == "Coin":
		Player_Wealth += 1
		inv_list.remove(inv_held)
		inv_held = 0

func add_relic():
	curr_relics += 1
	notify(String(curr_relics) + " out of " + String(total_relics) + " found.")
	notify("You have found a relic!")

func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
