
class profile::iceweasel {

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

}
