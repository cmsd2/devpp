
class profiles::jessie {
  include profiles::debian

  apt::source { 'jessie_backports':
    location => 'http://http.debian.net/debian',
    release => 'jessie-backports',
    repos => 'main',
  }
}

