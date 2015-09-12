case $lsbdistid {
  'Debian': { include profile::debian }
}

case $lsbdistcodename {
  'jessie': { include profile::jessie }
}

$pkgs = [
  build-essential,
  vim,
  emacs,
  sudo,
  git,
  autoconf,
  htop,
  curl,
  golang,
  cmake,
  'docker.io',
]

package { $pkgs:
  ensure => latest
}

include profile::java
include profile::spotify
include profile::iceweasel
include profile::rust

