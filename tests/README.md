<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Pritunl, verified and packaged by Elestio

A better community platform for the modern web.

[Pritunl](https://github.com/pritunl/pritunl) Enterprise VPN Server,.

<img src="https://github.com/elestio-examples/pritunl/raw/main/pritunl.png" alt="Pritnul" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/pritunl">fully managed Pritunl</a> on <a target="_blank" href="https://elest.io/">elest.io</a> Enterprise VPN Server,

[![deploy](https://github.com/elestio-examples/pritunl/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/pritnul)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/pritnul.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env


Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:1194`

## Docker-compose

Here are some example snippets to help you get started creating a container.

      
    version: '3.3'
    services:
    mongo:
        container_name: mongo
        image: mongo:3.2
        ports:
        - " 172.17.0.1:27017:27017"
        restart: always
        volumes:
        - /opt/mongo/data:/data/db
    pritunl:
        container_name: pritunl
        build: .
        image: elestio4test/pritnul:${SOFTWARE_VERSION_TAG}
        depends_on:
        - mongo
        networks:
        - pritunl
        ports:
        - " 172.17.0.1:80:80"
        - " 172.17.0.1:443:443"
        - " 172.17.0.1:1194:1194/udp"
        privileged: true
        restart: always


### Environment variables

|       Variable       | Value (example) |
| :------------------: | :-------------: |
| SOFTWARE_VERSION_TAG |     latest      |




# Maintenance

## Logging

The Elestio Pritnul Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://docs.pritunl.com/docs">Pritunl documentation</a>

- <a target="_blank" href="https://github.com/pritunl/pritunl">Pritunl Github repository</a>

- <a target="_blank" href="https://github.com/elestio-examples/pritunl">Elestio/pritunl Github repository</a>
