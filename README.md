puppet-apt-repo-demo
====================

A simple demo of a custom APT repository set up with puppet, using virtual machines managed by Vagrant. 

Assuming you have vagrant properly setup, run the following commands to start it:

```bash
vagrant up repo;
vagrant up node;
```


After both VMs are up, you should run the following commands on each:

### node


```bash
vagrant ssh node;
vagrant@node:~$ sudo puppet apply -e "include repo::node"
```

### repo

```bash
vagrant ssh repo;
vagrant@repo:~$ sudo puppet apply -e "include repo::server"
```
