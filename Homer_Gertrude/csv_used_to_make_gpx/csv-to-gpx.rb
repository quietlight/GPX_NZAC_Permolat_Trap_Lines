#!/usr/bin/ruby

#! name, lon, lat, ele, time, desc, cmt

require 'csv'
require 'time'

print "CSV file to read: "
input_file = gets.chomp

print "Trapping Area: "
area = gets.chomp

print "When is the trap check (dd-mm-yyyy): "
date = gets.chomp + " "

now = Time.now
time = Time.parse(date, now)
filename = "Waypoints-#{area}-#{time.strftime("%Y-%m-%d")}"

#print "File to write XML to: "
output_file = filename

#print "What to call each record: "
record_name = "wpt" #"gets.chomp"

csv = CSV::parse(File.open(input_file) {|f| f.read} )
fields = csv.shift

puts ""
puts ""
puts "Writing XML..."

# NZ Topo50 App
ICONS = {
"DC Hil" => "22",
"DC Wha" => "8",
"Helena" => "1",
"Line 1" => "12",
"Line 2" => "13",
"Line 3" => "14",
"Line 4" => "15",
"Line 5" => "16",
"Line 6" => "17",
"Line 7" => "18",
"Line 8" => "19",
"Old Do" => "5",
"Tailra" => "6",
"Wilmot" => "10" }
  

File.open(("NZTopo50-"+filename+".gpx"), 'w') do |f|
  f.puts '<?xml version="1.0" encoding="UTF-8" standalone="no" ?>'
  f.puts '<gpx version="1.1" creator="David Cary">'
  csv.each do |record|
    f.puts " <#{record_name} #{fields[1]}=\"#{record[1]}\" #{fields[2]}=\"#{record[2]}\">"
      f.puts "  <#{fields[0]}>#{record[0]}</#{fields[0]}>"
      f.puts "  <#{fields[3]}>#{record[3]}</#{fields[3]}>"
      f.puts "  <#{fields[4]}>#{record[4]}</#{fields[4]}>"
      f.puts "  <#{fields[5]}></#{fields[5]}>"
      f.puts "  <extensions>"
      f.puts "    <icon>#{ICONS[(record[5][0...6])]}</icon>"
      f.puts "    <photourl></photourl>"
      f.puts "    <colorindex></colorindex>"
      f.puts "  </extensions>"    
    f.puts " </#{record_name}>"
    f.puts ""
  end
  f.puts '</gpx>'
end # End file block - close file
puts "#{("NZTopo50-"+filename)} written."

# Garmin
SYM = {
  "DOC" => "Pin, Red",
  "A24" => "Pin, Blue",
  "A12" => "Pin, Green",
  "Tra" => "Pin, Green",
  "Liv" => "Navaid, Blue",
  "No " => "Navaid, Black"
}

File.open(("Garmin-"+filename+".gpx"), 'w') do |f|
  f.puts '<?xml version="1.0" encoding="UTF-8" standalone="no" ?>'
  f.puts '<gpx version="1.1" creator="David Cary">'
  csv.each do |record|
    f.puts " <#{record_name} #{fields[1]}=\"#{record[1]}\" #{fields[2]}=\"#{record[2]}\">"
      f.puts "  <#{fields[0]}>#{record[0]}</#{fields[0]}>"
      f.puts "  <#{fields[3]}>#{record[3]}</#{fields[3]}>"
      f.puts "  <#{fields[4]}>#{record[4]}</#{fields[4]}>"
      f.puts "  <#{fields[5]}>#{record[5]}</#{fields[5]}>"
      f.puts "  <#{fields[6]}>#{record[6]}</#{fields[6]}>"
      f.puts "  <sym>#{SYM[(record[6][0...3])]}</sym>"
    f.puts " </#{record_name}>"
    f.puts " "
  end
  f.puts '</gpx>'
end # End file block - close file
puts "#{("Garmin-"+filename)} written."

# Map Toaster
MTSYM = {
  "DC Hil" => "e32636",
  "DC Wha" => "5d8aa8",
  "Helena" => "efdecd",
  "Line 1" => "ffbf00",
  "Line 2" => "9966cc",
  "Line 3" => "cd9575",
  "Line 4" => "915c83",
  "Line 5" => "fbceb1",
  "Line 6" => "00ffff",
  "Line 7" => "7fffd4",
  "Line 8" => "e9d66b",
  "Old Do" => "b2beb5",
  "Tailra" => "ff9966",
  "Wilmot" => "a52a2a"
}

File.open(("MapToaster-"+filename+".gpx"), 'w') do |f|
  f.puts '<?xml version="1.0" encoding="UTF-8" standalone="no" ?>'
  f.puts '<gpx version="1.1" creator="David Cary">'
  csv.each do |record|
    f.puts " <#{record_name} #{fields[1]}=\"#{record[1]}\" #{fields[2]}=\"#{record[2]}\">"
      f.puts "  <#{fields[0]}>#{record[0]}</#{fields[0]}>"
      f.puts "  <#{fields[3]}>#{record[3]}</#{fields[3]}>"
      f.puts "  <#{fields[4]}>#{record[4]}</#{fields[4]}>"
      f.puts "  <#{fields[5]}>#{record[5]}</#{fields[5]}>"
      f.puts "  <type>#{record[6]}</type>"
      f.puts "  <extensions>"
      f.puts "    <inmap:colour  xmlns:inmap=\"http://www.inmap.net/xmlschema/GPXtensions/1/0\">#{MTSYM[(record[5][0...6])]}</inmap:colour>"
      f.puts "  </extensions>"  
    f.puts " </#{record_name}>"
    f.puts " "
  end
  f.puts '</gpx>'
end # End file block - close file
puts "#{("MapToaster-"+filename)} written."

# CSV Template

File.open(("Template-"+filename+".csv"), 'w') do |f|
  f.puts "#{fields[0]},#{fields[1]},#{fields[2]},#{fields[3]},#{fields[4]},#{fields[5]},#{fields[6]},CATCH(Mouse/Rat/Stoat/Weasel/Cat/Other),TRAPPER COMMENT,TEAM"
  csv.each do |record|
    f.puts "#{record[0]},#{record[1]},#{record[2]},#{record[3]},#{time},#{record[5]},#{record[6]},,,"
  end
end # End file block - close file
puts "#{("Template-"+filename)} written."


puts "Done"
puts ""
puts ""

