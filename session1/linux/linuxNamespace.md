### Understanding Linux Network Namespaces: A Simple Guide

Imagine you're in a big house where each room has its own TV, fridge, and internet connection. Even though everyone is in the same house, what happens in one room doesn’t affect what happens in another. This is kind of like what **Linux Network Namespaces** do for computers.

#### Why Do We Need Network Namespaces?

In a computer, lots of different programs need to talk to each other or to the internet. Sometimes, you want to keep these conversations separate, just like you might want to keep the activities in one room of your house private from others. Network namespaces help us do this by giving each program or group of programs their own "room" with its own network setup. This means they can have their own IP addresses, routing tables, and firewall rules, without interfering with each other.

### What Problems Do Network Namespaces Solve?

1. **Isolation**: Just like how each room in a house can have its own TV and fridge, namespaces allow different parts of a computer to have their own network settings. This prevents them from messing with each other’s connections.

2. **Security**: By isolating programs, we can protect them from each other. If something bad happens in one namespace (like a virus), it doesn’t easily spread to another namespace.

3. **Testing and Development**: Developers can use namespaces to create separate environments to test their programs without affecting the rest of the system. It’s like having a sandbox where you can build and break things without worrying about making a mess everywhere else.

### Setting Up Linux Network Namespaces with VLANs Using Open vSwitch

Now, let’s learn how to set up these separate rooms (namespaces) and connect them using virtual cables (VLANs) and a central switchboard (Open vSwitch, or OVS) to control the traffic.

#### 1. **Create Network Namespaces**
   - First, we create two namespaces, `RED` and `GREEN`. These are like two separate rooms in our house.
   - **Command**: 
     ```bash
     ip netns add red
     ip netns add green
     ```

#### 2. **Set Up Virtual Ethernet Pairs**
   - We then create virtual cables (veth pairs) to connect these namespaces to the main network through our central switchboard (OVS).
   - For `RED`:
     - **Command**: 
       ```bash
       ip link add veth-r type veth peer name tap-r
       ```
     - Attach one end (`veth-r`) to the `RED` namespace and the other end (`tap-r`) to OVS.
   - For `GREEN`:
     - **Command**:
       ```bash
       ip link add veth-g type veth peer name tap-g
       ```
     - Attach one end (`veth-g`) to the `GREEN` namespace and the other end (`tap-g`) to OVS.

#### 3. **Configure Open vSwitch with VLANs**
   - Now, we add the `tap-r` and `tap-g` cables to our switchboard (OVS) and tag them with VLANs to keep the traffic from each namespace separate.
   - **Commands**:
     ```bash
     ovs-vsctl add-port OVS1 tap-r
     ovs-vsctl set interface tap-r type=internal
     ovs-vsctl set port tap-r tag=100
     
     ovs-vsctl add-port OVS1 tap-g
     ovs-vsctl set interface tap-g type=internal
     ovs-vsctl set port tap-g tag=200
     ```

#### 4. **Assign IP Addresses**
   - Each namespace needs its own IP address, just like how each room might have its own phone number.
   - For `RED`:
     - **Command**:
       ```bash
       ip netns exec red ip addr add 10.0.0.1/24 dev eth0-r
       ```
   - For `GREEN`:
     - **Command**:
       ```bash
       ip netns exec green ip addr add 10.0.0.2/24 dev eth0-g
       ```

#### 5. **Activate Interfaces**
   - Finally, we turn on the interfaces in each namespace so they can start communicating.
   - **Commands**:
     ```bash
     ip netns exec red ip link set dev eth0-r up
     ip netns exec green ip link set dev eth0-g up
     ```

### Summary

By setting up network namespaces, we create isolated environments (`RED` and `GREEN`) that can operate independently within the same system. This is like having different rooms in your house where activities can happen separately without interfering with each other. Using Open vSwitch and VLANs, we control the flow of traffic between these environments, ensuring that everything runs smoothly and securely. This setup is perfect for testing, developing, and securely running multiple network setups on the same machine.
