##
# VCL config file
#
# Use overrides to add custom configuration blocks.
# e.g.
# Varnish:Vcl:File <|  tile == ... |>  {
#   vcl_recv +> "your configuration here;", 
# }
##
define varnish::vcl::file(
  $blocks = [],
  $vcl_recv = [],
  $vcl_backend_fetch = [],
  $vcl_backend_response = [],
  $vcl_deliver = [],
) {
  file { $varnish::params::config_file:
    content => template('varnish/vcl.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Class['varnish::install'],
    notify  => Exec['vcl_reload'],
  }
}
