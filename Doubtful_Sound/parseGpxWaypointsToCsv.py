#!/usr/bin/env python3

import gpxpy
import gpxpy.gpx

# ./parseGpxWaypointsToCsv.py > Waypoints_Doubtful_Sound.csv
# ----------------------------------------------------------

gpx_file = open('Waypoints_Doubtful_Sound.gpx', 'r')

gpx = gpxpy.parse(gpx_file)
print('name, latitude, longitude, time, comment, symbol, description')
for waypoint in gpx.waypoints:
    print( waypoint.name+', '+str(waypoint.latitude)+', '+str(waypoint.longitude)+', '+str(waypoint.time)+', '+(waypoint.comment).replace(', ', ' ')+', '+(waypoint.symbol).replace(', ', ' ')+', '+(waypoint.description).replace(', ', ' ') )
 