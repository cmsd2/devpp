
class profile::jessie {
  include profile::debian

  apt::source { 'jessie_backports':
    location => 'http://http.debian.net/debian',
    release => 'jessie-backports',
    repos => 'main',
  }
}

