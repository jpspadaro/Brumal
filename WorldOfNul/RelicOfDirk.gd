extends RigidBody

var inv_id = "Relic Of Dirk"
export var inv_u_id = 4


func _ready():

	#Inventory check...does it exist in the player inventory? if so, remove it.
	if inv_u_id in GameData.inv_list_all:
		queue_free()
