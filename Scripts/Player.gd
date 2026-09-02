extends CharacterBody3D

var headbob_enab : bool = true
var t_bob = 0.0
var speed

var mouse_motion := Vector2.ZERO
var capture_mouse = false

const WALK_SPEED = 5.0
const SPRINT_SPEED = 8.0
const JUMP_VELOCITY = 4.5
const SENSITIVITY = 0.001
const BOB_FREQ = 2.0
const BOB_AMP = 0.08

#fov
var base_fov = 100
const FOV_CHANGE = 1.5

#flashlight
var flashlight_rotation_smoothness := 15.0
var flashlight_position_smoothness := 15.0

@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera
@onready var flashlight: SpotLight3D = $flashlight

var bullet = load("res://Scenes/bullet.tscn")
@onready var pos : Node3D = $Head/Camera/rock_spawn
@onready var bullet_cooldown: Timer = $bullet_cooldown
var bullet_cooled : bool


func _ready() -> void:
	bullet_cooled = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Handle Sprint
	if Input.is_action_pressed("shift"):
		speed = SPRINT_SPEED
	else:
		speed = WALK_SPEED
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("a", "d", "w", "s")
	var direction := (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if is_on_floor():
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 7.0)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 7.0)
	else:
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 2.0)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 2.0)
	
	#Head bob
	if headbob_enab:
		t_bob += delta * velocity.length() * float(is_on_floor())
		camera.transform.origin = _headbob(t_bob)
	
	#fov
	var velocity_clamped = clamp(velocity.length(), 0.5, SPRINT_SPEED * 2)
	var target_fov = base_fov + FOV_CHANGE * velocity_clamped
	camera.fov = lerp(camera.fov, target_fov, delta * 8.0)
	
	move_and_slide()

func _process(delta: float) -> void:
	headbob_enab = Global.headbob_enab
	
	update_flashlight(delta)
	#update_rotations(delta)
	
	if Input.is_action_just_pressed("f"):
		flashlight.visible = !flashlight.visible
	
	if Input.is_action_just_pressed("m1"):
		if bullet_cooled:
			bullet_cooldown.start()
			bullet_cooled = false
			var instance = bullet.instantiate()
			instance.position = pos.global_position
			instance.transform.basis = pos.global_transform.basis
			get_parent().add_child(instance)
			print("bullet_instanciated")

func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	return pos

func update_flashlight(delta: float) -> void:
	flashlight.global_transform = Transform3D(
	flashlight.global_transform.basis.slerp(camera.global_transform.basis, delta * flashlight_rotation_smoothness),
	flashlight.global_transform.origin.slerp(camera.global_transform.origin, delta * flashlight_position_smoothness)
)

func update_rotations(delta: float) -> void:
	pos.global_transform = Transform3D(
	pos.global_transform.basis.slerp(camera.global_transform.basis, delta * 20),
	pos.global_transform.origin.slerp(camera.global_transform.origin, delta * 20)
)


func _on_bullet_cooldown_timeout() -> void:
	bullet_cooled = true


func _input(event: InputEvent) -> void:
	#Allow escape to switch mouse modes to close window or interact with UI ap
	if event is InputEventMouseButton:
		if not capture_mouse:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			capture_mouse = true
			Engine. time_scale = 1.0
	if event.is_action_pressed("ui_cancel"):
		if capture_mouse:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			capture_mouse = false
