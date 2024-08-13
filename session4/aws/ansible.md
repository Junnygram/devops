
### Ansible Overview

**What is Ansible?**
- **Configuration Management Tool:** Ansible automates the management of servers, making it easier for system admins to manage infrastructure across multiple servers.
- **Automation:** Ansible reduces manual work by automating tasks using playbooks written in YAML, which is a human-readable data serialization language.
- **Agentless:** Ansible does not require any agent installation on the client machines, it uses SSH for communication.
- **Infrastructure as Code (IaC):** Ansible allows you to define your infrastructure configuration through code, enabling easy management, deployment, and versioning.

### Key Features

1. **Platform Support:**
   - Available for various platforms like Red Hat, Debian, CentOS, and Oracle Linux.
   - Supports on-premise and cloud-based servers.

2. **Playbooks:**
   - **Playbooks:** YAML files that define the automation tasks for Ansible to execute.
   - Example Playbook Structure:
     ```yaml
     - hosts: demo
       user: ansible
       become: yes
       connection: ssh
       tasks:
         - name: Install httpd on Linux
           yum:
             name: httpd
             state: present
     ```
   - **Modules:** Ansible comes with numerous modules (functions) to perform various tasks. Modules are executed directly on remote hosts through playbooks or ad-hoc commands.

3. **Common Commands:**
   - **Install Package:**
     ```bash
     ansible all -b -m yum -a "name=httpd state=present"
     ```
   - **Remove Package:**
     ```bash
     ansible all -b -m yum -a "name=httpd state=absent"
     ```
   - **Copy File:**
     ```bash
     ansible demo -b -m copy -a "src=file1 dest=/tmp/"
     ```
   - **Gather Facts:**
     ```bash
     ansible demo -m setup
     ```

4. **User Management:**
   - **Creating a User:**
     ```bash
     ansible demo -b -m user -a "name=Kishan state=present"
     ```

5. **Inventory Management:**
   - The inventory file (`/etc/ansible/hosts`) contains the list of servers that Ansible manages. This file can categorize servers into groups for better management.

6. **Best Practices:**
   - **Idempotency:** Ansible modules are designed to be idempotent, meaning repeated execution will not change the system state if it's already in the desired state.
   - **SSH Configuration:** For security and efficient management, SSH should be properly configured to allow Ansible to connect to nodes without requiring repeated password inputs.

This summary provides a clear and concise understanding of Ansible's basic concepts, common commands, and best practices for managing infrastructure. If you need more detailed documentation or examples, feel free to ask!
