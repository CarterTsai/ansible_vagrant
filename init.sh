#!/bin/bash


vagrant box add centos/7 https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box

vagrant box add debian/wheezy64 http://f.willianfernandes.com.br/vagrant-boxes/DebianSqueeze64.box

vagrant box add ubunut/14.04 https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box

vargrant up
