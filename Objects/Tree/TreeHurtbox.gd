extends Hurtbox
@export var animation: AnimationPlayer
@export var log: Area2D
const logx = preload("res://Items/Scences/Log.tscn")

func _on_area_entered(area: Hitbox):
	print(get_parent().global_position)
	animation.play("being hit")
	if currentHealth - area.dame < 0:
		if(vectorDame.x > 0):
			animation.play("fall_right")
		else:
			animation.play('fall_left')
		await animation.animation_finished
		addLog(get_parent().position)
	super(area)
func addLog(pos: Vector2):
	var _log = logx.instantiate()
	_log.global_position = pos
	get_parent().get_parent().add_child(_log)

	
	

	
