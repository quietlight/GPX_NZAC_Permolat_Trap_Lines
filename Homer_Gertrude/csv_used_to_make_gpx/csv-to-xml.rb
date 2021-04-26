#!/usr/bin/ruby

require 'csv'

print "CSV file to read: "
input_file = gets.chomp

print "File to write XML to: "
output_file = gets.chomp

#print "What to call each record: "
record_name = "wpt" #"gets.chomp"

csv = CSV::parse(File.open(input_file) {|f| f.read} )
fields = csv.shift

puts "Writing XML..."

File.open(output_file, 'w') do |f|
  f.puts ''
  f.puts ''
  csv.each do |record|
    f.puts " <#{record_name} #{fields[1]}=\"#{record[1]}\" #{fields[2]}=\"#{record[2]}\">"
      f.puts "  <#{fields[0]}>#{record[0]}</#{fields[0]}>"
      f.puts "  <#{fields[3]}>#{record[3]}</#{fields[3]}>"
      f.puts "  <#{fields[4]}>#{record[4]}</#{fields[4]}>"
      f.puts "  <#{fields[5]}>#{record[5]}</#{fields[5]}>"
      f.puts "  <#{fields[6]}>#{record[6]}</#{fields[6]}>"
      f.puts "  <#{fields[7]}>#{record[7]}</#{fields[7]}>"

    

    f.puts " </#{record_name}>"
    f.puts " "
  end
  f.puts ''
end # End file block - close file

puts "Contents of #{input_file} written as XML to #{output_file}."
