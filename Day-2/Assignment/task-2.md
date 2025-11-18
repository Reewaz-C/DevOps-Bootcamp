# Task 2: Package Management

## Update package index

    ```bash
    $ sudo apt update
    ```

![update](../Img/update_package.png)

## Install htop (System monitoring tool)

    ```bash
    $ sudo apt install htop -y
    ```

![htop](../Img/htop.png)

## Checking if nginx is installed

    ```bash
    $ which nginx
    ```
![nginx](../Img/nginx.png)

## If not installed 

    ```bash
    $ apt insatll nginx -y
    ```
## Listing all the packages and saving the output
    
    ```bash
    $ sudo bash -c "apt list --installed >> /devops-labs/package.txt"
    ```
![Installed package](../Img/list_installed_package.png)


![Installed package](../Img/list_installed_package1.png)
