class base{
  
  service {'iptables':
    ensure =>stopped;
  }
  
  package { 'tomcat6':
    ensure => installed,
    require => Service['iptables'],
  }
  
  service { 'tomcat6':
    ensure => running,
    require => Package['tomcat6'],
  }
    
  package {'java-1.7.0-openjdk-devel':
    ensure => installed,
  }  
  
  package { 'git':
    ensure => installed,
  }
  
  file { 'nexus.properties':
    ensure  => file,
    path    => '/tmp/nexus.properties',
    source  => "puppet:///modules/base/nexus.properties",
    mode    => '0666',
    require => Service['tomcat6'],
  }
  
  file { 'helloworld':
    ensure  => file,
    path    => '/tmp/helloworld.sh',
    source  => "puppet:///modules/base/helloworld.sh",
    mode    => '0777',
    require => File['nexus.properties'],
  }
  
  exec { 'deployapp':
    command => '/bin/sh /tmp/helloworld.sh',
    require => File['helloworld', 'nexus.properties'],
    #subscribe => File['nexus.properties'],
  }
}
