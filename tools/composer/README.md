#Dockerized Composer

Composer Docker container can be use without installing composer tool on you local environment.

To initialise a composer project in you current folder, use following command. You have to make sure `composer.json` is exist in current folder.

    docker run --rm -v $(pwd):/data/www nematix/composer install

You can use alias to simplify the command.

    alias composer="docker run --rm -v $(pwd):/data/www nematix/composer"
