# Collecting Docker Log Files with Fluentd and Elasticsearch
This directory contains the source files needed to make a Docker image
that collects Docker container log files using [Fluentd][fluentd]
and sends them to an instance of [Elasticsearch][elasticsearch].
This image is designed to be used as part of the [Kubernetes][kubernetes]
cluster bring up process. The image resides at Quay under the name
[quay.io/datasoft-computing/fluentd][image].

This image has been extended to include FreeTDS to support the use of the mssql-lookup plugin.

[fluentd]: http://www.fluentd.org/
[elasticsearch]: https://www.elastic.co/products/elasticsearch
[kubernetes]: https://kubernetes.io
[image]: https://quay.io/repository/fluentd_elasticsearch/fluentd?tab=tags
