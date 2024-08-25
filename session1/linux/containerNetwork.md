How Container Networking Works: a Docker Bridge Network From Scratch

### Step 1: Create a Network Namespace

1. **Create a network namespace named `netns0`:**

    ```bash
    ip netns add netns0
    ```

2. **Verify the creation of the namespace:**

    ```bash
    ip netns list
    ```

    You should see `netns0` listed.

### Step 2: Create and Connect Virtual Ethernet Devices (veth)

1. **Create a pair of virtual Ethernet devices (`veth0` and `ceth0`):**

    ```bash
    ip link add veth0 type veth peer name ceth0
    ```

2. **Move `ceth0` to the `netns0` namespace:**

    ```bash
    ip link set ceth0 netns netns0
    ```

3. **Activate the `veth0` device:**

    ```bash
    ip link set veth0 up
    ```

4. **Assign an IP address to `veth0`:**

    ```bash
    ip addr add 172.18.0.11/16 dev veth0
    ```

### Step 3: Set Up the Network Namespace (`netns0`)

1. **Enter the `netns0` namespace:**

    ```bash
    nsenter --net=/run/netns/netns0 bash
    ```

2. **Activate the loopback device:**

    ```bash
    ip link set lo up
    ```

3. **Activate `ceth0` and assign it an IP address:**

    ```bash
    ip link set ceth0 up
    ip addr add 172.18.0.10/16 dev ceth0
    ```

4. **Test connectivity by pinging `veth0` from `netns0`:**

    ```bash
    ping -c 2 172.18.0.11
    ```

    You should see successful ping results.

### Step 4: Create a Second Network Namespace and Repeat the Process

1. **Create a second network namespace named `netns1`:**

    ```bash
    ip netns add netns1
    ```

2. **Create another pair of virtual Ethernet devices (`veth1` and `ceth1`):**

    ```bash
    ip link add veth1 type veth peer name ceth1
    ```

3. **Move `ceth1` to the `netns1` namespace:**

    ```bash
    ip link set ceth1 netns netns1
    ```

4. **Activate `veth1` and assign it an IP address:**

    ```bash
    ip link set veth1 up
    ip addr add 172.18.0.21/16 dev veth1
    ```

5. **Enter the `netns1` namespace and repeat the setup:**

    ```bash
    nsenter --net=/run/netns/netns1 bash
    ip link set lo up
    ip link set ceth1 up
    ip addr add 172.18.0.20/16 dev ceth1
    ```

### Step 5: Connect the Network Namespaces with a Bridge

1. **Delete the old network namespaces and veth pairs (if needed):**

    ```bash
    ip netns delete netns0
    ip netns delete netns1
    ip link delete veth0
    ip link delete veth1
    ```

2. **Recreate the two network namespaces (`netns0` and `netns1`):**

    ```bash
    ip netns add netns0
    ip netns add netns1
    ```

3. **Create a Linux bridge named `br0`:**

    ```bash
    ip link add br0 type bridge
    ip link set br0 up
    ```

4. **Recreate the virtual Ethernet devices and attach them to the bridge:**

    ```bash
    ip link add veth0 type veth peer name ceth0
    ip link set veth0 master br0
    ip link set veth0 up
    ip link set ceth0 netns netns0

    ip link add veth1 type veth peer name ceth1
    ip link set veth1 master br0
    ip link set veth1 up
    ip link set ceth1 netns netns1
    ```

5. **Configure the network namespaces (`netns0` and `netns1`) as before:**

    ```bash
    nsenter --net=/run/netns/netns0 bash
    ip link set lo up
    ip link set ceth0 up
    ip addr add 172.18.0.10/16 dev ceth0
    exit

    nsenter --net=/run/netns/netns1 bash
    ip link set lo up
    ip link set ceth1 up
    ip addr add 172.18.0.20/16 dev ceth1
    exit
    ```

### Step 6: Enable Connectivity to the Host and the Outside World

1. **Assign an IP address to the bridge `br0`:**

    ```bash
    ip addr add 172.18.0.1/16 dev br0
    ```

2. **Enable IP forwarding:**

    ```bash
    echo 1 > /proc/sys/net/ipv4/ip_forward
    ```

3. **Add the default route in each namespace:**

    ```bash
    nsenter --net=/run/netns/netns0 ip route add default via 172.18.0.1
    nsenter --net=/run/netns/netns1 ip route add default via 172.18.0.1
    ```

4. **Set up NAT to allow the containers to reach the outside world:**

    ```bash
    iptables -t nat -A POSTROUTING -s 172.18.0.0/16 ! -o br0 -j MASQUERADE
    ```

### Step 7: Publish a Container Port

1. **Run a simple web server inside the `netns0` container:**

    ```bash
    nsenter --net=/run/netns/netns0 python3 -m http.server --bind 172.18.0.10 5000
    ```

2. **Set up port forwarding to allow external access:**

    ```bash
    iptables -t nat -A PREROUTING -d 172.16.0.2 -p tcp --dport 5000 -j DNAT --to-destination 172.18.0.10:5000
    iptables -t nat -A OUTPUT -d 172.16.0.2 -p tcp --dport 5000 -j DNAT --to-destination 172.18.0.10:5000
    ```

3. **Test the setup by accessing the web server from the host:**

    ```bash
    curl 172.16.0.2:5000
    ```

This should return the default HTML page served by the Python HTTP server.

### Conclusion
By following these steps, you have successfully created a custom Docker-like network from scratch using Linux network namespaces, virtual Ethernet devices, bridges, IP routing, and NAT. This setup mimics the Docker bridge network mode, allowing containers to communicate with each other, the host, and the outside world.
