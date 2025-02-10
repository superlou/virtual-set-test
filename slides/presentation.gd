extends Node2D
class_name Presentation


@onready var slides = get_children()
var active_slide_index:int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for slide in slides:
		slide.hide()
	
	slides[0].show()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("advance"):
		advance()


func advance() -> void:
	var active_slide:Slide = slides[active_slide_index]
	
	if active_slide.is_done():
		advance_slide()
	else:
		advance_slide_step()


func advance_slide() -> void:
	var active_slide:Slide = slides[active_slide_index]
	var tween = get_tree().create_tween()
	tween.tween_property(active_slide, "modulate", Color.TRANSPARENT, 0.5)
	tween.parallel().tween_property(active_slide, "position", Vector2(0, 20), 0.5).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(func():
		active_slide.hide()
		active_slide.reset()
	)

	active_slide_index = (active_slide_index + 1) % len(slides)
	active_slide = slides[active_slide_index]

	active_slide.position.x = 50
	active_slide.modulate.a = 0
	tween = get_tree().create_tween()
	tween.tween_property(active_slide, "modulate", Color.WHITE, 1.0)
	tween.parallel().tween_property(active_slide, "position", Vector2(0, 0), 1.0).set_trans(Tween.TRANS_SINE)
	active_slide.show()


func advance_slide_step():
	var active_slide:Slide = slides[active_slide_index]
	active_slide.step()