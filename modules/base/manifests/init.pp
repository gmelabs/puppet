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
  
  file { '/tmp/nexus.properties':
    source  => "puppet:///modules/base/nexus.properties",
    mode    => "666",
    require => Service['tomcat6'],
  }
  
  file { '/tmp/helloworld.sh':
    source  => "puppet:///modules/base/helloworld.sh",
    mode    => "777",
    require => File['/tmp/nexus.properties'],
  }
  
  exec { 'helloworld':
    command => '/bin/sh /tmp/helloworld.sh',
    require => File['/tmp/helloworld.sh']
  }
}