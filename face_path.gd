extends Path2D

enum Direction {
	FORWARDS,
	BACKWARDS,
}

@onready var _follow = $FacePathFollow
@onready var _faces = [
	[$FacePathFollow/Rob, Direction.FORWARDS],
	[$FacePathFollow/Rodrigo, Direction.BACKWARDS],
	[$FacePathFollow/Stephen, Direction.FORWARDS],
]
const DURATION = 20.0

func _start_a_face():
	var tween = get_tree().create_tween()
	var x = _faces.pick_random()
	var sprite: Sprite2D = x[0]
	var direction = x[1]
	sprite.show()
	match direction:
		Direction.FORWARDS:
			_follow.progress_ratio = 0.0
			tween.tween_property(_follow, "progress_ratio", 1.0, DURATION)
		Direction.BACKWARDS:
			_follow.progress_ratio = 1.0
			tween.tween_property(_follow, "progress_ratio", 0.0, DURATION)
	tween.tween_callback(sprite.hide)


func _on_timer_timeout() -> void:
	_start_a_face()
