class corporativo {
  file { '/tmp/corporativo':
    content=>"Hola estoy en un servidor corporativo"
  }
  file { '/etc/sysconfig/keyboard' :
    content => "KEYTABLE=\"es\"\nMODEL=\"pc105+inet\"\nLAYOUT=\"es\"\nKEYBOARDTYPE=\"pc\"\n",
  }
}