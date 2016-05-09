# Define a VCL from a Puppet template
# and load the VCL
#
# If the VCL fails to parse, the exec will fail
# and Varnish will continue to run with the old config
define varnish::vcl (
  $file = $title,
) 
{

    include varnish
    include varnish::params

    varnish::vcl::file {$title:
        blocks => [],
    }
}
