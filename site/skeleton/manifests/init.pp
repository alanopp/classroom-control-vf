# skeleton/manifests/init.pp
class skeleton {
  file { '/etc/skel':
    ensure => 'directory',
    group  => 'root',
    mode   => '0755',
    owner  => 'root',
  }
  file {'/etc/skel/.bashrc':
    ensure => 'file'
    group   => 'root',
    mode    => '0644',
    owner   => 'root',
    type    => 'file',
    source  => 'puppet:///modules/skeleton/bashrc',
  }
}
