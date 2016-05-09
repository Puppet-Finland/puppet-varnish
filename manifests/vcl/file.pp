define varnish::vcl::file($blocks = []) {
  file { $varnish::params::config_file:
    content => template('varnish/vcl.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Class['varnish::install'],
    notify  => Exec['vcl_reload'],
  }
}
