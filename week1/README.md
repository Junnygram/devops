Vagrant is a tool that is primarily used for creating and managing VMs and development environments. While Vagrant itself may not be directly focused on automation testing, it can be a valuable tool for automation testers in a few ways:

1. Reproducible Environments: Vagrant allows you to define and share development environments as code, using configuration files known as "Vagrantfiles." This means you can easily create and provision identical development environments for your automation tests. It ensures consistency across different testing environments, reducing the chances of environment-related issues impacting your test results.

2. Collaboration: With Vagrant, you can share the Vagrantfiles with your team members, ensuring everyone is using the same development environment. This helps in collaborative test automation, as team members can work on the same environment setup and easily share their test scripts, configurations, and dependencies.

3. Sandbox Testing: Vagrant makes it easy to create isolated and disposable environments for testing. You can quickly spin up a virtual machine with specific configurations, install required dependencies, and execute your automated tests. After testing, you can discard the environment, ensuring a clean and controlled testing environment for each run.

4. Test Environment Setup: Automation testers often need to set up complex test environments with specific configurations, databases, servers, or services. Vagrant simplifies this process by automating the setup and provisioning of the required resources. It allows you to define the exact environment you need for your tests and reproduce it easily across different machines.

5. Continuous Integration (CI) and Continuous Deployment (CD): Vagrant integrates well with popular CI/CD tools like Jenkins, allowing you to automate the creation and deployment of test environments as part of your CI/CD pipeline. This ensures consistent and controlled test environments for your automated tests in a repeatable manner.

In summary, while Vagrant itself may not be an automation testing tool, it provides automation testers with the ability to create, manage, and share consistent and reproducible test environments. It simplifies the setup, provisioning, and collaboration aspects of test automation, enabling testers to focus more on writing and executing automated tests effectively

vagrant -v get the vagrant version

vagrant global-status outputs status of all vagrant machines

vagrant global-status --prune same as above, but prunes invalid entries

--help use with any vagrant command to see help options e.g vagrant box --help

# some commands

vagrant status
vagrant global-status
vagrant ssh-config
vagrant up
vagrant init
vagrant validate
vagrant reload
vagrant suspend
vagrant halt
vagrant destroy
vagrant box
bagrant plugin install

Install or Setup a Provider (Virtualbox)

vboxmanage -v get the version of virtualbox

Creating Vagrantfile (vagrant env)

Create a new folder and go to the folder location from Command Prompt/Terminal

vagrant init Initializes a new Vagrant project with a Vagrantfile

vagrant init ＜ boxpath ＞ Initialize Vagrant with a specific box vagrant init hashicorp/bionic64

vagrant validate validates vagrantfile

vagrant status outputs status of the vagrant machine

Starting and Stopping VM

vagrant up starts vagrant environment (also provisions only on the FIRST vagrant up)

vagrant halt stops the vagrant machine

vagrant suspend suspends a virtual machine (remembers state)

vagrant resume resume a suspended machine (vagrant up works just fine for this as well)

vagrant provision forces reprovisioning of the vagrant machine

vagrant reload restarts vagrant machine, loads new Vagrantfile configuration

vagrant reload --provision restart the virtual machine and force provisioning

vagrant status outputs status of the vagrant machine

Getting into a VM

vagrant ssh connects to machine via SSH

vagrant ssh ＜ boxname ＞ If you give your box a name in your Vagrantfile, you can ssh into it with boxname

Cleaning up a VM

vagrant destroy stops and deletes all traces of the vagrant machine

vagrant destroy -f same as above, without confirmation

Boxes

vagrant box list see a list of all installed boxes on your computer

vagrant box add ＜ name ＞ ＜ url ＞ download a box image to your computer

vagrant box outdated check for updates vagrant box update

vagrant box remove ＜ name ＞ deletes a box from the machine
vagrant package packages a running virtualbox env in a reusable box vagrant package --output mybox.box

Provisioning Commands

Vagrantfile ＞ add block ＞ config.vm.provision

config.vm.provision "shell",
inline: "echo Hello, World"

config.vm.provision "shell", inline: ＜＜-SHELL
sudo apt-get update
sudo apt-get install apache2 -y
SHELL

OR

Create a separate file having Provision Scripts and provide the location in Vagrantfile

config.vm.provision :shell, path: "provision.sh"

vagrant provision if VM is already running, runs the provisioners defined in your Vagrantfile

vagrant reload --provision reloads the Vagrantfile and runs the provisioners

Networking

Add in Vagrantfile

Port Forwarding
config.vm.network "forwarded_port", guest: 80, host: 8080
maps port 80 of the VM to port 8080 on the host machine

config.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
config.vm.usable_port_range = (8000..9000)

Creating Public Network

config.vm.network "public_network", ip: "192.168.1.100"
if IP address is not given, a default IP will be assigned

Creating Private Network

config.vm.network "private_network", ip: "192.168.50.4"
This will create a private network with the IP address of 192.168.50.4

Sharing Folder

By default ./ on your computer is shared as /vagrant on the VM

Edit Vagrantfile

config.vm.synced_folder "./data", "/vagrant_data"

shares the folder data present on the vagrantfile folder to a folder called vagrant_data on the VM

Snapshot Commands

What is a Snapshot

- Full copy of the VM in its Current state

vagrant snapshot save ＜ name ＞ creates a snapshot from the current state of the machine

vagrant snapshot list lists all snapshots of the current machine

vagrant snapshot restore ＜ name ＞ restores machine from the specific snapshot

vagrant snapshot delete ＜ name ＞ deletes the snapshot

Note: Snapshots do not include the Vagrantfile or any other configuration files in your project directory

Plugin Commands

Plugins are add-ons to enhance functionality of a tool

vagrant plugin install ＜ plugin-name ＞ installs the specified Vagrant plugin

vagrant plugin list lists all installed Vagrant plugins

vagrant plugin update ＜ plugin-name ＞ to update a plugin

vagrant plugin repair to repair installed plugins in case of error

vagrant plugin uninstall ＜ plugin-name ＞ uninstalls the specified Vagrant plugin

vagrant plugin expunge to delete all plugins

vagrant plugin expunge --reinstall to reinstall all expunged plugins

Download and Install from - https://www.virtualbox.org/wiki/Downl...

Vagrantfile Box Search https://app.vagrantup.com/boxes/search

Vagrantfile Generator https://vagrantfile-generator.vercel....

Available Plugins : https://github.com/hashicorp/vagrant/...
