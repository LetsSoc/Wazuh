apt install gnupg -y
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -
echo "deb https://packages.wazuh.com/4.x/apt/ stable main" | tee -a /etc/apt/sources.list.d/wazuh.list
apt-get update
WAZUH_MANAGER="10.0.102.2" apt-get install wazuh-agent
systemctl daemon-reload
systemctl enable wazuh-agent
systemctl start wazuh-agent
sed -i "s/^deb/#deb/" /etc/apt/sources.list.d/wazuh.list
apt-get update
echo "wazuh-agent hold" | dpkg --set-selections
