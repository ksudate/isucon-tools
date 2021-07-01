git pull

cd webapp/go
make

sudo systemctl restart isuumo.go.service
sudo systemctl restart nginx.service
sudo systemctl restart mysql.service

sudo truncate /var/log/nginx/access.log --size 0
