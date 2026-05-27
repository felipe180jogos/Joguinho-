extends CanvasLayer

@export var coins_label: Label

func _ready() -> void:
	GameManager.coins_changed.connect(_on_coins_changed)
	_on_coins_changed(GameManager.coins)

func _on_coins_changed(total: int) -> void:
	if not coins_label:
		return
	coins_label.text = "Moedas: %d" % total
