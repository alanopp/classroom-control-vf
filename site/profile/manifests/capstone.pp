# profile/manifests/capstone.pp
class profile::cpastone {
  include apache
  include wordpress
  include mysql
}
