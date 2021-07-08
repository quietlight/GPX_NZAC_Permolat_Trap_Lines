-------------------------------------------------------------------------------
Waypoints_Doubtful_Sound.csv is the single source of truth, maintain this file.
-------------------------------------------------------------------------------

Workflow
--------
1. Modify the Waypoints_Doubtful_Sound.csv

2. Run ruby csv-to-gpx.rb to create a csv trap checklist and gpx files. Open template in a spreadsheet, click on the 'Trap Number' column and sort in ascending order, click on the 'Line' column and sort in ascending order. It should be organised in ascending order and into trap lines. It works in Numbers. Print or export and send out by email.

Remember the csv file is the single source of truth, modify that and everything else just happens.

Map is at: http://umap.openstreetmap.fr/en/map/doubtful-sound-lines_571999
I have to update this manually.

am using this in the scripts
https://pypi.org/project/gpxpy/