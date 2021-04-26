#!/usr/bin/env python3

import gpxpy
import gpxpy.gpx

# ./parseTemplate.py > Template_Deep_Cove_Outdoor_Education_Trust_Conservation_Initiative.csv
# ----------------------------------------------------------------------------------

gpx_file = open('Waypoints_Homer_Gertrude_Bowen.gpx', 'r')

gpx = gpxpy.parse(gpx_file)
print('Line, Trap Number, Type, Catch, Comment -------------------')
for waypoint in gpx.waypoints:
    print( waypoint.description+', '+waypoint.name+', '+waypoint.comment+',,')
print(',,TEAM, DATE, Please send to:')
print(',,,, stanleymulvany@gmail.com')
print(',,,, S Mulvany PO Box 6071')
print(',,,, Invercargill 9841')