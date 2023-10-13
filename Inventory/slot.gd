extends Panel
class_name Slot

@onready var backgroundSprite: Sprite2D = $background
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/item
@onready var amountLabel = $CenterContainer/Panel/Label

func update_slot(slot: InventorySlot):
	if !slot.itemResource:
		backgroundSprite.frame = 0
		itemSprite.visible = false
		amountLabel.visible = false
	else:
		backgroundSprite.frame = 1
		itemSprite.visible = true
		itemSprite.texture = slot.itemResource.texture
		amountLabel.visible = true
		amountLabel.text = str(slot.quanity)
