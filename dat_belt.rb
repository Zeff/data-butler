#!/usr/bin/env ruby
require 'optparse'
require 'ostruct'
require 'csv'

options = OpenStruct.new
# set option defaults
# options.output = 'my.csv'
# options.cols = 10
# options.prefix = 'var'

OptionParser.new do |opt|
  opt.on('-v', '--version', 'Returns current version of this utility.') { |o| options[:version] = true }
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

# TODO This started as my transpose function, but going to refactor as OO launch point for script modules
# TODO consider making this menu driven due to the quantity of other scripts involved
# TODO Need to ensure that the other scripts remain usable on their own.

# Other scripts I have started or will be adding shortly
########## in progress ...
# TODO trans_cols_by_rows Transposes the comma delimited data in a single column to rows of N length.
#      see transpose_to_columns.rb
# TODO ziplines           Returns the number of lines in each record in a zip archive
# TODO chunker            Splits large files into series of smaller files and creates manifest for easy digestion
# TODO trans_to_col       Transposes the comma delimited data in a single row to a single column.
########### in backlog
# TODO count_records      Returns the number of rows in a set.
# TODO count_cols         Returns the number of columns per row in a set.
# TODO merge_cols         Merges columns from separate files to a single file with all columns.
# TODO merge_rows         Merges rows from separate files with dup columns to a single file with all rows.
