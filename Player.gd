extends KinematicBody



onready var camera = $RotationHelper/Camera
onready var rotation_helper = $RotationHelper

export var gravity = -30
var max_speed = GameData.Player_Speed
var mouse_sensitivity = 0.002  # radians/pixel

var velocity = Vector3()

func get_input():
	var input_dir = Vector3()
	# desired move in camera direction
	if Input.is_action_pressed("move_forward"):
		input_dir += -camera.global_transform.basis.z
		if not $AudioStreamPlayer3D.playing:
			$AudioStreamPlayer3D.play()
	if Input.is_action_pressed("move_backward"):
		input_dir += camera.global_transform.basis.z
		if not $AudioStreamPlayer3D.playing:
			$AudioStreamPlayer3D.play()
	if Input.is_action_pressed("strafe_left"):
		input_dir += -camera.global_transform.basis.x
		if not $AudioStreamPlayer3D.playing:
			$AudioStreamPlayer3D.play()
	if Input.is_action_pressed("strafe_right"):
		input_dir += camera.global_transform.basis.x
		if not $AudioStreamPlayer3D.playing:
			$AudioStreamPlayer3D.play()
	if Input.is_action_just_released("pickup"):
		pick_up()
	input_dir = input_dir.normalized()
	return input_dir


func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_helper.rotate_x(-event.relative.y * mouse_sensitivity)
		rotate_y(-event.relative.x * mouse_sensitivity)
		rotation_helper.rotation.x = clamp(rotation_helper.rotation.x, -1.2, 1.2)

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func pick_up():
	if $RotationHelper/Camera/RayCast.is_colliding():
		# print ("Raycast. Colliding with " + $RotationHelper/Camera/RayCast.get_collider().name)
		GameData.pick_up($RotationHelper/Camera/RayCast.get_collider())
	else:
		GameData.notify("There is nothing there!")



func _physics_process(delta):
	velocity.y += gravity * delta
	var desired_velocity = get_input() * max_speed

	if GameData.Player_HP < 50:
		desired_velocity = desired_velocity / 2

	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)

	if GameData.Player_HP < 1:
		GameData.notify("You fall unconscious...when you awaken again your are in the cabin.")
		get_tree().change_scene("res://House_Interior.tscn")
		
		if GameData.Player_Wealth > 10:
			GameData.death_audio()
			GameData.Player_Speed -= 1
			if GameData.Player_Speed < 1:
				get_tree().change_scene("res://LoseGame.tscn")
			GameData.notify("Your skin hardens, making it harder to move!")
		GameData.Player_HP = 50


	$HUD/VBoxContainer/PlayerHP_Text.text = String(GameData.Player_HP)
	$HUD/VBoxContainer/PlayerWealth_text.text = "Wealth: " + String(GameData.Player_Wealth)
	$HUD/Notification_Box/Notification_Text.text = GameData.notifications
	$HUD/HeldItem_Text.text = GameData.inv_list[GameData.inv_held]
	if GameData.inv_description.has(GameData.inv_list[GameData.inv_held]):
		$HUD/HeldItem_Desc.text = GameData.inv_description[GameData.inv_list[GameData.inv_held]]
	else:
		$HUD/HeldItem_Desc.text = ""
	
