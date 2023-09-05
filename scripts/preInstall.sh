#set env vars
set -o allexport; source .env; set +o allexport;

sed -i "s/INSTANCE_DOMAIN/$DOMAIN/g" ./scripts/mongo_setup.sh

sed -i "s/ADMIN_PASSWORD/$ADMIN_PASSWORD/g" ./scripts/mongo_setup.sh

NODE_ID=$(tr -dc '[:lower:][:digit:]' < /dev/urandom | head -c 24; echo)

cat << EOT >> ./.env

NODE_ID=${NODE_ID}
EOT

#create key file (for cluster and single node cluster)
echo "Create Key file"
mkdir -p ./auth;
echo $(openssl rand -hex 20) > ./auth/key;

echo "set perm on Key file"
chmod 600 ./auth/key 

#activate the single node cluster and create admin account with mongosetup
docker-compose up -d;

#launch mongosetup a second time to ensure it's applied
docker-compose up mongosetup;
docker-compose up mongosetup;

echo "Waiting ...";


sleep 150s;