case $lsbdistid {
  'Debian': { include profiles::debian }
}

case $lsbdistcodename {
  'jessie': { include profiles::jessie }
  'stretch': { 
    include profiles::stretch
    include profiles::iceweasel 
  }
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

include profiles::java
include profiles::spotify
include profiles::rust



