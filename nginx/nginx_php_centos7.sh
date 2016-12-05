#安装Nginx的库
rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
#安装nginx
yum install -y nginx
#Remi源中的软件几乎都是最新稳定版,改 /etc/yum.repos.d/remi.repo 文件，把文件内的修改[remi]下面的 enabled=0 改为 enabled=1 
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm 
#安装PHP和有关的扩展
yum install -y php php-fpm php-bcmatch php-gd php-mbstring php-mcrypt php-mysql  
#安装Mysql，如果本机不需要mysql，而是连到其他服务器，不需要下面的有效
#yum install -y mysql-server 
#设置用户组
groupadd -f www 
useradd -s /sbin/nologin -g www nginx 
#设置防火墙
firewall-cmd --add-port=80/tcp --permanent
firewall-cmd --reload
#创建测试文件
mkdir /var/www/html
echo "<?php echo 1; phpinfo();?>" >> /var/www/html/test.php
#提示用户修改配置
wget "https://raw.githubusercontent.com/banbq/server_script/master/nginx/app_sample.conf" -O /etc/nginx/conf.d/app.conf
echo "Mysql配置文件my.cnf路径：/etc/my.cnf"
echo "Nginx主配置文件nginx.conf路径：/etc/nginx/nginx.conf"
echo "PHP配置文件php.ini路径： /etc/php.ini"
echo "php-fpm配置文件php-fpm.conf路径：/etc/php-fpm.conf"
echo "接下来有如下的工作需要完成："
echo "1.修改nginx的配置，配置文件示例在：/etc/nginx/default.d/app.conf"
echo "2.配置好服务器端口（一般是80）的防火墙和云服务防火墙安全策略"
echo "3.启动启动nginx（最好纳入到开机服务） "
echo "4.用nginx用户启动php-fpm 启动方法：service php-fpm start"
echo "5.启动后请在浏览器中浏览网站这个地址做测试：http://网站url/test.php"