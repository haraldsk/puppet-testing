# Just for show
class testing::params {

  case $::osfamily {
    'Debian': { $package = 'testing-tools' }
    'RedHat': { $package = 'testing-suite' }
    default: { fail("${::osfamily} currently not supported")}
  }

}
