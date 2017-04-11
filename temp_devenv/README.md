# TEMP DEV ENV

This is docker-compose file set for building friend_books development environment on Docker.

# Build

```
$ git clone https://github.com/bamchoh/dockerfiles
$ cd dockerfiles/temp_devenv
$ docker-compose build
$ docker-compose up db
```

After db initialization, exit db container by Ctrl+C

```
$ docker-compose run web rake db:migrate
$ docker-compose up
```

After above, Access to `localhost:3000`
