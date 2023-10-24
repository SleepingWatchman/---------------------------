extends CharacterBody2D

@onready var sprite_2d: Sprite2D = $Sprite2D

const MAX_SPEED = 125
const ACCELERATION_SMOOTHING = 25



func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	var target_velocity = direction * MAX_SPEED
	
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCELERATION_SMOOTHING))
	
	move_and_slide()
	

func get_movement_vector():
	#var movement_vector = Vector2.ZERO
	
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	if Input.is_action_pressed("move_left") == true:
		sprite_2d.flip_h = false
	elif Input.is_action_pressed("move_right") == true:
		sprite_2d.flip_h = true
	return Vector2(x_movement,y_movement)
