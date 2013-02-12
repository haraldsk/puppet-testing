# Just for show
class testing::params {

  case $::osfamily {
    'Debian': { $package = 'testing-tools' }
    'RedHat': { $package = 'testing-suite' }
    default:  { fail("Osfamily: ${::osfamily} currently not supported") }
  }

}
