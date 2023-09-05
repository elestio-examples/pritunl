#add auth

echo "Waiting for software to be ready..."
sleep 30s;

credentials=$(docker-compose exec -T pritunl bash -c "pritunl default-password")

log_file="default-credentials.txt"


log_message=$(cat "$log_file")

# Extract the random password and store it in a separate file
password=$(echo "$log_message" | grep -oP 'password: "\K[^"]+')
echo "$password" > pritunl_password.txt

sed -i 's/^ADMIN_PASSWORD=.*/ADMIN_PASSWORD='"$password"'/' ".env"

# # Print the extracted password
# cat extracted_password.txt

# target=pritunlds-u353.vm.elestio.app

# url="https://${target}/auth/session"
# post_data="username=pritunl&password=12345"

# response=$(curl -s -X POST -d "$post_data" "$url")
# echo $response
# cookie=$(echo "$response" | grep -i 'Set-Cookie' | sed -e 's/Set-Cookie: //I' | awk '{print $1}')
# echo "Cookie: $cookie"

# cookie_file="cookies.txt"

# curl -c "$cookie_file" https://${target}/auth/session \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'cache-control: no-cache' \
#   -H 'content-type: application/json' \
#   -H 'pragma: no-cache' \
#   -H 'sec-ch-ua: "Chromium";v="116", "Not)A;Brand";v="24", "Google Chrome";v="116"' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36' \
#   --data-raw '{"username":"pritunl","password":"'${password}'"}' \
#   --compressed

#   cookies=$(cat "$cookie_file")

# # Print the cookies
# echo "Cookies:"
# echo "$cookies"

# grep -i -oP 'session\t.*$' "$cookie_file" | sed 's/session\t//I' > session_identifier.txt

# # Print the extracted session identifier
# session=$(cat session_identifier.txt)



# curl https://${target}/settings \
#   -X 'PUT' \
#   -H 'accept: application/json, text/javascript, */*; q=0.01' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'cache-control: no-cache' \
#   -H 'content-type: application/json' \
#   -H 'cookie: session='${session}'' \
#   -H 'csrf-token: 4UPnULQBGFrOlcW1HiTL77HelG7vqQza' \
#   -H 'origin: https://pritunlds-u353.vm.elestio.app' \
#   -H 'pragma: no-cache' \
#   -H 'referer: https://pritunlds-u353.vm.elestio.app/' \
#   -H 'sec-ch-ua: "Chromium";v="116", "Not)A;Brand";v="24", "Google Chrome";v="116"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "Windows"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: same-origin' \
#   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36' \
#   -H 'x-requested-with: XMLHttpRequest' \
#   --data-raw '{"username":"pritunl","auditing":null,"monitoring":null,"influxdb_url":null,"influxdb_org":null,"influxdb_bucket":null,"influxdb_token":null,"email_from":"","email_server":"","email_username":"","email_password":"","pin_mode":"optional","sso":"","sso_match":null,"sso_duo_token":null,"sso_duo_secret":null,"sso_duo_host":null,"sso_duo_mode":null,"sso_yubico_client":"","sso_yubico_secret":"","sso_org":null,"sso_azure_directory_id":null,"sso_azure_region":null,"sso_azure_app_id":null,"sso_azure_app_secret":null,"sso_azure_version":null,"sso_authzero_domain":null,"sso_authzero_app_id":null,"sso_authzero_app_secret":null,"sso_google_key":null,"sso_google_email":null,"sso_saml_url":null,"sso_saml_issuer_url":null,"sso_saml_cert":null,"sso_okta_app_id":null,"sso_okta_token":null,"sso_okta_mode":null,"sso_onelogin_app_id":null,"sso_onelogin_id":null,"sso_onelogin_secret":null,"sso_onelogin_mode":null,"sso_jumpcloud_app_id":null,"sso_jumpcloud_secret":null,"sso_radius_host":null,"sso_radius_secret":null,"server_sso_url":null,"ipv6":true,"sso_cache":false,"sso_client_cache":true,"restrict_import":false,"client_reconnect":true,"drop_permissions":false,"public_address":"212.47.254.59","public_address6":"","routed_subnet6":"","routed_subnet6_wg":"","reverse_proxy":false,"server_port":443,"us_east_1_access_key":"","us_east_1_secret_key":"","us_east_2_access_key":"","us_east_2_secret_key":"","us_west_1_access_key":"","us_west_1_secret_key":"","us_west_2_access_key":"","us_west_2_secret_key":"","us_gov_east_1_access_key":"","us_gov_east_1_secret_key":"","us_gov_west_1_access_key":"","us_gov_west_1_secret_key":"","eu_north_1_access_key":"","eu_north_1_secret_key":"","eu_west_1_access_key":"","eu_west_1_secret_key":"","eu_west_2_access_key":"","eu_west_2_secret_key":"","eu_west_3_access_key":"","eu_west_3_secret_key":"","eu_central_1_access_key":"","eu_central_1_secret_key":"","ca_central_1_access_key":"","ca_central_1_secret_key":"","cn_north_1_access_key":"","cn_north_1_secret_key":"","cn_northwest_1_access_key":"","cn_northwest_1_secret_key":"","ap_northeast_1_access_key":"","ap_northeast_1_secret_key":"","ap_northeast_2_access_key":"","ap_northeast_2_secret_key":"","ap_southeast_1_access_key":"","ap_southeast_1_secret_key":"","ap_southeast_2_access_key":"","ap_southeast_2_secret_key":"","ap_east_1_access_key":"","ap_east_1_secret_key":"","ap_south_1_access_key":"","ap_south_1_secret_key":"","sa_east_1_access_key":"","sa_east_1_secret_key":"","password":"12345"}' \
#   --compressed