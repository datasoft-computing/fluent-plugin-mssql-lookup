Docker image for fluentd-elasticsearch which was used in Kubernetes.

It's used now in the Kokuwa fluentd-elasticsearch Helm chart.

Docker repo: https://quay.io/repository/fluentd_elasticsearch/fluentd

Last version before removal in Kubernetes was: https://github.com/kubernetes/kubernetes/tree/9682b7248fb69733c2a0ee53618856e87b067f16/cluster/addons/fluentd-elasticsearch
The image resides at Quay under the name [quay.io/datasoft-computing/fluentd][image].

This image has been extended to include FreeTDS to support the use of the mssql-lookup plugin.

Based on https://github.com/monotek/fluentd-elasticsearch
