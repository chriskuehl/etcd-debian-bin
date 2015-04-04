etcd-debian-bin
========

This is a small repository containing the minimal setup necessary to build
binary-only packages of [etcd][etcd] for Debian.

The packages install `etcd` and `etcdctl` under `/usr/bin`, but do not do many
of the other things you might expect (such as installing services, creating
users, etc.).

The package does not follow Debian best practices at all; it includes verbatim
the upstream binaries of `etcd`, lacks important information, scripts, and
violates many Debian policies.

You might instead be interested in the [official etcd
packages][official-packages] which Debian has started packaging. They're
currently fairly outdated, though, which is the main motivation behind this
repo.

## Building the `.deb` package

1. Clone the repository
2. Run `make build`. This will produce a `etcd-debian.deb` file in the current
   directory.

## Making changes
### Updating for newer `etcd` versions

1. Change the URL of the new release in the Makefile.
2. Under `DEBIAN/control`, update the package version.

### Updating package versions

If you make a change to the package, you should change the package version.
Versions are of the format `${upstream_version}kl${package_version}`.

You should only increment the number after the `kl`, unless you're packaging a
new upstream version (in which case you should start the suffix number at `1`
again).

If you fork this repo, you should probably change the `kl` to something else
when making your own packages.

[etcd]: https://github.com/coreos/etcd
[official-packages]: https://packages.debian.org/source/sid/golang-etcd
