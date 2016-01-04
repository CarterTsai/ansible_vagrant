# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = {
    "lb"    => {"ip" => "10.0.2.15", "ssh_port" => "2232"},
    "web01" => {"ip" => "10.0.2.16", "ssh_port" => "2234"},
    "web02" => {"ip" => "10.0.2.17", "ssh_port" => "2256"},
    "db"    => {"ip" => "10.0.2.18", "ssh_port" => "2278"}
}

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    # Use the same key for each machine
    config.ssh.insert_key = false
    config.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"
    # lb
    config.vm.define "lb" do |lb|
      lb.vm.box = "debian/wheezy64"
      lb.vm.hostname = "%s" % "lb"
      lb.vm.network :forwarded_port, guest: 80, host: 8880
      lb.vm.network :forwarded_port, guest: 22, host: hosts["lb"]["ssh_port"]

      # Create internal network
      lb.vm.network "private_network", ip: hosts["lb"]["ip"], virtualbox__intnet: "hello"
      lb.vm.network "private_network", ip: hosts["web01"]["ip"], virtualbox__intnet: "hello"
      lb.vm.network "private_network", ip: hosts["web02"]["ip"], virtualbox__intnet: "hello"

      lb.ssh.forward_agent = true
      lb.vm.provision :ansible do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "playbook.yml"
        ansible.sudo = true
        ansible.inventory_path = 'hosts'
        ansible.host_key_checking = false
        end
    end

    # web01
    config.vm.define "web01" do |web01|
      web01.vm.box = "debian/wheezy64"
      web01.vm.hostname = "%s" % "web01"
      web01.vm.network :forwarded_port, guest: 80, host: 8881
      web01.vm.network :forwarded_port, guest: 22, host: hosts["web01"]["ssh_port"]

      # Create internal network
      web01.vm.network "private_network", ip: hosts["web01"]["ip"], virtualbox__intnet: "hello"

      web01.ssh.forward_agent = true
      web01.vm.provision :ansible do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "playbook.yml"
        ansible.sudo = true
        ansible.inventory_path = 'hosts'
        ansible.host_key_checking = false
        end
    end

    # web02
    config.vm.define "web02" do |web02|
      web02.vm.box = "debian/wheezy64"
      web02.vm.hostname = "%s" % "web02"
      web02.vm.network :forwarded_port, guest: 80, host: 8882
      web02.vm.network :forwarded_port, guest: 22, host: hosts["web02"]["ssh_port"]

      # Create internal network
      web02.vm.network "private_network", ip: hosts["web02"]["ip"], virtualbox__intnet: "hello"
      web02.ssh.forward_agent = true

      web02.vm.provision :ansible do |ansible|
        ansible.verbose = "v"
        ansible.playbook = "playbook.yml"
        ansible.sudo = true
        ansible.inventory_path = 'hosts'
        ansible.host_key_checking = false
        end
    end

    # DB
    # config.vm.define "db" do |db|
    #   db.vm.box = "debian/wheezy64"
    #   db.vm.hostname = "%s" % "db"
    #   db.vm.network :forwarded_port, guest: 22, host: hosts["db"]["ssh_port"]
    #
    #   # Create internal network
    #   db.vm.network "private_network", ip: hosts["web01"]["ip"], virtualbox__intnet: "hello"
    #   db.vm.network "private_network", ip: hosts["web02"]["ip"], virtualbox__intnet: "hello"
    #   db.vm.network "private_network", ip: hosts["db"]["ip"], virtualbox__intnet: "hello"
    #   db.ssh.forward_agent = true
    #
    #   db.vm.provision :ansible do |ansible|
    #     ansible.verbose = "v"
    #     ansible.playbook = "playbook.yml"
    #     ansible.sudo = true
    #     ansible.inventory_path = 'hosts'
    #     ansible.host_key_checking = false
    #     end
    # end
end
