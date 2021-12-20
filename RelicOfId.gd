extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
var inv_id = "Relic Of Id"
export var inv_u_id = 5


func _ready():

	#Inventory check...does it exist in the player inventory? if so, remove it.
	if inv_u_id in GameData.inv_list_all:
		queue_free()
