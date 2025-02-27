extends Resource
class_name SlideLoader

enum LoadState {
	NO_SLIDE,
	BLANK_SLIDE,
	DATE_EVENTS_SLIDE,
	DATE_EVENTS_SLIDE_EVENTS,
}

var state := LoadState.NO_SLIDE
var blank_slide = preload("res://slides/blank_slide.tscn")
var date_events_slide = preload("res://slides/date_events_slide.tscn")

func load(filename: String) -> Array[Slide]:
	var slides: Array[Slide] = []
	var file := FileAccess.open(filename, FileAccess.READ)

	while not file.eof_reached():
		var line = file.get_line()
		print(state, line)
	
		if line == "[Blank]":
			state = LoadState.BLANK_SLIDE
			slides.append(blank_slide.instantiate())
		elif line == "[DateEvents]":
			state = LoadState.DATE_EVENTS_SLIDE
			slides.append(date_events_slide.instantiate())
		elif state == LoadState.DATE_EVENTS_SLIDE:
			slides[-1].date = line
			state = LoadState.DATE_EVENTS_SLIDE_EVENTS
		elif state == LoadState.DATE_EVENTS_SLIDE_EVENTS:
			var parts = line.split(",")
			if len(parts) < 2:
				continue

			var event := LMCEvent.new()
			event.time = parts[0].strip_edges()
			event.title = parts[1].strip_edges()
			slides[-1].lmc_events.append(event)

	print(slides)

	return slides
