class collectd::plugin::sensors (
  $sensorconfigfile = undef,
  $sensor           = undef,
  $ignoreselected   = undef,
  $ensure           = present
) {
  include collectd::params

  $conf_dir = $collectd::params::plugin_conf_dir

  file { 'sensors.conf':
    ensure  => $collectd::plugin::sensors::ensure,
    path    => "${conf_dir}/sensors.conf",
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('collectd/sensors.conf.erb'),
    notify  => Service['collectd']
  }
}
