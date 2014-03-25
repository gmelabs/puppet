class entorno ($value = 'ei') {
  
  file { '/etc/profile.d/entorno.sh':
    content => "export entorno=$value",
    mode => "644",
  }
  
  user { 'saux':
    ensure => present,
  }
  
  file { '/tmp/date.sh':
    source => "puppet:///modules/entorno/date.sh",
    mode => "777",
  }
  
  cron { 'date_cron':
    command => "sh /tmp/date.sh",
    minute => "*/2",
    user => "vagrant",
    
  }
}
  
