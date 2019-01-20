extends "res://Scripts/character.gd"

var motion = Vector2()

func _process(delta):
    update_motion(delta)
    move_and_slide(motion)

func update_motion(delta):
    look_at(get_global_mouse_position())
    
    if Input.is_action_pressed('ui_right'):
        motion.x += SPEED
    if Input.is_action_pressed('ui_left'):
        motion.x -= SPEED
    if Input.is_action_pressed('ui_down'):
        motion.y += SPEED
    if Input.is_action_pressed('ui_up'):
        motion.y -= SPEED
        
    motion.x = lerp(motion.x, 0, FRICTION)
    motion.y = lerp(motion.y, 0, FRICTION)
    
    motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
    motion.y = clamp(motion.y, -MAX_SPEED, MAX_SPEED)