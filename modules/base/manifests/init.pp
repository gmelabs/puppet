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
  
  file { '/tmp/helloworld.sh':
    source  => "puppet:///modules/base/helloworld.sh",
    mode    => "777",
    require => Service['tomcat6'],
  }
  
  exec { 'helloworld':
    command => '/bin/sh /tmp/helloworld.sh',
    require => File['/tmp/helloworld.sh']
  }
}