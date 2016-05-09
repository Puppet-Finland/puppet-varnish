##
# Varnish backend decleration
##
define varnish::vcl::backend(
    $host,
    $port,
)
{
    Varnish::Vcl::File <| title == 'default.vcl' |> {
        blocks +> [template('varnish/vcl/backend.erb')],
    }
}
