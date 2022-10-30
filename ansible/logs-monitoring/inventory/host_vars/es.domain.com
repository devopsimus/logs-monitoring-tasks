---
es_api_host: "{{ ansible_default_ipv4.address }}"
es_heap_size: "1g"
es_config:
  network.host: "{{ ansible_default_ipv4.address }}"
  discovery.type: single-node
es_plugins:
  - plugin: analysis-icu
  - plugin: analysis-phonetic
  - plugin: https://github.com/opendatasoft/elasticsearch-aggregation-geoclustering/releases/download/v7.7.0.0/geopoint-clustering-aggregation-7.7.0.0.zip