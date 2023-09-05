#add auth

echo "Waiting for software to be ready..."
sleep 30s;

credentials=$(docker-compose exec -T pritunl bash -c "pritunl default-password")
password=$(echo "$credentials" | grep -oP 'Password: \K.*')

password=$(echo "$password" | awk '{$1=$1};1')

cat << EOT >> ./.env

ADMIN_PASSWORD=${password}
EOT