Vagrant.configure("2") do |config|
  config.vm.hostname = "kubernetes-1.30"
  config.vm.box = "alvistack/kubernetes-1.30"
  config.vm.box_check_update = true

  config.vm.provider :virtualbox do |virtualbox, override|
    virtualbox.cpus = 2
    virtualbox.memory = 8192
    virtualbox.customize ["modifyvm", :id, "--cpu-profile", "host"]
    virtualbox.customize ["modifyvm", :id, "--nested-hw-virt", "on"]

    override.vm.disk :disk, name: "sdb", size: "10GB"
    override.vm.synced_folder "./", "/vagrant"
  end

  config.vm.provider :libvirt do |libvirt, override|
    libvirt.cpu_mode = "host-passthrough"
    libvirt.cpus = 2
    libvirt.disk_bus = "virtio"
    libvirt.disk_driver :cache => "writeback"
    libvirt.driver = "kvm"
    libvirt.memory = 8192
    libvirt.memorybacking :access, :mode => "shared"
    libvirt.nested = true
    libvirt.nic_model_type = "virtio"
    libvirt.video_type = "virtio"

    libvirt.storage :file, bus: "virtio", cache: "writeback"
    override.vm.synced_folder "./", "/vagrant", type: "virtiofs"
  end

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provision :shell, inline: <<-SHELL
    set -ex

    # Stop the auto provisioning
    systemctl stop guestfs-firstboot.service
    systemctl disable guestfs-firstboot.service

    # Manually provision Kubernetes
    apt update && apt -y full-upgrade && apt -y autoremove
    apt -y install helm
    /usr/local/bin/virt-sysprep-firstboot.sh

    # Create custom namespaces
    kubectl apply -Rf /vagrant/namespaces

    # Install Cilium with Helm
    apt -y install cilium-cli
    helm repo add cilium https://helm.cilium.io
    helm upgrade --install cilium cilium/cilium --values /vagrant/helm/cilium/values.yml --namespace kube-system
    until [ $(kubectl get pod --all-namespaces | grep -v Running | grep -v Completed | wc -l) -eq 1 ]; do sleep 10; done

    # Install Ingress NGINX Controller
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --values /vagrant/helm/ingress-nginx/values.yml --namespace ingress-nginx
    until [ $(kubectl get pod --all-namespaces | grep -v Running | grep -v Completed | wc -l) -eq 1 ]; do sleep 10; done

    # Install Prometheus
    helm repo add prometheus https://prometheus-community.github.io/helm-charts
    helm upgrade --install prometheus prometheus/kube-prometheus-stack --values /vagrant/helm/prometheus/values.yml --namespace prometheus
    until [ $(kubectl get pod --all-namespaces | grep -v Running | grep -v Completed | wc -l) -eq 1 ]; do sleep 10; done

    # Install Grafana
    helm repo add grafana https://grafana.github.io/helm-charts
    helm upgrade --install grafana grafana/grafana --values /vagrant/helm/grafana/values.yml --namespace grafana
    until [ $(kubectl get pod --all-namespaces | grep -v Running | grep -v Completed | wc -l) -eq 1 ]; do sleep 10; done

    # Install Loki
    helm repo add grafana https://grafana.github.io/helm-charts
    helm upgrade --install loki grafana/loki-distributed --values /vagrant/helm/loki/values.yml --namespace loki
    until [ $(kubectl get pod --all-namespaces | grep -v Running | grep -v Completed | wc -l) -eq 1 ]; do sleep 10; done

    # Verify Result
    kubectl get node
    kubectl get pod --all-namespaces
SHELL
end
