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
    systemctl stop guestfs-firstboot.service
    systemctl disable guestfs-firstboot.service
    apt update && apt -y full-upgrade && apt -y autoremove
    /usr/local/bin/virt-sysprep-firstboot.sh
    ansible-playbook \
      /etc/ansible/playbooks/60-kube_cilium-install.yml \
      /etc/ansible/playbooks/70-kube_csi_hostpath-install.yml \
      /etc/ansible/playbooks/70-kube_csi_hostpath-verify.yml \
      /etc/ansible/playbooks/80-kube_ingress_nginx-install.yml
    kubectl apply -Rf /etc/kubernetes/addons
    echo "sleep 30..." && sleep 30
    until [ $(kubectl get pod --all-namespaces | grep -v Running | grep -v Completed | wc -l) -eq 1 ]; do echo "sleep 10..."; sleep 10; done
SHELL
end
