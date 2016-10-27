# users/manifests/managed_user.pp
define users::managed_user (
  $group = $title,
) {
  user { $title:
    ensure     => present,
    managehome => true,
  }
  file { "/home/${title}":
    ensure => directory,
    owner => $title,
    group => $group,
  }
  file { "/home/${title}/.ssh":
    ensure => directory,
    owner => $title,
    mode  => '0700',
  }
   file { "/home/${title}/.bashrc":
    ensure => file,
    owner => $title,
    mode  => '0644',
   }
}
