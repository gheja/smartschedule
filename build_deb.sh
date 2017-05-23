#!/bin/bash

rm -rf ./build_deb

mkdir -p ./build_deb
mkdir -p ./build_deb/usr/sbin
mkdir -p ./build_deb/etc/cron.d

cp -xar ./src/DEBIAN ./build_deb/
cp -xar ./src/smartschedule ./build_deb/usr/sbin/
cp -xar ./src/crontab ./build_deb/etc/cron.d/smartschedule

version=`cat version`

if [ -e ".build_deb_version" ]; then
	debian_version=`cat .build_deb_version`
else
	debian_version=0
fi
debian_version=$((debian_version + 1))
echo $debian_version > .build_deb_version

cd ./build_deb

version="${version}-${debian_version}"

cat DEBIAN/control | sed -e "s/__VERSION__/$version/g" > DEBIAN/control.new
mv DEBIAN/control.new DEBIAN/control

# NOTE: will not handle filenames with spaces properly
find -type f | grep -vE "./DEBIAN" | sed -e 's,./,,' > DEBIAN/files
cat DEBIAN/files | xargs md5sum > DEBIAN/md5sums

# echo "etc/early-ssh/early-ssh.conf" > DEBIAN/conffiles
echo -n "" > DEBIAN/conffiles

# cat ../changelog > DEBIAN/changelog

chmod 755 DEBIAN
# chmod 644 DEBIAN/changelog
# chmod 644 DEBIAN/conffiles
chmod 644 DEBIAN/control
# chmod 644 DEBIAN/copyright
chmod 644 DEBIAN/files
chmod 644 DEBIAN/md5sums
# chmod 755 DEBIAN/postinst

fakeroot dpkg-deb --build ./ ../smartschedule_${version}.deb
