node 'test' {
  include corporativo
# include entorno::test
  class { 'entorno': value => "ei" }
  include base
}

node 'certif' {
  include corporativo
# include entorno::certif
  class { 'entorno': value => "qt" }
  include base
}

node 'prod' {
  include corporativo
# include entorno::prod
  class { 'entorno': value => "pr" }
  include base
}
