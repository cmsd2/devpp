class profiles::rust {

  apt::source { 'hans_jorgen_hoel_rust_ppa':
    location => 'http://ppa.launchpad.net/hansjorg/rust/ubuntu/',
    release => 'vivid',
    repos => 'main',
    key => 'c03264cd6cadc10bfd6e708b37fd5e80bd6b6386',
  }

  package { 'rust-nightly':
    ensure => latest,
    require => [
      Class['apt::update'],
      Apt::Source['hans_jorgen_hoel_rust_ppa'],
    ]
  }

  package { 'cargo-nightly':
    ensure => latest,
    require => [
      Class['apt::update'],
      Apt::Source['hans_jorgen_hoel_rust_ppa'],
    ]
  }

}
