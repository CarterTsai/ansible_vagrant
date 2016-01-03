### Vagrant and Ansible Tutorial

Reference:   
1. https://adamcod.es/2014/09/23/vagrant-ansible-quickstart-tutorial.html  
2. http://www.vagrantbox.es/  


### Run Vagrant
```
$> vagrant destroy -f; and vagrant up
```

### Run only playbook
```
$> ansible-playbook -i ./hosts playbook.yml
```

### Check All Environment output port
```
$> vagrant port lb
$> vagrant port web01
$> vagrant port web02
$> vagrant port db
```
