#!/bin/bash

# ElasticSearch installing
echo "I'm installing ElasticSearch..."
helm repo add elastic https://Helm.elastic.co
curl -O https://raw.githubusercontent.com/elastic/Helm-charts/master/elasticsearch/examples/minikube/values.yaml
helm install --name elasticsearch elastic/elasticsearch -f ./values.yaml
echo "Done"

# Port forwarding for ElasticSearch
echo "I'm setting up port forwarding..."
kubectl port-forward svc/elasticsearch-master 9200
echo "Done"

# Kibana installing
echo "I'm installing Kibana..."
helm install --name kibana elastic/kibana
echo "Done"

# Port forwarding for ElasticSearch
echo "I'm setting up port forwarding..."
kubectl port-forward deployment/kibana-kibana 5601
echo "Done"

# Logstash installing
echo "I'm installing Logstash..."
helm install logstash elastic/logstash
echo "Done"
