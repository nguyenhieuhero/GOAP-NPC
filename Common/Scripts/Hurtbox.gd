extends Area2D
class_name Hurtbox
@export var maxHealth: int = 45
var currentHealth: int
# Called when the node enters the scene tree for the first time.
func _ready():
	currentHealth = maxHealth
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area: Hitbox):
	currentHealth-=area.dame
#	print(currentHealth)
	if(currentHealth<0):
		get_parent().queue_free()
