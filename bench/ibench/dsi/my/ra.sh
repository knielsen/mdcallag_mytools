mbd=$1
dev=$2

ips="100 100 200 200 400 400 600 600 800 800 1000 1000"

ns=300
bash ra1.sh   10000000   10m 10 $ns $mbd $dev $ips

ns=1800
bash ra1.sh   80000000   80m 10 $ns $mbd $dev $ips
bash ra2.sh  800000000  800m 10 $ns $mbd $dev $ips

