# Introduction

## About Me

- Wong Hoi Sing, Edison (hswong3i)
- 2005: [Drupal Developer & Contributor](https://drupal.org/user/33940)
- 2008: [HKDUG, Founder](https://groups.drupal.org/drupalhk)
- 2010: [PantaRei Design, Founder](https://pantarei-design.com)
- 2020: [HKOSCON 2020, Speaker](https://hkoscon.org/2020/topics/ansible-vm-kubernetes)
- 2021: [AlviStack, Founder](https://landscape.cncf.io/?group=certified-partners-and-providers&item=platform--certified-kubernetes-installer--alvistack-vagrant-box-packaging-for-kubernetes)
- 2022: [HKOSCON 2022, Speaker](https://2022.hkoscon.org/edisonwong)
- 2024: [Most Active GitHub user in Hong Kong](https://github.com/gayanvoice/top-github-users/blob/main/markdown/total_contributions/hong_kong.md)

------------------------------------------------------------------------

![](files/hswong3i.jpg)

------------------------------------------------------------------------

![](files/5334654265_c16444a8b0_o.jpg)

------------------------------------------------------------------------

![](files/hkoscon.org-2020-topics-ansible-vm-kubernetes.png)

------------------------------------------------------------------------

![](files/landscape.cncf.io-alvistack.png)

------------------------------------------------------------------------

![](files/2022.hkoscon.org-edisonwong.png)

------------------------------------------------------------------------

![](files/github.com-gayanvoice-top-github-users.png)

## Contact Me

- Address: Unit 326, 3/F, Building 16W, No.16 Science Park West Avenue, Hong Kong Science Park, Shatin, N.T.
- Phone: +852 3576 3812
- Fax: +852 3753 3663
- Email: <sales@pantarei-design.com>
- Web: <http://pantarei-design.com>

## References

- [Getting started with managing your metrics, logs, and traces using Grafana](https://grafana.com/go/webinar/getting-started-with-grafana-lgtm-stack/)
- Official webinar from Grafana Labs
- For beginner with simple show case
- Around 60 mintues

------------------------------------------------------------------------

![](files/grafana.com-go-webinar-getting-started-with-grafana-lgtm-stack.png)

------------------------------------------------------------------------

- [Introduction to Metrics, Logs, Traces and Profiles in Grafana](https://github.com/grafana/intro-to-mltp)
- Official complete demo for Grafana LGTM stack
- For advance user with Docker + Docker Compose experience
- Around 2 hours

------------------------------------------------------------------------

![](files/github.com-grafana-intro-to-mltp.png)

------------------------------------------------------------------------

- [可觀測性宇宙的第一天 - Grafana LGTM 全家桶的起點](https://ithelp.ithome.com.tw/articles/10319012)
- Detail explanation for Grafana LGTM + Kubernetes
- For advance user with daily Kubernetes experience
- AT LEAST 6 HOURS (reading doc only...)

------------------------------------------------------------------------

![](files/ithelp.ithome.com.tw-articles-10319012.png)

------------------------------------------------------------------------

- [AlviStack Vagrant Box Packaging for Kubernetes](https://github.com/alvistack/vagrant-kubernetes)
- CNCF Certified Kubernetes on Virtual Box or Libvrt
- Simply `vagrant up` and ready for use
- May customize for Dev/CI/CD
- Around 10 minutes

------------------------------------------------------------------------

![](files/app.vagrantup.com-alvistack-boxes-kubernetes-1.30.png)

# What is Grafana LGTM Stack?

## Prometheus + LGTM Stack + Pyroscope

- Monitoring: Collects and stores metrics as time series data
- Logs: What is happening?
- Metrics: Is something happening?
- Traces: Where is it happening?
- Profiles: How do I fix it?
- Dashboard: Data visualization and monitoring

------------------------------------------------------------------------

![](files/four-pillars-observe.png.png)

## Prometheus

- [Prometheus](https://prometheus.io/) is a systems monitoring and alerting toolkit
- Multi-dimensional data model
- PromQL, a flexible query language to leverage this dimensionality
- 2nd CNCF graduated project after Kubernetes
- Apache License 2.0

------------------------------------------------------------------------

![](files/prometheus.io.png)

------------------------------------------------------------------------

- [Prometheus Operator](https://github.com/prometheus-operator/prometheus-operator) deploy with Kubernetes CRDs
- [kube-prometheus](https://github.com/prometheus-operator/kube-prometheus) provides example configurations for a complete cluster monitoring stack
- Here we are going to demo with [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) with Helm chart style

------------------------------------------------------------------------

![](files/github.com-prometheus-community-helm-charts-tree-main-charts-kube-prometheus-stack.png)

## Grafana

- [Grafana](https://grafana.com/oss/grafana/) is a multi-platform open source analytics and interactive visualization web application
- It can produce charts, graphs, and alerts for the web when connected to supported data sources
- AGPLv3

------------------------------------------------------------------------

![](files/grafana.com-oss-grafana.png)

------------------------------------------------------------------------

- Support multiple installation style, e.g. monolithic, microservice, or even manually
- Here we are going to demo with [distributed Helm chart style](https://grafana.com/docs/grafana/latest/setup-grafana/installation/helm/)

------------------------------------------------------------------------

![](files/grafana.com-docs-grafana-latest-setup-grafana-installation-helm.png)

## Loki

- [Loki](https://grafana.com/oss/loki) is a backend store for long-term log retention
- Designed to be very cost effective and highly scalable
- AGPLv3

------------------------------------------------------------------------

![](files/grafana.com-oss-loki.png)

------------------------------------------------------------------------

- Suport multiple installation style, e.g. monolithic, microservice, or even manually
- Here we are going to demo with [distributed Helm chart style](https://grafana.com/docs/loki/latest/setup/install/helm/install-microservices/)

------------------------------------------------------------------------

![](files/grafana.com-docs-loki-latest-setup-install-helm-install-microservices.png)

## Tempo

- [Tempo](https://grafana.com/oss/tempo) is a distributed tracing backend
- Designed to be cost-efficient, requiring only object storage to operate
- Deeply integrated with Grafana, Prometheus, and Loki
- AGPLv3

------------------------------------------------------------------------

![](files/grafana.com-oss-tempo.png)

------------------------------------------------------------------------

- Suport multiple installation style, e.g. monolithic, microservice, or even manually
- Here we are going to demo with [distributed Helm chart style](https://grafana.com/docs/tempo/latest/setup/helm-chart)

------------------------------------------------------------------------

![](files/grafana.com-docs-tempo-latest-setup-helm-chart.png)

------------------------------------------------------------------------

## Mimir

- [Mimir](https://grafana.com/oss/mimir) is a TSDB for long-term storage for Prometheus
- Designed to be horizontally scalable, highly available, multi-tenant
- 100% Prometheus compatible
- AGPLv3

------------------------------------------------------------------------

![](files/grafana.com-oss-mimir.png)

------------------------------------------------------------------------

- Suport multiple installation style, e.g. monolithic, microservice, or even manually
- Here we are going to demo with [distributed Helm chart style](https://grafana.com/docs/mimir/latest/set-up/helm-chart)

------------------------------------------------------------------------

![](files/grafana.com-docs-mimir-latest-set-up-helm-chart.png)

## Pyroscope

- [Pyroscope](https://grafana.com/oss/pyroscope) is a continuous profiling database
- Designed to be fast, scalable, highly available, and efficient storage and querying
- AGPLv3

------------------------------------------------------------------------

![](files/grafana.com-oss-pyroscope.png)

------------------------------------------------------------------------

- Suport multiple installation style, e.g. monolithic, microservice, or even manually
- Here we are going to demo with [distributed Helm chart style](https://grafana.com/docs/pyroscope/latest/deploy-kubernetes/helm)

------------------------------------------------------------------------

![](files/grafana.com-docs-pyroscope-latest-deploy-kubernetes-helm.png)

# Demo with AlviStack Vagrant Box

## Install VirtualBox

## Install Vagrant

## Prepare Vagrantfile

## `vagrant up`

## `vagrant ssh`

## http://localhost:8080/

# Create a Grafana Dashboard

# Connect with Data Sources

# Q&A
