# users/examples/init.pp
class users {
  user { 'fundamentals':
    ensure => present,
  }
}
