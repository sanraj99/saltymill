install_postgis:
  cmd.script:
    - source: salt://osm/install-postgis.sh
  #sysctl.present:
  #  kernal.shmmax

postgresql:
  service.running:
    - enable: True
    - require: [ cmd: install_postgis ]
    - reload: True

{{grains['tm_dir']}}:
  file.directory:
    - group: ubuntu
    - user: ubuntu
    - makedirs: True


{{grains['tm_dir']}}/import.sh:
  file.managed:
    - source: salt://osm/import.sh:

{{grains['tm_dir']}}/process.sh:
  file.managed:
    - source: salt://osm/process.sh:
