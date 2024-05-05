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

Connecting Vagrant to AWS server:
`ssh -i demo.pem ec2-user@ip`
Note: `apt` doesn't work on Ubuntu OS, `yum` works.
