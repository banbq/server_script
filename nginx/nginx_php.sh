#添加EPEL源（32位），如果在中国大陆较慢可以选择使用
#rpm -ivh http://mirrors.ustc.edu.cn/fedora/epel/6/i386/epel-release-6-8.noarch.rpm  
#添加EPEL源（64位），如果在中国大陆较慢可以选择使用
rpm -ivh http://mirrors.ustc.edu.cn/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm  
#Remi源中的软件几乎都是最新稳定版,改 /etc/yum.repos.d/remi.repo 文件，把文件内的修改[remi]下面的 enabled=0 改为 enabled=1 
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm 
#安装PHP和有关的扩展
yum install -y php php-fpm php-bcmatch php-gd php-mbstring php-mcrypt php-mysql  

#安装Mysql，如果本机不需要mysql，而是连到其他服务器，不需要下面的有效
#yum install -y mysql-server 
#安装nginx
yum install -y nginx
#设置用户组
groupadd -f www 
useradd -s /sbin/nologin -g www nginx 
wget "https://raw.githubusercontent.com/banbq/server_script/master/nginx/app_sample.conf" -O /etc/nginx/default.d/app.conf
#提示用户修改配置
echo "Mysql配置文件my.cnf路径：/etc/my.cnf"
echo "Nginx主配置文件nginx.conf路径：/etc/nginx/nginx.conf"
echo "PHP配置文件php.ini路径： /etc/php.ini"
echo "php-fpm配置文件php-fpm.conf路径：/etc/php-fpm.conf"
echo "站点配置文件示例在：/etc/nginx/default.d/app.conf"
