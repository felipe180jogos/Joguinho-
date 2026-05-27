extends CanvasLayer

@export var slot_texture_rect: TextureRect
@export var amogus_icon: Texture2D

func _ready() -> void:
	GameManager.inventory_changed.connect(_on_inventory_changed)
	_on_inventory_changed(GameManager.inventory_item)

func _on_inventory_changed(item_id: String) -> void:
	if item_id == GameManager.ITEM_AMOGUS:
		slot_texture_rect.texture = amogus_icon
	else:
		slot_texture_rect.texture = null
