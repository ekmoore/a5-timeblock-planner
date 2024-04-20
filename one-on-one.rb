#!/usr/bin/env ruby

require_relative './shared'
FILE_NAME = "one-on-one_forms.pdf"


def sections pdf, first_row, last_row, headings
  (first_row..last_row).each do |row|
    pdf.grid([row, 0],[row, 3]).bounding_box do
      if headings[row]
        pdf.text headings[row], inline_format: true, valign: :bottom
      else
        pdf.stroke_line pdf.bounds.bottom_left, pdf.bounds.bottom_right
      end
    end
  end
end


def one_on_one_page pdf, name, date
  header_row_count = 2
  body_row_count = HOUR_COUNT * 2
  total_row_count = header_row_count + body_row_count
  pdf.define_grid(columns: COLUMN_COUNT, rows: total_row_count, gutter: 0)
  # pdf.grid.show_all

  pdf.grid([0, 0],[1, 1]).bounding_box do
    pdf.text name, heading_format(align: :left)
  end
  pdf.grid([1, 0],[1, 1]).bounding_box do
    pdf.text date.strftime(DATE_LONG), subheading_format(align: :left)
  end
  # grid([0, 2],[0, 3]).bounding_box do
  #   text "right heading", heading_format(align: :right)
  # end

  sections(pdf, 2, body_row_count, {
    2 => "Personal/Notes: <color rgb='#{MEDIUM_COLOR}'>(Details, etc.)</color>",
    5 => "Their Update: <color rgb='#{MEDIUM_COLOR}'>(Notes you take from their “10 minutes”)</color>",
    15 => "My Update: <color rgb='#{MEDIUM_COLOR}'>(Prep notes for your “10 minutes”)</color>",
    24 => "Future/Follow Up: <color rgb='#{MEDIUM_COLOR}'>(Items to review at the next 1:1)</color>",
  })

  # Back of the page
  begin_new_page pdf, :left

  pdf.grid([0, 0],[1, 1]).bounding_box do
    pdf.text name, heading_format(align: :left)
  end
  pdf.grid([1, 0],[1, 1]).bounding_box do
    pdf.text date.strftime(DATE_LONG), subheading_format(align: :left)
  end

  question_start = 24
  question_end = question_start + 8

  sections(pdf, 2, question_start - 1, {
    2 => "Additional Notes:",
  })

  pdf.grid([question_start, 0],[question_start, 3]).bounding_box do
    pdf.text "Questions to Ask:", valign: :bottom, color: DARK_COLOR
  end
  pdf.grid([question_start + 1, 0],[question_end, 13]).bounding_box do
    pdf.text "• Tell me about what you’ve been working on.\n" +
      "• Tell me about your week – what’s it been like?\n" +
      "• Where are you on () project?\n" +
      "• Are you on track to meet the deadline?\n" +
      "• What questions do you have about the project?\n" +
      "• What did () say about this?\n" +
      "• Is there anything I need to do, and if so by when?\n" +
      "• How are you going to approach this?\n" +
      "• What do you think you should do?\n" +
      "• So, you’re going to do () by (), right?\n" +
      "• What can you/we do differently next time?\n" +
      "• Any ideas, suggestions, improvements?", size: 9, color: MEDIUM_COLOR
  end
end

sunday, explanation = parse_start_of_week
puts explanation

monday = sunday.next_day(1)
next_sunday = sunday.next_day(7)
puts "Generating one-on-one forms for #{monday.strftime(DATE_FULL_START)}#{next_sunday.strftime(DATE_FULL_END)} into #{FILE_NAME}"

pdf = init_pdf
#hole_punches pdf

OOOS_BY_WDAY
  .each_with_index
  .reject { |names, _| names.nil? }
  .flat_map { |names, wday| names.map {|name| [name, sunday.next_day(wday)] } }
  .sort_by { |name, date| "#{name}#{date.iso8601}" } # Sort by name or date, as you like
  .each_with_index { |name_and_date, index|
    begin_new_page(pdf, :right) unless index.zero?
    one_on_one_page(pdf, *name_and_date)
  }

pdf.render_file FILE_NAME


