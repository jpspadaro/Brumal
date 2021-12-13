extends RigidBody


#Unique Identifier for Inventory
var inv_id = "Test Box"


func _ready():
	
	#Inventory check...does it exist in the player inventory? if so, remove it.
	if inv_id in GameData.inv_list_all:
		queue_free()



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
