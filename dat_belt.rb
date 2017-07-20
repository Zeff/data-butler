require 'optparse'
require 'ostruct'
require 'csv'

options = OpenStruct.new
options.output = 'my.csv'
options.cols = 10
options.prefix = 'var'

OptionParser.new do |opt|
  opt.on('-v', '--version', 'Returns current version of this utility') { |o| options[:version] = true }
  opt.on('-f', '--file FILE_PATH', 'Path to data file to be processed.') { |o| options[:file] = o }
  opt.on('-o', '--ouput FILE_PATH', 'Path to data file to be written.') { |o| options[:output] = o }
  opt.on('-c', '--cols NUMBER_OF_COLUMNS', 'Number of columns to break on.') { |o| options[:cols] = o }
  opt.on('-p', '--prefix PREFIX', 'Custom variable prefix.') { |o| options[:prefix] = o }
end.parse!

case
when options[:version] == true
  puts "version 0.1"
  return
when !options[:file]
  puts "Please run the command with the -f option, specifying an input CSV."
  return
end


CSV.open(options[:output], "wb") do |csv|
  headers = []
  (1..(options[:cols].to_i)).each do |i|
    #TODO make everything here optional, enum on letters/numbers, with/without leading characters
    headers.push(options[:prefix] + i.to_s.rjust(options[:cols].to_s.length, "0"))
  end

  csv << headers

  File.open(options[:file]) do |f|
    row = []
    f.each_line.with_index do |line, idx|
      row.push(line.chomp.to_i)
      if (idx+1)%options[:cols].to_i == 0
        # TODO determine how to clean up uneven rows at the end (drop or wrap - make an option?)
        csv << row
        row.clear
      end
    end
  end
end


# TODO refactor as OO launch point for script modules
# TODO consider making this menu driven due to the quantity of other scripts involved
# Need to ensure that the other scripts remain usable on their own.

# Other scripts I will be adding shortly
# TODO tc Transposes the comma delimited data in a single row to a single column.
# TODO tr Transposes the comma delimited data in a single column to rows of N length.
# TODO cr Returns the number of rows in a set.
# TODO cc Returns the number of columns per row in a set.
# TODO mc Merges columns from separate files to a single file with all columns.
# TODO mr Merges columns from separate files to a single file with all columns.
