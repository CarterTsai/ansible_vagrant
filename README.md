### Vagrant and Ansible Tutorial

Reference:   
1. https://adamcod.es/2014/09/23/vagrant-ansible-quickstart-tutorial.html  
2. http://www.vagrantbox.es/  
3. http://www.slideshare.net/williamyeh/ansible-top-down
4. https://www.nginx.com/resources/admin-guide/load-balancer/
5. http://www.virtualbox.org/manual/ch06.html
6. http://www.virtualbox.org/manual/ch06.html#network_internal
7. http://docs.ansible.com/ansible/file_module.html

### Architecture
```
+-----------------------------+
|      +---- web01 ----+      |
| lb --|               |-- db |
|      +---- web02 ----+      |
+-----------------------------+
```
* lb    (10.0.2.15)
* web01 (10.0.2.16)
* web02 (10.0.2.17)
* db    (10.0.2.18)

### Run Vagrant
This step is create vm for lb, web01, web02, db with Vagrantfile
* fish shell
```
$> vagrant destroy -f; and vagrant up
```
* bash shell
```
$> vagrant destroy -f && vagrant up
```

### Check service is working
```
$> curl 192.168.1.200
```

### Run only playbook to update vm
```
$> ansible-playbook \
    --verbose \
    --become \
    --user=vagrant \
    -i ./hosts playbook.yml
```

### Check All Environment output port
```
$> vagrant port lb
$> vagrant port web01
$> vagrant port web02
$> vagrant port db
```

### Ping all your nodes
 Reference : [intro_getting_started][1]
```
$> ansible all -m ping
```
or
```
$> ansible all -m ping -u vagrant
```
or
```
$> ansible all -m ping -u vagrant --sudo
```

[1]: http://docs.ansible.com/ansible/intro_getting_started.html
