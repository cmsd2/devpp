
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
  openjdk-8-jdk,
  maven,
  cmake,
  'docker.io',
]

package { $pkgs:
  ensure => latest
}

#not supported on stretch
#class { 'java':
  #version => 'latest',
#}

$wanted_java_version = 'java-1.8.0-openjdk-amd64'
$wanted_java_home = '/usr/lib/jvm/java-8-openjdk-amd64'

exec { "/usr/sbin/update-java-alternatives -s $wanted_java_version":
  require => Package['openjdk-8-jdk'],
  unless => "/usr/bin/test $(readlink /etc/alternatives/java) = '${wanted_java_home}/jre/bin/java'",
}

class { 'apt':
  update => {
    frequency => 'daily',
  },
}

apt::key { 'Hans Jorgen Hoel':
  id => 'c03264cd6cadc10bfd6e708b37fd5e80bd6b6386',
  server => 'pgp.mit.edu',
}

apt::source { 'hans_jorgen_hoel_rust_ppa':
  location => 'http://ppa.launchpad.net/hansjorg/rust/ubuntu/',
  release => 'vivid',
  repos => 'main',
  key => {
    id => 'c03264cd6cadc10bfd6e708b37fd5e80bd6b6386',
    server => 'pgp.mit.edu',
  },
}

apt::key { 'spotify':
  id => 'BBEBDCB318AD50EC6865090613B00F1FD2C19886',
  server => 'keyserver.ubuntu.com',
}

apt::source { 'spotify':
  location => 'http://repository.spotify.com',
  release => 'stable',
  repos => 'non-free',
  require => Apt::Key[spotify],
}

package { 'spotify-client':
  ensure => installed,
  require => Apt::Source['spotify'],
}

file { '/etc/apt/preferences.d/iceweasel_aurora':
  content => "
Package: iceweasel
Pin: release a=experimental
Pin-Priority: 990
"
}

package { 'pkg-mozilla-archive-keyring':
}

apt::source { 'iceweasel_aurora':
  location => 'http://mozilla.debian.net',
  release => 'experimental',
  repos => 'iceweasel-aurora',
  require => [
    Package['pkg-mozilla-archive-keyring'],
  ]
}

package { 'iceweasel':
  ensure => 'latest',
  require => [
    Apt::Source['iceweasel_aurora'],
    File['/etc/apt/preferences.d/iceweasel_aurora'],
  ],
}

package { 'rust-nightly':
  ensure => installed,
  require => [
    Apt::Source['hans_jorgen_hoel_rust_ppa']
  ],
}

package { 'cargo-nightly':
  ensure => installed,
  require => [
    Apt::Source['hans_jorgen_hoel_rust_ppa']
  ],
}

