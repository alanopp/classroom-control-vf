# profile/manifests/capstone.pp
class profile::capstone {
  include apache
  include wordpress
  include mysql::server
}
