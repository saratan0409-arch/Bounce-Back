extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const FALL_LIMIT = 650

@onready var animated_sprite = $AnimatedSprite2D


var was_on_floor = true
var is_landing = false

func spring():
	velocity.y = -700

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
#horizonal movement
	var direction := Input.get_axis("ui_left","ui_right")
	if direction:
		velocity.x = direction* SPEED
	else:
		velocity.x = move_toward(velocity.x,0,SPEED)
#flip sprite
	if direction != 0:
		animated_sprite.flip_h = direction <0
	# Get the input direction and handle the movement/deceleration.
	move_and_slide()
	# As good practice, you should replace UI actions with custom gameplay actions.
	var just_landed = is_on_floor() and not was_on_floor
	was_on_floor = is_on_floor()
	
	if global_position.y > FALL_LIMIT:
		get_tree().change_scene_to_file("res://end_scene.tscn")
		return
	
	if just_landed:
		is_landing = true
		play_animation("Landing lag")
	elif is_landing:
		if not animated_sprite.is_playing():
			is_landing = false
	elif not is_on_floor():
		play_animation("Jump")

	elif direction != 0:
		play_animation("Walk")
	
	else:
		play_animation("Idle")

		
func play_animation(animation_name: String) -> void:
	if animated_sprite.animation != animation_name:
		animated_sprite.play(animation_name)
