extends Resource
class_name InventoryResource

signal updated
@export var slots: Array[InventorySlot]
@export var maxInSLot :int = 9

func isSlotAvailabel(item: ItemResource) -> bool:
	for slot in slots:
		if slot.itemResource == item and slot.quanity >= maxInSLot:
			return false
	return true
func insert(item: ItemResource):
	for slot in slots:
		if slot.itemResource == item:
			slot.quanity += 1
			updated.emit()
			return
	
	
	for i in range(slots.size()):
		if !slots[i].itemResource:
			slots[i].itemResource = item
			slots[i].quanity = 1
			updated.emit()
			return
