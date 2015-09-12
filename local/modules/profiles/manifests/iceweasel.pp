
class profiles::iceweasel {
  
  apt::pin { 'iceweasel_aurora':
    packages => 'iceweasel',
    release => 'experimental',
    priority => '990',
  }

  package { 'pkg-mozilla-archive-keyring':
  }

  apt::source { 'iceweasel_aurora':
    location => 'http://mozilla.debian.net',
    release => 'experimental',
    repos => 'iceweasel-aurora',
    require => [
      Package['pkg-mozilla-archive-keyring'],
    ],
  }

  package { 'iceweasel':
    ensure => 'latest',
    require => [
      Class['apt::update'],
      Apt::Source['iceweasel_aurora'],
      Apt::Pin['iceweasel_aurora'],
    ]
  }

}
