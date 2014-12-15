<h2>Vagrant + Ansible + Phalcon</h2>

<h4>My story:</h4>
<p>I have for a long time been using Virtual Box with a Ubuntu machine on, pretty beefy machine that has used a lot of my memory on my machine and i got tired of it was low on memory all the time.<br/>So i sat down and thought my development workflow through and after some search i found my solution</p>

## Index
- [Overview](#overview)
- [Packages Included](#packages-included)
- [**Requirements**](#requirements)
- [**Installation**](#installation)
- [Vagrant Credentials](#vagrant-credentials)
- [Local Editing](#local-editing)
- [Using SSH](#using-ssh)
- [Software Suggestions](#software-suggestions)
- [Thank you](#thank-you)

## Overview
I use the default Ubuntu Trusty 64Bit (14.04) from Vagrant

When you provision Vagrant for the first time it's always the longest procedure (`$ vagrant up`). Vagrant will download the entire Linux OS if you never used Vagrant on the project.
By default i have set this to use 2048MB ram and 2 cores. You can change this in `Vagrantfile` and simply run `$ vagrant reload`.

## Packages Included

- Lamp Stack
  - Ubuntu Trusty 64 Bit (14.04)
  - Apache 2.4
  - PHP 5.6
  - MySQL 5.6
- Git
- [Phalcon](http://phalconphp.com/en/)
- Phpmyadmin (From github, so newest is fetched)
- [Composer](https://getcomposer.org)

## Requirements

- Operating System: Windows, Linux, or OSX.
- [Virtualbox](https://www.virtualbox.org) version 4.3.*
- [Vagrant](http://www.vagrantup.com) version 1.4.*

## Installation
First you need a [Git enabled terminal](#software-suggestions). Then you should **clone this repository** locally.

  `$ git clone https://github.com/zyxep/vagrant-ansible-phalcon.git`

Now you are ready to provision your Virtual Machine, run:

  `$ vagrant up`
  
If you want to change any default settings. Once provisioned, to access the box, simply type:

  `$ vagrant ssh`

  # To exit type:
  
  `$ exit`
  
If you want to add or change stuff to Ansible go to the folder /ansible and to update run:

  `$ vagrant provision`
  
## Local Editing

On your Host computer open any file explorer or IDE and navigate to `your project root`. 
This folder is mounted to the Virtual Machine. Any changes to files within here will reflect
realtime changes in the Virtual Machine.

If you are using .git you should initialize your repository locally rather than on the server.
This way you will not have to import keys into your Virtual Machine.

I would recommend you to update follow settings in `Vagrantfile`

`v.name = "Vagrant"`

`"--name", "Vagrant",`

`config.vm.network "public_network", ip: "192.168.1.47"`

`private_interface: "192.168.1.47",`

`hostname: "Vagrant"`

I use 192.168.1.47 to my machine.
I do not map any webserver to my host but instead adding a host to my host file: C:/Windows/System32/drivers/etc/hosts (or /etc/hosts on OS X, Linux)

## Using SSH

Files in the shared directory of `your project root` are by default given ownership of `www-data:www-data` so
that you will have no problems with saving cached files.

## Software Suggestions

If you are using Linux you can use the built in Terminal to do everything.
The same goes with OSX.

For Windows, you can use [Git SCM](http://git-scm.com/) and Bash, [Sourcetree](http://www.sourcetreeapp.com/)

## Thank You

I want to say thank you to some sites and repos where i got this made from

  - Borrowed some text from [Phalcon-Vagrant](https://github.com/phalcon/vagrant) with some changes.
  - [Phansible](http://phansible.com/) For the base of this repo
  - [Ansible](http://www.ansible.com/) For making a great and easy readable system.
  - [Ansible-Playbooks](https://github.com/loranger/ansible-playbooks) for providing many roles to Ansible.
