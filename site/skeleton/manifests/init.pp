# /skeleton/manifests/init.pp
class skeleton {
  file { '/etc/skel/.bashrc':
    ensure => present,
    source  => 'puppet:///modules/skeleton/bashrc',
  }
}
