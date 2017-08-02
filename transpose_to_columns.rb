#!/usr/bin/env ruby
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

def transpose_to_columns(in_file)
  CSV.open(in_file, "wb") do |csv|
    headers = []
    (1..(options[:cols].to_i)).each do |i|
      #TODO make everything here optional, enum on letters/numbers, with/without leading characters, with or without headers
      headers.push(options[:prefix] + i.to_s.rjust(options[:cols].to_s.length, "0"))
    end

    csv << headers

    File.open(in_file) do |f|
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
end

transpose_to_columns(options[:output])
