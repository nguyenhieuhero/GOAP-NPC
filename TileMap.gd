extends TileMap

const log = preload("res://Items/Scences/Log.tscn")
func addLog(pos: Vector2): 
	var _log = log.instantiate()
	_log.global_position = pos
	print(_log)
	get_parent().add_child(_log)
	
