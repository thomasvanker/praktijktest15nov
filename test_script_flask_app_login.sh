# test script for flask_app_login.py -- use in Virtualbox VM, not in Docker
# programm flask_app_login needs to be running
PORT=5555
echo "Deleting all test records"
curl -k -X DELETE "https://127.0.0.1:$PORT/delete/all"
INSECURE_USER="ZebiThomas"
INSECURE_PW="zoubilThomas"
echo 'Creating new user v1 insecure'
curl -k -X POST -F "username="$INSECURE_USER -F "password="$INSECURE_PW "https://127.0.0.1:$PORT/signup/v1"
echo "Testing login v1"
curl -k -X POST -F "username="$INSECURE_USER -F "password="$INSECURE_PW "https://127.0.0.1:$PORT/login/v1"
#### Replace fixed username with a variable SECURE_USER and a variable passord SECURE_PW
echo "Creating new user v2 secure"
SECURE_USER="zoubilLoic"
SECURE_PW="zoubilLoic"
curl -k -X POST -F "username="$SECURE_USER -F "password="$SECURE_PW "https://127.0.0.1:$PORT/signup/v2"
echo "Testing login v2"
curl -k -X POST -F "username="$SECURE_USER -F "password="$SECURE_PW "https://127.0.0.1:$PORT/login/v2"

