extends CharacterBody2D

@export var SPEED = 50
@export var ROTATION_SPEED = PI/6

var dragging = false
var of: Vector2

func _process(delta):
	if dragging:
		# calculate the distance between self and the mouse positions
		of = get_global_mouse_position() - global_position

		# todo: If we want to limit the speed of this object, we need to:
		#  1: separate of in 2 variables: its length * its direction (.length and .normalize)
		#  2: clamp its length to the desire values
		velocity = of * delta * SPEED

		# calculate the angle from the current position & rotation to the mouse position
		var angle = global_position.rotated(rotation).angle_to_point(get_global_mouse_position())
		# wrap the angle along the y axis, in order to revert the rotation
		angle = wrap(angle, -1.5708, 1.5708)
		# todo: limit the maximum rotation
		rotation += angle * delta * ROTATION_SPEED

		move_and_slide()


func _on_button_button_up() -> void:
	dragging = false


func _on_button_button_down() -> void:
	dragging = true
