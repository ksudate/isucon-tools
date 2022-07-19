dt=`date +%Y%m%d%H%M`
sudo cat /var/log/nginx/access.log | alp -c alp.yaml ltsv > $HOME/log/alp/alp-$dt.txt
echo $HOME/log/alp/alp-$dt.txt

sudo pt-query-digest /var/log/mysql/slow.log > $HOME/log/slow/slow-$dt.txt
echo $HOME/log/slow/slow-$dt.txt
