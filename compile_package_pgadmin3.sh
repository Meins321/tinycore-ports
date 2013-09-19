# Compilo

./configure --prefix=/usr/local
make -j3
make DESTDIR=/tmp/pgadmin3 install

# Preparo il file desktop

mkdir -p /tmp/pgadmin3/usr/local/share/applications
sed "s/usr/usr\/local/g" < pkg/pgadmin3.desktop > /tmp/pgadmin3/usr/local/share/applications/pgadmin3.desktop
mkdir -p /tmp/pgadmin3/usr/local/share/pixmaps/
cp pgadmin/include/images/pgAdmin3.png /tmp/pgadmin3/usr/local/share/pixmaps/
echo X-FullPathIcon=/usr/local/share/pixmaps/pgAdmin3.png >> /tmp/pgadmin3/usr/local/share/applications/pgadmin3.desktop

# Impacchetto

mksquashfs /tmp/pgadmin3 pgadmin3.tcz