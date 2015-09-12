
class profile::spotify {

#apt::key { 'spotify':
  #id => 'BBEBDCB318AD50EC6865090613B00F1FD2C19886',
  #server => 'keyserver.ubuntu.com',
#}

apt::source { 'spotify':
  location => 'http://repository.spotify.com',
  release => 'stable',
  repos => 'non-free',
  #require => Apt::Key[spotify],
  key => 'BBEBDCB318AD50EC6865090613B00F1FD2C19886'
}

package { 'spotify-client':
  ensure => installed,
  require => Apt::Source['spotify'],
}

}
