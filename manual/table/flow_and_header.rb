# encoding: utf-8
#
# If the table cannot fit on the current page it will flow to the next page just
# like free flowing text. If you would like to have the first row treated as a header which will be repeated on
# subsequent pages set the <code>:header</code> option to true.
#
require File.expand_path(File.join(File.dirname(__FILE__),
                                   %w[.. example_helper]))

filename = File.basename(__FILE__).gsub('.rb', '.pdf')
Prawn::Example.generate(filename) do
  data = [["This row should be repeated on every new page"]]
  (1..30).each {|i| data += [["row #{i}"]] }
  
  table(data, :header => true)

  move_down 8
  text "Table with multiple header rows"
  move_down 8

  data = [["First of 2 rows that should be repeated on every new page"], ["Second of 2 rows that should be repeated on every new page"]]
  (1..52).each {|i| data += [["row #{i}"]] }

  table(data, :header => 2)

end
