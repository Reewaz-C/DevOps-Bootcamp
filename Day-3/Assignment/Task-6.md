# Task 6: Extra Screenshots

## 6.1 Screenshot of directories

![SS](../Img/SS.png)

## 6.2 Screenshot of IDs

![ID](../Img/IDS.png)

## 6.3 getfacl

![ACL](../Img/ACL.png)

## 6.4 Why SUID, SGID and Sticky Bit used?

### SUID

We have used SUID in delpoy.sh file because it makes the script run as the owner (deploy) of the file regardless of who executes them.

### SGID

We have used SGID in /source/ and /shared/ to ensure all the new files which will be created could inherit group devteam in order to avoid permission conflicts.

### Sticky Bit
We have used sticky bits in /logs/ in order to prevent users from deleting other's file both accidental and intentional.

## 6.5 Security Implications

- Imroved collaboration with SGID
- Implementation of Least privilage using ACL
- Safe logging using sticky bit
- Secure access to execute sh file with SUID without sudo access
- Default permissions with umask
