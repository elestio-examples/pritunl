echo "Waiting for software to be ready..."
sleep 30s;

credentials=$(docker-compose exec -T pritunl bash -c "pritunl default-password")

log_file="default-credentials.txt"
echo $credentials > $log_file

log_message=$(cat "$log_file")

password=$(echo "$log_message" | grep -oP 'password: "\K[^"]+')
echo "$password" > pritunl_password.txt

sed -i 's/^ADMIN_PASSWORD=.*/ADMIN_PASSWORD='"$password"'/' ".env"

cat pritunl_password.txt