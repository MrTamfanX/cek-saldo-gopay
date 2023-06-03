#!usr/bin/bash
#Cek Saldo Gopay by Buitenzorg Syndicate

green="\033[32;1m"
yellow="\033[33;1m"
indigo="\033[34;1m"
red="\033[35;1m"
purple="\033[37;1m"
cyan="\033[36;1m"
white="\033[39;1m"
access_token="xzZnu3YnAHRk298EsmyttFQMcbCcvmwTKK5hrJx2aGG8ZnFyBJhAvFWNmbWVSD7p"
url="https://api.gojekapi.com/wallet/profile/full"

clear
echo $green
echo '----------------------------'
echo '   Cek Saldo Gopay by BS'
echo '----------------------------\n'
echo '\033[39;1m[\033[31;1m•\033[39;1m]\033[33;1mContoh: 0896xxxxxxxx \033[39;1m'
read -p "Masukan Nomer Anda: " nomor;
response=$(curl -s -X POST -H "Authorization: Bearer $access_token" -H "Content-Type: application/json" -d "{\"phone\":\"$nomor\"}" $url )

status=$(echo $response | jq -r '.data.status')

if [ "$status" = "SUCCESS" ]; then
    saldo=$(echo $response | jq -r '.data.balance')
    echo "\n\n\033[39;1m[\033[32;1m✓\033[39;1m]\033[39;1mSaldo GoPay untuk nomor $nomor\033[32;1m:\033[33;1m $saldo IDR"
else
    echo "\n\n\033[39;1m[\033[31;1mx\033[39;1m]\033[31;1mGagal mengambil saldo GoPay\033[39;1m.\033[32;1m\n"
fi
