# -*- mode: ruby -*-
# vi: set ft=ruby :

hosts = {
    "lb"    => {"ip" => "192.168.1.200", "ssh_port" => "2", "bridge" => "en0: Wi-Fi (AirPort)"},
    "web01" => {"ip" => "192.168.1.201", "ssh_port" => "2", "bridge" => "en0: Wi-Fi (AirPort)"},
    "web02" => {"ip" => "192.168.1.202", "ssh_port" => "2", "bridge" => "en0: Wi-Fi (AirPort)"},
    "db"    => {"ip" => "192.168.1.203", "ssh_port" => "2", "bridge" => "en0: Wi-Fi (AirPort)"}
}

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    # Use the same key for each machine
    config.ssh.insert_key = false
    #config.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"
    # lb
    config.vm.define "lb" do |lb|
      lb.vm.box = "debian/wheezy64"
      lb.vm.hostname = "%s" % "lb"
      #lb.vm.network :forwarded_port, guest: 80, host: 8880
      #lb.vm.network :forwarded_port, guest: 22, host: hosts["lb"]["ssh_port"]

      # Create network
      lb.vm.network "public_network", ip: hosts["lb"]["ip"] ,bridge: hosts["lb"]["bridge"]
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
    #   web01.vm.network :forwarded_port, guest: 80, host: 8881
    #   web01.vm.network :forwarded_port, guest: 22, host: hosts["web01"]["ssh_port"]
      # Create network
      web01.vm.network "public_network", ip: hosts["web01"]["ip"] ,bridge: hosts["web01"]["bridge"]
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
    #   web02.vm.network :forwarded_port, guest: 80, host: 8882
    #   web02.vm.network :forwarded_port, guest: 22, host: hosts["web02"]["ssh_port"]
      # Create internal network
      web02.vm.network "public_network", ip: hosts["web02"]["ip"] ,bridge: hosts["web02"]["bridge"]
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
    #   db.vm.network "public_network", ip: hosts["db"]["ip"] ,bridge: hosts["db"]["bridge"]
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
