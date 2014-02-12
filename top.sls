base:
  'roles:tilemill':
    - match: grains
    - tilemill              # Installs TileMill itself
    - nginx                 # Adds authentication and port sharing (only 80 exposed to the outside world)
    - fonts                 # Grabs useful fonts (just CartoGothic for the momen)
    - waterpolygons         # Grabs OSM waterpolygon shapefile
  'roles:osm':
    - match: grains
    - osm.install_postgis   # Installs PostGIS and OSM2PGSQL, configures for subsequent reloading
    - osm.update_data       # Fetches and imports OSM data