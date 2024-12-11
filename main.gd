extends Node2D

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("trigger_face"):
		$FacePath/Timer.stop()
		$FacePath.launch_a_face()
	elif Input.is_action_just_pressed("start_face_timer"):
		$FacePath/Timer.start()
