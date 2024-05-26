extends Node2D

const SPEED = 60
var direction = 1

@onready var ray_cast_2d_right = $RayCast2DRight
@onready var ray_cast_2d_left = $RayCast2DLeft
@onready var animated_sprite_2d = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_2d_right.is_colliding() && \
	   direction == calculate_direction(ray_cast_2d_right.get_collision_point() - position):
		direction = flip_direction(direction)
		animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
	elif ray_cast_2d_left.is_colliding() && \
		 direction == calculate_direction(ray_cast_2d_left.get_collision_point() - position):
		direction = flip_direction(direction)
		animated_sprite_2d.flip_h = !animated_sprite_2d.flip_h
		
	position.x += SPEED * direction * delta

func calculate_direction(v: Vector2) -> int:
	return 1 if v.x > 0 else -1

func flip_direction(d: int):
	return d * -1
