@tool
extends Slide
class_name DateEventsSlide


@export var date = "1/1/25"
@export var lmc_events:Array[LMCEvent]
@export var date_text_color:Color
@export var date_underline_color:Color
@export var grid_text_color:Color

@onready var info_grid:GridContainer = $InfoGrid


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var date_iso = DateUtil.mmddyy_to_iso8061(date)
	var date_dict = Time.get_datetime_dict_from_datetime_string(date_iso, true)
	var weekday = DateUtil.humanize_weekday(date_dict.weekday)
	
	$DateLabel.text = "%s %s/%s" % [weekday, date_dict.month, date_dict.day]
	$DateLabel.add_theme_color_override("font_color", date_text_color)

	var font:Font = $DateLabel.get_theme_font("font")
	var width = font.get_multiline_string_size(
		$DateLabel.text, HORIZONTAL_ALIGNMENT_LEFT, -1,
		$DateLabel.get_theme_font_size("font_size")
	).x
	$DateUnderline.size.x = width
	$DateUnderline.color = date_underline_color

	populate_events()


func populate_events() -> void:
	for event in lmc_events:
		var label := Label.new()		
		label.text = event.time
		label.add_theme_color_override("font_color", grid_text_color)
		info_grid.add_child(label)

		label = Label.new()
		label.add_theme_color_override("font_color", grid_text_color)
		label.text = event.title
		info_grid.add_child(label)
