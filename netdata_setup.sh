# https://learn.netdata.cloud/docs/agent/collectors/python.d.plugin/mysql

sudo apt-get install python-dev
sudo apt-get install libmysqlclient-dev
pip install mysqlclient

bash <(curl -Ss https://my-netdata.io/kickstart.sh)
