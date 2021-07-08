-------------------------------------------------------------------------------------------
Waypoints_Homer_Gertrude_Bowen_Sound.csv is the single source of truth, maintain this file.
-------------------------------------------------------------------------------------------

Workflow
--------
1. Modify the Waypoints_Doubtful_Sound.csv

2. Run ruby csv-to-gpx.rb to create a csv trap checklist and gpx files. Open template in a spreadsheet, click on the 'Trap Number' column and sort in ascending order, click on the 'Line' column and sort in ascending order. It should be organised in ascending order and into trap lines. It works in Numbers. Print or export and send out by email.

Remember the csv file is the single source of truth, modify that and everything else just happens.

Map is at: http://umap.openstreetmap.fr/en/map/doubtful-sound-lines_571999
I have to update this manually.


convert co-ordinate data here:
https://www.geodesy.linz.govt.nz/concord/index.cgi

convert .csv to gpx using $ruby csv-to-gpx.rb
ruby is easiest way to work with .csv data
data formatting of csv important and my script is very brittle but it works
https://dzone.com/articles/ruby-csv-xml-converter
https://www.rubyguides.com/2018/10/parse-csv-ruby/
Just call:
ruby your_program.rb
or start your program with:
#!/usr/bin/env ruby
Make your file executable by running:
chmod +x your_program.rb
Run it with:
./your_program.rb some_paramameters

-------------------------
OLD
-------------------------
2. Run './parseGpxWaypointsToCsv.py > Waypoints_Homer_Gertrude_Bowen.csv' to organise the .gpx into a spreadsheet readable file for easy analisys and checking.

3. Run './parseTemplate.py > Template_Homer_Gertrude_Bowen.csv' to create a csv trap checklist. Open in a spreadsheet, click on the 'Trap Number' column and sort in ascending order, click on the 'Line' column and sort in ascending order. It should be organised in ascending order and into trap lines. It works in Numbers. Print or export and send out by email.

Remember the gpx file is the single source of truth, modify that and everything else just happens.

am using this in the scripts
https://pypi.org/project/gpxpy/

-------------------------
NOTES
-------------------------

