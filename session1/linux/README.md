    Introduction to Linux

========================================

Linux is an OS

Linux - Linus tovalds

Unix - At & T

GNU license

Linux is Opensource - download and modify

Ubuntu - flavor/subset/family

windows, macos, linux, unix

windows - windows 11, 10, 8, 7, xp, vista, nt, 2003, server
macos - macos 10, os x

linux - debian (ubuntu, kali, mint) , rhel (cenOS, fedora), opensuse.

GUI / CLI

$ sudo apt install packagename

~ - user's home account

/ - root home account

ls - display list of contents in the current directory
ll - long list
pwd - print working directory

bin / sbin - binary (commands) sbin (root) bin(user)

home - list of users

media - hard disks, pendrives, dvd

mnt - mounted voulmes

opt - optional, used for anything, mostly storage

lib/lib64 - library files required for booting

proc - process that are currently running

dev - device hardware information

var - variables - used to store logs

tmp - temporary files that would be deleted after reboot

etc - system configuration files

# files / folder related commands

1. How to display files and folders

ls
ls -a
ll
ll -alt
ll -altr
ll -a

2. How to create files and folders

   touch, editor (vi (default), nano)

   touch <filename> - used to create any file, but doesn't allow for editing

   vi <filename> - used to create any file and supports adding and editing content

   enter text - insert (i)
   save and exit - escape (ESC) :wq! or :x!

   :wq! - This saves or write and forcefully quit the vi editor
   :q! - This would forcefully quite the editor without saving the changes in a file
   :wq - This saves and quit the file normally
   :x! - This saves and quit

   nano <filename>

3. How to see the content of a file

   cat <filename> - shows the content of the file
   more <filename> - long display of file content, usually page by page
   less <filename> - shows the short length of the file content
   head -n <filename> - shows the file content according to the number of lines provided from the top
   tail -n <filename> - shows the file content according to the number of lines provided from the bottom

#

# Notes

idea => product/application/service

html/js/python/ruby/c#/

Code => build/package => test => deploy

127.0.0.1:5500/index.html

Frontend hosting platforms:

Heroku, netlify, vercel, aws amplify

bare metals - physical hardware and their form factors

features includes:

Ram - 128GB
HDD - 500TB

virtualization - hypervisor - virtualbox, hyperv, vmware

complex
repetition
error prone
time consumption

# recommended order of code implementation

Box - base image e.g ubuntu  
Provider  
Networking - host-only, nat, bridge
Folder
Provision

# Linux topics

files/folder related - create, read, move, delete
search related - find/sed/grep
user related
security related
backup related
automation - cronjob/logrotate
machine related
service related
network related
monitoring related
configuration/file-system related
installations/packages related
chaining/redirection/operations related

- awk
- id
- cal
- date
- sed
- grep
- find
- remove
- cp
- mv
- which
- chmod
- usermod
- chshell
- pswrd
- useradd
- chown
- tree
- matrix
- banner
- adduser
- export
- echo
- journal
- ssh
- scp
