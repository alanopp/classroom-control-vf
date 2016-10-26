# /skeleton/manifests/init.pp
class skeleton {
  file { '/etc/skel/.bashrc':
    ensure => file,
    source  => 'puppet:///modules/skeleton/bashrc',
  }
}
