extends TileMap

const fire = preload("res://Objects/Fire/Fire.tscn")
func addFire(pos: Vector2):
	var _fire = fire.instantiate()
	_fire.global_position = pos
	add_child(_fire)
	_fire.get_node("AnimationPlayer").play("fire")
	await _fire.get_node("AnimationPlayer").animation_finished	
	_fire.queue_free()
