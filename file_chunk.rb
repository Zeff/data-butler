#!/usr/bin/env ruby

# Split file on chunk size
def chunk(file_name, prefix, chunksize = 1_073_741_824)
  File.open(file_name"r") do |f|
    until f.eof?
      File.open("#{prefix}_#{"%05d"%(f.pos/chunksize)}.txt","w") do |fc|
        fc << f.read(chunksize)
      end
    end
  end
end

#split file on chunk_size and ensure split on end of line (\n)
def line_chunk(file_name, prefix, chunksize = 1_073_741_824)
  outfilenum = 1
  File.open(file_name,"r") do |f|
    until f.eof?
      File.open("#{out_pref}_#{outfilenum}.txt","w") do |outfile|
        line = ""
        while outfile.size <= (chunksize-line.length) && !f.eof?
          line = f.readline
          outfile << line
        end
      end
      outfilenum += 1
    end
  end
end

chunker("inputfile.txt", "output_prefix") # optional chunk size if different than default
line_chunker("inputfile.txt", "output_prefix") # optional chunk size if different than default

# TODO need to check for 'split' on system and use if available
#   system("split -a 4 -l 200 input.csv 'prefix-'")
#     Options:
#       -a 4      Size of suffix for output file '0000', '0001'
#       -l 200    200 lines per file
#       input.csv The name of the input file
#       'prefix-' Prefix name of created files with 'prefix-n'
