extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print_debug("WorldOfNul Loaded.")
	$MogdarTheUndying/AnimationPlayer.play("Float")

func _on_AnimationPlayer_animation_finished(anim):
	$MogdarTheUndying/AnimationPlayer.play(anim)
