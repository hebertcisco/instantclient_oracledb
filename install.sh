mkdir -p /opt/oracle
cd /opt/oracle
wget https://download.oracle.com/otn_software/linux/instantclient/instantclient-basic-linuxx64.zip
unzip instantclient-basic-linuxx64.zip

sudo sh -c "echo /opt/oracle/instantclient_19_6 > /etc/ld.so.conf.d/oracle-instantclient.conf"
sudo ldconfig

cd /opt/oracle/instantclient_12_2
ln -s libclntsh.so.12.1 libclntsh.so
ln -s libocci.so.12.1 libocci.so

sudo sh -c "echo /opt/oracle/instantclient_19_3 > \
      /etc/ld.so.conf.d/oracle-instantclient.conf"
  sudo ldconfig
  export LD_LIBRARY_PATH=/opt/oracle/instantclient_19_3:$LD_LIBRARY_PATH

mkdir -p /opt/oracle/instantclient_12_2/network/admin

export PATH=/opt/oracle/instantclient_19_3:$PATH

sudo sh -c "echo /usr/lib/oracle/18.3/client64/lib > \
      /etc/ld.so.conf.d/oracle-instantclient.conf"
  sudo ldconfig
