puppet-apt-repo-demo
====================

A simple demo of a custom APT repository set up with puppet, using virtual machines managed by Vagrant.


Starting up the repository server
---

Execute the following command from the project directory:

```bash
vagrant up repo;
vagrant ssh repo;
```

This will startup a new vm that will act as a server for our packages repository. Although initially it won't have any packages installed, a sample one is supplied: 'myapp.1.0_all.deb'; in order to install it, run the following command:

```bash
/home/vagrant/add_package.sh
```
This will include the sample package in the repository.

Starting up the client
---

Run the following command:

```bash
vagrant up node;
vagrant ssh node;
```

After connecting to the node vm, you can run the following command in order to install the sample package:

```bash
sudo apt-get install myapp;
```


Adding or updating new packages
---

A great tool to create new packages is Jordan Sissel's [fpm](https://github.com/jordansissel/fpm) .

In our example, we'd like to create a simple new package based on a directory called */opt/myapp* , which has a simple textfile as its contents.

```bash
[ hien@rebellion opt ] ls -lh /opt/myapp
total 8
-rw-r--r--  1 hien  wheel    22B Oct 20 19:11 README.md

[ hien@rebellion opt ] cat /opt/myapp/README.md 
Just some custom app.

[ hien@rebellion opt ] 
```
To create the actual package we can execute the following command:

```bash
    fpm -s dir -t deb --prefix /opt/ -n myapp -a all -v 1.0 myapp/
```

This will create a package file called *myapp_1.0_all.deb*. We now need to push it to our repo vm. A quick-simple hack is just copying it to the project's *modules/repo/files* directory, since it's symlinked inside the vm. After that, connect to the vm:


```bash
vagrant ssh repo;
./add_package.sh /vagrant/modules/repo/files/myapp_1.0_all.deb;
```







