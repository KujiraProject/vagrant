Ceph + Calamari server vagrant setup for Centos7

Requirements:
Virtualbox-5
vagrant

1. vagrant up

2. For using behind proxy: Set proxy for yum and env variables.
Plugin might be helpful: vagrant plugin install vagrant-proxyconf

3. It may happen that calamari-ctl initialize will fail.
In this case execute calamari-ctl manually (second time it works  o.o)
user: admin. password: kujira

4. Make snapshot of configured environment.
