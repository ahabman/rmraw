#! /usr/bin/env ruby
# remove CR2 raw files if corresponding JPG is not present

jpg_files = []
raw_files = []

Dir.glob('./*.JPG'){|jpg_file| jpg_files << File.basename(jpg_file, '.JPG')}
Dir.glob('./*.CR2'){|raw_file| raw_files << File.basename(raw_file, '.CR2')}

raw_files_to_rm = raw_files - jpg_files
raw_files_to_rm.map!{|f| f + '.CR2' }

puts raw_files_to_rm
puts "Delete these #{raw_files_to_rm.length} files? y/n"
raw_files_to_rm.each{|f| File.delete(f) } if gets.chomp == 'y' 