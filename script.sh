#! /bin/bash
wget -N --no-check-certificate https://github.com/91yun/serverspeeder/raw/master/serverspeeder-v.sh  
source ./serverspeeder-v.sh Debian 7 4.1.0-x86_64-linode59 x64 3.10.66.25 serverspeeder_2845 
wget --no-check-certificate -O ./kcptun_for_ss_ssr-install.sh https://raw.githubusercontent.com/onekeyshell/kcptun_for_ss_ssr/master/kcptun_for_ss_ssr-install.sh
chmod 700 ./kcptun_for_ss_ssr-install.sh
./kcptun_for_ss_ssr-install.sh install
iptables -A OUTPUT -m string --string "HELO" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -m string --string "SMTP" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -m string --string "Subject" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -m string --string "protocol" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -m string --string "find_node" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -m string --string "get_peers" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -m string --string "info_hash" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -m string --string "announce" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -m string --string "peer_id=" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -m string --string "tracker" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -m string --string "torrent" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -m string --string "BitTorrent" --algo bm --to 65535 -j DROP
iptables -A OUTPUT -m string --hex-string "|13426974546f7272656e742070726f746f636f6c|" --algo bm --to 65535 -j DROP

iptables -A OUTPUT -p tcp -m multiport --sports 24,25,50,57,105,106,109,110,143,158,209,218,220,465,587 -m state --state NEW,ESTABLISHED -j REJECT --reject-with tcp-reset
iptables -A OUTPUT -p tcp -m multiport --sports 993,995,1109,24554,60177,60179 -m state --state NEW,ESTABLISHED -j REJECT --reject-with tcp-reset

iptables -L
