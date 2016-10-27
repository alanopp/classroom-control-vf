class users::admins {
  users::managed_user { 'jose':
    group => 'admin',
  }
  users::managed_user { 'alice':
    group => 'dev',
  }
  users::managed_user { 'chen':
    group => 'dev',
  }
  group { 'dev':
    ensure => present,
  }
}
