# set an option
define testing::option (
  $ensure = present,
  $value  = false,
) {

  if $value and $ensure == 'present' {
    file { "/etc/testing/conf.d/${name}.conf":
      ensure  => present,
      content => "${name} = ${value}\n",
    }
  } else {
    file { "/etc/testing/conf.d/${name}.conf":
      ensure  => absent,
    }
  }

}
