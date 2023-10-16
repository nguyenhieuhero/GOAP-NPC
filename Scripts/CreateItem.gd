extends Node
const log = preload("res://Items/Scences/Log.tscn")
func create_log(pos: Vector2):
	var _log = log.instantiate()
	_log.global_position = pos
	print(_log)
