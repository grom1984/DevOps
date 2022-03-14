#!/bin/bash
yum -y update
yum -y install httpd

my_ip_addr=`curl http://169.254.169.254/latest/meta-data/local-ipv4`

cat <<EOF > /var/www/html/index.html
<html>
<body bgcolor="black">
<h2><font color="yellow">Build by Power of <font color="red">Terraform</font></h2><br><p>
<font color="white">Server PrivateIP:$my_ip_addr<br><br>
<font color="white">
<b>Copyright by Grikhanov Roman 2022</b>
</body>
</html>
EOF

service httpd start
chkconfig httpd on
