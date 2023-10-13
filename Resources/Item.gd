extends Resource
class_name ItemResource

@export var name: String = ""
@export var texture: Texture2D
@export var parentStat: Stat
@export var addHealth: int = 0
@export var addSanity: int = 0
@export var addHunger: int = 0

func use_item():
	parentStat.health += addHealth
	parentStat.hunger += addHunger
	parentStat.sanity += addSanity
	
