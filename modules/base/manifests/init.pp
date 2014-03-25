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

}