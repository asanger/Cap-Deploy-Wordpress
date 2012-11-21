Cap-Deploy-Wordpress
====================

Deploy Wordpress with Capistrano

This code is based off of missiondata's setup: https://github.com/missiondata/capistrano-recipe-wordpress

## Initial Setup
Add information here...

## Deploying
When running for the first time against a new server, perform the following commands first:
```
cap deploy:setup
cap deploy:cold
```

From then on, you can simply run 
``` 
cap deploy
```

