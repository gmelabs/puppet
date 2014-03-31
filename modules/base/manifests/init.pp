class base{
  
  package { 'tomcat6':
    ensure => installed,
  }
  
  service { 'tomcat6':
    ensure => running,
    require => Package['tomcat6'],
  }
  
  package { 'git':
    ensure => installed,
  }
  
  file { '/tmp/helloworld.sh':
    source  => "puppet:///modules/base/helloworld.sh",
    mode    => "700",
    require => Service['tomcat6'],
  }
  
  exec { 'helloworld':
    command => '/bin/sh /tmp/helloworld.sh',
    require => File['/tmp/helloworld.sh']
  }
}