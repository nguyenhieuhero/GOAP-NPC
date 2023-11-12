extends Hurtbox
@export var animation: AnimationPlayer
@export var log: Area2D
const logx = preload("res://Items/Scences/Log.tscn")

func _on_area_entered(area: Hitbox):
	animation.play("being hit")
	if currentHealth - area.dame < 0:
		animation.play("fall")
		await animation.animation_finished
		var log1 = get_parent().position
		addLog(log1)
		var log2 = Vector2( log1.x + 20, log1.y + 10)
		var log3 = Vector2( log1.x + 10, log1.y + 27)
		addLog(log2)
		addLog(log3)
	super(area)
func addLog(pos: Vector2):
	var _log = logx.instantiate()
	_log.global_position = pos
	get_parent().get_parent().add_child(_log)

	
	

	
