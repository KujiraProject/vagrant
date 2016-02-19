Ceph + Calamari server vagrant setup for Centos7

Requirements:
Virtualbox-5
vagrant
Virtual box extension pack
http://download.virtualbox.org/virtualbox/5.0.14/Oracle_VM_VirtualBox_Extension_Pack-5.0.14-105127.vbox-extpack

Setup: vagrant up

On fail: execute vagrant destroy to reset environment.

Notes:
- For using behind proxy: Set proxy for yum and env variables.
Plugin might be helpful: vagrant plugin install vagrant-proxyconf

- It may happen that calamari-ctl initialize will fail.
In this case execute calamari-ctl manually (second time it works  o.o)
user: admin. password: kujira

- Make snapshot of configured environment.
