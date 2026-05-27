extends CanvasLayer

@export var shop_panel: Control
@export var cart_button: TextureButton
@export var icon_default: Texture2D
@export var icon_alert: Texture2D
@export var get_button: Button

func _ready() -> void:
	if shop_panel:
		shop_panel.visible = false
	if cart_button:
		cart_button.pressed.connect(_on_cart_pressed)
	if get_button:
		get_button.pressed.connect(_on_get_pressed)
	GameManager.shop_notification_changed.connect(_on_shop_notification_changed)
	_refresh_cart_icon()

func _on_shop_notification_changed(_has_notification: bool) -> void:
	_refresh_cart_icon()

func _on_cart_pressed() -> void:
	if shop_panel:
		shop_panel.visible = true

func _on_get_pressed() -> void:
	var bought := GameManager.buy_amogus()
	if not bought:
		return
	if shop_panel:
		shop_panel.visible = false
	_refresh_cart_icon()

func _refresh_cart_icon() -> void:
	if not cart_button:
		return
	cart_button.texture_normal = icon_alert if GameManager.shop_has_notification else icon_default
