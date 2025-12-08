# Containerize NodeJS App with Multi Stage Docker Build

1. Fork or copy GitHub - adex-devops-bootcamp/multi-stage-docker 
2. Generate a lighweight Dockerfile
3. Put screenshots in the comments or documentation of building the app with different version tags (Hint: .env)

## 1. Cloning the forked repo

![alt text](../Img/repoclone.png)

## 2. Creating .env file

![alt text](../Img/envfile.png)

## 3. Creating Dockerfile

![alt text](../Img/Dockerfile.png)

## 4. Build Docker Image from the file

![alt text](../Img/Dockerbuild.png)

## 5. Running the container with the built image

![alt text](../Img/Dockerrun.png)

### 5.1 Verification of container

```bash
docker ps
```

### 5.2 Verification of application

![alt text](../Img/Dockerapp.png)

## 6. Updating the app version

### 6.1 Version updated in .env file

![alt text](../Img/envupdate.png)

### 6.2 Building new docker Image with updated app version

![alt text](../Img/Dockerbuildupdate.png) 

### 6.3 Verification of built image with updated tag

![alt text](../Img/Dockerimageupdate.png)

### 6.4 Running the container with updated Image

![alt text](../Img/Dockerrunupdate.png)

### 6.5 Verification of updated application version

```bash
curl localhost
```

![alt text](../Img/DockerappV2.png)
