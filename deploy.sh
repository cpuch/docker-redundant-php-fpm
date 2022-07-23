# login to aws docker repository
eval $(/home/ubuntu/.local/bin/aws ecr get-login --region eu-west-1 --no-include-email | sed 's|https://||');

# fetch the docker compose file to start deployment
git archive --remote=ssh://git@bitbucket.org/fbanke/patch.git Production docker-compose.yml --output docker-compose.yml.tar;
tar xf docker-compose.yml.tar;

# deploy!
docker stack deploy --compose-file docker-compose.yml patch --with-registry-auth;