#add auth

echo "Waiting for software to be ready..."
sleep 30s;

credentials=$(docker-compose exec -T pritunl bash -c "pritunl default-password")
echo $credentials > default-credentials.txt