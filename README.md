# Nematix Docker Images

This a collection of Docker images build file.

## Docker Build

Automatic build for this repo can be obtain from [Docker Hub](https://registry.hub.docker.com/repos/nematix/)

## Usage Example

### Data Only Container

To use data-only container pattern, some basic configuration need to be done. Below is the basic folder and file structure needed,
create `www` folder inside your project.

    - project\
            |- www
            |- docker-compose.yml

Then we need to create a Docker-Fig build file.

#### docker-compose.yml

    data:
      image: nematix/data
      volumes:
        - .:/data

    composer:
      image: nematix/composer
      volumes_from:
        - data

    db:
      image: nematix/mariadb
      volumes_from:
        - data
      environment:
        MARIADB_DB: my_app
        MARIADB_USER: root
        MARIADB_PASS: toor
      ports:
          - "3306:3306"
      privileged: true

    web:
      image: mara/ependahuluan-dev
      links:
        - db:db
      volumes_from:
        - data
        - composer
      ports:
        - "10080:80"
      privileged: true

Using `fig` command line tool to run all the container and stitch them together.

    fig up


## Supports

Please use my blog for support & comment, or you can reach my by Twitter at [@azrijamil](https://twitter.com/azrijamil)
