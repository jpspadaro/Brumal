extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var enemy_path = PoolVector3Array()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	enemy_path = $ShadowSheet.global_transform.origin - $Player.global_transform.origin
	#print("Next Path: " + String(enemy_path))
	$ShadowSheet.set_target(enemy_path)
	
	enemy_path = $ShadowSheet2.global_transform.origin - $Player.global_transform.origin
	#print("Next Path: " + String(enemy_path))
	$ShadowSheet2.set_target(enemy_path)	

