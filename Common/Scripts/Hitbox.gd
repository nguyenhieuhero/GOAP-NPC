extends Area2D
class_name Hitbox

@export var dame: float = 10;
@onready var attack = AttackSource.new()


func _ready():
	attack.dame = dame
	attack.source = get_parent().global_position

