extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector3()
export var Speed = 8
var gravity = -9.8

var target_found = false
var target_node
var target = global_transform.origin

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Walk")
	
func set_target(targetin):
	target = targetin

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var desired_velocity = Vector3()
	
	if target_found:
		set_target(global_transform.origin - target_node.global_transform.origin)
		look_at(target_node.global_transform.origin, Vector3.UP)
	
	desired_velocity = -target.normalized()
	# desired_velocity.y += gravity * delta
	print ("Beast Target:" + String(target))
	desired_velocity = desired_velocity * Speed
		
	velocity = desired_velocity
	

	print ("Velocity: " + String(velocity))
	velocity = move_and_slide(velocity, Vector3.UP, true)


func _on_Area_body_entered(body):
	if body.is_in_group("Player"):
		GameData.notify("The beast attacks you!")
		GameData.Player_HP = 0
		if not $AudioStreamPlayer3D.playing:
			$AudioStreamPlayer3D.play()


func _on_TargetArea_body_entered(body):
	if body.is_in_group("Player"):
		var enemy_path = global_transform.origin - body.global_transform.origin
		set_target(enemy_path)
		target_found = true
		target_node = body
		$AudioStreamPlayer3D.play()


func _on_AnimationPlayer_animation_finished(anim_name):
	$AnimationPlayer.play("Walk")
