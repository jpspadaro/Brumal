extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var inv_id = "Relic Of Tongratell"
export var inv_u_id = 1

func _ready():
	
	#Inventory check...does it exist in the player inventory? if so, remove it.
	if inv_u_id in GameData.inv_list_all:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
