# Portfolio Website Docker Image

## Task: Create a Docker image that serves a portfolio website containing at least two images and a button to download a CV.

## Overview

    This repository contains a minimal static portfolio website and a Dockerfile to build a Docker image that serves the site using a lightweight web server. The site includes:

    - A homepage with at least two images (profile/project images).

    - A Download CV button that triggers the download of a CV.pdf file.

## File Structure

![alt text](Img/porttree.png) 

## DOckerfile

Use this dockerfile to create an image that serves the static file.

```bash
FROM nginx:alpine

WORKDIR /app

RUN rm -rf /usr/share/nginx/html/*

COPY . /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

## index.html

Basic HTML file of the portfolio site.

```bash
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Riwaj Chipalu - Portfolio</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<!-- Navigation Bar -->
<nav>
    <div class="logo">Riwaj<span>Chipalu</span></div>
    <ul class="nav-links">
        <li><a href="#about">About</a></li>
        <li><a href="#projects">Projects</a></li>
        <li><a href="#contact">Contact</a></li>
    </ul>
</nav>

<!-- Hero Section -->
<header class="hero">
    <div class="hero-text">
        <h1>Hello, I’m <span>Riwaj Chipalu</span></h1>
        <p>DevOps • Cloud • Automation • Security</p>
        <a href="Img/Riwaj Chipalu.pdf" download class="cv-button">Download My CV</a>
    </div>
    <img src="Img/passport.jpg" class="hero-img">
</header>

<!-- About Section -->
<section id="about" class="about-section">
    <h2>About Me</h2>
    <p>
        I am passionate about cloud infrastructure, DevOps pipeline automation, and building secure scalable systems.
        I love working with AWS, Jenkins, Docker, Kubernetes and Terraform to create real-world automation projects.
    </p>
</section>

<!-- Projects Section -->
<section id="projects" class="projects-section">
    <h2>Featured Project</h2>

    <div class="project-card">
        <img src="Img/project.jpeg" alt="Project Image">
        <div class="project-content">
            <h3>CI/CD DevSecOps Pipeline</h3>
            <p>
                A fully automated DevSecOps pipeline using Jenkins, Docker, SonarQube, OWASP Dependency Check,
                Trivy, and containerized deployments.
            </p>
        </div>
    </div>
</section>

<!-- Contact Section -->
<section id="contact" class="contact-section">
    <h2>Contact Me</h2>
    <p>Email: <strong>riwazu23@gmail.com</strong></p>
    <p>Location: Balaju, Kathmandu</p>
</section>

<footer>
    <p>© 2025 Riwaj Chipalu • Portfolio</p>
</footer>

</body>
</html>
```

## style.css

```bash
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #0d1117;
    color: #e6e6e6;
}

/* Navigation Bar */
nav {
    display: flex;
    justify-content: space-between;
    background: #161b22;
    padding: 20px 40px;
    position: sticky;
    top: 0;
}

nav .logo {
    font-size: 24px;
    font-weight: bold;
    color: #4ea1ff;
}

nav .logo span {
    color: #fff;
}

.nav-links {
    list-style: none;
    display: flex;
}

.nav-links li {
    margin-left: 25px;
}

.nav-links a {
    text-decoration: none;
    color: #e6e6e6;
    font-size: 18px;
}

.nav-links a:hover {
    color: #4ea1ff;
}

/* Hero Section */
.hero {
    display: flex;
    justify-content: space-between;
    padding: 80px 100px;
    align-items: center;
}

.hero-text h1 {
    font-size: 48px;
}

.hero-text h1 span {
    color: #4ea1ff;
}

.cv-button {
    display: inline-block;
    margin-top: 20px;
    background: #4ea1ff;
    padding: 12px 20px;
    border-radius: 8px;
    color: black;
    text-decoration: none;
    font-weight: bold;
}

.cv-button:hover {
    background: #74b8ff;
}

.hero-img {
    width: 280px;
    border-radius: 12px;
    border: 3px solid #4ea1ff;
}

/* Section Styling */
section {
    padding: 60px 100px;
}

h2 {
    color: #4ea1ff;
}

/* Project Card */
.project-card {
    display: flex;
    background: #161b22;
    padding: 20px;
    border-radius: 12px;
    margin-top: 20px;
}

.project-card img {
    width: 250px;
    height: 160px;
    border-radius: 10px;
    margin-right: 20px;
}

/* Contact Section */
.contact-section p {
    font-size: 20px;
}

/* Footer */
footer {
    text-align: center;
    padding: 20px;
    background: #161b22;
    margin-top: 40px;
}
```

## Build the Docker image from Dockerfile

```bash
docker build -t rexxx9865/adex-devops:latest .
```

## Verify the built image

```bash
docker images
```

## Run the container with the built docker image

```bash
docker run -d --name riwaj-container -p 80:80 rexxx9865/adex-devops:latest
```

## Verify the spinned container

### 1. CLI

```bash
dokcker ps
```

### 2. curl

```bash
curl localhost
``` 

### 3. Via Browser

![alt text](Img/portfolio.png)

## Push the Docker Image to DockerHub

### 1. Login to Docker

```bash
docker login
```

### 2. Push your image

```bash
docker push rexxx9865/adex-devops:latest
```
