class profile::java {

$java_packages = [
  openjdk-8-jdk,
  maven,
]

package { $java_packages:
  ensure => latest,
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

}
