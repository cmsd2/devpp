class profile::rust {

#apt::key { 'Hans Jorgen Hoel':
  #id => 'c03264cd6cadc10bfd6e708b37fd5e80bd6b6386',
  #server => 'pgp.mit.edu',
#}

apt::source { 'hans_jorgen_hoel_rust_ppa':
  location => 'http://ppa.launchpad.net/hansjorg/rust/ubuntu/',
  release => 'vivid',
  repos => 'main',
  key => 'c03264cd6cadc10bfd6e708b37fd5e80bd6b6386',
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

}
