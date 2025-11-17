# LINUX FUNDAMENTALS

## Introduction

Linux is an open-source operating systems that is known for being free, customizable, and secure, and it is used in a wide variety of devices, from smartphones and servers to supercomputers.

### 1. Linux File System

A Linux file system is a hierarchical, tree-like structure that organizes data on storage devices with everything stemming from the root directory (/).

- / : Root directory or top directory. All other directories and files branch from here. Only the root user has write permission to this directory.

- /bin: Contains essential User Binaries and executable programs that are essential for both the root user and all other users like ls, cp, and mv. 

- /boot: Contains the files needed to boot the operating system, such as
the Linux kernel and the bootloader configuration.

- /dev:Contains files that represent hardware devices. The Linux kernel uses these files to communicate with devices such as hard drives

- /etc: Stores host-specific, system-wide configuration files for
applications and services like passwd.

- /home: The location for home directories for regular users.

- /lib:  Contains the Essential shared libraries and kernel modules required by the executable programs in /bin and /sbin.

- /media: The default location for automatically mounting removable media, like USB drives and CDs, when they are inserted.

- /mnt: The location for manually mounting temporary filesystems.

- /opt: A directory for installing optional or third-party software packages that are not part of the standard system.

- /root: The home directory for the root superuser, separate from other users' home directories.

- /sbin: Contains executable programs used for system administration and maintenance that are typically reserved for the root user like init, and mount.

- /tmp: Stores temporary files created by users and applications, which will be cleared out upon reboot.

- /usr:  Universal System Resources. A secondary hierarchy for read-only user data, containing the majority of user utilities and applications.

- /var: Stores files whose content is expected to change continuously, such as log files (/var/log)

- /sys: A virtual filesystem that exposes kernel objects and their attributes to userspace.

- /srv: Site-specific Data. Contains data for services provided by the system, such as web server content. 

- /proc: Process Information. A virtual filesystem that provides a window into the kernel's process and system information, with a subdirectory for each running process.

- /run:  Runtime Variable Data. A virtual filesystem that stores information about the running system since the last boot. 

### 2. Basic Linux Commands

**Navigation**

1. 'pwd': Prints the working Directory.

    '''bash
    $ pwd
    /home/riwaz/DevOps-Bootcamp/Day1
    '''

2. 'cd': Change the working Directory.

    '''bash
    $ cd DevOps-Bootcamp/Day1/
    '''

3. 'ls' | 'ls -l': Lists all the files and subdirectories and -l to show lonf list.
    '''bash
    $ ls -l
    total 12
    drwxrwxrwx 2 riwaz riwaz 4096 Nov 17 14:47 Img
    -rw-rw-rw- 1 riwaz riwaz 3024 Nov 17 15:38 Linux-Fundamentals.md
    -rw-rw-rw- 1 riwaz riwaz 2623 Nov 17 14:51 SDLC.md
    '''

** File Management**

