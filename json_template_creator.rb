#!/usr/bin/env ruby
require 'csv'
require 'json'
require 'optparse'
require 'ostruct'
require 'pry-byebug'

options = OpenStruct.new
options.output = 'my.json'

OptionParser.new do |opt|
  opt.on('-v', '--version', 'Returns current version of this utility') { |o| options[:version] = true }
  opt.on('-f', '--file FILE_PATH', 'Path to data file to be processed.') { |o| options[:file] = o }
  opt.on('-o', '--ouput FILE_PATH', 'Path to data file to be written.') { |o| options[:output] = o }
end.parse!

case
when options[:version] == true
  puts "version 0.1"
  return
when !options[:file]
  puts "Please run the command with the -f option, specifying an input CSV."
  return
end

# binding.pry
lines = CSV.open(options[:file], {converters: :integer}).readlines
keys = lines.delete lines.first

File.open(options[:output], 'w') do |f|
  data = lines.map do |values|
    Hash[keys.zip(values)]
  end
  f.puts JSON.pretty_generate(data)
end
