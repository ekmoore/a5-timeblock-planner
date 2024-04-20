HOUR_LABELS = [7, 8, 9, 10, 11, 12, 1, 2, 3, 4, 5, 6, 7, 8, 9]
HOUR_COUNT = HOUR_LABELS.length
COLUMN_COUNT = 4
LIGHT_COLOR = 'AAAAAA'
MEDIUM_COLOR = '888888'
DARK_COLOR   = '000000'
DATE_FULL_START = '%A, %B %-d'
DATE_FULL_END = ' — %A, %B %-d, %Y'
DATE_FULL = '%A, %B %-d, %Y'
DATE_LONG = '%B %-d, %Y'
DATE_DAY = '%A'
OSX_FONT_PATH = "/System/Library/Fonts/Supplemental/Futura.ttc"
FONTS = {
  'Futura' => {
    normal: { file: OSX_FONT_PATH, font: 'Futura Medium' },
    italic: { file: OSX_FONT_PATH, font: 'Futura Medium Italic' },
    bold: { file: OSX_FONT_PATH, font: 'Futura Condensed ExtraBold' },
    condensed: { file: OSX_FONT_PATH, font: 'Futura Condensed Medium' },
  }
}
PAGE_SIZE = 'A5'
# Order is top, right, bottom, left
LEFT_PAGE_MARGINS = [36, 52, 36, 36]
RIGHT_PAGE_MARGINS = [36, 36, 36, 52]

# Adjust the quarters to a fiscal year, 1 for Jan, 2 for Feb, etc.
Q1_START_MONTH = 1
QUARTERS_BY_MONTH = (1..12).map { |month| (month / 3.0).ceil }.rotate(1 - Q1_START_MONTH).unshift(nil)

# Use these if you have sprints of a weekly interval
SPRINT_EPOCH = Date.parse('2023-01-04')
SPRINT_LENGTH = 14

# Names by day of week, 0 is Sunday.
OOOS_BY_WDAY = [nil, nil, nil, nil, nil, nil, nil]

# Repeating tasks by day of week, 0 is Sunday. Nested index is the row.
TASKS_BY_WDAY = [
  {},
  {},
  {},
  {},
  {},
  {},
  {},
]
