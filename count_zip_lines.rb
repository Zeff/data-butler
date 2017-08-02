#!/usr/bin/env ruby
require 'rubygems'
require 'zip'

def count_zip_lines(in_file)
  Zip::File.open(in_file) do |zip_file|
    # Iterate through zipped entries
    zip_file.each do |entry|
      if entry.file?
        # Read into memory
        data = entry.get_input_stream.read
        # Count the number of lines in the file
        line_count = data.lines.count
        # Output status of operation
        puts "#{entry.name}: #{line_count.to_s}"
      else
        puts "#{entry.name} is not a file."
      end
    end
  end
end

count_zip_lines(ARGV[0])
