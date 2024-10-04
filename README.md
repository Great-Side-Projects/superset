<a name="readme-top"></a>


[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://www.keycloak.org/">
    <img src="https://superset.apache.org/img/superset-logo-horiz.svg" alt="Logo" width="600" height="">
  </a>

  <h3 align="center">Superset</h3>

  <p align="center">
A modern, enterprise-ready business intelligence web application.
 <br />
    <a href="https://superset.apache.org/docs/intro"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://mysuperset.azurewebsites.net">View Demo</a>
    ·
    <a href="https://github.com/Great-Side-Projects/superset/issues">Report Bug</a>
    ·
    <a href="https://github.com/Great-Side-Projects/superset/issues/new">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#Architecture-design">Architecture design</a></li>
        <li><a href="#Architecture-diagram">Architecture diagram</a></li>
     </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

[![Product Name Screen Shot][product-screenshot-UI]](https://mysuperset.azurewebsites.net/)

[![Product Name Screen Shot][product-screenshot-UI2]](https://mysuperset.azurewebsites.net/)

Superset is a modern data exploration and data visualization platform. Superset can replace or augment proprietary business intelligence tools for many teams. Superset integrates well with a variety of data sources.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Built With

This project is built with the following technologies:


* [![Docker][DockerImage]](https://www.docker.com/)
* [![Appservice][AzureWebApp]](https://azure.microsoft.com/es-es/services/app-service/web/)
* [![PostgreSQL][PostgreSQL]](https://www.postgresql.org/)

### Architecture design

The architecture design is based in Azure cloud services, the project is deployed in Azure App Service, the database is postgres, the CI/CD is GitHub Actions.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Architecture diagram
[![Architecture diagram][architecture-diagram]](https://mysuperset.azurewebsites.net/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- GETTING STARTED -->
## Getting Started

Here you can find the steps to run the project in your local environment to explore the superset proyect. 

### Prerequisites

This is an example of how to list things you need to use the software and how to install them.

You need to have a database created in PostgreSQL, for example "superset" see https://superset.apache.org/docs/configuration/databases.
#### Note: the first time you run the project, the database will be created automatically and take more time to start the keycloak server. 

* Docker
* PostgresSQL database

### Installation


1. Clone the repo
   ```sh
   git clone https://github.com/Great-Side-Projects/superset.git
   ```
2. Go to the root folder of the project
   ```sh
   cd superset
   ``` 
3.  find a docker file "Dockerfile"  and set the environment variables in the dockerfile. root folder of the project

    ```sh
    # Generating a SECRET_KEY in terminal
    openssl rand -base64 42
    ... # output: sample
    YepiwJYeMmUx7JfjHtNIKggMDhlFh5bTVOH5HBi57sO4/tJRg3n74Zku
    ```    
    ```dockerfile
    ENV SUPERSET_SECRET_KEY=YepiwJYeMmUx... # set a secret key for the superset from the previous step
    ENV SQLALCHEMY_DATABASE_URI=postgresql://user:pass@localhost:5432/superset # set the database connection
    ENV USERNAME_ADMIN=admin # set the username of the admin user for the superset
    ENV PASSWORD_ADMIN=admin # set the password of the admin user for the superset
    ```
    
4. Create image and run with docker. root folder of the project 
 
   ```sh
    docker build -t superset .
    docker run -p 8088:8088 superset
   ```
   Or set ARG to build the image with the environment variables
    ```sh
    docker build --build-arg SUPERSET_SECRET_KEY=4b607407... \
                 --build-arg SQLALCHEMY_DATABASE_URI=postgresql://user:pass@localhost:5432/superset \
                 --build-arg USERNAME_ADMIN=admin \
                 --build-arg PASSWORD_ADMIN=admin \
                 -t superset .
    ...
    ...
    ...

    docker run -p 8088:8088 superset
    ```

5. Open your browser and go to `http://localhost:8088/` to see the UI super login.
6. Login with the user and password that you have configured in the dockerfile.
    ```dockerfile
    ENV
        USERNAME_ADMIN=admin
        PASSWORD_ADMIN=admin
    ```
7. Enjoy!

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- USAGE EXAMPLES -->
## Usage

### Easy way:
Go to `http://localhost:8088/` and you can see the UI to manage the superset.


<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

- [x] Implement Docker for deployment
- [x] Implement CI/CD with GitHub Actions
- [x] Implement Azure App Service for deployment
- [x] Implement Azure PostgreSQL for the database


See the [open issues](https://github.com/Great-Side-Projects/superset/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the "develop" Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTACT -->
## Contact

Angel Morales - [LinkedIn](https://www.linkedin.com/in/angelmoralesb/) - angelmoralesb@gmail.com

Project Link: [https://github.com/Great-Side-Projects/keycloak](https://github.com/Great-Side-Projects/superset)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Superset Quick Start](https://superset.apache.org/docs/installation/quick-start) 
* [Choose an Open Source License](https://choosealicense.com)
* [Docker](https://www.docker.com/)
* [GitHub Actions](https://docs.github.com/es/actions)
* [Azure App Service](https://azure.microsoft.com/es-es/services/app-service/web/)
* [Azure SQL Database PostgreSQL](https://azure.microsoft.com/es-es/products/postgresql)
* [Azure Container Registry](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-get-started-docker-cli?tabs=azure-cli)
  
 
<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributors-url]: https://github.com/Great-Side-Projects/superset/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=for-the-badge
[forks-url]: https://github.com/Great-Side-Projects/superset/forks
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=for-the-badge
[stars-url]: https://github.com/Great-Side-Projects/superset/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/
[issues-url]: https://github.com/Great-Side-Projects/superset/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=for-the-badge
[license-url]: https://github.com/Great-Side-Projects/quickshortapi/blob/main/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/angelmoralesb/
[product-screenshot-UI]: images/screenshotUI.png
[product-screenshot-UI2]: images/screenshotUI2.png
[DockerImage]: https://img.shields.io/badge/Docker-0db7ed?style=for-the-badge&logo=docker&logoColor=white
[AzureWebApp]: https://img.shields.io/badge/Azure%20Web%20App-0089D6?style=for-the-badge&logo=microsoft-azure&logoColor=white
[PostgreSQL]: https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white
[architecture-diagram]: images/Superset-Architecture-Design.png
