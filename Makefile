RELEASE = https://github.com/coreos/etcd/releases/download/v2.0.8/etcd-v2.0.8-linux-amd64.tar.gz

etcd-debian/usr/bin/:
	mkdir -p tmp etcd-debian/usr/bin/
	curl -L "$(RELEASE)" | tar -xzf - -C tmp --strip-components 1
	mv tmp/etcd tmp/etcdctl etcd-debian/usr/bin/

build: etcd-debian/usr/bin/
	fakeroot dpkg-deb --build etcd-debian
