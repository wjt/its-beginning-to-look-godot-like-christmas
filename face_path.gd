extends Path2D

@onready var _follow = $FacePathFollow
@onready var _faces: Array[Node] = _follow.get_children()
var _i = 0
const DURATION = 20.0

func _start_a_face():
	var tween = get_tree().create_tween()
	var sprite = _faces[_i]
	_i = (_i + 1) % len(_faces)
	sprite.show()
	if true:
		_follow.progress_ratio = 0.0
		tween.tween_property(_follow, "progress_ratio", 1.0, DURATION)
	else:
		_follow.progress_ratio = 1.0
		tween.tween_property(_follow, "progress_ratio", 0.0, DURATION)
	tween.tween_callback(sprite.hide)
	tween.tween_callback($Timer.start)


func _on_timer_timeout() -> void:
	_start_a_face()
