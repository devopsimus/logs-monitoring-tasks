#!/bin/bash

#  installing
echo "I'm installing Grafana, Prometheus, Alertmanager stack..."
helm install monitoring prometheus-community/kube-prometheus-stack
echo "Done"

# Port forwarding for ElasticSearch
echo "I'm setting up port forwarding..."
kubectl port-forward deployment/monitoring-grafana 3000
echo "Done"
