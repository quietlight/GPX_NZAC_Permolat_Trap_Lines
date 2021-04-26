#!/usr/bin/env python3

import gpxpy
import gpxpy.gpx

# ./parseGpxWaypointsToCsv.py > Waypoints_Homer_Gertrude_Bowen.csv
# ----------------------------------------------------------

gpx_file = open('Waypoints_Homer_Gertrude_Bowen.gpx', 'r')

gpx = gpxpy.parse(gpx_file)
print('name, latitude, longitude, elevation, time, symbol')
for waypoint in gpx.waypoints:
    print( waypoint.name+', '+str(waypoint.latitude)+', '+str(waypoint.longitude)+', '+str(waypoint.elevation)+', '+str(waypoint.time)+', '+(waypoint.symbol).replace(', ', ' ') )
 