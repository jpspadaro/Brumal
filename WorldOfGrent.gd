extends Spatial

var enemy_path

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()



func _physics_process(delta):
	enemy_path = $ShadowSheet.global_transform.origin - $Player.global_transform.origin
	#print("Next Path: " + String(enemy_path))
	$ShadowSheet.set_target(enemy_path)



func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
