# == Class: testing
#
# Testing
#
class testing (
  $service_ensure = 'running',
  $service_enable = true,
) {

  include testing::params

  package { $params::package:
    ensure => installed,
  }

  # stdlib
  validate_re($service_ensure, '(running|stopped)')

  service {
    'testing_service':
      ensure => $service_ensure,
      enable => $service_enable,
  }

}
