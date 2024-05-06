Here's the corrected version:

Deploying a file from a GitHub link and moving the cursor to the front:

Certainly! Let's break down each command:

1. `sudo apt install nginx -y`
2. `wget repoUrlLink` - this will download the repo zip file.
3. `ls` to see the file name, then `unzip fileName` to unzip the file.
   Optional: `ls` to confirm; this will return the index.nginx-debian.html and newRepoFile in the folder.
4. `cd /var/www/html`
5. `cp -r newRepoFile /var/www/html`
   Optional: `ls` to confirm; this will return index.nginx-debian.html and newRepoFile in the folder.
6. When we go to the listening port, we will see our nginx started code displayed on our browser. Then when we put `/newRepoFile`, we will see the newRepoFile in our browser.
7. To remove the `/newRepoFile` in the URL, we run `cp -r newRepoFile/*`. This will copy everything inside the newRepoFile to the present working directory, which is `/var/www/html`.
   Optional: `cd /etc/nginx/sites-enabled/`. This will show us why it checked for index first, then index.html, then index.htm, then index.nginx-debian.html.
8. `cd sites-enabled/`
9. `nano default` to edit the port to listen on a new port, from 80 to 8081, then `ctrl x`, `y`, `enter` to save.
10. `nginx -t` to check configuration if it's okay.
11. `ss -tulpn | grep nginx` filter the socket statistics and give me nginx or netstat pantu | grep nginx.
12.
13. `curl localhost:8081`: this will return fail.
14. We need to reload `nginx -s reload` or `systemctl reload nginx`.
15. `curl localhost:8081`: this will work.
16. On the browser:
    **Traffic/Ports**: go to the traffic port and add custom access to port 8081, now this will show on the browser.
17. Default file without comment:

    ```
    server {
        listen 9000;
        root /var/www/site;
        server_name _;
    }
    ```

    Having two server blocks:

    ```
    server {
        listen 9000;
        root /var/www/site1;
        server_name _;
    }

    server {
        listen 9000;
        root /var/www/site2;
        server_name _;
    }
    ```

18. `curl localhost:9000` - this will return forbidden.
19. `echo "nginx is awesome" > /var/www/site1/index.html`
    Optional: `> data.bak` - this will clear all the file in data.bak.
20. `curl localhost:9000` - this will return "nginx is awesome".

Note:
On Linux-based systems, Apache and Nginx can usually be installed using package managers like `apt`, `yum`, or `dnf`. depends on the OS .

# Ubuntu (using apt)

```
sudo apt update
sudo apt install apache2   # For Apache
sudo apt install nginx     # For Nginx
```

# CentOS (using yum)

```
sudo yum update
sudo yum install httpd     # For Apache
sudo yum install nginx     # For Nginx
```

Certainly! Here's a revised version with some improvements in clarity, formatting, and correctness:

```bash
# Commands for setting up servers and a load balancer

## For server-1
cd <key_location_on_local_directory>
# Connecting vagrant to AWS server
ssh -i key.pem ec2-user@<server1_public_ip>
sudo hostnamectl set-hostname server-1
bash
sudo apt update -y

## For server-2
cd <key_location_on_local_directory>
# Connecting to AWS server
ssh -i key.pem ec2-user@<server2_public_ip>
sudo hostnamectl set-hostname server-2
bash
sudo apt update -y
# Configuring server-2 for load balancing
sudo echo "server-2" > /var/www/html/index.html
# If permission denied, change ownership or switch to the root user
sudo chown -R ubuntu:ubuntu /var/www/html
# Edit index.html with server-2 content
nano /var/www/html/index.html  # Edit and save changes

## For load balancer
cd <key_location_on_local_directory>
# Connecting to AWS server
ssh -i key.pem ec2-user@<load_balancer_public_ip>
sudo hostnamectl set-hostname loadbalancer
bash
sudo apt update -y
cd /etc/nginx/conf.d
sudo nano balancer.conf  # Edit the file with the following content:

# balancer.conf
upstream balancer {
  server <server1_public_ip>;
  server <server2_public_ip>;
}

server {
  location / {
    proxy_pass http://balancer;
  }
}

# Check NGINX configuration
sudo nginx -t
# Reload NGINX
sudo nginx -s reload
# Check NGINX status
sudo systemctl status nginx
# Start NGINX if not already running (some distros may require this step)
sudo systemctl start nginx
# Ensure NGINX starts on boot
sudo systemctl enable nginx

# Ensure security groups are properly configured if required
```
