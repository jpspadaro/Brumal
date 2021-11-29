extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()



func _process(delta):
	pass



func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
