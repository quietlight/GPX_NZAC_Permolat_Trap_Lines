#!/usr/bin/env python3

import gpxpy
import gpxpy.gpx

# ./parseGpxWaypointsToCsv.py > Waypoints_Homer_Saddle_DOC200s.csv
# ----------------------------------------------------------

gpx_file = open('Waypoints_Homer_Saddle_DOC200s.gpx', 'r')

gpx = gpxpy.parse(gpx_file)
print('name, latitude, longitude, time, symbol')
for waypoint in gpx.waypoints:
    print( waypoint.name+', '+str(waypoint.latitude)+', '+str(waypoint.longitude)+', '+str(waypoint.time)+', '+(waypoint.symbol).replace(', ', ' ') )
 