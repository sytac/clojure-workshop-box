# Clojure workshop base box

This [Packer](https://packer.io) template builds a VirtualBox image based on Ubuntu 14.04 LTS.
This box can be used to perform the exercises as part of the Sytac Clojure training.

## Features

The following goodies are provided:

* Oracle JDK 7
* Eclipse Luna
* CounterClockWise
* Leiningen
* Docker LXC

The default `vagrant` user is already configured to run Docker without doing `sudo`.

## Download the box

You can directly download the pre-built box:

```
$ wget https://github.com/sytac/clojure-workshop-box/archive/clojure-workshop.box
```

## Build from the sources
1. Be sure you have Packer and [VirtualBox](https://www.virtualbox.org/)
installed in your system.
2. Clone this repository and go into it.
    * `git clone git@github.com:sytac/clojure-workshop-box.git`
    * `cd clojure-workshop-box`
3. Run Packer to build the VM.
    * `packer build clojure-workshop-box.json`

A VM box file should be created in the working directory under the name
`clojure-workshop.box`.

### Running the built VM
You can now use [Vagrant](https://www.vagrantup.com/) to run it by creating a
`Vagrantfile` with this content:

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "clojure-workshop"
  config.vm.box_url = "file://clojure-workshop.box"
  config.vm.provider "virtualbox" do |v|
    v.gui = true
  end
end
```

And leverage and access the VM as usual with Vagrant:
    `vagrant up`
    `vagrant ssh`
