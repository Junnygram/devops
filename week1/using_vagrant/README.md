After installation of vagrant and virtual machine we can create our vagrant file here https://vagrantfile-generator.vercel.app/
read more about vagrant here https://www.vagrantup.com/
when using vagrant and it ask for login, the default
`u.name = vagrant, password = vagrant`
to connect machines remotely, run `ip a` or `ip address show`to get the ip of the server
then run
`ssh u.name@ip` ie `ssh vagrant@ip` to conn ect to the server locally

`vagrant global-status` to view all machine in terminal globally
