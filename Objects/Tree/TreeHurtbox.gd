extends Hurtbox
@export var animation: AnimationPlayer
@export var log: Area2D
func _on_area_entered(area: Hitbox):
	animation.play("being hit")
	if currentHealth - area.dame < 0:
		animation.play("fall")
		await animation.animation_finished
		GlobalTileMap.addLog(get_parent().global_position)
	super(area)
	
