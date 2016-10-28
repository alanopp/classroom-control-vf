# manifests/init.pp
class nginx (
  $package = $nginx::params::package,
  $owner = $nginx::params::owner,
  $group = $nginx::params::group,
  $docroot = $nginx::params::docroot,
  $confdir = $nginx::params::confdir,
  $logdir = $nginx::params::logdir,
  $user = $nginx::params::user,
  $port = $nginx::params::port
) inherits nginx::params {
  File {
    ensure => file,
    owner  => $owner,
    group  => $group,
    mode   => '0664',
  }

  package { $package:
    ensure => present,
  }
  
  file { [  "${docroot}/vhosts",, "${confdir}/conf.d"]:
    ensure => directory,
  }
  
  # manage the default docroot, index, and conf--replaces several resources
  nginx::vhost { 'default':
    docroot => $docroot,
    servername => $::fqdn,
  }
  
  file { "${confdir}/nginx.conf":
    ensure => file,
    content => epp('nginx/nginx.conf.epp',
            {
              user => $user,
              confdir => $confdir,
              logdir => $logdir,
            }),
    notify => Service['nginx'],
  }

  service { 'nginx':
    ensure => running,
    enable => true,
  }
}
