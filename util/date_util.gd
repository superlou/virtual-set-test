class_name DateUtil


static func mmddyy_to_iso8061(text: String) -> String:
    var parts = text.split("/")
    return "20" + parts[2] + "-" + parts[0] + "-" + parts[1]


const WEEKDAYS := [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
]

static func humanize_weekday(num: int) -> String:
    return WEEKDAYS[num]